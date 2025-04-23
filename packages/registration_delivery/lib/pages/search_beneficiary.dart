import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
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
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../blocs/app_localization.dart';
import '../blocs/unique_id/unique_id.dart';
import '../models/entities/status.dart';
import '../router/registration_delivery_router.gm.dart';
import '../utils/global_search_parameters.dart';
import '../utils/utils.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/beneficiary/id_count_alert.dart';
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
  bool isProximityEnabled = false, isBeneficiaryIdSearchEnabled = false;
  int offset = 0;
  int limit = 10;

  double lat = 0.0;
  double long = 0.0;
  List<String> selectedFilters = [];
  bool _isProgressDialogVisible = false;
  final ProgressDialog _progressDialog = ProgressDialog();

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
    _progressDialog.dispose();
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
                            style: textTheme.headingXl.copyWith(
                              color: theme.colorTheme.primary.primary2,
                            ),
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
                              Row(
                                children: [
                                  locationState.latitude != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.all(spacer2),
                                          child: DigitSwitch(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            label:
                                                (RegistrationDeliverySingleton()
                                                            .householdType ==
                                                        HouseholdType.community)
                                                    ? localizations.translate(
                                                        i18.searchBeneficiary
                                                            .communityProximityLabel,
                                                      )
                                                    : localizations.translate(
                                                        i18.searchBeneficiary
                                                            .proximityLabel,
                                                      ),
                                            value: isProximityEnabled,
                                            onChanged: (value) {
                                              searchController.clear();
                                              setState(() {
                                                isProximityEnabled = value;
                                                lat = locationState.latitude!;
                                                long = locationState.longitude!;
                                              });

                                              if (locationState
                                                      .hasPermissions &&
                                                  value &&
                                                  locationState.latitude !=
                                                      null &&
                                                  locationState.longitude !=
                                                      null &&
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
                                    child: DigitSwitch(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      label: localizations.translate(
                                        i18.searchBeneficiary
                                            .beneficiaryIdSearchLabel,
                                      ),
                                      value: isBeneficiaryIdSearchEnabled,
                                      onChanged: (value) {
                                        setState(() {
                                          isBeneficiaryIdSearchEnabled = value;
                                        });
                                        blocWrapper.clearEvent();
                                        triggerGlobalSearchEvent();
                                      },
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(spacer2),
                                child: DigitSearchBar(
                                  controller: searchController,
                                  keyboardType: !isBeneficiaryIdSearchEnabled
                                      ? TextInputType.text
                                      : TextInputType.number,
                                  hintText: !isBeneficiaryIdSearchEnabled
                                      ? (RegistrationDeliverySingleton()
                                                  .householdType ==
                                              HouseholdType.community)
                                          ? localizations.translate(i18
                                              .searchBeneficiary
                                              .clfSearchHintText)
                                          : localizations.translate(
                                              i18.searchBeneficiary
                                                  .beneficiarySearchHintText,
                                            )
                                      : localizations.translate(
                                          i18.searchBeneficiary
                                              .beneficiaryIdSearchHintText,
                                        ),
                                  textCapitalization: TextCapitalization.words,
                                  onChanged: (value) {
                                    if (value.isEmpty ||
                                            isBeneficiaryIdSearchEnabled
                                        ? value.trim().length > 5
                                        : value.trim().length > 2) {
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
                                          .isNotEmpty &&
                                      RegistrationDeliverySingleton()
                                              .householdType !=
                                          HouseholdType.community
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
                                                  capitalizedFirstLetter: false,
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
                            description: (RegistrationDeliverySingleton()
                                        .householdType ==
                                    HouseholdType.community)
                                ? localizations.translate(
                                    i18.searchBeneficiary.clfInfoTitle)
                                : localizations.translate(
                                    i18.searchBeneficiary
                                        .beneficiaryInfoDescription,
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
              BlocListener<UniqueIdBloc, UniqueIdState>(
                listener: (context, state) {
                  state.maybeWhen(
                      orElse: () {},
                      idCount: (availableIdCount, totalCount) {
                        if (availableIdCount != 0 &&
                            availableIdCount <
                                RegistrationDeliverySingleton()
                                    .beneficiaryIdMinCount!) {
                          showLowIdsAlert(
                              context: context,
                              availableCount: availableIdCount,
                              localizations: localizations,
                              shouldProceedFurther: (bool proceed) {
                                if (proceed) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  context.read<DigitScannerBloc>().add(
                                        const DigitScannerEvent.handleScanner(),
                                      );
                                  context.router
                                      .push(BeneficiaryRegistrationWrapperRoute(
                                    initialState:
                                        BeneficiaryRegistrationCreateState(
                                      searchQuery:
                                          searchHouseholdsState.searchQuery,
                                    ),
                                  ));
                                  searchController.clear();
                                  selectedFilters = [];
                                  blocWrapper.clearEvent();
                                }
                              });
                        } else if (availableIdCount >=
                            RegistrationDeliverySingleton()
                                .beneficiaryIdMinCount!) {
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
                          selectedFilters = [];
                          blocWrapper.clearEvent();
                        }
                        if (availableIdCount <= 0) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showNoIdsAlert(
                                context: context,
                                showSkip: true,
                                localizations: localizations,
                                shouldProceedFurther: (bool skip) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  context.read<DigitScannerBloc>().add(
                                        const DigitScannerEvent.handleScanner(),
                                      );
                                  context.router
                                      .push(BeneficiaryRegistrationWrapperRoute(
                                    initialState:
                                        BeneficiaryRegistrationCreateState(
                                      searchQuery:
                                          searchHouseholdsState.searchQuery,
                                    ),
                                  ));
                                  searchController.clear();
                                  selectedFilters = [];
                                  blocWrapper.clearEvent();
                                });
                          });
                        }
                      },
                      ids: (ids) {
                        _isProgressDialogVisible = false;
                      },
                      fetching: (currentCount, totalCount) {
                        if (_isProgressDialogVisible == false) {
                          _progressDialog.showProgressDialog(
                            context: context,
                            localizations:
                                RegistrationDeliveryLocalization.of(context),
                            currentCount: currentCount,
                            totalCount: totalCount,
                            theme: Theme.of(context),
                          );
                          _isProgressDialogVisible = true;
                        } else {
                          // To update progress:
                          _progressDialog.updateProgressDialog(
                            currentCount: currentCount,
                            totalCount: totalCount,
                          );
                        }
                      },
                      failed: (String? error) {
                        _progressDialog.closeProgressDialog();
                        _isProgressDialogVisible = false;
                        if (error != null) {
                          Toast.showToast(context,
                              message: localizations.translate(
                                i18.beneficiaryDetails.failedBeneficiaryIds,
                              ),
                              type: ToastType.error);
                        }
                      },
                      limitExceeded: (String? error) {
                        _progressDialog.closeProgressDialog();
                        _isProgressDialogVisible = false;
                        if (error != null) {
                          showCustomPopup(
                              context: context,
                              builder: (ctx) {
                                return Popup(
                                  type: PopUpType.alert,
                                  inlineActions: true,
                                  onCrossTap: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  actions: [
                                    DigitButton(
                                      capitalizeLetters: false,
                                      type: DigitButtonType.primary,
                                      size: DigitButtonSize.large,
                                      mainAxisSize: MainAxisSize.max,
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                        context.read<UniqueIdBloc>().add(
                                              const UniqueIdEvent
                                                  .fetchUniqueIdsFromServer(
                                                  reFetch: true),
                                            );
                                      },
                                      label: localizations.translate(i18
                                          .beneficiaryDetails
                                          .beneficiaryIdsReFetch),
                                    ),
                                    DigitButton(
                                      capitalizeLetters: false,
                                      type: DigitButtonType.secondary,
                                      size: DigitButtonSize.large,
                                      mainAxisSize: MainAxisSize.max,
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      label: localizations.translate(
                                        i18.common.corecommonclose,
                                      ),
                                    ),
                                  ],
                                  title: localizations.translate(i18
                                      .beneficiaryDetails
                                      .beneficiaryIdsLimitError),
                                );
                              });
                        }
                      },
                      noInternet: () {
                        _progressDialog.closeProgressDialog();
                        _isProgressDialogVisible = false;
                        showCustomPopup(
                            context: context,
                            builder: (ctx) {
                              return Popup(
                                type: PopUpType.alert,
                                inlineActions: true,
                                onCrossTap: () {
                                  Navigator.of(ctx).pop();
                                },
                                actions: [
                                  DigitButton(
                                    capitalizeLetters: false,
                                    type: DigitButtonType.primary,
                                    size: DigitButtonSize.large,
                                    mainAxisSize: MainAxisSize.max,
                                    onPressed: () {
                                      Navigator.of(ctx).pop();

                                      context.read<UniqueIdBloc>().add(
                                            const UniqueIdEvent
                                                .fetchUniqueIdsFromServer(),
                                          );
                                    },
                                    label: localizations.translate(
                                      i18.common.coreCommonDataSyncRetry,
                                    ),
                                  ),
                                  DigitButton(
                                    capitalizeLetters: false,
                                    type: DigitButtonType.secondary,
                                    size: DigitButtonSize.large,
                                    mainAxisSize: MainAxisSize.max,
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    label: localizations.translate(
                                      i18.common.corecommonclose,
                                    ),
                                  ),
                                ],
                                title: localizations
                                    .translate(i18.common.coreCommonNoInternet),
                                description: localizations.translate(i18
                                    .beneficiaryDetails
                                    .noInternetBeneficiaryIdsText),
                              );
                            });
                      });
                },
                child: BlocListener<DigitScannerBloc, DigitScannerState>(
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
                                                registrationDate:
                                                    DateTime.now(),
                                                projectBeneficiaryModel:
                                                    (i.projectBeneficiaries ??
                                                                [])
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
                                                        : i
                                                            .headOfHousehold!
                                                            .address!
                                                            .lastOrNull!,
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
              ),
            ],
          ),
        ),
        bottomNavigationBar: Offstage(
          offstage: RegistrationDeliverySingleton().householdType ==
                  HouseholdType.community &&
              searchController.text.length < 3,
          child: DigitCard(
              margin: const EdgeInsets.only(top: spacer2),
              padding: const EdgeInsets.all(spacer4),
              children: [
                DigitButton(
                  capitalizeLetters: false,
                  label: (RegistrationDeliverySingleton().householdType ==
                          HouseholdType.community)
                      ? localizations
                          .translate(i18.searchBeneficiary.clfAddActionLabel)
                      : localizations.translate(
                          i18.searchBeneficiary.beneficiaryAddActionLabel,
                        ),
                  mainAxisSize: MainAxisSize.max,
                  type: DigitButtonType.primary,
                  size: DigitButtonSize.large,
                  isDisabled: (searchHouseholdsState.searchQuery != null &&
                              searchHouseholdsState.searchQuery!.isNotEmpty) ||
                          (searchHouseholdsState.beneficiaryIdQuery != null &&
                              searchHouseholdsState
                                  .beneficiaryIdQuery!.isNotEmpty)
                      ? false
                      : true,
                  onPressed: () {
                    if (!RegistrationDeliverySingleton()
                        .idTypeOptions!
                        .contains(
                            IdentifierTypes.uniqueBeneficiaryID.toValue())) {
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
                    } else {
                      fetchBeneficiaryIdCount();
                    }
                  },
                ),
                DigitButton(
                  capitalizeLetters: false,
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
        blocWrapper.individualGlobalSearchBloc.add(
            SearchHouseholdsEvent.individualGlobalSearch(
                globalSearchParams: GlobalSearchParameters(
                    isProximityEnabled: isProximityEnabled,
                    latitude: lat,
                    projectId: RegistrationDeliverySingleton().projectId!,
                    longitude: long,
                    maxRadius: RegistrationDeliverySingleton().maxRadius,
                    nameSearch: !isBeneficiaryIdSearchEnabled
                        ? searchController.text.trim().length > 2
                            ? searchController.text.trim()
                            : blocWrapper.searchHouseholdsBloc.state.searchQuery
                        : null,
                    filter: selectedFilters,
                    offset: isPagination
                        ? blocWrapper.individualGlobalSearchBloc.state.offset
                        : offset,
                    limit: isPagination
                        ? blocWrapper.individualGlobalSearchBloc.state.limit
                        : limit,
                    householdType:
                        RegistrationDeliverySingleton().householdType,
                    identifierId: isBeneficiaryIdSearchEnabled
                        ? searchController.text.trim().length > 2
                            ? searchController.text.trim()
                            : blocWrapper
                                .searchHouseholdsBloc.state.beneficiaryIdQuery
                        : null)));
      }
    } else {
      if (isProximityEnabled ||
          selectedFilters.isNotEmpty ||
          searchController.text.isNotEmpty) {
        blocWrapper.houseHoldGlobalSearchBloc.add(
            SearchHouseholdsEvent.houseHoldGlobalSearch(
                globalSearchParams: GlobalSearchParameters(
                    isProximityEnabled: isProximityEnabled,
                    latitude: lat,
                    longitude: long,
                    projectId: RegistrationDeliverySingleton().projectId!,
                    maxRadius: RegistrationDeliverySingleton().maxRadius,
                    nameSearch: !isBeneficiaryIdSearchEnabled
                        ? searchController.text.trim().length > 2
                            ? searchController.text.trim()
                            : blocWrapper.searchHouseholdsBloc.state.searchQuery
                        : null,
                    filter: selectedFilters,
                    offset: isPagination
                        ? blocWrapper.houseHoldGlobalSearchBloc.state.offset
                        : offset,
                    limit: isPagination
                        ? blocWrapper.houseHoldGlobalSearchBloc.state.limit
                        : limit,
                    householdType:
                        RegistrationDeliverySingleton().householdType,
                    identifierId: isBeneficiaryIdSearchEnabled
                        ? searchController.text.trim().length > 5
                            ? searchController.text.trim()
                            : blocWrapper
                                .searchHouseholdsBloc.state.beneficiaryIdQuery
                        : null)));
      }
    }
  }

  void fetchBeneficiaryIdCount() {
    context.read<UniqueIdBloc>().add(const UniqueIdEvent.fetchIdCount());
  }
}
