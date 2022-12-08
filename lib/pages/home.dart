import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/forms_engine.dart';

import 'package:health_campaigns_flutter/widgets/header/back_navigation_help_header.dart';
import 'package:health_campaigns_flutter/widgets/home/home_item_card.dart';

import '../router/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableContent(
          header: Column(
            children: [
              const BackNavigationHelpHeaderWidget(),
              DigitCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Just 125 more to go',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        children: [
                          const LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 19, 120, 22),
                            ),
                            value: 0.8,
                            minHeight: 7.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Yay! 15 registrations completed',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '200',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                    children: e.map((e) => Expanded(child: e)).toList(),
                  ),
                ),
              )
              .toList(),
        ),
      );

  List<HomeItemCard> _getItems(BuildContext context) {
    final pageName =
        context.watch<FormsBloc>().state.schema?.pages.entries.first.key;

    return [
      HomeItemCard(
        icon: Icons.add_business_rounded,
        label: 'Register',
        onPressed: pageName == null
            ? null
            : () => context.router.push(
                  FormsRoute(
                    pageName: pageName,
                  ),
                ),
      ),
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
        onPressed: () => context.read<FormsBloc>().add(
              const FormsLoadEvent(),
            ),
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
