import 'package:flutter/material.dart';
import 'flow_error_types.dart';

/// Represents a recovery action that can be taken when an error occurs
class RecoveryAction {
  final String id;
  final String label;
  final String description;
  final RecoveryActionType type;
  final VoidCallback action;
  final IconData? icon;
  final bool isDestructive;
  final bool requiresConfirmation;

  RecoveryAction({
    required this.label,
    required this.description,
    required this.type,
    required this.action,
    this.icon,
    this.isDestructive = false,
    this.requiresConfirmation = false,
  }) : id = _generateActionId();

  static String _generateActionId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  /// Convert to map for logging
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'description': description,
      'type': type.name,
      'icon': icon?.codePoint,
      'isDestructive': isDestructive,
      'requiresConfirmation': requiresConfirmation,
    };
  }

  @override
  String toString() {
    return 'RecoveryAction(label: $label, type: ${type.name}, destructive: $isDestructive)';
  }
}

/// Common recovery actions that can be reused
class CommonRecoveryActions {
  static RecoveryAction retry({required VoidCallback onRetry}) {
    return RecoveryAction(
      label: 'Retry',
      description: 'Try the operation again',
      type: RecoveryActionType.retry,
      icon: Icons.refresh,
      action: onRetry,
    );
  }

  static RecoveryAction ignore({required VoidCallback onIgnore}) {
    return RecoveryAction(
      label: 'Skip',
      description: 'Skip this operation and continue',
      type: RecoveryActionType.ignore,
      icon: Icons.skip_next,
      action: onIgnore,
    );
  }

  static RecoveryAction useFallback({required VoidCallback onFallback}) {
    return RecoveryAction(
      label: 'Use Fallback',
      description: 'Use default configuration',
      type: RecoveryActionType.fallback,
      icon: Icons.settings_backup_restore,
      action: onFallback,
    );
  }

  static RecoveryAction resetState({required VoidCallback onReset}) {
    return RecoveryAction(
      label: 'Reset State',
      description: 'Clear current state and restart',
      type: RecoveryActionType.reset,
      icon: Icons.restart_alt,
      action: onReset,
      isDestructive: true,
      requiresConfirmation: true,
    );
  }

  static RecoveryAction goBack({required VoidCallback onGoBack}) {
    return RecoveryAction(
      label: 'Go Back',
      description: 'Return to previous screen',
      type: RecoveryActionType.navigate,
      icon: Icons.arrow_back,
      action: onGoBack,
    );
  }

  static RecoveryAction reportIssue({required VoidCallback onReport}) {
    return RecoveryAction(
      label: 'Report Issue',
      description: 'Send error report to support',
      type: RecoveryActionType.contact,
      icon: Icons.bug_report,
      action: onReport,
    );
  }
}