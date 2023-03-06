import 'package:flutter/material.dart';
import '../../blocs/localization/app_localization.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;

class BackNavigationHelpHeaderWidget extends StatelessWidget {
  final bool showHelp;
  final bool showBackNavigation;

  const BackNavigationHelpHeaderWidget({
    super.key,
    this.showHelp = true,
    this.showBackNavigation = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        if (context.router.canPop() && showBackNavigation) ...[
          const SizedBox(width: 8),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: theme.colorScheme.onBackground,
              padding: EdgeInsets.zero,
            ),
            onPressed: () => context.router.pop(),
            child: Row(
              children: [
                const Icon(Icons.arrow_left_sharp),
                Text(AppLocalizations.of(context)
                    .translate(i18.common.corecommonBack)),
              ],
            ),
          ),
        ],
        const Spacer(),
        if (showHelp) ...[
          TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: null,
            child: Row(
              children: [
                Text(AppLocalizations.of(context)
                    .translate(i18.common.corecommonHelp)),
                const Icon(Icons.help_outline_outlined),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
      ],
    );
  }
}
