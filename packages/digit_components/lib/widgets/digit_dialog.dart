import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitDialog extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String title;
  final String primaryActionLabel;
  final String? secondaryActionLabel;
  final VoidCallback primaryAction;
  final VoidCallback? secondaryAction;

  const DigitDialog({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    required this.title,
    required this.primaryActionLabel,
    this.secondaryActionLabel,
    required this.primaryAction,
    this.secondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      titlePadding: theme.dialogTheme.actionsPadding,
      title: Text(
        title,
        style: theme.textTheme.headlineLarge,
        textAlign: TextAlign.left,
      ),
      content: child,
      contentPadding: const EdgeInsets.all(8),
      actions: <Widget>[
        (secondaryAction == null)
            ? DigitElevatedButton(
                onPressed: primaryAction,
                child: Center(
                  child: Text(primaryActionLabel),
                ))
            : Row(
                children: [
                  TextButton(
                    onPressed: secondaryAction,
                    child: Text(secondaryActionLabel ?? ''),
                  ),
                  TextButton(
                    onPressed: primaryAction,
                    child: Text(
                      key: const Key('primary_callback_key'),
                      primaryActionLabel,
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 8)
      ],
    );
  }
}
