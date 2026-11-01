#ifndef MEDIA_CORE_NATIVE_BACKGROUND_EXECUTION_H_
#define MEDIA_CORE_NATIVE_BACKGROUND_EXECUTION_H_

namespace media_core_native {

/// Keeps the system awake while a long-running job runs.
///
/// Windows has no foreground-service concept — an application that is not
/// minimized away is not suspended — so the only thing a recording or a
/// download can lose here is the *system*: idle sleep stops the CPU and the
/// writer stalls mid-segment. `SetThreadExecutionState(ES_SYSTEM_REQUIRED)`
/// is the platform's answer, and it is deliberately not `ES_DISPLAY_REQUIRED`:
/// the screen may turn off (the user asked for that by not touching it), the
/// machine must not sleep.
///
/// Sessions are counted rather than flagged, so two jobs (a recording and a
/// download) cannot end each other's protection: the request stays in force
/// until the last one releases it.
namespace background_execution {

/// Requests that the system stay awake for one more job. Returns the number of
/// active jobs.
int Acquire();

/// Releases one job's request. Returns the number still active.
int Release();

/// Whether any job currently holds the system awake.
bool IsHeld();

}  // namespace background_execution

}  // namespace media_core_native

#endif  // MEDIA_CORE_NATIVE_BACKGROUND_EXECUTION_H_
