import 'package:digit_components/widgets/atoms/digit_integer_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/app_localization.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../models/entities/additional_fields_type.dart';
import '../../pages/beneficiary_registration/house_details.dart';
import '../../pages/beneficiary_registration/household_location.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../models/widget_config_model.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../utils.dart';

class HouseDetailsComponentMapper {
  static const _noOfRoomsKey = HouseDetailsPageState.noOfRoomsKey;
  static const _householdStructureKey = HouseDetailsPageState.householdStructureKey;
  Map<String, Map<String, dynamic>> configs = {
    'householdStructure': {
      'isEnabled': true,
      'readOnly': false,
      'isRequired': true,
      'order': 1,
    },
    'noOfRooms': {
      'isEnabled': true,
      'readOnly': false,
      'isRequired': true,
      'regex': ["^\\d+\$"],
      "errorMessage": "Invalid input",
      'order': 2,
    }
  };

  List<Widget> buildWidgetsFromConfig(WidgetConfigModel model) {
    List<Widget> widgets = [];
    final localizations = model.localizations;

    // Sort the config keys by the 'order' key
    var sortedKeys = model.config.keys.toList();
    sortedKeys.sort(
            (a, b) => model.config[a]['order'].compareTo(model.config[b]['order']));

    if (sortedKeys.isEmpty) {
      Widget widget = const AlertDialog(
        title: Text("Error"),
        content: Text("Household location config not found"),
      );
      widgets.add(widget);
    } else {
      for (var key in sortedKeys) {
        var fieldConfig = model.config[key];

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
                      initialSelection: model.form
                          .control(_householdStructureKey)
                          .value !=
                          null
                          ? [...model.form.control(_householdStructureKey).value]
                          : [],
                      onSelectionChanged: (values) {
                        model.form
                            .control(_householdStructureKey)
                            .markAsTouched();
                        if (values.isEmpty) {
                          model.form.control(_householdStructureKey).value = null;
                          model.func!(model.form,true,values);
                        } else {
                          model.func!(model.form,false,values);
                        }
                      },
                      valueMapper: (value) {
                        return localizations.translate(value.toString());
                      },
                      errorMessage: model.form
                          .control(_householdStructureKey)
                          .hasErrors &&
                          model.form.control(_householdStructureKey).touched
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
                      form: model.form,
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
              widget = Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text('Error:', style: TextStyle(color: Colors.red)),
                    Text("Unknown key $key")
                  ],
                ),
              );
          }

          widgets.add(widget);
        }
      }
    }

    return widgets;
  }

  FormGroup buildForm(BeneficiaryRegistrationState state, RegistrationDeliveryLocalization localizations) {
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

    configs.forEach((key, fieldConfig) {
      final formControl = formGroup.control(key);

      // Get current validators
      final currentValidators = formControl.validators;

      List<Map<String, dynamic>? Function(AbstractControl<dynamic>)> updatedValidators = currentValidators.where((validator) {
        // Check if the validator is of the same type as Validators.required
        return validator.runtimeType != Validators.required.runtimeType;
      }).toList();

      if (fieldConfig['isRequired'] == true && fieldConfig['isEnabled'] == true) {
        // Add the new validator to the list
        updatedValidators = [
          ...updatedValidators,
          Validators.required // Example new validator
        ];
      }

      // Set the updated validators back to the form control
      formControl.setValidators(updatedValidators);

      // Re-run validation with the new validators
      formControl.updateValueAndValidity();
    });

    return formGroup;
  }
}