import 'package:flutter/material.dart';

class DigitDialog extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? title;
  final String? submitText;
  final String? cancelText;
  final VoidCallback? onSubmit;
  final VoidCallback? onCancel;

  const DigitDialog(
      {super.key,
      required this.child,
      this.padding,
      this.margin,
      required this.title,
      this.cancelText,
      this.onSubmit,
      this.submitText,
      this.onCancel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      title: Expanded(
        child: Text(
          title!,
          style: theme.textTheme.bodyLarge,
        ),
      ),
      content: child,
      actions: <Widget>[
        TextButton(
          onPressed: () => onCancel,
          child: Text(cancelText ?? ''),
        ),
        TextButton(
          onPressed: () => onSubmit,
          child: Text(submitText ?? ''),
        ),
      ],
    );
  }
}
