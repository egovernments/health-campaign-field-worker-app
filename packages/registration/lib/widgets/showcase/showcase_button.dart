import 'package:auto_route/auto_route.dart';
import 'package:digit_showcase/showcase_widget.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:flutter/material.dart';
import 'package:registration/blocs/app_localization.dart';

import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';
import 'config/showcase_constants.dart';

class ShowcaseButton extends LocalizedStatefulWidget {
  final Iterable<GlobalKey>? showcaseFor;
  final bool isCommunity;

  const ShowcaseButton(
      {super.key, this.showcaseFor, required this.isCommunity});

  @override
  LocalizedState<ShowcaseButton> createState() => ShowcaseButtonState();
}

class ShowcaseButtonState extends LocalizedState<ShowcaseButton> {
  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.fromLTRB(
              spacer2,
              spacer2,
              spacer2 / 2,
              spacer2,
            ),
            child: Text(
              RegistrationDeliveryLocalization.of(context)
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
      case SearchBeneficiaryRoute.name:
        return searchBeneficiariesShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case HouseholdLocationRoute.name:
        return (widget.isCommunity)
            ? clfLocationShowCaseData.showcaseData.map(
                (e) => e.showcaseKey,
              )
            : householdLocationShowcaseData.showcaseData.map(
                (e) => e.showcaseKey,
              );
      case HouseHoldDetailsRoute.name:
        return (widget.isCommunity)
            ? clfDetailsShowcaseData.showcaseData.map(
                (e) => e.showcaseKey,
              )
            : householdDetailsShowcaseData.showcaseData.map(
                (e) => e.showcaseKey,
              );
      case IndividualDetailsRoute.name:
        return individualDetailsShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case HouseholdOverviewRoute.name:
        return householdOverviewShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );

      default:
        return null;
    }
  }
}
