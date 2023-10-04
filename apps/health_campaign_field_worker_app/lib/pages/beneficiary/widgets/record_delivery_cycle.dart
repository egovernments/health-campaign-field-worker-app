import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../blocs/product_variant/product_variant.dart';
import '../../../models/entities/task.dart';
import '../../../models/project_type/project_type_model.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/localized.dart';

class RecordDeliveryCycle extends LocalizedStatefulWidget {
  final List<TaskModel>? taskData;
  final List<Cycle> projectCycles;

  const RecordDeliveryCycle({
    Key? key,
    this.taskData,
    required this.projectCycles,
  }) : super(key: key);

  @override
  State<RecordDeliveryCycle> createState() => _RecordDeliveryCycleState();
}

class _RecordDeliveryCycleState extends LocalizedState<RecordDeliveryCycle> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    bool isPastCyclesVisible = false;

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

                final taskCycleindex =
                    widget.taskData != null && widget.taskData!.isNotEmpty
                        ? int.tryParse(widget
                            .taskData!.last.additionalFields!.fields[3].value
                            .toString()
                            .replaceAll(
                              regexp,
                              '',
                            ))
                        : 1;

                final int? taskDoseindex =
                    widget.taskData != null && widget.taskData!.isNotEmpty
                        ? int.tryParse(widget
                            .taskData!.last.additionalFields!.fields[4].value
                            .toString()
                            .replaceAll(
                              regexp,
                              '',
                            ))
                        : 0;

                return taskCycleindex != null
                    ? BlocBuilder<DeliverInterventionBloc,
                        DeliverInterventionState>(
                        builder: (context, deliverState) {
                          final pastCycles = deliverState.pastCycles;

                          return Column(
                            children: [
                              deliverState.hasCycleArrived
                                  ? buildCycleAndDoseTable(
                                      widget.projectCycles
                                          .where(
                                            (e) => e.id == deliverState.cycle,
                                          )
                                          .toList(),
                                      headerList,
                                      deliverState.dose - 1,
                                    )
                                  : const SizedBox.shrink(),
                              ExpandableNotifier(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expandable(
                                      collapsed: const SizedBox.shrink(),
                                      expanded: Container(
                                        child: buildCycleAndDoseTable(
                                          pastCycles ?? [],
                                          headerList,
                                          null,
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        var controller =
                                            ExpandableController.of(
                                          context,
                                          required: true,
                                        )!;

                                        return DigitIconButton(
                                          iconText: controller.expanded
                                              ? localizations.translate(
                                                  i18.deliverIntervention
                                                      .hidePastCycles,
                                                )
                                              : localizations.translate(
                                                  i18.deliverIntervention
                                                      .viewPastCycles,
                                                ),
                                          iconTextColor: DigitTheme
                                              .instance.colorScheme.secondary,
                                          onPressed: () {
                                            controller.toggle();
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
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

  Widget buildCycleAndDoseTable(
    List<Cycle> cycles,
    List<TableHeader> headerList,
    int? selectedIndex,
  ) {
    final theme = DigitTheme.instance.mobileTheme;
    final widgetList = cycles
        .map(
          (e) => Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cycle  ${e.id}',
                  style: theme.textTheme.headlineMedium,
                  textAlign: TextAlign.left,
                ),
              ),
              DigitTable(
                selectedIndex: selectedIndex,

                headerList: headerList,
                tableData: e.deliveries!.map(
                  (item) {
                    final tasks = widget.taskData
                        ?.where((element) =>
                            element.additionalFields?.fields
                                    .firstWhereOrNull(
                                      (f) => f.key == 'DoseIndex',
                                    )
                                    ?.value ==
                                '0${item.id}' &&
                            element.additionalFields?.fields
                                    .firstWhereOrNull(
                                      (c) => c.key == 'CycleIndex',
                                    )
                                    ?.value ==
                                '0${e.id}')
                        .lastOrNull;

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
                        tasks?.clientAuditDetails?.createdTime.toDateTime
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
            ],
          ),
        )
        .toList();

    return Column(
      children: widgetList,
    );
  }
}
