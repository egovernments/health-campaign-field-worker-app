import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'models/flow_error.dart';
import 'models/error_context.dart';
import 'models/flow_error_types.dart';
import 'models/recovery_action.dart';

/// Main error handler service for DIGIT Flow Builder
class FlowErrorHandler {
  static final FlowErrorHandler _instance = FlowErrorHandler._internal();
  factory FlowErrorHandler() => _instance;
  FlowErrorHandler._internal();

  // Configuration
  bool isEnabled = true;
  bool captureInRelease = false;
  int maxHistorySize = 500;
  Duration errorThrottleDuration = const Duration(seconds: 1);

  // Storage
  final List<FlowError> _errorHistory = [];
  final Map<String, DateTime> _lastErrorTime = {};
  final Map<String, int> _errorCounts = {};

  // Streams
  final _errorStream = StreamController<FlowError>.broadcast();
  final _recoveryStream = StreamController<RecoveryAction>.broadcast();

  // Getters
  Stream<FlowError> get errorStream => _errorStream.stream;
  Stream<RecoveryAction> get recoveryStream => _recoveryStream.stream;
  List<FlowError> get errorHistory => List.unmodifiable(_errorHistory);

  /// Get error statistics
  Map<FlowErrorType, int> get errorStatistics {
    final stats = <FlowErrorType, int>{};
    for (final error in _errorHistory) {
      stats[error.type] = (stats[error.type] ?? 0) + error.occurrenceCount;
    }
    return stats;
  }

  /// Get error statistics by severity
  Map<ErrorSeverity, int> get severityStatistics {
    final stats = <ErrorSeverity, int>{};
    for (final error in _errorHistory) {
      stats[error.severity] = (stats[error.severity] ?? 0) + error.occurrenceCount;
    }
    return stats;
  }

  /// Main error capture method
  FlowError captureError({
    required dynamic error,
    required FlowErrorType type,
    StackTrace? stackTrace,
    ErrorContext? context,
    Map<String, dynamic>? metadata,
    List<RecoveryAction>? recoveryActions,
  }) {
    if (!isEnabled || (!kDebugMode && !captureInRelease)) {
      return _createDummyError(error, type);
    }

    // Throttling check
    final errorKey = _generateErrorKey(error, type, context);
    if (_isThrottled(errorKey)) {
      return _incrementErrorCount(errorKey);
    }

    // Create enriched context
    final enrichedContext = _enrichContext(context);

    // Determine severity and category
    final severity = _determineSeverity(type, error, enrichedContext);
    final category = _determineCategory(type);

    // Generate recovery actions if not provided
    final actions = recoveryActions ?? _generateRecoveryActions(type, error, enrichedContext);

    // Create flow error
    final flowError = FlowError(
      type: type,
      severity: severity,
      category: category,
      message: _extractMessage(error),
      detailedMessage: _generateDetailedMessage(error, enrichedContext),
      context: enrichedContext,
      stackTrace: stackTrace,
      metadata: metadata,
      recoveryActions: actions,
      userFriendlyMessage: _generateUserFriendlyMessage(type, error),
      documentationLink: _getDocumentationLink(type),
    );

    // Store and broadcast
    _addToHistory(flowError);
    _errorStream.add(flowError);

    // Log error to console
    _logErrorToConsole(flowError);

    return flowError;
  }

  /// Check if error should be throttled
  bool _isThrottled(String errorKey) {
    final lastTime = _lastErrorTime[errorKey];
    if (lastTime == null) return false;

    return DateTime.now().difference(lastTime) < errorThrottleDuration;
  }

  /// Increment error count for throttled errors
  FlowError _incrementErrorCount(String errorKey) {
    _errorCounts[errorKey] = (_errorCounts[errorKey] ?? 0) + 1;

    // Find and update the last error of this type
    final lastError = _errorHistory.where((e) => _generateErrorKey(e.message, e.type, e.context) == errorKey).lastOrNull;
    if (lastError != null) {
      final updatedError = lastError.copyWithOccurrence(_errorCounts[errorKey]!);
      final index = _errorHistory.lastIndexWhere((e) => e.id == lastError.id);
      if (index != -1) {
        _errorHistory[index] = updatedError;
      }
      return updatedError;
    }

    return _createDummyError('Throttled error', FlowErrorType.unknown);
  }

  /// Generate unique error key for throttling
  String _generateErrorKey(dynamic error, FlowErrorType type, ErrorContext? context) {
    final message = _extractMessage(error);
    final contextKey = '${context?.screenName}_${context?.widgetFormat}_${context?.actionType}_${context?.jsonPath}';
    return '${type.name}_${message.hashCode}_$contextKey';
  }

  /// Create dummy error for disabled state
  FlowError _createDummyError(dynamic error, FlowErrorType type) {
    return FlowError(
      type: type,
      severity: ErrorSeverity.info,
      category: ErrorCategory.system,
      message: _extractMessage(error),
      context: const ErrorContext(),
    );
  }

  /// Add error to history with size management
  void _addToHistory(FlowError error) {
    final errorKey = _generateErrorKey(error.message, error.type, error.context);
    _lastErrorTime[errorKey] = error.timestamp;
    _errorCounts[errorKey] = error.occurrenceCount;

    _errorHistory.add(error);

    // Manage history size
    if (_errorHistory.length > maxHistorySize) {
      final removeCount = _errorHistory.length - maxHistorySize;
      _errorHistory.removeRange(0, removeCount);
    }
  }

  /// Extract message from various error types
  String _extractMessage(dynamic error) {
    if (error == null) return 'Unknown error occurred';

    if (error is String) return error;
    if (error is Exception) return error.toString();
    if (error is Error) return error.toString();

    return error.toString();
  }

  /// Generate detailed message with context
  String _generateDetailedMessage(dynamic error, ErrorContext context) {
    final buffer = StringBuffer();

    buffer.write(_extractMessage(error));

    if (context.jsonPath != null) {
      buffer.write(' at JSON path: ${context.jsonPath}');
    }

    if (context.invalidValue != null) {
      buffer.write(' (invalid value: ${ErrorContext.sanitizeValue(context.invalidValue)})');
    }

    if (context.widgetFormat != null) {
      buffer.write(' in widget: ${context.widgetFormat}');
    }

    if (context.actionType != null) {
      buffer.write(' during action: ${context.actionType}');
    }

    return buffer.toString();
  }

  /// Generate user-friendly message
  String _generateUserFriendlyMessage(FlowErrorType type, dynamic error) {
    switch (type) {
      case FlowErrorType.jsonParsing:
        return 'Configuration error detected. Please try refreshing the page.';
      case FlowErrorType.widgetUnknown:
        return 'Unknown component encountered. Some content may not display properly.';
      case FlowErrorType.actionExecution:
        return 'Action failed to execute. Please try again.';
      case FlowErrorType.formValidation:
        return 'Form validation failed. Please check your input.';
      case FlowErrorType.navigationRoute:
        return 'Navigation error. Unable to reach the requested page.';
      case FlowErrorType.network:
        return 'Network error. Please check your connection and try again.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }

  /// Get documentation link for error type
  String? _getDocumentationLink(FlowErrorType type) {
    const baseUrl = 'https://docs.digit.org/flow-builder/errors';
    return '$baseUrl/${type.name}';
  }

  /// Determine error severity based on type and context
  ErrorSeverity _determineSeverity(FlowErrorType type, dynamic error, ErrorContext context) {
    switch (type) {
      case FlowErrorType.initialization:
      case FlowErrorType.dependency:
      case FlowErrorType.stateCorruption:
        return ErrorSeverity.critical;

      case FlowErrorType.navigationRoute:
      case FlowErrorType.formSubmission:
      case FlowErrorType.dataPersistence:
        return ErrorSeverity.high;

      case FlowErrorType.widgetBuild:
      case FlowErrorType.actionExecution:
      case FlowErrorType.formValidation:
        return ErrorSeverity.medium;

      case FlowErrorType.widgetUnknown:
      case FlowErrorType.interpolation:
      case FlowErrorType.jsonValidation:
        return ErrorSeverity.low;

      default:
        return ErrorSeverity.medium;
    }
  }

  /// Determine error category based on type
  ErrorCategory _determineCategory(FlowErrorType type) {
    switch (type) {
      case FlowErrorType.formValidation:
      case FlowErrorType.formSubmission:
      case FlowErrorType.navigationRoute:
        return ErrorCategory.userFacing;

      case FlowErrorType.initialization:
      case FlowErrorType.dependency:
      case FlowErrorType.stateCorruption:
        return ErrorCategory.system;

      case FlowErrorType.jsonParsing:
      case FlowErrorType.jsonValidation:
      case FlowErrorType.configurationSchema:
        return ErrorCategory.configuration;

      case FlowErrorType.widgetBuild:
      case FlowErrorType.widgetUnknown:
      case FlowErrorType.interpolation:
        return ErrorCategory.ui;

      case FlowErrorType.dataTransformation:
      case FlowErrorType.dataPersistence:
      case FlowErrorType.dataRetrieval:
        return ErrorCategory.data;

      default:
        return ErrorCategory.developer;
    }
  }

  /// Generate basic recovery actions
  List<RecoveryAction> _generateRecoveryActions(FlowErrorType type, dynamic error, ErrorContext context) {
    final actions = <RecoveryAction>[];

    // Add type-specific recovery actions
    switch (type) {
      case FlowErrorType.jsonParsing:
      case FlowErrorType.jsonValidation:
      case FlowErrorType.configurationSchema:
        actions.add(CommonRecoveryActions.useFallback(onFallback: () {
          debugPrint('🔧 Using fallback configuration for ${context.screenName}');
        }));
        break;

      case FlowErrorType.widgetBuild:
      case FlowErrorType.widgetUnknown:
      case FlowErrorType.widgetProperty:
        actions.add(CommonRecoveryActions.ignore(onIgnore: () {
          debugPrint('🔧 Skipping problematic widget: ${context.widgetFormat}');
        }));
        break;

      case FlowErrorType.actionExecution:
      case FlowErrorType.actionUnknown:
      case FlowErrorType.actionConfiguration:
        actions.add(CommonRecoveryActions.retry(onRetry: () {
          debugPrint('🔧 Retrying action: ${context.actionType}');
        }));
        break;

      case FlowErrorType.stateUpdate:
      case FlowErrorType.stateAccess:
      case FlowErrorType.stateCorruption:
        actions.add(CommonRecoveryActions.resetState(onReset: () {
          debugPrint('🔧 Resetting state for: ${context.screenKey}');
        }));
        break;

      case FlowErrorType.formValidation:
      case FlowErrorType.formSubmission:
      case FlowErrorType.formSchema:
        actions.add(CommonRecoveryActions.retry(onRetry: () {
          debugPrint('🔧 Retrying form operation');
        }));
        break;

      case FlowErrorType.dataTransformation:
      case FlowErrorType.dataPersistence:
      case FlowErrorType.dataRetrieval:
        actions.add(CommonRecoveryActions.retry(onRetry: () {
          debugPrint('🔧 Retrying data operation');
        }));
        actions.add(CommonRecoveryActions.useFallback(onFallback: () {
          debugPrint('🔧 Using fallback data configuration');
        }));
        break;

      case FlowErrorType.navigationRoute:
      case FlowErrorType.navigationParams:
        actions.add(CommonRecoveryActions.goBack(onGoBack: () {
          debugPrint('🔧 Going back due to navigation error');
        }));
        break;

      case FlowErrorType.interpolation:
      case FlowErrorType.templateSyntax:
        actions.add(CommonRecoveryActions.useFallback(onFallback: () {
          debugPrint('🔧 Using fallback template');
        }));
        break;

      case FlowErrorType.initialization:
      case FlowErrorType.dependency:
        actions.add(RecoveryAction(
          label: 'Reload App',
          description: 'Restart the application to fix initialization issues',
          type: RecoveryActionType.reload,
          icon: Icons.restart_alt,
          action: () {
            debugPrint('🔧 Reloading app due to initialization error');
          },
        ));
        break;

      case FlowErrorType.network:
        actions.add(CommonRecoveryActions.retry(onRetry: () {
          debugPrint('🔧 Retrying network request');
        }));
        break;

      case FlowErrorType.unknown:
        // No specific recovery actions for unknown errors
        break;
    }

    // Add common recovery actions
    actions.add(CommonRecoveryActions.reportIssue(onReport: () {
      debugPrint('🔧 Reporting issue: ${error.toString()}');
    }));

    return actions;
  }

  /// Enrich context with automatic information
  ErrorContext _enrichContext(ErrorContext? baseContext) {
    return ErrorContext(
      // Preserve existing context
      screenName: baseContext?.screenName,
      screenType: baseContext?.screenType,
      screenKey: baseContext?.screenKey,
      navigationParams: baseContext?.navigationParams,
      widgetType: baseContext?.widgetType,
      widgetFormat: baseContext?.widgetFormat,
      widgetConfig: baseContext?.widgetConfig,
      actionType: baseContext?.actionType,
      actionProperties: baseContext?.actionProperties,
      jsonConfig: baseContext?.jsonConfig,
      jsonPath: baseContext?.jsonPath,
      invalidValue: baseContext?.invalidValue,
      expectedType: baseContext?.expectedType,
      validValues: baseContext?.validValues,
      stateSnapshot: baseContext?.stateSnapshot,
      stateKeys: baseContext?.stateKeys,
      formData: baseContext?.formData,
      userId: baseContext?.userId,
      sessionId: baseContext?.sessionId,
      tenantId: baseContext?.tenantId,
      projectId: baseContext?.projectId,

      // Add technical context automatically
      buildMode: kDebugMode ? 'debug' : kProfileMode ? 'profile' : 'release',
      platform: _getPlatformString(),
      appVersion: 'unknown', // Will be enhanced later
      packageVersion: '1.0.0', // Will be enhanced later
    );
  }

  /// Get platform string
  String _getPlatformString() {
    if (kIsWeb) return 'web';
    try {
      if (Platform.isAndroid) return 'android';
      if (Platform.isIOS) return 'ios';
      if (Platform.isMacOS) return 'macos';
      if (Platform.isWindows) return 'windows';
      if (Platform.isLinux) return 'linux';
    } catch (e) {
      // Platform not available in some contexts
    }
    return 'unknown';
  }

  /// Log error to console with formatted output
  void _logErrorToConsole(FlowError error) {
    // Use different colors based on severity
    switch (error.severity) {
      case ErrorSeverity.critical:
        debugPrint('\x1B[41m\x1B[97m${error.toConsoleString()}\x1B[0m'); // Red background
        break;
      case ErrorSeverity.high:
        debugPrint('\x1B[31m${error.toConsoleString()}\x1B[0m'); // Red text
        break;
      case ErrorSeverity.medium:
        debugPrint('\x1B[33m${error.toConsoleString()}\x1B[0m'); // Yellow text
        break;
      case ErrorSeverity.low:
        debugPrint('\x1B[36m${error.toConsoleString()}\x1B[0m'); // Cyan text
        break;
      default:
        debugPrint(error.toConsoleString());
    }
  }

  /// Clear all error history
  void clearHistory() {
    _errorHistory.clear();
    _lastErrorTime.clear();
    _errorCounts.clear();
  }

  /// Dispose resources
  void dispose() {
    _errorStream.close();
    _recoveryStream.close();
  }
}