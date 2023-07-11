import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_repository.dart';
import '../../data/repositories/local/project_beneficiary.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18;
import 'package:collection/collection.dart';

class BeneficaryTargetPage extends LocalizedStatefulWidget {
  const BeneficaryTargetPage({
    super.key,
    super.appLocalizations,
  });

  @override
  LocalizedState<BeneficaryTargetPage> createState() =>
      _BeneficaryTargetPageState();
}

class _BeneficaryTargetPageState extends LocalizedState<BeneficaryTargetPage> {
  Map<String?, List<ProjectBeneficiaryModel>> projectBeneficiaries = {};
  @override
  void didChangeDependencies() {
    final repository = context.read<
            LocalRepository<ProjectBeneficiaryModel,
                ProjectBeneficiarySearchModel>>()
        as ProjectBeneficiaryLocalRepository;

    final now = DateTime.now();

    final lte = DateTime(
      now.year,
      now.month,
      now.day,
      23,
      59,
      59,
      999,
    );

    repository.listenToChanges(
      query: ProjectBeneficiarySearchModel(
        projectId: context.projectId,
      ),
      listener: (data) => setState(() {
        projectBeneficiaries = data
            .where((element) =>
                (element.isDeleted == false || element.isDeleted == null) &&
                element.dateOfRegistrationTime.isBefore(lte))
            .toList()
            .groupListsBy(
              (element) => (element.dateOfRegistrationTime
                  .getFormattedDate('dd MMM YYYY')),
            );
      }),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final selectedProject = context.selectedProject;
    final beneficiaryType = context.beneficiaryType;
    final theme = Theme.of(context);
    final targetModel = selectedProject.targets?.firstWhereOrNull(
      (element) => element.beneficiaryType == beneficiaryType,
    );

    final target = targetModel?.targetNo ?? 0.0;

    final rowData = projectBeneficiaries.entries
        .map((e) => TableDataRow(
              [
                TableData(
                  e.key!,
                  cellKey: 'date',
                ),
                TableData(
                  e.value.length.toString(),
                  cellKey: 'achivedTarget',
                  style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                TableData(
                  (target - e.value.length).toInt().isNegative
                      ? 0.toString()
                      : (target - e.value.length).toInt().toString(),
                  cellKey: 'target',
                  style: TextStyle(
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
            ))
        .toList();

    return Scaffold(
      body: ScrollableContent(
        header: const Column(children: [
          BackNavigationHelpHeaderWidget(),
        ]),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  localizations.translate(
                    i18.reports.reportsTitle,
                  ),
                  style: theme.textTheme.displayMedium,
                ),
              ),
            ],
          ),
          DigitCard(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      localizations.translate(
                        i18.reports.reportsProjectvsRegistredTitle,
                      ),
                      style: theme.textTheme.headlineSmall,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            ' ${localizations.translate(i18.reports.reportsTargetLabel)} : ',
                          ),
                          Text(
                            target.toInt().toString(),
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: charts.BarChart(
                    defaultRenderer: charts.BarRendererConfig(
                      maxBarWidthPx: 20,
                    ),
                    _createSampleData(projectBeneficiaries.entries, target),
                    animate: false,
                  ),
                ),
              ],
            ),
          ),
          DigitTable(
            headerList: [
              TableHeader(
                localizations.translate(i18.reports.date),
                cellKey: 'date',
              ),
              TableHeader(
                localizations.translate(i18.reports.completed),
                cellKey: 'achivedTarget',
              ),
              TableHeader(
                localizations.translate(i18.reports.inComplete),
                cellKey: 'target',
              ),
            ],
            tableData: rowData,
            leftColumnWidth: 130,
            rightColumnWidth: projectBeneficiaries.entries.length * 50 * 6,
            height: MediaQuery.of(context).size.height / 2,
          ),
        ],
      ),
    );
  }

  static List<charts.Series<OrdinalTargetsList, String>> _createSampleData(
    Iterable<MapEntry<String?, List<ProjectBeneficiaryModel>>> entries,
    target,
  ) {
    final data = entries
        .map((e) => OrdinalTargetsList(e.key!, e.value.length, target))
        .toList();

    return [
      charts.Series<OrdinalTargetsList, String>(
        id: 'Reports',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalTargetsList data, _) => data.date,
        measureFn: (OrdinalTargetsList data, _) => data.achivedTarget,
        data: data,
      ),
    ];
  }
}

class OrdinalTargetsList {
  final String date;
  final int achivedTarget;
  final double target;

  OrdinalTargetsList(this.date, this.achivedTarget, this.target);
}
