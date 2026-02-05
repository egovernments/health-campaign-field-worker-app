import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/i18_key_constants.dart';

/// Error app shown when database encryption key mismatch is detected.
/// This means the database is encrypted with a different key and data cannot be recovered.
class DatabaseErrorApp extends StatefulWidget {
  final Future<void> Function() onRetry;

  const DatabaseErrorApp({super.key, required this.onRetry});

  @override
  State<DatabaseErrorApp> createState() => _DatabaseErrorAppState();
}

class _DatabaseErrorAppState extends State<DatabaseErrorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: DigitTheme.instance.mobileTheme,
      home: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          final textTheme = theme.digitTextTheme(context);

          return Scaffold(
            body: SafeArea(
              child: ScrollableContent(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: theme.colorTheme.alert.error,
                  ),
                  const SizedBox(height: spacer6),
                  Text(
                    const DatabaseError().databaseErrorTitle,
                    style: textTheme.headingL.copyWith(
                      color: theme.colorTheme.text.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: spacer4),
                  Text(
                    const DatabaseError().databaseErrorMessage,
                    style: textTheme.bodyL.copyWith(
                      color: theme.colorTheme.text.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: spacer6),
                  DigitButton(
                    label: const DatabaseError().closeAppButton,
                    type: DigitButtonType.primary,
                    size: DigitButtonSize.medium,
                    capitalizeLetters: false,
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
