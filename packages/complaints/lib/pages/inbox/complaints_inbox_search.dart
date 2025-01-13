import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '/blocs/complaints_inbox/complaints_inbox.dart';

import '/utils/i18_key_constants.dart' as i18;
import '/utils/utils.dart';
import '/widgets/localized.dart';
import 'package:flutter/services.dart';

@RoutePage()
class ComplaintsInboxSearchPage extends LocalizedStatefulWidget {
  const ComplaintsInboxSearchPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsInboxSearchPage> createState() =>
      ComplaintsInboxSearchPageState();
}

class ComplaintsInboxSearchPageState
    extends LocalizedState<ComplaintsInboxSearchPage> {
  static const _complaintNumber = "complaintNumber";
  static const _mobileNumber = "mobileNumber";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
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
                        Padding(
                          padding: EdgeInsets.zero,
                          child: DigitButton(
                              label: "",
                              onPressed: () => context.router.pop(),
                              type: DigitButtonType.tertiary,
                              size: DigitButtonSize.large,
                              prefixIcon: Icons.close,
                          ),
                        )
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
                              i18.complaints.complaintInboxSearchHeading,
                            ),
                            style: textTheme.headingXl,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                footer: DigitCard(
                    cardType: CardType.primary,
                    margin: const EdgeInsets.fromLTRB(0, spacer2, 0, 0),
                    children: [
                      DigitButton(
                        mainAxisSize: MainAxisSize.max,
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        label: localizations
                            .translate(i18.complaints.searchCTA),
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
                              complaintNumber:
                                  complaintNumberValue == ""
                                      ? null
                                      : complaintNumberValue,
                              createdByUserId: ComplaintsSingleton()
                                  .loggedInUserUuid,
                            ),
                          );

                          context.router.pop();
                        },
                      ),
                    ]),
                children: [
                  Column(
                    children: [
                      BlocBuilder<ComplaintsInboxBloc, ComplaintInboxState>(
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.all(spacer2 * 2),
                            child: Column(
                              children: [
                                ReactiveWrapperField<String>(
                                    formControlName: _complaintNumber,
                                    builder: (context) {
                                      return LabeledField(
                                        label: localizations.translate(
                                          i18.complaints.inboxNumberLabel,
                                        ),
                                        child: DigitTextFormInput(
                                          onChange: (value){
                                            formGroup.control(_complaintNumber).value = value;
                                          },
                                          charCount: true,
                                          maxLength: 65,
                                        ),
                                      );
                                    }),
                                ReactiveWrapperField<String>(
                                    formControlName: _mobileNumber,
                                    showErrors: (control) => control.invalid && control.touched,
                                    validationMessages: {
                                      'mobileNumber': (object) =>
                                          localizations.translate(i18
                                              .individualDetails
                                              .mobileNumberInvalidFormatValidationMessage),
                                    },
                                    builder: (field) {
                                      return LabeledField(
                                        label: localizations.translate(
                                          i18.common.coreCommonMobileNumber,
                                        ),
                                        child: DigitTextFormInput(
                                          charCount: true,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          onChange: (value)=>formGroup.control(_mobileNumber).value=value,
                                          errorMessage: field.errorText,
                                          maxLength: 10,
                                        ),
                                      );
                                    }),
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
        validators: [Validators.delegate(
                (validator) => CustomValidator.validMobileNumber(validator))],
        value: state.searchKeys?.complainantMobileNumber,
      ),
    });
  }
}
