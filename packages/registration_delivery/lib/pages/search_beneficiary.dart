import 'package:auto_route/auto_route.dart';
import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart' as reg_params;
import 'package:digit_data_converter/src/reverse_transformer_service.dart';
import 'package:digit_data_converter/src/transformer_service.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_data_model/models/templates/template_config.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/router/forms_router.gm.dart';
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
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:registration_delivery/data/transformer_config.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/widgets/beneficiary/resource_card.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../blocs/app_localization.dart';
import '../blocs/unique_id/unique_id.dart';
import '../models/entities/status.dart';
import '../router/registration_delivery_router.gm.dart';
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
  String selectedTag = "";
  double lat = 0.0;
  double long = 0.0;
  List<String> selectedFilters = [];
  bool _isProgressDialogVisible = false;
  final ProgressDialog _progressDialog = ProgressDialog();

  late final RegistrationWrapperBloc blocWrapper; // Declare BlocWrapper

  @override
  void initState() {
    // Initialize the BlocWrapper with instances of SearchHouseholdsBloc, SearchMemberBloc, and ProximitySearchBloc

    Future.microtask(() {
      context.read<CrudBloc>().add(const CrudEventInitialize());
    });
    blocWrapper = context.read<RegistrationWrapperBloc>();
    context.read<LocationBloc>().add(const LoadLocationEvent());

    final schemas = [
      RegistrationDeliverySingleton().regisrationConfig,
      RegistrationDeliverySingleton().deliveryConfig,
    ]
        .where((s) =>
            s != null &&
            s.trim().isNotEmpty &&
            s.trim().toLowerCase() != 'null')
        .cast<String>()
        .toList();

    if (schemas.isNotEmpty) {
      context.read<FormsBloc>().add(FormsEvent.load(schemas: schemas));
    }
    super.initState();
  }

  @override
  void dispose() {
    _progressDialog.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageKey = SearchBeneficiaryRoute.name.replaceAll('Route', '');
    final searchTemplate =
        RegistrationDeliverySingleton().templateConfigs?[pageKey];
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return BlocListener<RegistrationWrapperBloc, RegistrationWrapperState>(
      listener: (context, createState) {
        if (createState.lastAction == RegistrationWrapperActionType.created ||
            createState.lastAction == RegistrationWrapperActionType.updated ||
            createState.lastAction ==
                RegistrationWrapperActionType.createAndUpdate) {
          Navigator.of(context, rootNavigator: true).pop();
          final householdModel =
              createState.householdMembers.firstOrNull?.household;
          final individualModel = createState
              .householdMembers.firstOrNull?.individuals?.firstOrNull;
          final taskModel =
              createState.householdMembers.firstOrNull?.tasks?.firstOrNull;

          if (createState.lastAction == RegistrationWrapperActionType.created &&
              individualModel != null &&
              individualModel.identifiers != null &&
              individualModel.identifiers?.first.identifierId != null &&
              individualModel.identifiers?.first.identifierType ==
                  IdentifierTypes.uniqueBeneficiaryID.toValue()) {
            context.read<UniqueIdBloc>().add(UniqueIdEvent.updateStatus(
                id: individualModel.identifiers!.first.identifierId!));
          }

          if (householdModel != null) {
            blocWrapper.add(RegistrationWrapperEvent.fetchDeliveryDetails(
                projectId: RegistrationDeliverySingleton().selectedProject!.id,
                selectedIndividual: null,
                householdWrapper: HouseholdWrapper(household: householdModel),
                beneficiaryType: RegistrationDeliverySingleton()
                    .beneficiaryType
                    ?.toValue()));
          }
          if (taskModel != null) {
            blocWrapper.add(RegistrationWrapperEvent.fetchDeliveryDetails(
                projectId: RegistrationDeliverySingleton().selectedProject!.id,
                selectedIndividual: null,
                householdWrapper: HouseholdWrapper(tasks: [taskModel]),
                beneficiaryType: RegistrationDeliverySingleton()
                    .beneficiaryType
                    ?.toValue()));
          }
          final currentSchema = context
              .read<FormsBloc>()
              .state
              .cachedSchemas[context.read<FormsBloc>().state.activeSchemaKey];

          // Reset to prevent re-handling
          context.read<FormsBloc>().add(
                const FormsEvent.clearForm(
                    schemaKey:
                        'REGISTRATIONFLOW'), // or create a FormsResetEvent
              );

          final pages = currentSchema?.pages.entries.toList()
            ?..sort(
                (a, b) => (a.value.order ?? 0).compareTo(b.value.order ?? 0));

          final lastPage = pages?.isNotEmpty == true ? pages!.last.value : null;

          final nextAction = lastPage?.navigateTo;
          if (nextAction != null) {
            if (nextAction.type == 'template') {
              final nextPath = routerMap[nextAction.name];
              if (nextPath != null) {
                context.router.push(nextPath);
              }
            } else {
              if (nextAction.name == 'REGISTRATIONFLOW') {
                final pageName = context
                    .read<FormsBloc>()
                    .state
                    .cachedSchemas['REGISTRATIONFLOW']
                    ?.pages
                    .entries
                    .first
                    .key;

                if (pageName == null) {
                  Toast.showToast(
                    context,
                    message: localizations
                        .translate('NO_FORM_FOUND_FOR_REGISTRATION'),
                    type: ToastType.error,
                  );
                } else {
                  context.router.push(FormsRenderRoute(
                      currentSchemaKey: 'REGISTRATIONFLOW',
                      pageName: pageName,
                      defaultValues: {
                        'administrativeArea': localizations.translate(
                            RegistrationDeliverySingleton().boundary?.code ??
                                '')
                      }));
                }
              } else {
                final pageName = context
                    .read<FormsBloc>()
                    .state
                    .cachedSchemas['DELIVERYFLOW']
                    ?.pages
                    .entries
                    .first
                    .key;

                if (pageName == null) {
                  Toast.showToast(
                    context,
                    message:
                        localizations.translate('NO_FORM_FOUND_FOR_DELIVERY'),
                    type: ToastType.error,
                  );
                } else {
                  context.router.push(FormsRenderRoute(
                    currentSchemaKey: 'DELIVERYFLOW',
                    pageName: pageName,
                    defaultValues: {
                      'administrativeArea': localizations.translate(
                          RegistrationDeliverySingleton().boundary?.code ?? '')
                    },
                    customComponents: const [
                      {'resourceCard': ResourceCard()}
                    ],
                  ));
                }
              }
            }
          } else {
            context.router.push(BeneficiaryAcknowledgementRoute(
                enableViewHousehold: true)); // fallback page
          }
        } else if (createState.error != null) {
          Navigator.of(context, rootNavigator: true).pop();
          // Reset to prevent re-handling
          context.read<FormsBloc>().add(
                const FormsEvent.clearForm(
                    schemaKey:
                        'REGISTRATIONFLOW'), // or create a FormsResetEvent
              );
          context.router
              .push(BeneficiaryErrorRoute(enableViewHousehold: false));
          if (kDebugMode) {
            print(createState.error);
          }
        }
      },
      child: BlocListener<FormsBloc, FormsState>(
        listener: (context, formState) {
          if (formState is FormsSubmittedState) {
            DigitLoaders.overlayLoader(context: context);

            final formData = formState.formData;
            if (formData.isEmpty) return;

            try {
              if (formState.isEdit) {
                final formEntityMapper = FormEntityMapper(config: jsonConfig);

                final householdMember =
                    blocWrapper.state.householdMembers.firstOrNull;
                final household = householdMember?.household;
                final projectBeneficiary =
                    householdMember?.projectBeneficiaries?.firstOrNull;

                final individual = householdMember?.individuals?.firstOrNull;

                final member = householdMember?.members?.firstOrNull;

                final modelsConfig = formState.activeSchemaKey == 'DELIVERYFLOW'
                    ? (jsonConfig['delivery']?['models']
                        as Map<String, dynamic>)
                    : jsonConfig['beneficiaryRegistration']?['models']
                        as Map<String, dynamic>;

                try {
                  final entities = formEntityMapper.updateEntitiesFromForm(
                    modelsConfig: modelsConfig,
                    formValues: formData,
                    existingModels: [
                      if (household != null) household,
                      if (individual != null) individual,
                      if (projectBeneficiary != null) projectBeneficiary,
                      if (member != null) member
                    ],
                    context: {
                      "projectId":
                          RegistrationDeliverySingleton().selectedProject?.id,
                      "user": RegistrationDeliverySingleton().loggedInUser,
                      "tenantId": RegistrationDeliverySingleton()
                          .selectedProject
                          ?.tenantId,
                      "selectedBoundaryCode":
                          RegistrationDeliverySingleton().boundary?.code,
                      // converting in json format to match nested object value as passing model will cause issue
                      'userUUID':
                          RegistrationDeliverySingleton().loggedInUser?.uuid,
                      'householdType': RegistrationDeliverySingleton()
                          .householdType
                          ?.toValue(),
                      "beneficiaryType": RegistrationDeliverySingleton()
                          .beneficiaryType
                          ?.toValue(),
                      if (household != null) 'householdModel': household,
                      if (projectBeneficiary != null)
                        "projectBeneficiaryModel": projectBeneficiary,
                    },
                  );

                  final toCreate = <EntityModel>[];
                  final toUpdate = [...entities];

                  // If projectBeneficiary is null, mark for creation
                  if (projectBeneficiary == null) {
                    final projectBeneficiariesToCreate = entities
                        .where((e) => e.runtimeType == ProjectBeneficiaryModel)
                        .toList();

                    toCreate.addAll(projectBeneficiariesToCreate);

                    // Remove from update list
                    toUpdate.removeWhere(
                        (e) => projectBeneficiariesToCreate.contains(e));
                  }

                  blocWrapper.add(
                    RegistrationWrapperEvent.createAndUpdate(
                      entitiesToCreate: toCreate,
                      entitiesToUpdate: toUpdate,
                    ),
                  );
                } catch (e) {
                  Navigator.of(context, rootNavigator: true).pop();
                  // Reset to prevent re-handling
                  context.read<FormsBloc>().add(
                        const FormsEvent.clearForm(
                            schemaKey:
                                'REGISTRATIONFLOW'), // or create a FormsResetEvent
                      );
                  context.router
                      .push(BeneficiaryErrorRoute(enableViewHousehold: false));
                }
              } else {
                final modelsConfig = formState.activeSchemaKey == 'DELIVERYFLOW'
                    ? (jsonConfig['delivery']?['models']
                        as Map<String, dynamic>)
                    : jsonConfig['beneficiaryRegistration']?['models']
                        as Map<String, dynamic>;

                final fallBackModel =
                    formState.activeSchemaKey == 'DELIVERYFLOW'
                        ? (jsonConfig['delivery']?['fallbackModel'] as String?)
                        : jsonConfig['beneficiaryRegistration']
                            ?['fallbackModel'] as String?;

                final formEntityMapper = FormEntityMapper(config: jsonConfig);

                final householdMember =
                    blocWrapper.state.householdMembers.firstOrNull;
                final household = householdMember?.household?.toMap();
                final projectBeneficiary =
                    householdMember?.projectBeneficiaries?.firstOrNull?.toMap();

                final entities = formEntityMapper.mapFormToEntities(
                  formValues: formData,
                  modelsConfig: modelsConfig,
                  context: {
                    "projectId":
                        RegistrationDeliverySingleton().selectedProject?.id,
                    "user": RegistrationDeliverySingleton().loggedInUser,
                    "tenantId": RegistrationDeliverySingleton()
                        .selectedProject
                        ?.tenantId,
                    "selectedBoundaryCode":
                        RegistrationDeliverySingleton().boundary?.code,
                    // converting in json format to match nested object value as passing model will cause issue
                    'userUUID':
                        RegistrationDeliverySingleton().loggedInUser?.uuid,
                    'householdType': RegistrationDeliverySingleton()
                        .householdType
                        ?.toValue(),
                    "beneficiaryType": RegistrationDeliverySingleton()
                        .beneficiaryType
                        ?.toValue(),
                    if (household != null) 'householdModel': household,
                    if (projectBeneficiary != null)
                      "projectBeneficiaryModel": projectBeneficiary,
                  },
                  fallbackFormDataString: fallBackModel,
                );

                blocWrapper.add(
                  RegistrationWrapperEvent.create(entities: entities),
                );
              }
            } catch (e) {
              Navigator.of(context, rootNavigator: true).pop();
              // Reset to prevent re-handling
              context.read<FormsBloc>().add(
                    const FormsEvent.clearForm(
                        schemaKey:
                            'REGISTRATIONFLOW'), // or create a FormsResetEvent
                  );
              context.router
                  .push(BeneficiaryErrorRoute(enableViewHousehold: false));
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
                header: Column(children: [
                  BackNavigationHelpHeaderWidget(
                    handleBack: () {
                      context
                          .read<RegistrationWrapperBloc>()
                          .add(const RegistrationWrapperEvent.clear());
                    },
                  ),
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
                                      RegistrationDeliverySingleton()
                                                      .householdType !=
                                                  null &&
                                              RegistrationDeliverySingleton()
                                                      .householdType ==
                                                  HouseholdType.community
                                          ? i18.searchBeneficiary.searchCLFLabel
                                          : searchTemplate?.label != null
                                              ? localizations.translate(
                                                  searchTemplate!.label)
                                              : (RegistrationDeliverySingleton()
                                                          .beneficiaryType !=
                                                      BeneficiaryType.individual
                                                  ? i18.searchBeneficiary
                                                      .statisticsLabelText
                                                  : i18.searchBeneficiary
                                                      .searchIndividualLabelText),
                                    ),
                                    style: textTheme.headingXl.copyWith(
                                      color: theme.colorTheme.primary.primary2,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  if (searchTemplate?.description != null &&
                                      searchTemplate!.description!.isNotEmpty &&
                                      localizations
                                          .translate(
                                              searchTemplate.description!)
                                          .trim()
                                          .isNotEmpty)
                                    Text(
                                      localizations.translate(
                                          searchTemplate.description!),
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
                                  if (searchTemplate
                                          ?.properties?['searchByProximity']
                                          ?.hidden !=
                                      true)
                                    locationState.latitude != null
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.all(spacer2),
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
                                                              ?.properties?[
                                                                  'searchByProximity']
                                                              ?.label !=
                                                          null
                                                      ? localizations.translate(
                                                          searchTemplate!
                                                              .properties![
                                                                  'searchByProximity']!
                                                              .label)
                                                      : localizations.translate(
                                                          i18.searchBeneficiary
                                                              .proximityLabel,
                                                        ),
                                              value: isProximityEnabled,
                                              onChanged: (value) {
                                                searchController.clear();
                                                blocWrapper.add(
                                                    const RegistrationWrapperEvent
                                                        .clear());
                                                setState(() {
                                                  isProximityEnabled = value;
                                                  lat = locationState.latitude!;
                                                  long =
                                                      locationState.longitude!;
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
                                                  blocWrapper.add(
                                                      const RegistrationWrapperEvent
                                                          .clear());
                                                }
                                              },
                                            ),
                                          )
                                        : const Offstage(),
                                  if (searchTemplate
                                          ?.properties?['searchByID']?.hidden !=
                                      true)
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
                                            isBeneficiaryIdSearchEnabled =
                                                value;
                                          });
                                          blocWrapper.add(
                                              const RegistrationWrapperEvent
                                                  .clear());
                                          triggerGlobalSearchEvent();
                                        },
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(spacer2),
                                    child: DigitSearchBar(
                                      controller: searchController,
                                      hintText: (RegistrationDeliverySingleton()
                                                  .householdType ==
                                              HouseholdType.community)
                                          ? localizations.translate(i18
                                              .searchBeneficiary
                                              .clfSearchHintText)
                                          : searchTemplate
                                                      ?.properties?['searchBar']
                                                      ?.label !=
                                                  null
                                              ? localizations.translate(
                                                  searchTemplate!
                                                      .properties!['searchBar']!
                                                      .label)
                                              : localizations.translate(
                                                  i18.searchBeneficiary
                                                      .beneficiarySearchHintText,
                                                ),
                                      textCapitalization:
                                          TextCapitalization.words,
                                      onChanged: (value) {
                                        if (value.isEmpty ||
                                            value.trim().length > 2) {
                                          triggerGlobalSearchEvent();
                                        }
                                      },
                                    ),
                                  ),
                                  if (searchTemplate
                                          ?.properties?['filter']?.hidden !=
                                      true)
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
                                              padding:
                                                  const EdgeInsets.all(spacer2),
                                              child: DigitButton(
                                                label: searchTemplate
                                                            ?.properties?[
                                                                'filter']
                                                            ?.label !=
                                                        null
                                                    ? localizations.translate(
                                                        searchTemplate!
                                                            .properties![
                                                                'filter']!
                                                            .label)
                                                    : getFilterIconNLabel()[
                                                        'label'],
                                                size: DigitButtonSize.medium,
                                                type: DigitButtonType.tertiary,
                                                suffixIcon:
                                                    getFilterIconNLabel()[
                                                        'icon'],
                                                onPressed: () =>
                                                    showFilterDialog(),
                                              ),
                                            ),
                                          )
                                        : const Offstage(),
                                  selectedFilters.isNotEmpty
                                      ? Align(
                                          alignment: Alignment.topLeft,
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    selectedFilters.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            spacer1),
                                                    child: DigitChip(
                                                      label:
                                                          '${localizations.translate(selectedFilters[index])}'
                                                          ' (${blocWrapper.state.totalCount})',
                                                      capitalizedFirstLetter:
                                                          false,
                                                      onItemDelete: () {
                                                        setState(() {
                                                          selectedFilters.remove(
                                                              selectedFilters[
                                                                  index]);
                                                        });
                                                        blocWrapper.add(
                                                            const RegistrationWrapperEvent
                                                                .clear());
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
                          if ((selectedFilters.isNotEmpty ||
                                  searchController.text.isNotEmpty) &&
                              (blocWrapper.state.householdMembers.isEmpty &&
                                  !blocWrapper.state.loading))
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
                  BlocListener<UniqueIdBloc, UniqueIdState>(
                    listener: (context, state) {
                      state.maybeWhen(
                          orElse: () {},
                          idCount:
                              (availableIdCount, totalCount, currentUniqueId) {
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
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      context.read<FormsBloc>().add(
                                          const FormsEvent.clearForm(
                                              schemaKey: 'REGISTRATIONFLOW'));

                                      final pageName = context
                                          .read<FormsBloc>()
                                          .state
                                          .cachedSchemas['REGISTRATIONFLOW']
                                          ?.pages
                                          .entries
                                          .first
                                          .key;

                                      if (pageName == null) {
                                        Toast.showToast(
                                          context,
                                          message: localizations.translate(
                                              'NO_FORM_FOUND_FOR_REGISTRATION'),
                                          type: ToastType.error,
                                        );
                                      } else {
                                        context.router.push(FormsRenderRoute(
                                          currentSchemaKey: 'REGISTRATIONFLOW',
                                          pageName: pageName,
                                          defaultValues: {
                                            'administrativeArea':
                                                localizations.translate(
                                                    RegistrationDeliverySingleton()
                                                            .boundary
                                                            ?.code ??
                                                        ''),
                                            'nameOfIndividual':
                                                isBeneficiaryIdSearchEnabled
                                                    ? null
                                                    : searchController.text,
                                            'availableIDs': {
                                              'DEFAULT':
                                                  IdGen.instance.identifier,
                                              'UNIQUE_BENEFICIARY_ID':
                                                  currentUniqueId?.id,
                                            },
                                            "distibutionPoint": "ABCD DP",
                                            "eToken": "879-DE6-623"
                                          },
                                        ));
                                        searchController.clear();
                                      }
                                    }
                                  });
                            } else if (availableIdCount >=
                                RegistrationDeliverySingleton()
                                    .beneficiaryIdMinCount!) {
                              context.read<FormsBloc>().add(
                                  const FormsEvent.clearForm(
                                      schemaKey: 'REGISTRATIONFLOW'));

                              final pageName = context
                                  .read<FormsBloc>()
                                  .state
                                  .cachedSchemas['REGISTRATIONFLOW']
                                  ?.pages
                                  .entries
                                  .first
                                  .key;

                              if (pageName == null) {
                                Toast.showToast(
                                  context,
                                  message: localizations.translate(
                                      'NO_FORM_FOUND_FOR_REGISTRATION'),
                                  type: ToastType.error,
                                );
                              } else {
                                /// TODO: MULTIPLE CALLS: NEED TO CREATE A COMMON METHOD
                                context.router.push(FormsRenderRoute(
                                  currentSchemaKey: 'REGISTRATIONFLOW',
                                  pageName: pageName,
                                  defaultValues: {
                                    'administrativeArea':
                                        localizations.translate(
                                            RegistrationDeliverySingleton()
                                                    .boundary
                                                    ?.code ??
                                                ''),
                                    'nameOfIndividual':
                                        isBeneficiaryIdSearchEnabled
                                            ? null
                                            : searchController.text,
                                    'availableIDs': {
                                      'DEFAULT': IdGen.instance.identifier,
                                      'UNIQUE_BENEFICIARY_ID':
                                          currentUniqueId?.id,
                                    },
                                    "distibutionPoint": "ABCD DP",
                                    "eToken": "879-DE6-623"
                                  },
                                ));
                                searchController.clear();
                              }
                              FocusManager.instance.primaryFocus?.unfocus();
                            }
                            if (availableIdCount <= 0) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                showNoIdsAlert(
                                    context: context,
                                    showSkip: true,
                                    localizations: localizations,
                                    shouldProceedFurther: (bool skip) {
                                      context.read<FormsBloc>().add(
                                          const FormsEvent.clearForm(
                                              schemaKey: 'REGISTRATIONFLOW'));

                                      final pageName = context
                                          .read<FormsBloc>()
                                          .state
                                          .cachedSchemas['REGISTRATIONFLOW']
                                          ?.pages
                                          .entries
                                          .first
                                          .key;

                                      if (pageName == null) {
                                        Toast.showToast(
                                          context,
                                          message: localizations.translate(
                                              'NO_FORM_FOUND_FOR_REGISTRATION'),
                                          type: ToastType.error,
                                        );
                                      } else {
                                        context.router.push(FormsRenderRoute(
                                          currentSchemaKey: 'REGISTRATIONFLOW',
                                          pageName: pageName,
                                          defaultValues: {
                                            'administrativeArea':
                                                localizations.translate(
                                                    RegistrationDeliverySingleton()
                                                            .boundary
                                                            ?.code ??
                                                        ''),
                                            'nameOfIndividual':
                                                searchController.text,
                                            'availableIDs': {
                                              'DEFAULT':
                                                  IdGen.instance.identifier,
                                            },
                                            "distibutionPoint": "ABCD DP",
                                            "eToken": "879-DE6-623"
                                          },
                                        ));
                                        searchController.clear();
                                      }
                                    });
                                FocusManager.instance.primaryFocus?.unfocus();
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
                                    RegistrationDeliveryLocalization.of(
                                        context),
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
                                    title: localizations.translate(
                                        i18.common.coreCommonNoInternet),
                                    description: localizations.translate(i18
                                        .beneficiaryDetails
                                        .noInternetBeneficiaryIdsText),
                                  );
                                });
                          });
                    },
                    child: BlocBuilder<RegistrationWrapperBloc,
                            RegistrationWrapperState>(
                        builder: (context, blocState) {
                      final items = blocState.householdMembers;
                      return BlocListener<DigitScannerBloc, DigitScannerState>(
                        listener: (context, scannerState) {
                          if (scannerState.qrCodes.isNotEmpty) {
                            setState(() {
                              selectedTag =
                                  scannerState.qrCodes.lastOrNull ?? "";
                            });
                          }
                        },
                        child: BlocBuilder<LocationBloc, LocationState>(
                          builder: (context, locationState) {
                            return SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (ctx, index) {
                                  final i = items[index];
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
                                    margin:
                                        const EdgeInsets.only(bottom: spacer2),
                                    child: ViewBeneficiaryCard(
                                      distance:
                                          isProximityEnabled ? distance : null,
                                      householdWrapper: i,
                                      onOpenPressed: () async {
                                        final scannerBloc =
                                            context.read<DigitScannerBloc>();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();

                                        if ((i.tasks?.lastOrNull?.status ==
                                                    Status.closeHousehold
                                                        .toValue() &&
                                                (i.tasks ?? []).isNotEmpty) ||
                                            (i.projectBeneficiaries ?? [])
                                                .isEmpty) {
                                          setState(() {
                                            selectedFilters = [];
                                          });
                                          blocWrapper.add(
                                              const RegistrationWrapperEvent
                                                  .clear());

                                          final mapper = ReverseFormMapper(
                                            formConfig: jsonConfig[
                                                'beneficiaryRegistration']!,
                                            modelInstances: [
                                              if (i.household != null)
                                                i.household!,
                                              if (i.individuals?.first != null)
                                                i.individuals!.first,
                                              if (i.members?.first != null)
                                                i.members!.first,
                                            ],
                                          );

                                          final formData =
                                              mapper.buildFormData();

                                          final pageName = context
                                              .read<FormsBloc>()
                                              .state
                                              .cachedSchemas['REGISTRATIONFLOW']
                                              ?.pages
                                              .entries
                                              .first
                                              .key;

                                          context.router.push(FormsRenderRoute(
                                            isEdit: true,
                                            currentSchemaKey:
                                                'REGISTRATIONFLOW',
                                            pageName: pageName!,

                                            /// as registration is there assuming form won't be null
                                            defaultValues: {
                                              ...formData,
                                              'administrativeArea':
                                                  localizations.translate(
                                                      RegistrationDeliverySingleton()
                                                              .boundary
                                                              ?.code ??
                                                          ''),
                                              'availableIDs': {
                                                'DEFAULT':
                                                    IdGen.instance.identifier,
                                              },
                                              "distibutionPoint": "ABCD DP",
                                              "eToken": "879-DE6-623"
                                            },
                                          ));

                                          blocWrapper.add(RegistrationWrapperEvent
                                              .fetchDeliveryDetails(
                                                  projectId:
                                                      RegistrationDeliverySingleton()
                                                          .selectedProject!
                                                          .id,
                                                  selectedIndividual: null,
                                                  householdWrapper: HouseholdWrapper(
                                                      household: i.household,
                                                      individuals:
                                                          i.individuals,
                                                      members: i.members,
                                                      projectBeneficiaries: i
                                                          .projectBeneficiaries,
                                                      tasks: i.tasks,
                                                      sideEffects:
                                                          i.sideEffects,
                                                      referrals: i.referrals),
                                                  beneficiaryType:
                                                      RegistrationDeliverySingleton()
                                                          .beneficiaryType
                                                          ?.toValue()));
                                        } else {
                                          blocWrapper.add(
                                              const RegistrationWrapperEvent
                                                  .clear());
                                          blocWrapper.add(RegistrationWrapperEvent
                                              .fetchDeliveryDetails(
                                                  projectId:
                                                      RegistrationDeliverySingleton()
                                                          .selectedProject!
                                                          .id,
                                                  selectedIndividual: null,
                                                  householdWrapper: HouseholdWrapper(
                                                      household: i.household,
                                                      individuals:
                                                          i.individuals,
                                                      members: i.members,
                                                      projectBeneficiaries: i
                                                          .projectBeneficiaries,
                                                      tasks: i.tasks,
                                                      sideEffects:
                                                          i.sideEffects,
                                                      referrals: i.referrals),
                                                  beneficiaryType:
                                                      RegistrationDeliverySingleton()
                                                          .beneficiaryType
                                                          ?.toValue()));

                                          await context.router
                                              .push(HouseholdOverviewRoute());
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
                                childCount: items.length +
                                    (blocState.loading
                                        ? 1
                                        : 0), // 👈 Extra item if loading
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: ValueListenableBuilder<TextEditingValue>(
              valueListenable: searchController,
              builder: (context, value, _) {
                final isCommunity =
                    RegistrationDeliverySingleton().householdType ==
                        HouseholdType.community;
                final isTextShort = value.text.length < 3;

                return Offstage(
                  offstage: isCommunity && isTextShort,
                  child: DigitCard(
                    margin: const EdgeInsets.only(top: spacer2),
                    padding: const EdgeInsets.all(spacer4),
                    children: [
                      ...buildSearchButtons(context, value, isCommunity,
                          isTextShort, searchTemplate),
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

  List<DigitButton> buildSearchButtons(
    BuildContext context,
    TextEditingValue value,
    bool isCommunity,
    bool isTextShort,
    TemplateConfig? template,
  ) {
    final primaryProp = template?.properties?['PrimaryButton'];
    final secondaryProp = template?.properties?['SecondaryButton'];

    final entries = <MapEntry<int, DigitButton>>[];

    // — Primary button — (respect hidden + enableViewHousehold logic if any)
    if (primaryProp?.hidden != true) {
      final order = primaryProp?.order ?? 0;
      entries.add(MapEntry(
        order,
        DigitButton(
          capitalizeLetters: false,
          label: isCommunity
              ? localizations.translate(
                  primaryProp?.label ?? i18.searchBeneficiary.clfAddActionLabel)
              : localizations.translate(primaryProp?.label ??
                  i18.searchBeneficiary.beneficiaryAddActionLabel),
          mainAxisSize: MainAxisSize.max,
          type: DigitButtonType.primary,
          size: DigitButtonSize.large,
          isDisabled: isTextShort,
          onPressed: () {
            if (template?.properties?['searchByID']?.hidden == true) {
              context.read<FormsBloc>().add(
                  const FormsEvent.clearForm(schemaKey: 'REGISTRATIONFLOW'));

              final pageName = context
                  .read<FormsBloc>()
                  .state
                  .cachedSchemas['REGISTRATIONFLOW']
                  ?.pages
                  .entries
                  .first
                  .key;

              if (pageName == null) {
                Toast.showToast(
                  context,
                  message:
                      localizations.translate('NO_FORM_FOUND_FOR_REGISTRATION'),
                  type: ToastType.error,
                );
              } else {
                context.router.push(FormsRenderRoute(
                  currentSchemaKey: 'REGISTRATIONFLOW',
                  pageName: pageName,
                  defaultValues: {
                    'administrativeArea': localizations.translate(
                        RegistrationDeliverySingleton().boundary?.code ?? ''),
                    'nameOfIndividual': value.text,
                    'availableIDs': {
                      'DEFAULT': IdGen.instance.identifier,
                    },
                    "distibutionPoint": "ABCD DP",
                    "eToken": "879-DE6-623"
                  },
                ));
                searchController.clear();
                FocusManager.instance.primaryFocus?.unfocus();
              }
            } else {
              fetchBeneficiaryIdCount();
            }

            context
                .read<DigitScannerBloc>()
                .add(const DigitScannerEvent.handleScanner());
            selectedFilters = [];
            blocWrapper.add(const RegistrationWrapperEvent.clear());
          },
        ),
      ));
    }

    // — Secondary button —
    if (secondaryProp?.hidden != true) {
      final order = secondaryProp?.order ?? 1;
      entries.add(MapEntry(
        order,
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
          label: secondaryProp?.label != null
              ? localizations.translate(secondaryProp?.label ?? '')
              : localizations.translate(i18.deliverIntervention.scannerLabel),
        ),
      ));
    }

    // Sort by order and return only the DigitButtons
    entries.sort((a, b) => a.key.compareTo(b.key));
    return entries.map((e) => e.value).toList(growable: false);
  }

  void triggerGlobalSearchEvent({bool isPagination = false}) {
    if (!isPagination) {
      blocWrapper.add(const RegistrationWrapperEvent.clear());
    }

    if (isProximityEnabled ||
        selectedFilters.isNotEmpty ||
        (searchController.text.isNotEmpty &&
            searchController.text.length > 2) ||
        selectedTag != "") {
      final params = reg_params.GlobalSearchParameters(
        filters: [
          if (selectedTag != "")
            reg_params.SearchFilter(
              root: 'projectBeneficiary',
              // or 'individual', based on what you're searching
              field: 'tag',
              operator: 'equals',
              value: selectedTag,
            ),
          if (searchController.text.isNotEmpty &&
              searchController.text.length > 2 &&
              isBeneficiaryIdSearchEnabled == true)
            reg_params.SearchFilter(
              root:
                  'identifier', // or 'individual', based on what you're searching
              field: 'identifierId',
              operator: 'contains',
              value: searchController.text,
            ),
          if (selectedFilters.isNotEmpty)
            reg_params.SearchFilter(
              root: 'task', // or 'individual', based on what you're searching
              field: 'status',
              operator: 'equals',
              value: selectedFilters.first,
            ),
          if (searchController.text.isNotEmpty &&
              searchController.text.length > 2 &&
              isBeneficiaryIdSearchEnabled == false)
            reg_params.SearchFilter(
              root: 'name', // or 'individual', based on what you're searching
              field: 'givenName',
              operator: 'contains',
              value: searchController.text,
            ),
          if (isProximityEnabled)
            reg_params.SearchFilter(
              root: 'address',
              field: '',
              operator: 'within',
              value: RegistrationDeliverySingleton().maxRadius,
              coordinates: reg_params.LatLng(
                latitude: lat,
                longitude: long,
              ),
            ),
        ], // Optional: if you're resolving linked entities
        primaryModel: 'household',
        select: [
          'individual',
          'household',
          'householdMember',
          'projectBeneficiary',
          'task'
        ], // Optional: which fields to return
        pagination: isPagination
            ? reg_params.PaginationParams(
                limit: blocWrapper.state.limit ?? limit,
                offset: (blocWrapper.state.offset ?? offset) +
                    (blocWrapper.state.limit ?? limit))
            : reg_params.PaginationParams(limit: limit, offset: offset),
      );
      blocWrapper.add(RegistrationWrapperEvent.loadFromGlobal(
          searchParams: params,
          beneficiaryType:
              RegistrationDeliverySingleton().beneficiaryType?.toValue()));
    }
  }

  void fetchBeneficiaryIdCount() {
    context.read<UniqueIdBloc>().add(const UniqueIdEvent.fetchIdCount());
  }
}
