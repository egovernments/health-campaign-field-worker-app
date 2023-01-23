import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final EdgeInsets titlePadding;
  final EdgeInsets contentPadding;
  final String? primaryActionLabel;
  final VoidCallback? primaryAction;
  final String? secondaryActionLabel;
  final VoidCallback? secondaryAction;

  const DigitDialog({
    super.key,
    this.content,
    this.title,
    this.primaryActionLabel,
    this.primaryAction,
    this.titlePadding = const EdgeInsets.fromLTRB(
      kPadding,
      kPadding * 2,
      kPadding,
      kPadding,
    ),
    this.contentPadding = const EdgeInsets.all(kPadding),
    this.secondaryActionLabel,
    this.secondaryAction,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required DigitDialogOptions options,
  }) {
    Widget? title = options.title;
    Widget? content = options.content;

    if (options.titleText != null) {
      title ??= Text(options.titleText!, textAlign: TextAlign.left);
    }

    if (options.contentText != null) {
      content ??= Text(options.contentText!, textAlign: TextAlign.left);
    }

    return showDialog<T>(
      context: context,
      barrierDismissible: options.barrierDismissible,
      barrierColor: options.barrierColor ??
          DigitTheme.instance.colors.black.withOpacity(0.7),
      builder: (context) => DigitDialog(
        title: title,
        content: content,
        primaryActionLabel: options.primaryAction?.label,
        primaryAction: options.primaryAction?.action,
        secondaryActionLabel: options.secondaryAction?.label,
        secondaryAction: options.secondaryAction?.action,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: title,
        content: content,
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          if (primaryActionLabel != null)
            DigitElevatedButton(
              onPressed: primaryAction,
              child: Center(child: Text(primaryActionLabel!)),
            ),
          if (secondaryActionLabel != null)
            TextButton(
              onPressed: secondaryAction,
              child: Center(child: Text(secondaryActionLabel!)),
            ),
        ],
        titlePadding: titlePadding,
        contentPadding: contentPadding,
      );
}

class DigitDialogOptions {
  final EdgeInsets titlePadding;
  final EdgeInsets contentPadding;
  final String? titleText;
  final String? contentText;
  final Widget? title;
  final Widget? content;
  final DigitActionOptions? primaryAction;
  final DigitActionOptions? secondaryAction;
  final bool barrierDismissible;
  final Color? barrierColor;

  const DigitDialogOptions({
    this.titleText,
    this.contentText,
    this.title,
    this.content,
    this.primaryAction,
    this.secondaryAction,
    this.barrierDismissible = false,
    this.titlePadding = const EdgeInsets.all(kPadding),
    this.contentPadding = const EdgeInsets.all(kPadding),
    this.barrierColor,
  });
}

class DigitActionOptions {
  final String label;
  final VoidCallback? action;

  const DigitActionOptions({
    required this.label,
    this.action,
  });
}
