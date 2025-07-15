import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/i18_key_constants.dart' as i18;
import 'localized.dart';

class ErrorScreen extends LocalizedStatefulWidget {
  const ErrorScreen({super.key, super.appLocalizations});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends LocalizedState<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      backgroundColor: theme.colorTheme.paper.primary,
      body: SizedBox(
        width: double.infinity,
        child: Container(
          color: theme.colorTheme.paper.primary,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/svg/error_screen.svg',
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: spacer4),
                Text(
                  localizations.translate(i18.common.coreCommonError),
                  style: textTheme.headingM.copyWith(
                      color: theme.colorTheme.alert.error
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: spacer2),
                Text(
                  localizations.translate(i18.common.coreCommonErrorDescription),
                  style: textTheme.bodyS.copyWith(
                      color: theme.colorTheme.text.primary
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: spacer6),
                if(Navigator.of(context).canPop())
                  DigitButton(
                    size: DigitButtonSize.large,
                    label: localizations.translate(i18.common.coreCommonGoback),
                    type: DigitButtonType.secondary,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}