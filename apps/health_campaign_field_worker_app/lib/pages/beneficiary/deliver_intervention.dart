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
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

class DeliverInterventionPage extends LocalizedStatefulWidget {
  const DeliverInterventionPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<DeliverInterventionPage> createState() =>
      _DeliverInterventionPageState();
}

class _DeliverInterventionPageState
    extends LocalizedState<DeliverInterventionPage> {
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
                  form: buildForm,
                  builder: (context, form, child) {
                    return ScrollableContent(
                      header: Column(children: const [
                        BackNavigationHelpHeaderWidget(),
                      ]),
                      footer: DigitElevatedButton(
                        onPressed: () {
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
                                  context.read<DeliverInterventionBloc>().add(
                                        DeliverInterventionSubmitEvent(
                                          TaskModel(
                                            clientReferenceId:
                                                IdGen.i.identifier,
                                            tenantId:
                                                envConfig.variables.tenantId,
                                            rowVersion: 1,
                                            projectId: '13',
                                            status: Status.delivered.name,
                                            createdDate: DateTime.now()
                                                .millisecondsSinceEpoch,
                                            projectBeneficiaryId:
                                                householdMemberWrapper.household
                                                    .clientReferenceId,
                                            resources: [
                                              TaskResourceModel(
                                                clientReferenceId:
                                                    IdGen.i.identifier,
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
                                                    'PVAR-2023-02-15-000048',
                                                deliveryComment: form
                                                    .control('deliveryComment')
                                                    .value,
                                              ),
                                            ],
                                            address: householdMemberWrapper
                                                .household.address,
                                          ),
                                        ),
                                      );

                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
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
                                    if (date == null) return '';

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
                                    "DOLO",
                                    "DOLO",
                                  ),
                                  MenuItemModel(
                                    "BEDNETS",
                                    "BEDNETS",
                                  ),
                                ],
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

  FormGroup buildForm() => fb.group(<String, Object>{
        'resourceDelivered': FormControl<String>(),
        'quantityDistributed': FormControl<int>(value: 1),
        'deliveryComment': FormControl<String>(),
      });
}
