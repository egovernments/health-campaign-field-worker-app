import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DigitToast {
  final DigitToastOptions options;

  static FToast ftoast = FToast();

  @visibleForTesting
  DigitToast({
    required this.options,
  });

  static show<T>(
    BuildContext context, {
    required DigitToastOptions options,
  }) {
    ftoast.init(context);
    final theme = Theme.of(context);
    return ftoast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: options.isError
              ? theme.colorScheme.onError
              : theme.colorScheme.surfaceVariant,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(child: Text(options.message)),
          ],
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: DigitTheme.instance.toastDuration,
    );
  }
}

class DigitToastOptions {
  final String message;
  final bool isError;
  const DigitToastOptions(this.message, this.isError);
}
