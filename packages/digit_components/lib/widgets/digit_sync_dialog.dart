import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitSyncDialogContent extends StatelessWidget {
  final String label;
  final DigitSyncDialogType type;

  const DigitSyncDialogContent({
    super.key,
    required this.label,
    required this.type,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    Key? key,
    bool barrierDismissible = false,
    required DigitSyncDialogType type,
    required String label,
    DigitDialogActions? primaryAction,
    DigitDialogActions? secondaryAction,
  }) async {
    return DigitDialog.show<T>(
      context,
      options: getDialogOptions(
        type: type,
        label: label,
        primaryAction: primaryAction,
        secondaryAction: secondaryAction,
        barrierDismissible: barrierDismissible,
      ),
    );
  }

  static DigitDialogOptions getDialogOptions({
    required DigitSyncDialogType type,
    required String label,
    DigitDialogActions? primaryAction,
    DigitDialogActions? secondaryAction,
    bool barrierDismissible = false,
  }) {
    final content = DigitSyncDialogContent(
      label: label,
      type: type,
    );

    switch (type) {
      case DigitSyncDialogType.inProgress:
        break;
      case DigitSyncDialogType.complete:
        assert(
          primaryAction != null,
          'Primary Action cannot be null for sync complete dialog',
        );

        break;
      case DigitSyncDialogType.failed:
        assert(
          primaryAction != null,
          'Primary Action cannot be null for sync failed dialog',
        );
        assert(
          secondaryAction != null,
          'Secondary Action cannot be null for sync failed dialog',
        );

        break;
    }

    return DigitSyncDialogOptions(
      content: content,
      primaryAction: primaryAction,
      secondaryAction: secondaryAction,
      barrierDismissible: barrierDismissible,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    IconData icon;
    Color color;
    TextStyle? labelStyle;

    switch (type) {
      case DigitSyncDialogType.inProgress:
        icon = Icons.autorenew;
        color = theme.colorScheme.secondary;
        labelStyle = theme.textTheme.headlineSmall;
        break;
      case DigitSyncDialogType.complete:
        icon = Icons.check_circle_outline;
        color = theme.colorScheme.onSurfaceVariant;
        labelStyle = theme.textTheme.headlineLarge;
        break;
      case DigitSyncDialogType.failed:
        icon = Icons.error_outline;
        color = theme.colorScheme.error;
        labelStyle = theme.textTheme.headlineLarge;
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 32, color: color),
        const SizedBox(height: kPadding * 2),
        Text(label, style: labelStyle?.copyWith(color: color)),
      ],
    );
  }
}

class DigitSyncDialogOptions extends DigitDialogOptions {
  DigitSyncDialogOptions({
    required super.content,
    super.primaryAction,
    super.secondaryAction,
    super.barrierDismissible = false,
    super.contentPadding = const EdgeInsets.fromLTRB(
      kPadding,
      kPadding * 3,
      kPadding,
      kPadding * 2,
    ),
  });
}

enum DigitSyncDialogType { inProgress, complete, failed }
