import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/complaints_inbox/complaints_inbox.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/localized.dart';

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

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: BlocBuilder<ComplaintsInboxBloc, ComplaintInboxState>(
        builder: (context, state) {
          return ReactiveFormBuilder(
            form: () => buildForm(state),
            builder: (context, formGroup, child) {
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

                              if (!formGroup.valid) return;

                              final complaintNumberValue =
                                  formGroup.control(_complaintNumber).value;
                              final mobileNumberValue =
                                  formGroup.control(_mobileNumber).value;

                              bloc.add(
                                ComplaintInboxSearchComplaintsEvent(
                                  mobileNumber: mobileNumberValue == ""
                                      ? null
                                      : mobileNumberValue,
                                  complaintNumber: complaintNumberValue == ""
                                      ? null
                                      : complaintNumberValue,
                                  createdByUserId: context.loggedInUserUuid,
                                ),
                              );

                              context.router.pop();
                            },
                            child: Center(
                              child: Text(
                                localizations
                                    .translate(i18.complaints.searchCTA),
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
                      BlocBuilder<ComplaintsInboxBloc, ComplaintInboxState>(
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.all(kPadding * 2),
                            child: Column(
                              children: [
                                DigitTextFormField(
                                  formControlName: _complaintNumber,
                                  label: localizations.translate(
                                    i18.complaints.inboxNumberLabel,
                                  ),
                                  maxLength: 65,
                                ),
                                DigitTextFormField(
                                  formControlName: _mobileNumber,
                                  label: localizations.translate(
                                    i18.common.coreCommonMobileNumber,
                                  ),
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  validationMessages: {
                                    'mobileNumber': (object) =>
                                        localizations.translate(i18
                                            .individualDetails
                                            .mobileNumberInvalidFormatValidationMessage),
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  FormGroup buildForm(ComplaintInboxState state) {
    return fb.group(<String, Object>{
      _complaintNumber: FormControl<String>(
        validators: [],
        value: state.searchKeys?.complaintNumber,
      ),
      _mobileNumber: FormControl<String>(
        validators: [CustomValidator.validMobileNumber],
        value: state.searchKeys?.complainantMobileNumber,
      ),
    });
  }
}
