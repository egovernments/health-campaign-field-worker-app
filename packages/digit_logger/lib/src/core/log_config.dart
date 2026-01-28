import '../formatters/compact_formatter.dart';
import '../formatters/log_formatter.dart';
import '../formatters/pretty_formatter.dart';
import '../sanitization/sanitization_config.dart';
import '../storage/log_storage.dart';
import '../storage/memory_storage.dart';
import '../targets/console_target.dart';
import '../targets/log_target.dart';
import '../targets/memory_target.dart';
import 'log_level.dart';

/// Configuration for the DigitLogger.
///
/// Use the factory constructors for common configurations:
/// - [LogConfig.development] for local development
/// - [LogConfig.production] for production builds
/// - [LogConfig.test] for unit tests
class LogConfig {
  /// Whether logging is enabled.
  final bool enabled;

  /// Minimum level to log (logs below this level are ignored).
  final LogLevel minLevel;

  /// Whether to enable console output.
  final bool enableConsole;

  /// Whether to enable persistent storage.
  final bool enableStorage;

  /// List of log targets to write to.
  final List<LogTarget> targets;

  /// Storage implementation for persistent logs.
  final LogStorage? storage;

  /// Formatter for console output.
  final LogFormatter formatter;

  /// Sanitization configuration for PII protection.
  final SanitizationConfig sanitization;

  /// User ID to include in all logs (will be sanitized if configured).
  final String? userId;

  const LogConfig({
    this.enabled = true,
    this.minLevel = LogLevel.info,
    this.enableConsole = true,
    this.enableStorage = false,
    this.targets = const [],
    this.storage,
    required this.formatter,
    required this.sanitization,
    this.userId,
  });

  /// Development configuration with verbose output.
  ///
  /// - Logs from trace level
  /// - Pretty-printed console output
  /// - Sanitization disabled for easier debugging
  /// - No persistent storage
  factory LogConfig.development({
    LogLevel minLevel = LogLevel.trace,
    String? userId,
  }) {
    final consoleTarget = ConsoleTarget(formatter: const PrettyFormatter());
    return LogConfig(
      enabled: true,
      minLevel: minLevel,
      enableConsole: true,
      enableStorage: false,
      targets: [consoleTarget],
      formatter: const PrettyFormatter(),
      sanitization: const SanitizationConfig(enabled: false),
      userId: userId,
    );
  }

  /// Production configuration with minimal output.
  ///
  /// - Logs from info level
  /// - Compact console output
  /// - Sanitization enabled
  /// - Storage enabled (requires storage implementation)
  factory LogConfig.production({
    LogLevel minLevel = LogLevel.info,
    LogStorage? storage,
    String? userId,
  }) {
    final consoleTarget = ConsoleTarget(formatter: const CompactFormatter());
    return LogConfig(
      enabled: true,
      minLevel: minLevel,
      enableConsole: true,
      enableStorage: storage != null,
      targets: [consoleTarget],
      storage: storage,
      formatter: const CompactFormatter(),
      sanitization: const SanitizationConfig(enabled: true),
      userId: userId,
    );
  }

  /// Test configuration for unit tests.
  ///
  /// - Logs from trace level
  /// - Console output disabled
  /// - Sanitization disabled
  /// - Uses in-memory storage and target for assertions
  factory LogConfig.test({
    LogLevel minLevel = LogLevel.trace,
    MemoryTarget? memoryTarget,
    MemoryStorage? memoryStorage,
  }) {
    final target = memoryTarget ?? MemoryTarget();
    final storage = memoryStorage ?? MemoryStorage();
    return LogConfig(
      enabled: true,
      minLevel: minLevel,
      enableConsole: false,
      enableStorage: true,
      targets: [target],
      storage: storage,
      formatter: const CompactFormatter(),
      sanitization: const SanitizationConfig(enabled: false),
    );
  }

  /// Creates a copy with the given fields replaced.
  LogConfig copyWith({
    bool? enabled,
    LogLevel? minLevel,
    bool? enableConsole,
    bool? enableStorage,
    List<LogTarget>? targets,
    LogStorage? storage,
    LogFormatter? formatter,
    SanitizationConfig? sanitization,
    String? userId,
  }) {
    return LogConfig(
      enabled: enabled ?? this.enabled,
      minLevel: minLevel ?? this.minLevel,
      enableConsole: enableConsole ?? this.enableConsole,
      enableStorage: enableStorage ?? this.enableStorage,
      targets: targets ?? this.targets,
      storage: storage ?? this.storage,
      formatter: formatter ?? this.formatter,
      sanitization: sanitization ?? this.sanitization,
      userId: userId ?? this.userId,
    );
  }
}
