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
import '../../blocs/household_overview/household_overview.dart';
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
  bool doseAdministered = true;
  bool formSubmitted = false;

  final clickedStatus = ValueNotifier<bool>(false);

  @override
  void dispose() {
    clickedStatus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    final overViewBloc = context.read<HouseholdOverviewBloc>().state;
    // Define a list of TableHeader objects for the header of a table
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
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: ReactiveFormBuilder(
            form: () => buildForm(context),
            builder: (context, form, child) => ScrollableContent(
              header: const Column(children: [
                BackNavigationHelpHeaderWidget(
                  showBackNavigation: false,
                  showHelp: false,
                ),
              ]),
              footer: SizedBox(
                height: 85,
                child: DigitCard(
                  margin: const EdgeInsets.only(top: kPadding),
                  child: ValueListenableBuilder(
                    valueListenable: clickedStatus,
                    builder: (context, bool isClicked, _) {
                      return DigitElevatedButton(
                        onPressed: isClicked
                            ? null
                            : () {
                                form.markAllAsTouched();

                                if (!form.valid)
                                  return;
                                else {
                                  clickedStatus.value = true;
                                  final bloc = context
                                      .read<DeliverInterventionBloc>()
                                      .state;
                                  final event =
                                      context.read<DeliverInterventionBloc>();

                                  if (doseAdministered && context.mounted) {
                                    // Iterate through future deliveries

                                    for (var e in bloc.futureDeliveries!) {
                                      int doseIndex = e.id;
                                      final clientReferenceId =
                                          IdGen.i.identifier;
                                      final address = bloc.oldTask?.address;
                                      // Create and dispatch a DeliverInterventionSubmitEvent with a new TaskModel
                                      event.add(DeliverInterventionSubmitEvent(
                                        TaskModel(
                                          projectId: context.projectId,
                                          address: address?.copyWith(
                                            relatedClientReferenceId:
                                                clientReferenceId,
                                            id: null,
                                          ),
                                          status: Status.delivered.toValue(),
                                          clientReferenceId: clientReferenceId,
                                          projectBeneficiaryClientReferenceId: bloc
                                              .oldTask
                                              ?.projectBeneficiaryClientReferenceId,
                                          tenantId:
                                              envConfig.variables.tenantId,
                                          rowVersion: 1,
                                          auditDetails: AuditDetails(
                                            createdBy: context.loggedInUserUuid,
                                            createdTime: context
                                                .millisecondsSinceEpoch(),
                                          ),
                                          clientAuditDetails:
                                              ClientAuditDetails(
                                            createdBy: context.loggedInUserUuid,
                                            createdTime: context
                                                .millisecondsSinceEpoch(),
                                          ),
                                          resources: fetchProductVariant(
                                            e,
                                            overViewBloc.selectedIndividual,
                                          )
                                              ?.productVariants
                                              ?.map((variant) =>
                                                  TaskResourceModel(
                                                    clientReferenceId:
                                                        IdGen.i.identifier,
                                                    tenantId: envConfig
                                                        .variables.tenantId,
                                                    taskclientReferenceId:
                                                        clientReferenceId,
                                                    quantity: variant.quantity
                                                        .toString(),
                                                    productVariantId: variant
                                                        .productVariantId,
                                                    isDelivered: true,
                                                    auditDetails: AuditDetails(
                                                      createdBy: context
                                                          .loggedInUserUuid,
                                                      createdTime: context
                                                          .millisecondsSinceEpoch(),
                                                    ),
                                                    clientAuditDetails:
                                                        ClientAuditDetails(
                                                      createdBy: context
                                                          .loggedInUserUuid,
                                                      createdTime: context
                                                          .millisecondsSinceEpoch(),
                                                    ),
                                                  ))
                                              .toList(),
                                          additionalFields:
                                              TaskAdditionalFields(
                                            version: 1,
                                            fields: [
                                              AdditionalField(
                                                AdditionalFieldsType
                                                    .dateOfDelivery
                                                    .toValue(),
                                                DateTime.now()
                                                    .millisecondsSinceEpoch
                                                    .toString(),
                                              ),
                                              AdditionalField(
                                                AdditionalFieldsType
                                                    .dateOfAdministration
                                                    .toValue(),
                                                DateTime.now()
                                                    .millisecondsSinceEpoch
                                                    .toString(),
                                              ),
                                              AdditionalField(
                                                AdditionalFieldsType
                                                    .dateOfVerification
                                                    .toValue(),
                                                DateTime.now()
                                                    .millisecondsSinceEpoch
                                                    .toString(),
                                              ),
                                              AdditionalField(
                                                AdditionalFieldsType.cycleIndex
                                                    .toValue(),
                                                "0${bloc.cycle}",
                                              ),
                                              AdditionalField(
                                                AdditionalFieldsType.doseIndex
                                                    .toValue(),
                                                "0$doseIndex",
                                              ),
                                              AdditionalField(
                                                AdditionalFieldsType
                                                    .deliveryStrategy
                                                    .toValue(),
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

                                  final reloadState =
                                      context.read<HouseholdOverviewBloc>();

                                  Future.delayed(
                                    const Duration(milliseconds: 1000),
                                    () {
                                      reloadState
                                          .add(HouseholdOverviewReloadEvent(
                                        projectId: context.projectId,
                                        projectBeneficiaryType:
                                            context.beneficiaryType,
                                      ));
                                    },
                                  ).then((value) => context.router.popAndPush(
                                        HouseholdAcknowledgementRoute(
                                          enableViewHousehold: true,
                                        ),
                                      ));
                                }
                              },
                        child: Center(
                          child: Text(
                            localizations.translate(i18.common.coreCommonNext),
                          ),
                        ),
                      );
                    },
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
                          child: BlocBuilder<DeliverInterventionBloc,
                              DeliverInterventionState>(
                            builder: (context, deliveryState) {
                              List<TableDataRow> tableDataRows =
                                  deliveryState.futureDeliveries!.map((e) {
                                int doseIndex =
                                    deliveryState.futureDeliveries!.indexOf(e) +
                                        deliveryState.dose +
                                        1;
                                List<String> skus = fetchProductVariant(
                                  e,
                                  overViewBloc.selectedIndividual,
                                )!
                                    .productVariants!
                                    .map((ele) {
                                  final pv = variant!.firstWhere(
                                    (element) =>
                                        element.id == ele.productVariantId,
                                  );

                                  return '${ele.quantity} - ${pv.sku.toString()}';
                                }).toList();

                                return TableDataRow([
                                  TableData(
                                    '${localizations.translate(i18.beneficiaryDetails.beneficiaryDeliveryText)} $doseIndex',
                                    cellKey: 'dose',
                                  ),
                                  TableData(
                                    skus.join(' + '),
                                    cellKey: 'resources',
                                  ),
                                ]);
                              }).toList();

                              return Column(
                                children: [
                                  Text(
                                    localizations.translate(
                                      i18.beneficiaryDetails
                                          .resourcesTobeProvided,
                                    ),
                                    style: theme.textTheme.displayMedium,
                                  ),
                                  DigitTableCard(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    topPadding: const EdgeInsets.only(top: 4.0),
                                    element: {
                                      localizations.translate(
                                        i18.beneficiaryDetails.beneficiaryAge,
                                      ): '${fetchProductVariant(
                                        deliveryState.futureDeliveries?.first,
                                        overViewBloc.selectedIndividual,
                                      )?.condition?.split('<=age<').first} - ${fetchProductVariant(
                                        deliveryState.futureDeliveries?.first,
                                        overViewBloc.selectedIndividual,
                                      )?.condition?.split('<=age<').last} months',
                                    },
                                    //[TODO:: Need to parse <=age< as an Expression
                                  ),
                                  const Divider(),
                                  DigitTable(
                                    headerList: headerListResource,
                                    tableData: tableDataRows,
                                    columnWidth:
                                        MediaQuery.of(context).size.width /
                                            2.18,
                                    height: (tableDataRows.length + 1) * 59.5,
                                  ),
                                ],
                              );
                            },
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
      ),
    );
  }

  FormGroup buildForm(BuildContext context) {
    return fb.group(<String, Object>{});
  }
}
