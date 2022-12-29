import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_info.dart';
import 'package:digit_components/widgets/digit_outline_button.dart';
import 'package:digit_components/widgets/digit_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../blocs/table_hide_action.dart';
import '../widgets/benificiary/benificiary_card.dart';
import '../widgets/benificiary/benificiary_inbox_card.dart';
import '../widgets/header/back_navigation_help_header.dart';

class SearchBenificiaryPage extends StatelessWidget {
  const SearchBenificiaryPage({super.key});

  Widget getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  List<Widget> getTitleWidget() {
    return [
      getTitleItemWidget('Beneficiary', 140),
      getTitleItemWidget('Status', 140),
      getTitleItemWidget('Age', 140),
      getTitleItemWidget('Gender', 140),
    ];
  }

  Widget generateFirstColumnRow(BuildContext context, int index) {
    return DigitTableItem(
      content: 'Jose',
      index: index,
      width: 140,
    );
  }

  Widget generateRightHandSideColumnRow(BuildContext context, int index) {
    final theme = Theme.of(context);

    return Row(
      children: <Widget>[
        DigitTableItem(
          content: '',
          index: index,
          isColored: true,
          width: 140,
          child: const Text(
            'Delivered',
            style: TextStyle(color: Colors.green),
          ),
        ),
        DigitTableItem(
          content: '45',
          index: index,
          isColored: true,
          width: 140,
        ),
        DigitTableItem(
          content: 'Male',
          index: index,
          isColored: true,
          width: 140,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        body: ScrollableContent(
          header: Column(children: const [
            BackNavigationHelpHeaderWidget(),
          ]),
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'List of Households',
                  style: theme.textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const BenificiaryInboxCard(
              firstInbox: '535',
              firstInboxContent: 'No. of Households Registered',
              secondInbox: '756',
              secondInboxContent: 'No. of Bedets Delivered',
            ),
            const DigitSearchBar(),
            DigitCard(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BenificiaryCard(
                        description: '219 / Pemba (200mts)',
                        subtitle: '4 Members',
                        status: 'Delivered',
                        title: 'Jose Antonio',
                      ),
                      OutLineButton(
                        label: 'Open',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  BlocBuilder<TableHideActionBloc, TableHideActionState>(
                    builder: (context, state) => state.isOpen
                        ? DigitTable(
                            generateFirstColumnRow: generateFirstColumnRow,
                            generateRightHandSideColumnRow:
                                generateRightHandSideColumnRow,
                            getTitleWidget: getTitleWidget,
                            itemCount: 3,
                            height: 200,
                            leftHandSideColumnWidth: 120,
                            rightHandSideColumnWidth: 150 * 3,
                          )
                        : const SizedBox(
                            width: 0,
                            height: 0,
                          ),
                  ),
                  BlocBuilder<TableHideActionBloc, TableHideActionState>(
                    builder: (context, state) => Transform.rotate(
                      angle: state.isOpen
                          ? (90 * math.pi / 180)
                          : 270 * math.pi / 180,
                      child: Container(
                        height: 24,
                        margin: const EdgeInsets.all(4),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 16,
                          ),
                          onPressed: () => context
                              .read<TableHideActionBloc>()
                              .add(const TableHideActionEvent.onupdateAction()),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DigitInfo(
              icon: Icons.info,
              backgroundcolor: theme.colorScheme.tertiaryContainer,
              iconcolor: theme.colorScheme.scrim,
              description:
                  'Click on Register New Household button to add details.',
              title: 'Match not found!',
            ),
          ],
        ),
        bottomNavigationBar: !isKeyboardVisible
            ? const SizedBox(
                height: 90,
                child: DigitCard(
                  child: DigitElevatedButton(
                    onPressed: null,
                    child: Center(
                      child: Text(
                        'Register New Household',
                      ),
                    ),
                  ),
                ),
              )
            : null,
      );
    });
  }
}
