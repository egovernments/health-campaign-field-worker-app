import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_date_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_integer_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_reactive_search_dropdown.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_components/widgets/digit_dob_picker.dart';
import 'package:flutter/material.dart';

import '../../utils/i18_key_constants.dart' as i18;
import 'models/widget_config_model.dart';

class WidgetBuilderFactory {
  // This static method generates a list of widgets based on the provided configuration.
  static Widget buildWidgetsFromConfig(
      dynamic key, dynamic fieldConfig, dynamic form, dynamic localizations) {
    Widget widget;
    Map<String, String Function(Object control)> validationMessages = {};

    if (fieldConfig['validation'] != null) {
      fieldConfig['validation'].forEach((element) {
        validationMessages[element['key']] = (_) => element['errorMessage'];
      });
    }

    if (fieldConfig['isRequired'] != null && fieldConfig['isRequired']) {
      validationMessages['required'] = (_) => localizations.translate(
            i18.common.corecommonRequired,
          );
    }

    // Generate the widget based on the fieldConfig['type'] using a switch case
    switch (fieldConfig['component']) {
      case 'textField':
        widget = DigitTextFormField(
          formControlName: key,
          label: fieldConfig['label'],
          readOnly: fieldConfig['readOnly'] ?? false,
          isRequired: fieldConfig['isRequired'] ?? false,
          keyboardType: fieldConfig['keyboardType'] == "number"
              ? TextInputType.number
              : TextInputType.text,
          validationMessages: validationMessages,
        );
        break;
      case 'integerFormPicker':
        widget = AbsorbPointer(
          absorbing: fieldConfig['readOnly'] ?? false,
          child: Opacity(
            opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
            child: DigitIntegerFormPicker(
              minimum: fieldConfig['minimum'] ?? 0,
              maximum: fieldConfig['maximum'] ?? 100,
              form: form,
              formControlName: key,
              label:
                  '${fieldConfig['label']}${fieldConfig['isRequired'] ?? false ? '*' : ''}',
              incrementer: true,
            ),
          ),
        );
        break;
      case 'dateFormPicker':
        widget = DigitDateFormPicker(
          isEnabled: (fieldConfig['readOnly'] ?? false) != true,
          formControlName: key,
          label: fieldConfig['label'],
          isRequired: fieldConfig['isRequired'] ?? false,
          confirmText: localizations.translate(
            i18.common.coreCommonOk,
          ),
          cancelText: localizations.translate(
            i18.common.coreCommonCancel,
          ),
        );
        break;
      case 'dropdown':
        widget = DigitReactiveSearchDropdown<String>(
          enabled: (fieldConfig['readOnly'] ?? false) != true,
          label: fieldConfig['label'],
          form: form,
          menuItems: fieldConfig['menuItems'] ?? [],
          formControlName: key,
          valueMapper: (value) {
            return localizations.translate(value);
          },
          isRequired: fieldConfig['isRequired'] ?? false,
          validationMessage:
              form.control(key).hasErrors && form.control(key).touched
                  ? localizations.translate(
                      i18.common.corecommonRequired,
                    )
                  : null,
          emptyText: localizations.translate(i18.common.noMatchFound),
        );
        break;
      case 'checkbox':
        widget = DigitCheckbox(
          label: fieldConfig['label'],
          value: fieldConfig['initialValue'] ?? false,
        );
        break;
      case 'dobPicker':
        DateTime now = DateTime.now();
        DateTime before150Years = DateTime(now.year - 150, now.month, now.day);
        widget = AbsorbPointer(
          absorbing: fieldConfig['readOnly'] ?? false,
          child: Opacity(
            opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
            child: DigitDobPicker(
              datePickerFormControl: key,
              datePickerLabel: localizations.translate(
                i18.individualDetails.dobLabelText,
              ),
              ageFieldLabel: localizations.translate(
                i18.individualDetails.ageLabelText,
              ),
              yearsHintLabel: localizations.translate(
                i18.individualDetails.yearsHintText,
              ),
              monthsHintLabel: localizations.translate(
                i18.individualDetails.monthsHintText,
              ),
              separatorLabel: localizations.translate(
                i18.individualDetails.separatorLabelText,
              ),
              yearsAndMonthsErrMsg: localizations.translate(
                i18.individualDetails.yearsAndMonthsErrorText,
              ),
              initialDate: before150Years,
              onChangeOfFormControl: (formControl) {
                // Handle changes to the control's value here
                final value = formControl.value;
                if (value == null) {
                  formControl.setErrors({'': true});
                } else {
                  DigitDOBAge age = DigitDateUtils.calculateAge(value);
                  if ((age.years == 0 && age.months == 0) ||
                      age.months > 11 ||
                      (age.years >= 150 && age.months >= 0)) {
                    formControl.setErrors({'': true});
                  } else {
                    formControl.removeError('');
                  }
                }
              },
              cancelText: localizations.translate(i18.common.coreCommonCancel),
              confirmText: localizations.translate(i18.common.coreCommonOk),
            ),
          ),
        );
        break;
      case 'selectionbox':
        widget = AbsorbPointer(
          absorbing: fieldConfig['readOnly'] ?? false,
          child: Opacity(
            opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
            child: SelectionBox<String>(
              title:
                  '${fieldConfig['label']}${fieldConfig['isRequired'] ?? false ? '*' : ''}',
              equalWidthOptions: true,
              allowMultipleSelection:
                  fieldConfig['allowMultipleSelection'] ?? false,
              options: fieldConfig['menuItems'] ?? [],
              initialSelection: form.control(key).value != null
                  ? [...form.control(key).value]
                  : [],
              onSelectionChanged: (values) {
                form.control(key).markAsTouched();
                if (values.isEmpty) {
                  form.control(key).value = null;
                } else {
                  form.control(key).value = values;
                }
              },
              valueMapper: (value) {
                return localizations.translate(value.toString());
              },
              errorMessage:
                  form.control(key).hasErrors && form.control(key).touched
                      ? localizations.translate(
                          i18.common.corecommonRequired,
                        )
                      : null,
            ),
          ),
        );
        break;

      default:
        throw Exception("Unsupported widget type: ${fieldConfig['type']}");
    }

    return widget;
  }
}
