import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_data_model/models/project_type/project_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/search_households/search_bloc_common_wrapper.dart';
import '../../blocs/search_households/search_households.dart';
import '../../models/entities/beneficiary_type.dart';
import '../../models/entities/status.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/utils.dart';
import '../../widgets/action_card/action_card.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/member_card/member_card.dart';
import '../../utils/i18_key_constants.dart' as i18;

@RoutePage()
class HouseholdOverviewPage extends LocalizedStatefulWidget {
  const HouseholdOverviewPage({super.key, super.appLocalizations});

  @override
  State<HouseholdOverviewPage> createState() => _HouseholdOverviewPageState();
}

class _HouseholdOverviewPageState
    extends LocalizedState<HouseholdOverviewPage> {
  @override
  void initState() {
    final bloc = context.read<HouseholdOverviewBloc>();
    bloc.add(
      HouseholdOverviewReloadEvent(
        projectId: RegistrationDeliverySingleton().projectId!,
        projectBeneficiaryType:
            RegistrationDeliverySingleton().beneficiaryType!,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final beneficiaryType = RegistrationDeliverySingleton().beneficiaryType!;

    return PopScope(
      onPopInvoked: (didPop) async {
        context
            .read<SearchBlocWrapper>()
            .searchHouseholdsBloc
            .add(const SearchHouseholdsClearEvent());
        context.router.maybePop();
      },
      child: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
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
                        header: BackNavigationHelpHeaderWidget(
                          handleBack: () {
                            context
                                .read<SearchBlocWrapper>()
                                .searchHouseholdsBloc
                                .add(const SearchHouseholdsClearEvent());
                          },
                        ),
                        enableFixedButton: true,
                        footer: Offstage(
                          offstage:
                              beneficiaryType == BeneficiaryType.individual,
                          child: BlocBuilder<DeliverInterventionBloc,
                              DeliverInterventionState>(
                            builder: (ctx, state) => DigitCard(
                              margin:
                                  const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                              padding: const EdgeInsets.fromLTRB(
                                  kPadding, 0, kPadding, 0),
                              child: state.tasks?.first.status ==
                                      Status.administeredSuccess.toValue()
                                  ? DigitOutLineButton(
                                      label: localizations.translate(
                                        i18.memberCard
                                            .deliverDetailsUpdateLabel,
                                      ),
                                      onPressed: () async {
                                        await context.router
                                            .push(DeliverInterventionRoute());
                                      },
                                    )
                                  : DigitElevatedButton(
                                      onPressed: () async {
                                        final bloc =
                                            ctx.read<HouseholdOverviewBloc>();

                                        final projectId =
                                            RegistrationDeliverySingleton()
                                                .projectId!;

                                        bloc.add(
                                          HouseholdOverviewReloadEvent(
                                            projectId: projectId,
                                            projectBeneficiaryType:
                                                beneficiaryType,
                                          ),
                                        );

                                        await context.router
                                            .push(DeliverInterventionRoute());
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
                        slivers: [
                          SliverToBoxAdapter(
                            child: DigitCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: DigitIconButton(
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
                                                    RegistrationDeliverySingleton()
                                                        .projectId!;

                                                final bloc = context.read<
                                                    HouseholdOverviewBloc>();
                                                Navigator.of(
                                                  context,
                                                  rootNavigator: true,
                                                ).pop();

                                                HouseholdMemberWrapper wrapper =
                                                    state
                                                        .householdMemberWrapper;

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

                                                final projectBeneficiary = state
                                                    .householdMemberWrapper
                                                    .projectBeneficiaries
                                                    .firstWhereOrNull(
                                                  (element) =>
                                                      element
                                                          .beneficiaryClientReferenceId ==
                                                      wrapper.household
                                                          .clientReferenceId,
                                                );

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
                                                      projectBeneficiaryModel:
                                                          projectBeneficiary,
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
                                                        ctx,
                                                        rootNavigator: true,
                                                      )
                                                        ..pop()
                                                        ..pop();
                                                      context.router.push(
                                                        ReasonForDeletionRoute(
                                                          isHousholdDelete:
                                                              true,
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
                                                  Status.administeredSuccess
                                                      .toValue()
                                              ? Icons.check_circle
                                              : Icons.info_rounded,
                                          iconText: localizations.translate(
                                            state.tasks?.first.status ==
                                                    Status.administeredSuccess
                                                        .toValue()
                                                ? i18.householdOverView
                                                    .householdOverViewDeliveredIconLabel
                                                : i18.householdOverView
                                                    .householdOverViewNotDeliveredIconLabel,
                                          ),
                                          iconTextColor:
                                              state.tasks?.first.status ==
                                                      Status.administeredSuccess
                                                          .toValue()
                                                  ? DigitTheme
                                                      .instance
                                                      .colorScheme
                                                      .onSurfaceVariant
                                                  : DigitTheme.instance
                                                      .colorScheme.error,
                                          iconColor:
                                              state.tasks?.first.status ==
                                                      Status.administeredSuccess
                                                          .toValue()
                                                  ? DigitTheme
                                                      .instance
                                                      .colorScheme
                                                      .onSurfaceVariant
                                                  : DigitTheme.instance
                                                      .colorScheme.error,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: kPadding,
                                      right: kPadding,
                                    ),
                                    child: Text(
                                      localizations.translate(i18
                                          .householdOverView
                                          .householdOverViewLabel),
                                      style: theme.textTheme.displayMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: kPadding,
                                      right: kPadding,
                                    ),
                                    child: DigitTableCard(
                                      element: {
                                        localizations.translate(i18
                                                .householdOverView
                                                .householdOverViewHouseholdHeadNameLabel):
                                            state
                                                .householdMemberWrapper
                                                .headOfHousehold
                                                .name
                                                ?.givenName,
                                        localizations.translate(
                                          i18.householdLocation
                                              .administrationAreaFormLabel,
                                        ): RegistrationDeliverySingleton()
                                            .boundary
                                            ?.name,
                                        localizations.translate(
                                          i18.deliverIntervention
                                              .memberCountText,
                                        ): state.householdMemberWrapper
                                            .household.memberCount,
                                      },
                                    ),
                                  ),
                                  Column(
                                    children: state
                                        .householdMemberWrapper.members
                                        .map(
                                      (e) {
                                        final isHead = state
                                                .householdMemberWrapper
                                                .headOfHousehold
                                                .clientReferenceId ==
                                            e.clientReferenceId;
                                        final projectBeneficiaryId = state
                                            .householdMemberWrapper
                                            .projectBeneficiaries
                                            .firstWhereOrNull((b) =>
                                                b.beneficiaryClientReferenceId ==
                                                e.clientReferenceId)
                                            ?.clientReferenceId;

                                        final projectBeneficiary =
                                            beneficiaryType !=
                                                    BeneficiaryType.individual
                                                ? [
                                                    state
                                                        .householdMemberWrapper
                                                        .projectBeneficiaries
                                                        .first,
                                                  ]
                                                : state.householdMemberWrapper
                                                    .projectBeneficiaries
                                                    .where(
                                                      (element) =>
                                                          element
                                                              .beneficiaryClientReferenceId ==
                                                          e.clientReferenceId,
                                                    )
                                                    .toList();

                                        final taskdata = projectBeneficiary
                                                .isNotEmpty
                                            ? state.householdMemberWrapper.tasks
                                                ?.where((element) =>
                                                    element
                                                        .projectBeneficiaryClientReferenceId ==
                                                    projectBeneficiary.first
                                                        .clientReferenceId)
                                                .toList()
                                            : null;
                                        final referralData = projectBeneficiary
                                                .isNotEmpty
                                            ? state.householdMemberWrapper
                                                .referrals
                                                ?.where((element) =>
                                                    element
                                                        .projectBeneficiaryClientReferenceId ==
                                                    projectBeneficiary.first
                                                        .clientReferenceId)
                                                .toList()
                                            : null;
                                        final sideEffectData = taskdata !=
                                                    null &&
                                                taskdata.isNotEmpty
                                            ? state.householdMemberWrapper
                                                .sideEffects
                                                ?.where((element) =>
                                                    element
                                                        .taskClientReferenceId ==
                                                    taskdata
                                                        .last.clientReferenceId)
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
                                        final currentCycle = RegistrationDeliverySingleton()
                                            .projectType?.cycles
                                            ?.firstWhereOrNull(
                                          (e) =>
                                              (e.startDate!) <
                                                  DateTime.now()
                                                      .millisecondsSinceEpoch &&
                                              (e.endDate!) >
                                                  DateTime.now()
                                                      .millisecondsSinceEpoch,
                                          // Return null when no matching cycle is found
                                        );

                                        final isBeneficiaryRefused =
                                            checkIfBeneficiaryRefused(
                                          taskdata,
                                        );
                                        final isBeneficiaryReferred =
                                            checkIfBeneficiaryReferred(
                                          referralData,
                                          currentCycle ?? const Cycle(),
                                        );

                                        return MemberCard(
                                          isHead: isHead,
                                          individual: e,
                                          tasks: taskdata,
                                          sideEffects: sideEffectData,
                                          editMemberAction: () async {
                                            final bloc = ctx
                                                .read<HouseholdOverviewBloc>();

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
                                                RegistrationDeliverySingleton()
                                                    .projectId!;

                                            await context.router.root.push(
                                              BeneficiaryRegistrationWrapperRoute(
                                                initialState:
                                                    BeneficiaryRegistrationEditIndividualState(
                                                  individualModel: e,
                                                  householdModel: state
                                                      .householdMemberWrapper
                                                      .household,
                                                  addressModel: address.first,
                                                  projectBeneficiaryModel: state
                                                      .householdMemberWrapper
                                                      .projectBeneficiaries
                                                      .firstWhereOrNull(
                                                    (element) =>
                                                        element
                                                            .beneficiaryClientReferenceId ==
                                                        (RegistrationDeliverySingleton().beneficiaryType ==
                                                                BeneficiaryType
                                                                    .individual
                                                            ? e
                                                                .clientReferenceId
                                                            : state
                                                                .householdMemberWrapper
                                                                .household
                                                                .clientReferenceId),
                                                  ),
                                                ),
                                                children: [
                                                  IndividualDetailsRoute(
                                                    isHeadOfHousehold: isHead,
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
                                                .read<HouseholdOverviewBloc>()
                                                .add(
                                                  HouseholdOverviewSetAsHeadEvent(
                                                    individualModel: e,
                                                    projectId: RegistrationDeliverySingleton().projectId!,
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
                                                titlePadding:
                                                    const EdgeInsets.fromLTRB(
                                                  kPadding * 2,
                                                  kPadding * 2,
                                                  kPadding * 2,
                                                  kPadding / 2,
                                                ),
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
                                                            individualModel: e,
                                                          ),
                                                        );

                                                    context.router
                                                        .popUntilRouteWithName(
                                                      SearchBeneficiaryRoute
                                                          .name,
                                                    );
                                                    context.router.push(
                                                      ReasonForDeletionRoute(
                                                        isHousholdDelete: false,
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
                                            );
                                          },
                                          isNotEligible: RegistrationDeliverySingleton()
                                                      .projectType?.cycles !=
                                                  null
                                              ? !checkEligibilityForAgeAndSideEffect(
                                                  DigitDOBAge(
                                                    years: ageInYears,
                                                    months: ageInMonths,
                                                  ),
                                        RegistrationDeliverySingleton().projectType,
                                                  (taskdata ?? []).isNotEmpty
                                                      ? taskdata?.last
                                                      : null,
                                                  sideEffectData,
                                                )
                                              : false,
                                          name: e.name?.givenName ?? ' - ',
                                          years: (e.dateOfBirth == null
                                                  ? null
                                                  : DigitDateUtils.calculateAge(
                                                      DigitDateUtils
                                                              .getFormattedDateToDateTime(
                                                            e.dateOfBirth!,
                                                          ) ??
                                                          DateTime.now(),
                                                    ).years) ??
                                              0,
                                          months: (e.dateOfBirth == null
                                                  ? null
                                                  : DigitDateUtils.calculateAge(
                                                      DigitDateUtils
                                                              .getFormattedDateToDateTime(
                                                            e.dateOfBirth!,
                                                          ) ??
                                                          DateTime.now(),
                                                    ).months) ??
                                              0,
                                          gender: e.gender?.name,
                                          isBeneficiaryRefused:
                                              isBeneficiaryRefused &&
                                                  !checkStatus(
                                                    taskdata,
                                                    currentCycle,
                                                  ),
                                          isBeneficiaryReferred:
                                              isBeneficiaryReferred,
                                          isDelivered: taskdata == null
                                              ? false
                                              : taskdata.isNotEmpty &&
                                                      !checkStatus(
                                                        taskdata,
                                                        currentCycle,
                                                      )
                                                  // TODO Need to pass the cycle
                                                  ? true
                                                  : false,
                                          localizations: localizations,
                                          projectBeneficiaryClientReferenceId:
                                              projectBeneficiaryId,
                                        );
                                      },
                                    ).toList(),
                                  ),
                                  const SizedBox(
                                    height: kPadding,
                                  ),
                                  Center(
                                    child: DigitIconButton(
                                      onPressed: () async {
                                        final bloc = context
                                            .read<HouseholdOverviewBloc>();

                                        final wrapper =
                                            state.householdMemberWrapper;
                                        final address =
                                            wrapper.household.address;

                                        if (address == null) return;

                                        final projectId =
                                            RegistrationDeliverySingleton()
                                                .projectId!;
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
                                            projectBeneficiaryType:
                                                beneficiaryType,
                                          ),
                                        );
                                      },
                                      iconText: localizations.translate(
                                        i18.householdOverView
                                            .householdOverViewAddActionText,
                                      ),
                                      icon: Icons.add_circle,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: kPadding,
                                  ),
                                ],
                              ),
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
}
