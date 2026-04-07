# Sync Service - Bug Fixes & Improvements

## Overview

A comprehensive audit and fix of the `sync_service` package and its integration points across the health campaign field worker app. All changes improve reliability, prevent crashes, and fix data integrity issues in the sync pipeline.

---

## Files Modified

| # | File | Package |
|---|------|---------|
| 1 | `packages/sync_service/lib/data/sync_service.dart` | sync_service |
| 2 | `packages/sync_service/lib/blocs/sync/sync.dart` | sync_service |
| 3 | `packages/sync_service/lib/data/repositories/sync/sync_up.dart` | sync_service |
| 4 | `packages/sync_service/lib/data/repositories/sync/sync_down.dart` | sync_service |
| 5 | `packages/sync_service/lib/utils/utils.dart` | sync_service |
| 6 | `packages/digit_data_model/lib/data/repositories/oplog/oplog.dart` | digit_data_model |
| 7 | `packages/digit_data_model/lib/data/local_store/sql_store/sql_store.dart` | digit_data_model |
| 8 | `apps/health_campaign_field_worker_app/lib/utils/background_service.dart` | main app |
| 9 | `apps/health_campaign_field_worker_app/lib/pages/home.dart` | main app |
| 10 | `apps/health_campaign_field_worker_app/lib/utils/utils.dart` | main app |
| 11 | `apps/health_campaign_field_worker_app/lib/data/sync_registry.dart` | main app |

---

## Fixes Applied

### 1. Race Condition: Manual + Background Sync Running Concurrently

**Severity:** Critical
**File:** `sync_service.dart`, `background_service.dart`, `home.dart`, `utils.dart`

**Problem:** Manual sync (triggered from UI) and background sync (triggered by timer) could run simultaneously. Both would query the same unsynced OpLog entries and send duplicate API calls, causing data corruption.

**Fix:** Added `SyncLock` class — a cross-isolate mutex using `FlutterSecureStorage` with a timestamp. Stale locks auto-expire after 10 minutes (handles killed processes).

- `performSync()` acquires `SyncLock` before syncing, returns `false` if lock is held
- Background service checks `SyncLock.isLocked()` before starting sync
- `attemptSyncUp()` in UI checks lock and shows toast if sync already running
- Removed conflicting `manualSyncKey` writes from `home.dart`

```dart
class SyncLock {
  static const _key = 'syncLockTimestamp';
  static const _staleDuration = Duration(minutes: 10);
  static const _storage = FlutterSecureStorage();

  static Future<bool> tryAcquire() async { ... }
  static Future<bool> isLocked() async { ... }
  static Future<void> refresh() async { ... }
  static Future<void> release() async { ... }
}
```

---

### 2. `rethrow` After `emit()` in SyncBloc Crashes the App

**Severity:** High
**File:** `sync.dart` (`_handleSyncUp`)

**Problem:** After emitting error states (`DownSyncFailedState`, `UpSyncFailedState`), the code called `rethrow`, which propagated an unhandled exception through the BLoC zone — crashing the app in release mode. The `rethrow` was originally added to push errors to Firebase Crashlytics for production monitoring.

**Fix:** Removed both `rethrow` statements. Error states are already emitted for the UI to react to. The `finally` block still runs and dispatches `SyncRefreshEvent`. Firebase error reporting should be handled via explicit `FirebaseCrashlytics.instance.recordError()` calls instead of relying on unhandled exceptions from `rethrow`.

---

### 3. `performSync` Returning `false` Emits False "Completed" State

**Severity:** High
**File:** `sync.dart` (`_handleSyncUp`)

**Problem:** When `performSync` returned `false` (lock held by another sync), the BLoC emitted `SyncCompletedState()` — misleading the UI into showing "sync complete" when nothing happened.

**Fix:** Check the return value. If `false`, emit `SyncPendingState()` instead.

```dart
final isSyncCompleted = await syncService.performSync(...);
if (isSyncCompleted) {
  emit(const SyncCompletedState());
} else {
  emit(const SyncPendingState());
}
```

---

### 4. Timer Overlap in Background Service

**Severity:** High
**File:** `background_service.dart`

**Problem:** `Timer.periodic` does not await async callbacks. If a sync operation took longer than the timer interval, the next tick would fire while the previous one was still running — causing overlapping bandwidth checks, duplicate syncs, incorrect counter increments, and `enablesManualSync` flag flickering.

**Fix:** Added `bool isSyncing` re-entry guard with `try/finally` to ensure reset.

```dart
bool isSyncing = false;
makePeriodicTimer(
  Duration(seconds: interval),
  (timer) async {
    if (isSyncing) return;
    isSyncing = true;
    try {
      // ... existing logic ...
    } finally {
      isSyncing = false;
    }
  },
  fireNow: true,
);
```

---

### 5. SyncLock Expires Mid-Sync During Long Operations

**Severity:** High
**File:** `sync_service.dart`

**Problem:** The 10-minute stale lock timeout could expire during a long sync with many batches. Another isolate would then acquire the lock, causing concurrent syncs.

**Fix:** Added `SyncLock.refresh()` method that rewrites the timestamp. Called before each loop iteration in `_performSyncInternal()`.

---

### 6. Clock Going Backward Makes Lock Stuck Forever

**Severity:** High
**File:** `sync_service.dart`

**Problem:** If device time is adjusted backward, `DateTime.now().difference(lockTime)` returns a negative duration. Negative duration is always `< _staleDuration`, so the lock would never expire.

**Fix:** Added `.abs()` to duration comparison in both `tryAcquire()` and `isLocked()`.

```dart
return DateTime.now().difference(lockTime).abs() < _staleDuration;
```

---

### 7. Missing WAL Mode & busy_timeout on SQLite Database

**Severity:** High
**File:** `sql_store.dart`

**Problem:** The SQLite database is accessed from two isolates (main UI + background sync service) without WAL (Write-Ahead Logging) mode. This caused "database is locked" errors and serialized all reads/writes.

**Fix:** Added two PRAGMAs to database setup:

```dart
database.execute('PRAGMA journal_mode = WAL;');
database.execute('PRAGMA busy_timeout = 5000;');
```

- WAL mode allows concurrent reads during writes
- busy_timeout retries for 5 seconds instead of immediately throwing on lock contention

---

### 8. `writeTxnSync` in Loops Freezes UI Thread

**Severity:** High
**File:** `oplog.dart`

**Problem:** Three loops each called `isar.writeTxnSync()` per entry — N entries = N separate blocking transactions, each acquiring and releasing a DB lock on the main thread.

**Fix:** Collect updates into a list, then write all at once with a single `putAllSync` call.

**Affected methods:**
- `getPendingUpSync()` — update OpLogs with server IDs from create records
- `updateServerGeneratedIds()` — batch update server-generated IDs
- `updateSyncDownRetry()` — batch increment retry counts

```dart
// Before: N transactions
for (final oplog in oplogs) {
  isar.writeTxnSync(() { isar.opLogs.putSync(updatedOplog); });
}

// After: 1 transaction
final updatedOpLogs = <OpLog>[];
for (final oplog in oplogs) {
  updatedOpLogs.add(updatedOplog);
}
if (updatedOpLogs.isNotEmpty) {
  isar.writeTxnSync(() { isar.opLogs.putAllSync(updatedOpLogs); });
}
```

---

### 9. Unbounded Recursion Converted to While Loop

**Severity:** High
**File:** `sync_service.dart`

**Problem:** `_performSyncInternal()` called itself recursively when pending entries existed. No stack depth limit — could cause stack overflow with large datasets. Also used a stale snapshot (pending entries checked before sync, not after) to decide whether to recurse.

**Fix:** Converted to `while (true)` loop. Pending entries are checked fresh at the top of each iteration. Returns `true` only when both lists are empty.

---

### 10. Retry Delay Off-by-One in OpLog

**Severity:** High
**File:** `oplog.dart`

**Problem:** The retry delay calculation used `oplogs.first.syncDownRetryCount` — the original count before increment. So the first retry used a delay based on count 0, not 1.

**Fix:** Compute `newRetryCount` (original + 1) and use that for the delay.

```dart
final newRetryCount =
    (oplogs.first.syncDownRetryCount < 0 ? 0 : oplogs.first.syncDownRetryCount) + 1;
if (newRetryCount <= 1) {
  await Future.delayed(const Duration(seconds: 1));
} else {
  await Future.delayed(Duration(
    seconds: DigitDataModelSingleton().retryTimeInterval * newRetryCount,
  ));
}
```

---

### 11. Force Unwrap `responseEntities!` Crash in Sync-Down

**Severity:** High
**File:** `sync_down.dart`

**Problem:** `responseEntities` was assigned via `entityMapper?.syncDownEntityResponse(...)` which returns null if entityMapper is null. The code then force-unwrapped with `responseEntities!`, crashing the app.

**Fix:** Replaced with a null check.

```dart
if (responseEntities != null) {
  for (var element in responseEntities) {
    await local.update(element, createOpLog: false);
  }
}
```

---

### 12. Duplicate Registry Lookup Removed

**Severity:** Medium
**File:** `sync_up.dart`

**Problem:** The same `SyncServiceSingleton().registries?.getSyncRegistries()` call was made twice per entity type — once at line 120 and again at line 168.

**Fix:** Removed the duplicate at line 168. The variable from line 120 is already in scope.

---

### 13. `findAllSync()` Blocking UI Thread in BLoC

**Severity:** High
**File:** `sync.dart` (`_handleRefresh`)

**Problem:** Two synchronous `findAllSync()` calls in the BLoC event handler blocked the main isolate while scanning all OpLogs. Caused UI freezes, missed touch events, and animation jank.

**Fix:** Replaced with async `findAll()` and run both queries in parallel with `Future.wait`.

```dart
final results = await Future.wait([
  isar.opLogs.filter()...findAll(),
  isar.opLogs.filter()...findAll(),
]);
length = entityMapper.getSyncCount(results[0]) +
    entityMapper.getSyncCount(results[1]);
```

---

### 14. `entityMapper!` Force Unwrap Crash in BLoC

**Severity:** High
**File:** `sync.dart` (`_handleRefresh`)

**Problem:** `SyncServiceSingleton().entityMapper!` would crash with "null check operator used on a null value" if `setData()` wasn't called before the first refresh event.

**Fix:** Added null check — if entityMapper is null, skip the count query and fall back to `previousCount`.

---

### 15. Pointless `catch (_) { rethrow; }` in `_handleRefresh`

**Severity:** Medium
**File:** `sync.dart`

**Problem:** The catch block just rethrew, adding no value. Worse, the rethrow happened after the `finally` block emitted a state, causing an uncaught exception in the BLoC.

**Fix:** Removed the catch block entirely. The `finally` block still runs and emits the pending state.

---

### 16. Division by Zero in Background Service Bandwidth Calculation

**Severity:** High
**File:** `background_service.dart`

**Problem:** If all bandwidth checks fail (common on poor networks), `speedArray` is empty. `sum / speedArray.length` throws a division-by-zero error, crashing the background service.

**Fix:** Added `if (speedArray.isEmpty) continue` to skip sync when no bandwidth data is available.

---

### 17. `serviceWrappers.first` Crash on Empty Server Response

**Severity:** High
**File:** `sync_registry.dart`

**Problem:** If the server returned an empty `serviceWrappers` list for a complaint creation response, `.first` threw `StateError`, killing the sync.

**Fix:** Check `isEmpty` first, log error, and `continue` to next entity.

---

### 18. `entry.firstWhere()` Crash on Missing OpLog Entry

**Severity:** High
**File:** `sync_registry.dart`

**Problem:** `entry.firstWhere(...)` threw `StateError` if no OpLogEntry matched the `clientReferenceId`. No `orElse` fallback.

**Fix:** Replaced with `firstWhereOrNull` from `collection` package. If no match, logs error and continues.

---

### 19. Lock Stuck After `stopService` on Error

**Severity:** High
**File:** `sync_service.dart`

**Problem:** On sync error, `service?.invoke('stopService')` was called before `SyncLock.release()`. If the background service was killed before the `finally` block in `performSync` ran, the lock would be stuck for 10 minutes.

**Fix:** Removed early `SyncLock.release()` from `_performSyncInternal`. The `finally` block in `performSync` is the single point of lock release. `stopService` is called before throwing, and the throw propagates to the `finally` block which releases the lock.

---

### 20. `bandwidthService.actions.first` Crash on Empty Actions

**Severity:** High
**File:** `background_service.dart`

**Problem:** If the BANDWIDTH-CHECK service registry entry had an empty `actions` list, `.first` threw `StateError`.

**Fix:** Added `bandwidthService.actions.isNotEmpty` to the existing null check.

---

### 21. Force Unwrap `userRequestModel!` / `selectedProject!` in Background Service

**Severity:** High
**File:** `background_service.dart`

**Problem:** If secure storage was corrupted or user wasn't logged in, force unwraps crashed the background service permanently — it would never recover on restart.

**Fix:** Added null checks. If either is null, the service stops gracefully.

---

### 22. Dead Code Removed: `SyncUtils` Class

**Severity:** Low
**File:** `utils.dart`

**Problem:** `SyncUtils` class with `syncCount()` and `syncRefresh()` methods was never used anywhere. `syncCount()` was also broken (variable shadowing made it always return null). The app uses extension methods in `context_utility.dart` instead.

**Fix:** Removed the entire class and its unused imports.

---

## Fault Tolerance Assessment

### What IS fault-tolerant:
- App killed mid-sync: SyncLock auto-expires, OpLog entries retry next cycle
- Network drops: errors caught, lock released, retries on next sync
- Server rejects records: row version check prevents stale overwrites
- Concurrent sync attempts: SyncLock prevents overlap
- Secure storage corrupted: background service stops gracefully

### Known limitations (by design):
- **Entity type ordering is enforced** — parent types sync before children (Household before HouseholdMember). If a parent batch fails, child types wait until next cycle. This is correct because children depend on parent server-generated IDs.
- **Batch-level granularity** — if one record in a `bulkCreate` batch is bad, the whole batch fails. The non-recoverable error mechanism handles this after max retries.
- **No idempotency keys** — if the app crashes after a successful API call but before `markSyncedUp`, the record will be re-sent. Server-side deduplication (row version) mitigates this.

---

## Testing Recommendations

1. **Kill app during sync** — verify lock expires and sync resumes
2. **Toggle airplane mode mid-sync** — verify error handling and retry
3. **Trigger manual sync while background sync is running** — verify lock prevents overlap
4. **Sync with 1000+ pending records** — verify no UI freeze (findAll async + writeTxnSync batching)
5. **Sync with corrupted/invalid records** — verify non-recoverable error marking after max retries
6. **Adjust device clock backward** — verify lock still expires (abs() fix)
7. **Low battery during sync** — verify background service stops gracefully
