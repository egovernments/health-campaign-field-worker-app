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
import 'package:registration_bloc/bloc/registration_bloc.dart';
import 'package:registration_bloc/service/registration_service.dart';
import 'package:registration_bloc/models/global_search_params.dart' as reg_params;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:registration_delivery/blocs/entity_create/entity_create.dart';
import 'package:registration_delivery/blocs/registration_wrapper/registration_wrapper_bloc.dart';
import 'package:registration_delivery/data/transformer_config.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:forms_engine/blocs/forms/forms.dart';
import 'package:forms_engine/router/forms_router.gm.dart';
import 'package:form_data_transformer/src/transformer_service.dart';
import 'package:registration_delivery/widgets/beneficiary/resource_card.dart';
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
  int limit = 2;


  double lat = 0.0;
  double long = 0.0;
  List<String> selectedFilters = [];


  late final RegistrationWrapperBloc blocWrapper; // Declare BlocWrapper

  @override
  void initState() {
    // Initialize the BlocWrapper with instances of SearchHouseholdsBloc, SearchMemberBloc, and ProximitySearchBloc

    Future.microtask(() {
      context.read<RegistrationBloc>().add(const RegistrationEvent.initialize());
    });
    blocWrapper = context.read<RegistrationWrapperBloc>();
    context.read<LocationBloc>().add(const LoadLocationEvent());

    final schemas = [
      RegistrationDeliverySingleton().regisrationConfig,
      RegistrationDeliverySingleton().deliveryConfig,
    ]
        .where((s) => s != null && s.trim().isNotEmpty && s.trim().toLowerCase() != 'null')
        .cast<String>()
        .toList();

    if (schemas.isNotEmpty) {
      context.read<FormsBloc>().add(FormsEvent.load(schemas: schemas));
    }

    // Listen to state changes
    // blocWrapper.stateChanges.listen((state) {
    //   if (mounted) {
    //     setState(() {
    //       searchHouseholdsState = state;
    //     });
    //   }
    // });

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
          final householdModel = createState.entities
              .whereType<HouseholdModel>()
              .firstOrNull;
          if (householdModel != null) {
            blocWrapper.add(
                RegistrationWrapperEvent.fetchDeliveryDetails(projectId: RegistrationDeliverySingleton().selectedProject!.id,selectedIndividual: null, householdWrapper: HouseholdWrapper(household: householdModel.copyWith(memberCount: 25)), beneficiaryType: RegistrationDeliverySingleton().beneficiaryType?.toValue())
            );
          }
          final currentSchema = context.read<FormsBloc>().state.cachedSchemas[context.read<FormsBloc>().state.activeSchemaKey];

          // Reset to prevent re-handling
          context.read<FormsBloc>().add(
            const FormsEvent.clearForm(schemaKey: 'REGISTRATIONFLOW'), // or create a FormsResetEvent
          );

          final pages = currentSchema?.pages.entries.toList()
            ?..sort((a, b) => (a.value.order ?? 0).compareTo(b.value.order ?? 0));

          final lastPage = pages?.isNotEmpty == true ? pages!.last.value : null;

          final nextAction = lastPage?.navigateTo;
          if (nextAction != null) {
            if(nextAction.type=='template'){
              final nextPath = routerMap[searchTemplate?.navigateTo?.name];
              if(nextPath!=null){
                context.router.push(nextPath);
              }
            }else{
              if(nextAction.name=='REGISTRATIONFLOW'){
                final pageName = context.read<FormsBloc>().state.cachedSchemas['REGISTRATIONFLOW']?.pages.entries.first.key;

                if (pageName == null) {
                  Toast.showToast(
                    context,
                    message: localizations.translate('NO_FORM_FOUND_FOR_REGISTRATION'),
                    type: ToastType.error,
                  );
                } else {
                  context.router.push(FormsRenderRoute(currentSchemaKey: 'REGISTRATIONFLOW', pageName: pageName, ));
                }
              }else{
                final pageName = context.read<FormsBloc>().state.cachedSchemas['DELIVERYFLOW']?.pages.entries.first.key;

                if (pageName == null) {
                  Toast.showToast(
                    context,
                    message: localizations.translate('NO_FORM_FOUND_FOR_DELIVERY'),
                    type: ToastType.error,
                  );
                } else {
                  context.router.push(FormsRenderRoute(currentSchemaKey: 'DELIVERYFLOW', pageName: pageName,
                    customComponents: const [
                      {
                        'resourceCard': ResourceCard()
                      }
                    ],
                  ));
                }
              }
            }
          } else {
            context.router.push( BeneficiaryAcknowledgementRoute(enableViewHousehold: true)); // fallback page
          }

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
              final modelsConfig = formState.activeSchemaKey =='DELIVERYFLOW'? (jsonConfig['delivery']
              ?['models'] as Map<String, dynamic>)
                  :jsonConfig['beneficiaryRegistration']?['models'] as Map<String, dynamic>;

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
                  "beneficiaryType": RegistrationDeliverySingleton().beneficiaryType?.toValue(),
                },
                fallbackFormDataString: jsonConfig['beneficiaryRegistration']?['fallbackModel'] as String?,
              );

              context.read<EntityCreateBloc>().add(
                EntityCreateEvent.create(entities: entities),
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
                                        blocWrapper.add(const RegistrationWrapperEvent.clear());
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
                                          blocWrapper.add(const RegistrationWrapperEvent.clear());
                                          // triggerGlobalSearchEvent();
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
                                                    ' (${blocWrapper.state.totalCount})',
                                                capitalizedFirstLetter: false,
                                                onItemDelete: () {
                                                  setState(() {
                                                    selectedFilters.remove(
                                                        selectedFilters[
                                                        index]);
                                                  });
                                                  blocWrapper.add(const RegistrationWrapperEvent.clear());
                                                  // triggerGlobalSearchEvent();
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
                          if (blocWrapper.state.householdMembers.isEmpty &&
                              !blocWrapper.state.loading)
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
                  BlocBuilder<RegistrationWrapperBloc, RegistrationWrapperState>(
                    builder: (context, blocState) {
                      final items = blocState.householdMembers;

                      return BlocListener<DigitScannerBloc, DigitScannerState>(
                        listener: (context, scannerState) {
                          if (scannerState.qrCodes.isNotEmpty) {
                            context.read<SearchBlocWrapper>().tagSearchBloc.add(
                              SearchHouseholdsEvent.searchByTag(
                                tag: scannerState.qrCodes.lastOrNull!,
                                projectId: RegistrationDeliverySingleton().projectId!,
                              ),
                            );
                          }
                        },
                        child: BlocBuilder<LocationBloc, LocationState>(
                          builder: (context, locationState) {
                            return SliverList(
                              delegate: SliverChildBuilderDelegate(
                                    (ctx, index) {
                                  // 👇 If it's the last item and loading is true, show loader
                                  if (index == items.length) {
                                    return const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Center(child: CircularProgressIndicator()),
                                    );
                                  }

                                  final i = items[index];
                                  final distance = calculateDistance(
                                    Coordinate(lat, long),
                                    Coordinate(
                                      i.household?.address?.latitude,
                                      i.household?.address?.longitude,
                                    ),
                                  );

                                  return Container(
                                    margin: const EdgeInsets.only(bottom: spacer2),
                                    child: ViewBeneficiaryCard(
                                      distance: isProximityEnabled ? distance : null,
                                      householdWrapper: i,
                                      onOpenPressed: () async {
                                        context.read<DigitScannerBloc>().add(
                                            const DigitScannerEvent.handleScanner());

                                        if ((i.tasks?.lastOrNull?.status ==
                                            Status.closeHousehold.toValue() &&
                                            (i.tasks ?? []).isNotEmpty) ||
                                            (i.projectBeneficiaries ?? []).isEmpty) {
                                          setState(() {
                                            selectedFilters = [];
                                          });
                                          blocWrapper.add(const RegistrationWrapperEvent.clear());

                                          await context.router.push(
                                            BeneficiaryRegistrationWrapperRoute(
                                              initialState: BeneficiaryRegistrationState.editHousehold(
                                                householdModel: i.household!,
                                                individualModel: i.individuals!,
                                                registrationDate: DateTime.now(),
                                                projectBeneficiaryModel:
                                                i.projectBeneficiaries?.lastOrNull,
                                                addressModel: RegistrationDeliverySingleton()
                                                    .householdType ==
                                                    HouseholdType.community
                                                    ? i.household!.address!
                                                    : i.headOfHousehold!.address!.lastOrNull!,
                                                headOfHousehold: i.headOfHousehold,
                                              ),
                                            ),
                                          );
                                        }
                                        setState(() {
                                          isProximityEnabled = false;
                                        });
                                        searchController.clear();
                                        selectedFilters.clear();
                                      },
                                    ),
                                  );
                                },
                                childCount: items.length + (blocState.loading ? 1 : 0), // 👈 Extra item if loading
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            bottomNavigationBar: ValueListenableBuilder<TextEditingValue>(
              valueListenable: searchController,
              builder: (context, value, _) {
                final isCommunity = RegistrationDeliverySingleton().householdType == HouseholdType.community;
                final isTextShort = value.text.length < 3;

                return Offstage(
                  offstage: isCommunity && isTextShort,
                  child: DigitCard(
                    margin: const EdgeInsets.only(top: spacer2),
                    padding: const EdgeInsets.all(spacer4),
                    children: [
                      DigitButton(
                        capitalizeLetters: false,
                        label: isCommunity
                            ? localizations.translate(i18.searchBeneficiary.clfAddActionLabel)
                            : localizations.translate(i18.searchBeneficiary.beneficiaryAddActionLabel),
                        mainAxisSize: MainAxisSize.max,
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        isDisabled: isTextShort,
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          context.read<FormsBloc>().add(const FormsEvent.clearForm(schemaKey: 'REGISTRATIONFLOW'));

                          final pageName = context.read<FormsBloc>().state.cachedSchemas['REGISTRATIONFLOW']?.pages.entries.first.key;

                          if (pageName == null) {
                            Toast.showToast(
                              context,
                              message: localizations.translate('NO_FORM_FOUND_FOR_REGISTRATION'),
                              type: ToastType.error,
                            );
                          } else {
                            context.router.push(FormsRenderRoute(currentSchemaKey: 'REGISTRATIONFLOW', pageName: pageName, defaultValues: {
                              'administrativeArea':
                              localizations.translate(RegistrationDeliverySingleton().boundary?.code ?? ''),
                              'nameOfIndividual': value.text,
                            }));
                          }

                          context.read<DigitScannerBloc>().add(const DigitScannerEvent.handleScanner());
                          searchController.clear();
                          selectedFilters = [];
                          blocWrapper.add(const RegistrationWrapperEvent.clear());
                        },
                      ),
                      if (searchTemplate?.properties?['qrscanner']?.hidden != true)
                        DigitButton(
                          capitalizeLetters: false,
                          type: DigitButtonType.secondary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () {
                            blocWrapper.add(const RegistrationWrapperEvent.clear());
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
                          label: searchTemplate?.properties?['qrscanner']?.label != null
                              ? localizations.translate(searchTemplate!.properties!['qrscanner']!.label)
                              : localizations.translate(i18.deliverIntervention.scannerLabel),
                        ),
                    ],
                  ),
                );
              },
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
      blocWrapper.add(const RegistrationWrapperEvent.clear());
      triggerGlobalSearchEvent();
    }
  }

  void triggerGlobalSearchEvent({bool isPagination = false}) {
    if (!isPagination) {
      blocWrapper.add(const RegistrationWrapperEvent.clear());
    }

    if (isProximityEnabled ||
        selectedFilters.isNotEmpty ||
        searchController.text.isNotEmpty) {
      final params = reg_params.GlobalSearchParameters(
        filters: [
          if(searchController.text.isNotEmpty && searchController.text.length> 2)
          reg_params.SearchFilter(
            root: 'name',  // or 'individual', based on what you're searching
            field: 'givenName',
            operator: 'contains',
            value: searchController.text,
          ),
          if(isProximityEnabled)
            reg_params.SearchFilter(
              root: 'household',
              field: '',
              operator: 'within',
              value: RegistrationDeliverySingleton().maxRadius,
              coordinates: reg_params.LatLng(
                latitude: lat,
                longitude: long,
              ),
            ),
        ], // Optional: if you're resolving linked entities
        primaryModel: 'individual',
        select: ['individual', 'household', 'householdMember', 'projectBeneficiary'],  // Optional: which fields to return
        pagination: isPagination ?  reg_params.PaginationParams(limit: blocWrapper.state.limit ?? limit, offset: (blocWrapper.state.offset ?? offset) + (blocWrapper.state.limit ?? limit)) : reg_params.PaginationParams(limit: limit, offset: offset),
      );
      blocWrapper.add(
          RegistrationWrapperEvent.loadFromGlobal(searchParams: params, beneficiaryType: RegistrationDeliverySingleton().beneficiaryType?.toValue())
      );
    }
  }
}
