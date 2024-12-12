import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/theme/ComponentTheme/back_button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/blocs/app_localization.dart';

import '../../utils/i18_key_constants.dart' as i18;

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
      padding: const EdgeInsets.all(spacer1),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                if (showBackNavigation)
                  DigitBackButton(label: InventoryLocalization.of(context).translate(
                    i18.common.coreCommonBack,
                  ),
                    digitBackButtonThemeData:
                    const DigitBackButtonThemeData().copyWith(
                      context: context,
                      backDigitButtonIcon: Icon(
                        Icons.arrow_left,
                        size:Theme.of(context).spacerTheme.spacer5,
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
          SizedBox(width: showHelp ? spacer2: 0),
          if (showHelp)
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: helpClicked,
              child: Row(
                children: <Widget>[
                  Text(
                    InventoryLocalization.of(context)
                        .translate(i18.common.coreCommonHelp),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Icon(
                    Icons.help_outline_outlined,
                  ), // Add the icon to the right
                ],
              ),
            ),
        ],
      ),
    );
  }
}
