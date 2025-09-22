import 'package:flutter/foundation.dart';

/// Rich context information captured when an error occurs
class ErrorContext {
  // Screen and navigation context
  final String? screenName;
  final String? screenType;  // FORM, TEMPLATE
  final String? screenKey;
  final Map<String, dynamic>? navigationParams;

  // Widget context
  final String? widgetType;
  final String? widgetFormat;
  final Map<String, dynamic>? widgetConfig;

  // Action context
  final String? actionType;
  final Map<String, dynamic>? actionProperties;

  // JSON and configuration context
  final Map<String, dynamic>? jsonConfig;
  final String? jsonPath;           // e.g., "body[0].properties.type"
  final dynamic invalidValue;       // The actual invalid value
  final String? expectedType;       // Expected type/format
  final List<String>? validValues;  // List of valid values if applicable

  // State context
  final Map<String, dynamic>? stateSnapshot;
  final List<String>? stateKeys;
  final Map<String, dynamic>? formData;

  // User and session context
  final String? userId;
  final String? sessionId;
  final String? tenantId;
  final String? projectId;

  // Technical context
  final String? buildMode;          // debug, profile, release
  final String? platform;          // android, ios, web
  final String? appVersion;
  final String? packageVersion;

  const ErrorContext({
    this.screenName,
    this.screenType,
    this.screenKey,
    this.navigationParams,
    this.widgetType,
    this.widgetFormat,
    this.widgetConfig,
    this.actionType,
    this.actionProperties,
    this.jsonConfig,
    this.jsonPath,
    this.invalidValue,
    this.expectedType,
    this.validValues,
    this.stateSnapshot,
    this.stateKeys,
    this.formData,
    this.userId,
    this.sessionId,
    this.tenantId,
    this.projectId,
    this.buildMode,
    this.platform,
    this.appVersion,
    this.packageVersion,
  });

  /// Create a copy with updated values
  ErrorContext copyWith({
    String? screenName,
    String? screenType,
    String? screenKey,
    Map<String, dynamic>? navigationParams,
    String? widgetType,
    String? widgetFormat,
    Map<String, dynamic>? widgetConfig,
    String? actionType,
    Map<String, dynamic>? actionProperties,
    Map<String, dynamic>? jsonConfig,
    String? jsonPath,
    dynamic invalidValue,
    String? expectedType,
    List<String>? validValues,
    Map<String, dynamic>? stateSnapshot,
    List<String>? stateKeys,
    Map<String, dynamic>? formData,
    String? userId,
    String? sessionId,
    String? tenantId,
    String? projectId,
    String? buildMode,
    String? platform,
    String? appVersion,
    String? packageVersion,
  }) {
    return ErrorContext(
      screenName: screenName ?? this.screenName,
      screenType: screenType ?? this.screenType,
      screenKey: screenKey ?? this.screenKey,
      navigationParams: navigationParams ?? this.navigationParams,
      widgetType: widgetType ?? this.widgetType,
      widgetFormat: widgetFormat ?? this.widgetFormat,
      widgetConfig: widgetConfig ?? this.widgetConfig,
      actionType: actionType ?? this.actionType,
      actionProperties: actionProperties ?? this.actionProperties,
      jsonConfig: jsonConfig ?? this.jsonConfig,
      jsonPath: jsonPath ?? this.jsonPath,
      invalidValue: invalidValue ?? this.invalidValue,
      expectedType: expectedType ?? this.expectedType,
      validValues: validValues ?? this.validValues,
      stateSnapshot: stateSnapshot ?? this.stateSnapshot,
      stateKeys: stateKeys ?? this.stateKeys,
      formData: formData ?? this.formData,
      userId: userId ?? this.userId,
      sessionId: sessionId ?? this.sessionId,
      tenantId: tenantId ?? this.tenantId,
      projectId: projectId ?? this.projectId,
      buildMode: buildMode ?? this.buildMode,
      platform: platform ?? this.platform,
      appVersion: appVersion ?? this.appVersion,
      packageVersion: packageVersion ?? this.packageVersion,
    );
  }

  /// Convert to map for logging
  Map<String, dynamic> toMap() {
    return {
      'screen': {
        'name': screenName,
        'type': screenType,
        'key': screenKey,
        'navigationParams': navigationParams,
      },
      'widget': {
        'type': widgetType,
        'format': widgetFormat,
        'configSize': widgetConfig?.toString().length,
        'configKeys': widgetConfig?.keys.toList(),
      },
      'action': {
        'type': actionType,
        'propertiesSize': actionProperties?.toString().length,
        'propertiesKeys': actionProperties?.keys.toList(),
      },
      'json': {
        'path': jsonPath,
        'invalidValue': sanitizeValue(invalidValue),
        'expectedType': expectedType,
        'validValues': validValues,
        'configSize': jsonConfig?.toString().length,
      },
      'state': {
        'keysCount': stateKeys?.length,
        'formDataKeys': formData?.keys.toList(),
        'snapshotKeys': stateSnapshot?.keys.toList(),
      },
      'user': {
        'userId': userId,
        'tenantId': tenantId,
        'projectId': projectId,
        'sessionId': sessionId,
      },
      'technical': {
        'buildMode': buildMode,
        'platform': platform,
        'appVersion': appVersion,
        'packageVersion': packageVersion,
      },
    };
  }

  /// Sanitize sensitive or large values for logging
  static dynamic sanitizeValue(dynamic value) {
    if (value == null) return null;

    final str = value.toString();
    if (str.length > 200) {
      return '${str.substring(0, 200)}... [truncated ${str.length} chars]';
    }
    return str;
  }

  @override
  String toString() {
    return 'ErrorContext(screen: $screenName, widget: $widgetFormat, action: $actionType, jsonPath: $jsonPath)';
  }
}