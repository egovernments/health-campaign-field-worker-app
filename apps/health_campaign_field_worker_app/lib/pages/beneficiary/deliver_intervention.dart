import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_stepper.dart';
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
  static const _resourceDeliveredKey = 'resourceDelivered';
  static const _quantityDistributedKey = 'quantityDistributed';
  static const _deliveryCommentKey = 'deliveryComment';
  static const _doseAdministrationKey = 'doseAdministered';
  static const _dateOfAdministrationKey = 'dateOfAdministration';
  bool doseAdministered = false;
  final List _controllers = [];

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
          final currentCycle = context.read<DeliverInterventionBloc>().state;

          int currentCyclestate = currentCycle.cycle;
          int currentDoseState = currentCycle.dose;

          final projectState = context.read<ProjectBloc>().state;
          //todo need to be removed [0]
          List<ProductVariantsModel>? productVariants = projectState
              .projectType
              ?.cycles?[currentCyclestate]
              .deliveries?[currentDoseState]
              .productVariants;

          final int numberOfDoses = projectState
                  .projectType?.cycles?[currentCyclestate].deliveries?.length ??
              0;
          final steps = generateSteps(numberOfDoses);

          String? deliveryStrategy;

          if (currentCyclestate >= 0 &&
              currentCyclestate < projectState.projectType!.cycles!.length) {
            // Access the 'deliveries' list for the current cycle
            var currentCycleData =
                projectState.projectType!.cycles![currentCyclestate];

            // Check if the currentDose index is within the bounds of the 'deliveries' list for the current cycle
            if (currentDoseState >= 0 &&
                currentDoseState < currentCycleData.deliveries!.length) {
              // Access the 'deliveryStrategy' for the current dose in the current cycle
              var currentDoseData =
                  currentCycleData.deliveries![currentDoseState];
              deliveryStrategy = currentDoseData.deliveryStrategy;
            } else {
              print('getCurrentDose is out of bounds for the current cycle.');
            }
          } else {
            print('getCurrentCycle is out of bounds.');
          }

          return Scaffold(
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : BlocBuilder<DeliverInterventionBloc,
                    DeliverInterventionState>(
                    builder: (context, deliveryInterventionstate) {
                      List<ProductVariantsModel>? productVariants = projectState
                          .projectType
                          ?.cycles?[deliveryInterventionstate.cycle == 0
                              ? deliveryInterventionstate.cycle
                              : deliveryInterventionstate.cycle - 1]
                          .deliveries?[deliveryInterventionstate.dose]
                          .productVariants;

                      final int numberOfDoses = projectState
                              .projectType
                              ?.cycles?[deliveryInterventionstate.cycle == 0
                                  ? deliveryInterventionstate.cycle
                                  : deliveryInterventionstate.cycle - 1]
                              .deliveries
                              ?.length ??
                          0;
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
                                    footer: BlocBuilder<DeliverInterventionBloc,
                                        DeliverInterventionState>(
                                      builder: (context, state) {
                                        return SizedBox(
                                          height: 85,
                                          child: DigitCard(
                                            margin: const EdgeInsets.only(
                                              top: 10,
                                            ),
                                            child: DigitElevatedButton(
                                              onPressed: () async {
                                                final shouldSubmit =
                                                    await DigitDialog.show<
                                                        bool>(
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
                                                    primaryAction:
                                                        DigitDialogActions(
                                                      label: localizations
                                                          .translate(
                                                        i18.common
                                                            .coreCommonSubmit,
                                                      ),
                                                      action: (ctx) {
                                                        Navigator.of(
                                                          context,
                                                          rootNavigator: true,
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
                                                      action: (context) =>
                                                          Navigator.of(
                                                        context,
                                                        rootNavigator: true,
                                                      ).pop(false),
                                                    ),
                                                  ),
                                                );

                                                if (shouldSubmit ?? false) {
                                                  if (context.mounted) {
                                                    context.router
                                                        .popUntilRouteWithName(
                                                      BeneficiaryWrapperRoute
                                                          .name,
                                                    );
                                                    context
                                                        .read<
                                                            DeliverInterventionBloc>()
                                                        .add(
                                                          DeliverInterventionSubmitEvent(
                                                            _getTaskModel(
                                                              context,
                                                              form: form,
                                                              oldTask: null,
                                                              projectBeneficiaryClientReferenceId:
                                                                  projectBeneficiary
                                                                      .first
                                                                      .clientReferenceId,
                                                              dose:
                                                                  deliveryInterventionstate
                                                                          .dose +
                                                                      1,
                                                              cycle:
                                                                  deliveryInterventionstate
                                                                      .cycle,
                                                              address:
                                                                  householdMemberWrapper
                                                                      .members
                                                                      .first
                                                                      .address
                                                                      ?.first,
                                                            ),
                                                            false,
                                                            context.boundary,
                                                          ),
                                                        );

                                                    if (deliveryStrategy ==
                                                        "INDIRECT") {
                                                      // TODO [Need to make it as enum]
                                                      context.router.push(
                                                        SplashAcknowledgementRoute(
                                                          isSearch: false,
                                                        ),
                                                      );
                                                    } else {
                                                      context.router.push(
                                                        SplashAcknowledgementRoute(
                                                          isSearch: true,
                                                        ),
                                                      );
                                                    }
                                                  }
                                                }
                                              },
                                              child: Center(
                                                child: Text(
                                                  localizations.translate(
                                                    i18.common.coreCommonSubmit,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    header: const Column(children: [
                                      BackNavigationHelpHeaderWidget(),
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
                                                const DigitTextFormField(
                                                  readOnly: true,
                                                  formControlName:
                                                      _doseAdministrationKey,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  label: 'Current cycle',
                                                  //TODO : [Need to change this to i18 localization ]
                                                ),
                                                DigitStepper(
                                                  activeStep:
                                                      deliveryInterventionstate
                                                          .dose,
                                                  steps: steps,
                                                  maxStepReached: 3,
                                                  lineLength:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          5,
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
                                                  isRequired: false,
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
                                                      .textTheme.displayMedium,
                                                ),
                                                ..._controllers
                                                    .map((e) =>
                                                        ResourceBeneficiaryCard(
                                                          form: form,
                                                          cardIndex:
                                                              _controllers
                                                                  .indexOf(e),
                                                          onDelete: (index) {
                                                            (form.control(
                                                              _resourceDeliveredKey,
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
                                                DigitIconButton(
                                                  onPressed: () async {
                                                    addController(form);
                                                    setState(() {
                                                      _controllers.add(
                                                        productVariants?.length,
                                                      );
                                                    });
                                                  },
                                                  icon: Icons.add,
                                                  iconText:
                                                      localizations.translate(
                                                    i18.deliverIntervention
                                                        .resourceAddBeneficiary,
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
                                                      .textTheme.displayMedium,
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

                                                    return DigitReactiveDropdown<
                                                        String>(
                                                      label: localizations
                                                          .translate(
                                                        i18.deliverIntervention
                                                            .deliveryCommentLabel,
                                                      ),
                                                      valueMapper: (value) =>
                                                          value,
                                                      initialValue:
                                                          deliveryCommentOptions
                                                              .firstOrNull
                                                              ?.name,
                                                      menuItems:
                                                          deliveryCommentOptions
                                                              .map((e) {
                                                        return localizations
                                                            .translate(e.name);
                                                      }).toList(),
                                                      formControlName:
                                                          _deliveryCommentKey,
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
    String? projectBeneficiaryClientReferenceId,
    AddressModel? address,
  }) {
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

    final productvariantList =
        ((form.control(_resourceDeliveredKey) as FormArray).value
            as List<ProductVariantModel?>);
    task = task.copyWith(
      projectId: context.projectId,
      resources: productvariantList
          .map((e) => TaskResourceModel(
                taskclientReferenceId: clientReferenceId,
                clientReferenceId: IdGen.i.identifier,
                productVariantId: e?.id,
                taskId: task?.id,
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
      additionalFields: TaskAdditionalFields(
        version: task.additionalFields?.version ?? 1,
        fields: [
          AdditionalField(
            'DateOfDelivery',
            DateTime.now().millisecondsSinceEpoch.toString(),
          ),
          AdditionalField(
            'DateOfAdministration',
            DateTime.now().millisecondsSinceEpoch.toString(),
          ),
          AdditionalField(
            'DateOfVerification',
            DateTime.now().millisecondsSinceEpoch.toString(),
          ),
          AdditionalField(
            'CycleIndex',
            "0${cycle == 0 ? 1 : cycle ?? 1}",
          ),
          AdditionalField(
            'DoseIndex',
            "0${dose == 0 ? 1 : dose ?? 1}",
          ),
        ],
      ),
    );

    return task;
  }

  FormGroup buildForm(
    BuildContext context,
    List<ProductVariantsModel>? productVariants,
    List<ProductVariantModel>? variants,
  ) {
    final currentCycle = context.read<DeliverInterventionBloc>().state;

    _controllers
        .addAll(productVariants!.map((e) => productVariants.indexOf(e)));

    return fb.group(<String, Object>{
      _doseAdministrationKey: FormControl<String>(
        value: 'Cycle ${currentCycle.cycle}'.toString(),
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
                    ? variants[_controllers.indexOf(e)]
                    : null,
              )),
        ],
      ),
      _quantityDistributedKey: FormArray<int>([
        ..._controllers.map(
          (e) => FormControl<int>(value: 0, validators: [Validators.min(1)]),
        ),
      ]),
    });
  }
}
