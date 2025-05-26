import 'package:auto_route/auto_route.dart';
import 'package:delivery/router/delivery_router.gm.dart';
import 'package:delivery/widgets/localized.dart';
import 'package:delivery/widgets/showcase/config/showcase_constants.dart';

import 'package:digit_showcase/showcase_widget.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:flutter/material.dart';
import 'package:delivery/blocs/app_localization.dart';
import 'package:registration/router/registration_router.gm.dart' as reg;
import 'package:delivery/utils/i18_key_constants.dart' as i18;
import 'package:registration/widgets/showcase/config/showcase_constants.dart'
    as reg;

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
              DeliveryLocalization.of(context)
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
      case reg.SearchBeneficiaryRoute.name:
        return searchBeneficiariesShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case reg.HouseholdLocationRoute.name:
        return (widget.isCommunity)
            ? reg.clfLocationShowCaseData.showcaseData.map(
                (e) => e.showcaseKey,
              )
            : reg.householdLocationShowcaseData.showcaseData.map(
                (e) => e.showcaseKey,
              );
      case reg.HouseHoldDetailsRoute.name:
        return (widget.isCommunity)
            ? reg.clfDetailsShowcaseData.showcaseData.map(
                (e) => e.showcaseKey,
              )
            : reg.householdDetailsShowcaseData.showcaseData.map(
                (e) => e.showcaseKey,
              );
      case reg.IndividualDetailsRoute.name:
        return reg.individualDetailsShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case HouseholdOverviewDeliveryRoute.name:
        return reg.householdOverviewShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case DeliverInterventionRoute.name:
        return deliverInterventionShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      default:
        return null;
    }
  }
}
