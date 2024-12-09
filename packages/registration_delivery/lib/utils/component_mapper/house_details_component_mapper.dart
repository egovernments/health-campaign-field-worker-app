import 'package:digit_components/widgets/atoms/digit_integer_form_picker.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_components/widgets/atoms/text_block.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/app_localization.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../models/entities/additional_fields_type.dart';
import '../../pages/beneficiary_registration/house_details.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_wrappers.dart';
import '../formController.dart';
import '../models/widget_config_model.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../utils.dart';
import '../widgetfactory.dart';

class HouseDetailsComponentMapper {
  static const _noOfRoomsKey = HouseDetailsPageState.noOfRoomsKey;
  static const _householdStructureKey =
      HouseDetailsPageState.householdStructureKey;

  Map<String, dynamic> configs = {
    "name": "HouseDetails",
    "type": "page",
    "components": [
      {
        "title": "House Details",
        // "description":
        //     "Make sure the village name matches the one where you are today.",
        "order": 1,
        "attributes": [
          {
            'name': 'householdStructure',
            'isEnabled': true,
            'readOnly': false,
            'attribute': 'selectionbox',
            'initialValue': [],
            'isRequired': true,
            'order': 1,
          },
          {
            'name': 'noOfRooms',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': false,
            'attribute': 'digitIntegerFormPicker',
            'regex': ["^\\d+\$"],
            "errorMessage": "Invalid input",
            'order': 2,
          },
          {
            'name': 'abcd',
            'type': 'additionalField',
            'label': 'abcd',
            'attribute': 'selectionbox',
            'formDataType': 'List<String>',
            'initialValue': [],
            'allowMultipleSelection': true,
            'menuItems': ['a', 'b', 'c', 'd'],
            'isEnabled': true,
            'readOnly': false,
            'isRequired': true,
            'order': 5,
          }
        ]
      }
    ]
  };

  List<Widget> buildWidgetsFromConfig(
      WidgetConfigModel model, BuildContext context) {
    final theme = Theme.of(context);

    // Sort components by order
    model.config["components"]
        .sort((a, b) => (a["order"] as int).compareTo(b["order"]));

    // Sort attributes within each component by order
    for (var component in model.config["components"]) {
      if (component["attributes"] != null) {
        (component["attributes"] as List)
            .sort((a, b) => (a["order"] as int).compareTo(b["order"]));
      }
    }

    List<Widget> widgets = [];
    final localizations = model.localizations;

    for (var component in model.config["components"]) {
      Widget widget = DigitCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextBlock(
                padding: const EdgeInsets.only(top: kPadding),
                heading: localizations.translate(
                  component['title'],
                ),
                headingStyle: theme.textTheme.displayMedium,
                body: component['description'] != null
                    ? localizations.translate(
                        component['description'],
                      )
                    : ""),
            Column(
                children: buildAttributesFromConfig(
                    config: component['attributes'],
                    form: model.form,
                    localizations: localizations,
                    func: model.func)),
            const SizedBox(height: 16),
          ],
        ),
      );
      widgets.add(widget);
    }

    return widgets;
  }

  List<Widget> buildAttributesFromConfig(
      {dynamic config, dynamic form, dynamic localizations, dynamic func}) {
    List<Widget> widgets = [];

    for (var fieldConfig in config) {
      var key = fieldConfig['name'];

      if (fieldConfig['isEnabled'] == true) {
        Widget widget;

        // Generate the widget based on the fieldConfig['type'] using a switch case
        switch (key) {
          case _householdStructureKey:
            widget = houseShowcaseData.typeOfStructure.buildWith(
              child: AbsorbPointer(
                absorbing: fieldConfig['readOnly'] ?? false,
                child: Opacity(
                  opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
                  child: SelectionBox<String>(
                    title:
                        '${localizations.translate(i18.householdDetails.typeOfStructure)}${fieldConfig['isRequired'] ?? false ? '*' : ''}',
                    equalWidthOptions: true,
                    allowMultipleSelection: false,
                    options:
                        RegistrationDeliverySingleton().houseStructureTypes ??
                            [],
                    initialSelection:
                        form.control(_householdStructureKey).value != null
                            ? [...form.control(_householdStructureKey).value]
                            : [],
                    onSelectionChanged: (values) {
                      form.control(_householdStructureKey).markAsTouched();
                      if (values.isEmpty) {
                        form.control(_householdStructureKey).value = null;
                        func!(form, true, values);
                      } else {
                        func!(form, false, values);
                      }
                    },
                    valueMapper: (value) {
                      return localizations.translate(value.toString());
                    },
                    errorMessage:
                        form.control(_householdStructureKey).hasErrors &&
                                form.control(_householdStructureKey).touched
                            ? localizations.translate(
                                i18.householdDetails.selectStructureTypeError)
                            : null,
                  ),
                ),
              ),
            );
            break;
          case _noOfRoomsKey:
            widget = houseShowcaseData.noOfRooms.buildWith(
              child: AbsorbPointer(
                absorbing: fieldConfig['readOnly'],
                child: Opacity(
                  opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
                  child: DigitIntegerFormPicker(
                    minimum: 1,
                    maximum: 20,
                    form: form,
                    formControlName: _noOfRoomsKey,
                    label: '${localizations.translate(
                      i18.householdDetails.noOfRoomsLabel,
                    )}${fieldConfig['isRequired'] ?? false ? '*' : ''}',
                    incrementer: true,
                  ),
                ),
              ),
            );
            break;
          default:
            widget = WidgetBuilderFactory.buildWidgetsFromConfig(
                key, fieldConfig, form, localizations);
        }

        widgets.add(widget);
      }
    }

    return widgets;
  }

  FormGroup buildForm(BeneficiaryRegistrationState state,
      RegistrationDeliveryLocalization localizations) {
    final formGroup = fb.group(<String, Object>{
      _noOfRoomsKey: FormControl<int>(
          value: state.householdModel?.additionalFields?.fields
                      .where((h) =>
                          h.key == AdditionalFieldsType.noOfRooms.toValue())
                      .firstOrNull
                      ?.value !=
                  null
              ? int.tryParse(state.householdModel?.additionalFields?.fields
                      .where((h) =>
                          h.key == AdditionalFieldsType.noOfRooms.toValue())
                      .firstOrNull
                      ?.value
                      .toString() ??
                  '1')
              : 1,
          validators: [Validators.required]),
      _householdStructureKey: FormControl<List<String>>(
        value: state.householdModel?.additionalFields?.fields
            .where((e) =>
                e.key == AdditionalFieldsType.houseStructureTypes.toValue())
            .first
            .value
            .toString()
            .split("|"),
      )
    });

    final existingConfigs = [_householdStructureKey, _noOfRoomsKey];

    Map<String, AbstractControl<dynamic>> newControls = {};
    for (var component in configs["components"]) {
      for (var attribute in component["attributes"]) {
        String key = attribute["name"];
        if (!existingConfigs.contains(key)) {
          newControls[key] = FormControlFactory.createFormControl(
            type: attribute["formDataType"],
            initialValue: attribute["initialValue"] ?? '',
            localizations: localizations,
          );
        }
      }
    }

    formGroup.addAll(newControls);

    addValidators(formGroup);

    return formGroup;
  }

  void addValidators(final formGroup) {
    for (var component in configs["components"]) {
      for (var fieldConfig in component["attributes"]) {
        final key = fieldConfig["name"];
        final formControl = formGroup.control(key);

        // Get current validators
        final currentValidators = formControl.validators;

        List<Map<String, dynamic>? Function(AbstractControl<dynamic>)>
            updatedValidators = currentValidators.where((validator) {
          // Check if the validator is of the same type as Validators.required
          return validator.runtimeType != Validators.required.runtimeType;
        }).toList();

        if (fieldConfig['isRequired'] == true &&
            fieldConfig['isEnabled'] == true) {
          // Add the new validator to the list
          updatedValidators = [
            ...updatedValidators,
            Validators.required // Example new validator
          ];
        }

        // If JSON config has regex, add it as a validator
        if (fieldConfig['isEnabled'] == true &&
            fieldConfig.containsKey('validation') &&
            fieldConfig['validation'] is List) {
          List<dynamic> validationList = fieldConfig['validation'];

          validationList.asMap().forEach((index, regex) {
            updatedValidators.add((control) {
              final value = control.value?.toString() ??
                  ''; // Convert to string or default to empty
              if (value.isNotEmpty &&
                  !RegExp(regex['pattern']).hasMatch(value)) {
                // Ensure there's a matching error message for this index
                return {
                  '${regex['key']}': regex['errorMessage']
                }; // Use the correct error message for the index
              }
              return null;
            });
          });
        }

        // Set the updated validators back to the form control
        formControl.setValidators(updatedValidators);

        // Re-run validation with the new validators
        formControl.updateValueAndValidity();
      }
    }
  }
}
