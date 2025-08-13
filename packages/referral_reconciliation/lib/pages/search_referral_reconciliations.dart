import 'package:auto_route/auto_route.dart';
import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_data_converter/utils/utils.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/templates/template_config.dart';
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:digit_forms_engine/router/forms_router.gm.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/router/digit_scanner_router.gm.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/digit_info_card.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/atoms/digit_toast.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:referral_reconciliation/blocs/hf_Referral_reconciliation_bloc.dart';
import 'package:referral_reconciliation/data/repositories/transfomer_config.dart';
import 'package:referral_reconciliation/utils/extensions/extensions.dart';
import 'package:referral_reconciliation/widgets/custom_cycle_widget.dart';
import 'package:referral_reconciliation/widgets/evaluation_facility_widget.dart';
import 'package:survey_form/survey_form.dart';

import '../blocs/search_referral_reconciliations.dart';
import '../data/digit_data_convertor.dart';
import '../models/entities/hf_referral.dart';
import '../router/referral_reconciliation_router.gm.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../widgets/view_referral_card.dart';
import 'package:digit_data_converter/src/reverse_transformer_service.dart';
import 'package:digit_data_converter/src/transformer_service.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart' as reg_params;

@RoutePage()
class SearchReferralReconciliationsPage extends LocalizedStatefulWidget {
  const SearchReferralReconciliationsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<SearchReferralReconciliationsPage> createState() =>
      _SearchReferralReconciliationsPageState();
}

class _SearchReferralReconciliationsPageState
    extends LocalizedState<SearchReferralReconciliationsPage> {
  final TextEditingController searchController = TextEditingController();
  bool isProximityEnabled = false;
  SearchReferralsBloc? searchReferralsBloc;

  late final HFReferalWrapperBloc blocWrapper;
  List<String> selectedFilters = [];
  int offset = 0;
  int limit = 10;
  String selectedTag = "";

  @override
  void initState() {
    DataConverterSingleton()
        .setData(dynamicEntityModelListener: EntityModelJsonMapper());
    Future.microtask(() {
      context.read<CrudBloc>().add(const CrudEventInitialize());
    });
    blocWrapper = context.read<HFReferalWrapperBloc>();

    searchReferralsBloc = SearchReferralsBloc(
      const SearchReferralsState(),
      referralReconDataRepository:
          context.repository<HFReferralModel, HFReferralSearchModel>(context),
    );

    context.read<DigitScannerBloc>().add(
          const DigitScannerEvent.handleScanner(),
        );

    final schemas = [
      ReferralReconSingleton().referralConfig,
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
  Widget build(BuildContext context) {
    final pageKey =
        SearchReferralReconciliationsRoute.name.replaceAll('Route', '');
    final searchTemplate = ReferralReconSingleton().templateConfigs?[pageKey];

    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return BlocListener<HFReferalWrapperBloc, HFReferalWrapperState>(
      listener: (context, createState) {
        if (createState.lastAction == HFReferalWrapperActionType.created ||
            createState.lastAction == HFReferalWrapperActionType.updated ||
            createState.lastAction ==
                HFReferalWrapperActionType.createAndUpdate) {
          Navigator.of(context, rootNavigator: true).pop();

          final currentSchema = context
              .read<FormsBloc>()
              .state
              .cachedSchemas[context.read<FormsBloc>().state.activeSchemaKey];

          // Reset to prevent re-handling
          context.read<FormsBloc>().add(
                const FormsEvent.clearForm(
                    schemaKey: 'HFREFERALFLOW'), // or create a FormsResetEvent
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
              if (nextAction.name == 'HFREFERALFLOW') {
                final pageName = context
                    .read<FormsBloc>()
                    .state
                    .cachedSchemas['HFREFERALFLOW']
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
                      currentSchemaKey: 'HFREFERALFLOW',
                      pageName: pageName,
                      defaultValues: {
                        'administrativeArea': localizations.translate(
                            ReferralReconSingleton().boundary?.code ?? '')
                      }));
                }
              } else {
                final pageName = context
                    .read<FormsBloc>()
                    .state
                    .cachedSchemas['HFREFERALFLOW']
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
                    currentSchemaKey: 'HFREFERALFLOW',
                    pageName: pageName,
                    defaultValues: {
                      'administrativeArea': localizations.translate(
                          ReferralReconSingleton().boundary?.code ?? '')
                    },
                    customComponents: const [
                      {'referralCycle': CycleDropDown()},
                      {'evaluationFacilityKey': EvaluationKeyDropDown()}
                    ],
                  ));
                }
              }
            }
          } else {
            //TODO::
            context.router
                .push(ReferralReconAcknowledgementRoute()); // fallback page
          }
        } else if (createState.error != null) {
          Navigator.of(context, rootNavigator: true).pop();
          // Reset to prevent re-handling
          context.read<FormsBloc>().add(
                const FormsEvent.clearForm(
                    schemaKey: 'HFREFERALFLOW'), // or create a FormsResetEvent
              );
          // context.router
          //     .push(BeneficiaryErrorRoute(enableViewHousehold: false));
          if (kDebugMode) {
            print(createState.error);
          }
        }
      },
      child: BlocListener<FormsBloc, FormsState>(
        listener: (context, formState) {
          // TODO: implement listener

          if (formState is FormsSubmittedState) {
            DigitLoaders.overlayLoader(context: context);

            final formData = formState.formData;
            if (formData.isEmpty) return;

            try {
              final formEntityMapper = FormEntityMapper(config: jsonConfig);

              final modelsConfig =
                  (jsonConfig['referral']?['models'] as Map<String, dynamic>);

              try {
                final entities = formEntityMapper.mapFormToEntities(
                  modelsConfig: modelsConfig,
                  formValues: formData,
                  // existingModels: [
                  //   // if (household != null) household,
                  //   // if (individual != null) individual,
                  //   // if (projectBeneficiary != null) projectBeneficiary,
                  //   // if (member != null) member
                  // ],
                  context: {
                    "tenantId": ReferralReconSingleton().tenantId,
                    "userId": ReferralReconSingleton().userUUid,
                    "userUUID": ReferralReconSingleton().userUUid,
                    "formVersion": 1,

                    "projectId": ReferralReconSingleton().projectId,
                    "referenceId": IdGen.i.identifier,
                    //TODO:: need to change
                    "serviceDefId": IdGen.i.identifier,
                  },
                );

                final toCreate = <EntityModel>[];
                final toUpdate = [...entities];

                // blocWrapper.add(
                //   HFReferalWrapperEvent.createAndUpdate(
                //     entitiesToCreate: toCreate,
                //     entitiesToUpdate: toUpdate,
                //   ),
                // );
                if (!(formState.isView != null && formState.isView == true)) {
                  blocWrapper
                      .add(HFReferalWrapperEvent.create(entities: entities));
                }
              } catch (e) {
                Navigator.of(context, rootNavigator: true).pop();
                // Reset to prevent re-handling
                context.read<FormsBloc>().add(
                      const FormsEvent.clearForm(
                          schemaKey:
                              'REGISTRATIONFLOW'), // or create a FormsResetEvent
                    );
                // context.router
                //     .push(BeneficiaryErrorRoute(enableViewHousehold: false));
              }
            } catch (e) {
              Navigator.of(context, rootNavigator: true).pop();
              // Reset to prevent re-handling
              context.read<FormsBloc>().add(
                    const FormsEvent.clearForm(
                        schemaKey:
                            'REGISTRATIONFLOW'), // or create a FormsResetEvent
                  );
              // context.router
              //     .push(BeneficiaryErrorRoute(enableViewHousehold: false));
              print('Error: ');
            }
          }
          // end
        },
        child: KeyboardVisibilityBuilder(
            builder: (context, isKeyboardVisible) => BlocProvider<
                    SearchReferralsBloc>(
                create: (context) => searchReferralsBloc!
                  ..add(
                    const SearchReferralsClearEvent(),
                  ),
                child: Scaffold(
                  body: BlocListener<DigitScannerBloc, DigitScannerState>(
                      listener: (context, scannerState) {
                        if (scannerState.qrCodes.isNotEmpty) {
                          //TODO: commented
                          // context
                          //     .read<SearchReferralsBloc>()
                          //     .add(SearchReferralsEvent.searchByTag(
                          //       tag: scannerState.qrCodes.last,
                          //     ));

                          setState(() {
                            selectedTag = scannerState.qrCodes.lastOrNull ?? "";
                          });

                          triggerGlobalSearchEvent();
                        }
                      },
                      child: BlocProvider(
                          create: (_) => ServiceBloc(
                                const ServiceEmptyState(),
                                serviceDataRepository: context.repository<
                                    ServiceModel, ServiceSearchModel>(context),
                              ),
                          child: BlocBuilder<HFReferalWrapperBloc,
                              HFReferalWrapperState>(
                            builder: (context, searchState) {
                              return ScrollableContent(
                                header: const Column(children: [
                                  BackNavigationHelpHeaderWidget(),
                                ]),
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          theme.spacerTheme.spacer2),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(
                                                theme.spacerTheme.spacer2),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                searchTemplate?.label != null
                                                    ? localizations.translate(
                                                        searchTemplate!.label,
                                                      )
                                                    : localizations.translate(
                                                        i18.referralReconciliation
                                                            .searchReferralsHeader,
                                                      ),
                                                style: textTheme.headingXl,
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              DigitSearchBar(
                                                controller: searchController,
                                                hintText: searchTemplate
                                                            ?.properties?[
                                                                'searchBar']
                                                            ?.label !=
                                                        null
                                                    ? localizations.translate(
                                                        searchTemplate!
                                                            .properties![
                                                                'searchBar']!
                                                            .label)
                                                    : localizations.translate(
                                                        i18.referralReconciliation
                                                            .referralSearchHintText,
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
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  theme.spacerTheme.spacer2 *
                                                      2),
                                          if (searchState
                                                  .hFReferalMembers.isEmpty &&
                                              searchController.text.isNotEmpty)
                                            InfoCard(
                                              title: localizations.translate(i18
                                                  .referralReconciliation
                                                  .beneficiaryInfoTitle),
                                              type: InfoType.info,
                                              description:
                                                  localizations.translate(
                                                i18.referralReconciliation
                                                    .referralInfoDescription,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (ctx, index) {
                                        final i = searchState.hFReferalMembers
                                            .elementAt(index);

                                        return Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  theme.spacerTheme.spacer2),
                                          child: ViewReferralCard(
                                            hfReferralModel: i.hfReferrals!,
                                            onOpenPressed: () {
                                              // TODO:: need to integrate

                                              final scannerBloc = context
                                                  .read<DigitScannerBloc>();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();

                                              blocWrapper.add(
                                                  const HFReferalWrapperEvent
                                                      .clear());

                                              final mapper = ReverseFormMapper(
                                                formConfig:
                                                    jsonConfig['referral']!,
                                                modelInstances: [
                                                  i.hfReferrals!
                                                ],
                                              );

                                              final formData =
                                                  mapper.buildFormData();

                                              final pageName = context
                                                  .read<FormsBloc>()
                                                  .state
                                                  .cachedSchemas[
                                                      'HFREFERALFLOW']
                                                  ?.pages
                                                  .entries
                                                  .first
                                                  .key;

                                              context.router.push(
                                                FormsRenderRoute(
                                                  isEdit: false,
                                                  currentSchemaKey:
                                                      'HFREFERALFLOW',
                                                  pageName: pageName!,

                                                  /// as registration is there assuming form won't be null
                                                  defaultValues: {
                                                    ...formData,
                                                    'administrativeUnitKey':
                                                        localizations.translate(
                                                            ReferralReconSingleton()
                                                                    .boundary
                                                                    ?.code ??
                                                                ''),
                                                  },
                                                  customComponents: const [
                                                    {
                                                      'referralCycle':
                                                          CycleDropDown()
                                                    },
                                                    {
                                                      'evaluationFacilityKey':
                                                          EvaluationKeyDropDown()
                                                    }
                                                  ],
                                                  isView: true,
                                                ),
                                              );

                                              searchController.clear();
                                              selectedFilters.clear();
                                            },
                                          ),
                                        );
                                      },
                                      childCount:
                                          searchState.hFReferalMembers.length,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ))),
                  bottomNavigationBar: ValueListenableBuilder<TextEditingValue>(
                      valueListenable: searchController,
                      builder: (context, value, _) {
                        final isTextShort = value.text.length < 3;
                        return Offstage(
                          offstage: false,
                          child: DigitCard(
                            margin: const EdgeInsets.only(top: spacer2),
                            padding: const EdgeInsets.all(spacer4),
                            children: [
                              ...buildSearchButtons(
                                  context, value, isTextShort, searchTemplate)
                            ],
                          ),
                        );
                      }),
                ))),
      ),
    );
  }

  List<DigitButton> buildSearchButtons(
    BuildContext context,
    TextEditingValue value,
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
          label: localizations.translate(primaryProp?.label ??
              i18.referralReconciliation.createReferralLabel),
          mainAxisSize: MainAxisSize.max,
          type: DigitButtonType.primary,
          size: DigitButtonSize.large,
          isDisabled: isTextShort,
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            final bloc = context.read<SearchReferralsBloc>();

            final pageName = context
                .read<FormsBloc>()
                .state
                .cachedSchemas['HFREFERALFLOW']
                ?.pages
                .entries
                .first
                .key;

            if (pageName == null) {
              Toast.showToast(
                context,
                message:
                    localizations.translate('NO_FORM_FOUND_FOR_HFREFERALFLOW'),
                type: ToastType.error,
              );
              return;
            }

            context.router.push(
              FormsRenderRoute(
                  currentSchemaKey: 'HFREFERALFLOW',
                  pageName: pageName,
                  defaultValues: {
                    'administrativeUnitKey': localizations.translate(
                      ReferralReconSingleton().boundary?.code ?? '',
                    ),
                    'nameOfChild': searchController.text.trim(),
                    'hfCoordinatorKey': ReferralReconSingleton().userName
                  },
                  customComponents: const [
                    {'referralCycle': CycleDropDown()},
                    {'evaluationFacilityKey': EvaluationKeyDropDown()}
                  ]),
            );

            searchController.clear();
            bloc.add(
              const SearchReferralsClearEvent(),
            );
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
            blocWrapper.add(const HFReferalWrapperEvent.clear());
            //TODO: need to do
            /// selectedFilters = [];
            searchController.clear();

            context.read<DigitScannerBloc>().add(
                  const DigitScannerEvent.handleScanner(),
                );
            context.router.push(DigitScannerRoute(
              quantity: 1,
              isGS1code: false,
              singleValue: true,
            ));
          },
          prefixIcon: Icons.qr_code,
          label: secondaryProp?.label != null
              ? localizations.translate(secondaryProp?.label ?? '')
              : localizations
                  .translate(i18.referralReconciliation.scannerLabel),
        ),
      ));
    }

    // Sort by order and return only the DigitButtons
    entries.sort((a, b) => a.key.compareTo(b.key));
    return entries.map((e) => e.value).toList(growable: false);
  }

  void triggerGlobalSearchEvent({bool isPagination = false}) {
    if (!isPagination) {
      blocWrapper.add(const HFReferalWrapperEvent.clear());
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
              root: 'hFReferral',
              // or 'individual', based on what you're searching
              field: 'beneficiaryId',
              operator: 'contains',
              value: selectedTag,
            ),
          if (searchController.text.isNotEmpty &&
              searchController.text.length > 2)
            reg_params.SearchFilter(
              root:
                  'hFReferral', // or 'individual', based on what you're searching
              field: 'name',
              operator: 'contains',
              value: searchController.text,
            ),
        ], // Optional: if you're resolving linked entities
        primaryModel: 'hFReferral',
        select: [
          'hFReferral',
        ], // Optional: which fields to return
        pagination: isPagination
            ? reg_params.PaginationParams(
                limit: blocWrapper.state.limit ?? limit,
                offset: (blocWrapper.state.offset ?? offset) +
                    (blocWrapper.state.limit ?? limit))
            : reg_params.PaginationParams(limit: limit, offset: offset),
      );
      blocWrapper.add(HFReferalWrapperEvent.loadFromGlobal(
        searchParams: params,
      ));
    }
  }
}
