import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_chip.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/switch.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:registration_delivery/blocs/entity_create/entity_create.dart';
import 'package:registration_delivery/data/transformer_config.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:forms_engine/blocs/forms/forms.dart';
import 'package:forms_engine/router/forms_router.gm.dart';
import 'package:form_data_transformer/src/transformer_service.dart';
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
    final pageKey = SearchBeneficiaryRoute.name.replaceAll('Route', '');
    final searchTemplate = RegistrationDeliverySingleton().templateConfigs?[pageKey];
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return BlocListener<EntityCreateBloc, EntityCreateState>(
      listener: (context, createState) {
        if (createState is EntityCreateLoadingState) {
        }else if (createState is EntityCreatePersistedState ) {
          Navigator.of(context, rootNavigator: true).pop();
          context.router.push( BeneficiaryAcknowledgementRoute(enableViewHousehold: false));
        }else if(createState is EntityCreateErrorState){
          Navigator.of(context, rootNavigator: true).pop();
          context.router.push( BeneficiaryErrorRoute(enableViewHousehold: false));
          if (kDebugMode) {
            print(createState.message);
          }
        }
      },
      child: BlocListener<FormsBloc, FormsState>(
        listener: (context, formState) {
          if ( formState is FormsSubmittedState ) {
            DigitLoaders.overlayLoader(context: context);

            final formData = formState.formData;
            if (formData.isEmpty) return;

            try {
              final modelsConfig = jsonConfig['beneficiaryRegistration']
              ?['models'] as Map<String, dynamic>;

              final formEntityMapper =
              FormEntityMapper(config: jsonConfig);

              final entities = formEntityMapper.mapFormToEntities(
                formValues: formData,
                modelsConfig: modelsConfig,
                context: {
                  "projectId": RegistrationDeliverySingleton().selectedProject?.id,
                  "user": RegistrationDeliverySingleton().loggedInUser,
                  "tenantId": RegistrationDeliverySingleton().selectedProject?.tenantId,
                  "selectedBoundaryCode": RegistrationDeliverySingleton().boundary?.code, // converting in json format to match nested object value as passing model will cause issue
                  'userUUID': RegistrationDeliverySingleton().loggedInUser?.uuid,
                  'householdType': RegistrationDeliverySingleton().householdType?.toValue(),
                },
                fallbackFormDataString: jsonConfig['beneficiaryRegistration']?['fallbackModel'] as String?,
              );

              context.read<EntityCreateBloc>().add(
                EntityCreateEvent.create(entities: entities),
              );
              // Reset to prevent re-handling
              context.read<FormsBloc>().add(
                const FormsEvent.clearForm(), // or create a FormsResetEvent
              );
            } catch (e) {
              Navigator.of(context, rootNavigator: true).pop();
              context.router.push( BeneficiaryErrorRoute(enableViewHousehold: false));
              print('Error: $e');
            }
          }
        },
        child: KeyboardVisibilityBuilder(
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    localizations.translate(
                                      RegistrationDeliverySingleton().householdType !=
                                          null &&
                                          RegistrationDeliverySingleton()
                                              .householdType ==
                                              HouseholdType.community
                                          ? i18.searchBeneficiary.searchCLFLabel
                                          : searchTemplate?.label!= null ? localizations.translate(searchTemplate!.label) : (RegistrationDeliverySingleton()
                                          .beneficiaryType !=
                                          BeneficiaryType.individual
                                          ? i18
                                          .searchBeneficiary.statisticsLabelText
                                          : i18.searchBeneficiary
                                          .searchIndividualLabelText),
                                    ),
                                    style: textTheme.headingXl.copyWith(
                                      color: theme.colorTheme.primary.primary2,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  if(searchTemplate?.description!= null && searchTemplate!.description!.isNotEmpty)
                                  Text(
                                    localizations.translate(
                                        searchTemplate.description!
                                    ),
                                    style: textTheme.bodyS.copyWith(
                                      color: theme.colorTheme.text.secondary,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          BlocBuilder<LocationBloc, LocationState>(
                            builder: (context, locationState) {

                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if(searchTemplate
                                      ?.properties?['searchByProximity']
                                      ?.hidden !=
                                      true )
                                  locationState.latitude != null
                                      ? Padding(
                                    padding: const EdgeInsets.all(spacer2),
                                    child: DigitSwitch(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      label: (RegistrationDeliverySingleton()
                                          .householdType ==
                                          HouseholdType.community)
                                          ? localizations.translate(
                                        i18.searchBeneficiary
                                            .communityProximityLabel,
                                      )
                                          : searchTemplate
                                          ?.properties?['searchByProximity']?.label != null ? localizations.translate(searchTemplate
                                          !.properties!['searchByProximity']!.label) : localizations.translate(
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
                                      hintText: (RegistrationDeliverySingleton()
                                          .householdType ==
                                          HouseholdType.community)
                                          ? localizations.translate(i18
                                          .searchBeneficiary.clfSearchHintText)
                                          : searchTemplate
                                          ?.properties?['searchBar']?.label != null ? localizations.translate(searchTemplate
                                      !.properties!['searchBar']!.label) : localizations.translate(
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
                                  if(searchTemplate
                                      ?.properties?['filter']
                                      ?.hidden !=
                                      true )
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
                                        label: searchTemplate
                                          ?.properties?['filter']?.label !=null ? localizations.translate(searchTemplate
                                            !.properties!['filter']!.label): getFilterIconNLabel()['label'],
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
                      isDisabled: searchHouseholdsState.searchQuery != null &&
                          searchHouseholdsState.searchQuery!.isNotEmpty
                          ? false
                          : searchTemplate
                  ?.properties?['BeneficiaryRegistrationButton']
                  ?.autoEnable ==
                  true ? false : true,
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<FormsBloc>().add(const FormsEvent.clearForm());
                        final pageName = context
                            .read<FormsBloc>()
                            .state
                            .schema
                            ?.pages
                            .entries
                            .first
                            .key;

                        if (pageName == null) {
                          Toast.showToast(context,
                              message: 'no form found please check configuration',
                              type: ToastType.error);
                        } else {
                          context.router.push(FormsRenderRoute(pageName: pageName, defaultValues: {
                            'administrativeArea': localizations.translate(RegistrationDeliverySingleton().boundary?.code ?? ''),
                            'nameOfIndividual' : searchHouseholdsState.searchQuery,
                          }));
                        }

                        context.read<DigitScannerBloc>().add(
                              const DigitScannerEvent.handleScanner(),
                            );
                        // context.router.push(BeneficiaryRegistrationWrapperRoute(
                        //   initialState: BeneficiaryRegistrationCreateState(
                        //     searchQuery: searchHouseholdsState.searchQuery,
                        //   ),
                        // ));
                        searchController.clear();
                        selectedFilters = [];
                        blocWrapper.clearEvent();
                      },
                    ),
                    if(searchTemplate
                        ?.properties?['qrscanner']
                        ?.hidden != true)
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
                      label: searchTemplate
                          ?.properties?['qrscanner']
                          ?.label != null ? localizations.translate(searchTemplate!.properties!['qrscanner']!.label):localizations.translate(
                        i18.deliverIntervention.scannerLabel,
                      ),
                    ),
                  ]),
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
