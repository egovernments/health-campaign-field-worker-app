import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../blocs/inventory_listener.dart';
import '../blocs/record_stock.dart';
import '../models/entities/inventory_transport_type.dart';
import '../widgets/back_navigation_help_header.dart';

@RoutePage()
class ManageStocksPage extends LocalizedStatefulWidget {
  final InventoryListener inventoryListener;
  final String projectId;
  final String userId;
  final String boundaryName;
  final bool isDistributor;
  final bool isWareHouseMgr;
  final List<InventoryTransportTypes>? transportType;
  const ManageStocksPage({
    super.key,
    super.appLocalizations,
    required this.inventoryListener,
    required this.projectId,
    required this.userId,
    required this.boundaryName,
    required this.isDistributor,
    required this.isWareHouseMgr,
    required this.transportType,
  });

  @override
  State<ManageStocksPage> createState() => _ManageStocksPageState();
}

class _ManageStocksPageState extends LocalizedState<ManageStocksPage> {
  @override
  initState() {
    InventorySingleton().setInitialData(
      inventoryListener: widget.inventoryListener,
      transportTypes: widget.transportType,
      userId: widget.userId,
      projectId: widget.projectId,
      isDistributor: widget.isDistributor,
      isWareHouseMgr: widget.isWareHouseMgr,
      boundaryName: widget.boundaryName,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: const BackNavigationHelpHeaderWidget(),
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
                    localizations.translate(i18.manageStock.label),
                    style: theme.textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Column(children: [
                DigitListView(
                  title: localizations
                      .translate(i18.manageStock.recordStockReceiptLabel),
                  description: localizations
                      .translate(i18.manageStock.recordStockReceiptDescription),
                  prefixIcon: Icons.file_download_outlined,
                  sufixIcon: Icons.arrow_circle_right,
                  onPressed: () {
                    context.router.push(
                      RecordStockWrapperRoute(
                        type: StockRecordEntryType.receipt,
                      ),
                    );
                  },
                ),
                DigitListView(
                    title: localizations
                        .translate(i18.manageStock.recordStockIssuedLabel),
                    description: localizations.translate(
                        i18.manageStock.recordStockIssuedDescription),
                    prefixIcon: Icons.file_upload_outlined,
                    sufixIcon: Icons.arrow_circle_right,
                    onPressed: () => context.router.push(
                          RecordStockWrapperRoute(
                            type: StockRecordEntryType.dispatch,
                          ),
                        )),
                DigitListView(
                    title: localizations
                        .translate(i18.manageStock.recordStockReturnedLabel),
                    description: localizations.translate(
                      i18.manageStock.recordStockReturnedDescription,
                    ),
                    prefixIcon: Icons.settings_backup_restore,
                    sufixIcon: Icons.arrow_circle_right,
                    onPressed: () => context.router.push(
                          RecordStockWrapperRoute(
                            type: StockRecordEntryType.returned,
                          ),
                        )),
                DigitListView(
                    title: localizations
                        .translate(i18.manageStock.recordStockDamagedLabel),
                    description: localizations.translate(
                      i18.manageStock.recordStockDamagedDescription,
                    ),
                    prefixIcon: Icons.store,
                    sufixIcon: Icons.arrow_circle_right,
                    onPressed: () => context.router.push(
                          RecordStockWrapperRoute(
                            type: StockRecordEntryType.damaged,
                          ),
                        )),
                DigitListView(
                    title: localizations
                        .translate(i18.manageStock.recordStockLossLabel),
                    description: localizations.translate(
                      i18.manageStock.recordStockDamagedDescription,
                    ),
                    prefixIcon: Icons.store,
                    sufixIcon: Icons.arrow_circle_right,
                    onPressed: () => context.router.push(
                          RecordStockWrapperRoute(
                            type: StockRecordEntryType.loss,
                          ),
                        )),
              ]),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
