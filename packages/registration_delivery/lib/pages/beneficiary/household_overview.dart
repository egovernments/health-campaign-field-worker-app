import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_action_card.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/utils/constants.dart';
import 'package:survey_form/survey_form.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/search_households/search_bloc_common_wrapper.dart';
import '../../blocs/search_households/search_households.dart';
import '../../models/entities/household.dart';
import '../../models/entities/registration_delivery_enums.dart';
import '../../models/entities/status.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/member_card/member_card.dart';
import '../../widgets/table_card/table_card.dart';

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
    final textTheme = theme.digitTextTheme(context);

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
                : ScrollableContent(
                    header: BackNavigationHelpHeaderWidget(
                      handleBack: () {
                        context
                            .read<SearchHouseholdsBloc>()
                            .add(const SearchHouseholdsEvent.clear());
                      },
                    ),
                    enableFixedDigitButton: true,
                    footer: Offstage(
                      offstage: beneficiaryType == BeneficiaryType.individual ||
                          isOutsideProjectDateRange(),
                      child: BlocBuilder<ServiceDefinitionBloc,
                          ServiceDefinitionState>(
                        builder: (context, serviceDefinitionState) =>
                            BlocBuilder<DeliverInterventionBloc,
                                DeliverInterventionState>(
                          builder: (ctx, deliverInterventionState) => DigitCard(
                              margin: const EdgeInsets.only(top: spacer2),
                              children: [
                                state.householdMemberWrapper.tasks?.lastOrNull
                                            ?.status ==
                                        Status.administeredSuccess.toValue()
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: spacer2),
                                        child: DigitButton(
                                          label: localizations.translate(
                                            '${RegistrationDeliverySingleton().selectedProject!.projectType}_${i18.memberCard.deliverDetailsUpdateLabel}',
                                          ),
                                          capitalizeLetters: false,
                                          isDisabled: state
                                                      .householdMemberWrapper
                                                      .tasks
                                                      ?.lastOrNull
                                                      ?.status ==
                                                  Status.administeredSuccess
                                                      .toValue()
                                              ? true
                                              : false,
                                          type: DigitButtonType.secondary,
                                          size: DigitButtonSize.large,
                                          mainAxisSize: MainAxisSize.max,
                                          onPressed: () {
                                            serviceDefinitionState.when(
                                                empty: () {},
                                                isloading: () {},
                                                serviceDefinitionFetch:
                                                    (value, model) {
                                                  if (value
                                                      .where((element) => element
                                                          .code
                                                          .toString()
                                                          .contains(
                                                              '${RegistrationDeliverySingleton().selectedProject?.name}.${RegistrationDeliveryEnums.iec.toValue()}'))
                                                      .toList()
                                                      .isEmpty) {
                                                    context.router.push(
                                                      DeliverInterventionRoute(),
                                                    );
                                                  } else {
                                                    navigateToChecklist(ctx);
                                                  }
                                                });
                                          },
                                        ),
                                      )
                                    : DigitButton(
                                        label: localizations.translate(
                                          '${RegistrationDeliverySingleton().selectedProject!.projectType}_${i18.householdOverView.householdOverViewActionText}',
                                        ),
                                        capitalizeLetters: false,
                                        type: DigitButtonType.primary,
                                        size: DigitButtonSize.large,
                                        mainAxisSize: MainAxisSize.max,
                                        isDisabled: (state.householdMemberWrapper
                                                            .projectBeneficiaries ??
                                                        [])
                                                    .isEmpty ||
                                                state
                                                        .householdMemberWrapper
                                                        .tasks
                                                        ?.lastOrNull
                                                        ?.status ==
                                                    Status.closeHousehold
                                                        .toValue()
                                            ? true
                                            : false,
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

                                          serviceDefinitionState.when(
                                              empty: () {},
                                              isloading: () {},
                                              serviceDefinitionFetch:
                                                  (value, model) {
                                                if (value
                                                    .where((element) => element
                                                        .code
                                                        .toString()
                                                        .contains(
                                                            '${RegistrationDeliverySingleton().selectedProject?.name}.${RegistrationDeliveryEnums.iec.toValue()}'))
                                                    .toList()
                                                    .isEmpty) {
                                                  context.router.push(
                                                    DeliverInterventionRoute(),
                                                  );
                                                } else {
                                                  navigateToChecklist(ctx);
                                                }
                                              });
                                        },
                                      ),
                              ]),
                        ),
                      ),
                    ),
                    slivers: [
                      SliverToBoxAdapter(
                        child: DigitCard(
                            margin: const EdgeInsets.all(spacer2),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if ((state.householdMemberWrapper
                                              .projectBeneficiaries ??
                                          [])
                                      .isNotEmpty)
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: DigitButton(
                                        onPressed: () {
                                          final projectId =
                                              RegistrationDeliverySingleton()
                                                  .projectId!;

                                          final bloc = context
                                              .read<HouseholdOverviewBloc>();
                                          bloc.add(
                                            HouseholdOverviewReloadEvent(
                                              projectId: projectId,
                                              projectBeneficiaryType:
                                                  beneficiaryType,
                                            ),
                                          );
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => DigitActionCard(
                                              actions: [
                                                DigitButton(
                                                  prefixIcon: Icons.edit,
                                                  label:
                                                      localizations.translate(
                                                    i18.householdOverView
                                                        .householdOverViewEditLabel,
                                                  ),
                                                  type:
                                                      DigitButtonType.secondary,
                                                  size: DigitButtonSize.large,
                                                  onPressed: () async {
                                                    Navigator.of(
                                                      context,
                                                      rootNavigator: true,
                                                    ).pop();

                                                    HouseholdMemberWrapper
                                                        wrapper = state
                                                            .householdMemberWrapper;

                                                    final timestamp = wrapper
                                                        .headOfHousehold
                                                        ?.clientAuditDetails
                                                        ?.createdTime;
                                                    final date = DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                      timestamp ??
                                                          DateTime.now()
                                                              .millisecondsSinceEpoch,
                                                    );

                                                    final address = wrapper
                                                        .household?.address;

                                                    if (address == null) return;

                                                    final projectBeneficiary = state
                                                        .householdMemberWrapper
                                                        .projectBeneficiaries
                                                        ?.firstWhereOrNull(
                                                      (element) =>
                                                          element
                                                              .beneficiaryClientReferenceId ==
                                                          wrapper.household
                                                              ?.clientReferenceId,
                                                    );

                                                    await context.router.root
                                                        .push(
                                                      BeneficiaryRegistrationWrapperRoute(
                                                        initialState:
                                                            BeneficiaryRegistrationEditHouseholdState(
                                                          addressModel: address,
                                                          individualModel: state
                                                                  .householdMemberWrapper
                                                                  .members ??
                                                              [],
                                                          householdModel: state
                                                              .householdMemberWrapper
                                                              .household!,
                                                          registrationDate:
                                                              date,
                                                          projectBeneficiaryModel:
                                                              projectBeneficiary,
                                                        ),
                                                        children: [
                                                          HouseholdLocationRoute(),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        label: localizations.translate(
                                          i18.householdOverView
                                              .householdOverViewEditIconText,
                                        ),
                                        type: DigitButtonType.tertiary,
                                        size: DigitButtonSize.medium,
                                        prefixIcon: Icons.edit,
                                      ),
                                    ),
                                  // BlocBuilder<DeliverInterventionBloc,
                                  //     DeliverInterventionState>(
                                  //   builder: (ctx, deliverInterventionState) =>
                                  //       Offstage(
                                  //     offstage: beneficiaryType ==
                                  //         BeneficiaryType.individual,
                                  //     child: Align(
                                  //       alignment: Alignment.centerLeft,
                                  //       child: DigitIconButton(
                                  //         icon: getStatusAttributes(state,
                                  //             deliverInterventionState)['icon'],
                                  //         iconText: localizations.translate(
                                  //           getStatusAttributes(state,
                                  //                   deliverInterventionState)[
                                  //               'textLabel'],
                                  //         ), // [TODO: map task status accordingly based on projectBeneficiaries and tasks]
                                  //         iconTextColor: getStatusAttributes(state,
                                  //             deliverInterventionState)['color'],
                                  //         iconColor: getStatusAttributes(state,
                                  //             deliverInterventionState)['color'],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.all(spacer2),
                                    child: Text(
                                      localizations.translate(i18
                                          .householdOverView
                                          .householdOverViewLabel),
                                      style: textTheme.headingXl,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: spacer2,
                                      right: spacer2,
                                    ),
                                    child: BlocBuilder<DeliverInterventionBloc,
                                            DeliverInterventionState>(
                                        builder:
                                            (ctx, deliverInterventionState) {
                                      bool shouldShowStatus = beneficiaryType ==
                                          BeneficiaryType.household;

                                      return Column(
                                        children: [
                                          DigitTableCard(
                                            element: {
                                              localizations.translate(i18
                                                      .householdOverView
                                                      .householdOverViewHouseholdHeadNameLabel):
                                                  state
                                                          .householdMemberWrapper
                                                          .headOfHousehold
                                                          ?.name
                                                          ?.givenName ??
                                                      localizations.translate(
                                                          i18.common
                                                              .coreCommonNA),
                                              localizations.translate(
                                                i18.householdLocation
                                                    .administrationAreaFormLabel,
                                              ): localizations.translate(state
                                                      .householdMemberWrapper
                                                      .headOfHousehold
                                                      ?.address
                                                      ?.first
                                                      .locality
                                                      ?.code ??
                                                  i18.common.coreCommonNA),
                                              localizations.translate(
                                                i18.deliverIntervention
                                                    .memberCountText,
                                              ): state.householdMemberWrapper
                                                  .household?.memberCount,
                                              if (shouldShowStatus)
                                                localizations.translate(i18
                                                        .beneficiaryDetails
                                                        .status):
                                                    localizations.translate(
                                                  getStatusAttributes(state,
                                                          deliverInterventionState)[
                                                      'textLabel'],
                                                )
                                            },
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                  Column(
                                    children: (state
                                                .householdMemberWrapper.members
                                                ?.where((m) =>
                                                    m.parentClientReferenceId ==
                                                    null) ??
                                            [])
                                        .map(
                                      (e) {
                                        final isHead = state
                                                .householdMemberWrapper
                                                .headOfHousehold
                                                ?.clientReferenceId ==
                                            e.clientReferenceId;
                                        final household = state
                                            .householdMemberWrapper.household;
                                        final projectBeneficiaryId = state
                                            .householdMemberWrapper
                                            .projectBeneficiaries
                                            ?.firstWhereOrNull((b) =>
                                                b.beneficiaryClientReferenceId ==
                                                e.clientReferenceId)
                                            ?.clientReferenceId;

                                        final projectBeneficiary = state
                                            .householdMemberWrapper
                                            .projectBeneficiaries
                                            ?.where(
                                              (element) => (element
                                                      .beneficiaryClientReferenceId ==
                                                  (RegistrationDeliverySingleton()
                                                              .beneficiaryType ==
                                                          BeneficiaryType
                                                              .individual
                                                      ? e.clientReferenceId
                                                      : state
                                                          .householdMemberWrapper
                                                          .household
                                                          ?.clientReferenceId)),
                                            )
                                            .toList();

                                        final childrenBeneficiaries = state
                                            .householdMemberWrapper.members
                                            ?.where((mem) =>
                                                mem.parentClientReferenceId !=
                                                    null &&
                                                mem.parentClientReferenceId ==
                                                    e.clientReferenceId)
                                            .map((ind) => ChildrenBeneficiaries(
                                                  household: state
                                                      .householdMemberWrapper
                                                      .household,
                                                  individual: ind,
                                                  projectBeneficiary: state
                                                      .householdMemberWrapper
                                                      .projectBeneficiaries
                                                      ?.firstWhereOrNull((beneficiary) =>
                                                         (beneficiary
                                                                  .beneficiaryClientReferenceId ==
                                                              (beneficiaryType == BeneficiaryType.individual ? ind
                                                                  .clientReferenceId : state.householdMemberWrapper.household?.clientReferenceId ))),
                                                  tasks: [],
                                                  sideEffects: [],
                                                  referrals: [],
                                                ))
                                            .toList();

                                        final taskData = (projectBeneficiary ??
                                                    [])
                                                .isNotEmpty
                                            ? state.householdMemberWrapper.tasks
                                                ?.where((element) =>
                                                    element
                                                        .projectBeneficiaryClientReferenceId ==
                                                    projectBeneficiary?.first
                                                        .clientReferenceId)
                                                .toList()
                                            : null;
                                        final referralData = (projectBeneficiary ??
                                                    [])
                                                .isNotEmpty
                                            ? state.householdMemberWrapper
                                                .referrals
                                                ?.where((element) =>
                                                    element
                                                        .projectBeneficiaryClientReferenceId ==
                                                    projectBeneficiary?.first
                                                        .clientReferenceId)
                                                .toList()
                                            : null;
                                        final sideEffectData = taskData !=
                                                    null &&
                                                taskData.isNotEmpty
                                            ? state.householdMemberWrapper
                                                .sideEffects
                                                ?.where((element) =>
                                                    element
                                                        .taskClientReferenceId ==
                                                    taskData.lastOrNull
                                                        ?.clientReferenceId)
                                                .toList()
                                            : null;
                                        final ageInYears = e.dateOfBirth != null
                                            ? DigitDateUtils.calculateAge(
                                                DigitDateUtils
                                                        .getFormattedDateToDateTime(
                                                      e.dateOfBirth!,
                                                    ) ??
                                                    DateTime.now(),
                                              ).years
                                            : 0;
                                        final ageInMonths =
                                            e.dateOfBirth != null
                                                ? DigitDateUtils.calculateAge(
                                                    DigitDateUtils
                                                            .getFormattedDateToDateTime(
                                                          e.dateOfBirth!,
                                                        ) ??
                                                        DateTime.now(),
                                                  ).months
                                                : 0;
                                        final currentCycle =
                                            RegistrationDeliverySingleton()
                                                .projectType
                                                ?.cycles
                                                ?.firstWhereOrNull(
                                                  (e) =>
                                                      (e.startDate) <
                                                          DateTime.now()
                                                              .millisecondsSinceEpoch &&
                                                      (e.endDate) >
                                                          DateTime.now()
                                                              .millisecondsSinceEpoch,
                                                );

                                        final isBeneficiaryRefused =
                                            checkIfBeneficiaryRefused(
                                          taskData,
                                        );
                                        final isBeneficiaryReferred =
                                            checkIfBeneficiaryReferred(
                                          referralData,
                                          currentCycle,
                                        );

                                        return MemberCard(
                                          isHead: isHead,
                                          individual: e,
                                          household: household,
                                          projectBeneficiaries:
                                              projectBeneficiary ?? [],
                                          tasks: taskData,
                                          sideEffects: sideEffectData,
                                          childrenBeneficiaries: childrenBeneficiaries,
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
                                            bloc.add(
                                              HouseholdOverviewReloadEvent(
                                                projectId: projectId,
                                                projectBeneficiaryType:
                                                    beneficiaryType,
                                              ),
                                            );

                                            await context.router.root.push(
                                              BeneficiaryRegistrationWrapperRoute(
                                                initialState:
                                                    BeneficiaryRegistrationEditIndividualState(
                                                  individualModel: e,
                                                  householdModel: state
                                                      .householdMemberWrapper
                                                      .household!,
                                                  addressModel: address.first,
                                                  projectBeneficiaryModel: state
                                                      .householdMemberWrapper
                                                      .projectBeneficiaries
                                                      ?.firstWhereOrNull(
                                                    (element) =>
                                                        element
                                                            .beneficiaryClientReferenceId ==
                                                        (RegistrationDeliverySingleton()
                                                                    .beneficiaryType ==
                                                                BeneficiaryType
                                                                    .individual
                                                            ? e
                                                                .clientReferenceId
                                                            : state
                                                                .householdMemberWrapper
                                                                .household
                                                                ?.clientReferenceId),
                                                  ),
                                                ),
                                                children: [
                                                  IndividualDetailsRoute(
                                                    isHeadOfHousehold: isHead,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          setAsHeadAction: () {
                                            ctx
                                                .read<HouseholdOverviewBloc>()
                                                .add(
                                                  HouseholdOverviewSetAsHeadEvent(
                                                    individualModel: e,
                                                    projectId:
                                                        RegistrationDeliverySingleton()
                                                            .projectId!,
                                                    householdModel: state
                                                        .householdMemberWrapper
                                                        .household!,
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
                                            showCustomPopup(
                                              context: context,
                                              builder: (BuildContext) {
                                                return Popup(
                                                    title: localizations
                                                        .translate(i18
                                                            .householdOverView
                                                            .householdOverViewActionCardTitle),
                                                    type: PopUpType.simple,
                                                    actions: [
                                                      DigitButton(
                                                          label: localizations
                                                              .translate(i18
                                                                  .householdOverView
                                                                  .householdOverViewPrimaryActionLabel),
                                                          onPressed: () {
                                                            Navigator.of(
                                                              context,
                                                              rootNavigator:
                                                                  true,
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
                                                          type: DigitButtonType
                                                              .primary,
                                                          size: DigitButtonSize
                                                              .large),
                                                      DigitButton(
                                                          label: localizations
                                                              .translate(i18
                                                                  .householdOverView
                                                                  .householdOverViewSecondaryActionLabel),
                                                          onPressed: () {
                                                            Navigator.of(
                                                              context,
                                                              rootNavigator:
                                                                  true,
                                                            ).pop();
                                                          },
                                                          type: DigitButtonType
                                                              .tertiary,
                                                          size: DigitButtonSize
                                                              .large)
                                                    ]);
                                              },
                                            );
                                          },
                                          isNotEligible:
                                              RegistrationDeliverySingleton()
                                                          .projectType
                                                          ?.cycles !=
                                                      null
                                                  ? !checkEligibilityForAgeAndSideEffect(
                                                      DigitDOBAgeConvertor(
                                                        years: ageInYears,
                                                        months: ageInMonths,
                                                      ),
                                                      RegistrationDeliverySingleton()
                                                          .projectType,
                                                      (taskData ?? [])
                                                              .isNotEmpty
                                                          ? taskData?.lastOrNull
                                                          : null,
                                                      sideEffectData,
                                                    )
                                                  : false,
                                          name: e.name?.givenName ?? ' - - ',
                                          years: (e.dateOfBirth == null
                                              ? null
                                              : DigitDateUtils.calculateAge(
                                                  DigitDateUtils
                                                          .getFormattedDateToDateTime(
                                                        e.dateOfBirth!,
                                                      ) ??
                                                      DateTime.now(),
                                                ).years),
                                          months: (e.dateOfBirth == null
                                              ? null
                                              : DigitDateUtils.calculateAge(
                                                  DigitDateUtils
                                                          .getFormattedDateToDateTime(
                                                        e.dateOfBirth!,
                                                      ) ??
                                                      DateTime.now(),
                                                ).months),
                                          gender: e.gender?.name,
                                          isBeneficiaryRefused:
                                              isBeneficiaryRefused &&
                                                  !checkStatus(
                                                    taskData,
                                                    currentCycle,
                                                  ),
                                          isBeneficiaryReferred:
                                              isBeneficiaryReferred,
                                          isDelivered: taskData == null
                                              ? false
                                              : taskData.isNotEmpty &&
                                                      !checkStatus(
                                                        taskData,
                                                        currentCycle,
                                                      )
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
                                    height: spacer2,
                                  ),
                                  Center(
                                    child: DigitButton(
                                      isDisabled: (state.householdMemberWrapper
                                                  .projectBeneficiaries ??
                                              [])
                                          .isEmpty,
                                      onPressed: () => addIndividual(
                                          context,
                                          state.householdMemberWrapper
                                              .household!,
                                          false),
                                      label: localizations.translate(
                                        i18.householdOverView
                                            .householdOverViewAddActionText,
                                      ),
                                      prefixIcon: Icons.add_circle,
                                      type: DigitButtonType.tertiary,
                                      size: DigitButtonSize.medium,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: spacer2,
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  addIndividual(
      BuildContext context, HouseholdModel household, bool isChild) async {
    final bloc = context.read<HouseholdOverviewBloc>();

    final address = household.address;

    if (address == null) return;
    bloc.add(
      HouseholdOverviewReloadEvent(
        projectId: RegistrationDeliverySingleton().projectId!,
        projectBeneficiaryType:
            RegistrationDeliverySingleton().beneficiaryType!,
      ),
    );
    await context.router.push(
      BeneficiaryRegistrationWrapperRoute(
        initialState: BeneficiaryRegistrationAddMemberState(
          addressModel: address,
          householdModel: household,
        ),
        children: [
          IndividualDetailsRoute(),
        ],
      ),
    );
  }

  bool isOutsideProjectDateRange() {
    final project = RegistrationDeliverySingleton().selectedProject;

    if (project?.startDate != null && project?.endDate != null) {
      final now = DateTime.now().millisecondsSinceEpoch;
      final startDate = project!.startDate!;
      final endDate = project.endDate!;

      return now < startDate || now > endDate;
    }

    return false;
  }

  getStatusAttributes(HouseholdOverviewState state,
      DeliverInterventionState deliverInterventionState) {
    var textLabel =
        i18.householdOverView.householdOverViewNotRegisteredIconLabel;
    var color = DigitTheme.instance.colorScheme.error;
    var icon = Icons.info_rounded;

    if ((state.householdMemberWrapper.projectBeneficiaries ?? []).isNotEmpty) {
      textLabel = state.householdMemberWrapper.tasks?.isNotEmpty ?? false
          ? getTaskStatus(state.householdMemberWrapper.tasks ?? []).toValue() ==
                  Status.administeredSuccess.toValue()
              ? '${RegistrationDeliverySingleton().selectedProject!.projectType}_${getTaskStatus(state.householdMemberWrapper.tasks ?? []).toValue()}'
              : getTaskStatus(state.householdMemberWrapper.tasks ?? [])
                  .toValue()
          : Status.registered.toValue();

      color = state.householdMemberWrapper.tasks?.isNotEmpty ?? false
          ? (state.householdMemberWrapper.tasks?.lastOrNull?.status ==
                  Status.administeredSuccess.toValue()
              ? DigitTheme.instance.colorScheme.onSurfaceVariant
              : DigitTheme.instance.colorScheme.error)
          : DigitTheme.instance.colorScheme.onSurfaceVariant;

      icon = state.householdMemberWrapper.tasks?.isNotEmpty ?? false
          ? (state.householdMemberWrapper.tasks?.lastOrNull?.status ==
                  Status.administeredSuccess.toValue()
              ? Icons.check_circle
              : Icons.info_rounded)
          : Icons.check_circle;
    } else {
      textLabel = i18.householdOverView.householdOverViewNotRegisteredIconLabel;
      color = DigitTheme.instance.colorScheme.error;
      icon = Icons.info_rounded;
    }

    return {'textLabel': textLabel, 'color': color, 'icon': icon};
  }

  void navigateToChecklist(BuildContext ctx) async {
    await context.router.push(BeneficiaryChecklistRoute());
  }
}
