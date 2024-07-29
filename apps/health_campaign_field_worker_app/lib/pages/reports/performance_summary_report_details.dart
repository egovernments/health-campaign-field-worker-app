import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/facility/facility.dart';
import '../../blocs/performanceSummaryReport/performance_summary_report.dart';
import '../../blocs/product_variant/product_variant.dart';
import '../../blocs/stock_reconciliation/stock_reconciliation.dart';
import '../../data/repositories/local/household.dart';
import '../../data/repositories/local/individual.dart';
import '../../data/repositories/local/task.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/component_wrapper/facility_bloc_wrapper.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/inventory/no_facilities_assigned_dialog.dart';
import '../../widgets/localized.dart';
import '../../widgets/reports/readonly_pluto_grid.dart';
import '../inventory/facility_selection.dart';

class PerformamnceSummaryReportDetailsPage extends LocalizedStatefulWidget
    with AutoRouteWrapper {
  const PerformamnceSummaryReportDetailsPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<PerformamnceSummaryReportDetailsPage> createState() =>
      _PerformamnceSummaryReportDetailsPageState();

/* created a wrapper  Router which handles the BlocProvider 
and attached the event to load the data*/
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return PerformannceSummaryReportBloc(
          individualRepository:
              context.repository<IndividualModel, IndividualSearchModel>(),
          householdRepository:
              context.repository<HouseholdModel, HouseholdSearchModel>(),
          taskRepository: context.repository<TaskModel, TaskSearchModel>(),
          productVariantRepository: context
              .repository<ProductVariantModel, ProductVariantSearchModel>(),
        );
      },
      child: this,
    );
  }
}

class _PerformamnceSummaryReportDetailsPageState
    extends LocalizedState<PerformamnceSummaryReportDetailsPage> {
  @override
  void initState() {
    super.initState();
    // Load data when the page is initialized
    _loadData();
  }

  void _loadData() {
    final bloc = BlocProvider.of<PerformannceSummaryReportBloc>(context);
    bloc.add(PerformanceSummaryReportLoadDataEvent(
      userId: context.loggedInUserUuid,
    ));
  }

  static const _householdKey = 'householdKey';
  static const _treatedPercentageKey = 'treatedPercentageKey';
  static const _treatedKey = 'treatedKey';
  static const _dateKey = 'dateKey';
  static const _drugOneKey = 'drugOneKey';
  static const _drugTwoKey = 'drugTwoKey';
  static const _title = "Summary Report";

  FormGroup _form() {
    return fb.group({});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PerformannceSummaryReportBloc,
          PerformanceSummaryReportState>(
        builder: (context, performanceSumamryReportState) {
          return ScrollableContent(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackNavigationHelpHeaderWidget(),
              Container(
                padding: const EdgeInsets.all(kPadding),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
              if (performanceSumamryReportState
                  is PerformanceSummaryReportSummaryDataState)
                ReactiveFormBuilder(
                  form: _form,
                  builder: (ctx, form, child) {
                    return SizedBox(
                      height: 400,
                      child: _ReportDetailsContent(
                        title: _title,
                        data: DigitGridData(
                          columns: [
                            DigitGridColumn(
                              label: localizations.translate(
                                i18.inventoryReportDetails.dateLabel,
                              ),
                              key: _dateKey,
                              width: 90,
                            ),
                            DigitGridColumn(
                              label: localizations.translate(
                                "PERFORMANCE_SUMMARY_HOUSEHOLD_DATA_LIST",
                              ),
                              key: _householdKey,
                              width: 170,
                            ),
                            DigitGridColumn(
                              label: localizations.translate(
                                "PERFORMANCE_SUMMARY_INDIVIDUAL_DATA_LIST",
                              ),
                              key: _treatedPercentageKey,
                              width: 140,
                            ),
                            DigitGridColumn(
                              label: localizations.translate(
                                "PERFORMANCE_SUMMARY_TASK_DATA_LIST",
                              ),
                              key: _treatedKey,
                              width: 120,
                            ),
                            DigitGridColumn(
                              label: localizations.translate(
                                "PERFORMANCE_SUMMARY_DRUG_ONE",
                              ),
                              key: _drugOneKey,
                              width: 130,
                            ),
                            DigitGridColumn(
                              label: localizations.translate(
                                "PERFORMANCE_SUMMARY_DRUG_TWO",
                              ),
                              key: _drugTwoKey,
                              width: 130,
                            ),
                          ],
                          rows: [
                            for (final entry in performanceSumamryReportState
                                .summaryData.entries) ...[
                              DigitGridRow(
                                [
                                  DigitGridCell(
                                    key: _dateKey,
                                    value: entry.key,
                                  ),
                                  DigitGridCell(
                                    key: _householdKey,
                                    value:
                                        entry.value.householdCount.toString(),
                                  ),
                                  DigitGridCell(
                                    key: _treatedKey,
                                    value: entry.value.taskCount.toString(),
                                  ),
                                  DigitGridCell(
                                    key: _treatedPercentageKey,
                                    value: entry.value.treatedPercentage
                                        .toString(),
                                  ),
                                  DigitGridCell(
                                    key: _drugOneKey,
                                    value: entry.value.drugOne.toString(),
                                  ),
                                  DigitGridCell(
                                    key: _drugTwoKey,
                                    value: entry.value.drugTwo.toString(),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ReportDetailsContent extends StatelessWidget {
  final String title;
  final DigitGridData data;

  const _ReportDetailsContent({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: kPadding * 2),
          Flexible(
            child: ReadonlyDigitGrid(
              data: data,
            ),
          ),
        ],
      ),
    );
  }
}

class _NoReportContent extends StatelessWidget {
  final String title;
  final String message;

  const _NoReportContent({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kPadding * 2,
          width: double.maxFinite,
        ),
        Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.disabledColor,
            ),
          ),
        ),
      ],
    );
  }
}
