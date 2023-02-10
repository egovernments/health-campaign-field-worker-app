import 'package:digit_components/digit_components.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/local_store/sql_store/sql_store.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/home/home_item_card.dart';
import '../widgets/localized.dart';
import '../widgets/progress_indicator/progress_indicator.dart';

class HomePage extends LocalizedStatefulWidget {
  const HomePage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends LocalizedState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _getItems(context).elementAt(index),
              childCount: _getItems(context).length,
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 145,
              childAspectRatio: 104 / 128,
            ),
          ),
        ],
        header: Column(
          children: [
            const BackNavigationHelpHeaderWidget(
              showBackNavigation: false,
            ),
            ProgressIndicatorContainer(
              label: localizations.translate(
                i18.home.progressIndicatorTitle,
              ),
              prefixLabel: localizations.translate(
                i18.home.progressIndicatorPrefixLabel,
              ),
              suffixLabel: '200',
              value: .08,
            ),
          ],
        ),
        footer: const PoweredByDigit(),
        children: [
          const SizedBox(height: kPadding * 2),
          DigitInfoCard(
            icon: Icons.info,
            backgroundColor: theme.colorScheme.tertiaryContainer,
            iconColor: theme.colorScheme.surfaceTint,
            description: localizations.translate(i18.home.dataSyncInfoContent),
            title: localizations.translate(i18.home.dataSyncInfoLabel),
          ),
        ],
      ),
    );
  }

  List<HomeItemCard> _getItems(BuildContext context) {
    return [
      HomeItemCard(
        icon: Icons.store_mall_directory,
        label: i18.home.manageStockLabel,
        onPressed: () => context.router.push(ManageStocksRoute()),
      ),
      HomeItemCard(
        icon: Icons.menu_book,
        label: i18.home.reconcileStockLabel,
        onPressed: () => context.router.push(StockReconciliationRoute()),
      ),
      HomeItemCard(
        icon: Icons.menu_book,
        label: i18.home.viewReportsLabel,
        onPressed: null,
      ),
      HomeItemCard(
        icon: Icons.announcement,
        label: i18.home.fileComplaint,
        onPressed: null,
      ),
      HomeItemCard(
        icon: Icons.sync_alt,
        label: i18.home.syncDataLabel,
        onPressed: null,
      ),
      HomeItemCard(
        icon: Icons.call,
        label: i18.home.callbackLabel,
        onPressed: null,
      ),
      HomeItemCard(
        icon: Icons.table_chart,
        label: 'DB',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DriftDbViewer(
                context.read<LocalSqlDataStore>(),
              ),
            ),
          );
        },
      ),
    ];
  }
}
