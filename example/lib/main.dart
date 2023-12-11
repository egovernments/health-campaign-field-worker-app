import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/validators/validator.dart';
import 'package:digit_components/widgets/atoms/digit_base_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_date_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_dropdown_input.dart'
    as dropdown;
import 'package:digit_components/widgets/atoms/digit_location_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_multiselect_dropdown.dart';
import 'package:digit_components/widgets/atoms/digit_numeric_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_password_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_radio_list.dart';
import 'package:digit_components/widgets/atoms/digit_search_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_text_area_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_time_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_toggle.dart';
import 'package:digit_components/widgets/atoms/digit_toggle_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ScrollableContent(
          children: [
            DigitCard(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DigitTextFormInput(
                      label: "input",
                      initialValue: 'initial value',
                      controller: TextEditingController(),
                      // state: 'Disabled',
                      // info: 'this is info',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
                      charCount: true,
                      validations: [
                        Validator(ValidatorType.maxLength, 10,
                            errorMessage: 'Maximum length is 10.'),
                        Validator(ValidatorType.pattern, r'^[a-zA-Z0-9]+$',
                            errorMessage: 'Invalid format.'),
                      ],
                      // onSuffixTap: (){print('tapppppppppp');},
                      // suffixIcon: Icons.currency_rupee_sharp,
                      // prefixIcon: Icons.currency_rupee,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DigitTextAreaFormInput(
                      label: "input",
                      controller: TextEditingController(),
                      // state: 'Disabled',
                      // info: 'this is info',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
                      // onSuffixTap: (){print('tapppppppppp');},
                      // suffixIcon: Icons.currency_rupee_sharp,
                      // prefixIcon: Icons.currency_rupee,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DigitDateFormInput(
                      label: "input",
                      controller: TextEditingController(),
                      // state: 'Disabled',
                      // info: 'this is info',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
                      // onSuffixTap: (){print('tapppppppppp');},
                      // suffixIcon: Icons.currency_rupee_sharp,
                      // prefixIcon: Icons.currency_rupee,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DigitTimeFormInput(
                      label: "input",
                      controller: TextEditingController(),
                      // state: 'Disabled',
                      // info: 'this is info',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
                      // onSuffixTap: (){print('tapppppppppp');},
                      // suffixIcon: Icons.currency_rupee_sharp,
                      // prefixIcon: Icons.currency_rupee,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DigitSearchFormInput(
                      label: "input",
                      controller: TextEditingController(),
                      // state: 'Disabled',
                      // info: 'this is info',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
                      // onSuffixTap: (){print('tapppppppppp');},
                      // suffixIcon: Icons.currency_rupee_sharp,
                      // prefixIcon: Icons.currency_rupee,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DigitPasswordFormInput(
                      label: "input",
                      controller: TextEditingController(),
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
                      validations: [
                        Validator(ValidatorType.minLength, 6,
                            errorMessage:
                                'Password must be at least 6 characters.'),
                      ],
                      // onSuffixTap: (){print('tapppppppppp');},
                      // suffixIcon: Icons.currency_rupee_sharp,
                      // prefixIcon: Icons.currency_rupee,
                    ),
                    dropdown.DigitDropdown<int>(
                      onChange: (String value, int index) => print(value),
                      dropdownStyle: const dropdown.DropdownStyle(
                        elevation: 6,
                        padding: EdgeInsets.all(5),
                      ),
                      textEditingController: TextEditingController(),
                      items: [
                        'apple',
                        'banana',
                        'orange',
                        'grapes',
                      ]
                          .asMap()
                          .entries
                          .map(
                            (item) => dropdown.DropdownItem<String>(
                              value: item.value,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(item.value),
                              ),
                            ),
                          )
                          .toList(),
                      child: const Text(
                        'dropdown',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DigitMultiSelectDropdown<String>(
                      items: [],
                      types: const [
                        DropdownItemType(
                            type: 'Fruits',
                            values: ['Apple', 'Banana', 'Orange', 'Grapes']),
                        DropdownItemType(
                            type: 'Vegetables',
                            values: ['Carrot', 'Broccoli', 'Spinach']),
                        // Add more types as needed
                      ],
                      onChange: (selectedValues, selectedIndices) {
                        // Handle the selected values and indices
                        print('Selected Values: $selectedValues');
                        print('Selected Indices: $selectedIndices');
                      },
                      textEditingController: TextEditingController(),
                      child: const Text('Select Items'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DigitTextFormInput(
                      label: "input",
                      controller: TextEditingController(),
                      // state: 'Disabled',
                      // info: 'this is info',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
                      // isDisabled: true,
                      // onSuffixTap: (){print('tapppppppppp');},
                      suffixIcon: Icons.currency_rupee_sharp,
                      prefixIcon: Icons.currency_rupee,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DigitNumericFormInput(
                      label: "input",
                      controller: TextEditingController(),
                      // state: 'Disabled',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
                      initialValue: '0',
                      // readOnly: true,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DigitLocationFormInput(
                      label: "input",
                      controller: TextEditingController(),
                      // state: 'Disabled',
                      // info: 'this is info',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DigitRadioList(
                      onChanged: (value) {
                        // print(value);
                      },
                      radioButtons: [
                        RadioButtonModel(
                          code: '1',
                          name: 'One',
                        ),
                        RadioButtonModel(code: '2', name: 'Two'),
                        RadioButtonModel(code: '3', name: 'Three'),
                        // Add more radio buttons as needed
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DigitToggleList(
                      toggleButtons: [
                        ToggleButtonModel(
                            name: 'Toggle 1',
                            key: 'key1',
                            onSelected: () {
                              print('Toggle 1 selected!');
                            }),
                        ToggleButtonModel(
                            name: 'Toggle 2',
                            key: 'key2',
                            onSelected: () {
                              print('Toggle 2 selected!');
                            }),
                        ToggleButtonModel(
                            name: 'Toggle 3',
                            key: 'key3',
                            onSelected: () {
                              print('Toggle 3 selected!');
                            }),
                      ],
                      onChanged: (selectedValues) {
                        print('Selected values: $selectedValues');
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
