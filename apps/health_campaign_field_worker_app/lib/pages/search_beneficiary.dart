import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../blocs/scanner/scanner.dart';
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

  @override
  void initState() {
    context
        .read<SearchHouseholdsBloc>()
        .add(const SearchHouseholdsClearEvent());

    setState(() {
      offset = 0;
      limit = 10;
    });
    super.initState();
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
                      searchController.text == '') {
                    final bloc = context.read<SearchHouseholdsBloc>();

                    bloc.add(SearchHouseholdsEvent.searchByProximity(
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
                  }
                }
                // Return true to allow the notification to continue to be dispatched to further ancestors.

                return true;
              },
              child: BlocBuilder<SearchHouseholdsBloc, SearchHouseholdsState>(
                builder: (context, searchState) {
                  return ScrollableContent(
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
                                          ? i18.searchBeneficiary
                                              .statisticsLabelText
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
                                          final bloc = context
                                              .read<SearchHouseholdsBloc>();

                                          if (value.trim().length < 2 &&
                                              !isProximityEnabled) {
                                            bloc.add(
                                              const SearchHouseholdsClearEvent(),
                                            );

                                            return;
                                          } else {
                                            if (isProximityEnabled &&
                                                value.trim().length < 2) {
                                              bloc.add(SearchHouseholdsEvent
                                                  .searchByProximity(
                                                latitude:
                                                    locationState.latitude!,
                                                longititude:
                                                    locationState.longitude!,
                                                projectId: context.projectId,
                                                maxRadius: appConfig.maxRadius!,
                                                limit: limit,
                                                offset: offset,
                                              ));
                                            } else {
                                              bloc.add(
                                                SearchHouseholdsSearchByHouseholdHeadEvent(
                                                  searchText: value.trim(),
                                                  projectId: context.projectId,
                                                  latitude:
                                                      locationState.latitude,
                                                  longitude:
                                                      locationState.longitude,
                                                  isProximityEnabled:
                                                      isProximityEnabled,
                                                  maxRadius:
                                                      appConfig.maxRadius,
                                                ),
                                              );
                                            }
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
                                                      isProximityEnabled =
                                                          value;
                                                      lat = locationState
                                                          .latitude!;
                                                      long = locationState
                                                          .longitude!;
                                                    });

                                                    if (locationState
                                                            .hasPermissions &&
                                                        value &&
                                                        locationState
                                                                .latitude !=
                                                            null &&
                                                        locationState
                                                                .longitude !=
                                                            null &&
                                                        appConfig.maxRadius !=
                                                            null &&
                                                        isProximityEnabled) {
                                                      final bloc = context.read<
                                                          SearchHouseholdsBloc>();
                                                      bloc.add(
                                                        SearchHouseholdsEvent
                                                            .searchByProximity(
                                                          latitude:
                                                              locationState
                                                                  .latitude!,
                                                          longititude:
                                                              locationState
                                                                  .longitude!,
                                                          projectId:
                                                              context.projectId,
                                                          maxRadius: appConfig
                                                              .maxRadius!,
                                                          limit: limit,
                                                          offset: offset,
                                                        ),
                                                      );
                                                    } else {
                                                      final bloc = context.read<
                                                          SearchHouseholdsBloc>();
                                                      bloc.add(
                                                        const SearchHouseholdsClearEvent(),
                                                      );
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
                              if (searchState.resultsNotFound)
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
                      if (searchState.loading)
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
                                final i = searchState.householdMembers
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
                                  margin:
                                      const EdgeInsets.only(bottom: kPadding),
                                  child: ViewBeneficiaryCard(
                                    distance:
                                        isProximityEnabled ? distance : null,
                                    householdMember: i,
                                    onOpenPressed: () async {
                                      final scannerbloc =
                                          context.read<ScannerBloc>();

                                      scannerbloc.add(
                                        const ScannerEvent.handleScanner(
                                          [],
                                          [],
                                        ),
                                      );

                                      final bloc =
                                          context.read<SearchHouseholdsBloc>();

                                      await context.router.push(
                                        BeneficiaryWrapperRoute(
                                          wrapper: i,
                                        ),
                                      );
                                      setState(() {
                                        isProximityEnabled = false;
                                      });
                                      searchController.clear();

                                      bloc.add(
                                        const SearchHouseholdsClearEvent(),
                                      );
                                    },
                                  ),
                                );
                              },
                              childCount: searchState.householdMembers.length,
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: 150,
              child: Card(
                margin: const EdgeInsets.all(0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                  child: Column(
                    children: [
                      BlocBuilder<SearchHouseholdsBloc, SearchHouseholdsState>(
                        builder: (context, state) {
                          final router = context.router;

                          final searchQuery = state.searchQuery;
                          VoidCallback? onPressed;

                          onPressed = state.loading ||
                                  searchQuery == null ||
                                  searchQuery.isEmpty
                              ? null
                              : () {
                                  FocusManager.instance.primaryFocus?.unfocus();

                                  context.read<ScannerBloc>().add(
                                        const ScannerEvent.handleScanner(
                                          [],
                                          [],
                                        ),
                                      );
                                  router
                                      .push(BeneficiaryRegistrationWrapperRoute(
                                    initialState:
                                        BeneficiaryRegistrationCreateState(
                                      searchQuery: state.searchQuery,
                                    ),
                                  ));
                                  searchController.clear();
                                  final bloc =
                                      context.read<SearchHouseholdsBloc>();
                                  bloc.add(
                                    const SearchHouseholdsClearEvent(),
                                  );
                                };

                          return DigitElevatedButton(
                            onPressed: onPressed,
                            child: Center(
                              child: Text(localizations.translate(
                                i18.searchBeneficiary.beneficiaryAddActionLabel,
                              )),
                            ),
                          );
                        },
                      ),
                      DigitOutlineIconButton(
                        buttonStyle: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {
                          context.router.push(QRScannerRoute(
                            quantity: 1,
                            isGS1code: false,
                            sinlgleValue: true,
                          ));
                        },
                        icon: Icons.qr_code,
                        label: localizations.translate(
                          i18.deliverIntervention.scannerLabel,
                        ),
                      ),
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
