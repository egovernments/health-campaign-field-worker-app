import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../blocs/product_variant/product_variant.dart';
import '../../../models/data_model.dart';
import '../../../models/project_type/project_type_model.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/localized.dart';

class RecordDeliveryCycle extends LocalizedStatefulWidget {
  final List<TaskModel>? taskData;
  final List<Cycle> projectCycles;
  final IndividualModel? individualModel;
  // ignore: prefer_typing_uninitialized_variables

  const RecordDeliveryCycle({
    Key? key,
    this.taskData,
    required this.projectCycles,
    required this.individualModel,
  }) : super(key: key);

  @override
  State<RecordDeliveryCycle> createState() => _RecordDeliveryCycleState();
}

class _RecordDeliveryCycleState extends LocalizedState<RecordDeliveryCycle> {
  bool isExpanded = false;
  bool isDivider = false;

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
                                                horizontal: kPadding / 2,
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
                                                    fontSize: kPadding * 2,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
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
                                                        .colorScheme
                                                        .secondary,
                                                    Icons.keyboard_arrow_down,
                                                    size: 24,
                                                  )
                                                : Icon(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
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
    List<Cycle> cycles,
    List<TableHeader> headerList,
    int? selectedIndex,
    bool isCurrentCycle,
  ) {
    final theme = DigitTheme.instance.mobileTheme;

    final widgetList = <Widget>[];

    // Iterate over the cycles list in reverse order
    for (int i = cycles.length - 1; i >= 0; i--) {
      final e = cycles[i];
      widgetList.add(
        Column(
          children: [
            Padding(
              padding: isCurrentCycle
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(
                      top: kPadding + 2,
                      bottom: 0,
                    ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  isCurrentCycle
                      ? localizations
                          .translate(i18.beneficiaryDetails.currentCycleLabel)
                      : '${localizations.translate(i18.beneficiaryDetails.beneficiaryCycle)} ${e.id}',
                  style: theme.textTheme.headlineLarge,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            DigitTable(
              selectedIndex: selectedIndex,
              headerList: headerList,
              tableData: e.deliveries!.mapIndexed(
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

                  return TableDataRow([
                    TableData(
                      'Dose ${e.deliveries!.indexOf(item) + 1}',
                      cellKey: 'dose',
                    ),
                    TableData(
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
                    TableData(
                      tasks?.status == Status.administeredFailed.toValue() ||
                              (tasks?.additionalFields?.fields
                                      .where((e) =>
                                          e.key ==
                                          AdditionalFieldsType.deliveryStrategy
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
              columnWidth: 130,
              height: ((e.deliveries?.length ?? 0) + 1) * 57.5,
            ),
            const SizedBox(
              height: 16,
            ),
              const Divider(
                thickness: 1.0,
              ),
          ],
        ),
      );
    }

    return Column(
      children: widgetList,
    );
  }
}
