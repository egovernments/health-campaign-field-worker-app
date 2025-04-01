import 'package:auto_route/auto_route.dart';
import 'package:complaints/complaints.dart';
import 'package:complaints/router/complaints_router.gm.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import 'package:complaints/utils/i18_key_constants.dart' as i18;
import 'package:complaints/widgets/header/back_navigation_help_header.dart';
import 'package:complaints/widgets/localized.dart';

import '../../router/app_router.dart';

@RoutePage()
class CustomComplaintTypePage extends LocalizedStatefulWidget {
  const CustomComplaintTypePage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomComplaintTypePage> createState() =>
      CustomComplaintTypePageState();
}

class CustomComplaintTypePageState
    extends LocalizedState<CustomComplaintTypePage> {
  static const _complaintType = 'complaintType';
  static const _otherComplaintType = 'otherComplaintType';

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ComplaintsRegistrationBloc>();
    final router = context.router;
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () {
          return bloc.state.map(
            create: (value) => buildForm(value),
            persisted: (value) {
              throw const InvalidComplaintsRegistrationStateException();
            },
            view: (value) => buildForm(value),
          );
        },
        builder: (context, form, child) => BlocBuilder<
            ComplaintsRegistrationBloc, ComplaintsRegistrationState>(
          builder: (context, state) {
            return ScrollableContent(
              header: const Column(children: [
                BackNavigationHelpHeaderWidget(),
              ]),
              enableFixedDigitButton: true,
              footer: DigitCard(
                  cardType: CardType.primary,
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    DigitButton(
                      mainAxisSize: MainAxisSize.max,
                      label:
                          localizations.translate(i18.complaints.actionLabel),
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      onPressed: () async {
                        var complaintType = form.control(_complaintType).value;
                        var otherComplaintTypeValue =
                            form.control(_otherComplaintType).value;

                        if (complaintType == "Other") {
                          form.control(_otherComplaintType).setValidators(
                            [Validators.required],
                            autoValidate: true,
                          );
                        } else {
                          form.control(_otherComplaintType).setValidators(
                            [],
                            autoValidate: true,
                          );
                        }

                        setState(() {
                          form.markAllAsTouched();
                        });

                        if (!form.valid) return;

                        state.whenOrNull(
                          create: (
                            loading,
                            complaintType,
                            _,
                            addressModel,
                            complaintsDetailsModel,
                          ) {
                            bloc.add(
                              ComplaintsRegistrationEvent.saveComplaintType(
                                complaintType:
                                    form.control(_complaintType).value,
                                otherComplaintDescription:
                                    otherComplaintTypeValue,
                              ),
                            );
                          },
                        );

                        router.push(CustomComplaintsDetailsRoute());
                      },
                    ),
                  ]),
              slivers: [
                SliverToBoxAdapter(
                  child: DigitCard(
                      margin: const EdgeInsets.all(spacer2),
                      cardType: CardType.primary,
                      children: [
                        Text(
                          localizations.translate(
                            i18.complaints.complaintsTypeHeading,
                          ),
                          style: textTheme.headingXl,
                        ),
                        LabeledField(
                          label: localizations.translate(
                            i18.complaints.complaintsTypeLabel,
                          ),
                          child: RadioList(
                            containerPadding:
                                const EdgeInsets.only(bottom: spacer4),
                            radioDigitButtons: (ComplaintsSingleton()
                                        .complaintTypes
                                        ?.isNotEmpty ??
                                    false)
                                ? ComplaintsSingleton()
                                    .complaintTypes!
                                    .map<RadioButtonModel>(
                                      (item) => RadioButtonModel(
                                        code: item,
                                        name: localizations.translate(
                                          item
                                              .toString()
                                              .snakeCase
                                              .toUpperCase()
                                              .trim(),
                                        ),
                                      ),
                                    )
                                    .toList()
                                : <RadioButtonModel>[],
                            groupValue:
                                form.control(_complaintType).value ?? "",
                            onChanged: (changedValue) {
                              if (form.control(_complaintType).disabled) return;
                              setState(() {
                                form.control(_complaintType).value =
                                    changedValue.code;
                              });
                            },
                          ),
                        ),
                        if (form.control(_complaintType).value == "Other") ...[
                          ReactiveWrapperField<String>(
                              formControlName: _otherComplaintType,
                              validationMessages: {
                                'required': (object) => localizations.translate(
                                      i18.complaints.validationRequiredError,
                                    ),
                              },
                              showErrors: (control) =>
                                  control.invalid && control.touched,
                              builder: (field) {
                                return DigitTextFormInput(
                                  charCount: true,
                                  errorMessage: field.errorText,
                                  initialValue: field.value,
                                  onChange: (value) => form
                                      .control(_otherComplaintType)
                                      .value = value,
                                );
                              }),
                        ],
                        if (form.touched &&
                            form.control(_complaintType).invalid) ...[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              localizations.translate(
                                i18.complaints.validationRadioRequiredError,
                              ),
                              style: TextStyle(
                                color: theme.colorTheme.alert.error,
                              ),
                            ),
                          ),
                        ],
                      ]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  FormGroup buildForm(ComplaintsRegistrationState state) {
    final complaintTypeValue = state.mapOrNull(
      view: (value) => value.complaintType,
    );

    final bool shouldDisableForm =
        complaintTypeValue != null && complaintTypeValue.isNotEmpty;

    return fb.group(<String, Object>{
      _complaintType: FormControl<String>(
        validators: [Validators.required],
        value: complaintTypeValue,
        disabled: shouldDisableForm,
      ),
      _otherComplaintType: FormControl<String>(
        value: complaintTypeValue,
      ),
    });
  }
}
