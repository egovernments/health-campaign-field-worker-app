import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/home/home_item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableContent(
          header: Column(
            children: const [
              BackNavigationHelpHeaderWidget(),
              Card(child: Placeholder(fallbackHeight: 120)),
            ],
          ),
          footer: const PoweredByDigit(),
          children: _getItems(context)
              .slices(3)
              .map(
                (e) => IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: e.map((e) => Expanded(child: e)).toList(),
                  ),
                ),
              )
              .toList(),
        ),
      );

  List<HomeItemCard> _getItems(BuildContext context) {
    return [
      HomeItemCard(
        icon: Icons.add_business_rounded,
        label: 'Register',
        onPressed: () {},
      ),
      const HomeItemCard(
        icon: Icons.all_inbox,
        label: 'View Beneficiaries',
        onPressed: null,
      ),
      const HomeItemCard(
        icon: Icons.menu_book,
        label: 'View Reports',
        onPressed: null,
      ),
      HomeItemCard(icon: Icons.sync_alt, label: 'Sync Data', onPressed: () {}),
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
