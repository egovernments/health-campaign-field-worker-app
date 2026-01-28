# digit_logger

A lightweight, offline-first logging package for Flutter applications with JSON-driven architectures. Built specifically for the Health Campaign Field Worker App ecosystem.

## Features

- **Multiple Log Levels**: trace, debug, info, warn, error, fatal
- **Category-Based Filtering**: Built-in categories (schema, form, transform, etc.) plus custom categories
- **Automatic PII Sanitization**: Redacts phone numbers, Aadhaar, PAN, passwords, tokens
- **Zone-Based Correlation**: Track related operations across async boundaries
- **Pre-Init Buffering**: No logs lost during startup
- **Compile-Time Stripping**: trace/debug removed in release builds
- **Flexible Targets**: Console, memory, custom implementations
- **BLoC Integration**: Auto-capture all BLoC errors

## Quick Start

```dart
import 'package:digit_logger/digit_logger.dart';

void main() {
  // Wrap app with error capture
  DigitLogger.runGuarded(() async {
    // Initialize logger
    await DigitLogger.init(config: LogConfig.development());

    // Capture Flutter framework errors
    DigitLogger.captureFlutterErrors();

    runApp(MyApp());
  });
}
```

## Basic Logging

```dart
// Simple logging
DigitLogger.info('User logged in');
DigitLogger.warn('Retry attempt', context: {'attempt': 2});
DigitLogger.error('Failed to save', error: e, stackTrace: stack);

// With categories
DigitLogger.info('Schema parsed', category: LogCategory.schema);
DigitLogger.error('API failed', category: LogCategory.network);
```

## Category Loggers

```dart
// Pre-scoped loggers for cleaner code
DigitLogger.schema.debug('Parsing schema');
DigitLogger.network.error('Request failed');
DigitLogger.storage.info('Data saved');
```

## Scoped Logging

```dart
// All logs share the same correlation ID
final log = DigitLogger.scope(
  operation: 'syncHouseholds',
  context: {'batchSize': 50},
);

log.info('Starting sync');
log.debug('Processing batch');
log.info('Sync complete');
```

## Correlation Context

```dart
// Propagate correlation ID through async operations
await CorrelationContext.run(CorrelationContext.generate(), () async {
  DigitLogger.info('Starting operation');
  await fetchData();
  DigitLogger.info('Operation complete'); // Same correlation ID
});
```

## Auto-Capture Errors

### BLoC Errors

```dart
// In main.dart
Bloc.observer = DigitBlocObserver();
```

### Future Errors

```dart
// Automatically log errors without try-catch
await api.getHouseholds().logged('fetch households');
await repository.save(entity).logged('save entity');
```

## Configuration

### Development

```dart
await DigitLogger.init(config: LogConfig.development());
// - Logs from trace level
// - Pretty console output
// - Sanitization disabled
```

### Production

```dart
await DigitLogger.init(config: LogConfig.production());
// - Logs from info level
// - Compact console output
// - Sanitization enabled
```

### Custom

```dart
await DigitLogger.init(
  config: LogConfig(
    enabled: true,
    minLevel: LogLevel.debug,
    enableConsole: true,
    enableStorage: true,
    targets: [ConsoleTarget(formatter: PrettyFormatter())],
    storage: MyCustomStorage(),
    formatter: PrettyFormatter(),
    sanitization: SanitizationConfig(
      enabled: true,
      hashUserIds: true,
      customPatterns: [RegExp(r'custom-pattern')],
    ),
  ),
);
```

## Log Categories

| Category | Code | Description |
|----------|------|-------------|
| schema | SCH | JSON schema parsing and validation |
| form | FRM | Form rendering, validation, value extraction |
| transform | TRF | Data transformation and mapping |
| condition | CND | Conditional expression evaluation |
| state | STA | State management operations |
| navigation | NAV | Navigation and routing |
| network | NET | API calls and responses |
| sync | SYN | Data synchronization |
| storage | STR | Local storage operations |
| lifecycle | LCY | App lifecycle events |
| general | GEN | General/uncategorized logs |

### Custom Categories

```dart
// Define custom categories in your package
static const validation = LogCategory('validation', 'VAL');
static const flowExecution = LogCategory('flowExecution', 'FLW');
```

## Console Output Formats

### Pretty Format (Development)

```
┌─────────────────────────────────────────────────────────────────
│ 10:30:45.123 [DEBUG] [TRF] Field mapped successfully
│ correlationId: abc-123 | seq: 42 | session: xyz-789
├─────────────────────────────────────────────────────────────────
│ context:
│   path: household.address.locality
│   value: "Bangalore"
└─────────────────────────────────────────────────────────────────
```

### Compact Format (Production)

```
2024-01-15T10:30:45.123Z DBG [TRF] [corr:abc-123] Field mapped {path:household.address.locality}
```

## PII Sanitization

The logger automatically redacts:
- Phone numbers (10-12 digits)
- Aadhaar-like numbers
- PAN-like numbers
- Passwords, tokens, secrets, API keys
- Sensitive context keys (email, dateOfBirth, address, etc.)

```dart
// This is automatically sanitized
DigitLogger.info('User data', context: {
  'name': 'John',           // Kept
  'phone': '9876543210',    // Redacted: ***REDACTED***
  'password': 'secret',     // Redacted: ***REDACTED***
});
```

## Testing

```dart
void main() {
  late MemoryTarget memoryTarget;

  setUp(() async {
    DigitLogger.reset();
    memoryTarget = MemoryTarget();
    await DigitLogger.init(
      config: LogConfig.test(memoryTarget: memoryTarget),
    );
  });

  test('logs error correctly', () {
    DigitLogger.error('Test error');

    expect(memoryTarget.lastEntry?.level, equals(LogLevel.error));
    expect(memoryTarget.lastEntry?.message, equals('Test error'));
  });
}
```

## Health Check

```dart
final health = await DigitLogger.healthCheck();
print('Initialized: ${health.isInitialized}');
print('Total logs: ${health.totalLogsWritten}');
print('Session: ${health.sessionId}');
```

## Cleanup

```dart
// On app shutdown
await DigitLogger.dispose();
```

## Dependencies

- uuid: ^4.0.0
- crypto: ^3.0.0

## License

See LICENSE file.
