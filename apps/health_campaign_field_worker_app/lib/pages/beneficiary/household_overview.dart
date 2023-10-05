import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/project/project.dart';
import '../../blocs/search_households/search_households.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/action_card/action_card.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/member_card/member_card.dart';

class HouseholdOverviewPage extends LocalizedStatefulWidget {
  const HouseholdOverviewPage({super.key, super.appLocalizations});

  @override
  State<HouseholdOverviewPage> createState() => _HouseholdOverviewPageState();
}

class _HouseholdOverviewPageState
    extends LocalizedState<HouseholdOverviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final beneficiaryType = context.beneficiaryType;

    return BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
      builder: (ctx, state) {
        return Scaffold(
          body: state.loading
              ? const Center(child: CircularProgressIndicator())
              : BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
                  builder: (ctx, state) {
                    if (state.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ScrollableContent(
                      header: const BackNavigationHelpHeaderWidget(),
                      children: [
                        DigitCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      localizations.translate(
                                        i18.householdOverView
                                            .householdOverViewLabel,
                                      ),
                                      style: theme.textTheme.displayMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  DigitIconButton(
                                    onPressed: () => DigitActionDialog.show(
                                      context,
                                      widget: ActionCard(
                                        items: [
                                          ActionCardModel(
                                            icon: Icons.edit,
                                            label: localizations.translate(
                                              i18.householdOverView
                                                  .householdOverViewEditLabel,
                                            ),
                                            action: () async {
                                              final projectId =
                                                  context.projectId;

                                              final bloc = context.read<
                                                  HouseholdOverviewBloc>();
                                              Navigator.of(
                                                context,
                                                rootNavigator: true,
                                              ).pop();

                                              HouseholdMemberWrapper wrapper =
                                                  state.householdMemberWrapper;

                                              final timestamp = wrapper
                                                  .projectBeneficiaries
                                                  .first
                                                  .dateOfRegistration;
                                              // [TODO ]
                                              final date = DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                timestamp,
                                              );

                                              final address =
                                                  wrapper.household.address;

                                              if (address == null) return;

                                              await context.router.root.push(
                                                BeneficiaryRegistrationWrapperRoute(
                                                  initialState:
                                                      BeneficiaryRegistrationEditHouseholdState(
                                                    addressModel: address,
                                                    individualModel:
                                                        wrapper.members,
                                                    householdModel:
                                                        wrapper.household,
                                                    registrationDate: date,
                                                  ),
                                                  children: [
                                                    HouseholdLocationRoute(),
                                                  ],
                                                ),
                                              );

                                              bloc.add(
                                                HouseholdOverviewReloadEvent(
                                                  projectId: projectId,
                                                  projectBeneficiaryType:
                                                      beneficiaryType,
                                                ),
                                              );
                                            },
                                          ),
                                          ActionCardModel(
                                            icon: Icons.delete,
                                            label: localizations.translate(i18
                                                .householdOverView
                                                .householdOverViewDeleteLabel),
                                            action: () => DigitDialog.show(
                                              context,
                                              options: DigitDialogOptions(
                                                titleText:
                                                    localizations.translate(i18
                                                        .householdOverView
                                                        .householdOverViewActionCardTitle),
                                                primaryAction:
                                                    DigitDialogActions(
                                                  label: localizations.translate(i18
                                                      .householdOverView
                                                      .householdOverViewPrimaryActionLabel),
                                                  action: (ctx) {
                                                    Navigator.of(
                                                      ctx,
                                                      rootNavigator: true,
                                                    )
                                                      ..pop()
                                                      ..pop();
                                                    context.router.push(
                                                      ReasonForDeletionRoute(
                                                        isHousholdDelete: true,
                                                      ),
                                                    );
                                                  },
                                                ),
                                                secondaryAction:
                                                    DigitDialogActions(
                                                  label: localizations.translate(i18
                                                      .householdOverView
                                                      .householdOverViewSecondaryActionLabel),
                                                  action: (context) {
                                                    Navigator.of(
                                                      context,
                                                      rootNavigator: true,
                                                    ).pop();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    iconText: localizations.translate(
                                      i18.householdOverView
                                          .householdOverViewEditIconText,
                                    ),
                                    icon: Icons.edit,
                                  ),
                                ],
                              ),
                              BlocBuilder<DeliverInterventionBloc,
                                  DeliverInterventionState>(
                                builder: (ctx, state) => Offstage(
                                  offstage: beneficiaryType ==
                                      BeneficiaryType.individual,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: DigitIconButton(
                                      icon: state.tasks?.first.status ==
                                              Status.delivered.toValue()
                                          ? Icons.check_circle
                                          : Icons.info_rounded,
                                      iconText: localizations.translate(
                                        state.tasks?.first.status ==
                                                Status.delivered.toValue()
                                            ? i18.householdOverView
                                                .householdOverViewDeliveredIconLabel
                                            : i18.householdOverView
                                                .householdOverViewNotDeliveredIconLabel,
                                      ),
                                      iconTextColor:
                                          state.tasks?.first.status ==
                                                  Status.delivered.toValue()
                                              ? DigitTheme.instance.colorScheme
                                                  .onSurfaceVariant
                                              : DigitTheme
                                                  .instance.colorScheme.error,
                                      iconColor: state.tasks?.first.status ==
                                              Status.delivered.toValue()
                                          ? DigitTheme.instance.colorScheme
                                              .onSurfaceVariant
                                          : DigitTheme
                                              .instance.colorScheme.error,
                                    ),
                                  ),
                                ),
                              ),
                              DigitTableCard(
                                element: {
                                  localizations.translate(i18.householdOverView
                                          .householdOverViewHouseholdHeadNameLabel):
                                      state.householdMemberWrapper
                                          .headOfHousehold.name?.givenName,
                                  localizations.translate(
                                    i18.householdLocation
                                        .administrationAreaFormLabel,
                                  ): context.boundary.name,
                                  localizations.translate(
                                    i18.deliverIntervention.memberCountText,
                                  ): state.householdMemberWrapper.household
                                      .memberCount,
                                },
                              ),
                              Column(
                                children:
                                    state.householdMemberWrapper.members.map(
                                  (e) {
                                    final isHead = state
                                            .householdMemberWrapper
                                            .headOfHousehold
                                            .clientReferenceId ==
                                        e.clientReferenceId;

                                    return BlocBuilder<ProjectBloc,
                                        ProjectState>(
                                      builder: (context, projectState) {
                                        return BlocBuilder<
                                            DeliverInterventionBloc,
                                            DeliverInterventionState>(
                                          builder: (ctx, deliverState) {
                                            final projectBeneficiary =
                                                beneficiaryType !=
                                                        BeneficiaryType
                                                            .individual
                                                    ? [
                                                        state
                                                            .householdMemberWrapper
                                                            .projectBeneficiaries
                                                            .first,
                                                      ]
                                                    : state
                                                        .householdMemberWrapper
                                                        .projectBeneficiaries
                                                        .where(
                                                          (element) =>
                                                              element
                                                                  .beneficiaryClientReferenceId ==
                                                              e.clientReferenceId,
                                                        )
                                                        .toList();

                                            final taskdata = state
                                                .householdMemberWrapper.tasks
                                                ?.where((element) =>
                                                    element
                                                        .projectBeneficiaryClientReferenceId ==
                                                    projectBeneficiary.first
                                                        .clientReferenceId)
                                                .toList();
                                            final adverseEventData = taskdata !=
                                                        null &&
                                                    taskdata.isNotEmpty
                                                ? state.householdMemberWrapper
                                                    .adverseEvents
                                                    ?.where((element) =>
                                                        element
                                                            .taskClientReferenceId ==
                                                        taskdata.first
                                                            .clientReferenceId)
                                                    .toList()
                                                : null;
                                            final ageInYears =
                                                DigitDateUtils.calculateAge(
                                              DigitDateUtils
                                                      .getFormattedDateToDateTime(
                                                    e.dateOfBirth!,
                                                  ) ??
                                                  DateTime.now(),
                                            ).years;
                                            final ageInMonths =
                                                DigitDateUtils.calculateAge(
                                              DigitDateUtils
                                                      .getFormattedDateToDateTime(
                                                    e.dateOfBirth!,
                                                  ) ??
                                                  DateTime.now(),
                                            ).months;

                                            final isBeneficiaryRefused =
                                                checkIfBeneficiaryRefused(
                                              taskdata,
                                            );

                                            return MemberCard(
                                              isHead: isHead,
                                              individual: e,
                                              tasks: taskdata,
                                              editMemberAction: () async {
                                                final bloc = ctx.read<
                                                    HouseholdOverviewBloc>();

                                                Navigator.of(
                                                  context,
                                                  rootNavigator: true,
                                                ).pop();

                                                final address = e.address;
                                                if (address == null ||
                                                    address.isEmpty) {
                                                  return;
                                                }

                                                final projectId =
                                                    context.projectId;

                                                await context.router.root.push(
                                                  BeneficiaryRegistrationWrapperRoute(
                                                    initialState:
                                                        BeneficiaryRegistrationEditIndividualState(
                                                      individualModel: e,
                                                      householdModel: state
                                                          .householdMemberWrapper
                                                          .household,
                                                      addressModel:
                                                          address.first,
                                                    ),
                                                    children: [
                                                      IndividualDetailsRoute(
                                                        isHeadOfHousehold:
                                                            false,
                                                      ),
                                                    ],
                                                  ),
                                                );

                                                bloc.add(
                                                  HouseholdOverviewReloadEvent(
                                                    projectId: projectId,
                                                    projectBeneficiaryType:
                                                        beneficiaryType,
                                                  ),
                                                );
                                              },
                                              setAsHeadAction: () {
                                                ctx
                                                    .read<
                                                        HouseholdOverviewBloc>()
                                                    .add(
                                                      HouseholdOverviewSetAsHeadEvent(
                                                        individualModel: e,
                                                        projectId:
                                                            ctx.projectId,
                                                        householdModel: state
                                                            .householdMemberWrapper
                                                            .household,
                                                        projectBeneficiaryType:
                                                            beneficiaryType,
                                                      ),
                                                    );

                                                Navigator.of(
                                                  context,
                                                  rootNavigator: true,
                                                ).pop();
                                              },
                                              deleteMemberAction: () {
                                                DigitDialog.show(
                                                  context,
                                                  options: DigitDialogOptions(
                                                    titleText: localizations
                                                        .translate(i18
                                                            .householdOverView
                                                            .householdOverViewActionCardTitle),
                                                    primaryAction:
                                                        DigitDialogActions(
                                                      label: localizations
                                                          .translate(i18
                                                              .householdOverView
                                                              .householdOverViewPrimaryActionLabel),
                                                      action: (ctx) {
                                                        Navigator.of(
                                                          context,
                                                          rootNavigator: true,
                                                        )
                                                          ..pop()
                                                          ..pop();
                                                        context
                                                            .read<
                                                                HouseholdOverviewBloc>()
                                                            .add(
                                                              HouseholdOverviewEvent
                                                                  .selectedIndividual(
                                                                individualModel:
                                                                    e,
                                                              ),
                                                            );
                                                        context.router.push(
                                                          ReasonForDeletionRoute(
                                                            isHousholdDelete:
                                                                false,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    secondaryAction:
                                                        DigitDialogActions(
                                                      label: localizations
                                                          .translate(i18
                                                              .householdOverView
                                                              .householdOverViewSecondaryActionLabel),
                                                      action: (context) {
                                                        Navigator.of(
                                                          context,
                                                          rootNavigator: true,
                                                        ).pop();
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                              isNotEligible:
                                                  (!checkEligibilityForAgeAndAdverseEvent(
                                                DigitDOBAge(
                                                  years: ageInYears,
                                                  months: ageInMonths,
                                                ),
                                                projectState
                                                    .projectType?.validMinAge,
                                                projectState
                                                    .projectType?.validMaxAge,
                                                adverseEventData,
                                              )),
                                              // TODO Need to handle the null check
                                              name: e.name?.givenName ?? ' - ',
                                              years: (e.dateOfBirth == null
                                                      ? null
                                                      : DigitDateUtils
                                                          .calculateAge(
                                                          DigitDateUtils
                                                                  .getFormattedDateToDateTime(
                                                                e.dateOfBirth!,
                                                              ) ??
                                                              DateTime.now(),
                                                        ).years) ??
                                                  0,
                                              months: (e.dateOfBirth == null
                                                      ? null
                                                      : DigitDateUtils
                                                          .calculateAge(
                                                          DigitDateUtils
                                                                  .getFormattedDateToDateTime(
                                                                e.dateOfBirth!,
                                                              ) ??
                                                              DateTime.now(),
                                                        ).months) ??
                                                  0,
                                              gender: e.gender?.name ?? ' - ',
                                              isBeneficiaryRefused:
                                                  isBeneficiaryRefused,
                                              isDelivered: taskdata == null
                                                  ? false
                                                  : taskdata.isNotEmpty &&
                                                          !isBeneficiaryRefused &&
                                                          (adverseEventData ??
                                                                  [])
                                                              .isEmpty &&
                                                          !checkStatus(
                                                            taskdata,
                                                            null,
                                                          )
                                                      // TODO Need to pass the cycle
                                                      ? true
                                                      : false,
                                              localizations: localizations,
                                              projectBeneficiaryClientReferenceId:
                                                  state
                                                      .householdMemberWrapper
                                                      .projectBeneficiaries
                                                      .first
                                                      .clientReferenceId,
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ).toList(),
                              ),
                              Center(
                                child: DigitIconButton(
                                  onPressed: () async {
                                    final bloc =
                                        context.read<HouseholdOverviewBloc>();

                                    final wrapper =
                                        state.householdMemberWrapper;
                                    final address = wrapper.household.address;

                                    if (address == null) return;

                                    final projectId = context.projectId;

                                    await context.router.push(
                                      BeneficiaryRegistrationWrapperRoute(
                                        initialState:
                                            BeneficiaryRegistrationAddMemberState(
                                          addressModel: address,
                                          householdModel: wrapper.household,
                                        ),
                                        children: [
                                          IndividualDetailsRoute(),
                                        ],
                                      ),
                                    );
                                    bloc.add(
                                      HouseholdOverviewReloadEvent(
                                        projectId: projectId,
                                        projectBeneficiaryType: beneficiaryType,
                                      ),
                                    );
                                  },
                                  iconText: localizations.translate(
                                    i18.householdOverView
                                        .householdOverViewAddActionText,
                                  ),
                                  icon: Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
          bottomNavigationBar: Offstage(
            offstage: beneficiaryType == BeneficiaryType.individual,
            child: SizedBox(
              height: 85,
              child: BlocBuilder<DeliverInterventionBloc,
                  DeliverInterventionState>(
                builder: (ctx, state) => DigitCard(
                  margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
                  child: state.tasks?.first.status == Status.delivered.toValue()
                      ? DigitOutLineButton(
                          label: localizations.translate(
                            i18.memberCard.deliverDetailsUpdateLabel,
                          ),
                          onPressed: () async {
                            await context.router
                                .push(BeneficiaryDetailsRoute());
                          },
                        )
                      : DigitElevatedButton(
                          onPressed: () async {
                            final bloc = ctx.read<HouseholdOverviewBloc>();

                            final projectId = context.projectId;

                            bloc.add(
                              HouseholdOverviewReloadEvent(
                                projectId: projectId,
                                projectBeneficiaryType: beneficiaryType,
                              ),
                            );

                            await context.router
                                .push(BeneficiaryDetailsRoute());
                          },
                          child: Center(
                            child: Text(
                              localizations.translate(
                                i18.householdOverView
                                    .householdOverViewActionText,
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
