import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/pages/reports/report_details.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';
import '../../blocs/inventory_listener.dart';
import '../../blocs/inventory_report.dart';
import '../../widgets/back_navigation_help_header.dart';

class InventoryReportSelectionPage extends LocalizedStatefulWidget {
  const InventoryReportSelectionPage({
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
                padding: const EdgeInsets.fromLTRB(
                    kPadding * 2, kPadding, kPadding * 2, kPadding),
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InventoryReportDetailsPage(
                                isDistributor: false,
                                reportType: InventoryReportType.receipt,
                                projectId: InventorySingleton().projectId,
                              ))),
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InventoryReportDetailsPage(
                                isDistributor: false,
                                reportType: InventoryReportType.dispatch,
                                projectId: InventorySingleton().projectId,
                              ))),
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InventoryReportDetailsPage(
                                isDistributor: false,
                                reportType: InventoryReportType.returned,
                                projectId: InventorySingleton().projectId,
                              ))),
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InventoryReportDetailsPage(
                                isDistributor: false,
                                reportType: InventoryReportType.damage,
                                projectId: InventorySingleton().projectId,
                              ))),
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InventoryReportDetailsPage(
                                isDistributor: false,
                                reportType: InventoryReportType.loss,
                                projectId: InventorySingleton().projectId,
                              ))),
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InventoryReportDetailsPage(
                                isDistributor: false,
                                reportType: InventoryReportType.reconciliation,
                                projectId: InventorySingleton().projectId,
                              ))),
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
