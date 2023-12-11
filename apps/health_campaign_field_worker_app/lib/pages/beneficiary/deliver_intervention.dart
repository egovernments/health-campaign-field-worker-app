import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_stepper.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/product_variant/product_variant.dart';
import '../../blocs/project/project.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../models/data_model.dart';
import '../../models/project_type/project_type_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/beneficiary/resource_beneficiary_card.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

class DeliverInterventionPage extends LocalizedStatefulWidget {
  final bool isEditing;

  const DeliverInterventionPage({
    super.key,
    super.appLocalizations,
    this.isEditing = false,
  });

  @override
  State<DeliverInterventionPage> createState() =>
      _DeliverInterventionPageState();
}

class _DeliverInterventionPageState
    extends LocalizedState<DeliverInterventionPage> {
  // Constants for form control keys
  static const _resourceDeliveredKey = 'resourceDelivered';
  static const _quantityDistributedKey = 'quantityDistributed';
  static const _deliveryCommentKey = 'deliveryComment';
  static const _doseAdministrationKey = 'doseAdministered';
  static const _dateOfAdministrationKey = 'dateOfAdministration';
  final clickedStatus = ValueNotifier<bool>(false);
  // Variable to track dose administration status
  bool doseAdministered = false;

  // List of controllers for form elements
  final List _controllers = [];

// Initialize the currentStep variable to keep track of the current step in a process.
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    List<StepsModel> generateSteps(int numberOfDoses) {
      return List.generate(numberOfDoses, (index) {
        return StepsModel(
          title:
              '${localizations.translate(i18.deliverIntervention.dose)}${index + 1}',
          number: (index + 1).toString(),
        );
      });
    }

    return ProductVariantBlocWrapper(
      child: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
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

          final projectState = context.read<ProjectBloc>().state;

          return Scaffold(
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : BlocBuilder<DeliverInterventionBloc,
                    DeliverInterventionState>(
                    builder: (context, deliveryInterventionstate) {
                      List<ProductVariantsModel>? productVariants = projectState
                                  .projectType?.cycles?.isNotEmpty ==
                              true
                          ? (fetchProductVariant(
                              projectState
                                  .projectType!
                                  .cycles![deliveryInterventionstate.cycle - 1]
                                  .deliveries?[deliveryInterventionstate
                                      .dose -
                                  1],
                              state.selectedIndividual,
                            )?.productVariants)
                          : projectState.projectType?.resources;

                      final int numberOfDoses = (projectState
                                  .projectType?.cycles?.isNotEmpty ==
                              true)
                          ? (projectState
                                  .projectType
                                  ?.cycles?[deliveryInterventionstate.cycle - 1]
                                  .deliveries
                                  ?.length) ??
                              0
                          : 0;

                      final steps = generateSteps(numberOfDoses);

                      return BlocBuilder<ProductVariantBloc,
                          ProductVariantState>(
                        builder: (context, productState) {
                          return productState.maybeWhen(
                            orElse: () => const Offstage(),
                            fetched: (productVariantsvalue) {
                              final variant = productState.whenOrNull(
                                fetched: (productVariants) {
                                  return productVariants;
                                },
                              );

                              return ReactiveFormBuilder(
                                form: () => buildForm(
                                  context,
                                  productVariants,
                                  variant,
                                ),
                                builder: (context, form, child) {
                                  return ScrollableContent(
                                    enableFixedButton: true,
                                    footer: BlocBuilder<DeliverInterventionBloc,
                                        DeliverInterventionState>(
                                      builder: (context, state) {
                                        return DigitCard(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, kPadding, 0, 0),
                                          padding: const EdgeInsets.fromLTRB(
                                              kPadding, 0, kPadding, 0),
                                          child: ValueListenableBuilder(
                                            valueListenable: clickedStatus,
                                            builder:
                                                (context, bool isClicked, _) {
                                              return DigitElevatedButton(
                                                onPressed: isClicked
                                                    ? null
                                                    : () async {
                                                        if (((form.control(
                                                          _resourceDeliveredKey,
                                                        ) as FormArray)
                                                                    .value
                                                                as List<
                                                                    ProductVariantModel?>)
                                                            .any((ele) =>
                                                                ele?.productId ==
                                                                null)) {
                                                          await DigitToast.show(
                                                            context,
                                                            options:
                                                                DigitToastOptions(
                                                              localizations
                                                                  .translate(i18
                                                                      .deliverIntervention
                                                                      .resourceDeliveredValidation),
                                                              true,
                                                              theme,
                                                            ),
                                                          );
                                                        } else if ((((form
                                                                        .control(
                                                                  _quantityDistributedKey,
                                                                ) as FormArray)
                                                                    .value) ??
                                                                [])
                                                            .any((e) =>
                                                                e == 0)) {
                                                          await DigitToast.show(
                                                            context,
                                                            options:
                                                                DigitToastOptions(
                                                              localizations
                                                                  .translate(i18
                                                                      .deliverIntervention
                                                                      .resourceCannotBeZero),
                                                              true,
                                                              theme,
                                                            ),
                                                          );
                                                        } else {
                                                          final shouldSubmit =
                                                              await DigitDialog
                                                                  .show<bool>(
                                                            context,
                                                            options:
                                                                DigitDialogOptions(
                                                              titleText:
                                                                  localizations
                                                                      .translate(
                                                                i18.deliverIntervention
                                                                    .dialogTitle,
                                                              ),
                                                              contentText:
                                                                  localizations
                                                                      .translate(
                                                                i18.deliverIntervention
                                                                    .dialogContent,
                                                              ),
                                                              primaryAction:
                                                                  DigitDialogActions(
                                                                label: localizations
                                                                    .translate(
                                                                  i18.common
                                                                      .coreCommonSubmit,
                                                                ),
                                                                action: (ctx) {
                                                                  clickedStatus
                                                                          .value =
                                                                      true;
                                                                  Navigator.of(
                                                                    context,
                                                                    rootNavigator:
                                                                        true,
                                                                  ).pop(true);
                                                                },
                                                              ),
                                                              secondaryAction:
                                                                  DigitDialogActions(
                                                                label: localizations
                                                                    .translate(
                                                                  i18.common
                                                                      .coreCommonCancel,
                                                                ),
                                                                action:
                                                                    (context) =>
                                                                        Navigator
                                                                            .of(
                                                                  context,
                                                                  rootNavigator:
                                                                      true,
                                                                ).pop(false),
                                                              ),
                                                            ),
                                                          );

                                                          if (shouldSubmit ??
                                                              false) {
                                                            if (context
                                                                .mounted) {
                                                              context
                                                                  .read<
                                                                      DeliverInterventionBloc>()
                                                                  .add(
                                                                    DeliverInterventionSubmitEvent(
                                                                      _getTaskModel(
                                                                        context,
                                                                        form:
                                                                            form,
                                                                        oldTask:
                                                                            null,
                                                                        projectBeneficiaryClientReferenceId: projectBeneficiary
                                                                            .first
                                                                            .clientReferenceId,
                                                                        dose: deliveryInterventionstate
                                                                            .dose,
                                                                        cycle: deliveryInterventionstate
                                                                            .cycle,
                                                                        deliveryStrategy: DeliverStrategyType
                                                                            .direct
                                                                            .toValue(),
                                                                        address: householdMemberWrapper
                                                                            .members
                                                                            .first
                                                                            .address
                                                                            ?.first,
                                                                      ),
                                                                      false,
                                                                      context
                                                                          .boundary,
                                                                    ),
                                                                  );

                                                              if (state.futureDeliveries !=
                                                                      null &&
                                                                  state
                                                                      .futureDeliveries!
                                                                      .isNotEmpty &&
                                                                  projectState
                                                                          .projectType
                                                                          ?.cycles
                                                                          ?.isNotEmpty ==
                                                                      true) {
                                                                context.router
                                                                    .popUntilRouteWithName(
                                                                  BeneficiaryWrapperRoute
                                                                      .name,
                                                                );
                                                                context.router
                                                                    .push(
                                                                  SplashAcknowledgementRoute(
                                                                    enableBackToSearch:
                                                                        false,
                                                                  ),
                                                                );
                                                              } else {
                                                                final reloadState =
                                                                    context.read<
                                                                        HouseholdOverviewBloc>();

                                                                Future.delayed(
                                                                  const Duration(
                                                                    milliseconds:
                                                                        1000,
                                                                  ),
                                                                  () {
                                                                    reloadState
                                                                        .add(
                                                                      HouseholdOverviewReloadEvent(
                                                                        projectId:
                                                                            context.projectId,
                                                                        projectBeneficiaryType:
                                                                            context.beneficiaryType,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) {
                                                                  context.router
                                                                      .popAndPush(
                                                                    HouseholdAcknowledgementRoute(
                                                                      enableViewHousehold:
                                                                          true,
                                                                    ),
                                                                  );
                                                                });
                                                              }
                                                            }
                                                          }
                                                        }
                                                      },
                                                child: Center(
                                                  child: Text(
                                                    localizations.translate(
                                                      i18.common
                                                          .coreCommonSubmit,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    header: const Column(children: [
                                      BackNavigationHelpHeaderWidget(
                                        showHelp: false,
                                      ),
                                    ]),
                                    children: [
                                      Column(
                                        children: [
                                          DigitCard(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  localizations.translate(
                                                    i18.deliverIntervention
                                                        .deliverInterventionLabel,
                                                  ),
                                                  style: theme
                                                      .textTheme.displayMedium,
                                                ),
                                                if (context.beneficiaryType ==
                                                    BeneficiaryType.individual)
                                                  DigitTextFormField(
                                                    readOnly: true,
                                                    formControlName:
                                                        _doseAdministrationKey,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    label: localizations
                                                        .translate(i18
                                                            .deliverIntervention
                                                            .currentCycle),
                                                  ),
                                                DigitStepper(
                                                  activeStep:
                                                      deliveryInterventionstate
                                                              .dose -
                                                          1,
                                                  stepRadius: 12.5,
                                                  steps: steps,
                                                  maxStepReached: 3,
                                                  lineLength:
                                                      (MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              12.5 *
                                                                  2 *
                                                                  steps.length -
                                                              50) /
                                                          (steps.length - 1),
                                                ),
                                                DigitDateFormPicker(
                                                  isEnabled: false,
                                                  formControlName:
                                                      _dateOfAdministrationKey,
                                                  label:
                                                      localizations.translate(
                                                    i18.householdDetails
                                                        .dateOfRegistrationLabel,
                                                  ),
                                                  confirmText:
                                                      localizations.translate(
                                                    i18.common.coreCommonOk,
                                                  ),
                                                  cancelText:
                                                      localizations.translate(
                                                    i18.common.coreCommonCancel,
                                                  ),
                                                  isRequired: false,
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: kPadding,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          DigitCard(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  localizations.translate(
                                                    i18.deliverIntervention
                                                        .deliverInterventionResourceLabel,
                                                  ),
                                                  style: theme
                                                      .textTheme.headlineLarge,
                                                ),
                                                ..._controllers
                                                    .map((e) =>
                                                        ResourceBeneficiaryCard(
                                                          form: form,
                                                          cardIndex:
                                                              _controllers
                                                                  .indexOf(e),
                                                          totalItems:
                                                              _controllers
                                                                  .length,
                                                          onDelete: (index) {
                                                            (form.control(
                                                              _resourceDeliveredKey,
                                                            ) as FormArray)
                                                                .removeAt(
                                                              index,
                                                            );
                                                            (form.control(
                                                              _quantityDistributedKey,
                                                            ) as FormArray)
                                                                .removeAt(
                                                              index,
                                                            );
                                                            _controllers
                                                                .removeAt(
                                                              index,
                                                            );
                                                            setState(() {
                                                              _controllers;
                                                            });
                                                          },
                                                        ))
                                                    .toList(),
                                                Center(
                                                  child: DigitIconButton(
                                                    onPressed: () async {
                                                      addController(form);
                                                      setState(() {
                                                        _controllers.add(
                                                          _controllers.length,
                                                        );
                                                      });
                                                    },
                                                    icon: Icons.add_circle,
                                                    iconText:
                                                        localizations.translate(
                                                      i18.deliverIntervention
                                                          .resourceAddBeneficiary,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          DigitCard(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  localizations.translate(
                                                    i18.deliverIntervention
                                                        .deliveryCommentLabel,
                                                  ),
                                                  style: theme
                                                      .textTheme.headlineLarge,
                                                ),
                                                BlocBuilder<
                                                    AppInitializationBloc,
                                                    AppInitializationState>(
                                                  builder: (context, state) {
                                                    if (state
                                                        is! AppInitialized) {
                                                      return const Offstage();
                                                    }

                                                    final deliveryCommentOptions = state
                                                            .appConfiguration
                                                            .deliveryCommentOptions ??
                                                        <DeliveryCommentOptions>[];

                                                    return DigitReactiveSearchDropdown<
                                                        String>(
                                                      label: localizations
                                                          .translate(
                                                        i18.deliverIntervention
                                                            .deliveryCommentLabel,
                                                      ),
                                                      form: form,
                                                      menuItems:
                                                          deliveryCommentOptions
                                                              .map((e) {
                                                        return localizations
                                                            .translate(e.name);
                                                      }).toList(),
                                                      formControlName:
                                                          _deliveryCommentKey,
                                                      valueMapper: (value) =>
                                                          value,
                                                      emptyText: localizations
                                                          .translate(i18.common
                                                              .noMatchFound),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
        },
      ),
    );
  }

  addController(FormGroup form) {
    (form.control(_resourceDeliveredKey) as FormArray)
        .add(FormControl<ProductVariantModel>());
    (form.control(_quantityDistributedKey) as FormArray)
        .add(FormControl<int>(value: 0, validators: [Validators.min(1)]));
  }

  // ignore: long-parameter-list
  TaskModel _getTaskModel(
    BuildContext context, {
    required FormGroup form,
    TaskModel? oldTask,
    int? cycle,
    int? dose,
    String? deliveryStrategy,
    String? projectBeneficiaryClientReferenceId,
    AddressModel? address,
  }) {
    // Initialize task with oldTask if available, or create a new one
    var task = oldTask;
    var clientReferenceId = task?.clientReferenceId ?? IdGen.i.identifier;
    task ??= TaskModel(
      projectBeneficiaryClientReferenceId: projectBeneficiaryClientReferenceId,
      clientReferenceId: clientReferenceId,
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
    );

    // Extract productvariantList from the form
    final productvariantList =
        ((form.control(_resourceDeliveredKey) as FormArray).value
            as List<ProductVariantModel?>);

    // Update the task with information from the form and other context
    task = task.copyWith(
      projectId: context.projectId,
      resources: productvariantList
          .map((e) => TaskResourceModel(
                taskclientReferenceId: clientReferenceId,
                clientReferenceId: IdGen.i.identifier,
                productVariantId: e?.id,
                isDelivered: true,
                taskId: task?.id,
                tenantId: envConfig.variables.tenantId,
                rowVersion: oldTask?.rowVersion ?? 1,
                quantity: (((form.control(_quantityDistributedKey) as FormArray)
                        .value)?[productvariantList.indexOf(e)])
                    .toString(),
                clientAuditDetails: ClientAuditDetails(
                  createdBy: context.loggedInUserUuid,
                  createdTime: context.millisecondsSinceEpoch(),
                ),
                auditDetails: AuditDetails(
                  createdBy: context.loggedInUserUuid,
                  createdTime: context.millisecondsSinceEpoch(),
                ),
              ))
          .toList(),
      address: address?.copyWith(
        relatedClientReferenceId: clientReferenceId,
        id: null,
      ),
      status: Status.administeredSuccess.toValue(),
      additionalFields: TaskAdditionalFields(
        version: task.additionalFields?.version ?? 1,
        fields: [
          AdditionalField(
            AdditionalFieldsType.dateOfDelivery.toValue(),
            DateTime.now().millisecondsSinceEpoch.toString(),
          ),
          AdditionalField(
            AdditionalFieldsType.dateOfAdministration.toValue(),
            DateTime.now().millisecondsSinceEpoch.toString(),
          ),
          AdditionalField(
            AdditionalFieldsType.dateOfVerification.toValue(),
            DateTime.now().millisecondsSinceEpoch.toString(),
          ),
          AdditionalField(
            AdditionalFieldsType.cycleIndex.toValue(),
            "0${cycle ?? 1}",
          ),
          AdditionalField(
            AdditionalFieldsType.doseIndex.toValue(),
            "0${dose ?? 1}",
          ),
          AdditionalField(
            AdditionalFieldsType.deliveryStrategy.toValue(),
            deliveryStrategy,
          ),
        ],
      ),
    );

    return task;
  }

// This method builds a form used for delivering interventions.

  FormGroup buildForm(
    BuildContext context,
    List<ProductVariantsModel>? productVariants,
    List<ProductVariantModel>? variants,
  ) {
    final bloc = context.read<DeliverInterventionBloc>().state;

    // Add controllers for each product variant to the _controllers list.

    _controllers
        .addAll(productVariants!.map((e) => productVariants.indexOf(e)));

    return fb.group(<String, Object>{
      _doseAdministrationKey: FormControl<String>(
        value:
            '${localizations.translate(i18.deliverIntervention.cycle)} ${bloc.cycle == 0 ? (bloc.cycle + 1) : bloc.cycle}'
                .toString(),
        validators: [],
      ),
      _deliveryCommentKey: FormControl<String>(
        value: '',
        validators: [],
      ),
      _dateOfAdministrationKey:
          FormControl<DateTime>(value: DateTime.now(), validators: []),
      _resourceDeliveredKey: FormArray<ProductVariantModel>(
        [
          ..._controllers.map((e) => FormControl<ProductVariantModel>(
                value: variants != null &&
                        _controllers.indexOf(e) < variants.length
                    ? variants.firstWhereOrNull(
                        (element) =>
                            element.id ==
                            productVariants
                                .elementAt(_controllers.indexOf(e))
                                .productVariantId,
                      )
                    : null,
              )),
        ],
      ),
      _quantityDistributedKey: FormArray<int>([
        ..._controllers.mapIndexed(
          (i, e) => FormControl<int>(
            value: context.beneficiaryType != BeneficiaryType.individual
                ? int.tryParse(
                    bloc.tasks?.last.resources?.elementAt(i).quantity ?? '0',
                  )
                : 0,
            validators: [Validators.min(1)],
          ),
        ),
      ]),
    });
  }
}
