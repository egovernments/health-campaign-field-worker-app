import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/adverse_events/adverse_events.dart';
import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/product_variant/product_variant.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

class AdverseEventsPage extends LocalizedStatefulWidget {
  final bool isEditing;
  final List<TaskModel> tasks;

  const AdverseEventsPage({
    super.key,
    super.appLocalizations,
    required this.tasks,
    this.isEditing = false,
  });

  @override
  State<AdverseEventsPage> createState() => _AdverseEventsPageState();
}

class _AdverseEventsPageState extends LocalizedState<AdverseEventsPage> {
  static const _noOfTimesReAdministeredKey = 'quantityDistributed';
  static const _reAdministerKey = 'reAdminister';
  List<bool> symptomsValues = [];
  List<String> symptomsTypes = [];
  bool stateChanged = false;
  bool symptomsSelected = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ProductVariantBlocWrapper(
      child: BlocBuilder<ProductVariantBloc, ProductVariantState>(
        builder: (context, productState) {
          return productState.maybeWhen(
            orElse: () => const Offstage(),
            fetched: (productVariants) {
              return BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
                builder: (context, state) {
                  final householdMemberWrapper = state.householdMemberWrapper;

                  final projectBeneficiary =
                      context.beneficiaryType != BeneficiaryType.individual
                          ? [householdMemberWrapper.projectBeneficiaries.first]
                          : householdMemberWrapper.projectBeneficiaries
                              .where(
                                (element) =>
                                    element.beneficiaryClientReferenceId ==
                                    state.selectedIndividual?.clientReferenceId,
                              )
                              .toList();

                  // TODO: Commenting table Data as per current requirement not required
                  /*final filteredHeaderList = [
                    TableHeader(
                      localizations
                          .translate(i18.adverseEvents.resourceHeaderLabel),
                      cellKey: 'resource',
                    ),
                    TableHeader(
                      localizations.translate(
                        i18.adverseEvents.resourceCountHeaderLabel,
                      ),
                      cellKey: 'resourceCount',
                    ),
                  ];

                  final tableData = widget.tasks.first.resources?.map(
                    (e) {
                      final rowTableData = [
                        TableData(
                          productVariants
                              .whereNotNull()
                              .where((p) => p.id == e.productVariantId)
                              .first
                              .sku
                              .toString(),
                          cellKey: 'beneficiary',
                        ),
                        TableData(
                          e.quantity ?? '',
                          cellKey: 'gender',
                        ),
                      ];

                      return TableDataRow(
                        rowTableData,
                      );
                      // rowTableData
                    },
                  ).toList();*/

                  return BlocBuilder<DeliverInterventionBloc,
                      DeliverInterventionState>(
                    builder: (context, deliveryState) {
                      return Scaffold(
                        body: state.loading
                            ? const Center(child: CircularProgressIndicator())
                            : ScrollableContent(
                                header: const BackNavigationHelpHeaderWidget(),
                                footer: SizedBox(
                                  height: 100,
                                  child: DigitCard(
                                    child: DigitElevatedButton(
                                      onPressed: () async {
                                        if (symptomsValues.any((e) => e)) {
                                          setState(() {
                                            symptomsSelected = true;
                                          });
                                          final router = context.router;

                                          final shouldSubmit =
                                              await DigitDialog.show<bool>(
                                            context,
                                            options: DigitDialogOptions(
                                              titleText:
                                                  localizations.translate(
                                                i18.deliverIntervention
                                                    .dialogTitle,
                                              ),
                                              contentText:
                                                  localizations.translate(
                                                i18.deliverIntervention
                                                    .dialogContent,
                                              ),
                                              primaryAction: DigitDialogActions(
                                                label: localizations.translate(
                                                  i18.common.coreCommonSubmit,
                                                ),
                                                action: (ctx) {
                                                  final List<String> symptoms =
                                                      [];

                                                  for (int i = 0;
                                                      i < symptomsValues.length;
                                                      i++) {
                                                    if (symptomsValues[i]) {
                                                      symptoms.add(
                                                        symptomsTypes[i],
                                                      );
                                                    }
                                                  }

                                                  final clientReferenceId =
                                                      IdGen.i.identifier;
                                                  context
                                                      .read<AdverseEventsBloc>()
                                                      .add(
                                                        AdverseEventsSubmitEvent(
                                                          AdverseEventModel(
                                                            id: null,
                                                            taskClientReferenceId:
                                                                widget
                                                                    .tasks
                                                                    .first
                                                                    .clientReferenceId,
                                                            symptoms: symptoms,
                                                            clientReferenceId:
                                                                clientReferenceId,
                                                            tenantId: envConfig
                                                                .variables
                                                                .tenantId,
                                                            rowVersion: 1,
                                                            auditDetails:
                                                                AuditDetails(
                                                              createdBy: context
                                                                  .loggedInUserUuid,
                                                              createdTime: context
                                                                  .millisecondsSinceEpoch(),
                                                              lastModifiedBy:
                                                                  context
                                                                      .loggedInUserUuid,
                                                              lastModifiedTime:
                                                                  context
                                                                      .millisecondsSinceEpoch(),
                                                            ),
                                                            clientAuditDetails:
                                                                ClientAuditDetails(
                                                              createdBy: context
                                                                  .loggedInUserUuid,
                                                              createdTime: context
                                                                  .millisecondsSinceEpoch(),
                                                              lastModifiedBy:
                                                                  context
                                                                      .loggedInUserUuid,
                                                              lastModifiedTime:
                                                                  context
                                                                      .millisecondsSinceEpoch(),
                                                            ),
                                                          ),
                                                          false,
                                                        ),
                                                      );
                                                  Navigator.of(
                                                    context,
                                                    rootNavigator: true,
                                                  ).pop(true);
                                                },
                                              ),
                                              secondaryAction:
                                                  DigitDialogActions(
                                                label: localizations.translate(
                                                  i18.common.coreCommonCancel,
                                                ),
                                                action: (context) =>
                                                    Navigator.of(
                                                  context,
                                                  rootNavigator: true,
                                                ).pop(false),
                                              ),
                                            ),
                                          );

                                          if (shouldSubmit ?? false) {
                                            final parent =
                                                router.parent() as StackRouter;
                                            parent
                                              ..pop()
                                              ..pop();

                                            router.push(
                                              AcknowledgementRoute(),
                                            );
                                          }
                                        } else {
                                          setState(() {
                                            symptomsSelected = false;
                                          });
                                        }
                                      },
                                      child: Center(
                                        child: Text(
                                          localizations.translate(
                                            i18.common.coreCommonNext,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                children: [
                                  DigitCard(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                localizations.translate(
                                                  i18.adverseEvents
                                                      .sideEffectsLabel,
                                                ),
                                                style: theme
                                                    .textTheme.displayMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const DigitDivider(),
                                        // TODO: Commenting the table data as per current requirement its not needed]
                                        // Align(
                                        //   alignment: Alignment.topLeft,
                                        //   child: Padding(
                                        //     padding:
                                        //         const EdgeInsets.all(8),
                                        //     child: Text(
                                        //       localizations.translate(
                                        //         i18.adverseEvents
                                        //             .resourcesAdministeredLabel,
                                        //       ),
                                        //       style: theme
                                        //           .textTheme.headlineSmall,
                                        //     ),
                                        //   ),
                                        // ),
                                        // const SizedBox(
                                        //   height: 10,
                                        // ),
                                        // DigitTable(
                                        //   headerList: filteredHeaderList,
                                        //   tableData: tableData ?? [],
                                        //   leftColumnWidth: 130,
                                        //   rightColumnWidth:
                                        //       filteredHeaderList.length *
                                        //           17 *
                                        //           6,
                                        //   height: (widget.tasks.first
                                        //                       .resources ??
                                        //                   [])
                                        //               .length <=
                                        //           5
                                        //       ? ((widget.tasks.first
                                        //                           .resources ??
                                        //                       [])
                                        //                   .length +
                                        //               1) *
                                        //           60
                                        //       : 6 * 60,
                                        // ),
                                        // const SizedBox(
                                        //   height: 10,
                                        // ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              '${localizations.translate(
                                                i18.adverseEvents
                                                    .selectSymptomsLabel,
                                              )}*',
                                              style:
                                                  theme.textTheme.headlineSmall,
                                            ),
                                          ),
                                        ),
                                        BlocBuilder<AppInitializationBloc,
                                            AppInitializationState>(
                                          builder: (context, state) =>
                                              state.maybeWhen(
                                            orElse: () => const Offstage(),
                                            initialized: (appConfiguration, _) {
                                              final symptomTypesOptions =
                                                  appConfiguration
                                                          .symptomsTypes ??
                                                      <SymptomsTypes>[];
                                              symptomsTypes =
                                                  symptomTypesOptions
                                                      .map((e) => e.code)
                                                      .toList();

                                              for (var _
                                                  in symptomTypesOptions) {
                                                symptomsValues.add(false);
                                              }

                                              return Column(
                                                children: symptomTypesOptions
                                                    .mapIndexed(
                                                      (i, e) => StatefulBuilder(
                                                        builder: (
                                                          BuildContext context,
                                                          StateSetter
                                                              stateSetter,
                                                        ) {
                                                          return DigitCheckboxTile(
                                                            label: localizations
                                                                .translate(
                                                              e.code,
                                                            ),
                                                            value:
                                                                symptomsValues[
                                                                    i],
                                                            onChanged: (value) {
                                                              stateSetter(
                                                                () {
                                                                  symptomsValues[
                                                                          i] =
                                                                      !symptomsValues[
                                                                          i];
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    )
                                                    .toList(),
                                              );
                                            },
                                          ),
                                        ),
                                        Offstage(
                                          offstage: symptomsSelected,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              localizations.translate(
                                                i18.common.corecommonRequired,
                                              ),
                                              style: TextStyle(
                                                color: theme.colorScheme.error,
                                              ),
                                            ),
                                          ),
                                        ),

                                        // TODO: Commenting the reAdminister Field as not required as per current requirement
                                        /*DigitRadioButtonList<KeyValue>(
                                              labelText:
                                                  localizations.translate(i18
                                                      .adverseEvents
                                                      .didYouReAdministerLabel),
                                              formControlName: _reAdministerKey,
                                              valueMapper: (value) =>
                                                  localizations.translate(
                                                value.label.toUpperCase(),
                                              ),
                                              onValueChange: (value) {
                                                setState(() {
                                                  stateChanged = value.key;
                                                });
                                              },
                                              options: Constants.yesNo,
                                              isRequired: true,
                                            ),
                                            Visibility(
                                              visible: stateChanged,
                                              child: DigitIntegerFormPicker(
                                                form: form,
                                                minimum: 1,
                                                formControlName:
                                                    _noOfTimesReAdministeredKey,
                                                label: localizations.translate(
                                                  i18.adverseEvents
                                                      .noOfTimesReAdministered,
                                                ),
                                                incrementer: true,
                                              ),
                                            ),*/
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  // TODO: Form builder is not needed as only we have MultiValue checklist only as per current requirement
  /*FormGroup buildForm(BuildContext context) {
    final state = context.read<HouseholdOverviewBloc>().state;

    final projectBeneficiary =
        context.beneficiaryType != BeneficiaryType.individual
            ? [state.householdMemberWrapper.projectBeneficiaries.first]
            : state.householdMemberWrapper.projectBeneficiaries
                .where(
                  (element) =>
                      element.beneficiaryClientReferenceId ==
                      state.selectedIndividual?.clientReferenceId,
                )
                .toList();
    final taskData = state.householdMemberWrapper.tasks
        ?.where((element) =>
            element.projectBeneficiaryClientReferenceId ==
            projectBeneficiary.first.clientReferenceId)
        .toList();
    final adverseEventData = state.householdMemberWrapper.adverseEvents
        ?.where((element) =>
            element.taskClientReferenceId == taskData?.first.clientReferenceId)
        .toList();

    return fb.group(<String, Object>{
      _noOfTimesReAdministeredKey: FormControl<int>(
        value: adverseEventData?.firstOrNull?.reAttempts != null &&
                adverseEventData?.firstOrNull?.reAttempts != 0
            ? int.tryParse(adverseEventData!.firstOrNull!.reAttempts.toString())
            : 1,
        validators: stateChanged
            ? [
                Validators.required,
                Validators.min(1),
              ]
            : [],
      ),
      _reAdministerKey: FormControl<KeyValue>(
        value: KeyValue(
          (adverseEventData?.firstOrNull?.reAttempts != 0)
              ? Constants.yesNo.first.label
              : Constants.yesNo.last.label,
          adverseEventData?.firstOrNull?.reAttempts != 0 ? true : false,
        ),
        validators: [Validators.required],
      ),
    });
  }*/
}
