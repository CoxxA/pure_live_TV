package com.mediacore.nativeprobe;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.os.IBinder;
import android.os.PowerManager;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Keeps long-running jobs alive while the app is in the background.
 *
 * A foreground service is the platform's own mechanism for "the user knows this
 * is running": the process is not frozen with the screen off, and the
 * notification is what tells the user why. Two things are held here together:
 *
 * <ul>
 *   <li>the service itself, typed {@code dataSync} on API 34+ (a download or a
 *       recording is data transfer, not media playback);
 *   <li>a {@link PowerManager#PARTIAL_WAKE_LOCK}, so the CPU keeps running after
 *       the screen goes off — a phone or a TV box that suspends the CPU would
 *       otherwise stall the writer mid-segment.
 * </ul>
 *
 * <p><strong>One service, one notification, several sessions.</strong> A
 * foreground service is per-service, not per-job, so two jobs (a recording and a
 * download) share this instance. They are tracked in a register: the
 * notification describes the newest session and says how many others are
 * running, and a job that ends removes only itself. Stopping the service on the
 * first release would silently take the protection away from a job that is still
 * running, and dropping the wake lock with it would let the device sleep
 * mid-recording — so the lock is released only once no remaining session wants
 * it. The newest session is also the one whose title, icon and progress the
 * notification shows; an older job updates its own description without taking
 * the notification over from a job the user started later.
 *
 * <p>Declared in this plugin's own manifest, which the app inherits — a plain
 * {@code <service>} merges from a library manifest, unlike audio_service's
 * activity replacement, so the host does not have to copy anything. The
 * notification permission is asked for by {@link BackgroundExecutionDelegate}
 * while an activity is attached.
 */
public final class BackgroundExecutionService extends Service {

  /** Notification channel every session uses. */
  static final String CHANNEL_ID = "media_core.background";

  /** Extras the service is started with. */
  static final String EXTRA_TITLE = "title";
  static final String EXTRA_TEXT = "text";
  static final String EXTRA_SESSION_ID = "sessionId";
  static final String EXTRA_WAKE_LOCK = "wakeLock";
  static final String EXTRA_KIND = "kind";
  static final String EXTRA_ICON = "icon";
  static final String EXTRA_PROGRESS_STATE = "progressState";
  static final String EXTRA_PROGRESS_CURRENT = "progressCurrent";
  static final String EXTRA_PROGRESS_TOTAL = "progressTotal";

  /**
   * Notification id.
   *
   * A constant rather than the session id: the platform associates one
   * notification with the foreground service, and a per-session id would leave
   * the previous session's notification behind as an orphan the user cannot
   * dismiss.
   */
  private static final int NOTIFICATION_ID = 0x4D43;

  /** Session ids, unique per process. */
  private static final AtomicInteger NEXT_SESSION_ID = new AtomicInteger(1);

  /**
   * Running sessions, oldest first.
   *
   * Static because the sessions belong to the process rather than to an
   * instance: a service the platform recreated must not forget what is still
   * running.
   */
  private static final Map<Integer, Session> SESSIONS = new LinkedHashMap<Integer, Session>();

  /** The process's single instance, while it is alive. */
  private static BackgroundExecutionService instance;

  /**
   * What the host asked the notification to say.
   *
   * Every field comes from Dart and none of them is invented here: the library
   * knows what a notification is, not what this job is called.
   */
  static final class Description {
    /** Nothing to draw. */
    static final int PROGRESS_NONE = 0;

    /** A spinner: the job is running, its end is unknown. */
    static final int PROGRESS_INDETERMINATE = 1;

    /** A bar: a known amount of a known total. */
    static final int PROGRESS_DETERMINATE = 2;

    final String title;
    final String text;
    final String kind;
    final String icon;
    final int progressState;
    final int progressCurrent;
    final int progressTotal;

    Description(
        String title,
        String text,
        String kind,
        String icon,
        int progressState,
        int progressCurrent,
        int progressTotal) {
      this.title = title == null || title.isEmpty() ? "Running" : title;
      this.text = text;
      this.kind = kind;
      this.icon = icon;
      // A bar needs a positive total to mean anything; anything else is the
      // spinner, which is what "running, length unknown" honestly looks like.
      final boolean bar = progressState == PROGRESS_DETERMINATE && progressTotal > 0;

      this.progressState = bar ? PROGRESS_DETERMINATE : progressState == PROGRESS_NONE ? PROGRESS_NONE : PROGRESS_INDETERMINATE;
      this.progressTotal = bar ? progressTotal : 0;
      this.progressCurrent = bar ? Math.max(0, Math.min(progressCurrent, progressTotal)) : 0;
    }

    /** Whether a bar or a spinner belongs in the notification. */
    boolean hasProgress() {
      return progressState != PROGRESS_NONE;
    }

    /** Whether the end of the job is known. */
    boolean isDeterminate() {
      return progressState == PROGRESS_DETERMINATE;
    }
  }

  /** One job that asked not to be frozen. */
  private static final class Session {
    final int id;
    final Description description;
    final boolean wakeLock;

    Session(int id, Description description, boolean wakeLock) {
      this.id = id;
      this.description = description;
      this.wakeLock = wakeLock;
    }
  }

  /** Counter handed to whoever asked for a session. */
  static int nextSessionId() {
    return NEXT_SESSION_ID.getAndIncrement();
  }

  /**
   * Starts a session.
   *
   * Returns the session id, or -1 when the platform refuses to run the service
   * at all (a restricted background launch, a missing declaration) — the caller
   * then runs the job unprotected instead of failing it. A refused
   * <em>notification</em> is not that case: the service still runs and the wake
   * lock still holds, only the notification is hidden.
   */
  static int start(Context context, Description description, boolean wakeLock) {
    final int sessionId = nextSessionId();

    final Intent intent = new Intent(context, BackgroundExecutionService.class);

    putDescription(intent, description);

    intent.putExtra(EXTRA_SESSION_ID, sessionId).putExtra(EXTRA_WAKE_LOCK, wakeLock);

    try {
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
        context.startForegroundService(intent);
      } else {
        context.startService(intent);
      }
    } catch (Throwable error) {
      // A platform that refuses to start it means "no protection", not "the job
      // failed". Nothing was registered, so there is nothing to release.
      return -1;
    }

    return sessionId;
  }

  /**
   * Replaces what a running session's notification says.
   *
   * A no-op for a session that is gone: the notification went with it, and a job
   * that finishes while an update is in flight must not resurrect one.
   */
  static void update(int sessionId, Description description) {
    final BackgroundExecutionService service = instance;

    if (service != null) {
      service.updateSession(sessionId, description);
    }
  }

  /**
   * Ends the session with {@code sessionId}, leaving every other session alone.
   *
   * A no-op when the service is already gone: the sessions went with it.
   */
  static void stop(int sessionId) {
    final BackgroundExecutionService service = instance;

    if (service != null) {
      service.releaseSession(sessionId);
    }
  }

  private static void putDescription(Intent intent, Description description) {
    intent
        .putExtra(EXTRA_TITLE, description.title)
        .putExtra(EXTRA_TEXT, description.text)
        .putExtra(EXTRA_KIND, description.kind)
        .putExtra(EXTRA_ICON, description.icon)
        .putExtra(EXTRA_PROGRESS_STATE, description.progressState)
        .putExtra(EXTRA_PROGRESS_CURRENT, description.progressCurrent)
        .putExtra(EXTRA_PROGRESS_TOTAL, description.progressTotal);
  }

  /**
   * Reads a description back out of the Intent.
   *
   * The Intent is the durable half: extras survive a service the platform
   * recreated, which is why the description travels with it rather than through
   * a field of this instance.
   */
  private static Description readDescription(Intent intent) {
    if (intent == null) {
      return new Description(null, null, null, null, Description.PROGRESS_NONE, 0, 0);
    }

    return new Description(
        intent.getStringExtra(EXTRA_TITLE),
        intent.getStringExtra(EXTRA_TEXT),
        intent.getStringExtra(EXTRA_KIND),
        intent.getStringExtra(EXTRA_ICON),
        intent.getIntExtra(EXTRA_PROGRESS_STATE, Description.PROGRESS_NONE),
        intent.getIntExtra(EXTRA_PROGRESS_CURRENT, 0),
        intent.getIntExtra(EXTRA_PROGRESS_TOTAL, 0));
  }

  private PowerManager.WakeLock wakeLock;

  @Override
  public void onCreate() {
    super.onCreate();

    instance = this;
  }

  @Override
  public int onStartCommand(Intent intent, int flags, int startId) {
    final int sessionId = intent == null ? -1 : intent.getIntExtra(EXTRA_SESSION_ID, -1);

    if (sessionId < 0) {
      stopSelf(startId);

      return START_NOT_STICKY;
    }

    final boolean wakeLock = intent.getBooleanExtra(EXTRA_WAKE_LOCK, false);
    final Session session = new Session(sessionId, readDescription(intent), wakeLock);

    SESSIONS.put(sessionId, session);

    startForegroundInternal(startId);

    if (session.wakeLock) {
      acquireWakeLock();
    }

    // Not sticky: resuming a recording after the process was killed would write
    // a second stream into the same directory without the user asking.
    return START_NOT_STICKY;
  }

  @Override
  public void onDestroy() {
    releaseWakeLock();

    SESSIONS.clear();

    if (instance == this) {
      instance = null;
    }

    super.onDestroy();
  }

  @Override
  public IBinder onBind(Intent intent) {
    return null;
  }

  /**
   * Android 15 caps {@code dataSync} foreground services at six hours a day.
   *
   * When the cap is reached the platform calls this and the service has to stop.
   * Stopping here is what keeps the process from being killed for not
   * responding; the job itself keeps running (it is the app's own process), just
   * without the protection — which is what the recording module documents.
   */
  @Override
  public void onTimeout(int startId, int foregroundServiceType) {
    stopForegroundAndSelf();
  }

  // ---------------------------------------------------------------------------
  // Sessions
  // ---------------------------------------------------------------------------

  private void updateSession(int sessionId, Description description) {
    final Session session = SESSIONS.get(sessionId);

    if (session == null) {
      return;
    }

    // Replacement keeps the register's order, so an update never decides which
    // job owns the notification.
    SESSIONS.put(sessionId, new Session(sessionId, description, session.wakeLock));

    updateNotification();
  }

  private void releaseSession(int sessionId) {
    if (SESSIONS.remove(sessionId) == null) {
      return;
    }

    if (SESSIONS.isEmpty()) {
      releaseWakeLock();
      stopForegroundAndSelf();

      return;
    }

    // Other jobs are still running: keep the service, but stop holding the CPU
    // for a job that no longer needs it.
    if (!anySessionWantsWakeLock()) {
      releaseWakeLock();
    }

    updateNotification();
  }

  /** The session the notification describes: the one that started last. */
  private Session newestSession() {
    Session newest = null;

    for (Session session : SESSIONS.values()) {
      newest = session;
    }

    return newest;
  }

  private boolean anySessionWantsWakeLock() {
    for (Session session : SESSIONS.values()) {
      if (session.wakeLock) {
        return true;
      }
    }

    return false;
  }

  // The boolean form is the API < 24 branch.
  @SuppressWarnings("deprecation")
  private void stopForegroundAndSelf() {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
      stopForeground(STOP_FOREGROUND_REMOVE);
    } else {
      stopForeground(true);
    }

    stopSelf();
  }

  // ---------------------------------------------------------------------------
  // Foreground notification
  // ---------------------------------------------------------------------------

  private void startForegroundInternal(int startId) {
    createChannel();

    final Notification notification = buildNotification();

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
      startForeground(NOTIFICATION_ID, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC);

      return;
    }

    startForeground(NOTIFICATION_ID, notification);
  }

  /** Reposts the notification after a session ended, without re-alerting. */
  private void updateNotification() {
    final NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

    if (manager != null) {
      manager.notify(NOTIFICATION_ID, buildNotification());
    }
  }

  private void createChannel() {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
      return;
    }

    final NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

    if (manager == null) {
      return;
    }

    final NotificationChannel channel =
        new NotificationChannel(CHANNEL_ID, "Background tasks", NotificationManager.IMPORTANCE_LOW);

    // Silence and no badge: work the user started, not news.
    channel.setShowBadge(false);

    manager.createNotificationChannel(channel);
  }

  // The one-argument Builder is the API < 26 branch; the channel id is the only
  // way to build one from 26 on.
  @SuppressWarnings("deprecation")
  private Notification buildNotification() {
    final Session visible = newestSession();
    final Description description =
        visible == null
            ? new Description(null, null, null, null, Description.PROGRESS_NONE, 0, 0)
            : visible.description;

    final Notification.Builder builder =
        Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
            ? new Notification.Builder(this, CHANNEL_ID)
            : new Notification.Builder(this);

    final Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());

    if (launch != null) {
      launch.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);

      final PendingIntent pending =
          PendingIntent.getActivity(
              this, 0, launch, PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);

      builder.setContentIntent(pending);
    }

    final String text = description.text;
    final String others = count(SESSIONS.size() - 1);

    builder
        .setContentTitle(description.title)
        .setContentText(
            text == null || text.isEmpty() ? others : others.isEmpty() ? text : text + "  (" + others + ")")
        .setOngoing(true)
        .setOnlyAlertOnce(true)
        .setShowWhen(false)
        .setSmallIcon(notificationIcon(description));

    if (description.hasProgress()) {
      // The two shapes the platform draws: a filled bar with a known total, and
      // a spinner with no numbers at all.
      builder.setProgress(description.progressTotal, description.progressCurrent, !description.isDeterminate());
    }

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
      // Show it now rather than after the platform's grace period for a service
      // started from the background: a notification that appears ten seconds
      // late reads as "there is none".
      builder.setForegroundServiceBehavior(Notification.FOREGROUND_SERVICE_IMMEDIATE);
    }

    return builder.build();
  }

  /** "+2" for the other running jobs, or empty when this is the only one. */
  private static String count(int others) {
    return others <= 0 ? "" : "+" + others;
  }

  /**
   * Icon of the notification.
   *
   * The host's own drawable when it named one (the convention the media
   * notification uses too), otherwise the glyph shipped with this plugin for the
   * job's kind — borrowing a system drawable would show a download arrow on a
   * recording. A name that does not resolve falls back to that glyph rather than
   * leaving the notification without an icon, which the platform refuses to post
   * at all.
   */
  private int notificationIcon(Description description) {
    final int named = resolveIcon(description.icon);

    if (named != 0) {
      return named;
    }

    if ("record".equals(description.kind)) {
      return R.drawable.ic_stat_media_core_record;
    }

    if ("download".equals(description.kind)) {
      return R.drawable.ic_stat_media_core_download;
    }

    return R.drawable.ic_stat_media_core_task;
  }

  /**
   * Looks a host icon up by name.
   *
   * A bare name is tried as a drawable and then as a mipmap, and a full
   * {@code @drawable/name} reference is accepted too, because both spellings are
   * common in a host's resources. Zero means "not found".
   */
  private int resolveIcon(String name) {
    if (name == null || name.isEmpty()) {
      return 0;
    }

    String bare = name;

    if (bare.startsWith("@drawable/")) {
      bare = bare.substring("@drawable/".length());
    } else if (bare.startsWith("@mipmap/")) {
      bare = bare.substring("@mipmap/".length());
    }

    final int drawable = getResources().getIdentifier(bare, "drawable", getPackageName());

    return drawable != 0 ? drawable : getResources().getIdentifier(bare, "mipmap", getPackageName());
  }

  // ---------------------------------------------------------------------------
  // Wake lock
  // ---------------------------------------------------------------------------

  private void acquireWakeLock() {
    if (wakeLock != null) {
      return;
    }

    try {
      final PowerManager power = (PowerManager) getSystemService(Context.POWER_SERVICE);

      if (power == null) {
        return;
      }

      wakeLock = power.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "media_core:background");
      wakeLock.setReferenceCounted(false);
      wakeLock.acquire();
    } catch (Throwable ignored) {
      // Without the lock the job still runs while the app is foreground; the
      // screen going off is the platform's decision, not a failure here.
      wakeLock = null;
    }
  }

  private void releaseWakeLock() {
    final PowerManager.WakeLock lock = wakeLock;

    wakeLock = null;

    if (lock == null) {
      return;
    }

    try {
      if (lock.isHeld()) {
        lock.release();
      }
    } catch (Throwable ignored) {
      /* Already released by the platform. */
    }
  }
}
