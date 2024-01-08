import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/utils/validators/validator.dart';
import 'package:digit_components/widgets/atoms/digit_button.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox_icon.dart';
import 'package:digit_components/widgets/atoms/digit_date_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_dropdown_input.dart';
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
import 'package:digit_components/widgets/atoms/digit_tree_select_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';




void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13,
            DeviceInfo.genericPhone(
              id: 'android-device',
              name: 'Android Device',
              platform: TargetPlatform.android,
              screenSize: const Size(412, 732),
            )
          ],
          initialDevice: Devices.ios.iPhone13,
        ),
        AlignmentAddon(
          initialAlignment: Alignment.center,
        ),
        // ThemeAddon(themes: themes, themeBuilder: themeBuilder)
      ],
      directories: [
        WidgetbookFolder(
          name: 'input text component',
          children: [
            WidgetbookComponent(
              name: 'text',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitTextFormInput(
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                            controller: TextEditingController(),
                            validations: [
                              Validator(ValidatorType.maxLength, 10,
                                  errorMessage: 'Maximum length is 10.'),
                              Validator(ValidatorType.pattern, r'^[a-zA-Z0-9]+$',
                                  errorMessage: 'Invalid format.'),
                            ],
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'disabled',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitTextFormInput(
                            controller: TextEditingController(),
                            isDisabled: true,
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                            validations: [
                              Validator(ValidatorType.maxLength, 10,
                                  errorMessage: 'Maximum length is 10.'),
                              Validator(ValidatorType.pattern, r'^[a-zA-Z0-9]+$',
                                  errorMessage: 'Invalid format.'),
                            ],
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'non Editable',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitTextFormInput(
                            controller: TextEditingController(),
                            readOnly: true,
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                            validations: [
                              Validator(ValidatorType.maxLength, 10,
                                  errorMessage: 'Maximum length is 10.'),
                              Validator(ValidatorType.pattern, r'^[a-zA-Z0-9]+$',
                                  errorMessage: 'Invalid format.'),
                            ],
                          ),
                        ),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'date',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitDateFormInput(
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'disabled',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitDateFormInput(
                            controller: TextEditingController(),
                            isDisabled: true,
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'non Editable',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitDateFormInput(
                            controller: TextEditingController(),
                            readOnly: true,
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'time',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitTimeFormInput(
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'disabled',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitTimeFormInput(
                            isDisabled: true,
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'non Editable',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitTimeFormInput(
                            controller: TextEditingController(),
                            readOnly: true,
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Search',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitSearchFormInput(
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'disabled',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitSearchFormInput(
                            isDisabled: true,
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'non Editable',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitSearchFormInput(
                            readOnly: true,
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Password',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitPasswordFormInput(
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                            validations: [
                              Validator(ValidatorType.minLength, 6,
                                  errorMessage:
                                  'Password must be at least 6 characters.'),
                            ],
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'disabled',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitPasswordFormInput(
                            isDisabled: true,
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                            validations: [
                              Validator(ValidatorType.minLength, 6,
                                  errorMessage:
                                  'Password must be at least 6 characters.'),
                            ],
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'non Editable',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitPasswordFormInput(
                            readOnly: true,
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                            validations: [
                              Validator(ValidatorType.minLength, 6,
                                  errorMessage:
                                  'Password must be at least 6 characters.'),
                            ],
                          ),
                        ),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Numeric',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitNumericFormInput(
                            controller: TextEditingController(),
                            step: context.knobs.doubleOrNull.slider(
                              label: 'step',
                              min: 0,
                              initialValue: 1,
                              max: 10,
                              divisions: 10,
                            )?.toInt() ?? 0,
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'disabled',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitNumericFormInput(
                            isDisabled: true,
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'non Editable',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitNumericFormInput(
                            readOnly: true,
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Location',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitLocationFormInput(
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'disabled',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitLocationFormInput(
                            controller: TextEditingController(),
                            isDisabled: true,
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'non Editable',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: DigitLocationFormInput(
                            controller: TextEditingController(),
                            readOnly: true,
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Text Area',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 200,
                          child: DigitTextAreaFormInput(
                            controller: TextEditingController(),
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'disabled',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 200,
                          child: DigitTextAreaFormInput(
                            controller: TextEditingController(),
                            isDisabled: true,
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'non Editable',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 200,
                          child: DigitTextAreaFormInput(
                            controller: TextEditingController(),
                            readOnly: true,
                            label: context.knobs.string(
                              label: 'Title',
                              initialValue: '',
                            ),
                            helpText: context.knobs.string(
                              label: 'help text',
                              initialValue: '',
                            ),
                            charCount: context.knobs.boolean(
                              label: 'char count',
                              initialValue: false,
                            ),
                            innerLabel: context.knobs.string(
                              label: 'inner label',
                              initialValue: '',
                            ),
                            info: context.knobs.boolean(
                              label: 'info',
                              initialValue: false,
                            ),
                            infoText: context.knobs.string(
                              label: 'infoText',
                              initialValue: 'this is info',
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Radio',
          children: [
            WidgetbookComponent(
              name: 'Radio Selection',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 150,
                          width: 250,
                          child: DigitRadioList(
                            onChanged: (value) {
                              // print(value);
                            },
                            isDisabled: context.knobs.boolean(
                              label: 'disabled',
                              initialValue: false,
                            ),
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
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'filled',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 150,
                          width: 250,
                          child: DigitRadioList(
                            onChanged: (value) {
                              // print(value);
                            },
                            radioButtons: [
                              RadioButtonModel(
                                code: '',
                                name: 'One',
                              ),
                              RadioButtonModel(code: '2', name: 'Two'),
                              RadioButtonModel(code: '3', name: 'Three'),
                              // Add more radio buttons as needed
                            ],
                            isDisabled: context.knobs.boolean(
                              label: 'disabled',
                              initialValue: false,
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Toggle Group',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 200,
                          width: 350,
                          child: DigitToggleList(
                            toggleButtons: [
                              ToggleButtonModel(
                                  name: 'Toggle 1', key: 'key1', onSelected: () {}),
                              ToggleButtonModel(
                                  name: 'Toggle 2', key: 'key2', onSelected: () {}),
                              ToggleButtonModel(
                                  name: 'Toggle 3', key: 'key3', onSelected: () {}),
                            ],
                            onChanged: (selectedValues) {},
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'dropdown',
          children: [
            WidgetbookComponent(
              name: 'Single Select',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      DigitDropdown<int>(
                        onChange: (String value, String index) => print(value),
                        dropdownStyle: const DropdownStyle(
                          elevation: 6,
                          padding: EdgeInsets.all(5),
                        ),
                        textEditingController: TextEditingController(),
                        items: [
                          'first',
                          'second',
                          'third',
                          'four',
                        ]
                            .asMap()
                            .entries
                            .map(
                              (item) =>
                              DropdownItem<String>(
                                value: item.value,
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Text(item.value),
                                ),
                              ),
                        )
                            .toList(),
                        child: const Text(
                          'dropdown',
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'nested',
                  builder: (context) =>
                      DigitDropdown<int>(
                        onChange: (String value, String type) =>
                        {
                          print(value),
                          print(type),
                        },
                        dropdownStyle: const DropdownStyle(
                          elevation: 6,
                          padding: EdgeInsets.all(5),
                        ),
                        textEditingController: TextEditingController(),
                        dropdownType: DropdownType.nestedSelect,
                        items: const [ DropdownItem<String>(
                          value: 'first',
                          type: 'group B',
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10, top: 12, bottom: 12,),
                            child: Text('first', style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,),),
                          ),
                        ),
                          DropdownItem<String>(
                            value: 'second',
                            type: 'group A',
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10, top: 12, bottom: 12,),
                              child: Text('second', style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,),),
                            ),
                          ),
                          DropdownItem<String>(
                            value: 'third',
                            type: 'group B',
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10, top: 12, bottom: 12,),
                              child: Text('third', style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,),),
                            ),
                          ),
                          DropdownItem<String>(
                            value: 'fourth',
                            type: 'group A',
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10, top: 12, bottom: 12,),
                              child: Text('fourth', style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,),),
                            ),
                          ),
                          DropdownItem<String>(
                            value: 'fifth',
                            type: 'group B',
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10, top: 12, bottom: 12,),
                              child: Text('fifth', style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,),),
                            ),
                          ),
                          DropdownItem<String>(
                            value: 'six',
                            type: 'group A',
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10, top: 12, bottom: 12,),
                              child: Text('six', style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,),),
                            ),
                          ),
                        ],
                        child: const Text(
                          'dropdown',
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'nested text',
                  builder: (context) =>
                      DigitDropdown<int>(
                        onChange: (String value, String index) => {
                          print(value),
                          print(index),
                        },
                        dropdownStyle: const DropdownStyle(
                          elevation: 6,
                          padding: EdgeInsets.all(5),
                        ),
                        textEditingController: TextEditingController(),
                        items: [
                          'first',
                          'second',
                          'third',
                          'fourth',
                        ]
                            .asMap()
                            .entries
                            .map(
                              (item) => DropdownItem<String>(
                            value: item.value,
                            description: 'description for ${item.value}',
                            child: Padding(
                              padding:  const EdgeInsets.all(0),
                              child: Text(item.value, style:  TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 16, color: const DigitColors().davyGray),),
                            ),
                          ),
                        )
                            .toList(),
                        child: const Text(
                          'dropdown',
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'with icon',
                  builder: (context) =>
                      DigitDropdown<int>(
                        onChange: (String value, String index) => {
                          print(value),
                          print(index),
                        },
                        dropdownStyle: const DropdownStyle(
                          elevation: 6,
                          padding: EdgeInsets.all(5),
                        ),
                        textIcon: Icons.article,
                        textEditingController: TextEditingController(),
                        items: [
                          'first',
                          'second',
                          'third',
                          'fourth',
                        ]
                            .asMap()
                            .entries
                            .map(
                              (item) => DropdownItem<String>(
                            value: item.value,
                            description: 'description for ${item.value}',
                            child: Padding(
                              padding:  const EdgeInsets.only(left: 0, top: 0,),
                              child: Text(item.value, style:  TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 16, color: const DigitColors().davyGray),),
                            ),
                          ),
                        )
                            .toList(),
                        child: const Text(
                          'dropdown',
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'profile select',
                  builder: (context) =>
                      DigitDropdown<int>(
                        onChange: (String value, String index) => {
                          print(value),
                          print(index),
                        },
                        dropdownStyle: const DropdownStyle(
                          elevation: 6,
                          padding: EdgeInsets.all(5),
                        ),
                        textEditingController: TextEditingController(),
                        textIcon: Icons.article,
                        dropdownType: DropdownType.profileSelect,

                        items: [
                          'first',
                          'second',
                          'third',
                          'fourth',
                        ]
                            .asMap()
                            .entries
                            .map(
                              (item) => DropdownItem<String>(
                            value: item.value,
                            description: 'description for ${item.value} one',
                            profileImage: const NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzBXNuO6PezhC18aYH_2cYtS0I7KbxoKYdwA&usqp=CAU',
                            ),
                            child: Padding(
                              padding:  const EdgeInsets.only(left: 0, top: 0,),
                              child: Text(item.value, style:  TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 16, color: const DigitColors().davyGray),),
                            ),
                          ),
                        )
                            .toList(),
                        child: const Text(
                          'dropdown',
                        ),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Multi Select',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: MultiSelectDropDown<int>(
                            onOptionSelected: (
                                List<DropdownListItem> selectedOptions) {},
                            options: const [
                              DropdownListItem(
                                  value: 1, label: 'first'),
                              DropdownListItem(
                                  value: 2, label: 'second'),
                              DropdownListItem(
                                  value: 3, label: 'third'),
                              DropdownListItem(value: 4, label: 'four'),
                              DropdownListItem(value: 5, label: 'five'),
                            ],
                            selectionType: SelectionType.multiSelect,
                            // chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                            optionTextStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'nested',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 300,
                          child: MultiSelectDropDown<int>(
                            onOptionSelected: (
                                List<DropdownListItem> selectedOptions) {},
                            options: const [
                              DropdownListItem(value: 1,
                                label: 'first',
                                type: 'Type A',),
                              DropdownListItem(value: 2,
                                label: 'second',
                                type: 'Type A',),
                              DropdownListItem(value: 3,
                                label: 'third',
                                type: 'Type B',),
                              DropdownListItem(
                                value: 4, label: 'four', type: 'Type A',),
                              DropdownListItem(
                                value: 5, label: 'five', type: 'Type B',),
                            ],
                            selectionType: SelectionType.nestedMultiSelect,

                            optionTextStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'nested text',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 300,
                          child: MultiSelectDropDown<int>(
                            onOptionSelected: (List<DropdownListItem> selectedOptions) {},
                            options:  const [
                              DropdownListItem(value: 1, label: 'first', description: 'this is first',),
                              DropdownListItem(value: 2, label: 'second', description: 'this is second',),
                              DropdownListItem(value: 3, label: 'third', description: 'this is third',),
                              DropdownListItem(value: 4, label: 'four', description: 'this is fourth',),
                              DropdownListItem(value: 5, label: 'five', description: 'this is fifth',),
                            ],
                            selectionType: SelectionType.multiSelect,

                            // chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                            optionTextStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'with icon',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 300,
                          child: MultiSelectDropDown<int>(
                            onOptionSelected: (List<DropdownListItem> selectedOptions) {},
                            options:  const [
                              DropdownListItem(value: 1, label: 'first', description: 'this is first',),
                              DropdownListItem(value: 2, label: 'second', description: 'this is second',),
                              DropdownListItem(value: 3, label: 'third', description: 'this is third',),
                              DropdownListItem(value: 4, label: 'four', description: 'this is fourth',),
                              DropdownListItem(value: 5, label: 'five', description: 'this is fifth',),
                            ],
                            selectionType: SelectionType.multiSelect,
                            textIcon: Icons.article,
                            // chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                            optionTextStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Tree Select',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 100,
                          child: TreeSelectDropDown<int>(
                            onOptionSelected: (List<TreeNode> selectedOptions) {
                              // print(selectedOptions);
                              for (TreeNode node in selectedOptions) {
                                // print("Node: ${node.value}");
                              }
                            },
                            options: [
                              TreeNode('A', 'A', [
                                TreeNode('A.A1', 'A1', [TreeNode('A.A1.A3', 'A3',
                                    [TreeNode('A.A1.A3.A5', 'A5', []),
                                      TreeNode('A.A1.A3.A6', 'A6', []),
                                    ]),
                                  TreeNode('A.A1.A4', 'A4', []),
                                ]),
                                TreeNode('A.A2', 'A2', []),
                              ]),
                              TreeNode('B', 'B', [
                                TreeNode('B.B1', 'B1', []),
                                TreeNode('B.B2', 'B2', []),
                              ]),
                              TreeNode('C', 'C', [
                                TreeNode('C.C1', 'C1', []),
                                TreeNode('C.C2', 'C2', []),
                              ]),
                              TreeNode('D', 'D', [
                                TreeNode('D.D1', 'D1', []),
                                TreeNode('D.D2', 'D2', []),
                              ]),
                            ],
                            treeselectionType: TreeselectionType.singleSelect,
                            // chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                            optionTextStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'Multi Select Tree',
                  builder: (context) =>
                      Center(
                        child: Container(
                          height: 300,
                          child: TreeSelectDropDown<int>(
                            onOptionSelected: (List<TreeNode> selectedOptions) {
                              for (TreeNode node in selectedOptions) {
                                // print("Node: ${node.value}");
                              }
                            },
                            options: [
                              TreeNode('A', 'A', [
                                TreeNode('A.A1', 'A1', [TreeNode('A.A1.A3', 'A3',
                                    [TreeNode('A.A1.A3.A5', 'A5', []),
                                      TreeNode('A.A1.A3.A6', 'A6', []),
                                    ]),
                                  TreeNode('A.A1.A4', 'A4', []),
                                ]),
                                TreeNode('A.A2', 'A2', []),
                              ]),
                              TreeNode('B', 'B', [
                                TreeNode('B.B1', 'B1', []),
                                TreeNode('B.B2', 'B2', []),
                              ]),
                              TreeNode('C', 'C', [
                                TreeNode('C.C1', 'C1', []),
                                TreeNode('C.C2', 'C2', []),
                              ]),
                              TreeNode('D', 'D', [
                                TreeNode('D.D1', 'D1', []),
                                TreeNode('D.D2', 'D2', []),
                              ]),
                            ],
                            treeselectionType: TreeselectionType.MultiSelect,

                            optionTextStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Buttons',
          children: [
            WidgetbookComponent(
              name: 'primary',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      CustomButton(
                        label: 'Primary Button',
                        onPressed: () {
                          // Add your primary button logic here
                          print('Primary button pressed');
                        },
                        type: ButtonType.primary,
                        isDisabled: context.knobs.boolean(
                          label: 'disable',
                          initialValue: false,
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'prefixIcon',
                  builder: (context) =>
                      CustomButton(
                        prefixIcon: context.knobs.list(
                            label: 'prefixIcon', options: [
                          Icons.add,
                          Icons.crop_square_sharp,
                          Icons.circle,
                          Icons.arrow_forward,
                          Icons.location_disabled_outlined,
                        ]),
                        label: 'Primary Button',
                        onPressed: () {
                          // Add your primary button logic here
                          print('Primary button pressed');
                        },
                        type: ButtonType.primary,
                        isDisabled: context.knobs.boolean(
                          label: 'disable',
                          initialValue: false,
                        ),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'suffixIcon',
                  builder: (context) =>
                      CustomButton(
                        label: 'Primary Button',
                        onPressed: () {
                          // Add your primary button logic here
                          print('Primary button pressed');
                        },
                        type: ButtonType.primary,
                        isDisabled: context.knobs.boolean(
                          label: 'disable',
                          initialValue: false,
                        ),
                        suffixIcon: context.knobs.list(
                            label: 'suffixIcon', options: [
                          Icons.add,
                          Icons.crop_square_sharp,
                          Icons.circle,
                          Icons.arrow_forward,
                          Icons.location_disabled_outlined,
                        ]),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'secondary',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      CustomButton(
                        label: 'Secondary Button',
                        onPressed: () {
                          // Add your secondary button logic here
                          print('Secondary button pressed');
                        },
                        isDisabled: context.knobs.boolean(
                          label: 'disable',
                          initialValue: false,
                        ),
                        type: ButtonType.secondary,
                      ),
                ),
                WidgetbookUseCase(
                  name: 'prefixIcon',
                  builder: (context) =>
                      CustomButton(
                        label: 'Secondary Button',
                        onPressed: () {
                          // Add your secondary button logic here
                          print('Secondary button pressed');
                        },
                        isDisabled: context.knobs.boolean(
                          label: 'disable',
                          initialValue: false,
                        ),
                        type: ButtonType.secondary,
                        prefixIcon: context.knobs.list(
                            label: 'prefixIcon', options: [
                          Icons.add,
                          Icons.crop_square_sharp,
                          Icons.circle,
                          Icons.arrow_forward,
                          Icons.location_disabled_outlined,
                        ]),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'suffixIcon',
                  builder: (context) =>
                      CustomButton(
                        label: 'Secondary Button',
                        onPressed: () {
                          // Add your secondary button logic here
                          print('Secondary button pressed');
                        },
                        isDisabled: context.knobs.boolean(
                          label: 'disable',
                          initialValue: false,
                        ),
                        type: ButtonType.secondary,
                        suffixIcon: context.knobs.list(
                            label: 'suffixIcon', options: [
                          Icons.add,
                          Icons.crop_square_sharp,
                          Icons.circle,
                          Icons.arrow_forward,
                          Icons.location_disabled_outlined,
                        ]),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'tertiary',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      CustomButton(
                        label: 'tertiary Button',
                        onPressed: () {
                          // Add your secondary button logic here
                          print('tertiary button pressed');
                        },
                        isDisabled: context.knobs.boolean(
                          label: 'disable',
                          initialValue: false,
                        ),
                        type: ButtonType.tertiary,
                      ),
                ),
                WidgetbookUseCase(
                  name: 'prefixIcon',
                  builder: (context) =>
                      CustomButton(
                        label: 'tertiary Button',
                        onPressed: () {
                          // Add your secondary button logic here
                          print('tertiary button pressed');
                        },
                        isDisabled: context.knobs.boolean(
                          label: 'disable',
                          initialValue: false,
                        ),
                        type: ButtonType.tertiary,
                        prefixIcon: context.knobs.list(
                            label: 'prefixIcon', options: [
                          Icons.add,
                          Icons.crop_square_sharp,
                          Icons.circle,
                          Icons.arrow_forward,
                          Icons.location_disabled_outlined,
                        ]),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'suffixIcon',
                  builder: (context) =>
                      CustomButton(
                        label: 'tertiary Button',
                        onPressed: () {
                          // Add your secondary button logic here
                          print('tertiary button pressed');
                        },
                        isDisabled: context.knobs.boolean(
                          label: 'disable',
                          initialValue: false,
                        ),
                        type: ButtonType.tertiary,
                        suffixIcon: context.knobs.list(
                            label: 'suffixIcon', options: [
                          Icons.add,
                          Icons.crop_square_sharp,
                          Icons.circle,
                          Icons.arrow_forward,
                          Icons.location_disabled_outlined,
                        ]),
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'link',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (context) =>
                      CustomButton(
                        label: 'Link',
                        onPressed: () {
                          // Add your secondary button logic here
                          print('link pressed');
                        },
                        isDisabled: context.knobs.boolean(
                          label: 'disable',
                          initialValue: false,
                        ),
                        type: ButtonType.link,
                      ),
                ),
                WidgetbookUseCase(
                  name: 'prefixIcon',
                  builder: (context) =>
                      CustomButton(
                        label: 'Link',
                        onPressed: () {
                          // Add your secondary button logic here
                          print('link pressed');
                        },
                        isDisabled: context.knobs.boolean(
                          label: 'disable',
                          initialValue: false,
                        ),
                        type: ButtonType.link,
                        prefixIcon: context.knobs.list(
                            label: 'prefixIcon', options: [
                          Icons.add,
                          Icons.crop_square_sharp,
                          Icons.circle,
                          Icons.arrow_forward,
                          Icons.location_disabled_outlined,
                        ]),
                      ),
                ),
                WidgetbookUseCase(
                  name: 'suffixIcon',
                  builder: (context) =>
                      CustomButton(
                        label: 'Link',
                        onPressed: () {
                          // Add your secondary button logic here
                          print('link pressed');
                        },
                        isDisabled: context.knobs.boolean(
                          label: 'disable',
                          initialValue: false,
                        ),
                        type: ButtonType.link,
                        suffixIcon: context.knobs.list(
                            label: 'suffixIcon', options: [
                          Icons.add,
                          Icons.crop_square_sharp,
                          Icons.circle,
                          Icons.arrow_forward,
                          Icons.location_disabled_outlined,
                        ]),
                      ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Checkbox ',
          children: [
            WidgetbookComponent(
              name: 'Checkbox',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) =>
                      DigitCheckbox(
                        label: context.knobs.string(
                          label: 'Label',
                          initialValue: '',
                        ),
                        value: context.knobs.boolean(
                          label: 'Initial Value',
                          initialValue: false,
                        ),
                        onChanged: (value) {
                          print(value);
                        },
                        disabled: context.knobs.boolean(
                            label: 'Disabled',
                          initialValue: false,
                        ),
                      ),
                ),
              ],
            ),

          ],
        ),
      ],
    );
  }
}
