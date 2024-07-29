import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../blocs/scanner/scanner.dart';
import '../blocs/search_households/search_bloc_common_wrapper.dart';
import '../blocs/search_households/search_households.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/beneficiary/view_beneficiary_card.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

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

  SearchHouseholdsState searchHouseholdsState = const SearchHouseholdsState(
    loading: false,
    householdMembers: [],
  );

  late final SearchBlocWrapper blocWrapper; // Declare BlocWrapper

  @override
  void initState() {
    // Initialize the BlocWrapper with instances of SearchHouseholdsBloc, SearchMemberBloc, and ProximitySearchBloc
    blocWrapper = context.read<SearchBlocWrapper>();

    // Listen to state changes
    blocWrapper.stateChanges.listen((state) {
      if (mounted) {
        setState(() {
          searchHouseholdsState = state;
        });
      }
    });

    setState(() {
      offset = 0;
      limit = 10;
    });
    super.initState();
  }

  @override
  void dispose() {
    blocWrapper.clearEvent();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) =>
          BlocBuilder<AppInitializationBloc, AppInitializationState>(
        builder: (appcontext, state) {
          if (state is! AppInitialized) return const Offstage();

          final appConfig = state.appConfiguration;

          return Scaffold(
            body: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  final metrics = scrollNotification.metrics;
                  if (metrics.atEdge &&
                      isProximityEnabled &&
                      searchController.text == '' &&
                      metrics.pixels != 0) {
                    blocWrapper.proximitySearchBloc
                        .add(SearchHouseholdsEvent.searchByProximity(
                      latitude: lat,
                      longititude: long,
                      projectId: context.projectId,
                      maxRadius: appConfig.maxRadius!,
                      offset: offset + limit,
                      limit: limit,
                    ));
                    setState(() {
                      offset = (offset + limit);
                    });
                  } else if (metrics.atEdge &&
                      searchController.text != '' &&
                      metrics.pixels != 0) {
                    blocWrapper.searchByHeadBloc
                        .add(SearchHouseholdsEvent.searchByHouseholdHead(
                      searchText: searchController.text,
                      projectId: context.projectId,
                      isProximityEnabled: isProximityEnabled,
                      offset: offset + limit,
                      limit: limit,
                    ));

                    setState(() {
                      offset = (offset + limit);
                    });
                  }
                }
                // Return true to allow the notification to continue to be dispatched to further ancestors.

                return true;
              },
              child: ScrollableContent(
                header: const Column(children: [
                  BackNavigationHelpHeaderWidget(),
                ]),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(kPadding),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(kPadding),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                localizations.translate(
                                  context.beneficiaryType !=
                                          BeneficiaryType.individual
                                      ? i18
                                          .searchBeneficiary.statisticsLabelText
                                      : i18.searchBeneficiary
                                          .searchIndividualLabelText,
                                ),
                                style: theme.textTheme.displayMedium,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          BlocBuilder<LocationBloc, LocationState>(
                            builder: (context, locationState) {
                              return Column(
                                children: [
                                  DigitSearchBar(
                                    controller: searchController,
                                    hintText: localizations.translate(
                                      i18.searchBeneficiary
                                          .beneficiarySearchHintText,
                                    ),
                                    textCapitalization:
                                        TextCapitalization.words,
                                    onChanged: (value) {
                                      blocWrapper.clearEvent();
                                      if (value.isEmpty) {
                                        blocWrapper.clearEvent();
                                      }
                                      if (value.trim().length < 3 &&
                                          !isProximityEnabled) {
                                        blocWrapper.clearEvent();

                                        return;
                                      } else if (isProximityEnabled &&
                                          value.trim().length < 3) {
                                        blocWrapper.proximitySearchBloc.add(
                                          SearchHouseholdsEvent
                                              .searchByProximity(
                                            latitude: locationState.latitude!,
                                            longititude:
                                                locationState.longitude!,
                                            projectId: context.projectId,
                                            maxRadius: appConfig.maxRadius!,
                                            offset: offset,
                                            limit: limit,
                                          ),
                                        );
                                      } else {
                                        blocWrapper.searchByHeadBloc.add(
                                          SearchHouseholdsEvent
                                              .searchByHouseholdHead(
                                            searchText: value,
                                            projectId: context.projectId,
                                            isProximityEnabled:
                                                isProximityEnabled,
                                            latitude: locationState.latitude,
                                            longitude: locationState.longitude,
                                            maxRadius: appConfig.maxRadius,
                                            tag: null,
                                            offset: offset,
                                            limit: limit,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  locationState.latitude != null
                                      ? Row(
                                          children: [
                                            Switch(
                                              value: isProximityEnabled,
                                              onChanged: (value) {
                                                searchController.clear();
                                                setState(() {
                                                  isProximityEnabled = value;
                                                  lat = locationState.latitude!;
                                                  long =
                                                      locationState.longitude!;
                                                  offset = 0;
                                                  limit = 10;
                                                });

                                                if (locationState
                                                        .hasPermissions &&
                                                    value &&
                                                    locationState.latitude !=
                                                        null &&
                                                    locationState.longitude !=
                                                        null &&
                                                    appConfig.maxRadius !=
                                                        null &&
                                                    isProximityEnabled) {
                                                  blocWrapper
                                                      .proximitySearchBloc
                                                      .add(
                                                    SearchHouseholdsEvent
                                                        .searchByProximity(
                                                      latitude: locationState
                                                          .latitude!,
                                                      longititude: locationState
                                                          .longitude!,
                                                      projectId:
                                                          context.projectId,
                                                      maxRadius:
                                                          appConfig.maxRadius!,
                                                      offset: offset,
                                                      limit: limit,
                                                    ),
                                                  );
                                                } else {
                                                  blocWrapper.clearEvent();
                                                }
                                              },
                                            ),
                                            Text(
                                              localizations.translate(
                                                i18.searchBeneficiary
                                                    .proximityLabel,
                                              ),
                                            ),
                                          ],
                                        )
                                      : const Offstage(),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: kPadding * 2),
                          if (searchHouseholdsState.resultsNotFound &&
                              !searchHouseholdsState.loading)
                            DigitInfoCard(
                              description: localizations.translate(
                                i18.searchBeneficiary
                                    .beneficiaryInfoDescription,
                              ),
                              title: localizations.translate(
                                i18.searchBeneficiary.beneficiaryInfoTitle,
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
                  BlocBuilder<LocationBloc, LocationState>(
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
                                i.household.address?.latitude,
                                i.household.address?.longitude,
                              ),
                            );

                            return Container(
                              margin: const EdgeInsets.only(bottom: kPadding),
                              child: ViewBeneficiaryCard(
                                distance: isProximityEnabled ? distance : null,
                                householdMember: i,
                                onOpenPressed: () async {
                                  final scannerBloc =
                                      context.read<ScannerBloc>();

                                  scannerBloc.add(
                                    const ScannerEvent.handleScanner(
                                      [],
                                      [],
                                    ),
                                  );

                                  await context.router.push(
                                    BeneficiaryWrapperRoute(
                                      wrapper: i,
                                    ),
                                  );
                                  setState(() {
                                    isProximityEnabled = false;
                                  });
                                  searchController.clear();

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
                ],
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: 75,
              child: Card(
                margin: const EdgeInsets.all(0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                  child: Column(
                    children: [
                      DigitElevatedButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          // context.read<ScannerBloc>().add(
                          //       const ScannerEvent.handleScanner([], []),
                          //     );
                          context.router
                              .push(BeneficiaryRegistrationWrapperRoute(
                            initialState: BeneficiaryRegistrationCreateState(
                              searchQuery: searchController.text,
                            ),
                          ));
                          searchController.clear();
                          blocWrapper.clearEvent();
                        },
                        child: Center(
                          child: Text(localizations.translate(
                            i18.searchBeneficiary.beneficiaryAddActionLabel,
                          )),
                        ),
                      ),
                      // Solution Customization
                      // DigitOutlineIconButton(
                      //   buttonStyle: OutlinedButton.styleFrom(
                      //     shape: const RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.zero,
                      //     ),
                      //   ),
                      //   onPressed: () {
                      //     blocWrapper.clearEvent();
                      //     context.router.push(QRScannerRoute(
                      //       quantity: 1,
                      //       isGS1code: false,
                      //       sinlgleValue: true,
                      //     ));
                      //   },
                      //   icon: Icons.qr_code,
                      //   label: localizations.translate(
                      //     i18.deliverIntervention.scannerLabel,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
