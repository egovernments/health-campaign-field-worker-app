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
import 'package:registration_delivery/blocs/registration_wrapper/registration_wrapper_bloc.dart';
import 'package:registration_delivery/widgets/member_card/member_card.dart';

import '../../models/entities/household.dart';
import '../../models/entities/status.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

@RoutePage()
class ParentOverviewPage extends LocalizedStatefulWidget {
  const ParentOverviewPage({super.key, super.appLocalizations});

  @override
  State<ParentOverviewPage> createState() => _ParentOverviewPageState();
}

class _ParentOverviewPageState extends LocalizedState<ParentOverviewPage> {
  @override
  void initState() {
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
      child: BlocBuilder<RegistrationWrapperBloc, RegistrationWrapperState>(
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
                                  if ((state.householdMembers.first
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

                                          /// TODO: need to rewrite logic for parent card
                                        },
                                        label: localizations.translate(
                                          i18.memberCard.editIndividualDetails,
                                        ),
                                        type: DigitButtonType.tertiary,
                                        size: DigitButtonSize.medium,
                                        prefixIcon: Icons.edit,
                                      ),
                                    ),
                                  Column(
                                    children: (state.householdMembers.first
                                                .individuals
                                                ?.where((m) {
                                              final parentBeneficiary = (state
                                                          .householdMembers
                                                          .firstOrNull
                                                          ?.members ??
                                                      [])
                                                  .where((element) =>
                                                      element
                                                          .individualClientReferenceId ==
                                                      state.selectedIndividual
                                                          ?.clientReferenceId)
                                                  .firstOrNull;
                                              // Check if any other member has this member as parent
                                              final hasChild = state
                                                  .householdMembers
                                                  .first
                                                  .members
                                                  ?.any((member) =>
                                                      member.individualClientReferenceId ==
                                                          m.clientReferenceId &&
                                                      (member.memberRelationships
                                                              ?.any(
                                                            (relation) =>
                                                                relation
                                                                    .relativeClientReferenceId ==
                                                                parentBeneficiary
                                                                    ?.clientReferenceId,
                                                          ) ??
                                                          false));
                                              return (hasChild ?? false);
                                            }) ??
                                            [])
                                        .map(
                                      (e) {
                                        final isHead = state
                                                .householdMembers
                                                .first
                                                .headOfHousehold
                                                ?.clientReferenceId ==
                                            e.clientReferenceId;
                                        final household = state
                                            .householdMembers.first.household;
                                        final projectBeneficiaryId = state
                                            .householdMembers
                                            .first
                                            .projectBeneficiaries
                                            ?.firstWhereOrNull((b) =>
                                                b.beneficiaryClientReferenceId ==
                                                e.clientReferenceId)
                                            ?.clientReferenceId;

                                        final projectBeneficiary = state
                                            .householdMembers
                                            .first
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
                                                          .householdMembers
                                                          .first
                                                          .household
                                                          ?.clientReferenceId)),
                                            )
                                            .toList();

                                        final taskData = (projectBeneficiary ??
                                                    [])
                                                .isNotEmpty
                                            ? state.householdMembers.first.tasks
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
                                            ? state.householdMembers.first
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
                                            ? state.householdMembers.first
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
                                          individual: e,
                                          projectBeneficiaries:
                                              projectBeneficiary,
                                          projectBeneficiaryClientReferenceId:
                                              projectBeneficiaryId,
                                          // individualChecklist: individualChecklist,
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
                                                          ? taskData?.lastOrNull
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
                                            /// TODO: need to first write the logic for adding a child
                                          },
                                          deleteMemberAction: () {
                                            showCustomPopup(
                                              context: context,
                                              builder: (BuildContext context) {
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
                                                            /// need to check the logic for deletion and where it should navigate
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
                                          setAsHeadAction: null,
                                          showAddChildAction: false,
                                        );
                                      },
                                    ).toList(),
                                  ),
                                  const SizedBox(
                                    height: spacer2,
                                  ),
                                  Center(
                                    child: DigitButton(
                                      isDisabled: (state.householdMembers.first
                                                  .projectBeneficiaries ??
                                              [])
                                          .isEmpty,
                                      onPressed: () => addIndividual(
                                          context,
                                          state.householdMembers.first
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
    /// need to rewrite the logic for adding a child
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

  getStatusAttributes(RegistrationWrapperState state) {
    var textLabel =
        i18.householdOverView.householdOverViewNotRegisteredIconLabel;
    var color = DigitTheme.instance.colorScheme.error;
    var icon = Icons.info_rounded;

    if ((state.householdMembers.firstOrNull?.projectBeneficiaries ?? [])
        .isNotEmpty) {
      textLabel = state.householdMembers.firstOrNull?.tasks?.isNotEmpty ?? false
          ? getTaskStatus(state.householdMembers.firstOrNull?.tasks ?? [])
                      .toValue() ==
                  Status.administeredSuccess.toValue()
              ? '${RegistrationDeliverySingleton().selectedProject!.projectType}_${getTaskStatus(state.householdMembers.firstOrNull?.tasks ?? []).toValue()}'
              : getTaskStatus(state.householdMembers.firstOrNull?.tasks ?? [])
                  .toValue()
          : Status.registered.toValue();

      color = state.householdMembers.firstOrNull?.tasks?.isNotEmpty ?? false
          ? (state.householdMembers.firstOrNull?.tasks?.lastOrNull?.status ==
                  Status.administeredSuccess.toValue()
              ? DigitTheme.instance.colorScheme.onSurfaceVariant
              : DigitTheme.instance.colorScheme.error)
          : DigitTheme.instance.colorScheme.onSurfaceVariant;

      icon = state.householdMembers.firstOrNull?.tasks?.isNotEmpty ?? false
          ? (state.householdMembers.firstOrNull?.tasks?.lastOrNull?.status ==
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
    /// TODO: need to handle navigation for eligibility checklist
    // await context.router.push(BeneficiaryChecklistRoute());
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
