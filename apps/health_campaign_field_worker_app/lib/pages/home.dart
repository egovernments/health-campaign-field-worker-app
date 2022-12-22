import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/home/home_item_card.dart';
import '../widgets/progressIndicator/progress_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableContent(
          header: Column(
            children: const [
              BackNavigationHelpHeaderWidget(),
              ProgressIndicatorContainer(
                label: 'Just 125 more to go',
                prefixLabel: 'Yay! 15 registrations completed',
                sufixLabel: '200',
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
      const HomeItemCard(
        icon: Icons.all_inbox,
        label: 'Beneficiaries',
        onPressed: null,
      ),
      const HomeItemCard(
        icon: Icons.menu_book,
        label: 'View Reports',
        onPressed: null,
      ),
      HomeItemCard(
        icon: Icons.sync_alt,
        label: 'Sync Data',
        onPressed: () {},
      ),
      const HomeItemCard(
        icon: Icons.call,
        label: 'Call Supervisor',
        onPressed: null,
      ),
      const HomeItemCard(
        icon: Icons.announcement,
        label: 'File Complaint',
        onPressed: null,
      ),
    ];
  }
}
