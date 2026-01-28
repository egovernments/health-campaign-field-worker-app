# Digit Logger - Design Document

## 1. Overview

### Purpose
A lightweight, offline-first logging package designed for Flutter applications with JSON-driven architectures. Built specifically for the Health Campaign Field Worker App ecosystem to provide visibility into JSON schema processing, form rendering, data transformation, and state management.

### Goals
- **Visibility**: Provide clear insight into JSON processing, transformations, and conditional evaluations
- **Offline-First**: Store logs locally for field workers with intermittent connectivity
- **Performance**: Minimal overhead, non-blocking logging operations
- **Consistency**: Unified logging across all digit_* packages
- **Debuggability**: Easy filtering by category, level, and time range
- **Flexibility**: Support console, file, and remote logging targets
- **Security**: Protect sensitive data through sanitization
- **Reliability**: Graceful degradation when logging fails

### Non-Goals
- **Crash reporting** - Use Sentry/Firebase Crashlytics for native crash capture
- **Analytics tracking** - Use Firebase Analytics/Mixpanel for business metrics
- **User behavior monitoring** - Use LogRocket/FullStory for session replay

### Automatic Error Capturing

digit_logger provides **automatic capturing** so you don't need to manually log everywhere:

#### 1. Zone-Based Global Error Capture
```dart
void main() {
  // Wrap entire app - catches ALL uncaught errors automatically
  DigitLogger.runGuarded(() async {
    await DigitLogger.init(config: LogConfig(...));
    runApp(MyApp());
  });
}
```

#### 2. Flutter Error Handlers
```dart
await DigitLogger.init(config: LogConfig(...));

// One line - captures all Flutter framework errors
DigitLogger.captureFlutterErrors();
```

#### 3. BLoC Observer (Auto-log all BLoC errors)
```dart
// In main.dart - captures ALL bloc errors automatically
Bloc.observer = DigitBlocObserver();

// Provided by digit_logger
class DigitBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    DigitLogger.error(
      'BLoC error: ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
      category: LogCategory.state,
      context: {'bloc': bloc.runtimeType.toString()},
    );
    super.onError(bloc, error, stackTrace);
  }
}
```

#### 4. Future Extension (No try-catch at call site)
```dart
extension LoggedFuture<T> on Future<T> {
  /// Wraps the Future with automatic error logging
  /// The try-catch is inside the extension - callers don't write it
  Future<T> logged(String operation, {LogCategory? category}) async {
    try {
      return await this;
    } catch (e, stack) {
      DigitLogger.error('Failed: $operation', error: e, stackTrace: stack, category: category);
      rethrow;
    }
  }
}

// Usage - just add .logged() to any Future
// Errors are automatically logged without wrapping in try-catch
await api.getHouseholds().logged('fetch households');
await repository.save(entity).logged('save entity');
await crudBloc.create(data).logged('create record');
```

#### Summary: What Gets Auto-Captured

| Error Source | How It's Captured | Setup Required |
|--------------|-------------------|----------------|
| Uncaught async errors | `DigitLogger.runGuarded()` | Wrap main() once |
| Flutter framework errors | `DigitLogger.captureFlutterErrors()` | One line in main() |
| All BLoC errors | `DigitBlocObserver` | Set Bloc.observer once |
| Any Future/API call | `.logged()` extension | Add to Future calls |
| Explicit logging | `DigitLogger.error()` | Manual call |

**Result**: Silent errors from digit_crud_bloc, digit_forms_engine, or any package are automatically captured!

---

## 2. Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         DigitLogger                                      │
│  (Facade with instance access for DI + static convenience methods)       │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌─────────────┐ │
│  │  LogEntry    │  │  LogFilter   │  │  LogConfig   │  │ LogSanitizer│ │
│  │  - id        │  │  - minLevel  │  │  - enabled   │  │ - patterns  │ │
│  │  - level     │  │  - categories│  │  - targets   │  │ - redact()  │ │
│  │  - category  │  │  - timeRange │  │  - retention │  │             │ │
│  │  - message   │  │  - corrId    │  │  - limits    │  │             │ │
│  │  - context   │  │              │  │              │  │             │ │
│  │  - timestamp │  │              │  │              │  │             │ │
│  │  - corrId    │  │              │  │              │  │             │ │
│  └──────────────┘  └──────────────┘  └──────────────┘  └─────────────┘ │
│                                                                          │
├─────────────────────────────────────────────────────────────────────────┤
│                     Log Targets (Interface-based)                        │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐                   │
│  │<<interface>> │  │<<interface>> │  │<<interface>> │                   │
│  │ LogTarget    │  │ LogStorage   │  │ LogSync      │                   │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘                   │
│         │                 │                 │                            │
│  ┌──────┴───────┐  ┌──────┴───────┐  ┌──────┴───────┐                   │
│  │ConsoleTarget │  │ IsarStorage  │  │ HttpSync     │                   │
│  │MemoryTarget  │  │ SqliteStorage│  │ CustomSync   │                   │
│  │ NoOpTarget   │  │ HiveStorage  │  │              │                   │
│  └──────────────┘  └──────────────┘  └──────────────┘                   │
│                                                                          │
├─────────────────────────────────────────────────────────────────────────┤
│                          Internal Components                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌─────────────┐ │
│  │ PreInitBuffer│  │ LogBuffer    │  │ RetentionMgr │  │ SyncManager │ │
│  │ (before init)│  │ (batching)   │  │ (cleanup)    │  │ (with retry)│ │
│  └──────────────┘  └──────────────┘  └──────────────┘  └─────────────┘ │
│                                                                          │
└─────────────────────────────────────────────────────────────────────────┘
```

### Key Design Decisions

1. **Interface-Based Storage**: Not coupled to Isar - can swap implementations
2. **Pre-Init Buffer**: Logs before `init()` are buffered, not lost
3. **Graceful Degradation**: If storage fails, fallback to console/memory
4. **DI Support**: Instance-based with static convenience methods

---

## 3. Log Levels

| Level | Value | Usage | Console Color | Compiled in Release |
|-------|-------|-------|---------------|---------------------|
| `trace` | 0 | Granular debugging (path resolution steps, loop iterations) | Gray | NO (stripped) |
| `debug` | 1 | Development debugging (variable values, state changes) | Blue | NO (stripped) |
| `info` | 2 | Normal operations (flow started, form loaded, sync complete) | Green | YES |
| `warn` | 3 | Recoverable issues (fallback used, retry attempted) | Yellow | YES |
| `error` | 4 | Failures that need attention (transformation failed) | Red | YES |
| `fatal` | 5 | Critical failures (app crash, data corruption) | Red (bold) | YES |

### Level Configuration by Environment
```dart
// Development
LogConfig(minLevel: LogLevel.trace)

// QA/UAT
LogConfig(minLevel: LogLevel.debug)

// Production
LogConfig(minLevel: LogLevel.info)  // Changed from warn - info useful for production debugging
```

### Compile-Time Stripping
```dart
// trace and debug are completely removed in release builds
static void trace(String message, {...}) {
  // This entire method body is removed by tree-shaking in release
  if (!kReleaseMode) {
    _instance._log(LogLevel.trace, message, ...);
  }
}
```

---

## 4. Log Categories

### Core Categories (Built-in)

| Category | Code | Description |
|----------|------|-------------|
| `schema` | SCH | JSON schema parsing and validation |
| `form` | FRM | Form rendering, validation, value extraction |
| `transform` | TRF | Data transformation and mapping |
| `condition` | CND | Conditional expression evaluation |
| `state` | STA | State management operations |
| `navigation` | NAV | Navigation and routing |
| `network` | NET | API calls and responses |
| `sync` | SYN | Data synchronization |
| `storage` | STR | Local storage operations |
| `lifecycle` | LCY | App lifecycle events |
| `general` | GEN | General/uncategorized logs |

### Extensible Categories (String-based, not enum)

```dart
// Categories are strings, not enums - allows extension
class LogCategory {
  final String name;
  final String code;

  const LogCategory(this.name, this.code);

  // Built-in categories
  static const schema = LogCategory('schema', 'SCH');
  static const form = LogCategory('form', 'FRM');
  static const transform = LogCategory('transform', 'TRF');
  static const condition = LogCategory('condition', 'CND');
  static const state = LogCategory('state', 'STA');
  static const navigation = LogCategory('navigation', 'NAV');
  static const network = LogCategory('network', 'NET');
  static const sync = LogCategory('sync', 'SYN');
  static const storage = LogCategory('storage', 'STR');
  static const lifecycle = LogCategory('lifecycle', 'LCY');
  static const general = LogCategory('general', 'GEN');

  // Custom categories can be created by other packages
  // In digit_flow_builder:
  static const flowExecution = LogCategory('flowExecution', 'FLW');

  // In digit_forms_engine:
  static const validation = LogCategory('validation', 'VAL');

  // IMPORTANT: Override equality for proper comparison
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogCategory && name == other.name && code == other.code;

  @override
  int get hashCode => name.hashCode ^ code.hashCode;

  @override
  String toString() => 'LogCategory($name, $code)';
}
```

---

## 5. Log Entry Structure

```dart
class LogEntry {
  /// Unique identifier (UUID v4)
  final String id;

  /// Log level
  final LogLevel level;

  /// Category for filtering (string-based for extensibility)
  final LogCategory category;

  /// Human-readable message (max 1000 chars, truncated if longer)
  final String message;

  /// Structured context data (max 10KB when serialized)
  final Map<String, dynamic>? context;

  /// UTC timestamp (always UTC for consistency)
  final DateTime timestamp;

  /// Source location (file:line) - only in debug builds
  final String? source;

  /// Stack trace (for errors only, max 50 frames)
  final String? stackTrace;

  /// Correlation ID for tracing related operations
  final String? correlationId;

  /// Session ID for grouping logs within a session
  final String sessionId;

  /// User ID (sanitized/hashed in production)
  final String? userId;

  /// Sequence number within session (for ordering)
  final int sequenceNumber;

  /// Whether this log has been synced to remote
  final bool synced;

  /// Duplicate count (if deduplication is enabled)
  final int duplicateCount;
}
```

### Size Limits (Prevent Memory/Storage Issues)

```dart
class LogLimits {
  static const int maxMessageLength = 1000;        // chars
  static const int maxContextSize = 10 * 1024;     // 10KB serialized
  static const int maxStackFrames = 50;            // frames
  static const int maxContextDepth = 5;            // nested levels
  static const int maxContextKeyLength = 100;      // chars per key
  static const int maxContextValueLength = 500;    // chars per value
}
```

### Limit Enforcement Behavior

| Limit Exceeded | Behavior |
|----------------|----------|
| `maxMessageLength` | Truncate with `...` suffix: `"Very long message..."` |
| `maxContextSize` | Drop context entirely, add `_contextDropped: true` |
| `maxStackFrames` | Keep first N frames, add `... X more frames` |
| `maxContextDepth` | Replace deep values with `"[nested object]"` |
| `maxContextKeyLength` | Truncate key with `...` |
| `maxContextValueLength` | Truncate value with `...` |
| Circular reference | Replace with `"[circular]"` |

### Session ID Management

```dart
class SessionManager {
  static String? _currentSessionId;

  /// Generate new session ID (call on app start)
  static String startSession() {
    _currentSessionId = Uuid().v4();
    return _currentSessionId!;
  }

  /// Get current session ID
  static String get current {
    // Auto-generate if not started (fallback)
    return _currentSessionId ??= Uuid().v4();
  }

  /// End session (optional - for explicit session boundaries)
  static void endSession() {
    _currentSessionId = null;
  }
}
```

### Timestamp Handling
```dart
// Always store in UTC
final timestamp = DateTime.now().toUtc();

// Display in local time when needed
String displayTime(DateTime utc) => utc.toLocal().toString();
```

---

## 6. PII Protection & Sanitization

### Sensitive Data Patterns

```dart
class LogSanitizer {
  // Patterns to detect and redact
  static final patterns = [
    RegExp(r'\b\d{10,12}\b'),                    // Phone numbers
    RegExp(r'\b\d{4}[-\s]?\d{4}[-\s]?\d{4}\b'), // Aadhaar-like
    RegExp(r'\b[A-Z]{5}\d{4}[A-Z]\b'),          // PAN-like
    RegExp(r'password["\s:=]+\S+', caseSensitive: false),
    RegExp(r'token["\s:=]+\S+', caseSensitive: false),
    RegExp(r'secret["\s:=]+\S+', caseSensitive: false),
  ];

  // Keys to always redact in context maps
  static const sensitiveKeys = [
    'password', 'token', 'secret', 'apiKey', 'authorization',
    'aadhaar', 'pan', 'phoneNumber', 'mobileNumber', 'email',
    'dateOfBirth', 'dob', 'address', 'biometric',
  ];

  static String redact(String value) => '***REDACTED***';

  /// Sanitize context map - handles PII, depth limits, and circular references
  static Map<String, dynamic> sanitizeContext(
    Map<String, dynamic> context, {
    Set<Object>? seen,  // For circular reference detection
    int depth = 0,
  }) {
    seen ??= {};

    // Circular reference check
    if (seen.contains(context)) {
      return {'_circular': true};
    }
    seen.add(context);

    // Depth limit check
    if (depth > LogLimits.maxContextDepth) {
      return {'_truncated': 'max depth exceeded'};
    }

    final result = <String, dynamic>{};
    for (final entry in context.entries) {
      final key = entry.key.length > LogLimits.maxContextKeyLength
          ? '${entry.key.substring(0, LogLimits.maxContextKeyLength)}...'
          : entry.key;

      // Check if key is sensitive
      if (sensitiveKeys.any((s) => key.toLowerCase().contains(s.toLowerCase()))) {
        result[key] = redact(entry.value.toString());
        continue;
      }

      // Recursively sanitize nested maps
      if (entry.value is Map<String, dynamic>) {
        result[key] = sanitizeContext(
          entry.value as Map<String, dynamic>,
          seen: seen,
          depth: depth + 1,
        );
      } else if (entry.value is String) {
        var value = entry.value as String;
        // Check patterns in string values
        for (final pattern in patterns) {
          value = value.replaceAll(pattern, '***REDACTED***');
        }
        // Truncate if too long
        if (value.length > LogLimits.maxContextValueLength) {
          value = '${value.substring(0, LogLimits.maxContextValueLength)}...';
        }
        result[key] = value;
      } else {
        result[key] = entry.value;
      }
    }

    seen.remove(context);
    return result;
  }
}
```

### Configuration

```dart
class SanitizationConfig {
  /// Enable/disable sanitization (disable only for debugging)
  final bool enabled; // Default: true in production

  /// Additional patterns to redact
  final List<RegExp> customPatterns;

  /// Additional keys to redact
  final List<String> customSensitiveKeys;

  /// Hash user IDs instead of logging raw
  final bool hashUserIds; // Default: true in production
}
```

---

## 7. Storage Strategy

### Abstract Storage Interface

```dart
/// Storage interface - not coupled to any specific implementation
abstract class LogStorage {
  Future<void> init();
  Future<void> write(LogEntry entry);
  Future<void> writeBatch(List<LogEntry> entries);
  Future<List<LogEntry>> query(LogFilter filter, {int limit, int offset});
  Future<void> markSynced(List<String> ids);
  Future<void> delete(LogFilter filter);
  Future<int> count({LogFilter? filter});
  Future<void> dispose();
}

/// Default implementation using Isar
class IsarLogStorage implements LogStorage {
  // Implementation
}

/// SQLite implementation (alternative)
class SqliteLogStorage implements LogStorage {
  // Implementation
}

/// In-memory implementation (for testing)
class MemoryLogStorage implements LogStorage {
  // Implementation
}
```

### Retention Policy

```dart
class RetentionPolicy {
  /// Maximum number of logs to keep locally
  final int maxEntries; // Default: 10,000

  /// Maximum age of logs to keep
  final Duration maxAge; // Default: 7 days

  /// Maximum storage size in bytes
  final int maxStorageBytes; // Default: 50MB

  /// Levels to always keep (even if over limit)
  final List<LogLevel> preserveLevels; // Default: [error, fatal]

  /// Clean up frequency
  final Duration cleanupInterval; // Default: 1 hour

  /// Delete synced logs after this duration
  final Duration deleteSyncedAfter; // Default: 24 hours
}
```

### Deduplication

```dart
class DeduplicationConfig {
  /// Enable deduplication of repeated identical logs
  final bool enabled; // Default: true

  /// Time window for deduplication
  final Duration window; // Default: 1 minute

  /// Fields to consider for deduplication
  final List<String> compareFields; // Default: [level, category, message]
}

// Instead of 100 identical logs, store one with duplicateCount: 100
```

---

## 8. Graceful Degradation

### Failure Handling Strategy

```dart
class FailureStrategy {
  /// What to do when storage fails
  final StorageFailureAction onStorageFailure;

  /// What to do when sync fails
  final SyncFailureAction onSyncFailure;

  /// Max retries before giving up
  final int maxRetries; // Default: 3

  /// Backoff strategy
  final BackoffStrategy backoff; // Default: exponential
}

enum StorageFailureAction {
  /// Keep logging to console only
  fallbackToConsole,

  /// Buffer in memory (limited size)
  bufferInMemory,

  /// Silently drop logs (not recommended)
  drop,
}

enum SyncFailureAction {
  /// Retry with exponential backoff
  retryWithBackoff,

  /// Keep locally, sync later
  keepLocal,

  /// Drop after max retries
  dropAfterMaxRetries,
}
```

### Health Check

```dart
class LoggerHealth {
  final bool isInitialized;
  final bool isStorageHealthy;
  final bool isSyncHealthy;
  final int bufferedLogCount;
  final int pendingSyncCount;
  final DateTime? lastSuccessfulSync;
  final String? lastError;
}

// Check logger health
final health = await DigitLogger.healthCheck();
if (!health.isStorageHealthy) {
  // Alert or fallback
}
```

---

## 9. Remote Sync Strategy

### Sync Configuration

```dart
class SyncConfig {
  /// Remote endpoint URL
  final String? endpoint;

  /// Minimum level to sync
  final LogLevel minSyncLevel; // Default: info (not warn - info useful)

  /// Batch size for sync
  final int batchSize; // Default: 100

  /// Max payload size
  final int maxPayloadBytes; // Default: 1MB

  /// Sync interval
  final Duration syncInterval; // Default: 15 minutes

  /// Whether sync is enabled
  final bool enabled; // Default: false

  /// Authentication
  final SyncAuth? auth;

  /// Retry policy
  final RetryPolicy retryPolicy;

  /// Compress payload
  final bool compress; // Default: true (gzip)
}

class SyncAuth {
  final String? apiKey;
  final String? bearerToken;
  final Map<String, String>? headers;
}

class RetryPolicy {
  final int maxRetries; // Default: 3
  final Duration initialDelay; // Default: 1 second
  final double backoffMultiplier; // Default: 2.0
  final Duration maxDelay; // Default: 5 minutes
}
```

### Sync Payload

```json
{
  "deviceId": "device-uuid",
  "appVersion": "1.0.0",
  "platform": "android",
  "batchId": "batch-uuid",
  "timestamp": "2024-01-15T10:30:00Z",
  "checksum": "sha256-hash",
  "compressed": true,
  "logs": [
    {
      "id": "log-uuid",
      "level": "error",
      "category": "transform",
      "message": "Field mapping failed",
      "context": { ... },
      "timestamp": "2024-01-15T10:30:00Z",
      "correlationId": "corr-uuid",
      "sessionId": "session-uuid",
      "sequenceNumber": 1234,
      "duplicateCount": 1
    }
  ]
}
```

---

## 10. Firebase Crashlytics Integration

By default, digit_logger supports **Terminal + Firebase Crashlytics** as output targets. This section addresses Firebase limitations and how to overcome them.

### Firebase Limitations & Solutions

| Firebase Limitation | Solution |
|---------------------|----------|
| 64 breadcrumb limit | Smart rotation - keep important logs, rotate old ones |
| No deduplication | Dedupe locally before sending to Firebase |
| Log size limits | Smart truncation with priority preservation |
| No correlation ID query | Use Firebase custom keys for filtering |
| Privacy concerns | Hash PII before sending |
| Same crash on multiple devices | Firebase auto-groups by crash signature |

### Firebase Integration Class

```dart
class FirebaseCrashlyticsIntegration implements LogTarget {
  final FirebaseCrashlytics _crashlytics;
  final _breadcrumbs = Queue<LogEntry>();
  static const _maxBreadcrumbs = 64;

  /// Priority weights for smart rotation
  static const _levelPriority = {
    LogLevel.fatal: 100,
    LogLevel.error: 80,
    LogLevel.warn: 40,
    LogLevel.info: 20,
    LogLevel.debug: 5,
    LogLevel.trace: 1,
  };

  @override
  Future<void> write(LogEntry entry) async {
    // 1. Deduplicate before adding
    if (_isDuplicate(entry)) {
      _incrementDuplicateCount(entry);
      return;
    }

    // 2. Smart rotation if at limit
    if (_breadcrumbs.length >= _maxBreadcrumbs) {
      _rotateSmartly(entry);
    }

    // 3. Sanitize and truncate
    final sanitized = _sanitizeForFirebase(entry);

    // 4. Send to Firebase
    await _crashlytics.log(_formatBreadcrumb(sanitized));

    // 5. Set custom keys for filtering
    await _setCustomKeys(entry);

    _breadcrumbs.add(entry);
  }
}
```

### Smart Breadcrumb Rotation

```dart
void _rotateSmartly(LogEntry newEntry) {
  // Never remove errors/fatals unless we have too many
  final errorCount = _breadcrumbs.where(
    (e) => e.level == LogLevel.error || e.level == LogLevel.fatal
  ).length;

  if (errorCount < _maxBreadcrumbs ~/ 2) {
    // Remove lowest priority log
    final toRemove = _breadcrumbs.reduce((a, b) =>
      _levelPriority[a.level]! < _levelPriority[b.level]! ? a : b
    );
    _breadcrumbs.remove(toRemove);
  } else {
    // Too many errors - remove oldest error
    _breadcrumbs.removeWhere((e) =>
      e.level != LogLevel.error && e.level != LogLevel.fatal
    );
    if (_breadcrumbs.length >= _maxBreadcrumbs) {
      _breadcrumbs.removeFirst();
    }
  }
}
```

### Deduplication Before Firebase

```dart
final _recentHashes = <String, int>{};  // hash -> count
static const _dedupeWindow = Duration(minutes: 1);

bool _isDuplicate(LogEntry entry) {
  final hash = _computeHash(entry);
  final existing = _recentHashes[hash];
  return existing != null;
}

void _incrementDuplicateCount(LogEntry entry) {
  final hash = _computeHash(entry);
  _recentHashes[hash] = (_recentHashes[hash] ?? 0) + 1;

  // Update last breadcrumb with count
  final last = _breadcrumbs.lastWhere(
    (e) => _computeHash(e) == hash,
    orElse: () => entry,
  );
  // Firebase breadcrumb updated with "(x5)" suffix
}

String _computeHash(LogEntry entry) {
  return '${entry.level}:${entry.category.code}:${entry.message}'.hashCode.toString();
}
```

### Smart Truncation

```dart
String _formatBreadcrumb(LogEntry entry, {int maxLength = 1000}) {
  // Priority order: level > category > correlation > message > context
  final buffer = StringBuffer();

  // Always include (14 chars max)
  buffer.write('[${entry.level.name.substring(0, 3).toUpperCase()}]');
  buffer.write('[${entry.category.code}]');

  // Include correlation if present (45 chars)
  if (entry.correlationId != null) {
    buffer.write('[${entry.correlationId!.substring(0, 8)}]');
  }

  // Remaining space for message
  final remaining = maxLength - buffer.length - 10; // 10 for safety
  if (entry.message.length > remaining) {
    buffer.write(entry.message.substring(0, remaining));
    buffer.write('...');
  } else {
    buffer.write(entry.message);

    // Add context if space permits
    final contextSpace = remaining - entry.message.length;
    if (contextSpace > 20 && entry.context != null) {
      final contextStr = jsonEncode(entry.context);
      buffer.write(' ');
      buffer.write(contextStr.length > contextSpace
        ? '${contextStr.substring(0, contextSpace - 3)}...'
        : contextStr);
    }
  }

  return buffer.toString();
}
```

### Custom Keys for Correlation ID Filtering

```dart
Future<void> _setCustomKeys(LogEntry entry) async {
  // Set correlation ID as custom key for Firebase Console filtering
  if (entry.correlationId != null) {
    await _crashlytics.setCustomKey('correlation_id', entry.correlationId!);
  }

  // Set session ID
  await _crashlytics.setCustomKey('session_id', entry.sessionId);

  // Set last category (useful for filtering crashes)
  await _crashlytics.setCustomKey('last_category', entry.category.code);

  // Set user ID (hashed)
  if (entry.userId != null) {
    await _crashlytics.setUserId(PrivacyHasher.hash(entry.userId!));
  }
}
```

### Privacy Hashing Before Firebase

```dart
class PrivacyHasher {
  static final _salt = Uuid().v4(); // Session-unique salt

  /// One-way hash for PII - same input = same output within session
  /// Different between sessions for privacy
  static String hash(String value) {
    final bytes = utf8.encode('$_salt:$value');
    final digest = sha256.convert(bytes);
    return digest.toString().substring(0, 16); // Short hash
  }

  /// Hash user ID for Firebase
  static String hashUserId(String userId) => 'user_${hash(userId)}';

  /// Hash phone number
  static String hashPhone(String phone) => 'phone_${hash(phone)}';
}

// Usage in sanitization
Map<String, dynamic> _sanitizeForFirebase(LogEntry entry) {
  final context = entry.context;
  if (context == null) return {};

  return context.map((key, value) {
    if (LogSanitizer.sensitiveKeys.contains(key.toLowerCase())) {
      return MapEntry(key, PrivacyHasher.hash(value.toString()));
    }
    return MapEntry(key, value);
  });
}
```

### How Firebase Handles Same Crash on Multiple Devices

Firebase Crashlytics **automatically groups crashes** by:

1. **Crash signature**: Stack trace pattern matching
2. **Exception type**: Same exception class
3. **Crash location**: Same file and line number

**What you see in Firebase Console:**
```
Issue: NullPointerException in transform_executor.dart:156
├── 127 events  (127 occurrences across all devices)
├── 45 users    (45 unique devices affected)
├── Versions: 1.0.0 (89), 1.0.1 (38)
└── Devices: Samsung (52), Xiaomi (41), OnePlus (34)
```

**How to leverage this:**
```dart
// Record fatal with consistent categorization
Future<void> recordFatal(Object error, StackTrace stack, LogEntry entry) async {
  // Set context before recording
  await _crashlytics.setCustomKey('category', entry.category.code);
  await _crashlytics.setCustomKey('correlation_id', entry.correlationId ?? 'none');

  // Record the error - Firebase groups automatically
  await _crashlytics.recordError(
    error,
    stack,
    reason: entry.message,
    fatal: entry.level == LogLevel.fatal,
  );
}
```

### Configuration

```dart
class FirebaseConfig {
  /// Enable Firebase Crashlytics integration
  final bool enabled; // Default: true in production

  /// Minimum level to send to Firebase
  final LogLevel minLevel; // Default: LogLevel.info

  /// Enable privacy hashing
  final bool hashPII; // Default: true

  /// Custom keys to always set
  final Map<String, String> customKeys;

  /// Breadcrumb rotation strategy
  final RotationStrategy rotationStrategy; // Default: priority-based
}

enum RotationStrategy {
  /// Remove oldest regardless of level
  fifo,

  /// Remove lowest priority first
  priorityBased,

  /// Keep errors, rotate others
  preserveErrors,
}
```

---

## 11. Correlation & Tracing

### Correlation ID

```dart
// Automatically propagate correlation ID through async operations
class CorrelationContext {
  /// Get current correlation ID (must be getter, not final - evaluated each access)
  static String? get current => Zone.current[#correlationId] as String?;

  /// Run code with a correlation ID
  static Future<T> run<T>(String correlationId, Future<T> Function() fn) {
    return runZoned(fn, zoneValues: {#correlationId: correlationId});
  }

  /// Generate new correlation ID
  static String generate() => Uuid().v4();
}

// Usage
await CorrelationContext.run(CorrelationContext.generate(), () async {
  DigitLogger.info('Starting operation'); // Automatically has correlationId
  await doSomething();
  DigitLogger.info('Operation complete'); // Same correlationId
});
```

### Scoped Logging with Correlation

```dart
final scopedLog = DigitLogger.scope(
  operation: 'transformHousehold',
  correlationId: CorrelationContext.current ?? CorrelationContext.generate(),
  context: {'householdId': 'hh-123'},
);

// All logs share correlation ID and base context
scopedLog.debug('Starting');
scopedLog.trace('Step 1');
scopedLog.info('Complete');
```

---

## 12. API Design

### Initialization with Pre-Init Buffer

```dart
class DigitLogger {
  static DigitLogger? _instance;
  static final _preInitBuffer = <_PendingLog>[];
  static const _maxPreInitBuffer = 100;

  /// Initialize the logger
  static Future<void> init({required LogConfig config}) async {
    _instance = DigitLogger._(config);
    await _instance!._init();

    // Flush pre-init buffer
    for (final pending in _preInitBuffer) {
      _instance!._log(pending.level, pending.message, ...);
    }
    _preInitBuffer.clear();
  }

  /// Log before init - buffered until init completes
  static void _logOrBuffer(LogLevel level, String message, ...) {
    if (_instance != null) {
      _instance!._log(level, message, ...);
    } else if (_preInitBuffer.length < _maxPreInitBuffer) {
      _preInitBuffer.add(_PendingLog(level, message, ...));
    }
    // If buffer full, drop (graceful degradation)
  }

  /// Get instance for DI
  static DigitLogger get instance {
    assert(_instance != null, 'DigitLogger.init() must be called first');
    return _instance!;
  }
}
```

### Dependency Injection Support

```dart
// For DI frameworks, expose instance
final loggerProvider = Provider<DigitLogger>((ref) => DigitLogger.instance);

// Or create custom instance for testing
final testLogger = DigitLogger.create(
  config: LogConfig.test(),
  storage: MemoryLogStorage(),
);
```

### Logging Methods

```dart
class DigitLogger {
  // Static convenience methods (use global instance)
  static void trace(String message, {LogCategory? category, Map<String, dynamic>? context});
  static void debug(String message, {LogCategory? category, Map<String, dynamic>? context});
  static void info(String message, {LogCategory? category, Map<String, dynamic>? context});
  static void warn(String message, {LogCategory? category, Map<String, dynamic>? context});
  static void error(String message, {LogCategory? category, Map<String, dynamic>? context, Object? error, StackTrace? stackTrace});
  static void fatal(String message, {LogCategory? category, Map<String, dynamic>? context, Object? error, StackTrace? stackTrace});

  // Instance methods (same names - for DI/testing scenarios)
  void trace(String message, {LogCategory? category, Map<String, dynamic>? context});
  void debug(String message, {LogCategory? category, Map<String, dynamic>? context});
  void info(String message, {LogCategory? category, Map<String, dynamic>? context});
  void warn(String message, {LogCategory? category, Map<String, dynamic>? context});
  void error(String message, {LogCategory? category, Map<String, dynamic>? context, Object? error, StackTrace? stackTrace});
  void fatal(String message, {LogCategory? category, Map<String, dynamic>? context, Object? error, StackTrace? stackTrace});

  // Category-scoped loggers
  static CategoryLogger get schema => CategoryLogger(LogCategory.schema);
  static CategoryLogger get form => CategoryLogger(LogCategory.form);
  static CategoryLogger get transform => CategoryLogger(LogCategory.transform);
  // etc.

  // Scoped logger for operations
  static ScopedLogger scope({
    required String operation,
    String? correlationId,
    Map<String, dynamic>? context,
  });

  // Health check
  static Future<LoggerHealth> healthCheck();

  // Dispose resources
  static Future<void> dispose();
}
```

### LogFilter Definition

```dart
class LogFilter {
  /// Minimum level to include
  final LogLevel? minLevel;

  /// Maximum level to include
  final LogLevel? maxLevel;

  /// Categories to include (null = all)
  final List<LogCategory>? categories;

  /// Categories to exclude
  final List<LogCategory>? excludeCategories;

  /// Start time (inclusive)
  final DateTime? startTime;

  /// End time (exclusive)
  final DateTime? endTime;

  /// Filter by correlation ID
  final String? correlationId;

  /// Filter by session ID
  final String? sessionId;

  /// Filter by user ID
  final String? userId;

  /// Search in message text (case-insensitive contains)
  final String? searchText;

  /// Only unsynced logs
  final bool? syncedOnly;

  const LogFilter({
    this.minLevel,
    this.maxLevel,
    this.categories,
    this.excludeCategories,
    this.startTime,
    this.endTime,
    this.correlationId,
    this.sessionId,
    this.userId,
    this.searchText,
    this.syncedOnly,
  });
}
```

---

## 13. Testing Support

### Isolated Test Capture (Not Global)

```dart
class LogCapture {
  final List<LogEntry> logs = [];
  final DigitLogger _logger;

  LogCapture._(this._logger);

  void stop() {
    _logger._removeCapture(this);
  }
}

// In tests - creates isolated capture
void main() {
  late DigitLogger testLogger;
  late LogCapture capture;

  setUp(() {
    testLogger = DigitLogger.create(
      config: LogConfig.test(),
      storage: MemoryLogStorage(),
    );
    capture = testLogger.startCapture();
  });

  tearDown(() {
    capture.stop();
    testLogger.dispose();
  });

  test('transformation logs warning', () {
    final transformer = Transformer(logger: testLogger);
    transformer.transform(incompleteData);

    expect(capture.logs, contains(
      isA<LogEntry>()
        .having((e) => e.level, 'level', LogLevel.warn)
        .having((e) => e.message, 'message', contains('missing')),
    ));
  });
}
```

### Test Configuration

```dart
extension LogConfigTest on LogConfig {
  static LogConfig test() => LogConfig(
    minLevel: LogLevel.trace,
    enableConsole: false,  // Don't pollute test output
    enableStorage: false,
    sanitization: SanitizationConfig(enabled: false),
  );
}
```

---

## 14. Console Output Format

### Development Console (Pretty Print)

```
┌─────────────────────────────────────────────────────────────────
│ 10:30:45.123 [DEBUG] [TRF] Field mapped successfully
│ correlationId: abc-123 | seq: 42 | session: xyz-789
├─────────────────────────────────────────────────────────────────
│ source: transformer_executor.dart:156
│ context:
│   path: household.address.locality
│   value: "Bangalore"
│   entityField: localityCode
└─────────────────────────────────────────────────────────────────
```

### Compact Format (CI/Production Fallback)

```
2024-01-15T10:30:45.123Z DBG [TRF] [corr:abc-123] Field mapped {path:household.address.locality}
2024-01-15T10:30:45.456Z ERR [SCH] [corr:abc-123] Schema validation failed {field:dateOfBirth}
```

**Format Legend:**
- Timestamp: ISO 8601 UTC
- Level: TRC/DBG/INF/WRN/ERR/FTL
- Category: 3-letter code in brackets
- Correlation ID: `[corr:xxx]` (omitted if null)
- Message: Human-readable text
- Context: Inline JSON (truncated if too long)

---

## 15. Performance Considerations

### Async Non-Blocking Pipeline

```dart
class LogPipeline {
  final _logController = StreamController<LogEntry>.broadcast();
  late final StreamSubscription _subscription;

  void init() {
    _subscription = _logController.stream
        .bufferTime(Duration(milliseconds: 100))  // Batch writes
        .where((batch) => batch.isNotEmpty)
        .listen(_processBatch);
  }

  void log(LogEntry entry) {
    // Non-blocking add to stream
    _logController.add(entry);
  }

  Future<void> _processBatch(List<LogEntry> batch) async {
    // Write to storage in batch
    await _storage.writeBatch(batch);
  }
}
```

### Memory Management

```dart
class LogBuffer {
  final int maxSize;
  final _buffer = Queue<LogEntry>();

  void add(LogEntry entry) {
    if (_buffer.length >= maxSize) {
      _buffer.removeFirst(); // Drop oldest
    }
    _buffer.add(entry);
  }
}
```

### Sampling for High-Volume Trace

```dart
class SamplingConfig {
  /// Sample rate for trace logs (0.0 to 1.0)
  final double traceRate; // Default: 1.0 (keep all) in debug, 0.1 in release

  /// Sample rate for debug logs
  final double debugRate; // Default: 1.0 in debug, 0.5 in release

  /// Never sample these levels (always keep 100%)
  final List<LogLevel> neverSampleLevels; // Default: [error, fatal]

  /// Never sample these categories (always keep 100%)
  final List<LogCategory> neverSampleCategories; // Default: []
}
```

---

## 16. Package Structure

```
packages/digit_logger/
├── lib/
│   ├── digit_logger.dart              # Main export
│   ├── src/
│   │   ├── core/
│   │   │   ├── logger.dart            # DigitLogger class
│   │   │   ├── log_entry.dart         # LogEntry model
│   │   │   ├── log_level.dart         # LogLevel enum
│   │   │   ├── log_category.dart      # LogCategory class (not enum!)
│   │   │   ├── log_config.dart        # Configuration classes
│   │   │   ├── log_filter.dart        # Query filter
│   │   │   └── log_limits.dart        # Size limits
│   │   ├── loggers/
│   │   │   ├── category_logger.dart   # Category-scoped logger
│   │   │   └── scoped_logger.dart     # Operation-scoped logger
│   │   ├── targets/
│   │   │   ├── log_target.dart        # Abstract target interface
│   │   │   ├── console_target.dart    # Console output
│   │   │   └── memory_target.dart     # In-memory (testing)
│   │   ├── storage/
│   │   │   ├── log_storage.dart       # Abstract storage interface
│   │   │   ├── isar_storage.dart      # Isar implementation
│   │   │   └── memory_storage.dart    # In-memory (testing)
│   │   ├── sync/
│   │   │   ├── log_sync.dart          # Abstract sync interface
│   │   │   ├── http_sync.dart         # HTTP implementation
│   │   │   └── retry_policy.dart      # Retry logic
│   │   ├── formatters/
│   │   │   ├── log_formatter.dart     # Abstract formatter
│   │   │   ├── pretty_formatter.dart  # Dev console format
│   │   │   └── compact_formatter.dart # Production format
│   │   ├── sanitization/
│   │   │   ├── log_sanitizer.dart     # PII redaction
│   │   │   └── patterns.dart          # Sensitive patterns
│   │   ├── correlation/
│   │   │   └── correlation_context.dart # Correlation ID handling
│   │   └── utils/
│   │       ├── log_buffer.dart        # In-memory buffer
│   │       ├── pre_init_buffer.dart   # Before init buffer
│   │       ├── retention_manager.dart # Cleanup logic
│   │       ├── deduplication.dart     # Dedup logic
│   │       └── health_check.dart      # Health monitoring
├── test/
│   ├── logger_test.dart
│   ├── sanitizer_test.dart
│   ├── storage/
│   │   └── isar_storage_test.dart
│   ├── sync/
│   │   └── http_sync_test.dart
│   └── correlation_test.dart
├── pubspec.yaml
├── README.md
├── DESIGN.md
└── CHANGELOG.md
```

---

## 17. Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  uuid: ^4.0.0             # For generating IDs
  rxdart: ^0.27.0          # For stream buffering
  crypto: ^3.0.0           # For checksums and hashing

  # Storage - optional, provide interface
  # Consumer chooses implementation

dev_dependencies:
  flutter_test:
    sdk: flutter
  mocktail: ^1.0.0         # For mocking in tests

# Optional peer dependencies (consumer provides)
# isar: ^3.1.0
# sqflite: ^2.3.0
# connectivity_plus: ^5.0.0
```

**Note**: Storage implementations (Isar, SQLite) are NOT direct dependencies. The consumer provides them, keeping the logger lightweight.

---

## 18. Migration Path

### Phase 1: Core Implementation (MVP)
- Core logger with console output
- Log levels and categories
- Basic in-memory buffer
- Pre-init buffer
- Sanitization
- Size limits

### Phase 2: Storage
- Abstract storage interface
- Isar implementation
- Retention management
- Deduplication

### Phase 3: Replace Existing Logs
- Replace `debugPrint` in digit_forms_engine
- Replace `debugPrint` in digit_flow_builder
- Add logging to silent failure points
- Add correlation IDs to flows

### Phase 4: Sync & Advanced Features
- Remote sync with retry
- Compression
- Health check API
- Debug UI

### Phase 5: Optimization
- Sampling for high-volume
- Performance profiling
- Memory optimization

---

## 19. Open Questions - RESOLVED

| Question | Resolution |
|----------|------------|
| Storage Choice: Isar vs SQLite vs Hive? | **Interface-based** - consumer chooses. Provide Isar impl as default. |
| Remote Sync Format? | **Custom with OpenTelemetry-compatible fields** for future migration. |
| Category Extensibility? | **String-based LogCategory class**, not enum. Packages can define custom. |
| PII handling? | **Sanitization enabled by default** with configurable patterns. |
| What if logging fails? | **Graceful degradation** - fallback to console/memory, never crash. |

---

## 20. Success Metrics

- 100% of silent failures now logged
- Avg time to debug JSON issues reduced by 50%
- Field support tickets include relevant log excerpts
- No noticeable performance impact (< 5ms per 100 logs)
- Zero PII leaks in production logs
- 99.9% log delivery to remote (when connected)

---

## 21. Security Checklist

- [ ] PII sanitization enabled by default
- [ ] User IDs hashed in production
- [ ] No sensitive keys logged (password, token, etc.)
- [ ] Sync uses HTTPS only
- [ ] API keys not hardcoded
- [ ] Logs encrypted at rest (if required)
- [ ] No stack traces with internal paths in production sync

---

## Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2024-XX-XX | - | Initial design |
