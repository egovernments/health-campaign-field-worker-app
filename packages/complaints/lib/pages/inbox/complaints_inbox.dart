import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:complaints/blocs/complaint_wrapper/complaint_wrapper_bloc.dart';
import 'package:complaints/router/complaints_router.gm.dart';
import 'package:complaints/utils/constants.dart';
import 'package:digit_data_converter/src/transformer_service.dart';
import 'package:digit_data_model/models/entities/pgr_application_status.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/router/forms_router.gm.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
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
    context
        .read<ComplaintWrapperBloc>()
        .add(const ComplaintWrapperEvent.loadFromGlobal());

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
      body: BlocListener<ComplaintWrapperBloc, ComplaintWrapperState>(
          listener: (context, wrapperState) {
            if (wrapperState.lastAction == ComplaintWrapperActionType.created) {
              Navigator.of(context, rootNavigator: true).pop();
              final currentSchema =
                  context.read<FormsBloc>().state.cachedSchemas[
                      context.read<FormsBloc>().state.activeSchemaKey];

              context.read<FormsBloc>().add(
                    FormsEvent.clearForm(
                        schemaKey: complaintKeys
                            .complaintForm), // or create a FormsResetEvent
                  );

              final pages = currentSchema?.pages.entries.toList()
                ?..sort((a, b) =>
                    (a.value.order ?? 0).compareTo(b.value.order ?? 0));

              final lastPage =
                  pages?.isNotEmpty == true ? pages!.last.value : null;

              final nextAction = lastPage?.navigateTo;

              context
                  .read<ComplaintWrapperBloc>()
                  .add(const ComplaintWrapperEvent.loadFromGlobal());

              if (nextAction != null) {
                if (nextAction.type == 'template') {
                  final nextPath = routerMap[nextAction.name];
                  if (nextPath != null) {
                    context.router.push(nextPath);
                  }
                }
              } else {
                // context.router.push(BeneficiaryAcknowledgementRoute(
                //     enableViewHousehold: true)); // fallback page
              }
            } else if (wrapperState.error != null) {
              Navigator.of(context, rootNavigator: true).pop();
              // Reset to prevent re-handling
              context.read<FormsBloc>().add(
                    FormsEvent.clearForm(
                        schemaKey: complaintKeys
                            .complaintForm), // or create a FormsResetEvent
                  );
              // context.router
              //     .push(BeneficiaryErrorRoute(enableViewHousehold: false));
              if (kDebugMode) {
                print(wrapperState.error);
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
                final modelsConfig = (jsonConfig['complaintRegistration']
                    ?['models'] as Map<String, dynamic>);

                final fallBackModel = jsonConfig['complaintRegistration']
                    ?['fallbackModel'] as String?;

                final formEntityMapper = FormEntityMapper(config: jsonConfig);

                final entities = formEntityMapper.mapFormToEntities(
                  formValues: formData,
                  modelsConfig: modelsConfig,
                  context: {
                    "tenantId": ComplaintsSingleton().tenantId,
                    "selectedBoundaryCode":
                        ComplaintsSingleton().boundary?.code,
                    'userName': ComplaintsSingleton().loggedInUserName,
                    'userId': ComplaintsSingleton().loggedInUserUuid,
                    'userUUID': ComplaintsSingleton().loggedInUserUuid,
                  },
                  fallbackFormDataString: fallBackModel,
                );

                context.read<ComplaintWrapperBloc>().add(
                      Create(entities: entities),
                    );
              } catch (e) {
                Navigator.of(context, rootNavigator: true).pop();
                // Reset to prevent re-handling
                context.read<FormsBloc>().add(
                      FormsEvent.clearForm(
                          schemaKey: complaintKeys
                              .complaintForm), // or create a FormsResetEvent
                    );
              }
            }
          }, child: BlocBuilder<ComplaintWrapperBloc, ComplaintWrapperState>(
            builder: (context, state) {
              final inboxItems = state.isFiltered
                  ? state.filteredComplaints
                  : state.complaints;

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
                              localizations
                                  .translate(inboxTemplate?.label ?? ""),
                              style: textTheme.headingXl.copyWith(
                                  color: theme.colorTheme.primary.primary2),
                            ),
                          ),
                        ),
                        if (inboxTemplate
                                    ?.properties?[
                                        complaintKeys.searchComplaints]
                                    ?.hidden !=
                                true ||
                            inboxTemplate
                                    ?.properties?[
                                        complaintKeys.filterComplaints]
                                    ?.hidden !=
                                true ||
                            inboxTemplate
                                    ?.properties?[complaintKeys.sortComplaints]
                                    ?.hidden !=
                                true) ...[
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: spacer2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (inboxTemplate
                                          ?.properties?[
                                              complaintKeys.searchComplaints]
                                          ?.hidden !=
                                      true)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: spacer2 * 2),
                                      child: DigitButton(
                                        type: DigitButtonType.tertiary,
                                        size: DigitButtonSize.medium,
                                        prefixIcon: Icons.search,
                                        label: localizations.translate(
                                            inboxTemplate
                                                    ?.properties?[complaintKeys
                                                        .searchComplaints]
                                                    ?.label ??
                                                ""),
                                        onPressed: () {
                                          context.router.push(
                                            ComplaintsInboxDialogRoute(
                                              type: ComplaintsInboxDialogType
                                                  .search,
                                              titleKey: 'Search Complaints',
                                              ctaKey: "SEARCH",
                                              buildForm: () => fb.group({
                                                'complaintNumber':
                                                    FormControl<String>(
                                                        value: state.searchKeys
                                                            ?.complaintNumber),
                                                'mobileNumber':
                                                    FormControl<String>(
                                                  value: state.searchKeys
                                                      ?.complainantMobileNumber,
                                                  validators: [
                                                    Validators.delegate(
                                                      (validator) =>
                                                          CustomValidator
                                                              .validMobileNumber(
                                                                  validator),
                                                    )
                                                  ],
                                                ),
                                              }),
                                              buildFields:
                                                  buildComplaintSearchFields,
                                              onSubmit: (ctx, form) {
                                                final complaintNumber = form
                                                    .control('complaintNumber')
                                                    .value as String?;
                                                final mobileNumber = form
                                                    .control('mobileNumber')
                                                    .value as String?;
                                                context
                                                    .read<
                                                        ComplaintWrapperBloc>()
                                                    .add(ComplaintWrapperEvent
                                                        .search(
                                                            mobileNumber:
                                                                mobileNumber,
                                                            complaintNumber:
                                                                complaintNumber));
                                                context.router.pop();
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  if (inboxTemplate
                                          ?.properties?[
                                              complaintKeys.filterComplaints]
                                          ?.hidden !=
                                      true)
                                    Padding(
                                      padding: EdgeInsets.zero,
                                      child: DigitButton(
                                        type: DigitButtonType.tertiary,
                                        size: DigitButtonSize.medium,
                                        label: localizations.translate(
                                            inboxTemplate
                                                    ?.properties?[complaintKeys
                                                        .filterComplaints]
                                                    ?.label ??
                                                ""),
                                        prefixIcon: Icons.filter_list_alt,
                                        onPressed: () => {
                                          context.router.push(
                                            ComplaintsInboxDialogRoute(
                                              type: ComplaintsInboxDialogType
                                                  .filter,
                                              titleKey: i18.complaints
                                                  .complaintInboxFilterHeading,
                                              ctaKey: i18.complaints.filterCTA,
                                              buildForm: () => fb.group({
                                                'complaintType':
                                                    FormControl<String>(),
                                                'complaintLocality':
                                                    FormControl<String>(),
                                                'complaintAssignmentType':
                                                    FormControl<String>(),
                                                'complaintStatus':
                                                    FormControl<String>(),
                                              }),
                                              buildFields:
                                                  buildComplaintFilterFields,
                                              onSubmit: (ctx, form) {
                                                final status = form
                                                    .control('status')
                                                    .value as String?;
                                                final priority = form
                                                    .control('priority')
                                                    .value as String?;

                                                if ((status != null &&
                                                        status.isNotEmpty) ||
                                                    (priority != null &&
                                                        priority.isNotEmpty)) {
                                                  // TODO: Dispatch filter event to BLoC
                                                  // ctx.read<ComplaintsInboxBloc>().add(
                                                  //   ComplaintInboxFilterEvent(status: status, priority: priority),
                                                  // );
                                                }
                                                context.router.pop();
                                              },
                                            ),
                                          )
                                        },
                                      ),
                                    ),
                                  if (inboxTemplate
                                          ?.properties?[
                                              complaintKeys.sortComplaints]
                                          ?.hidden !=
                                      true)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: spacer2 * 2),
                                      child: DigitButton(
                                          type: DigitButtonType.tertiary,
                                          size: DigitButtonSize.medium,
                                          label: localizations.translate(
                                              inboxTemplate
                                                      ?.properties?[
                                                          complaintKeys
                                                              .sortComplaints]
                                                      ?.label ??
                                                  ""),
                                          prefixIcon: Icons.segment,
                                          onPressed: () => {
                                                context.router.push(
                                                  ComplaintsInboxDialogRoute(
                                                    type:
                                                        ComplaintsInboxDialogType
                                                            .sort,
                                                    titleKey: i18.complaints
                                                        .complaintInboxSortHeading,
                                                    ctaKey:
                                                        i18.complaints.sortCTA,
                                                    buildForm: () => fb.group({
                                                      'sortOrder':
                                                          FormControl<String>(
                                                              value: state
                                                                  .sortOrder),
                                                    }),
                                                    buildFields:
                                                        buildComplaintSortFields,
                                                    // ⬅ Reused function
                                                    onSubmit: (ctx, form) {
                                                      final sortOrder = form
                                                          .control('sortOrder')
                                                          .value as String?;
                                                      if (sortOrder != null &&
                                                          sortOrder
                                                              .isNotEmpty) {
                                                        ctx
                                                            .read<
                                                                ComplaintWrapperBloc>()
                                                            .add(ComplaintWrapperEvent
                                                                .sort(
                                                                    sortOrder));
                                                      }
                                                      context.router.pop();
                                                    },
                                                  ),
                                                )
                                              }),
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
                                  label: localizations.translate(
                                      i18.complaints.noComplaintsExist),
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
                        if (inboxTemplate
                                ?.properties?['PrimaryButton']?.hidden !=
                            true)
                          DigitButton(
                            label: localizations.translate(inboxTemplate
                                    ?.properties?[
                                        complaintKeys.primaryButtonKey]
                                    ?.label ??
                                ""),
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                            mainAxisSize: MainAxisSize.max,
                            onPressed: () async {
                              var loggedInUserUuid =
                                  ComplaintsSingleton().loggedInUserUuid;
                              context.read<FormsBloc>().add(
                                  FormsEvent.clearForm(
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
                                    'administrativeArea': localizations
                                        .translate(ComplaintsSingleton()
                                                .boundary
                                                ?.code ??
                                            ''),
                                    'loggedInUserName':
                                        ComplaintsSingleton().loggedInUserName,
                                    'loggedInUserMobileNumber':
                                        ComplaintsSingleton().userMobileNumber
                                  },
                                ));
                              }
                            },
                          ),
                      ]),
                ],
              );
            },
          ))),
    );
  }

  Widget buildComplaintSearchFields(BuildContext context, FormGroup form) {
    final localizations = Localizations.of<ComplaintsLocalization>(
        context, ComplaintsLocalization)!;

    const _complaintNumber = "complaintNumber";
    const _mobileNumber = "mobileNumber";

    return Column(
      children: [
        ReactiveWrapperField<String>(
          formControlName: _complaintNumber,
          builder: (field) {
            return LabeledField(
              label: localizations.translate(
                i18.complaints.inboxNumberLabel,
              ),
              child: DigitTextFormInput(
                initialValue: form.control(_complaintNumber).value,
                onChange: (value) =>
                    form.control(_complaintNumber).value = value,
                charCount: true,
                maxLength: 65,
              ),
            );
          },
        ),
        ReactiveWrapperField<String>(
          formControlName: _mobileNumber,
          showErrors: (control) => control.invalid && control.touched,
          validationMessages: {
            'mobileNumber': (object) => localizations.translate(
                  i18.individualDetails
                      .mobileNumberInvalidFormatValidationMessage,
                ),
          },
          builder: (field) {
            return LabeledField(
              label: localizations.translate(
                i18.common.coreCommonMobileNumber,
              ),
              child: DigitTextFormInput(
                charCount: true,
                initialValue: form.control(_mobileNumber).value,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChange: (value) => form.control(_mobileNumber).value = value,
                errorMessage: field.errorText,
                maxLength: 10,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildComplaintFilterFields(BuildContext context, FormGroup form) {
    final localizations = Localizations.of<ComplaintsLocalization>(
        context, ComplaintsLocalization)!;

    final complaintAssignmentTypes = [
      i18.complaints.assignedToAll,
      i18.complaints.assignedToSelf,
    ];

    Map<PgrServiceApplicationStatus, bool> selected = {
      PgrServiceApplicationStatus.created: false,
      PgrServiceApplicationStatus.cancelled: false,
      PgrServiceApplicationStatus.pendingAssignment: false,
      PgrServiceApplicationStatus.rejected: false,
      PgrServiceApplicationStatus.resolved: false,
    };

    Set<String> complaintTypes = HashSet();
    Set<String> locality = HashSet();
    Set<PgrServiceApplicationStatus> uniqueStatuses = HashSet();
    Map<int, int> statusCount = HashMap();

    const _complaintType = "complaintType";
    const _complaintLocality = "complaintLocality";
    const _complaintAssignmentType = "complaintAssignmentType";
    const _complaintStatus = "complaintStatus";
    Set<PgrServiceApplicationStatus> statuses = HashSet();

    return Padding(
      padding: EdgeInsets.zero,
      // padding: const EdgeInsets.all(spacer2 * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioList(
            containerPadding: const EdgeInsets.only(bottom: spacer4),
            radioDigitButtons: complaintAssignmentTypes
                .asMap()
                .entries
                .map((item) => RadioButtonModel(
                      code: item.value,
                      name: localizations.translate(item.value.trim()),
                    ))
                .toList(),
            groupValue: form.control(_complaintAssignmentType).value ?? "",
            onChanged: (changedValue) {
              form.control(_complaintAssignmentType).value = changedValue.code;
            },
          ),
          LabeledField(
            label: localizations.translate(
              i18.complaints.complaintsTypeHeading,
            ),
            child: DigitDropdown<String>(
              items: complaintTypes
                  .toList()
                  .asMap()
                  .entries
                  .map((item) => DropdownItem(
                        name: localizations.translate(item.value
                            .toString()
                            .trim()
                            .snakeCase
                            .toUpperCase()),
                        code: item.value,
                      ))
                  .toList(),
              emptyItemText: localizations.translate(i18.common.noMatchFound),
              isSearchable: true,
              onSelect: (value) =>
                  form.control(_complaintType).value = value.code,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: spacer4),
            child: LabeledField(
              label: localizations.translate(i18.complaints.locality),
              child: DigitDropdown<String>(
                items: locality
                    .toList()
                    .asMap()
                    .entries
                    .map((item) => DropdownItem(
                          name: localizations
                              .translate(item.value.toString().trim()),
                          code: item.value,
                        ))
                    .toList(),
                emptyItemText: localizations.translate(i18.common.noMatchFound),
                onSelect: (value) =>
                    form.control(_complaintLocality).value = value.code,
              ),
            ),
          ),
          if (uniqueStatuses.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.only(top: spacer4),
              child: LabeledField(
                label: localizations.translate(
                  i18.complaints.inboxStatusLabel,
                ),
                child: Column(
                  children: [
                    ...uniqueStatuses.map((e) => Padding(
                          padding: const EdgeInsets.only(
                            top: spacer2,
                          ),
                          child: DigitCheckbox(
                            label:
                                '${localizations.translate('COMPLAINTS_STATUS_${e.name.snakeCase.toUpperCase()}')} (${statusCount[e.index]})',
                            value: selected[e] ?? false,
                            onChanged: (value) {
                              setState(() {
                                if (selected[e]!) {
                                  statuses.remove(e);
                                  selected[e] = false;
                                  return;
                                }

                                selected[e] = true;
                                statuses.add(e);
                              });
                            },
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget buildComplaintSortFields(BuildContext context, FormGroup form) {
    final localizations = Localizations.of<ComplaintsLocalization>(
        context, ComplaintsLocalization)!;

    const _sortOrder = "sortOrder";
    final sortOrders = [
      i18.complaints.complaintsSortDateDesc,
      i18.complaints.complaintsSortDateAsc,
    ];

    return RadioList(
      containerPadding: const EdgeInsets.only(bottom: spacer4),
      radioDigitButtons: sortOrders
          .asMap()
          .entries
          .map(
            (item) => RadioButtonModel(
              code: item.value,
              name: localizations.translate(item.value.trim()),
            ),
          )
          .toList(),
      groupValue: form.control(_sortOrder).value ?? "",
      onChanged: (changedValue) {
        form.control(_sortOrder).value = changedValue.code;
      },
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

    final defaultLocale = Localizations.localeOf(context).toString();

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
                        .getFormattedDate(locale: defaultLocale) ??
                    "",
                labelFlex: 5,
              ),
              LabelValueItem(
                label: localizations.translate(i18.complaints.inboxAreaLabel),
                value:
                    localizations.translate(item.address.locality?.code ?? ""),
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
