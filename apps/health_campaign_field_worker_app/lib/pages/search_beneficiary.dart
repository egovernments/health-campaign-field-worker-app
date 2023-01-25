import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../blocs/table_hide_action.dart';
import '../models/beneficiary_statistics/beneficiary_statistics_model.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/beneficiary/beneficiary_card.dart';
import '../widgets/beneficiary/beneficiary_statistics_card.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

class SearchBeneficiaryPage extends LocalizedStatefulWidget {
  const SearchBeneficiaryPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<SearchBeneficiaryPage> createState() => _SearchBeneficiaryPageState();
}

class _SearchBeneficiaryPageState
    extends LocalizedState<SearchBeneficiaryPage> {
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
                  localizations
                      .translate(i18.searchBeneficiary.statisticsLabelText),
                  style: theme.textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            BeneficiaryStatisticsCard(
              beneficiaryStatistics:
                  BeneficiaryStatisticsWrapperModel(beneficiaryStatisticsList: [
                BeneficiaryStatisticsModel(
                  title: '535',
                  content: localizations.translate(
                    i18.searchBeneficiary.noOfHouseholdsRegistered,
                  ),
                ),
                BeneficiaryStatisticsModel(
                  title: '756',
                  content: localizations
                      .translate(i18.searchBeneficiary.noOfResourcesDelivered),
                ),
              ]),
            ),
            DigitSearchBar(
              hintText: localizations
                  .translate(i18.searchBeneficiary.beneficiarySearchHintText),
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
                        status: 'Not Delivered',
                        title: 'Jose Antonio',
                      ),
                      DigitOutLineButton(
                        label: localizations
                            .translate(i18.searchBeneficiary.iconLabel),
                        onPressed: () =>
                            context.router.push(HouseholdOverViewRoute()),
                      ),
                    ],
                  ),
                  BlocBuilder<TableHideActionBloc, TableHideActionState>(
                    builder: (context, state) => Offstage(
                      offstage: !state.isOpen,
                      child: DigitTable(
                        headerList: [
                          TableHeader(
                            'Beneficiary',
                            cellKey: 'beneficiary',
                          ),
                          TableHeader(
                            'Delivery',
                            cellKey: 'delivery',
                          ),
                          TableHeader(
                            'Age',
                            cellKey: 'age',
                          ),
                          TableHeader(
                            'Gender',
                            cellKey: 'gender',
                          ),
                        ],
                        tableData: [
                          TableDataRow(
                            [
                              TableData(
                                'Jose',
                                cellKey: 'beneficiary',
                              ),
                              TableData(
                                'Delivered',
                                cellKey: 'delivery',
                                style: TextStyle(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              TableData(
                                '45',
                                cellKey: 'age',
                              ),
                              TableData(
                                'Male',
                                cellKey: 'gender',
                              ),
                            ],
                          ),
                          TableDataRow([
                            TableData(
                              'Maria',
                              cellKey: 'beneficiary',
                            ),
                            TableData(
                              'Not Delivered',
                              cellKey: 'delivery',
                              style: TextStyle(color: theme.errorColor),
                            ),
                            TableData(
                              '35',
                              cellKey: 'age',
                            ),
                            TableData(
                              'Female',
                              cellKey: 'gender',
                            ),
                          ]),
                        ],
                        leftColumnWidth: 110,
                        rightColumnWidth: 45 * 8,
                        height: 170,
                      ),
                    ),
                  ),
                  BlocBuilder<TableHideActionBloc, TableHideActionState>(
                    builder: (context, state) => Container(
                      height: 24,
                      margin: const EdgeInsets.all(4),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          state.isOpen
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 16,
                        ),
                        onPressed: () => context
                            .read<TableHideActionBloc>()
                            .add(const TableHideActionEvent.onupdateAction()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DigitInfoCard(
              icon: Icons.info,
              backgroundColor: theme.colorScheme.tertiaryContainer,
              iconColor: theme.colorScheme.surfaceTint,
              description: localizations
                  .translate(i18.searchBeneficiary.beneficiaryInfoDescription),
              title: localizations
                  .translate(i18.searchBeneficiary.beneficiaryInfoTitle),
            ),
          ],
        ),
        bottomNavigationBar: Offstage(
          offstage: isKeyboardVisible,
          child: SizedBox(
            height: 90,
            child: DigitCard(
              child: DigitElevatedButton(
                onPressed: () => context.router.push(
                  HouseholdLocationRoute(),
                ),
                child: Center(
                  child: Text(localizations.translate(
                    i18.searchBeneficiary.beneficiaryAddActionLabel,
                  )),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
