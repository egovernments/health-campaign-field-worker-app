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
import 'package:survey_form/survey_form.dart';

import 'package:registration_delivery/blocs/beneficiary_registration/beneficiary_registration.dart';
import 'package:registration_delivery/blocs/delivery_intervention/deliver_intervention.dart';
import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/blocs/search_households/search_bloc_common_wrapper.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/registration_delivery_enums.dart';
import 'package:registration_delivery/models/entities/status.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import '../../utils/i18_key_constants.dart' as i18Local;
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/back_navigation_help_header.dart';
import 'package:registration_delivery/widgets/localized.dart';
import 'package:registration_delivery/widgets/member_card/member_card.dart';
import 'package:registration_delivery/widgets/table_card/table_card.dart';
import 'package:registration_delivery/widgets/status_filter/status_filter.dart';

import '../../utils/extensions/extensions.dart';

@RoutePage()
class CustomHouseholdOverviewPage extends LocalizedStatefulWidget {
  const CustomHouseholdOverviewPage({super.key, super.appLocalizations});

  @override
  State<CustomHouseholdOverviewPage> createState() =>
      _HouseholdOverviewPageState();
}

class _HouseholdOverviewPageState
    extends LocalizedState<CustomHouseholdOverviewPage> {
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

  getBednetCount(int members) {
    return (members / 2).round().toString();
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
                      header: BackNavigationHelpHeaderWidget(
                        handleBack: () {
                          context
                              .read<SearchHouseholdsBloc>()
                              .add(const SearchHouseholdsEvent.clear());
                        },
                        showHelp: false,
                      ),
                      enableFixedDigitButton: true,
                      footer: DigitCard(
                          margin: const EdgeInsets.only(top: spacer2),
                          children: [
                            Offstage(
                              offstage: beneficiaryType ==
                                      BeneficiaryType.individual ||
                                  isOutsideProjectDateRange() ||
                                  !context.isDistributor,
                              child: BlocBuilder<ServiceDefinitionBloc,
                                  ServiceDefinitionState>(
                                builder: (context, serviceDefinitionState) =>
                                    BlocBuilder<DeliverInterventionBloc,
                                            DeliverInterventionState>(
                                        builder: (ctx,
                                                deliverInterventionState) =>
                                            state.householdMemberWrapper.tasks
                                                        ?.lastOrNull?.status ==
                                                    Status.administeredSuccess
                                                        .toValue()
                                                ? const Offstage()
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: spacer2),
                                                    child: DigitButton(
                                                      label: localizations
                                                          .translate(
                                                        i18.memberCard
                                                            .deliverDetailsUpdateLabel,
                                                      ),
                                                      isDisabled: state
                                                                  .householdMemberWrapper
                                                                  .tasks
                                                                  ?.lastOrNull
                                                                  ?.status ==
                                                              Status
                                                                  .administeredSuccess
                                                                  .toValue()
                                                          ? true
                                                          : false,
                                                      type: DigitButtonType
                                                          .secondary,
                                                      size:
                                                          DigitButtonSize.large,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      onPressed: () {
                                                        serviceDefinitionState
                                                            .when(
                                                                empty: () {},
                                                                isloading:
                                                                    () {},
                                                                serviceDefinitionFetch:
                                                                    (value,
                                                                        model) {
                                                                  if (value
                                                                      .where((element) => element
                                                                          .code
                                                                          .toString()
                                                                          .contains(
                                                                              '${RegistrationDeliverySingleton().selectedProject?.name}.${RegistrationDeliveryEnums.iec.toValue()}'))
                                                                      .toList()
                                                                      .isEmpty) {
                                                                    context
                                                                        .router
                                                                        .push(
                                                                      DeliverInterventionRoute(),
                                                                    );
                                                                  } else {
                                                                    navigateToChecklist(
                                                                        ctx);
                                                                  }
                                                                });
                                                        callReloadEvent(
                                                            offset: state
                                                                .householdMemberWrapper
                                                                .members!
                                                                .length,
                                                            limit: limit);
                                                      },
                                                    ),
                                                  )),
                              ),
                            ),
                          ]),
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
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(spacer2),
                                          child: Text(
                                            RegistrationDeliverySingleton()
                                                            .householdType !=
                                                        null &&
                                                    RegistrationDeliverySingleton()
                                                            .householdType ==
                                                        HouseholdType.community
                                                ? localizations.translate(i18
                                                    .householdOverView
                                                    .clfOverviewLabel)
                                                : localizations.translate(i18
                                                    .householdOverView
                                                    .householdOverViewLabel),
                                            style: textTheme.headingXl,
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

                                        if (RegistrationDeliverySingleton()
                                                .householdType ==
                                            HouseholdType.community) {
                                          return Column(
                                            children: [
                                              DigitTableCard(element: {
                                                localizations.translate(i18
                                                        .householdOverView
                                                        .instituteNameLabel):
                                                    localizations.translate(state
                                                            .householdMemberWrapper
                                                            .household
                                                            ?.address
                                                            ?.buildingName ??
                                                        i18.common
                                                            .coreCommonNA),
                                                localizations.translate(
                                                  i18.deliverIntervention
                                                      .memberCountText,
                                                ): state.householdMemberWrapper
                                                    .household?.memberCount,
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
                                                    localizations.translate(i18
                                                        .common.coreCommonNA),
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
                                                localizations.translate(i18Local
                                                        .beneficiaryDetails
                                                        .numberOfNets):
                                                    getBednetCount(state
                                                            .householdMemberWrapper
                                                            .household
                                                            ?.memberCount ??
                                                        0),
                                                localizations.translate(i18Local
                                                        .beneficiaryDetails
                                                        .dustributionSiteName):
                                                    localizations.translate(
                                                        "${state.householdMemberWrapper.headOfHousehold?.address!.first.locality!.code}_DP"),
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

  addIndividual(BuildContext context, HouseholdModel household) async {
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
              ? getTaskStatus(state.householdMemberWrapper.tasks ?? [])
                  .toValue()
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

  void callReloadEvent({
    required int offset,
    required int limit,
  }) {
    if (mounted) {
      final bloc = context.read<HouseholdOverviewBloc>();

      bloc.add(
        HouseholdOverviewReloadEvent(
          projectId: RegistrationDeliverySingleton().projectId!,
          projectBeneficiaryType:
              RegistrationDeliverySingleton().beneficiaryType!,
          offset: offset,
          limit: limit,
          searchByName:
              searchController.text.isNotEmpty ? searchController.text : null,
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
    if (RegistrationDeliverySingleton().householdType ==
        HouseholdType.community) {
      hasFilters = RegistrationDeliverySingleton().searchCLFFilters != null &&
          RegistrationDeliverySingleton().searchCLFFilters!.isNotEmpty;
    } else {
      hasFilters =
          RegistrationDeliverySingleton().searchHouseHoldFilter != null &&
              RegistrationDeliverySingleton().searchHouseHoldFilter!.isNotEmpty;
    }
    return hasFilters;
  }
}
