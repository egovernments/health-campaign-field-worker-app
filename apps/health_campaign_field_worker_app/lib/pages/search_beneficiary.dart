import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../blocs/table_hide_action.dart';
import '../models/beneficiary_statistics/beneficiary_statistics_model.dart';
import '../widgets/beneficiary/beneficiary_card.dart';
import '../widgets/beneficiary/beneficiary_ statistics_card.dart';
import '../widgets/header/back_navigation_help_header.dart';

class SearchBeneficiaryPage extends StatelessWidget {
  const SearchBeneficiaryPage({super.key});

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
            const BeneficiaryStatisticsCard(
              beneficiaryStatistics:
                  BeneficiaryStatisticsWrapperModel(beneficiaryStatisticsList: [
                BeneficiaryStatisticsModel(
                  title: '535',
                  content: 'No. of Households Registered',
                ),
                BeneficiaryStatisticsModel(
                  title: '756',
                  content: 'No. of Bedets Delivered',
                ),
              ]),
            ),
            const DigitSearchBar(
              hintText: 'Enter the name of household head',
            ),
            DigitCard(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BeneficiaryCard(
                        description: '219 / Pemba (200mts)',
                        subtitle: '4 Members',
                        status: 'Delivered',
                        title: 'Jose Antonio',
                      ),
                      DigitOutLineButton(
                        label: 'Open',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  BlocBuilder<TableHideActionBloc, TableHideActionState>(
                    builder: (context, state) => Offstage(
                      offstage: state.isOpen,
                      child: DigitTable(
                        generateFirstColumnRow: generateFirstColumnRow,
                        generateRightHandSideColumnRow:
                            generateRightHandSideColumnRow,
                        getTitleWidget: _getTitleWidget,
                        itemCount: 3,
                        height: 200,
                        leftHandSideColumnWidth: 120,
                        rightHandSideColumnWidth: 150 * 3,
                      ),
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
            DigitInfoCard(
              icon: Icons.info,
              backgroundcolor: theme.colorScheme.tertiaryContainer,
              iconcolor: theme.colorScheme.surfaceTint,
              description:
                  'Click on Register New Household button to add details.',
              title: 'Match not found!',
            ),
          ],
        ),
        bottomNavigationBar: Offstage(
          offstage: isKeyboardVisible,
          child: const SizedBox(
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
          ),
        ),
      );
    });
  }

  Widget _getTitleItemWidget(String label, double width) {
    return DigitTableItemTitle(
      label: label,
      width: width,
      height: 56,
    );
  }

  List<Widget> _getTitleWidget() {
    // This Data will be replaced once we get the data from API
    return [
      _getTitleItemWidget('Beneficiary', 140),
      _getTitleItemWidget('Status', 140),
      _getTitleItemWidget('Age', 140),
      _getTitleItemWidget('Gender', 140),
    ];
  }

  Widget generateFirstColumnRow(BuildContext context, int index) {
    // This Data will be replaced once we get the data from API
    return DigitTableItem(
      content: 'Jose',
      index: index,
      width: 140,
    );
  }

  Widget generateRightHandSideColumnRow(BuildContext context, int index) {
    final theme = Theme.of(context);

    // This Data will be replaced once we get the data from API
    return Row(
      children: <Widget>[
        DigitTableItem(
          content: '',
          index: index,
          isColored: true,
          width: 140,
          child: Text(
            'Delivered',
            style: TextStyle(color: theme.colorScheme.inverseSurface),
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
}
