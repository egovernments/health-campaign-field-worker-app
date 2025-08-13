import 'package:auto_route/auto_route.dart';
import 'package:complaints/blocs/complaint_wrapper/complaint_wrapper_bloc.dart';
import 'package:complaints/router/complaints_router.gm.dart';
import 'package:complaints/utils/constants.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_converter/src/transformer_service.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/router/forms_router.gm.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';

import '/blocs/localization/app_localization.dart';
import '/utils/i18_key_constants.dart' as i18;
import '/utils/utils.dart';
import '/widgets/header/back_navigation_help_header.dart';
import '/widgets/localized.dart';
import '/widgets/no_result_card/no_result_card.dart';
import '../../data/transformer_config.dart';
import '../../models/pgr_complaints.dart';

@RoutePage()
class ComplaintsInboxPage extends LocalizedStatefulWidget {
  const ComplaintsInboxPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsInboxPage> createState() => ComplaintsInboxPageState();
}

class ComplaintsInboxPageState extends LocalizedState<ComplaintsInboxPage> {
  @override
  void initState() {
    // Use globalCrudBloc to search using search params
    final searchParams = GlobalSearchParameters(
      filters: [
        SearchFilter(
          root: 'pgrService',
          field: 'tenantId',
          operator: 'equals',
          value: ComplaintsSingleton().tenantId,
        ),
      ],
      primaryModel: 'pgrService',
      select: ['pgrService'],
      pagination: null,
    );

    context
        .read<ComplaintWrapperBloc>()
        .add(ComplaintWrapperEvent.loadFromGlobal(searchParams: searchParams));

    final schemas = [
      ComplaintsSingleton().complaintConfig,
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
    final pageKey = ComplaintsInboxRoute.name.replaceAll('Route', '');
    final inboxTemplate = ComplaintsSingleton().templateConfigs?[pageKey];

    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final router = context.router;

    return Scaffold(
      body: BlocListener<FormsBloc, FormsState>(listener: (context, formState) {
        if (formState is FormsSubmittedState) {
          DigitLoaders.overlayLoader(context: context);

          final formData = formState.formData;
          if (formData.isEmpty) return;

          try {
            final modelsConfig = (jsonConfig['complaintRegistration']?['models']
                as Map<String, dynamic>);

            final fallBackModel = jsonConfig['complaintRegistration']
                ?['fallbackModel'] as String?;

            final formEntityMapper = FormEntityMapper(config: jsonConfig);

            final entities = formEntityMapper.mapFormToEntities(
              formValues: formData,
              modelsConfig: modelsConfig,
              context: {
                "tenantId": ComplaintsSingleton().tenantId,
                "selectedBoundaryCode": ComplaintsSingleton().boundary?.code,
                'userName': ComplaintsSingleton().loggedInUserName,
                'userId': ComplaintsSingleton().loggedInUserUuid,
                'userUUID': ComplaintsSingleton().loggedInUserUuid,
              },
              fallbackFormDataString: fallBackModel,
            );

            print(entities.toString());

            context.read<ComplaintWrapperBloc>().add(
                  Create(entities: entities),
                );
            Navigator.of(context, rootNavigator: true).pop();
          } catch (e) {
            Navigator.of(context, rootNavigator: true).pop();
            // Reset to prevent re-handling
            context.read<FormsBloc>().add(
                  FormsEvent.clearForm(
                      schemaKey: complaintKeys
                          .complaintForm), // or create a FormsResetEvent
                );
            // context.router
            //     .push(BeneficiaryErrorRoute(enableViewHousehold: false));
          }
        }
      }, child: BlocBuilder<ComplaintWrapperBloc, ComplaintWrapperState>(
        builder: (context, state) {
          final inboxItems =
              state.isFiltered ? state.filteredComplaints : state.complaints;

          return Column(
            children: [
              Expanded(
                child: ScrollableContent(
                  header: const Column(
                    children: [
                      BackNavigationHelpHeaderWidget(),
                    ],
                  ),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: spacer2 * 2,
                          bottom: spacer2,
                        ),
                        child: Text(
                          localizations.translate(inboxTemplate
                                  ?.properties?[complaintKeys.primaryButtonKey]
                                  ?.label ??
                              ""),
                          style: textTheme.headingXl,
                        ),
                      ),
                    ),
                    ...[
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: spacer2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: spacer2 * 2),
                                child: DigitButton(
                                  type: DigitButtonType.tertiary,
                                  size: DigitButtonSize.medium,
                                  prefixIcon: Icons.search,
                                  label: localizations.translate(
                                    i18.complaints.searchCTA,
                                  ),
                                  onPressed: () {
                                    router.push(ComplaintsInboxSearchRoute());
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.zero,
                                child: DigitButton(
                                  type: DigitButtonType.tertiary,
                                  size: DigitButtonSize.medium,
                                  label: localizations.translate(
                                    i18.complaints.filterCTA,
                                  ),
                                  prefixIcon: Icons.filter_list_alt,
                                  onPressed: () {
                                    router.push(ComplaintsInboxFilterRoute());
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: spacer2 * 2),
                                child: DigitButton(
                                  type: DigitButtonType.tertiary,
                                  size: DigitButtonSize.medium,
                                  label: localizations.translate(
                                    i18.complaints.sortCTA,
                                  ),
                                  prefixIcon: Icons.segment,
                                  onPressed: () {
                                    router.push(ComplaintsInboxSortRoute());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final item = inboxItems.elementAt(index);

                            return _ComplaintsInboxItem(
                              item: item.complaint!,
                              localizations: localizations,
                            );
                          },
                          childCount: inboxItems.length,
                        ),
                      ),
                    ],
                  ],
                  children: [
                    if (inboxItems.isEmpty)
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: NoResultCard(
                              align: Alignment.center,
                              label: localizations
                                  .translate(i18.complaints.noComplaintsExist),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              DigitCard(
                  cardType: CardType.primary,
                  margin: const EdgeInsets.fromLTRB(0, spacer2, 0, 0),
                  children: [
                    if (inboxTemplate?.properties?['PrimaryButton']?.hidden !=
                        true)
                      DigitButton(
                        label: localizations.translate(inboxTemplate
                                ?.properties?[complaintKeys.primaryButtonKey]
                                ?.label ??
                            ""),
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        mainAxisSize: MainAxisSize.max,
                        onPressed: () async {
                          var loggedInUserUuid =
                              ComplaintsSingleton().loggedInUserUuid;
                          context.read<FormsBloc>().add(FormsEvent.clearForm(
                              schemaKey: complaintKeys.complaintForm));

                          final pageName = context
                              .read<FormsBloc>()
                              .state
                              .cachedSchemas[complaintKeys.complaintForm]
                              ?.pages
                              .entries
                              .first
                              .key;

                          if (pageName == null) {
                            Toast.showToast(
                              context,
                              message: localizations
                                  .translate('NO_FORM_FOUND_FOR_COMPLAINT'),
                              type: ToastType.error,
                            );
                          } else {
                            context.router.push(FormsRenderRoute(
                              currentSchemaKey: complaintKeys.complaintForm,
                              pageName: pageName,
                              defaultValues: {
                                'administrativeArea': localizations.translate(
                                    ComplaintsSingleton().boundary?.code ?? ''),
                              },
                            ));
                          }
                        },
                      ),
                  ]),
            ],
          );
        },
      )),
    );
  }
}

class _ComplaintsInboxItem extends StatelessWidget {
  final ComplaintsLocalization localizations;
  final PgrServiceModel item;

  const _ComplaintsInboxItem({
    Key? key,
    required this.localizations,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return DigitCard(
        margin: const EdgeInsets.all(spacer2),
        cardType: CardType.primary,
        children: [
          LabelValueSummary(
            padding: EdgeInsets.zero,
            items: [
              LabelValueItem(
                label: localizations.translate(i18.complaints.inboxNumberLabel),
                value: item.serviceRequestId ??
                    "${localizations.translate(i18.complaints.inboxNotGeneratedLabel)}\n${localizations.translate(i18.complaints.inboxSyncRequiredLabel)}",
                valueTextStyle: item.serviceRequestId != null
                    ? textTheme.bodyS
                        .copyWith(color: theme.colorTheme.primary.primary1)
                    : null,
                labelFlex: 5,
              ),
              LabelValueItem(
                label: localizations.translate(i18.complaints.inboxTypeLabel),
                value: localizations.translate(
                  item.serviceCode.snakeCase.toUpperCase().trim(),
                ),
                labelFlex: 5,
              ),
              LabelValueItem(
                label: localizations.translate(i18.complaints.inboxDateLabel),
                value: item.auditDetails?.createdTime.toDateTime
                        .getFormattedDate() ??
                    "",
                labelFlex: 5,
              ),
              LabelValueItem(
                label: localizations.translate(i18.complaints.inboxAreaLabel),
                value: item.address.locality?.name ?? "",
                labelFlex: 5,
              ),
              LabelValueItem(
                label: localizations.translate(i18.complaints.inboxStatusLabel),
                value: localizations.translate(
                  "COMPLAINTS_STATUS_${item.applicationStatus.name.snakeCase.toUpperCase()}",
                ),
                labelFlex: 5,
              ),
            ],
          ),
          DigitButton(
            label: localizations.translate(i18.searchBeneficiary.iconLabel),
            type: DigitButtonType.secondary,
            size: DigitButtonSize.large,
            mainAxisSize: MainAxisSize.max,
            onPressed: () {
              context.router.push(ComplaintsDetailsViewRoute(
                complaint: item,
              ));
            },
          ),
        ]);
  }
}
