import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/forms_engine.dart';
import 'package:health_campaigns_flutter/data/static_data.dart';

import 'package:health_campaigns_flutter/widgets/header/back_navigation_help_header.dart';

class HomePage extends StatelessWidget with StaticData {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageName =
        context.watch<FormsBloc>().state.schema?.pages.entries.first.key;
    loadStaticData(context, pageName);

    return BlocBuilder<WalkthroughBloc, WalkthroughState>(
      builder: (context, state) {
        return Scaffold(
          body: ScrollableContent(
            header: Column(
              children: [
                BackNavigationHelpHeaderWidget(
                  helpCallBack: () {
                    DigitCardWalkthrough.show(context);
                  },
                ),
                const Card(child: Placeholder(fallbackHeight: 120)),
              ],
            ),
            footer: const PoweredByDigit(),
            children: _getItems(context, state)
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
      },
    );
  }
}

List<DigitIconCard> _getItems(BuildContext context, WalkthroughState state) {
  return state.walkthroughData.digiticoncards
      .map((e) => DigitIconCard(
            key: GlobalObjectKey(e.widgetKey),
            icon: IconData(e.icon, fontFamily: 'MaterialIcons'),
            label: e.title,
            onPressed: e.callback,
          ))
      .toList();
}
