import 'package:auto_route/auto_route.dart';
import 'package:closed_household/blocs/app_localization.dart';
import 'package:closed_household/router/closed_household_router.gm.dart';
import 'package:digit_showcase/showcase_widget.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';
import 'config/showcase_constants.dart';

class ShowcaseButton extends LocalizedStatefulWidget {
  final Iterable<GlobalKey>? showcaseFor;

  const ShowcaseButton({super.key, this.showcaseFor});

  @override
  LocalizedState<ShowcaseButton> createState() => _ShowcaseButtonState();
}

class _ShowcaseButtonState extends LocalizedState<ShowcaseButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        if (widget.showcaseFor?.isNotEmpty == true) {
          ShowcaseWidget.of(context).startShowCase(
            widget.showcaseFor!.toList(),
          );

          return;
        }

        final current = context.router.current.name;
        final paths = _showcasePathsForRoute(current);

        if (paths == null) return;
        if (paths.isEmpty) return;

        ShowcaseWidget.of(context).startShowCase(paths.toList());
      },
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              theme.spacerTheme.spacer2,
              theme.spacerTheme.spacer2,
              theme.spacerTheme.spacer2 / 2,
              theme.spacerTheme.spacer2,
            ),
            child: Text(
              ClosedHouseholdLocalization.of(context)
                  .translate(i18.common.coreCommonHelp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.help_outline),
        ],
      ),
    );
  }

  Iterable<GlobalKey>? _showcasePathsForRoute(String routeName) {
    switch (routeName) {
      case ClosedHouseholdDetailsRoute.name:
        return closedHouseholdDetailsShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      default:
        return null;
    }
  }
}
