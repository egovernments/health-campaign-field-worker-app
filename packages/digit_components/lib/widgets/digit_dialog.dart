import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitDialog extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String title;
  final String primaryText;
  final String? secondaryText;
  final VoidCallback primaryCallback;
  final VoidCallback? secondaryCallback;

  const DigitDialog({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    required this.title,
    required this.primaryText,
    this.secondaryText,
    required this.primaryCallback,
    this.secondaryCallback,
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
        (secondaryCallback == null)
            ? DigitElevatedButton(
                onPressed: primaryCallback,
                child: Center(
                  child: Text(primaryText),
                ))
            : Row(
                children: [
                  TextButton(
                    onPressed: () => secondaryCallback,
                    child: Text(secondaryText ?? ''),
                  ),
                  TextButton(
                    onPressed: () => primaryCallback,
                    child: Text(
                      primaryText,
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 8)
      ],
    );
  }
}
