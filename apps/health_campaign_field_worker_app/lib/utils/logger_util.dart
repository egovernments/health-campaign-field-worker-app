import 'package:digit_logger/digit_logger.dart';
import 'package:flutter/foundation.dart';

import 'environment_config.dart';

/// Utility class for initializing and configuring DigitLogger.
///
/// Handles:
/// - Building [LogConfig] from environment variables
/// - Initializing the logger with proper configuration
/// - Setting up Flutter framework error capture
///
/// Note: BLoC error capture is handled by [AppBlocObserver].
class LoggerUtil {
  LoggerUtil._();

  static bool _initialized = false;

  /// Initialize the logger with environment-based configuration.
  ///
  /// Must be called after [EnvironmentConfiguration.initialize].
  static Future<void> initialize() async {
    if (_initialized) return;

    final config = _buildConfig();
    await DigitLogger.init(config: config);

    // Capture Flutter framework errors (widget build errors, layout errors, etc.)
    DigitLogger.captureFlutterErrors();

    _initialized = true;

    DigitLogger.info(
      'Logger initialized',
      category: LogCategory.lifecycle,
      context: {
        'minLevel': config.minLevel.name,
        'sanitization': config.sanitization.enabled,
        'releaseMode': kReleaseMode,
      },
    );
  }

  /// Build [LogConfig] from environment variables.
  static LogConfig _buildConfig() {
    final vars = envConfig.variables;
    final minLevel = _parseLogLevel(vars.logMinLevel);
    final enabled = vars.logEnabled;
    final sanitizationEnabled = vars.logSanitizationEnabled;

    final baseConfig = kReleaseMode
        ? LogConfig.production(minLevel: minLevel)
        : LogConfig.development(minLevel: minLevel);

    return baseConfig.copyWith(
      enabled: enabled,
      sanitization: SanitizationConfig(enabled: sanitizationEnabled),
    );
  }

  /// Parse log level string to [LogLevel] enum.
  ///
  /// Valid values: trace, debug, info, warn, error, fatal
  /// Defaults to [LogLevel.info] in release, [LogLevel.debug] in debug.
  static LogLevel _parseLogLevel(String levelStr) {
    switch (levelStr.toLowerCase().trim()) {
      case 'trace':
        return LogLevel.trace;
      case 'debug':
        return LogLevel.debug;
      case 'info':
        return LogLevel.info;
      case 'warn':
      case 'warning':
        return LogLevel.warn;
      case 'error':
        return LogLevel.error;
      case 'fatal':
        return LogLevel.fatal;
      default:
        return kReleaseMode ? LogLevel.info : LogLevel.debug;
    }
  }

  /// Dispose the logger.
  static Future<void> dispose() async {
    if (!_initialized) return;
    await DigitLogger.dispose();
    _initialized = false;
  }
}

