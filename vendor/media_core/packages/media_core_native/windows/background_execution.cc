#include "background_execution.h"

#include <windows.h>

#include <atomic>

namespace media_core_native {
namespace background_execution {
namespace {

/// Jobs currently holding the system awake.
///
/// Atomic because the channel answers on the platform thread while a job may
/// release from another isolate's thread; a counter is all the state this
/// needs, and it is the one thing that must not race.
std::atomic<int> g_held{0};

/// Applies the current count to the platform.
void Apply(bool keepAwake) {
  if (keepAwake) {
    // ES_CONTINUOUS makes the request persist until it is cleared, which is
    // what a long recording needs: the flag is not re-armed per frame.
    SetThreadExecutionState(ES_CONTINUOUS | ES_SYSTEM_REQUIRED);

    return;
  }

  // ES_CONTINUOUS alone clears the previous request.
  SetThreadExecutionState(ES_CONTINUOUS);
}

}  // namespace

int Acquire() {
  const int held = g_held.fetch_add(1) + 1;

  if (held == 1) {
    Apply(true);
  }

  return held;
}

int Release() {
  const int previous = g_held.fetch_sub(1) - 1;
  const int held = previous < 0 ? 0 : previous;

  if (previous < 0) {
    // A release without an acquire is a caller bug, not a reason to clear
    // somebody else's request; put the counter back where it was.
    g_held.store(0);
  }

  if (held == 0) {
    Apply(false);
  }

  return held;
}

bool IsHeld() {
  return g_held.load() > 0;
}

}  // namespace background_execution
}  // namespace media_core_native
