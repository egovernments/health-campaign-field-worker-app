import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_base_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_date_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_location_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_numeric_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_password_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_radio_list.dart';
import 'package:digit_components/widgets/atoms/digit_search_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_text_area_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_time_form_input.dart';
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
                  children: [
                    DigitTextFormInput(
                      label: "input",
                      controller: TextEditingController(),
                      // state: 'Disabled',
                      info: 'this is info',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
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
                      info: 'this is info',
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
                      info: 'this is info',
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
                      info: 'this is info',
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
                      info: 'this is info',
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
                      // state: 'Disabled',
                      info: 'this is info',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
                      // onSuffixTap: (){print('tapppppppppp');},
                      // suffixIcon: Icons.currency_rupee_sharp,
                      // prefixIcon: Icons.currency_rupee,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DigitTextFormInput(
                      label: "input",
                      controller: TextEditingController(),
                      // state: 'Disabled',
                      info: 'this is info',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
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
                      info: 'this is info',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
                      initialValue: '0',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DigitLocationFormInput(
                      label: "input",
                      controller: TextEditingController(),
                      // state: 'Disabled',
                      info: 'this is info',
                      innerLabel: 'innerlabel',
                      helpText: 'help text',
                    ),
                    SizedBox(height: 8,),
                    DigitRadioList(
                      value: null, // Provide the current value of the selected radio button
                      groupValue: null, // Provide the group value for the radio buttons
                      onChanged: (value) {
                        // Handle the change in the selected radio button
                        print('Selected value: $value');
                      },
                      label: 'Choose a digit',
                      radioButtons: [
                        RadioButtonModel(value: 1, label: 'One'),
                        RadioButtonModel(value: 2, label: 'Two'),
                        RadioButtonModel(value: 3, label: 'Three'),
                        // Add more radio buttons as needed
                      ],
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
