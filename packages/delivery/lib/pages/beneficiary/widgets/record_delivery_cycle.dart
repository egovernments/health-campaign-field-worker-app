import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery/blocs/app_localization.dart';
import 'package:registration/models/entities/additional_fields_type.dart';
import 'package:registration/utils/extensions/extensions.dart';

import '../../../blocs/delivery_intervention/deliver_intervention.dart';

import '../../../models/entities/deliver_strategy_type.dart';
import '../../../models/entities/status.dart';
import '../../../models/entities/task.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';

class RecordDeliveryCycle extends LocalizedStatefulWidget {
  final List<TaskModel>? taskData;
  final List<ProjectCycle> projectCycles;
  final IndividualModel? individualModel;

  const RecordDeliveryCycle({
    super.key,
    this.taskData,
    required this.projectCycles,
    required this.individualModel,
  });

  @override
  State<RecordDeliveryCycle> createState() => RecordDeliveryCycleState();
}

class RecordDeliveryCycleState extends LocalizedState<RecordDeliveryCycle> {
  bool isExpanded = false;
  bool isDivider = false;

  @override
  Widget build(BuildContext context) {
    final localizations = DeliveryLocalization.of(context);

    final headerList = [
      DigitTableColumn(
        header:
            localizations.translate(i18.beneficiaryDetails.beneficiaryDoseNo),
        cellValue: 'dose',
      ),
      DigitTableColumn(
        header:
            localizations.translate(i18.beneficiaryDetails.beneficiaryStatus),
        cellValue: 'status',
      ),
      DigitTableColumn(
        header: localizations
            .translate(i18.beneficiaryDetails.beneficiaryCompletedOn),
        cellValue: 'completedOn',
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

                    return Column(children: [
                      deliverState.hasCycleArrived
                          ? buildCycleAndDoseTable(
                              widget.projectCycles
                                  .where(
                                    (e) => e.id == deliverState.cycle,
                                  )
                                  .toList(),
                              headerList,
                              deliverState.dose - 1,
                              true,
                            )
                          : const SizedBox.shrink(),
                      if ((pastCycles ?? []).isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            StatefulBuilder(
                              builder: (context, setState) {
                                return Column(children: [
                                  isExpanded
                                      ? buildCycleAndDoseTable(
                                          pastCycles ?? [],
                                          headerList,
                                          null,
                                          false,
                                        )
                                      : const Offstage(),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isExpanded = !isExpanded;
                                            isDivider = !isDivider;
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: spacer2 / 2,
                                              ),
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: const EdgeInsets.all(
                                                    0,
                                                  ),
                                                ),
                                                onPressed: null,
                                                child: Text(
                                                  style: TextStyle(
                                                    fontSize: spacer2 * 2,
                                                    color: Theme.of(context)
                                                        .colorTheme
                                                        .primary
                                                        .primary1,
                                                  ),
                                                  isExpanded
                                                      ? localizations.translate(
                                                          i18.deliverIntervention
                                                              .hidePastCycles,
                                                        )
                                                      : localizations.translate(
                                                          i18.deliverIntervention
                                                              .viewPastCycles,
                                                        ),
                                                ),
                                              ),
                                            ),
                                            !isExpanded
                                                ? Icon(
                                                    color: Theme.of(context)
                                                        .colorTheme
                                                        .primary
                                                        .primary1,
                                                    Icons.keyboard_arrow_down,
                                                    size: 24,
                                                  )
                                                : Icon(
                                                    color: Theme.of(context)
                                                        .colorTheme
                                                        .primary
                                                        .primary1,
                                                    Icons.keyboard_arrow_up,
                                                    size: 24,
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]);
                              },
                            ),
                          ],
                        ),
                    ]);
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget buildCycleAndDoseTable(
    List<ProjectCycle> cycles,
    List<DigitTableColumn> headerList,
    int? selectedIndex,
    bool isCurrentCycle,
  ) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    final widgetList = <Widget>[];

    // Iterate over the cycles list in reverse order
    for (int i = cycles.length - 1; i >= 0; i--) {
      final e = cycles[i];
      widgetList.add(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: spacer4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  isCurrentCycle
                      ? localizations
                          .translate(i18.beneficiaryDetails.currentCycleLabel)
                      : '${localizations.translate(i18.beneficiaryDetails.beneficiaryCycle)} ${e.id}',
                  style: textTheme.headingL
                      .copyWith(color: theme.colorTheme.primary.primary2),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: ((e.deliveries?.length ?? 0) + 1) * 57.5,
              child: DigitTable(
                enableBorder: true,
                withRowDividers: true,
                withColumnDividers: true,
                showSelectedState: false,
                showPagination: false,
                highlightedRows: (selectedIndex != null) ? [selectedIndex] : [],
                columns: headerList,
                rows: e.deliveries!.mapIndexed(
                  (index, item) {
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

                    return DigitTableRow(tableRow: [
                      DigitTableData(
                        '${localizations.translate(i18.deliverIntervention.dose)} ${e.deliveries!.indexOf(item) + 1}',
                        cellKey: 'dose',
                      ),
                      DigitTableData(
                        localizations.translate(
                          index == selectedIndex
                              ? Status.toAdminister.toValue()
                              : tasks?.status ?? Status.inComplete.toValue(),
                        ),
                        cellKey: 'status',
                        style: TextStyle(
                          color: index == selectedIndex
                              ? null
                              : tasks?.status ==
                                      Status.administeredSuccess.toValue()
                                  ? DigitTheme
                                      .instance.colorScheme.onSurfaceVariant
                                  : DigitTheme.instance.colorScheme.error,
                          fontWeight:
                              index == selectedIndex ? FontWeight.w700 : null,
                        ),
                      ),
                      DigitTableData(
                        tasks?.status == Status.administeredFailed.toValue() ||
                                (tasks?.additionalFields?.fields
                                        .where((e) =>
                                            e.key ==
                                            AdditionalFieldsType
                                                .deliveryStrategy
                                                .toValue())
                                        .firstOrNull
                                        ?.value ==
                                    DeliverStrategyType.indirect.toValue())
                            ? ' -- '
                            : tasks?.clientAuditDetails?.createdTime.toDateTime
                                    .getFormattedDate() ??
                                ' -- ',
                        cellKey: 'completedOn',
                      ),
                    ]);
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widgetList,
    );
  }
}
