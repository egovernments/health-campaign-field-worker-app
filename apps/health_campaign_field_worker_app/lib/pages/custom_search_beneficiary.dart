import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:registration_delivery/registration_delivery.dart';

import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import 'package:registration_delivery/models/entities/status.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/global_search_parameters.dart';
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/back_navigation_help_header.dart';
import 'package:registration_delivery/widgets/beneficiary/view_beneficiary_card.dart';
import 'package:registration_delivery/widgets/localized.dart';
import 'package:registration_delivery/widgets/status_filter/status_filter.dart';

import '../utils/extensions/extensions.dart';
import '../widgets/beneficiary/custom_view_beneficiary_card.dart';
import 'custom_qr_scanner.dart';

@RoutePage()
class CustomSearchBeneficiaryPage extends LocalizedStatefulWidget {
  const CustomSearchBeneficiaryPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomSearchBeneficiaryPage> createState() =>
      _CustomSearchBeneficiaryPageStateState();
}

class _CustomSearchBeneficiaryPageStateState
    extends LocalizedState<CustomSearchBeneficiaryPage> {
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
              BackNavigationHelpHeaderWidget(
                showHelp: false,
              ),
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
                              RegistrationDeliverySingleton().householdType !=
                                          null &&
                                      RegistrationDeliverySingleton()
                                              .householdType ==
                                          HouseholdType.community
                                  ? i18.searchBeneficiary.searchCLFLabel
                                  : RegistrationDeliverySingleton()
                                              .beneficiaryType !=
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
                                hintText: (RegistrationDeliverySingleton()
                                            .householdType ==
                                        HouseholdType.community)
                                    ? localizations.translate(
                                        i18.searchBeneficiary.clfSearchHintText)
                                    : localizations.translate(
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
                              RegistrationDeliverySingleton()
                                              .searchHouseHoldFilter !=
                                          null &&
                                      RegistrationDeliverySingleton()
                                          .searchHouseHoldFilter!
                                          .isNotEmpty &&
                                      RegistrationDeliverySingleton()
                                              .householdType !=
                                          HouseholdType.community
                                  ? Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: kPadding),
                                        child: DigitIconButton(
                                          textDirection: TextDirection.rtl,
                                          iconText:
                                              getFilterIconNLabel()['label'],
                                          icon: getFilterIconNLabel()['icon'],
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
                                                      kPadding / 2),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            kPadding / 2),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              const DigitColors()
                                                                  .cloudGray),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              kPadding / 2),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            localizations.translate(
                                                                getStatus(
                                                                    selectedFilters[
                                                                        index])),
                                                            style: TextStyle(
                                                                color: const DigitColors()
                                                                    .davyGray)),
                                                        Text(
                                                            ' (${searchHouseholdsState.totalResults})',
                                                            style: TextStyle(
                                                                color: const DigitColors()
                                                                    .davyGray)),
                                                        const SizedBox(
                                                            width: kPadding),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedFilters.remove(
                                                                  selectedFilters[
                                                                      index]);
                                                            });
                                                            blocWrapper
                                                                .clearEvent();
                                                            triggerGlobalSearchEvent();
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  const DigitColors()
                                                                      .davyGray,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          kPadding /
                                                                              2),
                                                            ),
                                                            child: Icon(
                                                              Icons.close,
                                                              color:
                                                                  const DigitColors()
                                                                      .white,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ));
                                            }),
                                      ),
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
                          description: (RegistrationDeliverySingleton()
                                      .householdType ==
                                  HouseholdType.community)
                              ? localizations
                                  .translate(i18.searchBeneficiary.clfInfoTitle)
                              : localizations.translate(
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
                            margin: const EdgeInsets.only(bottom: kPadding),
                            child: CustomViewBeneficiaryCard(
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
                                              addressModel:
                                                  (RegistrationDeliverySingleton()
                                                              .householdType ==
                                                          HouseholdType
                                                              .community)
                                                      ? i.household!.address!
                                                      : i.headOfHousehold!
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
        bottomNavigationBar: Offstage(
          offstage: RegistrationDeliverySingleton().householdType ==
              HouseholdType.community,
          child: SizedBox(
            height: 80,
            child: Card(
              margin: const EdgeInsets.all(0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                child: Column(
                  children: [
                    context.isRegistrar
                        ? DigitElevatedButton(
                            onPressed: searchHouseholdsState.loading
                                ? null
                                : () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    context.read<DigitScannerBloc>().add(
                                          const DigitScannerEvent
                                              .handleScanner(),
                                        );
                                    context.router.push(
                                        BeneficiaryRegistrationWrapperRoute(
                                      initialState:
                                          BeneficiaryRegistrationCreateState(
                                        searchQuery:
                                            searchHouseholdsState.searchQuery,
                                      ),
                                    ));
                                    searchController.clear();
                                    selectedFilters = [];
                                    blocWrapper.clearEvent();
                                  },
                            child: Center(
                              child: Text(localizations.translate(
                                i18.searchBeneficiary.beneficiaryAddActionLabel,
                              )),
                            ),
                          )
                        : const Offstage(),
                    context.isRegistrar
                        ? const Offstage()
                        : DigitOutlineIconButton(
                            buttonStyle: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            onPressed: () {
                              blocWrapper.clearEvent();
                              selectedFilters = [];
                              searchController.clear();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CustomDigitScannerPage(
                                    quantity: 1,
                                    isGS1code: false,
                                    singleValue: true,
                                    manualEnabled: true,
                                  ),
                                  settings:
                                      const RouteSettings(name: '/qr-scanner'),
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
    var filters = await DigitDialog.show(context,
        options: DigitDialogOptions(
          titlePadding: EdgeInsets.zero,
          dialogPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          barrierDismissible: true,
          content: StatusFilter(
            selectedFilters: selectedFilters,
            titleIcon: Icon(getFilterIconNLabel()['icon'],
                color: const DigitColors().burningOrange),
            titleText: getFilterIconNLabel()['label'],
            isCloseIcon: true,
          ),
        ));

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
          householdType: RegistrationDeliverySingleton().householdType,
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
          householdType: RegistrationDeliverySingleton().householdType,
        )));
      }
    }
  }
}
