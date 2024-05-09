import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';
import '../../blocs/inventory_listener.dart';
import '../../blocs/inventory_report.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';

@RoutePage()
class InventoryReportSelectionPage extends LocalizedStatefulWidget {
  final InventoryListener inventoryListener;
  final String projectId;
  final bool? isDistributor;
  final bool? isWareHouseMgr;
  final String? loggedInUserUuid;

  const InventoryReportSelectionPage({
    required this.inventoryListener,
    required this.projectId,
    required this.isDistributor,
    required this.isWareHouseMgr,
    required this.loggedInUserUuid,
    super.key,
    super.appLocalizations,
  });

  @override
  State<InventoryReportSelectionPage> createState() =>
      _InventoryReportSelectionPageState();
}

class _InventoryReportSelectionPageState
    extends LocalizedState<InventoryReportSelectionPage> {
  @override
  void initState() {
    InventorySingleton().setInitialData(
      inventoryListener: widget.inventoryListener,
      projectId: widget.projectId,
      isDistributor: widget.isDistributor!,
      isWareHouseMgr: widget.isWareHouseMgr!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: const Column(children: [
          BackNavigationHelpHeaderWidget(),
        ]),
        children: [
          BlocProvider<InventoryReportBloc>(
            create: (_) =>
                InventoryReportBloc(inventorySingleton: InventorySingleton()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      kPadding * 2, kPadding, kPadding * 2, kPadding),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      localizations
                          .translate(i18.inventoryReportSelection.label),
                      style: theme.textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Column(children: [
                  DigitListView(
                    title: localizations.translate(
                      i18.inventoryReportSelection.inventoryReportReceiptLabel,
                    ),
                    description: localizations.translate(i18
                        .inventoryReportSelection
                        .inventoryReportReceiptDescription),
                    prefixIcon: Icons.login,
                    sufixIcon: Icons.arrow_circle_right,
                    onPressed: () => context.router.push(
                      InventoryReportDetailsRoute(
                        reportType: InventoryReportType.receipt,
                      ),
                    ),
                  ),
                  DigitListView(
                    title: localizations.translate(
                      i18.inventoryReportSelection.inventoryReportIssuedLabel,
                    ),
                    description: localizations.translate(i18
                        .inventoryReportSelection
                        .inventoryReportIssuedDescription),
                    prefixIcon: Icons.logout,
                    sufixIcon: Icons.arrow_circle_right,
                    onPressed: () => context.router.push(
                      InventoryReportDetailsRoute(
                        reportType: InventoryReportType.dispatch,
                      ),
                    ),
                  ),
                  DigitListView(
                    title: localizations.translate(i18
                        .inventoryReportSelection.inventoryReportReturnedLabel),
                    description: localizations.translate(
                      i18.inventoryReportSelection
                          .inventoryReportReturnedDescription,
                    ),
                    prefixIcon: Icons.settings_backup_restore,
                    sufixIcon: Icons.arrow_circle_right,
                    onPressed: () => context.router.push(
                      InventoryReportDetailsRoute(
                        reportType: InventoryReportType.returned,
                      ),
                    ),
                  ),
                  DigitListView(
                    title: localizations.translate(
                      i18.inventoryReportSelection.inventoryReportDamagedLabel,
                    ),
                    description: localizations.translate(
                      i18.inventoryReportSelection
                          .inventoryReportDamagedDescription,
                    ),
                    prefixIcon: Icons.store,
                    sufixIcon: Icons.arrow_circle_right,
                    onPressed: () => context.router.push(
                      InventoryReportDetailsRoute(
                        reportType: InventoryReportType.damage,
                      ),
                    ),
                  ),
                  DigitListView(
                    title: localizations.translate(
                      i18.inventoryReportSelection.inventoryReportLossLabel,
                    ),
                    description: localizations.translate(
                      i18.inventoryReportSelection
                          .inventoryReportLossDescription,
                    ),
                    prefixIcon: Icons.store,
                    sufixIcon: Icons.arrow_circle_right,
                    onPressed: () => context.router.push(
                      InventoryReportDetailsRoute(
                        reportType: InventoryReportType.loss,
                      ),
                    ),
                  ),
                  DigitListView(
                    title: localizations.translate(
                      i18.inventoryReportSelection
                          .inventoryReportReconciliationLabel,
                    ),
                    description: localizations.translate(
                      i18.inventoryReportSelection
                          .inventoryReportReconciliationDescription,
                    ),
                    prefixIcon: Icons.store,
                    sufixIcon: Icons.arrow_circle_right,
                    onPressed: () => context.router.push(
                      InventoryReportDetailsRoute(
                        reportType: InventoryReportType.reconciliation,
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
