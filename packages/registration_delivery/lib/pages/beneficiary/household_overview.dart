import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_converter/src/reverse_transformer_service.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/router/forms_router.gm.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_action_card.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/digit_chip.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/blocs/registration_wrapper/registration_wrapper_bloc.dart';
import 'package:registration_delivery/data/transformer_config.dart';
import 'package:survey_form/survey_form.dart';

import '/widgets/status_filter/status_filter.dart';
import '../../models/entities/household.dart';
import '../../models/entities/registration_delivery_enums.dart';
import '../../models/entities/status.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/registration_component_keys.dart' as registration_keys;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/member_card/member_card.dart';
import '../../widgets/table_card/table_card.dart';

@RoutePage()
class HouseholdOverviewPage extends LocalizedStatefulWidget {
  const HouseholdOverviewPage({super.key, super.appLocalizations});

  @override
  State<HouseholdOverviewPage> createState() => _HouseholdOverviewPageState();
}

class _HouseholdOverviewPageState
    extends LocalizedState<HouseholdOverviewPage> {
  final TextEditingController searchController = TextEditingController();
  int offset = 0;
  int limit = 10;

  String? householdClientReferenceId;

  List<String> selectedFilters = [];

  @override
  void initState() {
    callReloadEvent(offset: offset, limit: limit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageKey = HouseholdOverviewRoute.name.replaceAll('Route', '');
    final overviewTemplate =
        RegistrationDeliverySingleton().templateConfigs?[pageKey];
    final theme = Theme.of(context);
    final beneficiaryType = RegistrationDeliverySingleton().beneficiaryType!;
    final textTheme = theme.digitTextTheme(context);

    return PopScope(
      onPopInvoked: (didPop) async {
        context
            .read<RegistrationWrapperBloc>()
            .add(const RegistrationWrapperEvent.clear());
        context.router.popUntilRouteWithName(SearchBeneficiaryRoute.name);
      },
      child: BlocBuilder<RegistrationWrapperBloc, RegistrationWrapperState>(
        builder: (ctx, state) {
          return Scaffold(
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification) {
                        final metrics = scrollNotification.metrics;
                        if (metrics.atEdge && metrics.pixels != 0) {
                          if (state.offset != null) {
                            callReloadEvent(
                                offset: state.offset ?? 0, limit: limit);
                          }
                        }
                      }
                      //Return true to allow the notification to continue to be dispatched to further ancestors.
                      return true;
                    },
                    child: ScrollableContent(
                      header: Padding(
                        padding: const EdgeInsets.only(bottom: spacer2),
                        child: BackNavigationHelpHeaderWidget(
                          handleBack: () {
                            context
                                .read<RegistrationWrapperBloc>()
                                .add(const RegistrationWrapperEvent.clear());
                          },
                        ),
                      ),
                      enableFixedDigitButton: true,
                      footer: DigitCard(
                        margin: const EdgeInsets.only(top: spacer2),
                        children: [
                          Offstage(
                            offstage:
                                beneficiaryType == BeneficiaryType.individual ||
                                    isOutsideProjectDateRange(),
                            child: BlocBuilder<ServiceDefinitionBloc,
                                ServiceDefinitionState>(
                              builder: (context, serviceDefinitionState) =>
                                  BlocBuilder<RegistrationWrapperBloc,
                                      RegistrationWrapperState>(
                                builder: (ctx, deliverInterventionState) =>
                                    state.householdMembers.firstOrNull?.tasks
                                                ?.lastOrNull?.status ==
                                            Status.administeredSuccess.toValue()
                                        ? Offstage(
                                            offstage: overviewTemplate
                                                    ?.properties?[
                                                        registration_keys
                                                            .commonKeys
                                                            .secondaryButtonKey]
                                                    ?.hidden ??
                                                false,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: spacer2),
                                              child: DigitButton(
                                                label: localizations.translate(
                                                  overviewTemplate
                                                          ?.properties?[
                                                              registration_keys
                                                                  .commonKeys
                                                                  .secondaryButtonKey]
                                                          ?.label ??
                                                      '${RegistrationDeliverySingleton().selectedProject!.projectType}_${i18.memberCard.deliverDetailsUpdateLabel}',
                                                ),
                                                capitalizeLetters: false,
                                                isDisabled: state
                                                            .householdMembers
                                                            .first
                                                            .tasks
                                                            ?.lastOrNull
                                                            ?.status ==
                                                        Status
                                                            .administeredSuccess
                                                            .toValue()
                                                    ? true
                                                    : false,
                                                type: DigitButtonType.secondary,
                                                size: DigitButtonSize.large,
                                                mainAxisSize: MainAxisSize.max,
                                                onPressed: () {
                                                  serviceDefinitionState.when(
                                                      empty: () {},
                                                      isloading: () {},
                                                      serviceDefinitionFetch:
                                                          (value, model) {
                                                        if (value
                                                            .where((element) =>
                                                                element.code
                                                                    .toString()
                                                                    .contains(
                                                                        '${RegistrationDeliverySingleton().selectedProject!.name}.${RegistrationDeliveryEnums.eligibility.toValue()}'))
                                                            .toList()
                                                            .isEmpty) {
                                                          //TODO: need to handle in smc flow
                                                          // context.router.push(
                                                          //   DeliverInterventionRoute(),
                                                          // );
                                                        } else {
                                                          navigateToChecklist(
                                                              ctx,
                                                              state
                                                                  .householdMembers
                                                                  .first
                                                                  .household!
                                                                  .clientReferenceId,
                                                              state
                                                                  .householdMembers
                                                                  .first
                                                                  .household
                                                                  ?.address);
                                                        }
                                                      });
                                                  callReloadEvent(
                                                      offset: state
                                                          .householdMembers
                                                          .first
                                                          .members!
                                                          .length,
                                                      limit: limit);
                                                },
                                              ),
                                            ),
                                          )
                                        : Offstage(
                                            offstage: (overviewTemplate
                                                    ?.properties?[
                                                        registration_keys
                                                            .commonKeys
                                                            .primaryButtonKey]
                                                    ?.hidden ??
                                                false),
                                            child: DigitButton(
                                              label: localizations.translate(
                                                overviewTemplate
                                                        ?.properties?[
                                                            registration_keys
                                                                .commonKeys
                                                                .primaryButtonKey]
                                                        ?.label ??
                                                    '${RegistrationDeliverySingleton().selectedProject!.projectType}_${i18.householdOverView.householdOverViewActionText}',
                                              ),
                                              capitalizeLetters: false,
                                              type: DigitButtonType.primary,
                                              size: DigitButtonSize.large,
                                              mainAxisSize: MainAxisSize.max,
                                              isDisabled: (state
                                                                  .householdMembers
                                                                  .firstOrNull
                                                                  ?.projectBeneficiaries ??
                                                              [])
                                                          .isEmpty ||
                                                      state
                                                              .householdMembers
                                                              .first
                                                              .tasks
                                                              ?.lastOrNull
                                                              ?.status ==
                                                          Status.closeHousehold
                                                              .toValue()
                                                  ? true
                                                  : false,
                                              onPressed: () async {
                                                serviceDefinitionState.when(
                                                    empty: () {},
                                                    isloading: () {},
                                                    serviceDefinitionFetch:
                                                        (value, model) {
                                                      if (value
                                                          .where((element) =>
                                                              element.code
                                                                  .toString()
                                                                  .contains(
                                                                      '${RegistrationDeliverySingleton().selectedProject?.name}.${RegistrationDeliveryEnums.iec.toValue()}') ||
                                                              element.code
                                                                  .toString()
                                                                  .contains(
                                                                      '${RegistrationDeliverySingleton().selectedProject!.name}.${RegistrationDeliveryEnums.eligibility.toValue()}'))
                                                          .toList()
                                                          .isEmpty) {
                                                        context.router.push(
                                                          BeneficiaryDetailsRoute(),
                                                        );
                                                      } else {
                                                        navigateToChecklist(
                                                            ctx,
                                                            RegistrationDeliverySingleton()
                                                                        .beneficiaryType ==
                                                                    BeneficiaryType
                                                                        .individual
                                                                ? state
                                                                    .selectedIndividual!
                                                                    .clientReferenceId
                                                                : state
                                                                    .householdMembers
                                                                    .first
                                                                    .household!
                                                                    .clientReferenceId,
                                                            state
                                                                .householdMembers
                                                                .first
                                                                .household
                                                                ?.address);
                                                      }
                                                    });
                                                callReloadEvent(
                                                    offset: state
                                                        .householdMembers
                                                        .first
                                                        .members!
                                                        .length,
                                                    limit: limit);
                                              },
                                            ),
                                          ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      slivers: [
                        SliverToBoxAdapter(
                          child: DigitCard(
                              margin: const EdgeInsets.all(spacer2),
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(spacer2),
                                        child: Text(
                                          overviewTemplate?.label != null
                                              ? localizations.translate(
                                                  overviewTemplate?.label ??
                                                      i18.householdOverView
                                                          .householdOverViewLabel)
                                              : localizations.translate(i18
                                                  .householdOverView
                                                  .householdOverViewLabel),
                                          style: textTheme.headingXl.copyWith(
                                              color: theme
                                                  .colorTheme.primary.primary2),
                                        ),
                                      ),
                                    ),
                                    if ((state.householdMembers.firstOrNull
                                                ?.projectBeneficiaries ??
                                            [])
                                        .isNotEmpty)
                                      Offstage(
                                        offstage: overviewTemplate
                                                ?.properties?[registration_keys
                                                    .householdOverViewKeys
                                                    .editHouseholdKey]
                                                ?.hidden ??
                                            true,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: DigitButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (ctx) =>
                                                    DigitActionCard(
                                                  actions: [
                                                    DigitButton(
                                                      capitalizeLetters: false,
                                                      prefixIcon: Icons.edit,
                                                      label: (RegistrationDeliverySingleton()
                                                                  .householdType ==
                                                              HouseholdType
                                                                  .community)
                                                          ? localizations.translate(i18
                                                              .householdOverView
                                                              .clfOverViewEditLabel)
                                                          : localizations
                                                              .translate(
                                                              i18.householdOverView
                                                                  .householdOverViewEditLabel,
                                                            ),
                                                      type: DigitButtonType
                                                          .secondary,
                                                      size:
                                                          DigitButtonSize.large,
                                                      onPressed: () async {
                                                        Navigator.of(
                                                          context,
                                                          rootNavigator: true,
                                                        ).pop();

                                                        HouseholdWrapper
                                                            wrapper = state
                                                                .householdMembers
                                                                .first;

                                                        final mapper =
                                                            ReverseFormMapper(
                                                          formConfig: jsonConfig[
                                                              'beneficiaryRegistration']!,
                                                          modelInstances: [
                                                            if (wrapper
                                                                    .household !=
                                                                null)
                                                              wrapper
                                                                  .household!,
                                                            if (wrapper
                                                                    .individuals
                                                                    ?.first !=
                                                                null)
                                                              wrapper
                                                                  .individuals!
                                                                  .first,
                                                            if (wrapper.members
                                                                    ?.first !=
                                                                null)
                                                              wrapper.members!
                                                                  .first,
                                                            if (wrapper
                                                                    .projectBeneficiaries
                                                                    ?.first !=
                                                                null)
                                                              wrapper
                                                                  .projectBeneficiaries!
                                                                  .first,
                                                          ],
                                                        );

                                                        final formData = mapper
                                                            .buildFormData();

                                                        final pageName = context
                                                            .read<FormsBloc>()
                                                            .state
                                                            .cachedSchemas[
                                                                'REGISTRATIONFLOW']
                                                            ?.pages
                                                            .entries
                                                            .first
                                                            .key;

                                                        context.router.push(
                                                            FormsRenderRoute(
                                                          isEdit: true,
                                                          currentSchemaKey:
                                                              'REGISTRATIONFLOW',
                                                          pageName: pageName!,

                                                          /// as registraion is there assuming form won't be null
                                                          defaultValues:
                                                              formData,
                                                        ));
                                                        callReloadEvent(
                                                            offset: 0,
                                                            limit: 10);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            label: overviewTemplate
                                                        ?.properties?[
                                                            registration_keys
                                                                .householdOverViewKeys
                                                                .editHouseholdKey]
                                                        ?.label !=
                                                    null
                                                ? localizations.translate(overviewTemplate
                                                        ?.properties?[
                                                            registration_keys
                                                                .householdOverViewKeys
                                                                .editHouseholdKey]
                                                        ?.label ??
                                                    i18.householdOverView
                                                        .householdOverViewEditIconText)
                                                : (RegistrationDeliverySingleton()
                                                            .householdType ==
                                                        HouseholdType.community)
                                                    ? localizations.translate(i18
                                                        .householdOverView
                                                        .clfOverViewEditIconText)
                                                    : localizations.translate(
                                                        i18.householdOverView
                                                            .householdOverViewEditIconText,
                                                      ),
                                            type: DigitButtonType.tertiary,
                                            size: DigitButtonSize.medium,
                                            prefixIcon: Icons.edit,
                                            capitalizeLetters: false,
                                          ),
                                        ),
                                      ),

                                    ///Old UI Format
                                    // BlocBuilder<DeliverInterventionBloc,
                                    //     DeliverInterventionState>(
                                    //   builder: (ctx, deliverInterventionState) =>
                                    //       Offstage(
                                    //     offstage: beneficiaryType ==
                                    //         BeneficiaryType.individual,
                                    //     child: Align(
                                    //       alignment: Alignment.centerLeft,
                                    //       child: DigitIconButton(
                                    //         icon: getStatusAttributes(state,
                                    //             deliverInterventionState)['icon'],
                                    //         iconText: localizations.translate(
                                    //           getStatusAttributes(state,
                                    //                   deliverInterventionState)[
                                    //               'textLabel'],
                                    //         ), // [TODO: map task status accordingly based on projectBeneficiaries and tasks]
                                    //         iconTextColor: getStatusAttributes(state,
                                    //             deliverInterventionState)['color'],
                                    //         iconColor: getStatusAttributes(state,
                                    //             deliverInterventionState)['color'],
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: spacer2,
                                        right: spacer2,
                                      ),
                                      child: BlocBuilder<
                                              RegistrationWrapperBloc,
                                              RegistrationWrapperState>(
                                          builder:
                                              (ctx, deliverInterventionState) {
                                        bool shouldShowStatus =
                                            beneficiaryType ==
                                                BeneficiaryType.household;

                                        if (RegistrationDeliverySingleton()
                                                .householdType ==
                                            HouseholdType.community) {
                                          return Column(
                                            children: [
                                              DigitTableCard(element: {
                                                localizations.translate(i18
                                                    .householdOverView
                                                    .instituteNameLabel): state
                                                        .householdMembers
                                                        .first
                                                        .household
                                                        ?.address
                                                        ?.buildingName ??
                                                    localizations.translate(i18
                                                        .common.coreCommonNA),
                                                localizations.translate(
                                                  i18.deliverIntervention
                                                      .memberCountText,
                                                ): state.householdMembers.first
                                                    .household?.memberCount,
                                                localizations.translate(
                                                  i18.householdLocation
                                                      .administrationAreaFormLabel,
                                                ): localizations.translate(state
                                                        .householdMembers
                                                        .first
                                                        .headOfHousehold
                                                        ?.address
                                                        ?.first
                                                        .locality
                                                        ?.code ??
                                                    i18.common.coreCommonNA),
                                              }),
                                            ],
                                          );
                                        }

                                        return overviewTemplate
                                                    ?.properties?[
                                                        registration_keys
                                                            .householdOverViewKeys
                                                            .detailsCardKey]
                                                    ?.hidden !=
                                                true
                                            ? Column(
                                                children: [
                                                  DigitTableCard(
                                                    element: buildEnumValueMap(
                                                                state
                                                                    .householdMembers
                                                                    .firstOrNull,
                                                                overviewTemplate
                                                                    ?.properties?[registration_keys
                                                                        .householdOverViewKeys
                                                                        .detailsCardKey]
                                                                    ?.enums)
                                                            ?.map((k, v) => MapEntry(
                                                                localizations
                                                                    .translate(
                                                                        k),
                                                                localizations
                                                                    .translate(v
                                                                        .toString()))) ??
                                                        {
                                                          localizations.translate(i18
                                                              .householdOverView
                                                              .householdOverViewHouseholdHeadNameLabel): state
                                                                  .householdMembers
                                                                  .firstOrNull
                                                                  ?.headOfHousehold
                                                                  ?.name
                                                                  ?.givenName ??
                                                              localizations
                                                                  .translate(i18
                                                                      .common
                                                                      .coreCommonNA),
                                                          localizations
                                                              .translate(
                                                            i18.householdLocation
                                                                .administrationAreaFormLabel,
                                                          ): localizations.translate(state
                                                                  .householdMembers
                                                                  .firstOrNull
                                                                  ?.headOfHousehold
                                                                  ?.address
                                                                  ?.first
                                                                  .locality
                                                                  ?.code ??
                                                              i18.common
                                                                  .coreCommonNA),
                                                          localizations
                                                              .translate(
                                                            i18.deliverIntervention
                                                                .memberCountText,
                                                          ): state
                                                              .householdMembers
                                                              .firstOrNull
                                                              ?.household
                                                              ?.memberCount,
                                                          if (shouldShowStatus)
                                                            localizations.translate(i18
                                                                    .beneficiaryDetails
                                                                    .status):
                                                                localizations
                                                                    .translate(
                                                              getStatusAttributes(
                                                                      state)[
                                                                  'textLabel'],
                                                            )
                                                        },
                                                  ),
                                                ],
                                              )
                                            : const SizedBox.shrink();
                                      }),
                                    ),
                                    if (RegistrationDeliverySingleton()
                                            .householdType ==
                                        HouseholdType.community) ...[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: spacer2, bottom: spacer2),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: DigitSearchBar(
                                                controller: searchController,
                                                hintText:
                                                    localizations.translate(
                                                  i18.common.searchByName,
                                                ),
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                onChanged: (value) {
                                                  if (value.length >= 3) {
                                                    callReloadEvent(
                                                        offset: 0, limit: 10);
                                                  } else if (searchController
                                                      .value.text.isEmpty) {
                                                    callReloadEvent(
                                                        offset: 0, limit: 10);
                                                  }
                                                },
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                getFilters()
                                                    ? Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(spacer2),
                                                          child: DigitButton(
                                                            label:
                                                                getFilterIconNLabel()[
                                                                    'label'],
                                                            size:
                                                                DigitButtonSize
                                                                    .medium,
                                                            type:
                                                                DigitButtonType
                                                                    .tertiary,
                                                            suffixIcon:
                                                                getFilterIconNLabel()[
                                                                    'icon'],
                                                            onPressed: () =>
                                                                showFilterDialog(),
                                                          ),
                                                        ),
                                                      )
                                                    : const Offstage(),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              spacer1),
                                                      child: DigitChip(
                                                        label:
                                                            '${localizations.translate(getStatus(selectedFilters[index]))}'
                                                            ' (${state.householdMembers.firstOrNull?.members?.length})',
                                                        onItemDelete: () {
                                                          selectedFilters.remove(
                                                              selectedFilters[
                                                                  index]);
                                                          callReloadEvent(
                                                              offset: 0,
                                                              limit: 10);
                                                        },
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          )
                                        : const Offstage(),
                                    Column(
                                      children:
                                          (state.householdMembers.firstOrNull
                                                      ?.individuals
                                                      ?.where((m) {
                                                    // Identify if this member is a "child" in any other member's relationships
                                                    final isChild = state
                                                        .householdMembers
                                                        .first
                                                        .members
                                                        ?.any((member) =>
                                                            member.memberRelationships !=
                                                                null &&
                                                            member
                                                                .memberRelationships!
                                                                .isNotEmpty &&
                                                            member.individualClientReferenceId ==
                                                                m.clientReferenceId);

                                                    return !(isChild ??
                                                        false); // Only show if not a child
                                                  }).toList() ??
                                                  [])
                                              .map(
                                        (e) {
                                          final isHead = state
                                                  .householdMembers
                                                  .first
                                                  .headOfHousehold
                                                  ?.clientReferenceId ==
                                              e.clientReferenceId;

                                          final household = state
                                              .householdMembers.first.household;

                                          final projectBeneficiaryId = state
                                              .householdMembers
                                              .first
                                              .projectBeneficiaries
                                              ?.firstWhereOrNull((b) =>
                                                  b.beneficiaryClientReferenceId ==
                                                  e.clientReferenceId)
                                              ?.clientReferenceId;

                                          final projectBeneficiary = state
                                              .householdMembers
                                              .first
                                              .projectBeneficiaries
                                              ?.where(
                                                (element) =>
                                                    element
                                                        .beneficiaryClientReferenceId ==
                                                    (RegistrationDeliverySingleton()
                                                                .beneficiaryType ==
                                                            BeneficiaryType
                                                                .individual
                                                        ? e.clientReferenceId
                                                        : state
                                                            .householdMembers
                                                            .first
                                                            .household
                                                            ?.clientReferenceId),
                                              )
                                              .toList();

                                          final taskData = (projectBeneficiary ??
                                                      [])
                                                  .isNotEmpty
                                              ? state.householdMembers
                                                  .firstOrNull?.tasks
                                                  ?.where((element) =>
                                                      element
                                                          .projectBeneficiaryClientReferenceId ==
                                                      projectBeneficiary?.first
                                                          .clientReferenceId)
                                                  .toList()
                                              : null;
                                          final referralData =
                                              (projectBeneficiary ?? [])
                                                      .isNotEmpty
                                                  ? state.householdMembers.first
                                                      .referrals
                                                      ?.where((element) =>
                                                          element
                                                              .projectBeneficiaryClientReferenceId ==
                                                          projectBeneficiary
                                                              ?.first
                                                              .clientReferenceId)
                                                      .toList()
                                                  : null;
                                          final sideEffectData = taskData !=
                                                      null &&
                                                  taskData.isNotEmpty
                                              ? state.householdMembers.first
                                                  .sideEffects
                                                  ?.where((element) =>
                                                      element
                                                          .taskClientReferenceId ==
                                                      taskData.lastOrNull
                                                          ?.clientReferenceId)
                                                  .toList()
                                              : null;

                                          final childBeneficiaries = (state
                                                  .householdMembers
                                                  .first
                                                  .members
                                                  ?.where((childMem) {
                                                final parentBeneficiary = state
                                                    .householdMembers
                                                    .first
                                                    .members
                                                    ?.where((element) =>
                                                        element
                                                            .individualClientReferenceId ==
                                                        e.clientReferenceId)
                                                    .firstOrNull;

                                                final isChild = state
                                                    .householdMembers
                                                    .first
                                                    .members
                                                    ?.any((member) =>
                                                        member.individualClientReferenceId ==
                                                            childMem
                                                                .clientReferenceId &&
                                                        (member.memberRelationships
                                                                ?.any(
                                                              (rel) =>
                                                                  rel.relativeClientReferenceId ==
                                                                  parentBeneficiary
                                                                      ?.clientReferenceId,
                                                            ) ??
                                                            false));
                                                return (isChild ??
                                                    false); // Only include if it is a child
                                              }).toList() ??
                                              []);

                                          final ageInYears =
                                              e.dateOfBirth != null
                                                  ? DigitDateUtils.calculateAge(
                                                      DigitDateUtils
                                                              .getFormattedDateToDateTime(
                                                            e.dateOfBirth!,
                                                          ) ??
                                                          DateTime.now(),
                                                    ).years
                                                  : 0;
                                          final ageInMonths =
                                              e.dateOfBirth != null
                                                  ? DigitDateUtils.calculateAge(
                                                      DigitDateUtils
                                                              .getFormattedDateToDateTime(
                                                            e.dateOfBirth!,
                                                          ) ??
                                                          DateTime.now(),
                                                    ).months
                                                  : 0;
                                          final currentCycle =
                                              RegistrationDeliverySingleton()
                                                  .projectType
                                                  ?.cycles
                                                  ?.firstWhereOrNull(
                                                    (e) =>
                                                        (e.startDate) <
                                                            DateTime.now()
                                                                .millisecondsSinceEpoch &&
                                                        (e.endDate) >
                                                            DateTime.now()
                                                                .millisecondsSinceEpoch,
                                                  );

                                          final isBeneficiaryRefused =
                                              checkIfBeneficiaryRefused(
                                            taskData,
                                          );
                                          final isBeneficiaryReferred =
                                              checkIfBeneficiaryReferred(
                                            referralData,
                                            currentCycle,
                                          );

                                          return MemberCard(
                                            isHead: isHead,
                                            individual: e,
                                            household: household,
                                            // children: childBeneficiaries,
                                            projectBeneficiaries:
                                                projectBeneficiary ?? [],
                                            tasks: taskData,
                                            sideEffects: sideEffectData,
                                            editMemberActionProperties:
                                                overviewTemplate?.properties?[
                                                    registration_keys
                                                        .householdOverViewKeys
                                                        .editIndividualKey],
                                            primaryButtonProperties:
                                                overviewTemplate?.properties?[
                                                    registration_keys
                                                        .householdOverViewKeys
                                                        .individualPrimaryButtonKey],
                                            secondaryButtonProperties:
                                                overviewTemplate?.properties?[
                                                    registration_keys
                                                        .householdOverViewKeys
                                                        .individualSecondaryButtonKey],
                                            editMemberAction: () async {
                                              //TODO: need to add logic for edit member
                                            },
                                            setAsHeadAction: () {
                                              /// TODO: need to add event in wrapper class for head change

                                              Navigator.of(
                                                context,
                                                rootNavigator: true,
                                              ).pop();
                                            },
                                            deleteMemberAction: () {
                                              showCustomPopup(
                                                context: ctx,
                                                builder: (BuildContext
                                                        context) =>
                                                    Popup(
                                                        title: localizations
                                                            .translate(i18
                                                                .householdOverView
                                                                .householdOverViewActionCardTitle),
                                                        type: PopUpType.simple,
                                                        actions: [
                                                      DigitButton(
                                                          label: localizations
                                                              .translate(i18
                                                                  .householdOverView
                                                                  .householdOverViewPrimaryActionLabel),
                                                          onPressed: () {
                                                            Navigator.of(
                                                              context,
                                                              rootNavigator:
                                                                  true,
                                                            )
                                                              ..pop()
                                                              ..pop();

                                                            /// TODO: Need to add logic for deleting a household
                                                          },
                                                          type: DigitButtonType
                                                              .primary,
                                                          size: DigitButtonSize
                                                              .large),
                                                      DigitButton(
                                                          label: localizations
                                                              .translate(i18
                                                                  .householdOverView
                                                                  .householdOverViewSecondaryActionLabel),
                                                          onPressed: () {
                                                            Navigator.of(
                                                              context,
                                                              rootNavigator:
                                                                  true,
                                                            ).pop();
                                                          },
                                                          type: DigitButtonType
                                                              .tertiary,
                                                          size: DigitButtonSize
                                                              .large)
                                                    ]),
                                              );
                                            },
                                            isNotEligible:
                                                RegistrationDeliverySingleton()
                                                            .projectType
                                                            ?.cycles !=
                                                        null
                                                    ? !checkEligibilityForAgeAndSideEffect(
                                                              DigitDOBAgeConvertor(
                                                                years:
                                                                    ageInYears,
                                                                months:
                                                                    ageInMonths,
                                                              ),
                                                              RegistrationDeliverySingleton()
                                                                  .projectType,
                                                              (taskData ?? [])
                                                                      .isNotEmpty
                                                                  ? taskData
                                                                      ?.lastOrNull
                                                                  : null,
                                                              sideEffectData,
                                                            ) ||
                                                            (taskData ?? [])
                                                                .isNotEmpty
                                                        ? taskData?.lastOrNull
                                                                ?.status ==
                                                            Status.ineligible
                                                                .toValue()
                                                                .toString()
                                                        : !checkEligibilityForAgeAndSideEffect(
                                                            DigitDOBAgeConvertor(
                                                              years: ageInYears,
                                                              months:
                                                                  ageInMonths,
                                                            ),
                                                            RegistrationDeliverySingleton()
                                                                .projectType,
                                                            (taskData ?? [])
                                                                    .isNotEmpty
                                                                ? taskData
                                                                    ?.lastOrNull
                                                                : null,
                                                            sideEffectData,
                                                          )
                                                    : false,
                                            name: e.name?.givenName ?? ' - - ',
                                            years: (e.dateOfBirth == null
                                                ? null
                                                : DigitDateUtils.calculateAge(
                                                    DigitDateUtils
                                                            .getFormattedDateToDateTime(
                                                          e.dateOfBirth!,
                                                        ) ??
                                                        DateTime.now(),
                                                  ).years),
                                            months: (e.dateOfBirth == null
                                                ? null
                                                : DigitDateUtils.calculateAge(
                                                    DigitDateUtils
                                                            .getFormattedDateToDateTime(
                                                          e.dateOfBirth!,
                                                        ) ??
                                                        DateTime.now(),
                                                  ).months),
                                            gender: e.gender?.name,
                                            isBeneficiaryRefused:
                                                isBeneficiaryRefused &&
                                                    !checkStatus(
                                                      taskData,
                                                      currentCycle,
                                                    ),
                                            isBeneficiaryReferred:
                                                isBeneficiaryReferred,
                                            isDelivered: taskData == null
                                                ? false
                                                : taskData.isNotEmpty &&
                                                        !checkStatus(
                                                          taskData,
                                                          currentCycle,
                                                        )
                                                    ? true
                                                    : false,
                                            localizations: localizations,
                                            projectBeneficiaryClientReferenceId:
                                                projectBeneficiaryId,
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ],
                                ),
                                Offstage(
                                  offstage: overviewTemplate
                                          ?.properties?[registration_keys
                                              .householdOverViewKeys
                                              .addMemberKey]
                                          ?.hidden ??
                                      false,
                                  child: DigitButton(
                                    mainAxisSize: MainAxisSize.max,
                                    onPressed: () => addIndividual(
                                      context,
                                      state.householdMembers.first.household!,
                                    ),
                                    label: localizations.translate(
                                      overviewTemplate
                                              ?.properties?[registration_keys
                                                  .householdOverViewKeys
                                                  .addMemberKey]
                                              ?.label ??
                                          i18.householdOverView
                                              .householdOverViewAddActionText,
                                    ),
                                    prefixIcon: Icons.add_circle,
                                    type: DigitButtonType.tertiary,
                                    size: DigitButtonSize.large,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  addIndividual(BuildContext context, HouseholdModel household) async {
    // TODO: Need to add logic for adding members
  }

  bool isOutsideProjectDateRange() {
    final project = RegistrationDeliverySingleton().selectedProject;

    if (project?.startDate != null && project?.endDate != null) {
      final now = DateTime.now().millisecondsSinceEpoch;
      final startDate = project!.startDate!;
      final endDate = project.endDate!;

      return now < startDate || now > endDate;
    }

    return false;
  }

  getStatusAttributes(RegistrationWrapperState state) {
    var textLabel =
        i18.householdOverView.householdOverViewNotRegisteredIconLabel;
    var color = DigitTheme.instance.colorScheme.error;
    var icon = Icons.info_rounded;

    if ((state.householdMembers.firstOrNull?.projectBeneficiaries ?? [])
        .isNotEmpty) {
      textLabel = state.householdMembers.firstOrNull?.tasks?.isNotEmpty ?? false
          ? getTaskStatus(state.householdMembers.firstOrNull?.tasks ?? [])
                      .toValue() ==
                  Status.administeredSuccess.toValue()
              ? '${RegistrationDeliverySingleton().selectedProject!.projectType}_${getTaskStatus(state.householdMembers.firstOrNull?.tasks ?? []).toValue()}'
              : getTaskStatus(state.householdMembers.firstOrNull?.tasks ?? [])
                  .toValue()
          : Status.registered.toValue();

      color = state.householdMembers.firstOrNull?.tasks?.isNotEmpty ?? false
          ? (state.householdMembers.firstOrNull?.tasks?.lastOrNull?.status ==
                  Status.administeredSuccess.toValue()
              ? DigitTheme.instance.colorScheme.onSurfaceVariant
              : DigitTheme.instance.colorScheme.error)
          : DigitTheme.instance.colorScheme.onSurfaceVariant;

      icon = state.householdMembers.firstOrNull?.tasks?.isNotEmpty ?? false
          ? (state.householdMembers.firstOrNull?.tasks?.lastOrNull?.status ==
                  Status.administeredSuccess.toValue()
              ? Icons.check_circle
              : Icons.info_rounded)
          : Icons.check_circle;
    } else {
      textLabel = i18.householdOverView.householdOverViewNotRegisteredIconLabel;
      color = DigitTheme.instance.colorScheme.error;
      icon = Icons.info_rounded;
    }

    return {'textLabel': textLabel, 'color': color, 'icon': icon};
  }

  void navigateToChecklist(BuildContext ctx, String beneficiaryClientRefId,
      AddressModel? address) async {
    //// TODO: need to figure out the logic for
  }

  void callReloadEvent({
    required int offset,
    required int limit,
  }) {
    if (mounted) {
      final bloc = context.read<RegistrationWrapperBloc>();

      RegistrationWrapperEvent.fetchDeliveryDetails(
          projectId: RegistrationDeliverySingleton().selectedProject!.id,
          selectedIndividual: null,
          householdWrapper: HouseholdWrapper(
            household: bloc.state.householdMembers.firstOrNull?.household,
            individuals: bloc.state.householdMembers.firstOrNull?.individuals,
            members: bloc.state.householdMembers.firstOrNull?.members,
            projectBeneficiaries:
                bloc.state.householdMembers.firstOrNull?.projectBeneficiaries,
          ),
          beneficiaryType:
              RegistrationDeliverySingleton().beneficiaryType?.toValue());
    }
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
      selectedFilters.clear();
      selectedFilters.addAll(filters);
      callReloadEvent(offset: 0, limit: 10);
    } else {
      setState(() {
        selectedFilters = [];
      });

      callReloadEvent(offset: 0, limit: 10);
    }
  }

  String getStatus(String selectedFilter) {
    final statusMap = {
      Status.delivered.toValue(): Status.delivered,
      Status.notAdministered.toValue(): Status.notAdministered,
      Status.visited.toValue(): Status.visited,
      Status.notVisited.toValue(): Status.notVisited,
      Status.beneficiaryRefused.toValue(): Status.beneficiaryRefused,
      Status.beneficiaryReferred.toValue(): Status.beneficiaryReferred,
      Status.administeredSuccess.toValue(): Status.administeredSuccess,
      Status.administeredFailed.toValue(): Status.administeredFailed,
      Status.inComplete.toValue(): Status.inComplete,
      Status.toAdminister.toValue(): Status.toAdminister,
      Status.closeHousehold.toValue(): Status.closeHousehold,
      Status.registered.toValue(): Status.registered,
      Status.notRegistered.toValue(): Status.notRegistered,
    };

    var mappedStatus = statusMap.entries
        .where((element) => element.value.name == selectedFilter)
        .first
        .key;
    if (mappedStatus != null) {
      return mappedStatus;
    } else {
      return selectedFilter;
    }
  }

  getFilters() {
    bool hasFilters;
    if (RegistrationDeliverySingleton().householdType ==
        HouseholdType.community) {
      hasFilters = RegistrationDeliverySingleton().searchCLFFilters != null &&
          RegistrationDeliverySingleton().searchCLFFilters!.isNotEmpty;
    } else {
      hasFilters =
          RegistrationDeliverySingleton().searchHouseHoldFilter != null &&
              RegistrationDeliverySingleton().searchHouseHoldFilter!.isNotEmpty;
    }
    return hasFilters;
  }
}
