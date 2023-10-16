import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../../blocs/inventory_report/inventory_report.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

class InventoryReportSelectionPage extends LocalizedStatefulWidget {
  const InventoryReportSelectionPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<InventoryReportSelectionPage> createState() =>
      _InventoryReportSelectionPageState();
}

class _InventoryReportSelectionPageState
    extends LocalizedState<InventoryReportSelectionPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: const Column(children: [
          BackNavigationHelpHeaderWidget(),
        ]),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    localizations.translate(i18.inventoryReportSelection.label),
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
                    i18.inventoryReportSelection.inventoryReportLossDescription,
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
        ],
      ),
    );
  }
}
