import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/complaints_inbox/complaints_inbox.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';

@RoutePage()
class ComplaintsInboxSortPage extends LocalizedStatefulWidget {
  const ComplaintsInboxSortPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsInboxSortPage> createState() =>
      _ComplaintsInboxSortPageState();
}

class _ComplaintsInboxSortPageState
    extends LocalizedState<ComplaintsInboxSortPage> {
  static const _sortOrder = "sortOrder";
  static var sortOrders = [
    i18.complaints.complaintsSortDateDesc,
    i18.complaints.complaintsSortDateAsc,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<ComplaintsInboxBloc>();
    final router = context.router;

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: BlocBuilder<ComplaintsInboxBloc, ComplaintInboxState>(
        builder: (context, state) {
          return ReactiveFormBuilder(
            form: () => buildForm(state),
            builder: (context, formGroup, child) {
              return BlocBuilder<ComplaintsInboxBloc, ComplaintInboxState>(
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
                              child: const Row(
                                children: [
                                  Icon(Icons.close),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                localizations.translate(
                                  i18.complaints.complaintInboxSortHeading,
                                ),
                                style: theme.textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    footer: SizedBox(
                      child: DigitCard(
                        margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                        padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: DigitElevatedButton(
                                onPressed: () {
                                  formGroup.markAllAsTouched();

                                  var sortOrder =
                                      formGroup.control(_sortOrder).value;

                                  if (!formGroup.valid || sortOrder == null) {
                                    return;
                                  }

                                  bloc.add(
                                    ComplaintInboxSortComplaintsEvent(
                                      sortOrder,
                                    ),
                                  );
                                  router.pop();
                                },
                                child: Center(
                                  child: Text(
                                    localizations
                                        .translate(i18.complaints.sortCTA),
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
                          Column(
                            children: [
                              BlocBuilder<ComplaintsInboxBloc,
                                  ComplaintInboxState>(
                                builder: (context, state) {
                                  // TODO(neel): Use Reactive components if possible

                                  return RadioGroup<String>.builder(
                                    groupValue:
                                        formGroup.control(_sortOrder).value ??
                                            "",
                                    onChanged: (changedValue) {
                                      setState(() {
                                        formGroup.control(_sortOrder).value =
                                            changedValue;
                                      });
                                    },
                                    items: sortOrders,
                                    itemBuilder: (item) => RadioButtonBuilder(
                                      localizations.translate(item.trim()),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  FormGroup buildForm(ComplaintInboxState state) {
    return fb.group(<String, Object>{
      _sortOrder: FormControl<String>(
        validators: [],
        value: "",
      ),
    });
  }
}
