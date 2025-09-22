import '../action_handler/action_config.dart';
import 'flow_error_handler.dart';
import 'models/error_context.dart';
import 'models/flow_error.dart';
import 'models/flow_error_types.dart';

/// Extensions for specialized error capture methods
extension FlowErrorHandlerSpecialized on FlowErrorHandler {
  /// Capture JSON-related errors with detailed path information
  FlowError captureJsonError({
    required String jsonPath,
    required dynamic invalidValue,
    required Map<String, dynamic> fullJson,
    required dynamic error,
    String? expectedType,
    List<String>? validValues,
    StackTrace? stackTrace,
  }) {
    final context = ErrorContext(
      jsonConfig: fullJson,
      jsonPath: jsonPath,
      invalidValue: invalidValue,
      expectedType: expectedType,
      validValues: validValues,
    );

    return captureError(
      error: error,
      type: FlowErrorType.jsonParsing,
      context: context,
      stackTrace: stackTrace,
      metadata: {
        'jsonSize': fullJson.toString().length,
        'pathDepth': jsonPath.split('.').length,
        'configKeys': fullJson.keys.toList(),
      },
    );
  }

  /// Capture widget building errors
  FlowError captureWidgetError({
    required String widgetFormat,
    required Map<String, dynamic> widgetConfig,
    required dynamic error,
    StackTrace? stackTrace,
  }) {
    final context = ErrorContext(
      widgetFormat: widgetFormat,
      widgetConfig: widgetConfig,
      // screenName will be enriched automatically
    );

    return captureError(
      error: error,
      type: _isUnknownWidget(error) ? FlowErrorType.widgetUnknown : FlowErrorType.widgetBuild,
      context: context,
      stackTrace: stackTrace,
      metadata: {
        'configKeys': widgetConfig.keys.toList(),
        'configSize': widgetConfig.toString().length,
      },
    );
  }

  /// Capture action execution errors
  FlowError captureActionError({
    required ActionConfig action,
    required dynamic error,
    required Map<String, dynamic> contextData,
    StackTrace? stackTrace,
  }) {
    final context = ErrorContext(
      actionType: action.actionType,
      actionProperties: action.properties,
      // Additional context will be enriched automatically
    );

    return captureError(
      error: error,
      type: _isUnknownAction(error) ? FlowErrorType.actionUnknown : FlowErrorType.actionExecution,
      context: context,
      stackTrace: stackTrace,
      metadata: {
        'contextDataKeys': contextData.keys.toList(),
        'actionSize': _getActionSize(action),
        'propertiesKeys': action.properties.keys.toList(),
      },
    );
  }

  /// Capture form-related errors
  FlowError captureFormError({
    required String schemaKey,
    required Map<String, dynamic> formData,
    required dynamic error,
    String? fieldName,
    StackTrace? stackTrace,
  }) {
    final context = ErrorContext(
      screenType: 'FORM',
      formData: formData,
      jsonPath: fieldName != null ? 'form.$fieldName' : 'form',
    );

    return captureError(
      error: error,
      type: FlowErrorType.formValidation,
      context: context,
      stackTrace: stackTrace,
      metadata: {
        'schemaKey': schemaKey,
        'formFields': formData.keys.toList(),
        'fieldName': fieldName,
        'formSize': formData.toString().length,
      },
    );
  }

  /// Capture state management errors
  FlowError captureStateError({
    required String screenKey,
    required dynamic error,
    String? operation,
    StackTrace? stackTrace,
  }) {
    final context = ErrorContext(
      screenKey: screenKey,
      // State snapshot will be enriched automatically
    );

    return captureError(
      error: error,
      type: FlowErrorType.stateUpdate,
      context: context,
      stackTrace: stackTrace,
      metadata: {
        'operation': operation,
        'screenKey': screenKey,
      },
    );
  }

  /// Capture interpolation errors
  FlowError captureInterpolationError({
    required String template,
    required String variablePath,
    required dynamic error,
    Map<String, dynamic>? availableData,
    StackTrace? stackTrace,
  }) {
    final context = ErrorContext(
      jsonPath: variablePath,
      invalidValue: template,
      expectedType: 'interpolatable string',
      stateSnapshot: availableData,
    );

    return captureError(
      error: error,
      type: FlowErrorType.interpolation,
      context: context,
      stackTrace: stackTrace,
      metadata: {
        'template': template.length > 200 ? '${template.substring(0, 200)}...' : template,
        'variablePath': variablePath,
        'availableDataKeys': availableData?.keys.toList(),
      },
    );
  }

  /// Capture navigation errors
  FlowError captureNavigationError({
    required String targetScreen,
    required String navigationType,
    required dynamic error,
    Map<String, dynamic>? navigationParams,
    StackTrace? stackTrace,
  }) {
    final context = ErrorContext(
      navigationParams: navigationParams,
      actionType: 'NAVIGATION',
      actionProperties: {
        'type': navigationType,
        'name': targetScreen,
      },
    );

    return captureError(
      error: error,
      type: FlowErrorType.navigationRoute,
      context: context,
      stackTrace: stackTrace,
      metadata: {
        'targetScreen': targetScreen,
        'navigationType': navigationType,
        'paramsKeys': navigationParams?.keys.toList(),
      },
    );
  }

  /// Capture network/API errors
  FlowError captureNetworkError({
    required String endpoint,
    required dynamic error,
    int? statusCode,
    Map<String, dynamic>? requestData,
    StackTrace? stackTrace,
  }) {
    final context = ErrorContext(
      actionType: 'NETWORK_REQUEST',
      actionProperties: {
        'endpoint': endpoint,
        'statusCode': statusCode,
      },
    );

    return captureError(
      error: error,
      type: FlowErrorType.network,
      context: context,
      stackTrace: stackTrace,
      metadata: {
        'endpoint': endpoint,
        'statusCode': statusCode,
        'requestDataKeys': requestData?.keys.toList(),
        'requestSize': requestData?.toString().length,
      },
    );
  }

  /// Check if error indicates unknown widget
  bool _isUnknownWidget(dynamic error) {
    final message = error.toString().toLowerCase();
    return message.contains('unknown widget') ||
           message.contains('widget format') ||
           message.contains('not registered');
  }

  /// Check if error indicates unknown action
  bool _isUnknownAction(dynamic error) {
    final message = error.toString().toLowerCase();
    return message.contains('unknown action') ||
           message.contains('action type') ||
           message.contains('unsupported action');
  }

  /// Get approximate size of ActionConfig for metadata
  int _getActionSize(ActionConfig action) {
    // Create a simple representation to calculate size
    final actionMap = {
      'action': action.action,
      'actionType': action.actionType,
      'properties': action.properties,
      'condition': action.condition,
      'actions': action.actions?.length,
    };
    return actionMap.toString().length;
  }
}