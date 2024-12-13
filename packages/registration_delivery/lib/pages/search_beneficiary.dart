import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_chip.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/switch.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../models/entities/status.dart';
import '../router/registration_delivery_router.gm.dart';
import '../utils/global_search_parameters.dart';
import '../utils/utils.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/beneficiary/view_beneficiary_card.dart';
import '../widgets/localized.dart';
import '../widgets/status_filter/status_filter.dart';

@RoutePage()
class SearchBeneficiaryPage extends LocalizedStatefulWidget {
  const SearchBeneficiaryPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<SearchBeneficiaryPage> createState() => _SearchBeneficiaryPageState();
}

class _SearchBeneficiaryPageState
    extends LocalizedState<SearchBeneficiaryPage> {
  final TextEditingController searchController = TextEditingController();
  bool isProximityEnabled = false;
  int offset = 0;
  int limit = 10;

  double lat = 0.0;
  double long = 0.0;
  List<String> selectedFilters = [];

  SearchHouseholdsState searchHouseholdsState = const SearchHouseholdsState(
    loading: false,
    householdMembers: [],
  );

  late final SearchBlocWrapper blocWrapper; // Declare BlocWrapper

  @override
  void initState() {
    // Initialize the BlocWrapper with instances of SearchHouseholdsBloc, SearchMemberBloc, and ProximitySearchBloc
    blocWrapper = context.read<SearchBlocWrapper>();
    context.read<LocationBloc>().add(const LoadLocationEvent());
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) => Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification) {
              final metrics = scrollNotification.metrics;
              if (metrics.atEdge && metrics.pixels != 0) {
                triggerGlobalSearchEvent(isPagination: true);
              }
            }
            return true;
          },
          child: ScrollableContent(
            header: const Column(children: [
              BackNavigationHelpHeaderWidget(),
            ]),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(spacer2),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(spacer2),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            localizations.translate(
                              RegistrationDeliverySingleton().beneficiaryType !=
                                      BeneficiaryType.individual
                                  ? i18.searchBeneficiary.statisticsLabelText
                                  : i18.searchBeneficiary
                                      .searchIndividualLabelText,
                            ),
                            style: textTheme.headingXl,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      BlocBuilder<LocationBloc, LocationState>(
                        builder: (context, locationState) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              locationState.latitude != null
                                  ? Padding(
                                      padding: const EdgeInsets.all(spacer2),
                                      child: DigitSwitch(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        label: localizations.translate(
                                          i18.searchBeneficiary.proximityLabel,
                                        ),
                                        value: isProximityEnabled,
                                        onChanged: (value) {
                                          searchController.clear();
                                          setState(() {
                                            isProximityEnabled = value;
                                            lat = locationState.latitude!;
                                            long = locationState.longitude!;
                                          });

                                          if (locationState.hasPermissions &&
                                              value &&
                                              locationState.latitude != null &&
                                              locationState.longitude != null &&
                                              RegistrationDeliverySingleton()
                                                      .maxRadius !=
                                                  null &&
                                              isProximityEnabled) {
                                            triggerGlobalSearchEvent();
                                          } else {
                                            blocWrapper.clearEvent();
                                            triggerGlobalSearchEvent();
                                          }
                                        },
                                      ),
                                    )
                                  : const Offstage(),
                              Padding(
                                padding: const EdgeInsets.all(spacer2),
                                child: DigitSearchBar(
                                  controller: searchController,
                                  hintText: localizations.translate(
                                    i18.searchBeneficiary
                                        .beneficiarySearchHintText,
                                  ),
                                  textCapitalization: TextCapitalization.words,
                                  onChanged: (value) {
                                    if (value.isEmpty ||
                                        value.trim().length > 2) {
                                      triggerGlobalSearchEvent();
                                    }
                                  },
                                ),
                              ),
                              RegistrationDeliverySingleton()
                                              .searchHouseHoldFilter !=
                                          null &&
                                      RegistrationDeliverySingleton()
                                          .searchHouseHoldFilter!
                                          .isNotEmpty
                                  ? Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(spacer2),
                                        child: DigitButton(
                                          label: getFilterIconNLabel()['label'],
                                          size: DigitButtonSize.medium,
                                          type: DigitButtonType.tertiary,
                                          suffixIcon:
                                              getFilterIconNLabel()['icon'],
                                          onPressed: () => showFilterDialog(),
                                        ),
                                      ),
                                    )
                                  : const Offstage(),
                              selectedFilters.isNotEmpty
                                  ? Align(
                                      alignment: Alignment.topLeft,
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: selectedFilters.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.all(
                                                    spacer1),
                                                child: DigitChip(
                                                  label:
                                                      '${localizations.translate(getStatus(selectedFilters[index]))}'
                                                      ' (${searchHouseholdsState.totalResults})',
                                                  onItemDelete: () {
                                                    setState(() {
                                                      selectedFilters.remove(
                                                          selectedFilters[
                                                              index]);
                                                    });
                                                    blocWrapper.clearEvent();
                                                    triggerGlobalSearchEvent();
                                                  },
                                                ),
                                              );
                                            }),
                                      ),
                                    )
                                  : const Offstage(),
                            ],
                          );
                        },
                      ),
                      if (searchHouseholdsState.resultsNotFound &&
                          !searchHouseholdsState.loading)
                        Padding(
                          padding: const EdgeInsets.only(
                              left: spacer2, top: spacer2, right: spacer2),
                          child: InfoCard(
                            type: InfoType.info,
                            description: localizations.translate(
                              i18.searchBeneficiary.beneficiaryInfoDescription,
                            ),
                            title: localizations.translate(
                              i18.searchBeneficiary.beneficiaryInfoTitle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (searchHouseholdsState.loading)
                const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              BlocListener<DigitScannerBloc, DigitScannerState>(
                listener: (context, scannerState) {
                  if (scannerState.qrCodes.isNotEmpty) {
                    context.read<SearchBlocWrapper>().tagSearchBloc.add(
                          SearchHouseholdsEvent.searchByTag(
                            tag: scannerState.qrCodes.isNotEmpty
                                ? scannerState.qrCodes.lastOrNull!
                                : '',
                            projectId:
                                RegistrationDeliverySingleton().projectId!,
                          ),
                        );
                  }
                },
                child: BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, locationState) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (ctx, index) {
                          final i = searchHouseholdsState.householdMembers
                              .elementAt(index);
                          final distance = calculateDistance(
                            Coordinate(
                              lat,
                              long,
                            ),
                            Coordinate(
                              i.household?.address?.latitude,
                              i.household?.address?.longitude,
                            ),
                          );

                          return Container(
                            margin: const EdgeInsets.only(bottom: spacer2),
                            child: ViewBeneficiaryCard(
                              distance: isProximityEnabled ? distance : null,
                              householdMember: i,
                              onOpenPressed: () async {
                                final scannerBloc =
                                    context.read<DigitScannerBloc>();

                                scannerBloc.add(
                                  const DigitScannerEvent.handleScanner(),
                                );

                                if ((i.tasks != null &&
                                        i.tasks?.lastOrNull!.status ==
                                            Status.closeHousehold.toValue() &&
                                        (i.tasks ?? []).isNotEmpty) ||
                                    (i.projectBeneficiaries ?? []).isEmpty) {
                                  setState(() {
                                    selectedFilters = [];
                                  });
                                  blocWrapper.clearEvent();
                                  await context.router.push(
                                    BeneficiaryRegistrationWrapperRoute(
                                      initialState: BeneficiaryRegistrationState
                                          .editHousehold(
                                              householdModel: i.household!,
                                              individualModel: i.members!,
                                              registrationDate: DateTime.now(),
                                              projectBeneficiaryModel:
                                                  (i.projectBeneficiaries ?? [])
                                                          .isNotEmpty
                                                      ? i.projectBeneficiaries
                                                          ?.lastOrNull
                                                      : null,
                                              addressModel: i.headOfHousehold!
                                                  .address!.lastOrNull!,
                                              headOfHousehold:
                                                  i.headOfHousehold),
                                    ),
                                  );
                                } else {
                                  await context.router.push(
                                    BeneficiaryWrapperRoute(
                                      wrapper: i,
                                    ),
                                  );
                                }
                                setState(() {
                                  isProximityEnabled = false;
                                });
                                searchController.clear();
                                selectedFilters.clear();
                                blocWrapper.clearEvent();
                              },
                            ),
                          );
                        },
                        childCount:
                            searchHouseholdsState.householdMembers.length,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: DigitCard(
            margin: const EdgeInsets.only(top: spacer2),
            padding: const EdgeInsets.all(spacer4),
            children: [
              DigitButton(
                label: localizations.translate(
                  i18.searchBeneficiary.beneficiaryAddActionLabel,
                ),
                mainAxisSize: MainAxisSize.max,
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                isDisabled: searchHouseholdsState.searchQuery != null &&
                        searchHouseholdsState.searchQuery!.isNotEmpty
                    ? false
                    : true,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.read<DigitScannerBloc>().add(
                        const DigitScannerEvent.handleScanner(),
                      );
                  context.router.push(BeneficiaryRegistrationWrapperRoute(
                    initialState: BeneficiaryRegistrationCreateState(
                      searchQuery: searchHouseholdsState.searchQuery,
                    ),
                  ));
                  searchController.clear();
                  selectedFilters = [];
                  blocWrapper.clearEvent();
                },
              ),
              DigitButton(
                type: DigitButtonType.secondary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
                onPressed: () {
                  blocWrapper.clearEvent();
                  selectedFilters = [];
                  searchController.clear();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DigitScannerPage(
                        quantity: 1,
                        isGS1code: false,
                        singleValue: true,
                      ),
                      settings: const RouteSettings(name: '/qr-scanner'),
                    ),
                  );
                },
                prefixIcon: Icons.qr_code,
                label: localizations.translate(
                  i18.deliverIntervention.scannerLabel,
                ),
              ),
            ]),
      ),
    );
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
      setState(() {
        selectedFilters = [];
      });
      setState(() {
        selectedFilters.addAll(filters);
      });
      triggerGlobalSearchEvent();
    } else {
      setState(() {
        selectedFilters = [];
      });
      blocWrapper.clearEvent();
      triggerGlobalSearchEvent();
    }
  }

  void triggerGlobalSearchEvent({bool isPagination = false}) {
    if (!isPagination) {
      blocWrapper.clearEvent();
    }
    if (RegistrationDeliverySingleton().beneficiaryType ==
        BeneficiaryType.individual) {
      if (isProximityEnabled ||
          selectedFilters.isNotEmpty ||
          searchController.text.isNotEmpty) {
        blocWrapper.individualGlobalSearchBloc
            .add(SearchHouseholdsEvent.individualGlobalSearch(
                globalSearchParams: GlobalSearchParameters(
          isProximityEnabled: isProximityEnabled,
          latitude: lat,
          projectId: RegistrationDeliverySingleton().projectId!,
          longitude: long,
          maxRadius: RegistrationDeliverySingleton().maxRadius,
          nameSearch: searchController.text.trim().length > 2
              ? searchController.text.trim()
              : blocWrapper.searchHouseholdsBloc.state.searchQuery,
          filter: selectedFilters,
          offset: isPagination
              ? blocWrapper.individualGlobalSearchBloc.state.offset
              : offset,
          limit: isPagination
              ? blocWrapper.individualGlobalSearchBloc.state.limit
              : limit,
        )));
      }
    } else {
      if (isProximityEnabled ||
          selectedFilters.isNotEmpty ||
          searchController.text.isNotEmpty) {
        blocWrapper.houseHoldGlobalSearchBloc
            .add(SearchHouseholdsEvent.houseHoldGlobalSearch(
                globalSearchParams: GlobalSearchParameters(
          isProximityEnabled: isProximityEnabled,
          latitude: lat,
          longitude: long,
          projectId: RegistrationDeliverySingleton().projectId!,
          maxRadius: RegistrationDeliverySingleton().maxRadius,
          nameSearch: searchController.text.trim().length > 2
              ? searchController.text.trim()
              : blocWrapper.searchHouseholdsBloc.state.searchQuery,
          filter: selectedFilters,
          offset: isPagination
              ? blocWrapper.houseHoldGlobalSearchBloc.state.offset
              : offset,
          limit: isPagination
              ? blocWrapper.houseHoldGlobalSearchBloc.state.limit
              : limit,
        )));
      }
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
      return mappedStatus == Status.administeredSuccess.toValue()
          ? '${RegistrationDeliverySingleton().selectedProject!.name}_$mappedStatus'
          : mappedStatus;
    } else {
      return selectedFilter;
    }
  }
}
