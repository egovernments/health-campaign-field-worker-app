import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../blocs/app_localization.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../models/entities/side_effect.dart';
import '../../models/entities/status.dart';
import '../../models/entities/task.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../action_card/action_card.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String? gender;
  final int? years;
  final int? months;
  final bool isHead;
  final IndividualModel individual;
  final List<ProjectBeneficiaryModel>? projectBeneficiaries;
  final bool isDelivered;

  final VoidCallback setAsHeadAction;
  final VoidCallback editMemberAction;
  final VoidCallback deleteMemberAction;
  final RegistrationDeliveryLocalization localizations;
  final List<TaskModel>? tasks;
  final List<SideEffectModel>? sideEffects;
  final bool isNotEligible;
  final bool isBeneficiaryRefused;
  final bool isBeneficiaryReferred;
  final String? projectBeneficiaryClientReferenceId;

  const MemberCard({
    super.key,
    required this.individual,
    required this.name,
    this.gender,
    this.years,
    this.isHead = false,
    this.months,
    required this.localizations,
    required this.isDelivered,
    required this.setAsHeadAction,
    required this.editMemberAction,
    required this.deleteMemberAction,
    this.projectBeneficiaries,
    this.tasks,
    this.isNotEligible = false,
    this.projectBeneficiaryClientReferenceId,
    this.isBeneficiaryRefused = false,
    this.isBeneficiaryReferred = false,
    this.sideEffects,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final beneficiaryType = RegistrationDeliverySingleton().beneficiaryType;

    return Container(
      decoration: BoxDecoration(
        color: DigitTheme.instance.colorScheme.background,
        border: Border.all(
          color: DigitTheme.instance.colorScheme.outline,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      margin: DigitTheme.instance.containerMargin,
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: kPadding, top: kPadding),
                      child: Text(
                        name,
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.topRight,
                  child: DigitIconButton(
                    buttonDisabled: (projectBeneficiaries ?? []).isEmpty,
                    onPressed: (projectBeneficiaries ?? []).isEmpty
                        ? null
                        : () => DigitActionDialog.show(
                              context,
                              widget: ActionCard(
                                items: [
                                  ActionCardModel(
                                    icon: Icons.person,
                                    label: localizations.translate(
                                      i18.memberCard.assignAsHouseholdhead,
                                    ),
                                    action: isHead ? null : setAsHeadAction,
                                  ),
                                  ActionCardModel(
                                    icon: Icons.edit,
                                    label: localizations.translate(
                                      i18.memberCard.editIndividualDetails,
                                    ),
                                    action: editMemberAction,
                                  ),
                                  ActionCardModel(
                                    icon: Icons.delete,
                                    label: localizations.translate(
                                      i18.memberCard.deleteIndividualActionText,
                                    ),
                                    action: isHead ? null : deleteMemberAction,
                                  ),
                                ],
                              ),
                            ),
                    iconText: localizations.translate(
                      i18.memberCard.editDetails,
                    ),
                    icon: Icons.edit,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.8,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: DigitTheme.instance.containerMargin,
                  child: Text(
                    gender != null
                        ? localizations
                            .translate('CORE_COMMON_${gender?.toUpperCase()}')
                        : ' -- ',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Expanded(
                  child: Text(
                    years!=null && months != null ?
                    " | $years ${localizations.translate(i18.memberCard.deliverDetailsYearText)} $months ${localizations.translate(i18.memberCard.deliverDetailsMonthsText)}"
                    : "|   --" ,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: kPadding / 2,
            ),
            child: Offstage(
              offstage: beneficiaryType != BeneficiaryType.individual,
              child: !isDelivered ||
                      isNotEligible ||
                      isBeneficiaryRefused ||
                      isBeneficiaryReferred
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: DigitIconButton(
                        icon: Icons.info_rounded,
                        iconSize: 20,
                        iconText: localizations.translate(
                          isNotEligible
                              ? i18.householdOverView
                                  .householdOverViewNotEligibleIconLabel
                              : isBeneficiaryReferred
                                  ? i18.householdOverView
                                      .householdOverViewBeneficiaryReferredLabel
                                  : isBeneficiaryRefused
                                      ? Status.beneficiaryRefused.toValue()
                                      : i18.householdOverView
                                          .householdOverViewNotDeliveredIconLabel,
                        ),
                        iconTextColor: theme.colorScheme.error,
                        iconColor: theme.colorScheme.error,
                      ),
                    )
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: DigitIconButton(
                        icon: Icons.check_circle,
                        iconText: localizations.translate(
                          i18.householdOverView
                              .householdOverViewDeliveredIconLabel,
                        ),
                        iconSize: 20,
                        iconTextColor:
                            DigitTheme.instance.colorScheme.onSurfaceVariant,
                        iconColor:
                            DigitTheme.instance.colorScheme.onSurfaceVariant,
                      ),
                    ),
            ),
          ),
          Offstage(
            offstage: beneficiaryType != BeneficiaryType.individual ||
                isNotEligible ||
                isBeneficiaryRefused ||
                isBeneficiaryReferred,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  isNotEligible || isBeneficiaryRefused || isBeneficiaryReferred
                      ? const Offstage()
                      : !isNotEligible
                          ? DigitElevatedButton(
                              onPressed: (projectBeneficiaries ?? []).isEmpty
                                  ? null
                                  : () {
                                      final bloc =
                                          context.read<HouseholdOverviewBloc>();

                                      bloc.add(
                                        HouseholdOverviewEvent
                                            .selectedIndividual(
                                          individualModel: individual,
                                        ),
                                      );
                                      bloc.add(HouseholdOverviewReloadEvent(
                                        projectId:
                                            RegistrationDeliverySingleton()
                                                .projectId!,
                                        projectBeneficiaryType:
                                            RegistrationDeliverySingleton()
                                                    .beneficiaryType ??
                                                BeneficiaryType.individual,
                                      ));

                                      final futureTaskList = tasks
                                          ?.where((task) =>
                                              task.status ==
                                              Status.delivered.toValue())
                                          .toList();

                                      if ((futureTaskList ?? []).isNotEmpty) {
                                        context.router.push(
                                          RecordPastDeliveryDetailsRoute(
                                            tasks: tasks,
                                          ),
                                        );
                                      } else {
                                        context.router
                                            .push(BeneficiaryDetailsRoute());
                                      }
                                    },
                              child: Center(
                                child: Text(
                                  allDosesDelivered(
                                            tasks,
                                            context.selectedCycle,
                                            sideEffects,
                                            individual,
                                          ) &&
                                          !checkStatus(
                                            tasks,
                                            context.selectedCycle,
                                          )
                                      ? localizations.translate(
                                          i18.householdOverView
                                              .viewDeliveryLabel,
                                        )
                                      : localizations.translate(
                                          i18.householdOverView
                                              .householdOverViewActionText,
                                        ),
                                ),
                              ),
                            )
                          : const Offstage(),
                  const SizedBox(
                    height: 10,
                  ),
                  (isNotEligible ||
                          isBeneficiaryRefused ||
                          isBeneficiaryReferred ||
                          (allDosesDelivered(
                                tasks,
                                context.selectedCycle,
                                sideEffects,
                                individual,
                              ) &&
                              !checkStatus(tasks, context.selectedCycle)))
                      ? const Offstage()
                      : DigitOutLineButton(
                          label: localizations.translate(
                            i18.memberCard.unableToDeliverLabel,
                          ),
                          buttonStyle: OutlinedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              width: 1.0,
                              color: theme.colorScheme.secondary,
                            ),
                            minimumSize: Size(
                              MediaQuery.of(context).size.width / 1.15,
                              50,
                            ),
                          ),
                          onPressed: (projectBeneficiaries ?? []).isEmpty
                              ? null
                              : () async {
                                  await DigitActionDialog.show(
                                    context,
                                    widget: Column(
                                      children: [
                                        DigitOutLineButton(
                                          label: localizations.translate(
                                            i18.memberCard
                                                .beneficiaryRefusedLabel,
                                          ),
                                          buttonStyle: OutlinedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                            backgroundColor: Colors.white,
                                            side: BorderSide(
                                              width: 1.0,
                                              color:
                                                  theme.colorScheme.secondary,
                                            ),
                                            minimumSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.25,
                                              50,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                            context
                                                .read<DeliverInterventionBloc>()
                                                .add(
                                                  DeliverInterventionSubmitEvent(
                                                    task: TaskModel(
                                                      projectBeneficiaryClientReferenceId:
                                                          projectBeneficiaryClientReferenceId,
                                                      clientReferenceId:
                                                          IdGen.i.identifier,
                                                      tenantId:
                                                          RegistrationDeliverySingleton()
                                                              .tenantId,
                                                      rowVersion: 1,
                                                      auditDetails:
                                                          AuditDetails(
                                                        createdBy:
                                                            RegistrationDeliverySingleton()
                                                                .loggedInUserUuid!,
                                                        createdTime: context
                                                            .millisecondsSinceEpoch(),
                                                      ),
                                                      projectId:
                                                          RegistrationDeliverySingleton()
                                                              .projectId,
                                                      status: Status
                                                          .beneficiaryRefused
                                                          .toValue(),
                                                      clientAuditDetails:
                                                          ClientAuditDetails(
                                                        createdBy:
                                                            RegistrationDeliverySingleton()
                                                                .loggedInUserUuid!,
                                                        createdTime: context
                                                            .millisecondsSinceEpoch(),
                                                        lastModifiedBy:
                                                            RegistrationDeliverySingleton()
                                                                .loggedInUserUuid,
                                                        lastModifiedTime: context
                                                            .millisecondsSinceEpoch(),
                                                      ),
                                                      additionalFields:
                                                          TaskAdditionalFields(
                                                        version: 1,
                                                        fields: [
                                                          AdditionalField(
                                                            'taskStatus',
                                                            Status
                                                                .beneficiaryRefused
                                                                .toValue(),
                                                          ),
                                                        ],
                                                      ),
                                                      address: individual
                                                          .address?.first,
                                                    ),
                                                    isEditing: false,
                                                    boundaryModel:
                                                        RegistrationDeliverySingleton()
                                                            .boundary!,
                                                  ),
                                                );
                                            final reloadState = context
                                                .read<HouseholdOverviewBloc>();
                                            Future.delayed(
                                              const Duration(milliseconds: 500),
                                              () {
                                                reloadState.add(
                                                  HouseholdOverviewReloadEvent(
                                                    projectId:
                                                        RegistrationDeliverySingleton()
                                                            .projectId!,
                                                    projectBeneficiaryType:
                                                        RegistrationDeliverySingleton()
                                                            .beneficiaryType!,
                                                  ),
                                                );
                                              },
                                            ).then(
                                              (value) => context.router.push(
                                                HouseholdAcknowledgementRoute(
                                                  enableViewHousehold: true,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        const SizedBox(
                                          height: kPadding * 2,
                                        ),
                                        DigitOutLineButton(
                                          label: localizations.translate(
                                            i18.memberCard
                                                .referBeneficiaryLabel,
                                          ),
                                          buttonStyle: OutlinedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                            backgroundColor: Colors.white,
                                            side: BorderSide(
                                              width: 1.0,
                                              color:
                                                  theme.colorScheme.secondary,
                                            ),
                                            minimumSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.25,
                                              50,
                                            ),
                                          ),
                                          onPressed: () async {
                                            Navigator.of(
                                              context,
                                              rootNavigator: true,
                                            ).pop();
                                            await context.router.push(
                                              ReferBeneficiaryRoute(
                                                projectBeneficiaryClientRefId:
                                                    projectBeneficiaryClientReferenceId ??
                                                        '',
                                              ),
                                            );
                                          },
                                        ),
                                        const SizedBox(
                                          height: kPadding * 2,
                                        ),
                                        DigitOutLineButton(
                                          label: localizations.translate(
                                            i18.memberCard
                                                .recordAdverseEventsLabel,
                                          ),
                                          buttonStyle: OutlinedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                            backgroundColor: Colors.white,
                                            side: BorderSide(
                                              width: 1.0,
                                              color: tasks != null &&
                                                      (tasks ?? []).isNotEmpty
                                                  ? theme.colorScheme.secondary
                                                  : theme.colorScheme.outline,
                                            ),
                                            minimumSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.25,
                                              50,
                                            ),
                                          ),
                                          onPressed: tasks != null &&
                                                  (tasks ?? []).isNotEmpty
                                              ? () async {
                                                  Navigator.of(
                                                    context,
                                                    rootNavigator: true,
                                                  ).pop();
                                                  await context.router.push(
                                                    SideEffectsRoute(
                                                      tasks: tasks!,
                                                    ),
                                                  );
                                                }
                                              : null,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
