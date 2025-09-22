import 'package:flutter/foundation.dart';
import 'error_context.dart';
import 'flow_error_types.dart';
import 'recovery_action.dart';

/// Main error model for DIGIT Flow Builder
class FlowError {
  // Unique identifier for tracking
  final String id;

  // Basic error information
  final FlowErrorType type;
  final ErrorSeverity severity;
  final ErrorCategory category;
  final String message;
  final String? detailedMessage;
  final DateTime timestamp;

  // Context and debugging information
  final ErrorContext context;
  final StackTrace? stackTrace;
  final Map<String, dynamic>? metadata;

  // Recovery and user assistance
  final List<RecoveryAction>? recoveryActions;
  final String? userFriendlyMessage;
  final String? documentationLink;

  // Tracking and analytics
  final bool isRecoverable;
  final bool isReported;
  final int occurrenceCount;

  FlowError({
    required this.type,
    required this.severity,
    required this.category,
    required this.message,
    required this.context,
    this.detailedMessage,
    this.stackTrace,
    this.metadata,
    this.recoveryActions,
    this.userFriendlyMessage,
    this.documentationLink,
    this.isRecoverable = true,
    this.isReported = false,
    this.occurrenceCount = 1,
  }) : id = _generateErrorId(),
       timestamp = DateTime.now();

  static String _generateErrorId() {
    return '${DateTime.now().millisecondsSinceEpoch}_${_generateRandomString(4)}';
  }

  static String _generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = DateTime.now().millisecondsSinceEpoch;
    return List.generate(length, (index) => chars[(random + index) % chars.length]).join();
  }

  /// Create a copy with updated occurrence count
  FlowError copyWithOccurrence(int newCount) {
    return FlowError(
      type: type,
      severity: severity,
      category: category,
      message: message,
      context: context,
      detailedMessage: detailedMessage,
      stackTrace: stackTrace,
      metadata: metadata,
      recoveryActions: recoveryActions,
      userFriendlyMessage: userFriendlyMessage,
      documentationLink: documentationLink,
      isRecoverable: isRecoverable,
      isReported: isReported,
      occurrenceCount: newCount,
    );
  }

  /// Convert to detailed map for logging
  Map<String, dynamic> toDetailedMap() {
    return {
      'error': {
        'id': id,
        'type': type.name,
        'severity': severity.name,
        'category': category.name,
        'message': message,
        'detailedMessage': detailedMessage,
        'timestamp': timestamp.toIso8601String(),
        'isRecoverable': isRecoverable,
        'occurrenceCount': occurrenceCount,
        'userFriendlyMessage': userFriendlyMessage,
        'documentationLink': documentationLink,
      },
      'context': context.toMap(),
      'metadata': metadata,
      'stackTrace': stackTrace?.toString(),
      'recoveryActions': recoveryActions?.map((action) => action.toMap()).toList(),
    };
  }

  /// Convert to compact map for quick logging
  Map<String, dynamic> toCompactMap() {
    return {
      'id': id,
      'type': type.name,
      'severity': severity.name,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'screen': context.screenName,
      'widget': context.widgetFormat,
      'action': context.actionType,
      'jsonPath': context.jsonPath,
      'occurrenceCount': occurrenceCount,
      'hasRecovery': recoveryActions?.isNotEmpty ?? false,
    };
  }

  /// Get a console-friendly string representation
  String toConsoleString() {
    final buffer = StringBuffer();

    // Header
    buffer.writeln('🔴 FLOW BUILDER ERROR [${severity.name.toUpperCase()}] - ${type.name}');
    buffer.writeln('📋 ID: $id');
    buffer.writeln('⏰ Time: ${timestamp.toLocal()}');
    buffer.writeln('💬 Message: $message');

    if (detailedMessage != null) {
      buffer.writeln('📝 Details: $detailedMessage');
    }

    // Context information
    if (context.screenName != null) {
      buffer.writeln('📱 Screen: ${context.screenName} (${context.screenType})');
    }

    if (context.widgetFormat != null) {
      buffer.writeln('🧩 Widget: ${context.widgetFormat}');
    }

    if (context.actionType != null) {
      buffer.writeln('⚡ Action: ${context.actionType}');
    }

    if (context.jsonPath != null) {
      buffer.writeln('🔍 JSON Path: ${context.jsonPath}');
      if (context.invalidValue != null) {
        buffer.writeln('❌ Invalid Value: ${ErrorContext.sanitizeValue(context.invalidValue)}');
      }
      if (context.expectedType != null) {
        buffer.writeln('✅ Expected: ${context.expectedType}');
      }
    }

    // Recovery actions
    if (recoveryActions?.isNotEmpty == true) {
      buffer.writeln('🔧 Recovery Options:');
      for (final action in recoveryActions!) {
        buffer.writeln('   - ${action.label}: ${action.description}');
      }
    }

    // Occurrence count
    if (occurrenceCount > 1) {
      buffer.writeln('🔢 Occurred $occurrenceCount times');
    }

    // Metadata
    if (metadata?.isNotEmpty == true) {
      buffer.writeln('📊 Metadata:');
      metadata!.forEach((key, value) {
        buffer.writeln('   $key: ${ErrorContext.sanitizeValue(value)}');
      });
    }

    return buffer.toString();
  }

  @override
  String toString() {
    return 'FlowError(id: $id, type: ${type.name}, severity: ${severity.name}, message: $message)';
  }
}