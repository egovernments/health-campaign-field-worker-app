import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/app_localization.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../pages/beneficiary_registration/household_location.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../formController.dart';
import '../models/widget_config_model.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../utils.dart';
import '../widgetfactory.dart';

class HouseholdLocationComponentMapper {
  static const _administrationAreaKey =
      HouseholdLocationPageState.administrationAreaKey;
  static const _addressLine1Key = HouseholdLocationPageState.addressLine1Key;
  static const _addressLine2Key = HouseholdLocationPageState.addressLine2Key;
  static const _landmarkKey = HouseholdLocationPageState.landmarkKey;
  static const _postalCodeKey = HouseholdLocationPageState.postalCodeKey;
  static const _accuracyKey = HouseholdLocationPageState.accuracyKey;
  static const _latKey = HouseholdLocationPageState.latKey;
  static const _lngKey = HouseholdLocationPageState.lngKey;

  static const maxLength = 64;
  Map<String, Map<String, dynamic>> configs = {
    'administrationArea': {
      'type': 'field',
      'isEnabled': true,
      'readOnly': true,
      'isRequired': false,
      'order': 3,
    },
    'accuracy': {
      'isEnabled': false,
      'readOnly': true,
      'isRequired': true,
      'order': 2,
    },
    'addressLine1': {
      'isEnabled': true,
      'readOnly': false,
      'isRequired': false,
      'validation': [
        {
          'pattern': "^\\d+\$",
          'key': 'onlyDigits',
          'errorMessage': 'Digits only'
        }
      ],
      'order': 1,
    },
    'postalCode': {
      'isEnabled': true,
      'readOnly': false,
      'isRequired': false,
      'order': 4,
    },
    'TextField': {
      'type': 'additionalField',
      'label': 'TextField',
      'component': 'textField',
      'formDataType': 'String',
      'isEnabled': true,
      'readOnly': false,
      'isRequired': false,
      'keyboardType': 'number',
      'validation': [
        {
          'pattern': "^\\d+\$",
          'key': 'onlyDigits',
          'errorMessage': 'Digits only'
        }
      ],
      'order': 5,
    },
    'SelectionBox': {
      'type': 'additionalField',
      'label': 'SelectionBox',
      'component': 'selectionbox',
      'formDataType': 'List<String>',
      'menuItems': ['a', 'b', 'c', 'd'],
      'allowMultipleSelection': true,
      'isEnabled': true,
      'readOnly': false,
      'isRequired': false,
      'order': 5,
    },
    'dateForm': {
      'type': 'additionalField',
      'label': 'dateForm',
      'component': 'dateFormPicker',
      'formDataType': 'DateTime',
      'isEnabled': true,
      'readOnly': false,
      'isRequired': false,
      'order': 5,
    },
    'DropDown': {
      'type': 'additionalField',
      'label': 'DropDown',
      'component': 'dropdown',
      'formDataType': 'String',
      'menuItems': ['a', 'b', 'c', 'd'],
      'isEnabled': true,
      'readOnly': false,
      'isRequired': false,
      'order': 5,
    },
    'dobPicker': {
      'type': 'additionalField',
      'label': 'dobPicker',
      'component': 'dobPicker',
      'formDataType': 'DateTime',
      'isEnabled': true,
      'readOnly': false,
      'isRequired': true,
      'order': 5,
    },
    'integerFormPicker': {
      'type': 'additionalField',
      'label': 'integerFormPicker',
      'component': 'integerFormPicker',
      'formDataType': 'int',
      'initialValue': 0,
      'minimum': 0,
      'maximum': 10,
      'isEnabled': true,
      'readOnly': false,
      'isRequired': false,
      'order': 5,
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
          Map<String, String Function(Object control)> validationMessages = {};

          if (fieldConfig['validation'] != null) {
            fieldConfig['validation'].forEach((element) {
              validationMessages[element['key']] =
                  (_) => element['errorMessage'];
            });
          }

          // Generate the widget based on the fieldConfig['type'] using a switch case
          switch (key) {
            case _administrationAreaKey:
              widget =
                  householdLocationShowcaseData.administrativeArea.buildWith(
                      child: DigitTextFormField(
                          formControlName: _administrationAreaKey,
                          label: localizations.translate(
                            i18.householdLocation.administrationAreaFormLabel,
                          ),
                          isRequired: fieldConfig['isRequired'] ?? false,
                          readOnly: fieldConfig['readOnly'] ?? false,
                          validationMessages: {
                    'required': (_) => localizations.translate(
                          i18.householdLocation
                              .administrationAreaRequiredValidation,
                        ),
                    ...validationMessages
                  }));
              break;
            case _accuracyKey:
              widget = householdLocationShowcaseData.gpsAccuracy.buildWith(
                child: DigitTextFormField(
                    key: const Key(_accuracyKey),
                    formControlName: _accuracyKey,
                    label: localizations.translate(
                      i18.householdLocation.gpsAccuracyLabel,
                    ),
                    readOnly: fieldConfig['readOnly'] ?? false,
                    isRequired: fieldConfig['isRequired'] ?? false,
                    validationMessages: {
                      'required': (_) => localizations.translate(
                            i18.common.corecommonRequired,
                          ),
                      ...validationMessages
                    }),
              );
              break;
            case _addressLine1Key:
              widget = householdLocationShowcaseData.addressLine1.buildWith(
                child: DigitTextFormField(
                    formControlName: _addressLine1Key,
                    label: localizations.translate(
                      i18.householdLocation.householdAddressLine1LabelText,
                    ),
                    readOnly: fieldConfig['readOnly'] ?? false,
                    isRequired: fieldConfig['isRequired'] ?? false,
                    validationMessages: {
                      'required': (_) => localizations.translate(
                            i18.common.corecommonRequired,
                          ),
                      ...validationMessages
                    }),
              );
              break;
            case _addressLine2Key:
              widget = householdLocationShowcaseData.addressLine2.buildWith(
                child: DigitTextFormField(
                    formControlName: _addressLine2Key,
                    label: localizations.translate(
                      i18.householdLocation.householdAddressLine2LabelText,
                    ),
                    readOnly: fieldConfig['readOnly'] ?? false,
                    isRequired: fieldConfig['isRequired'] ?? false,
                    validationMessages: {
                      'required': (_) => localizations.translate(
                            i18.common.corecommonRequired,
                          ),
                      ...validationMessages
                    }),
              );
              break;
            case _landmarkKey:
              widget = householdLocationShowcaseData.landmark.buildWith(
                child: DigitTextFormField(
                    formControlName: _landmarkKey,
                    label: localizations.translate(
                      i18.householdLocation.landmarkFormLabel,
                    ),
                    validationMessages: {
                      'required': (_) => localizations.translate(
                            i18.common.corecommonRequired,
                          ),
                      ...validationMessages
                    }),
              );
              break;
            case _postalCodeKey:
              widget = householdLocationShowcaseData.postalCode.buildWith(
                child: DigitTextFormField(
                  keyboardType: TextInputType.number,
                  formControlName: _postalCodeKey,
                  label: localizations.translate(
                    i18.householdLocation.postalCodeFormLabel,
                  ),
                  readOnly: fieldConfig['readOnly'] ?? false,
                  isRequired: fieldConfig['isRequired'] ?? false,
                  validationMessages: {
                    'required': (_) => localizations.translate(
                          i18.common.corecommonRequired,
                        ),
                    ...validationMessages
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              );
              break;
            default:
              widget = WidgetBuilderFactory.buildWidgetsFromConfig(
                  key, fieldConfig,model.form, localizations);
          }

          widgets.add(widget);
        }
      }
    }

    return widgets;
  }

  FormGroup buildForm(BeneficiaryRegistrationState state,
      RegistrationDeliveryLocalization localizations) {
    final addressModel = state.mapOrNull(
      editHousehold: (value) => value.addressModel,
    );

    final formGroup = fb.group(<String, Object>{
      _administrationAreaKey: FormControl<String>(
        value: localizations
            .translate(RegistrationDeliverySingleton().boundary!.code ?? ''),
      ),
      _addressLine1Key: FormControl<String>(value: addressModel?.addressLine1),
      _addressLine2Key: FormControl<String>(
        value: addressModel?.addressLine2,
      ),
      _landmarkKey: FormControl<String>(
        value: addressModel?.landmark,
      ),
      _postalCodeKey: FormControl<String>(
        value: addressModel?.pincode,
      ),
      _latKey: FormControl<double>(value: addressModel?.latitude),
      _lngKey: FormControl<double>(
        value: addressModel?.longitude,
      ),
      _accuracyKey: FormControl<double>(
        value: addressModel?.locationAccuracy,
      ),
    });

    final existingConfigs = [
      _administrationAreaKey,
      _accuracyKey,
      _addressLine1Key,
      _addressLine2Key,
      _landmarkKey,
      _latKey,
      _lngKey,
      _postalCodeKey
    ];

    Map<String, AbstractControl<dynamic>> newControls = {};
    configs.forEach((key, fieldConfig) {
      if (!existingConfigs.contains(key)) {
        newControls[key] = FormControlFactory.createFormControl(
            type: fieldConfig['formDataType'],
            initialValue: fieldConfig['initialValue'] ?? '');
      }
    });

    formGroup.addAll(newControls);

    addValidators(formGroup);

    return formGroup;
  }

  void addValidators(final formGroup) {
    configs.forEach((key, fieldConfig) {
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
            if (value.isNotEmpty && !RegExp(regex['pattern']).hasMatch(value)) {
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
    });
  }
}
