import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:digit_components/widgets/atoms/digit_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../models/data_model.dart';
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
  static const _doseAdministeredKey = 'doseAdministered';
  bool doseAdministered = false;
  List<Widget> resourceCards = [const ResourceBeneficiaryCard()];
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

          final taskData = state.householdMemberWrapper.tasks
              ?.where((element) =>
                  element.projectBeneficiaryClientReferenceId ==
                  projectBeneficiary.first.clientReferenceId)
              .toList();

          return Scaffold(
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : ReactiveFormBuilder(
                    form: () => buildForm(context),
                    builder: (context, form, child) {
                      return ScrollableContent(
                        header: const Column(children: [
                          BackNavigationHelpHeaderWidget(),
                        ]),
                        footer: SizedBox(
                          height: 100,
                          child: DigitCard(
                            child: DigitElevatedButton(
                              onPressed: () async {
                                form.markAllAsTouched();
                                if (!form.valid) return;

                                final router = context.router;

                                final shouldSubmit =
                                    await DigitDialog.show<bool>(
                                  context,
                                  options: DigitDialogOptions(
                                    titleText: localizations.translate(
                                      i18.deliverIntervention.dialogTitle,
                                    ),
                                    contentText: localizations.translate(
                                      i18.deliverIntervention.dialogContent,
                                    ),
                                    primaryAction: DigitDialogActions(
                                      label: localizations.translate(
                                        i18.common.coreCommonSubmit,
                                      ),
                                      action: (ctx) {
                                        final clientReferenceId =
                                            taskData != null
                                                ? taskData.isEmpty
                                                    ? IdGen.i.identifier
                                                    : taskData
                                                        .first.clientReferenceId
                                                : IdGen.i.identifier;
                                        context
                                            .read<DeliverInterventionBloc>()
                                            .add(
                                              DeliverInterventionSubmitEvent(
                                                TaskModel(
                                                  id: taskData != null
                                                      ? taskData.isEmpty
                                                          ? null
                                                          : taskData.first.id
                                                      : null,
                                                  clientReferenceId:
                                                      clientReferenceId,
                                                  projectBeneficiaryClientReferenceId:
                                                      projectBeneficiary.first
                                                          .clientReferenceId,
                                                  tenantId: envConfig
                                                      .variables.tenantId,
                                                  rowVersion: taskData != null
                                                      ? taskData.isEmpty
                                                          ? 1
                                                          : taskData
                                                              .first.rowVersion
                                                      : 1,
                                                  projectId: context.projectId,
                                                  status: Status.delivered.name,
                                                  createdDate: context
                                                      .millisecondsSinceEpoch(),
                                                  resources: [
                                                    TaskResourceModel(
                                                      id: taskData != null
                                                          ? taskData.isNotEmpty
                                                              ? taskData
                                                                  .first
                                                                  .resources
                                                                  ?.first
                                                                  .id
                                                              : null
                                                          : null,
                                                      taskId: taskData != null
                                                          ? taskData.isNotEmpty
                                                              ? taskData
                                                                  .first.id
                                                              : null
                                                          : null,
                                                      clientReferenceId:
                                                          clientReferenceId,
                                                      rowVersion: taskData !=
                                                              null
                                                          ? taskData.isEmpty
                                                              ? 1
                                                              : taskData
                                                                  .first
                                                                  .resources
                                                                  ?.first
                                                                  .rowVersion
                                                          : 1,
                                                      isDelivered: true,
                                                      tenantId: envConfig
                                                          .variables.tenantId,
                                                      quantity: form
                                                          .control(
                                                            _quantityDistributedKey,
                                                          )
                                                          .value
                                                          .toString(),
                                                      productVariantId: (form
                                                                  .control(
                                                                    _resourceDeliveredKey,
                                                                  )
                                                                  .value
                                                              as ProductVariantModel)
                                                          .id,
                                                      deliveryComment: form
                                                          .control(
                                                            _deliveryCommentKey,
                                                          )
                                                          .value,
                                                      auditDetails:
                                                          AuditDetails(
                                                        createdBy: context
                                                            .loggedInUserUuid,
                                                        createdTime: taskData !=
                                                                null
                                                            ? taskData
                                                                    .isNotEmpty
                                                                ? taskData
                                                                        .first
                                                                        .resources
                                                                        ?.first
                                                                        .auditDetails
                                                                        ?.createdTime ??
                                                                    context
                                                                        .millisecondsSinceEpoch()
                                                                : context
                                                                    .millisecondsSinceEpoch()
                                                            : context
                                                                .millisecondsSinceEpoch(),
                                                        lastModifiedBy: context
                                                            .loggedInUserUuid,
                                                        lastModifiedTime: context
                                                            .millisecondsSinceEpoch(),
                                                      ),
                                                    ),
                                                  ],
                                                  address:
                                                      householdMemberWrapper
                                                          .household.address
                                                          ?.copyWith(
                                                    relatedClientReferenceId:
                                                        clientReferenceId,
                                                    id: null,
                                                  ),
                                                  auditDetails: AuditDetails(
                                                    createdBy: context
                                                        .loggedInUserUuid,
                                                    createdTime: context
                                                        .millisecondsSinceEpoch(),
                                                    lastModifiedBy: context
                                                        .loggedInUserUuid,
                                                    lastModifiedTime: context
                                                        .millisecondsSinceEpoch(),
                                                  ),
                                                ),
                                                taskData == null
                                                    ? false
                                                    : taskData.isEmpty
                                                        ? false
                                                        : true,
                                                context.boundary,
                                              ),
                                            );
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
                                  final parent = router.parent() as StackRouter;
                                  parent
                                    ..pop()
                                    ..pop();

                                  router.push(AcknowledgementRoute());
                                }
                              },
                              child: Center(
                                child: Text(
                                  currentStep < steps.length - 1
                                      ? localizations
                                          .translate(i18.common.coreCommonNext)
                                      : localizations.translate(
                                          i18.common.coreCommonSubmit,
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
                                          i18.deliverIntervention
                                              .deliverInterventionLabel,
                                        ),
                                        style: theme.textTheme.displayMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                DigitRadioButtonList<KeyValue>(
                                  labelText: localizations.translate(i18
                                      .deliverIntervention
                                      .wasTheDoseAdministered),
                                  labelStyle: DigitTheme.instance.mobileTheme
                                      .textTheme.headlineSmall,
                                  formControlName: _doseAdministeredKey,
                                  valueMapper: (val) =>
                                      localizations.translate(val.label),
                                  options: Constants.yesNo,
                                  isRequired: true,
                                  onValueChange: (val) {
                                    setState(() {
                                      doseAdministered = val.key;
                                    });
                                  },
                                ),
                                if (form.control(_doseAdministeredKey).value ==
                                    Constants.yesNo.first)
                                  Column(children: [
                                    DigitStepper(
                                      activeStep: currentStep,
                                      steps: steps,
                                      maxStepReached: 3,
                                      lineLength:
                                          MediaQuery.of(context).size.width / 5,
                                    ),
                                    Column(
                                      children: [
                                        if (resourceCards.isNotEmpty) ...[
                                          const ResourceBeneficiaryCard(
                                            cardIndex: 0,
                                          ),
                                        ],
                                        ...resourceCards.skip(1).map(
                                              (card) => ResourceBeneficiaryCard(
                                                onDelete: () {
                                                  setState(() {
                                                    resourceCards.remove(card);
                                                  });
                                                },
                                              ),
                                            ),
                                        DigitIconButton(
                                          onPressed: () async {
                                            setState(() {
                                              resourceCards.insert(
                                                0,
                                                const ResourceBeneficiaryCard(),
                                              );
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
                                  ]),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          );
        },
      ),
    );
  }

  FormGroup buildForm(BuildContext context) {
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

    return fb.group(<String, Object>{
      _resourceDeliveredKey: FormControl<ProductVariantModel>(
        validators: doseAdministered ? [Validators.required] : [],
      ),
      _quantityDistributedKey: FormControl<int>(
        value: taskData?.firstOrNull?.resources?.firstOrNull?.quantity != null
            ? int.tryParse(taskData!.first.resources!.first.quantity!)
            : 1,
        validators: doseAdministered ? [Validators.required] : [],
      ),
      _doseAdministeredKey: FormControl<KeyValue>(
        value: taskData != null && taskData.isNotEmpty
            ? Constants.yesNo.first
            : null,
        validators: [
          Validators.required,
        ],
      ),
      _deliveryCommentKey: FormControl<String>(
        value: taskData?.firstOrNull?.resources?.firstOrNull?.deliveryComment,
      ),
    });
  }
}
