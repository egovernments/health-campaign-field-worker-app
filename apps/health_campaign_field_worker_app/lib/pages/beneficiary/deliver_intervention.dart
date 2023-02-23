import 'dart:math';

import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
      builder: (context, state) {
        final householdMemberWrapper = state.householdMemberWrapper;

        return Scaffold(
          body: state.loading
              ? const Center(child: CircularProgressIndicator())
              : ReactiveFormBuilder(
                  form: () => buildForm(context),
                  builder: (context, form, child) {
                    return ScrollableContent(
                      header: Column(children: const [
                        BackNavigationHelpHeaderWidget(),
                      ]),
                      footer: DigitElevatedButton(
                        onPressed: () {
                          form.markAllAsTouched();
                          if (!form.valid) return;
                          DigitDialog.show(
                            context,
                            options: DigitDialogOptions(
                              titleText: localizations.translate(
                                i18.deliverIntervention.dialogTitle,
                              ),
                              contentText: localizations.translate(
                                i18.deliverIntervention.dialogContent,
                              ),
                              primaryAction: DigitDialogActions(
                                label: localizations
                                    .translate(i18.common.coreCommonSubmit),
                                action: (ctx) {
                                  final taskClientReferenceId =
                                      state.householdMemberWrapper.task == null
                                          ? IdGen.i.identifier
                                          : state.householdMemberWrapper.task!
                                              .clientReferenceId;
                                  context.read<DeliverInterventionBloc>().add(
                                        DeliverInterventionSubmitEvent(
                                          TaskModel(
                                            clientReferenceId:
                                                taskClientReferenceId,
                                            projectBeneficiaryClientReferenceId:
                                                householdMemberWrapper
                                                    .projectBeneficiary
                                                    .clientReferenceId,
                                            tenantId:
                                                envConfig.variables.tenantId,
                                            rowVersion: 1,
                                            projectId: '13',
                                            status: Status.delivered.name,
                                            createdDate: DateTime.now()
                                                .millisecondsSinceEpoch,
                                            resources: [
                                              TaskResourceModel(
                                                taskClientReferenceId:
                                                    taskClientReferenceId,
                                                id: IdGen.i.identifier,
                                                rowVersion: 1,
                                                isDelivered: true,
                                                tenantId: envConfig
                                                    .variables.tenantId,
                                                quantity: form
                                                    .control(
                                                      'quantityDistributed',
                                                    )
                                                    .value
                                                    .toString(),
                                                productVariantId:
                                                    'PVAR-2023-01-11-000045',
                                                deliveryComment: form
                                                    .control('deliveryComment')
                                                    .value,
                                              ),
                                            ],
                                            address: householdMemberWrapper
                                                .household.address,
                                          ),
                                          state.householdMemberWrapper.task ==
                                                  null
                                              ? false
                                              : true,
                                        ),
                                      );

                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  context.router.push(AcknowledgementRoute());
                                },
                              ),
                              secondaryAction: DigitDialogActions(
                                label: localizations
                                    .translate(i18.common.coreCommonCancel),
                                action: (context) =>
                                    Navigator.of(context, rootNavigator: true)
                                        .pop(),
                              ),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            localizations
                                .translate(i18.common.coreCommonSubmit),
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
                              DigitTableCard(
                                element: {
                                  localizations.translate(i18
                                      .deliverIntervention
                                      .dateOfRegistrationLabel): () {
                                    final date = householdMemberWrapper
                                        .projectBeneficiary.dateOfRegistration;

                                    final registrationDate =
                                        DateTime.fromMillisecondsSinceEpoch(
                                      date,
                                    );

                                    return DateFormat('dd MMMM yyyy')
                                        .format(registrationDate);
                                  }(),
                                },
                              ),
                              DigitTableCard(
                                color: Theme.of(context).colorScheme.surface,
                                border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  bottom: 16,
                                ),
                                element: {
                                  localizations.translate(i18.householdOverView
                                          .householdOverViewHouseholdHeadLabel):
                                      householdMemberWrapper.headOfHousehold
                                              .name?.givenName ??
                                          '',
                                  localizations.translate(
                                    i18.deliverIntervention.idTypeText,
                                  ): () {
                                    final identifiers = householdMemberWrapper
                                        .headOfHousehold.identifiers;
                                    if (identifiers == null ||
                                        identifiers.isEmpty) {
                                      return '';
                                    }

                                    return identifiers.first.identifierType ??
                                        '';
                                  }(),
                                  localizations.translate(
                                    i18.deliverIntervention.idNumberText,
                                  ): () {
                                    final identifiers = householdMemberWrapper
                                        .headOfHousehold.identifiers;
                                    if (identifiers == null ||
                                        identifiers.isEmpty) {
                                      return '';
                                    }

                                    return identifiers.first.identifierId ?? '';
                                  }(),
                                  localizations.translate(
                                    i18.common.coreCommonAge,
                                  ): () {
                                    final dob = householdMemberWrapper
                                        .headOfHousehold.dateOfBirth;
                                    if (dob == null || dob.isEmpty) {
                                      return '';
                                    }

                                    final date =
                                        DateFormat('dd/MM/yyyy').parse(dob);

                                    return date.age.toString();
                                  }(),
                                  localizations.translate(
                                    i18.common.coreCommonGender,
                                  ): householdMemberWrapper.headOfHousehold
                                          .gender?.name.sentenceCase ??
                                      '',
                                  localizations.translate(
                                    i18.common.coreCommonMobileNumber,
                                  ): householdMemberWrapper
                                      .headOfHousehold.mobileNumber,
                                },
                              ),
                              DigitTableCard(
                                element: {
                                  localizations.translate(
                                    i18.deliverIntervention.memberCountText,
                                  ): householdMemberWrapper
                                          .household.memberCount ??
                                      householdMemberWrapper.members.length,
                                },
                              ),
                              const DigitDivider(),
                              DigitTableCard(
                                element: {
                                  localizations.translate(i18
                                      .deliverIntervention
                                      .noOfResourcesForDelivery): () {
                                    final count = householdMemberWrapper
                                            .household.memberCount ??
                                        householdMemberWrapper.members.length;

                                    return min(count * 1.8, 3).round();
                                  }(),
                                },
                              ),
                              const DigitDivider(),
                              DigitDropdown(
                                label: localizations.translate(
                                  i18.deliverIntervention
                                      .resourceDeliveredLabel,
                                ),
                                initialValue: 'BEDNETS',
                                menuItems: [
                                  MenuItemModel(
                                    "BEDNETS",
                                    "PVAR-2023-01-11-000045",
                                  ),
                                ],
                                validationMessages: {
                                  'required': (object) => 'Field is required',
                                },
                                formControlName: 'resourceDelivered',
                              ),
                              DigitIntegerFormPicker(
                                form: form,
                                minimum: 0,
                                formControlName: 'quantityDistributed',
                                label: localizations.translate(
                                  i18.deliverIntervention
                                      .quantityDistributedLabel,
                                ),
                                incrementer: true,
                              ),
                              BlocBuilder<AppInitializationBloc,
                                  AppInitializationState>(
                                builder: (context, state) {
                                  if (state is! AppInitialized) {
                                    return const Offstage();
                                  }

                                  final deliveryCommentOptions = state
                                          .appConfiguration
                                          .deliveryCommentOptions ??
                                      <DeliveryCommentOptions>[];

                                  return DigitDropdown(
                                    label: localizations.translate(
                                      i18.deliverIntervention
                                          .deliveryCommentLabel,
                                    ),
                                    initialValue: deliveryCommentOptions
                                        .firstOrNull?.name,
                                    menuItems: deliveryCommentOptions.map((e) {
                                      return MenuItemModel(
                                        e.code,
                                        localizations.translate(e.name),
                                      );
                                    }).toList(),
                                    formControlName: 'deliveryComment',
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
        );
      },
    );
  }

  FormGroup buildForm(BuildContext context) {
    final state = context.read<HouseholdOverviewBloc>().state;
    print(state.householdMemberWrapper.task?.resources?.length);

    return fb.group(<String, Object>{
      _resourceDeliveredKey: FormControl<String>(
        value: state
            .householdMemberWrapper.task?.resources?.first.productVariantId,
        validators: [Validators.required],
      ),
      _quantityDistributedKey: FormControl<int>(
        value: state.householdMemberWrapper.task?.resources?.first.quantity !=
                null
            ? int.tryParse(
                state.householdMemberWrapper.task!.resources!.first.quantity!,
              )
            : 1,
      ),
      _deliveryCommentKey: FormControl<String>(
        value:
            state.householdMemberWrapper.task?.resources?.first.deliveryComment,
      ),
    });
  }
}
