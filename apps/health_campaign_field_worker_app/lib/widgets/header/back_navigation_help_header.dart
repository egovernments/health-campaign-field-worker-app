import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth.dart';
import '../../blocs/localization/app_localization.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../showcase/showcase_button.dart';

class BackNavigationHelpHeaderWidget extends StatelessWidget {
  final bool showHelp;
  final bool showBackNavigation;
  final bool showLogoutCTA;
  final VoidCallback? helpClicked;
  final VoidCallback? handleback;
  final ShowcaseButton? showcaseButton;

  const BackNavigationHelpHeaderWidget({
    super.key,
    this.showHelp = true,
    this.showBackNavigation = true,
    this.showLogoutCTA = false,
    this.helpClicked,
    this.handleback,
    this.showcaseButton,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                if (context.router.canPop() && showBackNavigation)
                  Flexible(
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.onSurface,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        context.router.maybePop();
                        handleback != null ? handleback!() : null;
                      },
                      icon: const Icon(Icons.arrow_left_sharp),
                      label: Text(
                        AppLocalizations.of(context).translate(
                          i18.common.coreCommonBack,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                SizedBox(width: showBackNavigation ? 16 : 0),
                if (showLogoutCTA)
                  Flexible(
                    child: TextButton.icon(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        context.read<AuthBloc>().add(const AuthLogoutEvent());
                      },
                      icon: const Icon(Icons.logout_outlined),
                      label: Text(
                        AppLocalizations.of(context).translate(
                          i18.common.coreCommonLogout,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: showHelp ? 16 : 0),
          if (showHelp)
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: helpClicked,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      kPadding,
                      kPadding,
                      kPadding / 1,
                      kPadding,
                    ),
                    child: Text(
                      AppLocalizations.of(context)
                          .translate(i18.common.coreCommonHelp),
                      overflow: TextOverflow.ellipsis,
                    ),
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
