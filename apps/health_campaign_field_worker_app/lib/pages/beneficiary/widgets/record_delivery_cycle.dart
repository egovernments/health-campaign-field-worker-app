import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/localization/app_localization.dart';
import '../../../blocs/product_variant/product_variant.dart';
import '../../../models/entities/task.dart';
import '../../../models/project_type/project_type_model.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';

class RecordDeliveryCycle extends StatelessWidget {
  final List<TaskModel>? taskData;
  final int cycleIndex;
  final Cycle e;
  final bool isLastCycle;
  const RecordDeliveryCycle({
    Key? key,
    this.taskData,
    required this.cycleIndex,
    required this.e,
    required this.isLastCycle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final headerList = [
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryDoseNo),
        cellKey: 'dose',
      ),
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryStatus),
        cellKey: 'status',
      ),
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryCompletedOn),
        cellKey: 'completedOn',
      ),
    ];

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<ProductVariantBloc, ProductVariantState>(
          builder: (context, productState) {
            return productState.maybeWhen(
              orElse: () => const Offstage(),
              fetched: (productVariants) {
                final RegExp regexp = RegExp(r'^0+(?=.)');

                final taskCycleindex = taskData != null && taskData!.isNotEmpty
                    ? int.tryParse(taskData!
                        .last.additionalFields!.fields[3].value
                        .toString()
                        .replaceAll(
                          regexp,
                          '',
                        ))
                    : 1;

                final int? taskDoseindex =
                    taskData != null && taskData!.isNotEmpty
                        ? int.tryParse(taskData!
                            .last.additionalFields!.fields[4].value
                            .toString()
                            .replaceAll(
                              regexp,
                              '',
                            ))
                        : 0;

                return taskCycleindex != null && taskCycleindex >= cycleIndex
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Cycle  $cycleIndex',
                            style: theme.textTheme.headlineMedium,
                            textAlign: TextAlign.left,
                          ),
                          DigitTable(
                            selectedIndex:
                                cycleIndex == taskCycleindex && taskData != null
                                    ? taskDoseindex!
                                    : taskData == null && cycleIndex == 1
                                        ? 0
                                        : null,

                            headerList: headerList,
                            tableData: e.deliveries!.map(
                              (item) {
                                final tasks = taskData
                                    ?.where((element) =>
                                        element.additionalFields?.fields[4]
                                            .value ==
                                        '0${e.deliveries!.indexOf(item) + 1}')
                                    .firstOrNull;

                                return TableDataRow([
                                  TableData(
                                    'Dose ${e.deliveries!.indexOf(item) + 1}',
                                    cellKey: 'dose',
                                  ),
                                  TableData(
                                    tasks?.status ?? 'In complete',
                                    // TODO[Task status needs to be mapped]
                                    cellKey: 'status',
                                  ),
                                  TableData(
                                    tasks?.clientAuditDetails?.createdTime
                                            .toDateTime
                                            .getFormattedDate() ??
                                        '',
                                    cellKey: 'completedOn',
                                  ),
                                ]);
                              },
                            ).toList(), // You can replace this with actual data for each cycle
                            leftColumnWidth: 130,
                            rightColumnWidth: headerList.length * 17 * 6,
                            height: 6 * 57,
                          ),
                          isLastCycle
                              ? TextButton(
                                  onPressed: () {},
                                  child: Center(
                                    child: Text(
                                      localizations.translate(
                                        i18.deliverIntervention.hidePastCycles,
                                      ),
                                    ),
                                  ),
                                )
                              : const Offstage(),
                        ],
                      )
                    : const Offstage();
              },
            );
          },
        ),
        // Add other widgets or components to display cycle-specific data here
      ],
    );
  }
}
