import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DigitToster {
  final DigitDialogOptions options;

  static FToast ftoast = FToast();

  @visibleForTesting
  DigitToster({
    required this.options,
  });

  static show<T>(
    BuildContext context, {
    required DigitDialogOptions options,
  }) {
    ftoast.init(context);

    return ftoast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: options.isError
              ? DigitTheme.instance.colorScheme.onError
              : DigitTheme.instance.colorScheme.surfaceVariant,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check),
            const SizedBox(
              width: 12.0,
            ),
            Text(options.message),
          ],
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}

class DigitDialogOptions {
  final BuildContext context;
  final String message;
  final bool isError;
  const DigitDialogOptions(this.message, this.isError, {required this.context});
}
