import 'dart:collection';

import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../../blocs/auth/auth.dart';
import '../../../blocs/complaints_inbox/complaints_inbox.dart';
import '../../../models/pgr_complaints/pgr_complaints.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/localized.dart';

class ComplaintsInboxFilterPage extends LocalizedStatefulWidget {
  const ComplaintsInboxFilterPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsInboxFilterPage> createState() =>
      _ComplaintsInboxFilterPageState();
}

class _ComplaintsInboxFilterPageState
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
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: theme.colorScheme.onBackground,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () => context.router.pop(),
                          child: const Row(
                            children: [
                              Icon(Icons.close),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
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
                            style: theme.textTheme.displayMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: TextButton(
                              onPressed: () {
                                clearFilters(formGroup);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: theme.colorScheme.onBackground,
                                padding: const EdgeInsets.all(9),
                                side: BorderSide(
                                  width: 1,
                                  color: theme.colorScheme.outline,
                                ),
                              ),
                              child: const Column(
                                children: [
                                  Icon(Icons.autorenew),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                footer: SizedBox(
                  child: DigitCard(
                    margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                    padding:
                        const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: DigitOutLineButton(
                            label: localizations.translate(
                              i18.complaints.complaintsFilterClearAll,
                            ),
                            onPressed: () {
                              clearFilters(formGroup);
                            },
                            buttonStyle: OutlinedButton.styleFrom(
                              shape: const BeveledRectangleBorder(),
                              padding: const EdgeInsets.all(14),
                              side: BorderSide(
                                width: 1.0,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: DigitElevatedButton(
                            onPressed: () {
                              if (!formGroup.valid) return;

                              final bloc = context.read<ComplaintsInboxBloc>();
                              final userBloc = context.read<AuthBloc>();

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
                                  currentUserName: userBloc.state.whenOrNull(
                                    authenticated: (
                                      accessToken,
                                      refreshToken,
                                      userModel,
                                      actions,
                                      individualId,
                                    ) {
                                      return userModel.name;
                                    },
                                  ),
                                  complaintTypeCode: complaintType,
                                  locality: locality,
                                  complaintStatus: statuses.toList(),
                                  createdByUserId: context.loggedInUserUuid,
                                ),
                              );

                              context.router.pop();
                            },
                            child: Center(
                              child: Text(
                                localizations
                                    .translate(i18.complaints.filterCTA),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
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
                                    return RadioGroup<String>.builder(
                                      groupValue: formGroup
                                              .control(_complaintAssignmentType)
                                              .value ??
                                          "",
                                      onChanged: (changedValue) {
                                        setState(() {
                                          formGroup
                                              .control(_complaintAssignmentType)
                                              .value = changedValue;
                                        });
                                      },
                                      items: _complaintAssignmentTypes,
                                      itemBuilder: (item) => RadioButtonBuilder(
                                        localizations.translate(item.trim()),
                                      ),
                                    );
                                  },
                                ),
                                DigitReactiveSearchDropdown<String>(
                                  label: localizations.translate(
                                    i18.complaints.complaintsTypeHeading,
                                  ),
                                  form: formGroup,
                                  menuItems: complaintTypes.toList(),
                                  formControlName: _complaintType,
                                  valueMapper: (value) {
                                    return localizations.translate(
                                      value.snakeCase.toUpperCase().trim(),
                                    );
                                  },
                                  emptyText: localizations
                                      .translate(i18.common.noMatchFound),
                                ),
                                DigitReactiveSearchDropdown<String>(
                                  label: localizations
                                      .translate(i18.complaints.locality),
                                  form: formGroup,
                                  menuItems: locality.toList(),
                                  formControlName: _complaintLocality,
                                  valueMapper: (value) => value.trim(),
                                  emptyText: localizations
                                      .translate(i18.common.noMatchFound),
                                ),
                                if (uniqueStatuses.isNotEmpty) ...[
                                  LabeledField(
                                    label: localizations.translate(
                                      i18.complaints.inboxStatusLabel,
                                    ),
                                    child: Column(
                                      children: [
                                        ...uniqueStatuses.map((e) => Padding(
                                              padding: const EdgeInsets.only(
                                                top: 16,
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
