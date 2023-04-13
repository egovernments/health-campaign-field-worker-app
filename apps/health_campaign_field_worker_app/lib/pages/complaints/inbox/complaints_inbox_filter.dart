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
                          child: Row(
                            children: const [
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
                                selectedStatuses.clear();
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
                              child: Column(
                                children: const [
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
                  height: 85,
                  child: DigitCard(
                    margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: OutlinedButton(
                            onPressed: () {
                              selectedStatuses.clear();
                              clearFilters(formGroup);
                            },
                            style: OutlinedButton.styleFrom(
                              shape: const BeveledRectangleBorder(),
                              padding: const EdgeInsets.all(10),
                              side: BorderSide(
                                width: 1.0,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            child: Text(
                              localizations.translate(
                                i18.complaints.complaintsFilterClearAll,
                              ),
                              style: TextStyle(
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
                                  assignedTo,
                                  userBloc.state.whenOrNull(
                                    authenticated:
                                        (accessToken, refreshToken, userModel) {
                                      return userModel.name;
                                    },
                                  ),
                                  complaintType,
                                  locality,
                                  selectedStatuses,
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
                                complaints,
                                filteredComplaints,
                                filters,
                                searchKeys,
                              ) {
                                for (var e in complaints) {
                                  complaintTypes.add(e.serviceCode.toString());

                                  if (e.address.locality?.boundaryCode !=
                                      null) {
                                    locality.add(
                                      e.address.locality?.boundaryCode ?? "",
                                    );
                                  }

                                  var status = e.applicationStatus;
                                  uniqueStatuses.add(status);
                                  if (statusCount.containsKey(status)) {
                                    int? count = statusCount[status];
                                    statusCount[status.index] = count! + 1;
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
                                DigitDropdown<String>(
                                  formControlName: _complaintType,
                                  label: localizations.translate(
                                    i18.complaints.complaintsTypeHeading,
                                  ),
                                  menuItems: complaintTypes.toList(),
                                  valueMapper: (value) {
                                    return localizations.translate(
                                      value.snakeCase.toUpperCase().trim(),
                                    );
                                  },
                                ),
                                DigitDropdown<String>(
                                  formControlName: _complaintLocality,
                                  label: localizations
                                      .translate(i18.complaints.locality),
                                  menuItems: locality.toList(),
                                  valueMapper: (value) => value.trim(),
                                ),
                                LabeledField(
                                  label: localizations.translate(
                                    i18.complaints.inboxStatusLabel,
                                  ),
                                  child: Column(
                                    children: [
                                      ...uniqueStatuses.map((e) => Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: DigitCheckbox(
                                              label:
                                                  '${localizations.translate('COMPLAINTS_STATUS_${e.name.snakeCase.toUpperCase()}')} (${statusCount[e.index]})',
                                              value:
                                                  selectedStatuses.contains(e),
                                              onChanged: (value) {
                                                setState(() {
                                                  if (selectedStatuses
                                                      .contains(e)) {
                                                    selectedStatuses.remove(e);

                                                    return;
                                                  }

                                                  selectedStatuses.add(e);
                                                });
                                              },
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
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
