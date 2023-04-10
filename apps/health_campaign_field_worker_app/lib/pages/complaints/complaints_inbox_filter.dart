import 'dart:collection';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/complaints_inbox/complaints_inbox.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';

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
  static const _complaintStatus = "complaintStatus";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<ComplaintsInboxBloc>();
    final router = context.router;

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: BlocBuilder<ComplaintsInboxBloc, ComplaintInboxState>(
        builder: (context, state) {
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
                Row(
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
                          // TODO: Implement reset filters
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
                          context.router.pop();
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
              Column(
                children: [
                  ReactiveFormBuilder(
                    form: () => buildForm(state),
                    builder: (context, formGroup, child) {
                      return BlocConsumer<ComplaintsInboxBloc,
                          ComplaintInboxState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          List<String> complaintTypes = [];
                          List<String> locality = [];

                          List<String> statuses = [];
                          Map<String, int> statusCount = HashMap();

                          state.maybeWhen(
                            orElse: () {
                              return;
                            },
                            complaints: (complaintInboxItems) {
                              complaintInboxItems?.forEach((e) {
                                complaintTypes.add(e.complaintType.toString());
                                locality.add(e.area.toString());

                                var status = e.status.toString();
                                if (statusCount.containsKey(status)) {
                                  int? count = statusCount[status];
                                  statusCount[status] = count! + 1;
                                } else {
                                  statusCount[status] = 1;
                                }
                              });
                              for (var key in statusCount.keys) {
                                statuses.add(
                                  '${key.toString()} (${statusCount[key].toString()})',
                                );
                              }
                            },
                          );

                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                BlocBuilder<ComplaintsInboxBloc,
                                    ComplaintInboxState>(
                                  builder: (context, state) {
                                    return RadioGroup<String>.builder(
                                      groupValue: "",
                                      onChanged: (changedValue) {},
                                      items: const [
                                        "Assigned to all",
                                        "Assigned to me",
                                      ],
                                      itemBuilder: (item) => RadioButtonBuilder(
                                        item.trim(),
                                      ),
                                    );
                                  },
                                ),
                                DigitDropdown<String>(
                                  formControlName: _complaintType,
                                  label: "Complaint Type",
                                  menuItems: complaintTypes,
                                  valueMapper: (value) => value.trim(),
                                ),
                                DigitDropdown<String>(
                                  formControlName: _complaintLocality,
                                  label: "Locality",
                                  menuItems: locality,
                                  valueMapper: (value) => value.trim(),
                                ),
                                LabeledField(
                                  label: "Status",
                                  child: Column(
                                    children: [
                                      ...statuses.map((e) => DigitCheckboxTile(
                                            label: e.toString(),
                                            value: e.toString() ==
                                                formGroup
                                                    .control(_complaintStatus)
                                                    .value,
                                            onChanged: (value) {
                                              setState(() {
                                                formGroup
                                                    .control(_complaintStatus)
                                                    .value = e.toString();
                                              });
                                            },
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  FormGroup buildForm(ComplaintInboxState state) {
    return fb.group(<String, Object>{
      _complaintType: FormControl<String>(
        validators: [],
      ),
      _complaintLocality: FormControl<String>(
        validators: [],
      ),
      _complaintStatus: FormControl<String>(
        validators: [],
      ),
    });
  }
}
