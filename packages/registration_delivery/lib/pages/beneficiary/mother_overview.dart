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
import 'package:registration_delivery/utils/constants.dart';

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
import '../../widgets/member_card/child_card.dart';
import '../../widgets/table_card/table_card.dart';

@RoutePage()
class MotherOverviewPage extends LocalizedStatefulWidget {
  const MotherOverviewPage({super.key, super.appLocalizations});

  @override
  State<MotherOverviewPage> createState() => _HouseholdOverviewPageState();
}

class _HouseholdOverviewPageState extends LocalizedState<MotherOverviewPage> {
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
                    footer: Offstage(),
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
                                                i18.householdOverView.ageText,
                                              ): getAge(
                                                  state.selectedIndividual!),
                                              localizations.translate(
                                                i18.individualDetails
                                                    .genderLabelText,
                                              ): localizations.translate(state
                                                  .selectedIndividual?.gender
                                                  ?.toValue()),
                                              if (state
                                                      .selectedIndividual
                                                      ?.additionalFields
                                                      ?.fields !=
                                                  null)
                                                ...Map.fromEntries(
                                                  state.selectedIndividual!
                                                      .additionalFields!.fields
                                                      .map((field) => MapEntry(
                                                            localizations.translate(
                                                                toUpperCaseWithUnderscores(
                                                                    field.key)),
                                                            field.value
                                                                .toString(),
                                                          )),
                                                ),
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
                                                      ?.firstWhereOrNull((beneficiary) => (beneficiary
                                                              .beneficiaryClientReferenceId ==
                                                          (beneficiaryType ==
                                                                  BeneficiaryType
                                                                      .individual
                                                              ? ind
                                                                  .clientReferenceId
                                                              : state
                                                                  .householdMemberWrapper
                                                                  .household
                                                                  ?.clientReferenceId))),
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

                                        return buildListOfChildren(
                                            context,
                                            childrenBeneficiaries ?? [],
                                            state.selectedIndividual,
                                            household);
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

  Widget buildListOfChildren(
      BuildContext context,
      List<ChildrenBeneficiaries> childrenBeneficiaries,
      individual,
      household) {
    List<Widget> filteredChildren = (childrenBeneficiaries ?? [])
        .where((c) => c.individual != null)
        .map((c) => ChildCard(
              individual: c.individual!,
              projectBeneficiaries:
                  c.projectBeneficiary != null ? [c.projectBeneficiary!] : null,
              projectBeneficiaryClientReferenceId:
                  c.projectBeneficiary?.clientReferenceId,
              name: c.individual!.name!.givenName!,
              localizations: localizations,
              gender: c.individual?.gender?.toValue(),
              years: c.individual?.dateOfBirth != null
                  ? DigitDateUtils.calculateAge(
                      DigitDateUtils.getFormattedDateToDateTime(
                            c.individual!.dateOfBirth!,
                          ) ??
                          DateTime.now(),
                    ).years
                  : 0,
              months: c.individual?.dateOfBirth != null
                  ? DigitDateUtils.calculateAge(
                      DigitDateUtils.getFormattedDateToDateTime(
                            c.individual!.dateOfBirth!,
                          ) ??
                          DateTime.now(),
                    ).months
                  : 0,
              isDelivered: false,
              editMemberAction: () async {
                final bloc = context.read<HouseholdOverviewBloc>();

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
                      individualModel: c.individual!,
                      householdModel: c.household!,
                      addressModel: address,
                      projectBeneficiaryModel: c.projectBeneficiary,
                    ),
                    children: [
                      IndividualDetailsRoute(
                          isChild: true,
                          parentClientReferenceId:
                              individual.clientReferenceId),
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
                                    individualModel: c.individual!,
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
              },
            ))
        .toList();

    return Column(
      children: filteredChildren,
    );
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
