import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../blocs/app_localization.dart';

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
    final textTheme = theme.digitTextTheme(context);

    return Padding(
      padding: EdgeInsets.all(theme.spacerTheme.spacer2 / 2),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                if (showBackNavigation)
                  Flexible(
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorTheme.primary.primary2,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        context.router.maybePop();
                        handleBack != null ? handleBack!() : null;
                      },
                      icon: const Icon(Icons.arrow_left_sharp),
                      label: Text(
                        ReferralReconLocalization.of(context).translate(
                          i18.common.coreCommonBack,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
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
                    ReferralReconLocalization.of(context)
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
