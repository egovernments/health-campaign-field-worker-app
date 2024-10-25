import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../../blocs/household_overview/household_overview.dart';
import '../../../blocs/project/project.dart';
import '../../../blocs/scanner/scanner.dart';
import '../../../blocs/search_households/search_bloc_common_wrapper.dart';
import '../../../blocs/search_households/search_households.dart';
import '../../../models/entities/beneficiary_type.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';
import '../../../widgets/member_card/member_card.dart';

class SchoolIndividualListPage extends LocalizedStatefulWidget {
  const SchoolIndividualListPage({super.key, super.appLocalizations});

  @override
  State<SchoolIndividualListPage> createState() =>
      _SchoolIndividualListPageState();
}

class _SchoolIndividualListPageState
    extends LocalizedState<SchoolIndividualListPage> {
  final TextEditingController searchController = TextEditingController();
  late final SearchBlocWrapper blocWrapper; // Declare BlocWrapper
  SearchHouseholdsState searchHouseholdsState = const SearchHouseholdsState(
    loading: false,
    householdMembers: [],
  );

  int offset = 0;
  int limit = 10;

  String? selectedSortOrder;

  @override
  void initState() {
    callReloadEvent(
      offset: offset,
      limit: limit,
    );
    blocWrapper = context.read<SearchBlocWrapper>();

    // Listen to state changes
    blocWrapper.stateChanges.listen((state) {
      if (mounted) {
        setState(() {
          searchHouseholdsState = state;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final beneficiaryType = context.beneficiaryType;

    return PopScope(
      onPopInvoked: (didPop) async {
        context
            .read<SearchBlocWrapper>()
            .searchHouseholdsBloc
            .add(const SearchHouseholdsClearEvent());
        Navigator.of(context).pop();
      },
      child: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
        builder: (ctx, state) {
          return Scaffold(
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : NotificationListener(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification) {
                        final metrics = scrollNotification.metrics;
                        if (metrics.atEdge && metrics.pixels != 0) {
                          setState(() {
                            offset = (offset + limit);
                          });
                          callReloadEvent(
                            offset: offset,
                            limit: limit,
                          );
                        }
                      }
                      // Return true to allow the notification to continue to be dispatched to further ancestors.

                      return true;
                    },
                    child: ScrollableContent(
                      header: BackNavigationHelpHeaderWidget(
                        handleback: () {
                          context
                              .read<SearchBlocWrapper>()
                              .searchHouseholdsBloc
                              .add(const SearchHouseholdsClearEvent());
                        },
                      ),
                      enableFixedButton: true,
                      footer: Padding(
                        padding: const EdgeInsets.all(kPadding),
                        child: DigitOutlineIconButton(
                          buttonStyle: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          icon: Icons.add_circle,
                          onPressed: () async {
                            final wrapper = state.householdMemberWrapper;
                            final address = wrapper.household.address;

                            if (address == null) return;

                            final projectId = context.projectId;

                            context.read<ScannerBloc>().add(
                                  const ScannerEvent.handleScanner(
                                    [],
                                    [],
                                  ),
                                );
                            await context.router.push(
                              BeneficiaryRegistrationWrapperRoute(
                                initialState:
                                    BeneficiaryRegistrationAddMemberState(
                                  addressModel: address,
                                  householdModel: wrapper.household,
                                ),
                                children: [
                                  SchoolIndividualDetailsRoute(
                                    isHeadOfHousehold: false,
                                    headName: wrapper
                                        .headOfHousehold.name!.givenName!,
                                  ),
                                ],
                              ),
                            );
                            callReloadEvent(
                              offset: 0,
                              limit: 10,
                            );
                          },
                          label: localizations
                              .translate(i18.schoolDetails.addStudent),
                        ),
                      ),
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: kPadding - 1,
                                          right: kPadding + 1,
                                        ),
                                        child: Text(
                                          localizations.translate(
                                            i18.schoolDetails.studentLabel,
                                          ),
                                          style: theme.textTheme.displayMedium,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: DigitIconButton(
                                            onPressed: () async {
                                              var treatedFirst =
                                                  await context.router.push(
                                                SchoolIndividualSortingRoute(),
                                              ) as String?;

                                              if (treatedFirst != null) {
                                                setState(() {
                                                  selectedSortOrder =
                                                      treatedFirst;
                                                });
                                                if (mounted) {
                                                  callReloadEvent(
                                                    limit: 10,
                                                    offset: 0,
                                                  );
                                                }
                                              }
                                            },
                                            iconText: localizations.translate(
                                              i18.complaints.sortCTA,
                                            ),
                                            icon: Icons.sort_rounded,
                                          ),
                                        ),
                                        selectedSortOrder != null
                                            ? Align(
                                                alignment: Alignment.topRight,
                                                child: DigitIconButton(
                                                  onPressed: () async {
                                                    if (mounted) {
                                                      setState(() {
                                                        selectedSortOrder =
                                                            null;
                                                      });
                                                      callReloadEvent(
                                                        offset: 0,
                                                        limit: 10,
                                                      );
                                                    }
                                                  },
                                                  iconText:
                                                      localizations.translate(
                                                    selectedSortOrder!,
                                                  ),
                                                  icon: Icons.clear,
                                                ),
                                              )
                                            : const Offstage(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              DigitSearchBar(
                                controller: searchController,
                                hintText: localizations.translate(
                                  i18.schoolDetails.studentSearchHintText,
                                ),
                                textCapitalization: TextCapitalization.words,
                                onChanged: (value) {
                                  if (value.length >= 3) {
                                    callReloadEvent(
                                      offset: 0,
                                      limit: 10,
                                    );
                                  } else if (searchController
                                      .value.text.isEmpty) {
                                    callReloadEvent(
                                      offset: offset,
                                      limit: limit,
                                    );
                                  }
                                },
                              ),
                              BlocBuilder<ProjectBloc, ProjectState>(
                                builder: (context, projectState) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: state.householdMemberWrapper
                                            .members.isNotEmpty
                                        ? state.householdMemberWrapper.members
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

                                              final taskdata = projectBeneficiary
                                                      .isNotEmpty
                                                  ? state.householdMemberWrapper
                                                      .tasks
                                                      ?.where((element) =>
                                                          element
                                                              .projectBeneficiaryClientReferenceId ==
                                                          projectBeneficiary
                                                              .first
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
                                                          projectBeneficiary
                                                              .first
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
                                                          taskdata.last
                                                              .clientReferenceId)
                                                      .toList()
                                                  : null;
                                              // final ageInYears =
                                              //     DigitDateUtils.calculateAge(
                                              //   DigitDateUtils
                                              //           .getFormattedDateToDateTime(
                                              //         e.dateOfBirth!,
                                              //       ) ??
                                              //       DateTime.now(),
                                              // ).years;
                                              // final ageInMonths =
                                              //     DigitDateUtils.calculateAge(
                                              //   DigitDateUtils
                                              //           .getFormattedDateToDateTime(
                                              //         e.dateOfBirth!,
                                              //       ) ??
                                              //       DateTime.now(),
                                              // ).months;
                                              final currentCycle = projectState
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

                                              final isBeneficiaryIneligible =
                                                  checkIfBeneficiaryIneligible(
                                                taskdata,
                                              );

                                              final isBeneficiaryReferred =
                                                  checkIfBeneficiaryReferred(
                                                taskdata,
                                              );

                                              return DigitCard(
                                                child: MemberCard(
                                                  isAdverseEffect:
                                                      !recordedSideEffect(
                                                            context
                                                                .selectedCycle,
                                                            (taskdata != null &&
                                                                    taskdata!
                                                                        .isNotEmpty)
                                                                ? taskdata!
                                                                    .lastOrNull
                                                                : null,
                                                            sideEffectData,
                                                          ) &&
                                                          ((taskdata != null &&
                                                                  taskdata!
                                                                      .isNotEmpty)
                                                              ? isCurrentTimeBeforeEndTime(
                                                                  taskdata!
                                                                      .last!
                                                                      .clientAuditDetails!
                                                                      .createdTime!,
                                                                  int.parse(
                                                                    (context.selectedProjectType!.cycles !=
                                                                                null &&
                                                                            context
                                                                                .selectedProjectType!.cycles!.isNotEmpty)
                                                                        ? (context.selectedProjectType!.cycles!.last.mandatoryWaitSinceLastCycleInDays ??
                                                                            "24")
                                                                        : "24"
                                                                            .toString(),
                                                                  ),
                                                                )
                                                              : false),
                                                  backgroundColorType:
                                                      DigitTheme
                                                          .instance
                                                          .colorScheme
                                                          .onSecondary,
                                                  isHead: isHead,
                                                  individual: e,
                                                  tasks: taskdata,
                                                  sideEffects: sideEffectData,
                                                  editMemberAction: () async {
                                                    final scannerbloc = context
                                                        .read<ScannerBloc>();

                                                    scannerbloc.add(
                                                      const ScannerEvent
                                                          .handleScanner(
                                                          [], []),
                                                    );

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

                                                    await context.router.root
                                                        .push(
                                                      BeneficiaryRegistrationWrapperRoute(
                                                        initialState:
                                                            BeneficiaryRegistrationEditIndividualState(
                                                          individualModel: e,
                                                          householdModel: state
                                                              .householdMemberWrapper
                                                              .household,
                                                          addressModel:
                                                              address.first,
                                                          projectBeneficiaryModel: state
                                                              .householdMemberWrapper
                                                              .projectBeneficiaries
                                                              .firstWhereOrNull(
                                                            (element) =>
                                                                element
                                                                    .beneficiaryClientReferenceId ==
                                                                (context.beneficiaryType ==
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
                                                          SchoolIndividualDetailsRoute(
                                                            isHeadOfHousehold:
                                                                isHead,
                                                            headName: state
                                                                .householdMemberWrapper
                                                                .headOfHousehold
                                                                .name!
                                                                .givenName!,
                                                          ),
                                                        ],
                                                      ),
                                                    );

                                                    callReloadEvent(
                                                      limit: 10,
                                                      offset: 0,
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
                                                      options:
                                                          DigitDialogOptions(
                                                        titlePadding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                          kPadding * 2,
                                                          kPadding * 2,
                                                          kPadding * 2,
                                                          kPadding / 2,
                                                        ),
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

                                                            context.router
                                                                .popUntilRouteWithName(
                                                              SearchBeneficiaryRoute
                                                                  .name,
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
                                                              rootNavigator:
                                                                  true,
                                                            ).pop();
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  isNotEligible: projectState
                                                              .projectType
                                                              ?.cycles !=
                                                          null
                                                      ? !checkEligibilityForAgeAndSideEffect(
                                                          projectState
                                                              .projectType,
                                                          (taskdata ?? [])
                                                                  .isNotEmpty
                                                              ? taskdata?.last
                                                              : null,
                                                          sideEffectData,
                                                          e,
                                                        )
                                                      : false,
                                                  name:
                                                      '${e.name?.givenName ?? ' - '} ${e.name?.familyName ?? ' - '}',
                                                  years: (e.dateOfBirth == null
                                                          ? null
                                                          : DigitDateUtils
                                                              .calculateAge(
                                                              DigitDateUtils
                                                                      .getFormattedDateToDateTime(
                                                                    e.dateOfBirth!,
                                                                  ) ??
                                                                  DateTime
                                                                      .now(),
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
                                                                  DateTime
                                                                      .now(),
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
                                                  isBeneficiaryIneligible:
                                                      isBeneficiaryIneligible &&
                                                          !checkStatus(
                                                            taskdata,
                                                            currentCycle,
                                                          ),
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
                                                ),
                                              );
                                            },
                                          ).toList()
                                        : [
                                            DigitInfoCard(
                                              description:
                                                  localizations.translate(
                                                i18.searchBeneficiary
                                                    .beneficiaryInfoDescription,
                                              ),
                                              title: localizations.translate(
                                                i18.searchBeneficiary
                                                    .beneficiaryInfoTitle,
                                              ),
                                            ),
                                          ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  void callReloadEvent({
    required int offset,
    required int limit,
  }) {
    if (mounted) {
      final bloc = context.read<HouseholdOverviewBloc>();

      bloc.add(
        HouseholdOverviewReloadEvent(
          householdMemberWrapper: bloc.state.householdMemberWrapper,
          projectId: context.projectId.toString(),
          projectBeneficiaryType: context.beneficiaryType,
          offset: offset,
          limit: limit,
          searchQuery:
              searchController.text.isNotEmpty ? searchController.text : null,
          taskSortOrder: selectedSortOrder,
        ),
      );
    }
  }
}
