import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/atoms/text_block.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/app_localization.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../pages/beneficiary_registration/household_location.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_wrappers.dart';
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

  Map<String, dynamic> configs = {
    "name": "HouseholdLocation",
    "type": "page",
    "components": [
      {
        "title": "Household Location",
        "description":
            "Make sure the village name matches the one where you are today.",
        "order": 1,
        "attributes": [
          {
            'name': 'administrationArea',
            'type': 'field',
            'isEnabled': false,
            'attribute': 'textField',
            'readOnly': "true",
            'isRequired': false,
            'order': 1,
          },
          {
            'name': 'accuracy',
            'isEnabled': true,
            'readOnly': true,
            'attribute': 'textField',
            'isRequired': true,
            'order': 2,
          },
          {
            'name': 'addressLine1',
            'isEnabled': true,
            'readOnly': false,
            'attribute': 'textField',
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
          {
            'name': 'postalCode',
            'isEnabled': true,
            'readOnly': false,
            'attribute': 'textField',
            'isRequired': false,
            'order': 1,
          },
          {
            "name": "TextField",
            "type": "additionalField",
            "label": "TextField",
            "attribute": "textField",
            "formDataType": "String",
            "isEnabled": true,
            "readOnly": false,
            "isRequired": false,
            "keyboardType": "number",
            "validation": [
              {
                "pattern": "^\\d+\$",
                "key": "onlyDigits",
                "errorMessage": "Digits only"
              }
            ],
            "order": 1
          },
          {
            "name": "SelectionBox",
            "type": "additionalField",
            "label": "SelectionBox",
            "attribute": "selectionbox",
            "formDataType": "List<String>",
            "menuItems": ["a", "b", "c", "d"],
            "allowMultipleSelection": true,
            "isEnabled": true,
            "readOnly": false,
            "isRequired": false,
            "order": 2
          },
          {
            "name": "dateForm",
            "type": "additionalField",
            "label": "dateForm",
            "attribute": "dateFormPicker",
            "formDataType": "DateTime",
            "isEnabled": true,
            "readOnly": false,
            "isRequired": false,
            "order": 5
          },
          {
            "name": "DropDown",
            "type": "additionalField",
            "label": "DropDown",
            "attribute": "dropdown",
            "formDataType": "String",
            "menuItems": ['a', 'b'],
            "isEnabled": true,
            "readOnly": false,
            "isRequired": false,
            "order": 3
          },
          {
            "name": "integerFormPicker",
            "type": "additionalField",
            "label": "integerFormPicker",
            "attribute": "integerFormPicker",
            "formDataType": "int",
            "initialValue": 0,
            "minimum": 0,
            "maximum": 10,
            "isEnabled": true,
            "readOnly": false,
            "isRequired": false,
            "order": 6
          }
        ]
      },
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
                    localizations: localizations))
          ],
        ),
      );
      widgets.add(widget);
    }

    return widgets;
  }

  List<Widget> buildAttributesFromConfig(
      {dynamic config, dynamic form, dynamic localizations}) {
    List<Widget> widgets = [];

    // if (sortedKeys.isEmpty) {
    //   Widget widget = AlertDialog(
    //     title: Text(localizations.translate(i18.formConfigKeys.error)),
    //     content: Text(
    //         localizations.translate(i18.formConfigKeys.locationErrorMessage)),
    //   );
    //   widgets.add(widget);
    // } else {
    for (var fieldConfig in config) {
      var key = fieldConfig['name'];

      if (fieldConfig['isEnabled'] == true) {
        Widget widget;
        Map<String, String Function(Object control)> validationMessages = {};

        if (fieldConfig['validation'] != null) {
          fieldConfig['validation'].forEach((element) {
            validationMessages[element['key']] =
                (_) => localizations.translate(element['errorMessage']);
          });
        }

        // Generate the widget based on the fieldConfig['type'] using a switch case
        switch (key) {
          case _administrationAreaKey:
            widget = householdLocationShowcaseData.administrativeArea.buildWith(
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
                key, fieldConfig, form, localizations);
        }

        widgets.add(widget);
      }
    }
    // }

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
    // Iterate over components and attributes to add form controls
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

    for (var component in configs["components"]) {
      for (var attribute in component["attributes"]) {
        addValidators(formGroup,attribute);
      }
    }

    return formGroup;
  }
}
