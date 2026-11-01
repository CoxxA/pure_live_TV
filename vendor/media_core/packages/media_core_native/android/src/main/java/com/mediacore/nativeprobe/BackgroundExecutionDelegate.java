package com.mediacore.nativeprobe;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * Dart side of {@link BackgroundExecutionService}.
 *
 * Wire protocol (see {@code BackgroundExecution} on the Dart side, which is the
 * source of truth):
 *
 * | direction | method | arguments | result |
 * |---|---|---|---|
 * | Dart → host | {@code acquire} | {notification, wakeLock} | session id, or null when the platform refused |
 * | Dart → host | {@code update} | {id, notification} | – |
 * | Dart → host | {@code release} | {id} | – |
 *
 * <p>{@code notification} is the map `BackgroundExecution.encodeNotification`
 * builds: title, text, kind, icon and an optional progress map that says which
 * of the two shapes it is. None of it is defaulted here beyond a placeholder
 * title — the words and the icon are the host's.
 *
 * <p>No {@code isSupported} call: the platform name is known in Dart, and a
 * round trip to answer "am I Android" would only be a way to disagree with it.
 *
 * <p><strong>The notification permission is asked for here.</strong> From API 33
 * a foreground service posts its notification only with
 * {@code POST_NOTIFICATIONS}, and the plugin declares it in its manifest; asking
 * is the step that was missing, and without it the service runs, the wake lock
 * holds, and the user sees nothing at all. The question is asked while an
 * activity is attached and the {@code acquire} answer waits for it, so Dart does
 * not have to know the platform asked. A refusal is not an error: the session is
 * still started, because the wake lock is what keeps the job alive — only the
 * notification stays hidden.
 *
 * <p>A refused acquire is answered with null rather than an error for the same
 * reason: the caller runs the job unprotected, which is better than failing a
 * recording because the platform would not take the service.
 */
final class BackgroundExecutionDelegate implements MethodChannel.MethodCallHandler {

  /** Channel name; kept in sync with the Dart side. */
  static final String CHANNEL_NAME = "media_core_native/background";

  /** Request code for the notification dialog. Ours alone: nothing else asks. */
  private static final int REQUEST_NOTIFICATIONS = 0x4D31;

  private static final String PERMISSION_NOTIFICATIONS = Manifest.permission.POST_NOTIFICATIONS;

  private final Context context;

  /** The activity to ask from, while one is attached. */
  private Activity activity;

  /** The acquire waiting for the user to answer the dialog, if one is. */
  private MethodChannel.Result pendingResult;
  private BackgroundExecutionService.Description pendingDescription;
  private boolean pendingWakeLock;

  BackgroundExecutionDelegate(Context context) {
    this.context = context;
  }

  /**
   * Follows the activity this plugin is attached to.
   *
   * A missing activity is not a failure: it only means the permission cannot be
   * asked for right now, so an acquire that was waiting on the dialog is
   * answered by starting the session anyway.
   */
  void setActivity(Activity activity) {
    this.activity = activity;

    if (activity == null) {
      finishPending();
    }
  }

  @Override
  public void onMethodCall(MethodCall call, MethodChannel.Result result) {
    switch (call.method) {
      case "acquire":
        acquire(call, result);
        break;

      case "update":
        update(call);

        result.success(null);
        break;

      case "release":
        final Integer id = call.argument("id");

        if (id != null && id >= 0) {
          BackgroundExecutionService.stop(id);
        }

        result.success(null);
        break;

      default:
        result.notImplemented();
    }
  }

  /** Answers {@link #REQUEST_NOTIFICATIONS}; returns whether it was ours. */
  boolean onPermissionResult(int requestCode) {
    if (requestCode != REQUEST_NOTIFICATIONS) {
      return false;
    }

    finishPending();

    return true;
  }

  private void acquire(MethodCall call, MethodChannel.Result result) {
    final BackgroundExecutionService.Description description = descriptionOf(call);
    final boolean wakeLock = Boolean.TRUE.equals(call.argument("wakeLock"));

    if (needsNotificationPermission()) {
      pendingResult = result;
      pendingDescription = description;
      pendingWakeLock = wakeLock;

      activity.requestPermissions(new String[] {PERMISSION_NOTIFICATIONS}, REQUEST_NOTIFICATIONS);

      // Answered from onPermissionResult, or from setActivity(null) if the
      // activity goes away while the dialog is open.
      return;
    }

    result.success(start(description, wakeLock));
  }

  /** Replaces what a running session's notification says. */
  private void update(MethodCall call) {
    final Integer id = call.argument("id");

    if (id == null || id < 0) {
      return;
    }

    BackgroundExecutionService.update(id, descriptionOf(call));
  }

  /** Starts the session the pending acquire asked for, and answers it. */
  private void finishPending() {
    final MethodChannel.Result result = pendingResult;

    if (result == null) {
      return;
    }

    pendingResult = null;

    result.success(start(pendingDescription, pendingWakeLock));

    pendingDescription = null;
    pendingWakeLock = false;
  }

  private Integer start(BackgroundExecutionService.Description description, boolean wakeLock) {
    final int sessionId = BackgroundExecutionService.start(context, description, wakeLock);

    return sessionId < 0 ? null : sessionId;
  }

  /**
   * Reads the notification description out of a call.
   *
   * A missing or malformed map yields a plain "Running" — the platform still
   * needs a notification, and refusing to start a job over a bad title would
   * fail the work for the label on it.
   */
  private BackgroundExecutionService.Description descriptionOf(MethodCall call) {
    final Object encoded = call.argument("notification");

    if (!(encoded instanceof Map)) {
      return new BackgroundExecutionService.Description(
          null, null, null, null, BackgroundExecutionService.Description.PROGRESS_NONE, 0, 0);
    }

    final Map<?, ?> notification = (Map<?, ?>) encoded;
    final Object progress = notification.get("progress");

    int state = BackgroundExecutionService.Description.PROGRESS_NONE;
    int current = 0;
    int total = 0;

    if (progress instanceof Map) {
      final Map<?, ?> values = (Map<?, ?>) progress;

      if (Boolean.TRUE.equals(values.get("indeterminate"))) {
        state = BackgroundExecutionService.Description.PROGRESS_INDETERMINATE;
      } else {
        state = BackgroundExecutionService.Description.PROGRESS_DETERMINATE;
        current = intValue(values.get("current"));
        total = intValue(values.get("total"));
      }
    }

    return new BackgroundExecutionService.Description(
        stringValue(notification.get("title")),
        stringValue(notification.get("text")),
        stringValue(notification.get("kind")),
        stringValue(notification.get("icon")),
        state,
        current,
        total);
  }

  private static String stringValue(Object value) {
    return value instanceof String ? (String) value : null;
  }

  private static int intValue(Object value) {
    return value instanceof Integer ? (Integer) value : 0;
  }

  /**
   * Whether the dialog has to be shown before the service starts.
   *
   * Only from API 33, only with an activity to ask from, and only when no
   * acquire is already waiting on the dialog — a second job asking while the
   * user is deciding starts immediately rather than queueing behind a question
   * that is already on screen.
   */
  private boolean needsNotificationPermission() {
    return Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU
        && activity != null
        && pendingResult == null
        && context.checkSelfPermission(PERMISSION_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED;
  }
}
