import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_stepper.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/models/entities/deliver_strategy_type.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';
import 'package:registration_delivery/utils/utils.dart';

import '../../models/entities/additional_fields_type.dart';
import '../../models/entities/status.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/beneficiary/resource_beneficiary_card.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../widgets/localized.dart';

@RoutePage()
class DeliverInterventionPage extends LocalizedStatefulWidget {
  final bool isEditing;

  const DeliverInterventionPage({
    super.key,
    super.appLocalizations,
    this.isEditing = false,
  });

  @override
  State<DeliverInterventionPage> createState() =>
      DeliverInterventionPageState();
}

class DeliverInterventionPageState
    extends LocalizedState<DeliverInterventionPage> {
  // Constants for form control keys
  static const _resourceDeliveredKey = 'resourceDelivered';
  static const _quantityDistributedKey = 'quantityDistributed';
  static const _deliveryCommentKey = 'deliveryComment';
  static const _doseAdministrationKey = 'doseAdministered';
  static const _dateOfAdministrationKey = 'dateOfAdministration';
  final clickedStatus = ValueNotifier<bool>(false);
  bool? shouldSubmit = false;

  // Variable to track dose administration status
  bool doseAdministered = false;

  // List of controllers for form elements
  final List _controllers = [];

// Initialize the currentStep variable to keep track of the current step in a process.
  int currentStep = 0;

  @override
  void initState() {
    context.read<LocationBloc>().add(const LoadLocationEvent());
    super.initState();
  }

  Future<void> handleCapturedLocationState(
      LocationState locationState,
      BuildContext context,
      DeliverInterventionState deliverInterventionState,
      FormGroup form,
      HouseholdMemberWrapper householdMember,
      ProjectBeneficiaryModel projectBeneficiary) async {
    final lat = locationState.latitude;
    final long = locationState.longitude;
    context.read<DeliverInterventionBloc>().add(
          DeliverInterventionSubmitEvent(
              task: _getTaskModel(
                context,
                form: form,
                oldTask: RegistrationDeliverySingleton().beneficiaryType ==
                        BeneficiaryType.household
                    ? deliverInterventionState.tasks?.last
                    : null,
                projectBeneficiaryClientReferenceId:
                    projectBeneficiary.clientReferenceId,
                dose: deliverInterventionState.dose,
                cycle: deliverInterventionState.cycle,
                deliveryStrategy: DeliverStrategyType.direct.toValue(),
                address: householdMember.members?.first.address?.first,
                latitude: lat,
                longitude: long,
              ),
              isEditing: (deliverInterventionState.tasks ?? []).isNotEmpty &&
                      RegistrationDeliverySingleton().beneficiaryType ==
                          BeneficiaryType.household
                  ? true
                  : false,
              boundaryModel: RegistrationDeliverySingleton().boundary!,
              navigateToSummary: true,
              householdMemberWrapper: householdMember),
        );
    context.router.push(DeliverySummaryRoute());
  }

  void handleLocationState(
      LocationState locationState,
      BuildContext context,
      DeliverInterventionState deliverInterventionState,
      FormGroup form,
      HouseholdMemberWrapper householdMember,
      ProjectBeneficiaryModel projectBeneficiary) {
    if (context.mounted) {
      DigitComponentsUtils().showLocationCapturingDialog(
          context,
          localizations.translate(i18.common.locationCapturing),
          DigitSyncDialogType.inProgress);

      Future.delayed(const Duration(seconds: 2), () {
        // After delay, hide the initial dialog
        DigitComponentsUtils().hideLocationDialog(context);
        handleCapturedLocationState(
            locationState,
            context,
            deliverInterventionState,
            form,
            householdMember,
            projectBeneficiary);
      });
    }
  }

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
              RegistrationDeliverySingleton().beneficiaryType !=
                      BeneficiaryType.individual
                  ? [householdMemberWrapper.projectBeneficiaries!.first]
                  : householdMemberWrapper.projectBeneficiaries
                      ?.where(
                        (element) =>
                            element.beneficiaryClientReferenceId ==
                            state.selectedIndividual?.clientReferenceId,
                      )
                      .toList();

          return Scaffold(
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : BlocBuilder<DeliverInterventionBloc,
                    DeliverInterventionState>(
                    builder: (context, deliveryInterventionState) {
                      List<DeliveryProductVariant>? productVariants =
                          RegistrationDeliverySingleton()
                                      .selectedProject
                                      ?.additionalDetails
                                      ?.projectType
                                      ?.cycles
                                      ?.isNotEmpty ==
                                  true
                              ? (fetchProductVariant(
                                      RegistrationDeliverySingleton()
                                              .selectedProject
                                              ?.additionalDetails
                                              ?.projectType
                                              ?.cycles![
                                                  deliveryInterventionState
                                                          .cycle -
                                                      1]
                                              .deliveries?[
                                          deliveryInterventionState.dose - 1],
                                      state.selectedIndividual,
                                      state.householdMemberWrapper.household)
                                  ?.productVariants)
                              : RegistrationDeliverySingleton()
                                  .selectedProject
                                  ?.additionalDetails
                                  ?.projectType
                                  ?.resources
                                  ?.map((r) => DeliveryProductVariant(
                                      productVariantId: r.productVariantId))
                                  .toList();

                      final int numberOfDoses = (RegistrationDeliverySingleton()
                                  .projectType
                                  ?.cycles
                                  ?.isNotEmpty ==
                              true)
                          ? (RegistrationDeliverySingleton()
                                  .projectType
                                  ?.cycles?[deliveryInterventionState.cycle - 1]
                                  .deliveries
                                  ?.length) ??
                              0
                          : 0;

                      final steps = generateSteps(numberOfDoses);
                      if ((productVariants ?? []).isEmpty && context.mounted) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          DigitToast.show(
                            context,
                            options: DigitToastOptions(
                              localizations.translate(
                                i18.deliverIntervention
                                    .checkForProductVariantsConfig,
                              ),
                              true,
                              theme,
                            ),
                          );
                        });
                      }

                      return BlocBuilder<ProductVariantBloc,
                          ProductVariantState>(
                        builder: (context, productState) {
                          return productState.maybeWhen(
                            orElse: () => const Offstage(),
                            fetched: (productVariantsValue) {
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
                                              return BlocBuilder<LocationBloc,
                                                      LocationState>(
                                                  builder:
                                                      (context, locationState) {
                                                return DigitElevatedButton(
                                                  onPressed: isClicked
                                                      ? null
                                                      : () async {
                                                          final deliveredProducts =
                                                              ((form.control(
                                                            _resourceDeliveredKey,
                                                          ) as FormArray)
                                                                      .value
                                                                  as List<
                                                                      ProductVariantModel?>);
                                                          if (hasDuplicatesOrEmptyResource(
                                                              deliveredProducts)) {
                                                            await DigitToast
                                                                .show(
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
                                                              .any((e) => e == 0)) {
                                                            await DigitToast
                                                                .show(
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
                                                            context
                                                                .read<
                                                                    LocationBloc>()
                                                                .add(
                                                                    const LoadLocationEvent());
                                                            handleLocationState(
                                                                locationState,
                                                                context,
                                                                deliveryInterventionState,
                                                                form,
                                                                householdMemberWrapper,
                                                                projectBeneficiary!
                                                                    .first);
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
                                              });
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
                                                if (RegistrationDeliverySingleton()
                                                        .beneficiaryType ==
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
                                                if (numberOfDoses > 1)
                                                  DigitStepper(
                                                    activeStep:
                                                        deliveryInterventionState
                                                                .dose -
                                                            1,
                                                    stepRadius: 12.5,
                                                    steps: steps,
                                                    maxStepReached: 3,
                                                    lineLength: (MediaQuery.of(
                                                                    context)
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
                                                ..._controllers.map((e) =>
                                                    ResourceBeneficiaryCard(
                                                      form: form,
                                                      cardIndex: _controllers
                                                          .indexOf(e),
                                                      totalItems:
                                                          _controllers.length,
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
                                                        _controllers.removeAt(
                                                          index,
                                                        );
                                                        setState(() {
                                                          _controllers;
                                                        });
                                                      },
                                                    )),
                                                Center(
                                                  child: DigitIconButton(
                                                    onPressed: ((form.control(_resourceDeliveredKey)
                                                                            as FormArray)
                                                                        .value ??
                                                                    [])
                                                                .length <
                                                            (productVariants ??
                                                                    [])
                                                                .length
                                                        ? () async {
                                                            addController(form);
                                                            setState(() {
                                                              _controllers.add(
                                                                _controllers
                                                                    .length,
                                                              );
                                                            });
                                                          }
                                                        : null,
                                                    icon: Icons.add_circle,
                                                    iconColor: ((form.control(_resourceDeliveredKey)
                                                                            as FormArray)
                                                                        .value ??
                                                                    [])
                                                                .length <
                                                            (productVariants ??
                                                                    [])
                                                                .length
                                                        ? theme.colorScheme
                                                            .secondary
                                                        : theme.colorScheme
                                                            .outline,
                                                    iconTextColor: ((form.control(_resourceDeliveredKey)
                                                                            as FormArray)
                                                                        .value ??
                                                                    [])
                                                                .length <
                                                            (productVariants ??
                                                                    [])
                                                                .length
                                                        ? theme.colorScheme
                                                            .secondary
                                                        : theme.colorScheme
                                                            .outline,
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
                                                        .deliveryCommentHeading,
                                                  ),
                                                  style: theme
                                                      .textTheme.headlineLarge,
                                                ),
                                                DigitReactiveSearchDropdown<
                                                    String>(
                                                  label:
                                                      localizations.translate(
                                                    i18.deliverIntervention
                                                        .deliveryCommentLabel,
                                                  ),
                                                  form: form,
                                                  menuItems:
                                                      RegistrationDeliverySingleton()
                                                          .deliveryCommentOptions!
                                                          .map((e) {
                                                    return localizations
                                                        .translate(e);
                                                  }).toList()
                                                        ..sort((a, b) =>
                                                            a.compareTo(b)),
                                                  formControlName:
                                                      _deliveryCommentKey,
                                                  valueMapper: (value) => value,
                                                  emptyText: localizations
                                                      .translate(i18
                                                          .common.noMatchFound),
                                                )
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

  bool hasDuplicatesOrEmptyResource(
      List<ProductVariantModel?> deliveredProducts) {
    final Map<String?, List<ProductVariantModel?>> groupedVariants = {};
    if (deliveredProducts.isNotEmpty) {
      for (final variant in deliveredProducts) {
        final productId = variant?.productId;
        if (productId != null) {
          groupedVariants.putIfAbsent(productId, () => []);
          groupedVariants[productId]?.add(variant);
        }
      }
      bool hasDuplicateProductIdOrNoProductId =
          deliveredProducts.any((ele) => ele?.productId == null);

      return hasDuplicateProductIdOrNoProductId;
    }

    return true;
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
    double? latitude,
    double? longitude,
  }) {
    // Initialize task with oldTask if available, or create a new one
    var task = oldTask;
    var clientReferenceId = task?.clientReferenceId ?? IdGen.i.identifier;
    task ??= TaskModel(
      projectBeneficiaryClientReferenceId: projectBeneficiaryClientReferenceId,
      clientReferenceId: clientReferenceId,
      address: address?.copyWith(
        relatedClientReferenceId: clientReferenceId,
      ),
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
      ),
    );

    // Extract productvariantList from the form
    final productvariantList =
        ((form.control(_resourceDeliveredKey) as FormArray).value
            as List<ProductVariantModel?>);
    final deliveryComment = form.control(_deliveryCommentKey).value as String?;
    // Update the task with information from the form and other context
    task = task.copyWith(
      projectId: RegistrationDeliverySingleton().projectId,
      resources: productvariantList
          .map((e) => TaskResourceModel(
                taskclientReferenceId: clientReferenceId,
                clientReferenceId: IdGen.i.identifier,
                productVariantId: e?.id,
                isDelivered: true,
                taskId: task?.id,
                tenantId: RegistrationDeliverySingleton().tenantId,
                rowVersion: oldTask?.rowVersion ?? 1,
                quantity: (((form.control(_quantityDistributedKey) as FormArray)
                        .value)?[productvariantList.indexOf(e)])
                    .toString(),
                clientAuditDetails: ClientAuditDetails(
                  createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
                  createdTime: context.millisecondsSinceEpoch(),
                ),
                auditDetails: AuditDetails(
                  createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
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
            RegistrationDeliveryEnums.name.toValue(),
            RegistrationDeliverySingleton().loggedInUser?.name,
          ),
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
          if (latitude != null)
            AdditionalField(
              AdditionalFieldsType.latitude.toValue(),
              latitude,
            ),
          if (longitude != null)
            AdditionalField(
              AdditionalFieldsType.longitude.toValue(),
              longitude,
            ),
          if (deliveryComment != null &&
              deliveryComment.trim().toString().isNotEmpty)
            AdditionalField(
              AdditionalFieldsType.deliveryComment.toValue(),
              deliveryComment,
            ),
        ],
      ),
    );

    return task;
  }

// This method builds a form used for delivering interventions.

  FormGroup buildForm(
    BuildContext context,
    List<DeliveryProductVariant>? productVariants,
    List<ProductVariantModel>? variants,
  ) {
    final bloc = context.read<DeliverInterventionBloc>().state;
    final overViewbloc = context.read<HouseholdOverviewBloc>().state;
    _controllers.forEachIndexed((index, element) {
      _controllers.removeAt(index);
    });

    // Add controllers for each product variant to the _controllers list.
    if (_controllers.isEmpty) {
      final int r = RegistrationDeliverySingleton()
                  .selectedProject
                  ?.additionalDetails
                  ?.projectType
                  ?.cycles ==
              null
          ? 1
          : fetchProductVariant(
                      RegistrationDeliverySingleton()
                          .selectedProject
                          ?.additionalDetails
                          ?.projectType
                          ?.cycles![bloc.cycle - 1]
                          .deliveries?[bloc.dose - 1],
                      overViewbloc.selectedIndividual,
                      overViewbloc.householdMemberWrapper.household)!
                  .productVariants
                  ?.length ??
              0;

      _controllers.addAll(List.generate(r, (index) => index)
          .mapIndexed((index, element) => index));
    }

    return fb.group(<String, Object>{
      _doseAdministrationKey: FormControl<String>(
        value:
            '${localizations.translate(i18.deliverIntervention.cycle)} ${bloc.cycle == 0 ? (bloc.cycle + 1) : bloc.cycle}'
                .toString(),
        validators: [],
      ),
      _deliveryCommentKey: FormControl<String>(
        value: RegistrationDeliverySingleton().beneficiaryType !=
                BeneficiaryType.individual
            ? (bloc.tasks?.last.additionalFields?.fields
                            .where((a) =>
                                a.key ==
                                AdditionalFieldsType.deliveryComment.toValue())
                            .toList() ??
                        [])
                    .isNotEmpty
                ? bloc.tasks?.last.additionalFields?.fields
                    .where((a) =>
                        a.key == AdditionalFieldsType.deliveryComment.toValue())
                    .first
                    .value
                : ''
            : null,
        validators: [],
      ),
      _dateOfAdministrationKey:
          FormControl<DateTime>(value: DateTime.now(), validators: []),
      _resourceDeliveredKey: FormArray<ProductVariantModel>(
        [
          ..._controllers.map((e) => FormControl<ProductVariantModel>(
                value: variants != null && variants.length < _controllers.length
                    ? variants.last
                    : (variants != null &&
                            _controllers.indexOf(e) < variants.length
                        ? variants.firstWhereOrNull(
                            (element) =>
                                element.id ==
                                productVariants
                                    ?.elementAt(_controllers.indexOf(e))
                                    .productVariantId,
                          )
                        : null),
              )),
        ],
      ),
      _quantityDistributedKey: FormArray<int>([
        ..._controllers.mapIndexed(
          (i, e) => FormControl<int>(
            value: RegistrationDeliverySingleton().beneficiaryType !=
                    BeneficiaryType.individual
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
