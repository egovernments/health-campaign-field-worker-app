
import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '/blocs/complaints_inbox/complaints_inbox.dart';

import '/utils/i18_key_constants.dart' as i18;
import '/widgets/localized.dart';

@RoutePage()
class ComplaintsInboxSortPage extends LocalizedStatefulWidget {
  const ComplaintsInboxSortPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsInboxSortPage> createState() =>
      ComplaintsInboxSortPageState();
}

class ComplaintsInboxSortPageState
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
                          padding: const EdgeInsets.only(left: spacer5),
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
                    footer: DigitCard(
                      cardType: CardType.primary,
                      margin: const EdgeInsets.fromLTRB(0, spacer2, 0, 0),
                      padding: const EdgeInsets.all(spacer2),
                      children: [Button(
                        type: ButtonType.primary,
                        size: ButtonSize.large,
                        label: localizations
                            .translate(i18.complaints.sortCTA),
                        mainAxisSize: MainAxisSize.max,
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
                      ),]
                    ),
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              BlocBuilder<ComplaintsInboxBloc,
                                  ComplaintInboxState>(
                                builder: (context, state) {

                                  return RadioList(
                                    radioButtons: sortOrders
                                      .asMap()
                                      .entries
                                      .map(
                                        (item)=>RadioButtonModel(
                                            code: item.value,
                                            name: localizations.translate(item.value.trim()),
                                        )
                                    ).toList(),
                                    groupValue:
                                        formGroup.control(_sortOrder).value ??
                                            "",
                                    onChanged: (changedValue) {
                                      formGroup.control(_sortOrder).value =
                                          changedValue.code;
                                    },
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
