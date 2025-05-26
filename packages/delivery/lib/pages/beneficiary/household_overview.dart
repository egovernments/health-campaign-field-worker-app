import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:delivery/blocs/search_households/search_households.dart';
import 'package:delivery/router/delivery_router.gm.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/digit_chip.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery/blocs/search_households/search_bloc_common_wrapper.dart';

import 'package:registration/models/entities/registration_delivery_enums.dart';

import 'package:survey_form/survey_form.dart';

import '../../blocs/household_overview/household_overview.dart';
import '/widgets/status_filter/status_filter.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';

import '../../models/entities/status.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/member_card/member_card.dart';
import '../../widgets/table_card/table_card.dart';

@RoutePage()
class HouseholdOverviewDeliveryPage extends LocalizedStatefulWidget {
  const HouseholdOverviewDeliveryPage({super.key, super.appLocalizations});

  @override
  State<HouseholdOverviewDeliveryPage> createState() =>
      _HouseholdOverviewDeliveryPageState();
}

class _HouseholdOverviewDeliveryPageState
    extends LocalizedState<HouseholdOverviewDeliveryPage> {
  final TextEditingController searchController = TextEditingController();
  int offset = 0;
  int limit = 10;

  String? householdClientReferenceId;

  List<String> selectedFilters = [];

  @override
  void initState() {
    callReloadEvent(offset: offset, limit: limit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final beneficiaryType = DeliverySingleton().beneficiaryType!;
    final textTheme = theme.digitTextTheme(context);

    return PopScope(
      onPopInvoked: (didPop) async {
        context
            .read<SearchBlocDeliveryWrapper>()
            .searchHouseholdsBloc
            .add(const SearchHouseholdsClearEvent());
        context.router.maybePop();
      },
      child: BlocBuilder<HouseholdOverviewDeliveryBloc,
          HouseholdOverviewDeliveryState>(
        builder: (ctx, state) {
          return Scaffold(
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification) {
                        final metrics = scrollNotification.metrics;
                        if (metrics.atEdge && metrics.pixels != 0) {
                          if (state.offset != null) {
                            callReloadEvent(
                                offset: state.offset ?? 0, limit: limit);
                          }
                        }
                      }
                      //Return true to allow the notification to continue to be dispatched to further ancestors.
                      return true;
                    },
                    child: ScrollableContent(
                      header: Padding(
                        padding: const EdgeInsets.only(bottom: spacer2),
                        child: BackNavigationHelpHeaderWidget(
                          handleBack: () {
                            context
                                .read<SearchHouseholdsDeliveryBloc>()
                                .add(const SearchHouseholdsEvent.clear());
                          },
                        ),
                      ),
                      enableFixedDigitButton: true,
                      footer: DigitCard(
                        margin: const EdgeInsets.only(top: spacer2),
                        children: [
                          Offstage(
                            offstage:
                                beneficiaryType == BeneficiaryType.individual ||
                                    isOutsideProjectDateRange(),
                            child: BlocBuilder<ServiceDefinitionBloc,
                                ServiceDefinitionState>(
                              builder: (context, serviceDefinitionState) =>
                                  BlocBuilder<DeliverInterventionBloc,
                                      DeliverInterventionState>(
                                builder: (ctx, deliverInterventionState) =>
                                    state.householdMemberDeliveryWrapper.tasks
                                                ?.lastOrNull?.status ==
                                            Status.administeredSuccess.toValue()
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: spacer2),
                                            child: DigitButton(
                                              label: localizations.translate(
                                                '${DeliverySingleton().selectedProject!.projectType}_${i18.memberCard.deliverDetailsUpdateLabel}',
                                              ),
                                              capitalizeLetters: false,
                                              isDisabled: state
                                                          .householdMemberDeliveryWrapper
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
                                                          .where((element) =>
                                                              element.code
                                                                  .toString()
                                                                  .contains(
                                                                      '${DeliverySingleton().selectedProject!.name}.${RegistrationDeliveryEnums.eligibility.toValue()}'))
                                                          .toList()
                                                          .isEmpty) {
                                                        context.router.push(
                                                          DeliverInterventionRoute(),
                                                        );
                                                      } else {
                                                        navigateToChecklist(
                                                            ctx,
                                                            state
                                                                .householdMemberDeliveryWrapper
                                                                .household!
                                                                .clientReferenceId);
                                                      }
                                                    });
                                                callReloadEvent(
                                                    offset: state
                                                        .householdMemberDeliveryWrapper
                                                        .members!
                                                        .length,
                                                    limit: limit);
                                              },
                                            ),
                                          )
                                        : DigitButton(
                                            label: localizations.translate(
                                              '${DeliverySingleton().selectedProject!.projectType}_${i18.householdOverView.householdOverViewActionText}',
                                            ),
                                            capitalizeLetters: false,
                                            type: DigitButtonType.primary,
                                            size: DigitButtonSize.large,
                                            mainAxisSize: MainAxisSize.max,
                                            isDisabled: (state.householdMemberDeliveryWrapper
                                                                .projectBeneficiaries ??
                                                            [])
                                                        .isEmpty ||
                                                    state
                                                            .householdMemberDeliveryWrapper
                                                            .tasks
                                                            ?.lastOrNull
                                                            ?.status ==
                                                        Status.closeHousehold
                                                            .toValue()
                                                ? true
                                                : false,
                                            onPressed: () async {
                                              final bloc = ctx.read<
                                                  HouseholdOverviewDeliveryBloc>();

                                              final projectId =
                                                  DeliverySingleton()
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
                                                        .where((element) =>
                                                            element.code
                                                                .toString()
                                                                .contains(
                                                                    '${DeliverySingleton().selectedProject?.name}.${RegistrationDeliveryEnums.iec.toValue()}') ||
                                                            element.code
                                                                .toString()
                                                                .contains(
                                                                    '${DeliverySingleton().selectedProject!.name}.${RegistrationDeliveryEnums.eligibility.toValue()}'))
                                                        .toList()
                                                        .isEmpty) {
                                                      context.router.push(
                                                        DeliverInterventionRoute(),
                                                      );
                                                    } else {
                                                      navigateToChecklist(
                                                          ctx,
                                                          DeliverySingleton()
                                                                      .beneficiaryType ==
                                                                  BeneficiaryType
                                                                      .individual
                                                              ? state
                                                                  .selectedIndividual!
                                                                  .clientReferenceId
                                                              : state
                                                                  .householdMemberDeliveryWrapper
                                                                  .household!
                                                                  .clientReferenceId);
                                                    }
                                                  });
                                              callReloadEvent(
                                                  offset: state
                                                      .householdMemberDeliveryWrapper
                                                      .members!
                                                      .length,
                                                  limit: limit);
                                            },
                                          ),
                              ),
                            ),
                          ),
                        ],
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
                                    if ((state.householdMemberDeliveryWrapper
                                                .projectBeneficiaries ??
                                            [])
                                        .isNotEmpty)
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(spacer2),
                                          child: Text(
                                            DeliverySingleton().householdType !=
                                                        null &&
                                                    DeliverySingleton()
                                                            .householdType ==
                                                        HouseholdType.community
                                                ? localizations.translate(i18
                                                    .householdOverView
                                                    .clfOverviewLabel)
                                                : localizations.translate(i18
                                                    .householdOverView
                                                    .householdOverViewLabel),
                                            style: textTheme.headingXl.copyWith(
                                                color: theme.colorTheme.primary
                                                    .primary2),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: spacer2,
                                        right: spacer2,
                                      ),
                                      child: BlocBuilder<
                                              DeliverInterventionBloc,
                                              DeliverInterventionState>(
                                          builder:
                                              (ctx, deliverInterventionState) {
                                        bool shouldShowStatus =
                                            beneficiaryType ==
                                                BeneficiaryType.household;

                                        if (DeliverySingleton().householdType ==
                                            HouseholdType.community) {
                                          return Column(
                                            children: [
                                              DigitTableCard(element: {
                                                localizations.translate(i18
                                                    .householdOverView
                                                    .instituteNameLabel): state
                                                        .householdMemberDeliveryWrapper
                                                        .household
                                                        ?.address
                                                        ?.buildingName ??
                                                    localizations.translate(i18
                                                        .common.coreCommonNA),
                                                localizations.translate(
                                                  i18.deliverIntervention
                                                      .memberCountText,
                                                ): state
                                                    .householdMemberDeliveryWrapper
                                                    .household
                                                    ?.memberCount,
                                                localizations.translate(
                                                  i18.householdLocation
                                                      .administrationAreaFormLabel,
                                                ): localizations.translate(state
                                                        .householdMemberDeliveryWrapper
                                                        .headOfHousehold
                                                        ?.address
                                                        ?.first
                                                        .locality
                                                        ?.code ??
                                                    i18.common.coreCommonNA),
                                              }),
                                            ],
                                          );
                                        }

                                        return Column(
                                          children: [
                                            DigitTableCard(
                                              element: {
                                                localizations.translate(i18
                                                    .householdOverView
                                                    .householdOverViewHouseholdHeadNameLabel): state
                                                        .householdMemberDeliveryWrapper
                                                        .headOfHousehold
                                                        ?.name
                                                        ?.givenName ??
                                                    localizations.translate(i18
                                                        .common.coreCommonNA),
                                                localizations.translate(
                                                  i18.householdLocation
                                                      .administrationAreaFormLabel,
                                                ): localizations.translate(state
                                                        .householdMemberDeliveryWrapper
                                                        .headOfHousehold
                                                        ?.address
                                                        ?.first
                                                        .locality
                                                        ?.code ??
                                                    i18.common.coreCommonNA),
                                                localizations.translate(
                                                  i18.deliverIntervention
                                                      .memberCountText,
                                                ): state
                                                    .householdMemberDeliveryWrapper
                                                    .household
                                                    ?.memberCount,
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
                                    if (DeliverySingleton().householdType ==
                                        HouseholdType.community) ...[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: spacer2, bottom: spacer2),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: DigitSearchBar(
                                                controller: searchController,
                                                hintText:
                                                    localizations.translate(
                                                  i18.common.searchByName,
                                                ),
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                onChanged: (value) {
                                                  if (value.length >= 3) {
                                                    callReloadEvent(
                                                        offset: 0, limit: 10);
                                                  } else if (searchController
                                                      .value.text.isEmpty) {
                                                    callReloadEvent(
                                                        offset: 0, limit: 10);
                                                  }
                                                },
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                getFilters()
                                                    ? Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(spacer2),
                                                          child: DigitButton(
                                                            label:
                                                                getFilterIconNLabel()[
                                                                    'label'],
                                                            size:
                                                                DigitButtonSize
                                                                    .medium,
                                                            type:
                                                                DigitButtonType
                                                                    .tertiary,
                                                            suffixIcon:
                                                                getFilterIconNLabel()[
                                                                    'icon'],
                                                            onPressed: () =>
                                                                showFilterDialog(),
                                                          ),
                                                        ),
                                                      )
                                                    : const Offstage(),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                    selectedFilters.isNotEmpty
                                        ? Align(
                                            alignment: Alignment.topLeft,
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      selectedFilters.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              spacer1),
                                                      child: DigitChip(
                                                        label:
                                                            '${localizations.translate(getStatus(selectedFilters[index]))}'
                                                            ' (${state.householdMemberDeliveryWrapper.members!.length})',
                                                        onItemDelete: () {
                                                          selectedFilters.remove(
                                                              selectedFilters[
                                                                  index]);
                                                          callReloadEvent(
                                                              offset: 0,
                                                              limit: 10);
                                                        },
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          )
                                        : const Offstage(),
                                    Column(
                                      children:
                                          (state.householdMemberDeliveryWrapper
                                                      .members ??
                                                  [])
                                              .map(
                                        (e) {
                                          final isHead = state
                                                  .householdMemberDeliveryWrapper
                                                  .headOfHousehold
                                                  ?.clientReferenceId ==
                                              e.clientReferenceId;
                                          final projectBeneficiaryId = state
                                              .householdMemberDeliveryWrapper
                                              .projectBeneficiaries
                                              ?.firstWhereOrNull((b) =>
                                                  b.beneficiaryClientReferenceId ==
                                                  e.clientReferenceId)
                                              ?.clientReferenceId;

                                          final projectBeneficiary = state
                                              .householdMemberDeliveryWrapper
                                              .projectBeneficiaries
                                              ?.where(
                                                (element) =>
                                                    element
                                                        .beneficiaryClientReferenceId ==
                                                    (DeliverySingleton()
                                                                .beneficiaryType ==
                                                            BeneficiaryType
                                                                .individual
                                                        ? e.clientReferenceId
                                                        : state
                                                            .householdMemberDeliveryWrapper
                                                            .household
                                                            ?.clientReferenceId),
                                              )
                                              .toList();

                                          final taskData = (projectBeneficiary ??
                                                      [])
                                                  .isNotEmpty
                                              ? state
                                                  .householdMemberDeliveryWrapper
                                                  .tasks
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
                                              ? state
                                                  .householdMemberDeliveryWrapper
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
                                              ? state
                                                  .householdMemberDeliveryWrapper
                                                  .sideEffects
                                                  ?.where((element) =>
                                                      element
                                                          .taskClientReferenceId ==
                                                      taskData.lastOrNull
                                                          ?.clientReferenceId)
                                                  .toList()
                                              : null;
                                          final ageInYears =
                                              e.dateOfBirth != null
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
                                              DeliverySingleton()
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
                                            projectBeneficiaries:
                                                projectBeneficiary ?? [],
                                            tasks: taskData,
                                            sideEffects: sideEffectData,
                                            setAsHeadAction: () {
                                              ctx
                                                  .read<
                                                      HouseholdOverviewDeliveryBloc>()
                                                  .add(
                                                    HouseholdOverviewSetAsHeadEvent(
                                                      individualModel: e,
                                                      projectId:
                                                          DeliverySingleton()
                                                              .projectId!,
                                                      householdModel: state
                                                          .householdMemberDeliveryWrapper
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
                                            isNotEligible: DeliverySingleton()
                                                        .projectType
                                                        ?.cycles !=
                                                    null
                                                ? !checkEligibilityForAgeAndSideEffect(
                                                    DigitDOBAgeConvertor(
                                                      years: ageInYears,
                                                      months: ageInMonths,
                                                    ),
                                                    DeliverySingleton()
                                                        .projectType,
                                                    (taskData ?? []).isNotEmpty
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
                                  ],
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  bool isOutsideProjectDateRange() {
    final project = DeliverySingleton().selectedProject;

    if (project?.startDate != null && project?.endDate != null) {
      final now = DateTime.now().millisecondsSinceEpoch;
      final startDate = project!.startDate!;
      final endDate = project.endDate!;

      return now < startDate || now > endDate;
    }

    return false;
  }

  getStatusAttributes(HouseholdOverviewDeliveryState state,
      DeliverInterventionState deliverInterventionState) {
    var textLabel =
        i18.householdOverView.householdOverViewNotRegisteredIconLabel;
    var color = DigitTheme.instance.colorScheme.error;
    var icon = Icons.info_rounded;

    if ((state.householdMemberDeliveryWrapper.projectBeneficiaries ?? [])
        .isNotEmpty) {
      textLabel = state.householdMemberDeliveryWrapper.tasks?.isNotEmpty ??
              false
          ? getTaskStatus(state.householdMemberDeliveryWrapper.tasks ?? [])
                      .toValue() ==
                  Status.administeredSuccess.toValue()
              ? '${DeliverySingleton().selectedProject!.projectType}_${getTaskStatus(state.householdMemberDeliveryWrapper.tasks ?? []).toValue()}'
              : getTaskStatus(state.householdMemberDeliveryWrapper.tasks ?? [])
                  .toValue()
          : Status.registered.toValue();

      color = state.householdMemberDeliveryWrapper.tasks?.isNotEmpty ?? false
          ? (state.householdMemberDeliveryWrapper.tasks?.lastOrNull?.status ==
                  Status.administeredSuccess.toValue()
              ? DigitTheme.instance.colorScheme.onSurfaceVariant
              : DigitTheme.instance.colorScheme.error)
          : DigitTheme.instance.colorScheme.onSurfaceVariant;

      icon = state.householdMemberDeliveryWrapper.tasks?.isNotEmpty ?? false
          ? (state.householdMemberDeliveryWrapper.tasks?.lastOrNull?.status ==
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

  void navigateToChecklist(
      BuildContext ctx, String beneficiaryClientRefId) async {
    await context.router.push(BeneficiaryChecklistRoute(
        beneficiaryClientRefId: beneficiaryClientRefId));
  }

  void callReloadEvent({
    required int offset,
    required int limit,
  }) {
    if (mounted) {
      final bloc = context.read<HouseholdOverviewDeliveryBloc>();

      bloc.add(
        HouseholdOverviewReloadEvent(
          projectId: DeliverySingleton().projectId!,
          projectBeneficiaryType: DeliverySingleton().beneficiaryType!,
          offset: offset,
          limit: limit,
          searchByName: searchController.text.trim().length > 2
              ? searchController.text.trim()
              : null,
          selectedFilter: selectedFilters,
        ),
      );
    }
  }

  getFilterIconNLabel() {
    return {
      'label': localizations.translate(
        i18.searchBeneficiary.filterLabel,
      ),
      'icon': Icons.filter_alt
    };
  }

  showFilterDialog() async {
    var filters = await showDialog(
        context: context,
        builder: (ctx) => Popup(
                title: getFilterIconNLabel()['label'],
                titleIcon: Icon(
                  getFilterIconNLabel()['icon'],
                  color: DigitTheme.instance.colorScheme.primary,
                ),
                onCrossTap: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pop();
                },
                additionalWidgets: [
                  StatusFilter(
                    selectedFilters: selectedFilters,
                  ),
                ]));

    if (filters != null && filters.isNotEmpty) {
      selectedFilters.clear();
      selectedFilters.addAll(filters);
      callReloadEvent(offset: 0, limit: 10);
    } else {
      setState(() {
        selectedFilters = [];
      });

      callReloadEvent(offset: 0, limit: 10);
    }
  }

  String getStatus(String selectedFilter) {
    final statusMap = {
      Status.delivered.toValue(): Status.delivered,
      Status.notAdministered.toValue(): Status.notAdministered,
      Status.visited.toValue(): Status.visited,
      Status.notVisited.toValue(): Status.notVisited,
      Status.beneficiaryRefused.toValue(): Status.beneficiaryRefused,
      Status.beneficiaryReferred.toValue(): Status.beneficiaryReferred,
      Status.administeredSuccess.toValue(): Status.administeredSuccess,
      Status.administeredFailed.toValue(): Status.administeredFailed,
      Status.inComplete.toValue(): Status.inComplete,
      Status.toAdminister.toValue(): Status.toAdminister,
      Status.closeHousehold.toValue(): Status.closeHousehold,
      Status.registered.toValue(): Status.registered,
      Status.notRegistered.toValue(): Status.notRegistered,
    };

    var mappedStatus = statusMap.entries
        .where((element) => element.value.name == selectedFilter)
        .first
        .key;
    if (mappedStatus != null) {
      return mappedStatus;
    } else {
      return selectedFilter;
    }
  }

  getFilters() {
    bool hasFilters;
    if (DeliverySingleton().householdType == HouseholdType.community) {
      hasFilters = DeliverySingleton().searchCLFFilters != null &&
          DeliverySingleton().searchCLFFilters!.isNotEmpty;
    } else {
      hasFilters = DeliverySingleton().searchHouseHoldFilter != null &&
          DeliverySingleton().searchHouseHoldFilter!.isNotEmpty;
    }
    return hasFilters;
  }
}
