import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

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
        icon: Icons.all_inbox,
        label: i18.home.beneficiaryLabel,
        onPressed: () => context.router.push(SearchBeneficiaryRoute()),
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
    ];
  }
}
