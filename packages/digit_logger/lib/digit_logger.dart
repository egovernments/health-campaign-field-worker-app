/// A lightweight, offline-first logging package for Flutter applications
/// with JSON-driven architectures.
///
/// ## Quick Start
///
/// ```dart
/// import 'package:digit_logger/digit_logger.dart';
///
/// void main() {
///   // Optional: Wrap app with error capture
///   DigitLogger.runGuarded(() async {
///     // Initialize logger
///     await DigitLogger.init(config: LogConfig.development());
///
///     // Capture Flutter framework errors
///     DigitLogger.captureFlutterErrors();
///
///     runApp(MyApp());
///   });
/// }
/// ```
///
/// ## Logging
///
/// ```dart
/// // Basic logging
/// DigitLogger.info('User logged in');
/// DigitLogger.warn('Retry attempt', context: {'attempt': 2});
/// DigitLogger.error('Failed to save', error: e, stackTrace: stack);
///
/// // Category-scoped logging
/// DigitLogger.schema.debug('Parsing schema');
/// DigitLogger.network.error('API call failed');
///
/// // Operation-scoped logging
/// final log = DigitLogger.scope(operation: 'syncData');
/// log.info('Starting sync');
/// log.info('Sync complete'); // Same correlation ID
/// ```
///
/// ## Auto-Capture
///
/// ```dart
/// // BLoC errors
/// Bloc.observer = DigitBlocObserver();
///
/// // Future errors
/// await api.getData().logged('fetch data');
/// ```
library digit_logger;

// Core
export 'src/core/log_category.dart';
export 'src/core/log_config.dart';
export 'src/core/log_entry.dart';
export 'src/core/log_filter.dart';
export 'src/core/log_level.dart';
export 'src/core/log_limits.dart';
export 'src/core/logger.dart';

// Loggers
export 'src/loggers/category_logger.dart';
export 'src/loggers/scoped_logger.dart';

// Targets
export 'src/targets/console_target.dart';
export 'src/targets/log_target.dart';
export 'src/targets/memory_target.dart';

// Storage
export 'src/storage/log_storage.dart';
export 'src/storage/memory_storage.dart';

// Formatters
export 'src/formatters/compact_formatter.dart';
export 'src/formatters/log_formatter.dart';
export 'src/formatters/pretty_formatter.dart';

// Sanitization
export 'src/sanitization/log_sanitizer.dart';
export 'src/sanitization/sanitization_config.dart';

// Correlation
export 'src/correlation/correlation_context.dart';

// Session
export 'src/session/session_manager.dart';

// Capture
export 'src/capture/digit_bloc_observer.dart';
export 'src/capture/logged_future.dart';

// Utils
export 'src/utils/health_check.dart';
export 'src/utils/pre_init_buffer.dart';
