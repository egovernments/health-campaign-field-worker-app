import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/molecules/digit_table.dart';
import 'package:digit_components/widgets/molecules/digit_table_card.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/localization/app_localization.dart';
import '../../blocs/product_variant/product_variant.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/utils.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

class DoseAdministeredPage extends LocalizedStatefulWidget {
  const DoseAdministeredPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<DoseAdministeredPage> createState() => _DoseAdministeredPageState();
}

class _DoseAdministeredPageState extends LocalizedState<DoseAdministeredPage> {
  static const _doseAdministeredKey = 'doseAdministered';
  bool doseAdministered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);

    final headerListResource = [
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryDose),
        cellKey: 'dose',
      ),
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryResources),
        cellKey: 'resources',
      ),
    ];

    return ProductVariantBlocWrapper(
      child: Scaffold(
        body: ReactiveFormBuilder(
          form: () => buildForm(context),
          builder: (context, form, child) => ScrollableContent(
            header: const Column(children: [
              BackNavigationHelpHeaderWidget(),
            ]),
            footer: SizedBox(
              height: 85,
              child: DigitCard(
                margin: const EdgeInsets.only(top: kPadding),
                child: DigitElevatedButton(
                  onPressed: () {
                    final bloc = context.read<DeliverInterventionBloc>().state;
                    final event = context.read<DeliverInterventionBloc>();
                    final parent = context.router.parent() as StackRouter;
                    parent
                      ..pop()
                      ..pop();
                    if (doseAdministered && context.mounted) {
                      for (var e in bloc.futureDeliveries!) {
                        int doseIndex = e.id;
                        final clientReferenceId = IdGen.i.identifier;
                        final address = bloc.oldTask?.address;
                        event.add(DeliverInterventionSubmitEvent(
                          TaskModel(
                            projectId: context.projectId,
                            address: address?.copyWith(
                              relatedClientReferenceId: clientReferenceId,
                              id: null,
                            ),
                            status: Status.partiallyDelivered.name,
                            clientReferenceId: clientReferenceId,
                            projectBeneficiaryClientReferenceId: bloc
                                .oldTask?.projectBeneficiaryClientReferenceId,
                            tenantId: envConfig.variables.tenantId,
                            rowVersion: 1,
                            auditDetails: AuditDetails(
                              createdBy: context.loggedInUserUuid,
                              createdTime: context.millisecondsSinceEpoch(),
                            ),
                            clientAuditDetails: ClientAuditDetails(
                              createdBy: context.loggedInUserUuid,
                              createdTime: context.millisecondsSinceEpoch(),
                            ),
                            resources: e.productVariants
                                ?.map((variant) => TaskResourceModel(
                                      clientReferenceId: IdGen.i.identifier,
                                      taskclientReferenceId: clientReferenceId,
                                      quantity: variant.quantity.toString(),
                                      productVariantId:
                                          variant.productVariantId,
                                      auditDetails: AuditDetails(
                                        createdBy: context.loggedInUserUuid,
                                        createdTime:
                                            context.millisecondsSinceEpoch(),
                                      ),
                                      clientAuditDetails: ClientAuditDetails(
                                        createdBy: context.loggedInUserUuid,
                                        createdTime:
                                            context.millisecondsSinceEpoch(),
                                      ),
                                    ))
                                .toList(),
                            additionalFields: TaskAdditionalFields(
                              version: 1,
                              fields: [
                                AdditionalField(
                                  'DateOfDelivery',
                                  DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString(),
                                ),
                                AdditionalField(
                                  'DateOfAdministration',
                                  DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString(),
                                ),
                                AdditionalField(
                                  'DateOfVerification',
                                  DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString(),
                                ),
                                AdditionalField(
                                  'CycleIndex',
                                  "0${bloc.cycle}",
                                ),
                                AdditionalField(
                                  'DoseIndex',
                                  "0$doseIndex",
                                ),
                                AdditionalField(
                                  'DeliveryStrategy',
                                  e.deliveryStrategy,
                                ),
                              ],
                            ),
                          ),
                          false,
                          context.boundary,
                        ));
                      }
                    }

                    context.router.push(AcknowledgementRoute());
                  },
                  child: Center(
                    child: Text(
                      localizations.translate(i18.common.coreCommonNext),
                    ),
                  ),
                ),
              ),
            ),
            children: [
              DigitCard(
                child: Column(
                  children: [
                    Text(
                      localizations.translate(
                        i18.deliverIntervention.wasTheDoseAdministered,
                      ),
                      style: theme.textTheme.displayMedium,
                    ),
                    DigitRadioButtonList<KeyValue>(
                      labelStyle: DigitTheme
                          .instance.mobileTheme.textTheme.headlineSmall,
                      formControlName: _doseAdministeredKey,
                      valueMapper: (val) => localizations.translate(val.label),
                      options: Constants.yesNo,
                      isRequired: true,
                      onValueChange: (val) {
                        setState(() {
                          doseAdministered = val.key;
                        });
                      },
                    ),
                  ],
                ),
              ),
              BlocBuilder<ProductVariantBloc, ProductVariantState>(
                builder: (context, productState) {
                  return productState.maybeWhen(
                    orElse: () => const Offstage(),
                    fetched: (productVariantsvalue) {
                      final variant = productState.whenOrNull(
                        fetched: (productVariants) {
                          return productVariants;
                        },
                      );

                      return DigitCard(
                        child: Column(
                          children: [
                            Text(
                              localizations.translate(
                                i18.beneficiaryDetails.resourcesTobeProvided,
                              ),
                              style: theme.textTheme.displayMedium,
                            ),
                            DigitTableCard(
                              element: {
                                localizations.translate(
                                  i18.beneficiaryDetails.beneficiaryAge,
                                ): "2",
                              },
                            ),
                            const Divider(),
                            BlocBuilder<DeliverInterventionBloc,
                                DeliverInterventionState>(
                              builder: (context, deliveryState) {
                                List<TableDataRow> tableDataRows =
                                    deliveryState.futureDeliveries!.map((e) {
                                  int doseIndex = deliveryState
                                          .futureDeliveries!
                                          .indexOf(e) +
                                      deliveryState.dose +
                                      1;

                                  return TableDataRow([
                                    TableData(
                                      'Dose $doseIndex',
                                      cellKey: 'dose',
                                    ),
                                    ...e.productVariants!
                                        .map(
                                          (ele) => TableData(
                                            variant!
                                                .where((element) =>
                                                    element.id ==
                                                    ele.productVariantId)
                                                .toList()
                                                .map((e) =>
                                                    '${ele.quantity} - ${e.sku}')
                                                .toList()
                                                .join('+'),
                                            cellKey: 'resources',
                                          ),
                                        )
                                        .toList(),
                                  ]);
                                }).toList();

                                return DigitTable(
                                  headerList: headerListResource,
                                  tableData: tableDataRows,
                                  leftColumnWidth: 130,
                                  rightColumnWidth:
                                      headerListResource.length * 17 * 6,
                                  height: (tableDataRows.length + 2) * 60,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  FormGroup buildForm(BuildContext context) {
    return fb.group(<String, Object>{
      _doseAdministeredKey: FormControl<KeyValue>(value: null),
    });
  }
}
