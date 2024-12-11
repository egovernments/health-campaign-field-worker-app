import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/menu_card.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../blocs/record_stock.dart';
import '../widgets/back_navigation_help_header.dart';

@RoutePage()
class ManageStocksPage extends LocalizedStatefulWidget {
  const ManageStocksPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ManageStocksPage> createState() => ManageStocksPageState();
}

class ManageStocksPageState extends LocalizedState<ManageStocksPage> {
  @override
  initState() {
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
                    spacer4, spacer2,  spacer4, spacer2),
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
                MenuCard(
                  heading: localizations
                      .translate(i18.manageStock.recordStockReceiptLabel),
                  description: localizations
                      .translate(i18.manageStock.recordStockReceiptDescription),
                  icon: Icons.file_download_outlined,
                  onTap: () {
                    context.router.push(
                      RecordStockWrapperRoute(
                        type: StockRecordEntryType.receipt,
                      ),
                    );
                  },
                ),
                MenuCard(
                    heading: localizations
                        .translate(i18.manageStock.recordStockIssuedLabel),
                    description: localizations.translate(
                        i18.manageStock.recordStockIssuedDescription),
                    icon: Icons.file_upload_outlined,
                    onTap: () => context.router.push(
                          RecordStockWrapperRoute(
                            type: StockRecordEntryType.dispatch,
                          ),
                        )),
                MenuCard(
                    heading: localizations
                        .translate(i18.manageStock.recordStockReturnedLabel),
                    description: localizations.translate(
                      i18.manageStock.recordStockReturnedDescription,
                    ),
                    icon: Icons.settings_backup_restore,
                    onTap: () => context.router.push(
                          RecordStockWrapperRoute(
                            type: StockRecordEntryType.returned,
                          ),
                        )),
                MenuCard(
                    heading: localizations
                        .translate(i18.manageStock.recordStockDamagedLabel),
                    description: localizations.translate(
                      i18.manageStock.recordStockDamagedDescription,
                    ),
                    icon: Icons.store,
                    onTap: () => context.router.push(
                          RecordStockWrapperRoute(
                            type: StockRecordEntryType.damaged,
                          ),
                        )),
                MenuCard(
                    heading: localizations
                        .translate(i18.manageStock.recordStockLossLabel),
                    description: localizations.translate(
                      i18.manageStock.recordStockDamagedDescription,
                    ),
                    icon: Icons.store,
                    onTap: () => context.router.push(
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
