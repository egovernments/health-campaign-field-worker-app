import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:institution_campaign/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';

import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../utils/i18_key_constants.dart' as i18;

@RoutePage()
class InstitutionTypePage extends LocalizedStatefulWidget {
  const InstitutionTypePage({
    super.key,
    super.appLocalizations,
  });

  @override
  LocalizedState<InstitutionTypePage> createState() =>
      InstitutionTypePageState();
}

class InstitutionTypePageState extends LocalizedState<InstitutionTypePage> {
  static const String _administrativeAreaKey = "administrativeArea";
  static const String _institutionTypeKey = "institutionType";
  static const String _institutionNameKey = "institutionName";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ReactiveFormBuilder(
          form: () => buildForm(),
          builder: (_, form, __) => ScrollableContent(
                header: const BackNavigationHelpHeaderWidget(),
                footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  padding: const EdgeInsets.all(spacer2),
                  children: [
                    Button(
                      label: "Next",
                      onPressed: () {
                        form.markAllAsTouched();
                        if (!form.valid) return;
                      },
                      type: ButtonType.primary,
                      size: ButtonSize.large,
                      mainAxisSize: MainAxisSize.max,
                    )
                  ],
                ),
                enableFixedButton: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: DigitCard(
                      margin: const EdgeInsets.all(spacer2),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: spacer2),
                          child: Text(
                            "Select the Communal Living Facility",
                            style: textTheme.headingXl,
                          ),
                        ),
                        ReactiveWrapperField(
                          formControlName: _administrativeAreaKey,
                          builder: (field) => LabeledField(
                            label: "Administrative Area",
                            isRequired: true,
                            child: DigitTextFormInput(
                              readOnly: true,
                              isDisabled: true,
                              initialValue:
                                  form.control(_administrativeAreaKey).value,
                            ),
                          ),
                        ),
                        ReactiveWrapperField(
                            formControlName: _institutionTypeKey,
                            validationMessages: {
                              'required': (object) => localizations.translate(
                                    i18.common.coreCommonRequired,
                                  )
                            },
                            builder: (field) => LabeledField(
                                label: "Communal Living Facility Type",
                                isRequired: true,
                                child: DigitDropdown(
                                  items: [],
                                  onSelect: (value) {
                                    form.control(_institutionTypeKey).value =
                                        value.name;
                                  },
                                  errorMessage: field.errorText,
                                ))),
                        ReactiveWrapperField(
                            formControlName: _institutionNameKey,
                            validationMessages: {
                              'required': (object) => localizations.translate(
                                    i18.common.coreCommonRequired,
                                  )
                            },
                            builder: (field) => LabeledField(
                                label: "Communal Living Facility Name",
                                isRequired: true,
                                child: DigitDropdown(
                                  items: [],
                                  onSelect: (value) {
                                    form.control(_institutionNameKey).value =
                                        value.name;
                                  },
                                  errorMessage: field.errorText,
                                )))
                      ],
                    ),
                  )
                ],
              )),
    );
  }

  FormGroup buildForm() {
    return fb.group(<String, Object>{
      _administrativeAreaKey: FormControl<String>(
          value: localizations
              .translate(InstitutionCampaignSingleton().boundary?.code ?? ''),
          validators: [
            Validators.required,
          ]),
      _institutionTypeKey: FormControl<String>(validators: [
        Validators.required,
      ]),
      _institutionNameKey: FormControl<String>(validators: [
        Validators.required,
      ])
    });
  }
}
