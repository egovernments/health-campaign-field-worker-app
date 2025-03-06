import 'dart:collection';
import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/models/entities/pgr_application_status.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '/blocs/complaints_inbox/complaints_inbox.dart';

import '/utils/i18_key_constants.dart' as i18;
import '/utils/utils.dart';
import '/widgets/localized.dart';

@RoutePage()
class ComplaintsInboxFilterPage extends LocalizedStatefulWidget {
  const ComplaintsInboxFilterPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsInboxFilterPage> createState() =>
      ComplaintsInboxFilterPageState();
}

class ComplaintsInboxFilterPageState
    extends LocalizedState<ComplaintsInboxFilterPage> {
  static const _complaintType = "complaintType";
  static const _complaintLocality = "complaintLocality";
  static const _complaintAssignmentType = "complaintAssignmentType";
  static const _complaintStatus = "complaintStatus";
  static final _complaintAssignmentTypes = [
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
  bool isFirstBuild = true;
  Set<PgrServiceApplicationStatus> statuses = HashSet();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: BlocBuilder<ComplaintsInboxBloc, ComplaintInboxState>(
        builder: (context, state) {
          return ReactiveFormBuilder(
            form: () => buildForm(state),
            builder: (context, formGroup, child) {
              List<PgrServiceApplicationStatus> selectedStatuses =
                  state.filters?.complaintStatus?.toList() ?? [];

              if (isFirstBuild) {
                for (var element in selectedStatuses) {
                  selected[element] = true;
                  statuses.add(element);
                }
                isFirstBuild = false;
              }

              return ScrollableContent(
                header: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.zero,
                          child: DigitButton(
                            label: "",
                            type: DigitButtonType.tertiary,
                            size: DigitButtonSize.large,
                            onPressed: () => context.router.maybePop(),
                            prefixIcon: Icons.close,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: spacer4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.filter_alt,
                            size: 32,
                          ),
                          Text(
                            localizations.translate(
                              i18.complaints.complaintInboxFilterHeading,
                            ),
                            style: textTheme.headingXl,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: spacer1),
                              child: DigitButton(
                                label: "",
                                type: DigitButtonType.tertiary,
                                size: DigitButtonSize.large,
                                onPressed: () {
                                  clearFilters(formGroup);
                                },
                                prefixIcon: Icons.autorenew,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                enableFixedDigitButton: true,
                footer: DigitCard(
                    cardType: CardType.primary,
                    margin: const EdgeInsets.fromLTRB(0, spacer2, 0, 0),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: DigitButton(
                              type: DigitButtonType.secondary,
                              size: DigitButtonSize.large,
                              label: localizations.translate(
                                i18.complaints.complaintsFilterClearAll,
                              ),
                              onPressed: () {
                                clearFilters(formGroup);
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: DigitButton(
                              label: localizations
                                  .translate(i18.complaints.filterCTA),
                              type: DigitButtonType.primary,
                              size: DigitButtonSize.large,
                              onPressed: () {
                                if (!formGroup.valid) return;

                                final bloc =
                                    context.read<ComplaintsInboxBloc>();

                                final assignedTo = formGroup
                                    .control(_complaintAssignmentType)
                                    .value as String?;

                                final complaintType = formGroup
                                    .control(_complaintType)
                                    .value as String?;

                                final locality = formGroup
                                    .control(_complaintLocality)
                                    .value as String?;

                                bloc.add(
                                  ComplaintInboxFilterComplaintsEvent(
                                    complaintAssignedTo: assignedTo,
                                    currentUserName:
                                        ComplaintsSingleton().loggedInUserName,
                                    complaintTypeCode: complaintType,
                                    locality: locality,
                                    complaintStatus: statuses.toList(),
                                    createdByUserId:
                                        ComplaintsSingleton().loggedInUserUuid,
                                  ),
                                );

                                context.router.pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ]),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(spacer4),
                    child: Column(
                      children: [
                        BlocBuilder<ComplaintsInboxBloc, ComplaintInboxState>(
                          builder: (context, state) {
                            Set<String> complaintTypes = HashSet();
                            Set<String> locality = HashSet();

                            Set<PgrServiceApplicationStatus> uniqueStatuses =
                                HashSet();
                            Map<int, int> statusCount = HashMap();

                            state.maybeWhen(
                              orElse: () {
                                return;
                              },
                              complaints: (
                                loading,
                                isFiltered,
                                complaints,
                                filteredComplaints,
                                filters,
                                searchKeys,
                              ) {
                                for (var e in complaints) {
                                  complaintTypes.add(e.serviceCode.toString());

                                  if (e.address.locality?.name != null) {
                                    locality.add(
                                      e.address.locality?.name ?? "",
                                    );
                                  }

                                  var status = e.applicationStatus;
                                  uniqueStatuses.add(status);
                                  if (statusCount.containsKey(status.index)) {
                                    int count = statusCount[status.index] ?? 0;
                                    statusCount[status.index] = count + 1;
                                  } else {
                                    statusCount[status.index] = 1;
                                  }
                                }
                              },
                            );

                            return Column(
                              children: [
                                BlocBuilder<ComplaintsInboxBloc,
                                    ComplaintInboxState>(
                                  builder: (context, state) {
                                    return Align(
                                      alignment: Alignment.topLeft,
                                      child: RadioList(
                                        containerPadding: const EdgeInsets.only(bottom: spacer4),
                                        radioDigitButtons: _complaintAssignmentTypes
                                            .asMap()
                                            .entries
                                            .map((item) => RadioButtonModel(
                                                  code: item.value,
                                                  name: localizations.translate(
                                                      item.value.trim()),
                                                ))
                                            .toList(),
                                        groupValue: formGroup
                                                .control(
                                                    _complaintAssignmentType)
                                                .value ??
                                            "",
                                        onChanged: (changedValue) {
                                          setState(() {
                                            formGroup
                                                .control(
                                                    _complaintAssignmentType)
                                                .value = changedValue.code;
                                          });
                                        },
                                      ),
                                    );
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
                                              name: localizations.translate(
                                                  item.value
                                                      .toString()
                                                      .trim()
                                                      .snakeCase
                                                      .toUpperCase()),
                                              code: item.value,
                                            ))
                                        .toList(),
                                    emptyItemText: localizations
                                        .translate(i18.common.noMatchFound),
                                    isSearchable: true,
                                    onSelect: (value) => formGroup
                                        .control(_complaintType)
                                        .value = value.code,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: spacer4),
                                  child: LabeledField(
                                    label: localizations
                                        .translate(i18.complaints.locality),
                                    child: DigitDropdown<String>(
                                      items: locality
                                          .toList()
                                          .asMap()
                                          .entries
                                          .map((item) => DropdownItem(
                                                name: localizations.translate(
                                                    item.value
                                                        .toString()
                                                        .trim()),
                                                code: item.value,
                                              ))
                                          .toList(),
                                      emptyItemText: localizations
                                          .translate(i18.common.noMatchFound),
                                      onSelect: (value) => formGroup
                                          .control(_complaintLocality)
                                          .value = value.code,
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  void clearFilters(FormGroup formGroup) {
    setState(() {
      selected.forEach((key, value) {
        selected[key] = false;
      });
      statuses.clear();
      formGroup.control(_complaintType).value = null;
      formGroup.control(_complaintAssignmentType).value = null;
      formGroup.control(_complaintStatus).value = null;
      formGroup.control(_complaintLocality).value = null;
    });
  }

  FormGroup buildForm(ComplaintInboxState state) {
    return fb.group(<String, Object>{
      _complaintType: FormControl<String>(
        value: state.filters?.complaintTypeCode,
        validators: [],
      ),
      _complaintLocality: FormControl<String>(
        value: state.filters?.locality,
        validators: [],
      ),
      _complaintAssignmentType: FormControl<String>(
        value: state.filters?.complaintAssignedTo,
        validators: [],
      ),
      _complaintStatus: FormControl<String>(
        validators: [],
      ),
    });
  }
}
