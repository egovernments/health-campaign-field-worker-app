import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/search_households/project_beneficiaries_downsync.dart';
import '../../../models/entities/downsync.dart';
import '../../../utils/extensions/extensions.dart';

class BeneficariesReportPage extends StatefulWidget {
  const BeneficariesReportPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return BeneficariesReportState();
  }
}

class BeneficariesReportState extends State<BeneficariesReportPage> {
  List<DownsyncModel> downsyncList = [];
  @override
  void initState() {
    final bloc = context.read<BeneficiaryDownSyncBloc>();
    bloc.add(
      const BeneficiaryDownSyncEvent.downSyncReport(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocListener<BeneficiaryDownSyncBloc, BeneficiaryDownSyncState>(
        listener: (ctx, state) {
          state.maybeWhen(
            orElse: () => const Text(''),
            report: (downsyncCriteriaList) {
              setState(() {
                downsyncList = downsyncCriteriaList;
              });
            },
          );
        },
        child: Column(
          children: downsyncList
              .map(
                (e) => DigitCard(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Boundary:',
                            style: theme.textTheme.headlineMedium,
                          ),
                          Text(
                            e.locality!,
                            style: theme.textTheme.headlineMedium,
                          ),
                          DigitOutLineButton(
                            label: 'Download',
                            onPressed: () {
                              context.read<BeneficiaryDownSyncBloc>().add(
                                    DownSyncCheckTotalCountEvent(
                                      projectId: context.projectId,
                                      boundaryCode: e.locality!,
                                    ),
                                  );
                            },
                          ),
                        ],
                      ),
                      DigitTableCard(
                        element: {
                          'Status : ': e.offset! < e.totalCount!
                              ? 'Partial Downloaded'
                              : 'Downloaded Completely',
                          'Download Time : ': e.lastSyncedTime.toString(),
                          'Total Records Downloaded : ':
                              '${e.totalCount}/${e.offset}',
                        },
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
