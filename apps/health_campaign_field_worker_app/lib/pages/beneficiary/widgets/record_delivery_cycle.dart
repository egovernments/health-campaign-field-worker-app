import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../blocs/product_variant/product_variant.dart';
import '../../../models/data_model.dart';
import '../../../models/entities/additional_fields_type.dart';
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
    bool isPastCyclesVisible =
        false; // A boolean flag to track visibility of past cycles

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
    ]; // List of table headers for displaying cycle and dose information

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<ProductVariantBloc, ProductVariantState>(
          builder: (context, productState) {
            return productState.maybeWhen(
              orElse: () => const Offstage(),
              fetched: (productVariants) {
                // Calculate current cycle and dose index

                return BlocBuilder<DeliverInterventionBloc,
                    DeliverInterventionState>(
                  builder: (context, deliverState) {
                    final pastCycles = deliverState.pastCycles;

                    return Column(
                      children: [
                        buildCycleAndDoseTable(
                          deliverState.hasCycleArrived
                              ? widget.projectCycles
                                  .where(
                                    (e) => e.id == deliverState.cycle,
                                  )
                                  .toList()
                              : widget.projectCycles
                                  .where(
                                    (e) => e.id == deliverState.cycle - 1,
                                  )
                                  .toList(),
                          headerList,
                          deliverState.dose - 1,
                        ),
                        if (pastCycles != null && pastCycles.isNotEmpty)
                          DigitIconButton(
                            iconText: isPastCyclesVisible
                                ? localizations.translate(
                                    i18.deliverIntervention.hidePastCycles,
                                  )
                                : localizations.translate(
                                    i18.deliverIntervention.viewPastCycles,
                                  ),
                            iconTextColor:
                                DigitTheme.instance.colorScheme.secondary,
                            onPressed: () {
                              setState(() {
                                isPastCyclesVisible = !isPastCyclesVisible;
                              });
                            },
                          ),
                        Visibility(
                          // [TODO: Need to manage the visibility of pastCycles]
                          visible: true,
                          child: buildCycleAndDoseTable(
                            pastCycles ?? [],
                            headerList,
                            null,
                          ),
                        ),
                      ],
                    );
                  },
                );
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

    // Create a list of widgets for each cycle
    final widgetList = cycles
        .map(
          (e) => Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${localizations.translate(i18.beneficiaryDetails.beneficiaryCycle)} ${e.id}',
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
                                      (f) =>
                                          f.key ==
                                          AdditionalFieldsType.doseIndex
                                              .toValue(),
                                    )
                                    ?.value ==
                                '0${item.id}' &&
                            element.additionalFields?.fields
                                    .firstWhereOrNull(
                                      (c) =>
                                          c.key ==
                                          AdditionalFieldsType.cycleIndex
                                              .toValue(),
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
                        tasks?.status ?? Status.inComplete.toValue(),
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
                ).toList(),
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
