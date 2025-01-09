import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
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
import '../../utils/component_mapper/deliver_intervention_component_mapper.dart';
import '../../utils/convert_to_map.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/beneficiary/resource_beneficiary_card.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../widgets/localized.dart';

@RoutePage()
class DeliverInterventionPage extends LocalizedStatefulWidget {
  final List<RegistrationDeliveryFormConfig>? widgetConfig;
  final bool isEditing;

  const DeliverInterventionPage({
    this.widgetConfig,
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
  static const resourceDeliveredKey = 'resourceDelivered';
  static const quantityDistributedKey = 'quantityDistributed';
  static const deliveryCommentKey = 'deliveryComment';
  static const doseAdministrationKey = 'doseAdministered';
  static const dateOfAdministrationKey = 'dateOfAdministration';
  final clickedStatus = ValueNotifier<bool>(false);
  bool? shouldSubmit = false;
  DeliverInterventionComponentMapper mapper =
      DeliverInterventionComponentMapper();

  // Variable to track dose administration status
  bool doseAdministered = false;

  // List of controllers for form elements
  final List _controllers = [];

// Initialize the currentStep variable to keep track of the current step in a process.
  int currentStep = 0;

  @override
  void initState() {
    context.read<LocationBloc>().add(const LoadLocationEvent());
    if (widget.widgetConfig != null) {
      final converter = FieldConverter(widget.widgetConfig);
      mapper.configs = converter.convertWidgetConfigToJsonByName(DeliverInterventionRoute.name)!;
    }
    super.initState();
  }

  void updateState(final form, final controllers, String task) async {
    if (task == "delete") {
      setState(() {
        controllers;
      });
    } else {
      addController(form);
      setState(() {
        controllers.add(
          controllers.length,
        );
      });
    }
  }

  Future<void> handleCapturedLocationState(
      LocationState locationState,
      BuildContext context,
      DeliverInterventionState deliverInterventionState,
      FormGroup form,
      HouseholdMemberWrapper householdMember,
      ProjectBeneficiaryModel projectBeneficiary, List<AdditionalField>
  fields) async {
    final lat = locationState.latitude;
    final long = locationState.longitude;
    context.read<DeliverInterventionBloc>().add(
          DeliverInterventionSubmitEvent(
              task: _getTaskModel(
                context,
                form: form,
                oldTask: RegistrationDeliverySingleton().beneficiaryType ==
                        BeneficiaryType.household
                    ? deliverInterventionState.tasks?.lastOrNull
                    : null,
                projectBeneficiaryClientReferenceId:
                    projectBeneficiary.clientReferenceId,
                dose: deliverInterventionState.dose,
                cycle: deliverInterventionState.cycle,
                deliveryStrategy: DeliverStrategyType.direct.toValue(),
                address: householdMember.members?.first.address?.first,
                latitude: lat,
                longitude: long,
                fields: fields
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
      ProjectBeneficiaryModel projectBeneficiary, List<AdditionalField>
      fields) {
    if (context.mounted) {
      DigitComponentsUtils().showLocationCapturingDialog(
          context,
          localizations.translate(i18.common.locationCapturing),
          DigitSyncDialogType.inProgress);

      Future.delayed(const Duration(seconds: 2), () {
        // After delay, hide the initial dialog
        DigitComponentsUtils().hideDialog(context);
        handleCapturedLocationState(
            locationState,
            context,
            deliverInterventionState,
            form,
            householdMember,
            projectBeneficiary,fields);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void validate(final form, final key, final fieldConfig) {
      if (fieldConfig?['attribute'] == 'dropdown' ||
          fieldConfig?['attribute'] == 'selectionbox' ||
          fieldConfig?['attribute'] == 'integerFormPicker') {
        print("${key}->>>>shashwat->>>>>>");
        if (form.control(key).value == null &&
            (fieldConfig?['isRequired'] ?? false) &&
            (fieldConfig?['isEnabled'] ?? false)) {
          setState(() {
            form.control(key).setErrors({'': true});
          });
        }
      }
      if (fieldConfig?['attribute'] == 'dobPicker') {
        final age = DigitDateUtils.calculateAge(
          form.control(key).value as DateTime?,
        );
        if ((fieldConfig?['isRequired'] ?? false) &&
            (fieldConfig?['isEnabled'] ?? false) &&
            ((age.years == 0 && age.months == 0) ||
                (age.years >= 150 && age.months > 0))) {
          setState(() {
            form.control(key).setErrors({'': true});
          });
        }
      }
    }

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
                                form: () => mapper.buildForm(
                                    context,
                                    productVariants,
                                    variant,
                                    localizations,
                                    _controllers),
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
                                                          List<AdditionalField>
                                                              fields = [];
                                                          for (var component
                                                              in mapper.configs[
                                                                  "components"]) {
                                                            for (var fieldConfig
                                                                in component[
                                                                    "attributes"]) {
                                                              var key =
                                                                  fieldConfig[
                                                                      "name"];
                                                              validate(
                                                                  form,
                                                                  key,
                                                                  fieldConfig);
                                                              if (fieldConfig[
                                                                          'type'] ==
                                                                      'additionalField' &&
                                                                  fieldConfig[
                                                                          'isEnabled'] ==
                                                                      true) {
                                                                fields.add(
                                                                    AdditionalField(
                                                                  key,
                                                                  form
                                                                          .control(
                                                                              key)
                                                                          .value ??
                                                                      '',
                                                                ));
                                                              }
                                                            }
                                                          }
                                                          form.markAllAsTouched();
                                                          if (!form.valid) {
                                                            return;
                                                          }

                                                          final deliveredProducts =
                                                              ((form.control(resourceDeliveredKey)
                                                                          as FormArray)
                                                                      .value
                                                                  as List<
                                                                      ProductVariantModel?>);
                                                          final hasEmptyResources =
                                                              hasEmptyOrNullResources(
                                                                  deliveredProducts);
                                                          final hasZeroQuantity =
                                                              hasEmptyOrZeroQuantity(
                                                                  form);
                                                          final hasDuplicates =
                                                              hasDuplicateResources(
                                                                  deliveredProducts,
                                                                  form);

                                                          if (hasEmptyResources) {
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
                                                          } else if (hasDuplicates) {
                                                            await DigitToast
                                                                .show(
                                                              context,
                                                              options:
                                                                  DigitToastOptions(
                                                                localizations
                                                                    .translate(i18
                                                                        .deliverIntervention
                                                                        .resourceDuplicateValidation),
                                                                true,
                                                                theme,
                                                              ),
                                                            );
                                                          } else if (hasZeroQuantity) {
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
                                                                  .first,
                                                              fields
                                                            );
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
                                          children: mapper
                                              .buildWidgetsFromConfig(
                                                  WidgetConfigModel(
                                                      config: mapper.configs,
                                                      form: form,
                                                      localizations:
                                                          localizations,
                                                      func: updateState),
                                                  {
                                            "context": context,
                                            "deliveryInterventionState":
                                                deliveryInterventionState,
                                            "numberOfDoses": numberOfDoses,
                                            "steps": steps,
                                            "productVariants": productVariants,
                                            "form": form,
                                            "controllers": _controllers,
                                          })),
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
    (form.control(resourceDeliveredKey) as FormArray)
        .add(FormControl<ProductVariantModel>());
    (form.control(quantityDistributedKey) as FormArray)
        .add(FormControl<int>(value: 0, validators: [Validators.min(1)]));
  }

  bool hasEmptyOrZeroQuantity(FormGroup form) {
    final quantityDistributedArray =
        form.control(quantityDistributedKey) as FormArray;

    // Check if any quantity is zero or null
    return quantityDistributedArray.value?.any((e) => e == 0 || e == null) ??
        true;
  }

  bool hasEmptyOrNullResources(List<ProductVariantModel?> deliveredProducts) {
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

  bool hasDuplicateResources(
      List<ProductVariantModel?> deliveredProducts, FormGroup form) {
    final resourceDeliveredArray =
        form.control(resourceDeliveredKey) as FormArray;
    final Set<String?> uniqueProductIds = {};

    for (int i = 0; i < resourceDeliveredArray.value!.length; i++) {
      final productId = deliveredProducts[i]?.id;
      if (productId != null) {
        if (uniqueProductIds.contains(productId)) {
          // Duplicate found
          return true;
        } else {
          uniqueProductIds.add(productId);
        }
      }
    }
    return false;
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
        List<AdditionalField>?
        fields
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
        ((form.control(resourceDeliveredKey) as FormArray).value
            as List<ProductVariantModel?>);
    final deliveryComment = form.control(deliveryCommentKey).value as String?;
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
                quantity: (((form.control(quantityDistributedKey) as FormArray)
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
          ...?fields,
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
}
