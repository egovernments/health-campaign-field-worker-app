import 'package:auto_route/auto_route.dart';
import 'package:closed_household/blocs/app_localization.dart';
import 'package:closed_household/widgets/showcase/showcase_button.dart';
import 'package:digit_ui_components/theme/ComponentTheme/back_button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:flutter/material.dart';

import '../../utils/i18_key_constants.dart' as i18;

class BackNavigationHelpHeaderWidget extends StatelessWidget {
  final bool showHelp;
  final bool showBackNavigation;
  final bool showLogoutCTA;
  final VoidCallback? helpClicked;
  final VoidCallback? handleBack;
  final ShowcaseButton? showcaseButton;

  const BackNavigationHelpHeaderWidget({
    super.key,
    this.showHelp = false, //hiding help
    this.showBackNavigation = true,
    this.showLogoutCTA = false,
    this.helpClicked,
    this.handleBack,
    this.showcaseButton,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all( theme.spacerTheme.spacer2),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                if (showBackNavigation)
                  DigitBackButton(label: ClosedHouseholdLocalization.of(context).translate(
                    i18.common.coreCommonBack,
                  ),
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
          SizedBox(width: showHelp ? theme.spacerTheme.spacer2 * 2 : 0),
          if (showHelp)
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: helpClicked,
              child: Row(
                children: <Widget>[
                  Text(
                    ClosedHouseholdLocalization.of(context)
                        .translate(i18.common.coreCommonHelp),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Icon(
                    Icons.help_outline_outlined,
                  ), // Add the icon to the right
                ],
              ),
            ),
          SizedBox(width: showcaseButton != null ? 16 : 0),
          if (showcaseButton != null) showcaseButton!,
        ],
      ),
    );
  }
}
