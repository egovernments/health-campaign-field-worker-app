import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitDialog extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String title;
  final String? submitText;
  final String? cancelText;
  final VoidCallback? onSubmit;
  final VoidCallback? onCancel;

  const DigitDialog({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    required this.title,
    this.cancelText,
    this.onSubmit,
    this.submitText,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      titlePadding: const EdgeInsets.only(
        top: 16,
        bottom: 8,
        left: 8,
        right: 8,
      ),
      title: Text(
        title,
        style: theme.textTheme.headlineLarge,
        textAlign: TextAlign.left,
      ),
      content: child,
      contentPadding: const EdgeInsets.all(8),
      actions: <Widget>[
        (submitText == null || cancelText == null)
            ? DigitElevatedButton(
                onPressed: submitText != null ? onSubmit : onCancel,
                child: Center(
                  child: submitText == null
                      ? Text(cancelText!)
                      : Text(submitText!),
                ))
            : Row(
                children: [
                  TextButton(
                    onPressed: () => onCancel,
                    child: Text(cancelText ?? ''),
                  ),
                  TextButton(
                    onPressed: () => onSubmit,
                    child: Text(
                      submitText ?? '',
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 8)
      ],
    );
  }
}
