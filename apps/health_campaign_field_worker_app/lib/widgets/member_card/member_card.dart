import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/localization/app_localization.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../action_card/action_card.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String gender;
  final int years;
  final int months;
  final bool isHead;
  final IndividualModel individual;
  final bool isDelivered;

  final VoidCallback setAsHeadAction;
  final VoidCallback editMemberAction;
  final VoidCallback deleteMemberAction;
  final AppLocalizations localizations;
  final List<TaskModel>? tasks;
  final bool isNotEligible;
  final bool isBeneficiaryRefused;
  final String? projectBeneficiaryClientReferenceId;

  const MemberCard({
    super.key,
    required this.individual,
    required this.name,
    required this.gender,
    required this.years,
    this.isHead = false,
    this.months = 0,
    required this.localizations,
    required this.isDelivered,
    required this.setAsHeadAction,
    required this.editMemberAction,
    required this.deleteMemberAction,
    this.tasks,
    this.isNotEligible = false,
    this.projectBeneficiaryClientReferenceId,
    this.isBeneficiaryRefused = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final beneficiaryType = context.beneficiaryType;

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
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Text(
                    name,
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
                child: Align(
                  alignment: Alignment.topRight,
                  child: DigitIconButton(
                    onPressed: () => DigitActionDialog.show(
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
              children: [
                Container(
                  margin: DigitTheme.instance.containerMargin,
                  child: Text(
                    localizations.translate(gender),
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Expanded(
                  child: Text(
                    " | $years ${localizations.translate(i18.memberCard.deliverDetailsYearText)} $months ${localizations.translate(i18.memberCard.deliverDetailsMonthsText)}",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Offstage(
            offstage: beneficiaryType != BeneficiaryType.individual,
            child: !isDelivered || isNotEligible || isBeneficiaryRefused
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: DigitIconButton(
                      icon: Icons.info_rounded,
                      iconText: localizations.translate(
                        isNotEligible
                            ? i18.householdOverView
                                .householdOverViewNotEligibleIconLabel
                            : isBeneficiaryRefused
                                ? Status.beneficiaryRefused.toValue()
                                // [TODO Need to update the localization]
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
                      iconTextColor:
                          DigitTheme.instance.colorScheme.onSurfaceVariant,
                      iconColor:
                          DigitTheme.instance.colorScheme.onSurfaceVariant,
                    ),
                  ),
          ),
          Offstage(
            offstage: beneficiaryType != BeneficiaryType.individual,
            child: Column(
              children: [
                isNotEligible || isBeneficiaryRefused
                    ? const Offstage()
                    : !isNotEligible
                        ? DigitElevatedButton(
                            onPressed: () {
                              final bloc =
                                  context.read<HouseholdOverviewBloc>();

                              final event =
                                  context.read<DeliverInterventionBloc>();
                              bloc.add(
                                HouseholdOverviewEvent.selectedIndividual(
                                  individualModel: individual,
                                ),
                              );

                              final futureTaskList = event.state.futureTask;
                              final hasMatchingTasks = futureTaskList?.any((ele) =>
                                      ele.projectBeneficiaryClientReferenceId ==
                                      projectBeneficiaryClientReferenceId) ??
                                  false;

                              if (hasMatchingTasks) {
                                context.router
                                    .push(RecordPastDeliveryDetailsRoute());
                              } else {
                                context.router.push(BeneficiaryDetailsRoute());
                              }
                            },
                            child: Center(
                              child: Text(
                                localizations.translate(
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
                isNotEligible || isBeneficiaryRefused
                    ? const Offstage()
                    : DigitOutLineButton(
                        label: localizations.translate(
                          i18.memberCard.unableToDeliverLabel,
                        ),
                        buttonStyle: OutlinedButton.styleFrom(
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
                        onPressed: () async {
                          await DigitActionDialog.show(
                            context,
                            widget: Column(
                              children: [
                                DigitOutLineButton(
                                  label: localizations.translate(
                                    i18.memberCard.beneficiaryRefusedLabel,
                                  ),
                                  buttonStyle: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                      width: 1.0,
                                      color: theme.colorScheme.secondary,
                                    ),
                                    minimumSize: Size(
                                      MediaQuery.of(context).size.width / 1.25,
                                      50,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                    context.read<DeliverInterventionBloc>().add(
                                          DeliverInterventionSubmitEvent(
                                            TaskModel(
                                              projectBeneficiaryClientReferenceId:
                                                  projectBeneficiaryClientReferenceId,
                                              clientReferenceId:
                                                  IdGen.i.identifier,
                                              tenantId:
                                                  envConfig.variables.tenantId,
                                              rowVersion: 1,
                                              auditDetails: AuditDetails(
                                                createdBy:
                                                    context.loggedInUserUuid,
                                                createdTime: context
                                                    .millisecondsSinceEpoch(),
                                              ),
                                              projectId: context.projectId,
                                              status: Status.beneficiaryRefused
                                                  .toValue(),
                                              clientAuditDetails:
                                                  ClientAuditDetails(
                                                createdBy:
                                                    context.loggedInUserUuid,
                                                createdTime: context
                                                    .millisecondsSinceEpoch(),
                                                lastModifiedBy:
                                                    context.loggedInUserUuid,
                                                lastModifiedTime: context
                                                    .millisecondsSinceEpoch(),
                                              ),
                                              additionalFields:
                                                  TaskAdditionalFields(
                                                version: 1,
                                                fields: [
                                                  AdditionalField(
                                                    'taskStatus',
                                                    Status.beneficiaryRefused
                                                        .toValue(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            false,
                                            context.boundary,
                                          ),
                                        );
                                    final parent =
                                        context.router.parent() as StackRouter;
                                    parent
                                      ..pop()
                                      ..pop();
                                    context.router.push(
                                      AcknowledgementRoute(),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DigitOutLineButton(
                                  label: localizations.translate(
                                    i18.memberCard.recordAdverseEventsLabel,
                                  ),
                                  buttonStyle: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                      width: 1.0,
                                      color: theme.colorScheme.secondary,
                                    ),
                                    minimumSize: Size(
                                      MediaQuery.of(context).size.width / 1.25,
                                      50,
                                    ),
                                  ),
                                  onPressed:
                                      tasks != null && (tasks ?? []).isNotEmpty
                                          ? () async {
                                              Navigator.of(
                                                context,
                                                rootNavigator: true,
                                              ).pop();
                                              await context.router.push(
                                                AdverseEventsRoute(
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
        ],
      ),
    );
  }
}
