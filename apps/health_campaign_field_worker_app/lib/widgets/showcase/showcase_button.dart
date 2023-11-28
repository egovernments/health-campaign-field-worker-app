import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_showcase/showcase_widget.dart';
import 'package:flutter/material.dart';

import '../../blocs/localization/app_localization.dart';
import '../../router/app_router.dart';
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
              kPadding,
              kPadding,
              kPadding / 2,
              kPadding,
            ),
            child: Text(
              AppLocalizations.of(context).translate(i18.common.coreCommonHelp),
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
        return householdLocationShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case HouseHoldDetailsRoute.name:
        return householdDetailsShowcaseData.showcaseData.map(
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
      case DeliverInterventionRoute.name:
        return deliverInterventionShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case ManageStocksRoute.name:
        return selectStockShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case WarehouseDetailsRoute.name:
        return warehouseDetailsShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case StockReconciliationRoute.name:
        return stockReconciliationShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case ChecklistRoute.name:
        return selectChecklistShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case ChecklistBoundaryViewRoute.name:
        return checklistDataShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case ChecklistPreviewRoute.name:
        return checklistListShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case ComplaintTypeRoute.name:
        return complaintTypeShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case ComplaintsDetailsRoute.name:
        return complaintsDetailsShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case ComplaintsInboxRoute.name:
        return complaintsInboxShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      case ComplaintsDetailsViewRoute.name:
        return complaintsDetailsViewShowcaseData.showcaseData.map(
          (e) => e.showcaseKey,
        );
      default:
        return null;
    }
  }
}
