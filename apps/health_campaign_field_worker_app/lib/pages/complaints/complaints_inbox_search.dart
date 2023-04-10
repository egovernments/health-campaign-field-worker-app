import 'dart:collection';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/complaints_inbox/complaints_inbox.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/localized.dart';

class ComplaintsInboxSearchPage extends LocalizedStatefulWidget {
  const ComplaintsInboxSearchPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsInboxSearchPage> createState() =>
      _ComplaintsInboxSearchPageState();
}

class _ComplaintsInboxSearchPageState
    extends LocalizedState<ComplaintsInboxSearchPage> {
  static const _complaintNumber = "complaintNumber";
  static const _mobileNumber = "mobileNumber";

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
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        localizations.translate(
                          i18.complaints.complaintInboxSearchHeading,
                        ),
                        style: theme.textTheme.displayMedium,
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
                      child: DigitElevatedButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        child: Center(
                          child: Text(
                            localizations.translate(i18.complaints.searchCTA),
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
                          return Padding(
                            padding: const EdgeInsets.all(22),
                            child: Column(
                              children: [
                                DigitTextField(
                                  label: "Complaint Number",
                                  maxLength: 65,
                                  onChange: (value) {
                                    setState(() {
                                      formGroup
                                          .control(_complaintNumber)
                                          .value = value;
                                    });
                                  },
                                ),
                                DigitTextField(
                                  label: "Mobile Number",
                                  maxLength: 10,
                                  onChange: (value) {
                                    setState(() {
                                      formGroup.control(_mobileNumber).value =
                                          value;
                                    });
                                  },
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
      _complaintNumber: FormControl<String>(
        validators: [],
      ),
      _mobileNumber: FormControl<String>(
        validators: [CustomValidator.validMobileNumber],
      ),
    });
  }
}
