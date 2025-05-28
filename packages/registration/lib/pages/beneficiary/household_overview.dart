import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_action_card.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/digit_chip.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/beneficiary_registration/beneficiary_registration.dart';
import 'package:registration/blocs/household_overview/household_overview.dart';
import 'package:registration/blocs/search_households/search_bloc_common_wrapper.dart';
import 'package:registration/blocs/search_households/search_households.dart';
import 'package:registration/models/entities/household.dart';
import 'package:registration/models/entities/status.dart';
import 'package:registration/router/registration_router.gm.dart';
import 'package:registration/widgets/member_card/member_card.dart';
import 'package:registration/widgets/status_filter/status_filter.dart';
import 'package:registration/utils/i18_key_constants.dart' as i18;
import 'package:registration/widgets/table_card/table_card.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

@RoutePage()
class HouseholdOverviewPage extends LocalizedStatefulWidget {
  const HouseholdOverviewPage({super.key, super.appLocalizations});

  @override
  State<HouseholdOverviewPage> createState() => _HouseholdOverviewPageState();
}

class _HouseholdOverviewPageState
    extends LocalizedState<HouseholdOverviewPage> {
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
    final beneficiaryType = RegistrationSingleton().beneficiaryType!;
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
                                .read<SearchHouseholdsBloc>()
                                .add(const SearchHouseholdsEvent.clear());
                          },
                        ),
                      ),
                      enableFixedDigitButton: true,
                      footer: const DigitCard(
                        margin: EdgeInsets.only(top: spacer2),
                        children: [],
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
                                                RegistrationSingleton()
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
                                                    capitalizeLetters: false,
                                                    prefixIcon: Icons.edit,
                                                    label: (RegistrationSingleton()
                                                                .householdType ==
                                                            HouseholdType
                                                                .community)
                                                        ? localizations.translate(i18
                                                            .householdOverView
                                                            .clfOverViewEditLabel)
                                                        : localizations
                                                            .translate(
                                                            i18.householdOverView
                                                                .householdOverViewEditLabel,
                                                          ),
                                                    type: DigitButtonType
                                                        .secondary,
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

                                                      if (address == null)
                                                        return;

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
                                                            addressModel:
                                                                address,
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
                                                      callReloadEvent(
                                                          offset: 0, limit: 10);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          label: (RegistrationSingleton()
                                                      .householdType ==
                                                  HouseholdType.community)
                                              ? localizations.translate(i18
                                                  .householdOverView
                                                  .clfOverViewEditIconText)
                                              : localizations.translate(
                                                  i18.householdOverView
                                                      .householdOverViewEditIconText,
                                                ),
                                          type: DigitButtonType.tertiary,
                                          size: DigitButtonSize.medium,
                                          prefixIcon: Icons.edit,
                                          capitalizeLetters: false,
                                        ),
                                      ),

                                    ///Old UI Format
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
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(spacer2),
                                        child: Text(
                                          RegistrationSingleton()
                                                          .householdType !=
                                                      null &&
                                                  RegistrationSingleton()
                                                          .householdType ==
                                                      HouseholdType.community
                                              ? localizations.translate(i18
                                                  .householdOverView
                                                  .clfOverviewLabel)
                                              : localizations.translate(i18
                                                  .householdOverView
                                                  .householdOverViewLabel),
                                          style: textTheme.headingXl.copyWith(
                                              color: theme
                                                  .colorTheme.primary.primary2),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: spacer2,
                                        right: spacer2,
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          bool shouldShowStatus =
                                              beneficiaryType ==
                                                  BeneficiaryType.household;

                                          if (RegistrationSingleton()
                                                  .householdType ==
                                              HouseholdType.community) {
                                            return Column(
                                              children: [
                                                DigitTableCard(element: {
                                                  localizations.translate(i18
                                                      .householdOverView
                                                      .instituteNameLabel): state
                                                          .householdMemberWrapper
                                                          .household
                                                          ?.address
                                                          ?.buildingName ??
                                                      localizations.translate(
                                                          i18.common
                                                              .coreCommonNA),
                                                  localizations.translate(i18
                                                          .deliverIntervention
                                                          .memberCountText):
                                                      state
                                                          .householdMemberWrapper
                                                          .household
                                                          ?.memberCount,
                                                  localizations.translate(i18
                                                          .householdLocation
                                                          .administrationAreaFormLabel):
                                                      localizations.translate(
                                                    state
                                                            .householdMemberWrapper
                                                            .headOfHousehold
                                                            ?.address
                                                            ?.first
                                                            .locality
                                                            ?.code ??
                                                        i18.common.coreCommonNA,
                                                  ),
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
                                                          .householdMemberWrapper
                                                          .headOfHousehold
                                                          ?.name
                                                          ?.givenName ??
                                                      localizations.translate(
                                                          i18.common
                                                              .coreCommonNA),
                                                  localizations.translate(i18
                                                          .householdLocation
                                                          .administrationAreaFormLabel):
                                                      localizations.translate(
                                                    state
                                                            .householdMemberWrapper
                                                            .headOfHousehold
                                                            ?.address
                                                            ?.first
                                                            .locality
                                                            ?.code ??
                                                        i18.common.coreCommonNA,
                                                  ),
                                                  localizations.translate(i18
                                                          .deliverIntervention
                                                          .memberCountText):
                                                      state
                                                          .householdMemberWrapper
                                                          .household
                                                          ?.memberCount,
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),

                                    if (RegistrationSingleton().householdType ==
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
                                                            ' (${state.householdMemberWrapper.members!.length})',
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
                                      children: (state.householdMemberWrapper
                                                  .members ??
                                              [])
                                          .map(
                                        (e) {
                                          final isHead = state
                                                  .householdMemberWrapper
                                                  .headOfHousehold
                                                  ?.clientReferenceId ==
                                              e.clientReferenceId;
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
                                                (element) =>
                                                    element
                                                        .beneficiaryClientReferenceId ==
                                                    (RegistrationSingleton()
                                                                .beneficiaryType ==
                                                            BeneficiaryType
                                                                .individual
                                                        ? e.clientReferenceId
                                                        : state
                                                            .householdMemberWrapper
                                                            .household
                                                            ?.clientReferenceId),
                                              )
                                              .toList();

                                          return MemberCard(
                                            isHead: isHead,
                                            individual: e,
                                            projectBeneficiaries:
                                                projectBeneficiary ?? [],
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
                                                  RegistrationSingleton()
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
                                                          (RegistrationSingleton()
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
                                              callReloadEvent(
                                                  offset: 0, limit: 10);
                                            },
                                            setAsHeadAction: () {
                                              ctx
                                                  .read<HouseholdOverviewBloc>()
                                                  .add(
                                                    HouseholdOverviewSetAsHeadEvent(
                                                      individualModel: e,
                                                      projectId:
                                                          RegistrationSingleton()
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
                                                builder: (BuildContext _) => Popup(
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
                                                    ]),
                                              );
                                            },
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
                                            localizations: localizations,
                                            projectBeneficiaryClientReferenceId:
                                                projectBeneficiaryId,
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ],
                                ),
                                DigitButton(
                                  mainAxisSize: MainAxisSize.max,
                                  onPressed: () => addIndividual(
                                    context,
                                    state.householdMemberWrapper.household!,
                                  ),
                                  label: localizations.translate(
                                    i18.householdOverView
                                        .householdOverViewAddActionText,
                                  ),
                                  prefixIcon: Icons.add_circle,
                                  type: DigitButtonType.tertiary,
                                  size: DigitButtonSize.large,
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

  addIndividual(BuildContext context, HouseholdModel household) async {
    final bloc = context.read<HouseholdOverviewBloc>();

    final address = household.address;

    if (address == null) return;
    bloc.add(
      HouseholdOverviewReloadEvent(
        projectId: RegistrationSingleton().projectId!,
        projectBeneficiaryType: RegistrationSingleton().beneficiaryType!,
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
    final project = RegistrationSingleton().selectedProject;

    if (project?.startDate != null && project?.endDate != null) {
      final now = DateTime.now().millisecondsSinceEpoch;
      final startDate = project!.startDate!;
      final endDate = project.endDate!;

      return now < startDate || now > endDate;
    }

    return false;
  }

  void callReloadEvent({
    required int offset,
    required int limit,
  }) {
    if (mounted) {
      final bloc = context.read<HouseholdOverviewBloc>();

      bloc.add(
        HouseholdOverviewReloadEvent(
          projectId: RegistrationSingleton().projectId!,
          projectBeneficiaryType: RegistrationSingleton().beneficiaryType!,
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
    if (RegistrationSingleton().householdType == HouseholdType.community) {
      hasFilters = RegistrationSingleton().searchCLFFilters != null &&
          RegistrationSingleton().searchCLFFilters!.isNotEmpty;
    } else {
      hasFilters = RegistrationSingleton().searchHouseHoldFilter != null &&
          RegistrationSingleton().searchHouseHoldFilter!.isNotEmpty;
    }
    return hasFilters;
  }
}
