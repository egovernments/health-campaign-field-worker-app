import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/back_button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:flutter/material.dart';

class BackNavigationHelpHeaderWidget extends StatelessWidget {
  final bool showHelp;
  final bool showBackNavigation;
  final bool showLogoutCTA;
  final VoidCallback? helpClicked;
  final VoidCallback? handleBack;

  const BackNavigationHelpHeaderWidget({
    super.key,
    this.showHelp = false, //hiding help
    this.showBackNavigation = true,
    this.showLogoutCTA = false,
    this.helpClicked,
    this.handleBack,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: spacer2, top: spacer4),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                if (showBackNavigation)
                  DigitBackButton(
                    label:
                    'back',
                    digitBackButtonThemeData:
                    const DigitBackButtonThemeData().copyWith(
                      context: context,
                      backDigitButtonIcon: Icon(
                        Icons.arrow_left,
                        size: MediaQuery.of(context).size.width < 500
                            ? Theme.of(context).spacerTheme.spacer5
                            : Theme.of(context).spacerTheme.spacer6,
                        color: Theme.of(context).colorTheme.primary.primary2,
                      ),
                    ),
                    handleBack: () {
                      context.router.maybePop();
                      handleBack != null ? handleBack!() : null;
                    },
                  )
              ],
            ),
          ),
          SizedBox(width: showHelp ? spacer2 * 2 : 0),
          // if (showHelp)
          //   DigitButton(
          //     label: RegistrationDeliveryLocalization.of(context)
          //         .translate(i18.common.coreCommonHelp),
          //     type: DigitButtonType.tertiary,
          //     size: DigitButtonSize.small,
          //     suffixIcon: Icons.help_outline_outlined,
          //     onPressed: () => helpClicked,
          //   ),
          // SizedBox(width: showcaseButton != null && showHelp ? 16 : 0),
          // if (showcaseButton != null && showHelp) showcaseButton!,
        ],
      ),
    );
  }
}
