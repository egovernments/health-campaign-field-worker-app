import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../blocs/localization/app_localization.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;

class BackNavigationHelpHeaderWidget extends StatelessWidget {
  final bool showHelp;
  final bool showBackNavigation;
  final bool showLogoutCTA;
  final VoidCallback? helpClicked;

  const BackNavigationHelpHeaderWidget({
    super.key,
    this.showHelp = true,
    this.showBackNavigation = true,
    this.showLogoutCTA = false,
    this.helpClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                if (context.router.canPop() && showBackNavigation)
                  Flexible(
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.onBackground,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () => context.router.pop(),
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
            TextButton.icon(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: helpClicked,
              icon: const Icon(Icons.help_outline_outlined),
              label: Text(
                AppLocalizations.of(context).translate(
                  i18.common.coreCommonHelp,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}
