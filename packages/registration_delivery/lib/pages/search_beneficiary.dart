import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../router/registration_delivery_router.gm.dart';
import '../utils/utils.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/beneficiary/view_beneficiary_card.dart';
import '../widgets/localized.dart';

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
      builder: (context, isKeyboardVisible) => Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification) {
              final metrics = scrollNotification.metrics;
              if (metrics.atEdge &&
                  isProximityEnabled &&
                  searchController.text == '' &&
                  metrics.pixels != 0) {
                // [TODO: Handle the null check at Bloc level for Event parameters
                blocWrapper.proximitySearchBloc
                    .add(SearchHouseholdsEvent.searchByProximity(
                  latitude: lat,
                  longititude: long,
                  projectId: RegistrationDeliverySingleton().projectId!,
                  maxRadius: RegistrationDeliverySingleton().maxRadius!,
                  offset: blocWrapper.proximitySearchBloc.state.offset,
                  limit: blocWrapper.proximitySearchBloc.state.limit,
                ));
              } else if (metrics.atEdge &&
                  searchController.text != '' &&
                  metrics.pixels != 0) {
                blocWrapper.searchByHeadBloc
                    .add(SearchHouseholdsEvent.searchByHouseholdHead(
                  searchText: searchController.text,
                  projectId: RegistrationDeliverySingleton().projectId!,
                  isProximityEnabled: isProximityEnabled,
                  offset: blocWrapper.searchByHeadBloc.state.offset,
                  limit: blocWrapper.searchByHeadBloc.state.limit,
                ));
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
                              RegistrationDeliverySingleton().beneficiaryType !=
                                      BeneficiaryType.individual
                                  ? i18.searchBeneficiary.statisticsLabelText
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
                                textCapitalization: TextCapitalization.words,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    blocWrapper.clearEvent();
                                  }
                                  if (value.trim().length < 2 &&
                                      !isProximityEnabled) {
                                    blocWrapper.clearEvent();

                                    return;
                                  } else if (isProximityEnabled &&
                                      value.trim().length < 2) {
                                    blocWrapper.proximitySearchBloc.add(
                                      SearchHouseholdsEvent.searchByProximity(
                                        latitude: locationState.latitude!,
                                        longititude: locationState.longitude!,
                                        projectId:
                                            RegistrationDeliverySingleton()
                                                .projectId!,
                                        maxRadius:
                                            RegistrationDeliverySingleton()
                                                .maxRadius!,
                                        offset: offset,
                                        limit: limit,
                                      ),
                                    );
                                  } else {
                                    blocWrapper.searchHouseholdsBloc.add(
                                      const SearchHouseholdsClearEvent(),
                                    );
                                    blocWrapper.searchByHeadBloc.add(
                                      SearchHouseholdsEvent
                                          .searchByHouseholdHead(
                                        searchText: value,
                                        projectId:
                                            RegistrationDeliverySingleton()
                                                .projectId!,
                                        isProximityEnabled: isProximityEnabled,
                                        latitude: locationState.latitude,
                                        longitude: locationState.longitude,
                                        maxRadius:
                                            RegistrationDeliverySingleton()
                                                .maxRadius,
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
                                              long = locationState.longitude!;
                                            });

                                            if (locationState.hasPermissions &&
                                                value &&
                                                locationState.latitude !=
                                                    null &&
                                                locationState.longitude !=
                                                    null &&
                                                RegistrationDeliverySingleton()
                                                        .maxRadius !=
                                                    null &&
                                                isProximityEnabled) {
                                              blocWrapper.proximitySearchBloc
                                                  .add(
                                                SearchHouseholdsEvent
                                                    .searchByProximity(
                                                  latitude:
                                                      locationState.latitude!,
                                                  longititude:
                                                      locationState.longitude!,
                                                  projectId:
                                                      RegistrationDeliverySingleton()
                                                          .projectId!,
                                                  maxRadius:
                                                      RegistrationDeliverySingleton()
                                                          .maxRadius!,
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
                            i18.searchBeneficiary.beneficiaryInfoDescription,
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
              BlocListener<DigitScannerBloc, DigitScannerState>(
                listener: (context, scannerState) {
                  blocWrapper.tagSearchBloc.add(
                    SearchHouseholdsEvent.searchByTag(
                      tag: scannerState.qrCodes.isNotEmpty
                          ? scannerState.qrCodes.lastOrNull!
                          : '',
                      projectId: RegistrationDeliverySingleton().projectId!,
                    ),
                  );
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
                                    context.read<DigitScannerBloc>();

                                scannerBloc.add(
                                  const DigitScannerEvent.handleScanner(),
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
              ),
            ],
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
                  DigitElevatedButton(
                    onPressed: searchHouseholdsState.searchQuery != null &&
                            searchHouseholdsState.searchQuery!.isNotEmpty
                        ? () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            context.read<DigitScannerBloc>().add(
                                  const DigitScannerEvent.handleScanner(),
                                );
                            context.router
                                .push(BeneficiaryRegistrationWrapperRoute(
                              initialState: BeneficiaryRegistrationCreateState(
                                searchQuery: searchHouseholdsState.searchQuery,
                              ),
                            ));
                            searchController.clear();
                            blocWrapper.clearEvent();
                          }
                        : null,
                    child: Center(
                      child: Text(localizations.translate(
                        i18.searchBeneficiary.beneficiaryAddActionLabel,
                      )),
                    ),
                  ),
                  DigitOutlineIconButton(
                    buttonStyle: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      blocWrapper.clearEvent();
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
      ),
    );
  }
}
