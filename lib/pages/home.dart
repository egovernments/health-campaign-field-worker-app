import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/forms_engine.dart';
import 'package:health_campaigns_flutter/router/app_router.dart';
import 'package:health_campaigns_flutter/widgets/header/back_navigation_help_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableContent(
          header: Column(
            children: [
              BackNavigationHelpHeaderWidget(
                helpCallBack: () => DigitCardWalkthrough.show(context),
              ),
              const Card(child: Placeholder(fallbackHeight: 120)),
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

  incrementcard(int increment) {
    return increment + 1;
  }

  List<DigitIconCard> _getItems(BuildContext context) {
    final pageName =
        context.watch<FormsBloc>().state.schema?.pages.entries.first.key;

    return [
      DigitIconCard(
        key: const GlobalObjectKey('1'),
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
      const DigitIconCard(
        key: GlobalObjectKey('2'),
        icon: Icons.all_inbox,
        label: 'View Beneficiaries',
        onPressed: null,
      ),
      const DigitIconCard(
        key: GlobalObjectKey('3'),
        icon: Icons.menu_book,
        label: 'View Reports',
        onPressed: null,
      ),
      DigitIconCard(
        key: const GlobalObjectKey('4'),
        icon: Icons.sync_alt,
        label: 'Sync Data',
        onPressed: () => context.read<FormsBloc>().add(
              const FormsLoadEvent(),
            ),
      ),
      const DigitIconCard(
        key: GlobalObjectKey('5'),
        icon: Icons.call,
        label: 'Call Supervisor',
        onPressed: null,
      ),
      const DigitIconCard(
        key: GlobalObjectKey('6'),
        icon: Icons.announcement,
        label: 'File Complaint',
        onPressed: null,
      ),
    ];
  }
}
