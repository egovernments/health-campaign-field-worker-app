import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_repository.dart';
import '../../data/repositories/local/project_beneficiary.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../utils/utils.dart';
import '../../widgets/localized.dart';

import 'package:collection/collection.dart';

class BeneficaryTargetPage extends LocalizedStatefulWidget {
  const BeneficaryTargetPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<BeneficaryTargetPage> createState() => _BeneficaryTargetPageState();
}

class _BeneficaryTargetPageState extends State<BeneficaryTargetPage> {
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
              (element) =>
                  (element.dateOfRegistrationTime.getFormattedDate('dd MMM')),
            );
      }),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: charts.BarChart(
            defaultRenderer: charts.BarRendererConfig(
              maxBarWidthPx: 40,
            ),
            _createSampleData(projectBeneficiaries.entries),
            animate: false,
          ),
        ),
      ]),
    );
  }

  static List<charts.Series<OrdinalTargetsList, String>> _createSampleData(
    Iterable<MapEntry<String?, List<ProjectBeneficiaryModel>>> entries,
  ) {
    final data =
        entries.map((e) => OrdinalTargetsList(e.key!, e.value.length)).toList();

    return [
      charts.Series<OrdinalTargetsList, String>(
        id: 'Sales',
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

  OrdinalTargetsList(this.date, this.achivedTarget);
}
