import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/project/project.dart';
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
    final List<StepsModel> steps = [
      StepsModel(
        title: localizations.translate(i18.deliverIntervention.dose1),
        number: "1",
      ),
      StepsModel(
        title: localizations.translate(i18.deliverIntervention.dose2),
        number: "2",
      ),
      StepsModel(
        title: localizations.translate(i18.deliverIntervention.dose3),
        number: "3",
      ),
      StepsModel(
        title: localizations.translate(i18.deliverIntervention.dose4),
        number: "4",
      ),
    ];

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
          List<ProductVariantsModel>? productVariants = projectState
              .projectType?.cycles?[0].deliveries?[0].productVariants;

          return Scaffold(
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : BlocBuilder<DeliverInterventionBloc,
                    DeliverInterventionState>(
                    builder: (context, deliveryInterventionstate) {
                      return ReactiveFormBuilder(
                        form: () => buildForm(context),
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
                                            await DigitDialog.show<bool>(
                                          context,
                                          options: DigitDialogOptions(
                                            titleText: localizations.translate(
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
                                                Navigator.of(
                                                  context,
                                                  rootNavigator: true,
                                                ).pop(true);
                                              },
                                            ),
                                            secondaryAction: DigitDialogActions(
                                              label: localizations.translate(
                                                i18.common.coreCommonCancel,
                                              ),
                                              action: (context) => Navigator.of(
                                                context,
                                                rootNavigator: true,
                                              ).pop(false),
                                            ),
                                          ),
                                        );

                                        if (shouldSubmit ?? false) {
                                          if (context.mounted) {
                                            final parent = context.router
                                                .parent() as StackRouter;
                                            parent
                                              ..pop()
                                              ..pop();
                                            context
                                                .read<DeliverInterventionBloc>()
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

                                            context.router
                                                .push(AcknowledgementRoute());
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
                                          style: theme.textTheme.displayMedium,
                                        ),
                                        const DigitTextFormField(
                                          readOnly: true,
                                          formControlName:
                                              _doseAdministrationKey,
                                          keyboardType: TextInputType.number,
                                          label: 'Current cycle',
                                        ),
                                        DigitStepper(
                                          activeStep:
                                              deliveryInterventionstate.dose +
                                                  1,
                                          steps: steps,
                                          maxStepReached: 3,
                                          lineLength: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                        ),
                                        DigitDateFormPicker(
                                          isEnabled: false,
                                          formControlName:
                                              _dateOfAdministrationKey,
                                          label: localizations.translate(
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
                                          style: theme.textTheme.displayMedium,
                                        ),
                                        ..._controllers
                                            .map((e) => ResourceBeneficiaryCard(
                                                  form: form,
                                                  cardIndex:
                                                      _controllers.indexOf(e),
                                                  onDelete: (index) {
                                                    (form.control(
                                                      _resourceDeliveredKey,
                                                    ) as FormArray)
                                                        .removeAt(index);
                                                    _controllers
                                                        .removeAt(index);
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
                                              _controllers
                                                  .add(productVariants?.length);
                                            });
                                          },
                                          icon: Icons.add,
                                          iconText: localizations.translate(
                                            i18.deliverIntervention
                                                .resourceAddBeneficiary,
                                          ),
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
        .add(FormControl<int>(value: 1));
    (form.control(_deliveryCommentKey) as FormArray)
        .add(FormControl<String>(value: ''));
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
    );

    final productvariantList =
        ((form.control(_resourceDeliveredKey) as FormArray).value
            as List<ProductVariantModel?>);
    task = task.copyWith(
      projectId: context.projectId,
      resources: productvariantList
          .map((e) => TaskResourceModel(
                clientReferenceId: clientReferenceId,
                productVariantId: e?.id,
                taskId: task?.id,
                rowVersion: oldTask?.rowVersion ?? 1,
                quantity: (((form.control(_quantityDistributedKey) as FormArray)
                        .value)?[productvariantList.indexOf(e)])
                    .toString(),
                deliveryComment:
                    ((form.control(_deliveryCommentKey) as FormArray)
                        .value)?[productvariantList.indexOf(e)],
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
            "0${cycle ?? 1}",
          ),
          AdditionalField(
            'DoseIndex',
            "0${dose ?? 1}",
          ),
        ],
      ),
    );

    return task;
  }

  FormGroup buildForm(BuildContext context) {
    final projectState = context.read<ProjectBloc>().state;
    List<ProductVariantsModel>? productVariants =
        projectState.projectType?.cycles?[0].deliveries?[0].productVariants;
    _controllers
        .addAll(productVariants!.map((e) => productVariants.indexOf(e)));

    return fb.group(<String, Object>{
      _doseAdministrationKey:
          FormControl<String>(value: 'Cycle ${1}', validators: []),
      _dateOfAdministrationKey:
          FormControl<DateTime>(value: DateTime.now(), validators: []),
      _resourceDeliveredKey: FormArray<ProductVariantModel>(
        [
          ..._controllers.map((e) => FormControl<ProductVariantModel>()),
        ],
      ),
      _quantityDistributedKey: FormArray<int>([
        ..._controllers.map((e) => FormControl<int>(value: 1)),
      ]),
      _deliveryCommentKey: FormArray<String>([
        ..._controllers.map(
          (e) => FormControl<String>(),
        ),
      ]),
    });
  }
}
