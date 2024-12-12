import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_action_card.dart';
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
    final textTheme = theme.digitTextTheme(context);

    return Container(
        decoration: BoxDecoration(
            color: theme.colorTheme.generic.background,
            border: Border.all(
              color: DigitTheme.instance.colorScheme.outline,
              width: 0.5,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(spacer1),
            )),
        margin: DigitTheme.instance.containerMargin,
        padding: const EdgeInsets.only(
            left: spacer2, right: spacer2, bottom: spacer2),
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
                          padding: const EdgeInsets.all(spacer2),
                          child: Text(
                            name,
                            style: textTheme.headingM,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: spacer2),
                        child: DigitButton(
                          isDisabled: (projectBeneficiaries ?? []).isEmpty,
                          onPressed: () => showDialog(
                            context: context,
                            builder: (ctx) => DigitActionCard(
                              onOutsideTap: () {
                                Navigator.of(context, rootNavigator: true).pop();
                              },
                              actions: [
                                DigitButton(
                                  prefixIcon: Icons.person,
                                  label: localizations.translate(
                                    i18.memberCard.assignAsHouseholdhead,
                                  ),
                                  isDisabled: isHead ? true : false,
                                  onPressed: setAsHeadAction,
                                  type: DigitButtonType.secondary,
                                  size: DigitButtonSize.large,
                                ),
                                DigitButton(
                                  prefixIcon: Icons.edit,
                                  label: localizations.translate(
                                    i18.memberCard.editIndividualDetails,
                                  ),
                                  onPressed: editMemberAction,
                                  type: DigitButtonType.secondary,
                                  size: DigitButtonSize.large,
                                ),
                                DigitButton(
                                  prefixIcon: Icons.delete,
                                  label: localizations.translate(
                                    i18.memberCard.deleteIndividualActionText,
                                  ),
                                  isDisabled: isHead ? true : false,
                                  onPressed: deleteMemberAction,
                                  type: DigitButtonType.secondary,
                                  size: DigitButtonSize.large,
                                ),
                              ],
                            ),
                          ),
                          label: localizations.translate(
                            i18.memberCard.editDetails,
                          ),
                          prefixIcon: Icons.edit,
                          type: DigitButtonType.tertiary,
                          size: DigitButtonSize.medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(spacer2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      gender != null
                          ? localizations
                              .translate('CORE_COMMON_${gender?.toUpperCase()}')
                          : ' -- ',
                      style: textTheme.bodyS,
                    ),
                    Expanded(
                      child: Text(
                        years != null && months != null
                            ? " | $years ${localizations.translate(i18.memberCard.deliverDetailsYearText)} $months ${localizations.translate(i18.memberCard.deliverDetailsMonthsText)}"
                            : "|   --",
                        style: textTheme.bodyS,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: spacer1, bottom: spacer2),
                child: Offstage(
                  offstage: beneficiaryType != BeneficiaryType.individual,
                  child: !isDelivered ||
                          isNotEligible ||
                          isBeneficiaryRefused ||
                          isBeneficiaryReferred
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: DigitButton(
                            prefixIcon: Icons.info_rounded,
                            label: localizations.translate(
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
                            textColor: DigitTheme.instance.colorScheme.error,
                            iconColor: DigitTheme.instance.colorScheme.error,
                            type: DigitButtonType.tertiary,
                            size: DigitButtonSize.medium,
                            isDisabled: true,
                            onPressed: () {},
                          ),
                        )
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: DigitButton(
                            prefixIcon: Icons.check_circle,
                            label: localizations.translate(
                              i18.householdOverView
                                  .householdOverViewDeliveredIconLabel,
                            ),
                            isDisabled: true,
                            textColor: DigitTheme
                                .instance.colorScheme.onSurfaceVariant,
                            iconColor: DigitTheme
                                .instance.colorScheme.onSurfaceVariant,
                            type: DigitButtonType.tertiary,
                            size: DigitButtonSize.medium,
                            onPressed: () {},
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
                  padding: const EdgeInsets.all(spacer1),
                  child: Column(
                    children: [
                      isNotEligible ||
                              isBeneficiaryRefused ||
                              isBeneficiaryReferred
                          ? const Offstage()
                          : !isNotEligible
                              ? DigitButton(
                                  mainAxisSize: MainAxisSize.max,
                                  isDisabled:
                                      (projectBeneficiaries ?? []).isEmpty
                                          ? true
                                          : false,
                                  type: DigitButtonType.primary,
                                  size: DigitButtonSize.large,
                                  label: allDosesDelivered(
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
                                  onPressed: () {
                                    final bloc =
                                        context.read<HouseholdOverviewBloc>();

                                    bloc.add(
                                      HouseholdOverviewEvent.selectedIndividual(
                                        individualModel: individual,
                                      ),
                                    );
                                    bloc.add(HouseholdOverviewReloadEvent(
                                      projectId: RegistrationDeliverySingleton()
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
                          : DigitButton(
                              label: localizations.translate(
                                i18.memberCard.unableToDeliverLabel,
                              ),
                              isDisabled: (projectBeneficiaries ?? []).isEmpty
                                  ? true
                                  : false,
                              type: DigitButtonType.secondary,
                              size: DigitButtonSize.large,
                              mainAxisSize: MainAxisSize.max,
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (ctx) => DigitActionCard(
                                    onOutsideTap: () {
                                      Navigator.of(
                                        context,
                                        rootNavigator: true,
                                      ).pop();
                                    },
                                    actions: [
                                      DigitButton(
                                        label: localizations.translate(
                                          i18.memberCard
                                              .beneficiaryRefusedLabel,
                                        ),
                                        type: DigitButtonType.secondary,
                                        size: DigitButtonSize.large,
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
                                                    auditDetails: AuditDetails(
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
                                      DigitButton(
                                        label: localizations.translate(
                                          i18.memberCard.referBeneficiaryLabel,
                                        ),
                                        type: DigitButtonType.secondary,
                                        size: DigitButtonSize.large,
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
                                      DigitButton(
                                        label: localizations.translate(
                                          i18.memberCard
                                              .recordAdverseEventsLabel,
                                        ),
                                        isDisabled: tasks != null &&
                                                (tasks ?? []).isNotEmpty
                                            ? false
                                            : true,
                                        type: DigitButtonType.secondary,
                                        size: DigitButtonSize.large,
                                        mainAxisSize: MainAxisSize.max,
                                        onPressed: () async {
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).pop();
                                          await context.router.push(
                                            SideEffectsRoute(
                                              tasks: tasks!,
                                            ),
                                          );
                                        },
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
            ]));
  }
}
