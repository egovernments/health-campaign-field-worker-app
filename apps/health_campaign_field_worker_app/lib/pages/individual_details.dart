import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_check_box.dart';
import 'package:digit_components/widgets/atoms/digit_dropdown.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_dob_picker.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';

class IndividualDetailsPage extends StatelessWidget {
  const IndividualDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return ScrollableContent(
            header: Column(children: const [
              BackNavigationHelpHeaderWidget(),
            ]),
            footer: Offstage(
              offstage: false,
              child: SizedBox(
                height: 90,
                child: DigitCard(
                  child: DigitElevatedButton(
                    onPressed: () {
                      if (form.valid) {
                        print(form.value);
                      } else {
                        form.markAllAsTouched();
                      }
                    },
                    child: Center(
                      child: Text(i18.individualDetails.submitButtonLabelText),
                    ),
                  ),
                ),
              ),
            ),
            children: [
              DigitCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      i18.individualDetails.individualsDetailsLabelText,
                      style: theme.textTheme.displayMedium,
                    ),
                    Column(children: [
                      DigitTextFormField(
                        formControlName: 'individualName',
                        label: i18.individualDetails.nameLabelText,
                      ),
                      DigitCheckBox(
                        checkBoxText: i18.individualDetails.checkboxLabelText,
                        onChange: () {},
                        isChecked: true,
                      ),
                      DigitTextFormField(
                        formControlName: 'idType',
                        label: i18.individualDetails.idTypeLabelText,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DigitTextFormField(
                            formControlName: 'idNumber',
                            label: i18.individualDetails.idNumberLabelText,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            i18.individualDetails.idNumberSuggestionText,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),

                      DigitDobPicker(
                        datePickerFormControl: 'dob',
                        ageInputFormControl: 'age',
                        onChangeDate: (DateTime? dateTime) {},
                        datePickerLabel: i18.individualDetails.dobLabelText,
                        ageFieldLabel: i18.individualDetails.ageLabelText,
                        separatorLabel:
                            i18.individualDetails.separatorLabelText,
                      ),
                      DigitDropDown(
                        label: i18.individualDetails.genderLabelText,
                        initialValue: 'Male',
                        menuItems: const ['Male', 'Female'],
                        onChanged: (String? newValue) {},
                        formControlName: 'gender',
                      ),
                      DigitTextFormField(
                        formControlName: 'mobileNumber',
                        label: i18.individualDetails.mobileNumberLabelText,
                      ),
                    ]),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        'individualName': FormControl<String>(value: ''),
        'idType': FormControl<String>(value: ''),
        'idNumber': FormControl<String>(value: ''),
        'dob': FormControl<String>(value: ''),
        'age': FormControl<String>(value: ''),
        'gender': FormControl<String>(value: ''),
        'mobileNumber': FormControl<String>(value: ''),
      });
}
