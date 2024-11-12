import 'package:digit_components/widgets/atoms/digit_date_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_integer_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:flutter/material.dart';

import 'models/widget_config_model.dart';

class WidgetBuilderFactory {
  // This static method generates a list of widgets based on the provided configuration.
  static List<Widget> buildWidgetsFromConfig(WidgetConfigModel model) {
    List<Widget> widgets = [];

    // Sort the config keys by the 'order' key
    var sortedKeys = model.config.keys.toList();
    sortedKeys.sort((a, b) => model.config[a]['order'].compareTo(model.config[b]['order']));

    for (var key in sortedKeys) {
      var fieldConfig = model.config[key];

      if (fieldConfig['isEnabled'] == true) {
        Widget widget;

        // Generate the widget based on the fieldConfig['type'] using a switch case
        switch (fieldConfig['component']) {
          case 'textField':
            widget = DigitTextFormField(
              formControlName: key,
              label: fieldConfig['label'],
              readOnly: fieldConfig['readOnly'] ?? false,
              isRequired: fieldConfig['isRequired'] ?? false,
              validationMessages: fieldConfig['validationMessages'],
            );
            break;

          case 'checkbox':
            widget = CheckboxListTile(
              title: Text(fieldConfig['label']),
              value: fieldConfig['initialValue'] ?? false,
              onChanged: fieldConfig['readOnly'] == true
                  ? null
                  : (bool? value) {
                // Handle checkbox state change
              },
            );
            break;

          case 'dropdown':
            widget = DropdownButtonFormField<String>(
              value: fieldConfig['initialValue'],
              items: (fieldConfig['options'] as List<String>).map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: fieldConfig['readOnly'] == true
                  ? null
                  : (value) {
                // Handle dropdown selection
              },
              decoration: InputDecoration(labelText: fieldConfig['label']),
            );
            break;

          case 'integerFormPicker':
            widget = DigitIntegerFormPicker(
              minimum: fieldConfig['minimum'],
              maximum: fieldConfig['maximum'],
              form: model.form,
              onChange: () => model.func?.call(model.form),
              formControlName: key,
              label: fieldConfig['label'],
              incrementer: fieldConfig['incrementer'],
              );
            break;

          case 'dateFormPicker':
            widget = DigitDateFormPicker(
              isEnabled: !fieldConfig['readOnly'],
              formControlName: key,
              label: fieldConfig['label'],
              isRequired: fieldConfig['isRequired'] ?? false,
              confirmText: fieldConfig['confirmText'],
              cancelText: fieldConfig['cancelText'],
              );
            break;

          // case 'selectionbox':
          //   widget = SelectionBox<String>(
          //   isRequired: fieldConfig['isRequired'] ?? false,
          //   title: fieldConfig['label'],
          //   equalWidthOptions: fieldConfig['equalWidthOptions'] ?? false,
          //   allowMultipleSelection: fieldConfig['allowMultipleSelection'] ?? false,
          //   options: fieldConfig['options'] ??
          //   [],
          //   initialSelection: model.form.control(key).value!= null ? [...model.form.control(key).value ] : [],
          //   onSelectionChanged: (values) {
          //   model.form
          //       .control(key)
          //       .markAsTouched();
          //   if (values.isEmpty) {
          //   model.form
          //       .control(key)
          //       .value = null;
          //   setState(() {
          //   model.form
          //       .control(key)
          //       .setErrors({'': true});
          //   });
          //   } else {
          //   setState(() {
          //   model.form
          //       .control(key)
          //       .value = values;
          //   });
          //   }
          //   },
          //   valueMapper: (value) {
          //   return value.toString();
          //   },
          //   errorMessage: model.form
          //       .control(key)
          //       .hasErrors &&
          //   model.form
          //       .control(key)
          //       .touched
          //   ? fieldConfig['errorMessage']
          //       : null,
          //   );
          //   break;

          default:
            throw Exception("Unsupported widget type: ${fieldConfig['type']}");
        }

        widgets.add(widget);
      }
    }

    return widgets;
  }
}

extension Extension on SelectionBox {

}

