import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

class ManageStocksPage extends LocalizedStatefulWidget {
  const ManageStocksPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ManageStocksPage> createState() => _ManageStocksPageState();
}

class _ManageStocksPageState extends LocalizedState<ManageStocksPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: Column(children: const [
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
                    localizations.translate('Manage Stocks'),
                    style: theme.textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Column(children: [
                DigitListView(
                  title: 'Record Stock Receipt',
                  description:
                      'Create records for stock received at the warehouse',
                  prefixIcon: Icons.login,
                  sufixIcon: Icons.arrow_circle_right,
                  onPressed: () => context.router.push(WarehouseDetailsRoute()),
                ),
                const DigitListView(
                  title: 'Record Stock Issued',
                  description:
                      'Create records for stock sent out from the warehouse',
                  prefixIcon: Icons.logout,
                  sufixIcon: Icons.arrow_circle_right,
                ),
                const DigitListView(
                  title: 'Stock Returned',
                  description:
                      'Create records for the stock returned to the warehouse',
                  prefixIcon: Icons.settings_backup_restore,
                  sufixIcon: Icons.arrow_circle_right,
                ),
                const DigitListView(
                  title: 'Stock Damaged',
                  description:
                      'Record the list of resources damaged during campaign operations',
                  prefixIcon: Icons.store,
                  sufixIcon: Icons.arrow_circle_right,
                ),
                const DigitListView(
                  title: 'Stock Loss',
                  description:
                      'Record the list of resources lost during campaign operations',
                  prefixIcon: Icons.store,
                  sufixIcon: Icons.arrow_circle_right,
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
