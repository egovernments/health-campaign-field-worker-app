import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/blocs/parent_overview/parent_overview.dart';
import 'package:registration_delivery/utils/constants.dart';
import 'package:registration_delivery/widgets/member_card/member_card.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/search_households/search_households.dart';
import '../../models/entities/household.dart';
import '../../models/entities/status.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/table_card/table_card.dart';

@RoutePage()
class ParentOverviewPage extends LocalizedStatefulWidget {
  const ParentOverviewPage({super.key, super.appLocalizations});

  @override
  State<ParentOverviewPage> createState() => _ParentOverviewPageState();
}

class _ParentOverviewPageState extends LocalizedState<ParentOverviewPage> {
  @override
  void initState() {
    final bloc = context.read<ParentOverviewBloc>();
    bloc.add(
      ParentOverviewReloadEvent(
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
        context.router.maybePop();
      },
      child: BlocBuilder<ParentOverviewBloc, ParentOverviewState>(
        builder: (ctx, state) {
          return Scaffold(
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : ScrollableContent(
                    header: const BackNavigationHelpHeaderWidget(),
                    footer: const Offstage(),
                    enableFixedDigitButton: true,
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
                                        onPressed: () async {
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

                                          final address = state
                                              .householdMemberWrapper
                                              .household
                                              ?.address;
                                          if (address == null) {
                                            return;
                                          }
                                          bloc.add(
                                            HouseholdOverviewReloadEvent(
                                              projectId: projectId,
                                              projectBeneficiaryType:
                                                  RegistrationDeliverySingleton()
                                                          .beneficiaryType ??
                                                      BeneficiaryType.household,
                                            ),
                                          );

                                          await context.router.root.push(
                                            BeneficiaryRegistrationWrapperRoute(
                                              initialState:
                                                  BeneficiaryRegistrationEditIndividualState(
                                                individualModel:
                                                    state.selectedIndividual!,
                                                householdModel: state
                                                    .householdMemberWrapper
                                                    .household!,
                                                addressModel: address,
                                                projectBeneficiaryModel: state
                                                    .householdMemberWrapper
                                                    .projectBeneficiaries
                                                    ?.where((e) =>
                                                        e.beneficiaryClientReferenceId ==
                                                        state.selectedIndividual
                                                            ?.clientReferenceId)
                                                    .firstOrNull,
                                                    individualChecklists:state
                                                        .householdMemberWrapper
                                                        .individualChecklists!
                                                        .where((e) =>
                                                    e.referenceId ==
                                                        state
                                                            .selectedIndividual
                                                            ?.clientReferenceId)
                                                        .toList(),
                                              ),
                                              children: [
                                                IndividualDetailsRoute(),
                                              ],
                                            ),
                                          );
                                        },
                                        label: localizations.translate(
                                          i18.memberCard.editIndividualDetails,
                                        ),
                                        type: DigitButtonType.tertiary,
                                        size: DigitButtonSize.medium,
                                        prefixIcon: Icons.edit,
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
                                                  .individualDetails
                                                  .nameLabelText): state
                                                      .selectedIndividual
                                                      ?.name
                                                      ?.givenName ??
                                                  localizations.translate(
                                                      i18.common.coreCommonNA),
                                              localizations.translate(
                                                i18.householdOverView
                                                    .householdOverViewAge,
                                              ): getAge(
                                                  state.selectedIndividual!),
                                              localizations.translate(
                                                i18.individualDetails
                                                    .genderLabelText,
                                              ): localizations.translate(state
                                                  .selectedIndividual?.gender
                                                  ?.toValue()),
                                              if (state.householdMemberWrapper
                                                      .individualChecklists
                                                      ?.where((e) =>
                                                          e.referenceId ==
                                                          state
                                                              .selectedIndividual
                                                              ?.clientReferenceId)
                                                      .isNotEmpty ??
                                                  false)
                                                for (var attribute in state
                                                        .householdMemberWrapper
                                                        .individualChecklists!
                                                        .where((e) =>
                                                            e.referenceId ==
                                                            state
                                                                .selectedIndividual
                                                                ?.clientReferenceId)
                                                        .first
                                                        .attributes ??
                                                    [])
                                                  localizations.translate(
                                                          '${RegistrationDeliverySingleton().selectedProject?.name}.INDIVIDUAL.DISTRIBUTOR.${attribute?.attributeCode}' //TODO:
                                                          ):
                                                      localizations
                                                          .translate(attribute?.value)
                                            },
                                          ),
                                        ],
                                      );
                                    }),
                                  ),

                                  Column(
                                    children: (state.householdMemberWrapper.members
                                        ?.where((m) {

                                      final parentBeneficiary = state.householdMemberWrapper.householdMembers?.where((element) => element.individualClientReferenceId == state.selectedIndividual?.clientReferenceId).firstOrNull;
                                      // Check if any other member has this member as parent
                                      final hasChild = state.householdMemberWrapper.householdMembers
                                          ?.any((member) =>
                                      member.individualClientReferenceId == m.clientReferenceId &&
                                          (member.memberRelationships?.any(
                                                (relation) =>
                                            relation.relativeClientReferenceId ==
                                                parentBeneficiary?.clientReferenceId,
                                          ) ??
                                              false));
                                      return (hasChild ?? false);
                                    }) ??
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

                                        final individualChecklist = state.householdMemberWrapper.individualChecklists?.firstWhereOrNull((element) => element.referenceId == e.clientReferenceId);
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
                                          individual: e,
                                          projectBeneficiaries:projectBeneficiary,
                                          projectBeneficiaryClientReferenceId:projectBeneficiaryId,
                                          individualChecklist: individualChecklist,
                                          name: e.name?.givenName ?? ' - - ',
                                          localizations: localizations,
                                          years: (e.dateOfBirth == null
                                              ? null
                                              : DigitDateUtils.calculateAge(
                                            DigitDateUtils
                                                .getFormattedDateToDateTime(
                                              e.dateOfBirth!,
                                            ) ??
                                                DateTime.now(),
                                          ).years),
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
                                                ? taskData
                                                ?.lastOrNull
                                                : null,
                                            sideEffectData,
                                          )
                                              : false,
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
                                          editMemberAction: () async {
                                            final bloc = context.read<HouseholdOverviewBloc>();

                                            final parentClientReferenceId = bloc
                                                .state.householdMemberWrapper.householdMembers
                                                ?.where((e) =>
                                            e.individualClientReferenceId ==
                                                state.selectedIndividual?.clientReferenceId)
                                                .firstOrNull
                                                ?.clientReferenceId;

                                            Navigator.of(
                                              context,
                                              rootNavigator: true,
                                            ).pop();

                                            final address = household?.address;
                                            if (address == null) {
                                              return;
                                            }

                                            final projectId = RegistrationDeliverySingleton().projectId!;
                                            bloc.add(
                                              HouseholdOverviewReloadEvent(
                                                projectId: projectId,
                                                projectBeneficiaryType:
                                                RegistrationDeliverySingleton().beneficiaryType ??
                                                    BeneficiaryType.household,
                                              ),
                                            );

                                            await context.router.root.push(
                                              BeneficiaryRegistrationWrapperRoute(
                                                initialState: BeneficiaryRegistrationEditIndividualState(
                                                  individualModel: e,
                                                  householdModel: household!,
                                                  addressModel: address,
                                                  projectBeneficiaryModel: projectBeneficiary?.first,
                                                  individualChecklists: individualChecklist!=null ? [individualChecklist] : null,
                                                ),
                                                children: [
                                                  IndividualDetailsRoute( parentClientReferenceId: parentClientReferenceId),
                                                ],
                                              ),
                                            );
                                          },
                                          deleteMemberAction: () {
                                            final bloc = context.read<HouseholdOverviewBloc>();
                                            showCustomPopup(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Popup(
                                                    title: localizations.translate(i18.householdOverView
                                                        .householdOverViewActionCardTitle),
                                                    type: PopUpType.simple,
                                                    actions: [
                                                      DigitButton(
                                                          label: localizations.translate(i18
                                                              .householdOverView
                                                              .householdOverViewPrimaryActionLabel),
                                                          onPressed: () {
                                                            Navigator.of(
                                                              context,
                                                              rootNavigator: true,
                                                            )
                                                              ..pop()
                                                              ..pop();
                                                            bloc.add(
                                                              HouseholdOverviewEvent.selectedIndividual(
                                                                individualModel: e,
                                                              ),
                                                            );
                                                            context.router.push(
                                                              ReasonForDeletionRoute(
                                                                isHousholdDelete: false,
                                                              ),
                                                            );
                                                          },
                                                          type: DigitButtonType.primary,
                                                          size: DigitButtonSize.large),
                                                      DigitButton(
                                                          label: localizations.translate(i18
                                                              .householdOverView
                                                              .householdOverViewSecondaryActionLabel),
                                                          onPressed: () {
                                                            Navigator.of(
                                                              context,
                                                              rootNavigator: true,
                                                            ).pop();
                                                          },
                                                          type: DigitButtonType.tertiary,
                                                          size: DigitButtonSize.large)
                                                    ]);
                                              },
                                            );
                                          }, setAsHeadAction: null, showAddChildAction: false,
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
                                          false,
                                          state.selectedIndividual!),
                                      label: localizations.translate(
                                        i18.memberCard.addChildLabel,
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

  addIndividual(BuildContext context, HouseholdModel household, bool isChild,
      IndividualModel individual) async {
    if (household != null) {
      final bloc = context.read<HouseholdOverviewBloc>();

      final address = household?.address;

      if (address == null) return;
      bloc.add(
        HouseholdOverviewReloadEvent(
          projectId: RegistrationDeliverySingleton().projectId!,
          projectBeneficiaryType:
              RegistrationDeliverySingleton().beneficiaryType!,
        ),
      );
      final parentClientReferenceId = bloc
          .state.householdMemberWrapper.householdMembers
          ?.where((e) =>
      e.individualClientReferenceId ==
          individual.clientReferenceId)
          .firstOrNull
          ?.clientReferenceId;

      await context.router.root.push(
        BeneficiaryRegistrationWrapperRoute(
          initialState: BeneficiaryRegistrationAddMemberState(
            addressModel: address,
            householdModel: household,
            parentClientReferenceId: parentClientReferenceId
          ),
          children: [
            IndividualDetailsRoute(
                parentClientReferenceId: parentClientReferenceId),
          ],
        ),
      );
    }
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

  getAge(IndividualModel e) {
    final ageInYears = e.dateOfBirth != null
        ? DigitDateUtils.calculateAge(
            DigitDateUtils.getFormattedDateToDateTime(
                  e.dateOfBirth!,
                ) ??
                DateTime.now(),
          ).years
        : 0;
    final ageInMonths = e.dateOfBirth != null
        ? DigitDateUtils.calculateAge(
            DigitDateUtils.getFormattedDateToDateTime(
                  e.dateOfBirth!,
                ) ??
                DateTime.now(),
          ).months
        : 0;

    final age = ageInMonths != null
        ? "$ageInYears ${localizations.translate(i18.memberCard.deliverDetailsYearText)} $ageInMonths ${localizations.translate(i18.memberCard.deliverDetailsMonthsText)}"
        : "|   --";

    return age;
  }
}
