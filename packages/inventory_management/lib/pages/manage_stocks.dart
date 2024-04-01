import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/pages/record_stock/record_stock_wrapper.dart';
import 'package:inventory_management/pages/record_stock/warehouse_details.dart';
import 'package:inventory_management/widgets/component_wrapper/facility_bloc_wrapper.dart';
import 'package:inventory_management/widgets/component_wrapper/product_variant_bloc_wrapper.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../blocs/inventory_listener.dart';
import '../blocs/record_stock.dart';
import '../models/entities/inventory_transport_type.dart';
import '../widgets/back_navigation_help_header.dart';

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
              FacilityBlocWrapper(
                projectId: widget.projectId,
                child: ProductVariantBlocWrapper(
                  projectId: widget.projectId,
                  child: Column(children: [
                    DigitListView(
                      title: localizations
                          .translate(i18.manageStock.recordStockReceiptLabel),
                      description: localizations.translate(
                          i18.manageStock.recordStockReceiptDescription),
                      prefixIcon: Icons.file_download_outlined,
                      sufixIcon: Icons.arrow_circle_right,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RecordStockWrapperPage(
                              type: StockRecordEntryType.receipt,
                              projectId: InventorySingleton().projectId,
                            ),
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
                        onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RecordStockWrapperPage(
                                  type: StockRecordEntryType.dispatch,
                                  projectId: InventorySingleton().projectId,
                                ),
                              ),
                            )),
                    DigitListView(
                        title: localizations.translate(
                            i18.manageStock.recordStockReturnedLabel),
                        description: localizations.translate(
                          i18.manageStock.recordStockReturnedDescription,
                        ),
                        prefixIcon: Icons.settings_backup_restore,
                        sufixIcon: Icons.arrow_circle_right,
                        onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RecordStockWrapperPage(
                                  type: StockRecordEntryType.returned,
                                  projectId: InventorySingleton().projectId,
                                ),
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
                        onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RecordStockWrapperPage(
                                  type: StockRecordEntryType.damaged,
                                  projectId: InventorySingleton().projectId,
                                ),
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
                        onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RecordStockWrapperPage(
                                  type: StockRecordEntryType.loss,
                                  projectId: InventorySingleton().projectId,
                                ),
                              ),
                            )),
                  ]),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
