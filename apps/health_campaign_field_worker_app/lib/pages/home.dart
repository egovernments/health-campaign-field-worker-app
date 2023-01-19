import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../router/app_router.dart';
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
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableContent(
          header: Column(
            children: [
              const BackNavigationHelpHeaderWidget(),
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
          children: _getItems(context)
              .slices(3)
              .map(
                (e) => IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: e
                        .map(
                          (e) => SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
              )
              .toList(),
        ),
      );

  List<HomeItemCard> _getItems(BuildContext context) {
    return [
      HomeItemCard(
        icon: Icons.all_inbox,
        label: i18.home.beneficiaryLabel,
        onPressed: () => context.router.push(const SearchBeneficiaryRoute()),
      ),
      HomeItemCard(
        icon: Icons.menu_book,
        label: i18.home.viewReportsLabel,
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
        icon: Icons.announcement,
        label: i18.home.fileComplaint,
        onPressed: null,
      ),
    ];
  }
}
