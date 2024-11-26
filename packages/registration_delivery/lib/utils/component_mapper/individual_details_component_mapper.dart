import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_reactive_search_dropdown.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_components/widgets/digit_dob_picker.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:digit_data_model/utils/utils.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/app_localization.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../pages/beneficiary_registration/household_location.dart';
import '../../pages/beneficiary_registration/individual_details.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_wrappers.dart';
import '../constants.dart';
import '../models/widget_config_model.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../utils.dart';

class IndividualsDatailsComponentMapper {
  static const _individualNameKey = IndividualDetailsPageState.individualNameKey;
  static const _idTypeKey = IndividualDetailsPageState.idTypeKey;
  static const _idNumberKey = IndividualDetailsPageState.idNumberKey;
  static const _dobKey = IndividualDetailsPageState.dobKey;
  static const _genderKey = IndividualDetailsPageState.genderKey;
  static const _mobileNumberKey = IndividualDetailsPageState.mobileNumberKey;
  DateTime now = DateTime.now();
  static const maxLength = 200;
  Map<String, Map<String, dynamic>> configs = {
    'individualName': {
      'isEnabled': true,
      'readOnly': true,
      'order': 1,
    },
    'idType': {
      'isEnabled': true,
      'readOnly': false,
      'isRequired': false,
      'order': 2,
    },
    'idNumber': {
      'isEnabled': true,
      'readOnly': false,
      'isRequired': true,
      'regex': ["^\\d+\$"],
      "errorMessage": "Invalid input",
      'order': 3,
    },
    'dob': {
      'isEnabled': true,
      'readOnly': false,
      'order': 4,
    },
    'gender': {
      'isEnabled': false,
      'readOnly': false,
      'isRequired': true,
      'order': 5,
    },
    'mobileNumber': {
      'isEnabled': true,
      'readOnly': false,
      'order': 6,
    },
  };

  List<Widget> buildWidgetsFromConfig(WidgetConfigModel model, bool isHeadOfHousehold) {
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
            case _individualNameKey:
              widget = DigitTextFormField(
                formControlName: _individualNameKey,
                label: localizations.translate(
                  i18.individualDetails.nameLabelText,
                ),
                isRequired: fieldConfig['isRequired'] ?? false,
                readOnly: fieldConfig['readOnly'] ?? false,
                validationMessages: {
                  'required': (object) => localizations.translate(
                    '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                  ),
                  'maxLength': (object) => localizations
                      .translate(i18.common.maxCharsRequired)
                      .replaceAll('{}', maxLength.toString()),
                  'customError': (object) => localizations.translate(
                    fieldConfig['errorMessage'] ?? '',
                  )
                },
              );
              if (isHeadOfHousehold) {
                widgets.add(widget);
                widget = Offstage(
                  offstage: !isHeadOfHousehold,
                  child: DigitCheckbox(
                    label: localizations.translate(
                      i18.individualDetails.checkboxLabelText,
                    ),
                    value: isHeadOfHousehold,
                  ),
                );
              }
              break;
            case _idTypeKey:
              widget = DigitReactiveSearchDropdown<String>(
                enabled: (fieldConfig['readOnly'] ?? false) != true,
                label: localizations.translate(
                  i18.individualDetails.idTypeLabelText,
                ),
                form: model.form,
                menuItems: RegistrationDeliverySingleton().idTypeOptions!.map(
                      (e) {
                    return e;
                  },
                ).toList(),
                formControlName: _idTypeKey,
                valueMapper: (value) {
                  return localizations.translate(value);
                },
                onSelected: (value) {
                  model.func!(model.form, true, value);
                },
                isRequired: fieldConfig['isRequired'] ?? false,
                validationMessage: model.form.control(_idTypeKey).hasErrors &&
                    model.form.control(_idTypeKey).touched
                    ? localizations.translate(
                  i18.common.corecommonRequired,
                )
                    : null,
                emptyText: localizations.translate(i18.common.noMatchFound),
              );
              break;
            case _idNumberKey:
              widget = model.form.control(_idTypeKey).value != 'DEFAULT'
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReactiveFormConsumer(
                    builder: (context, formGroup, child) {
                      return DigitTextFormField(
                        readOnly: fieldConfig['readOnly'] ?? false,
                        isRequired: fieldConfig['isRequired'] ?? false,
                        formControlName: _idNumberKey,
                        label: localizations.translate(
                          i18.individualDetails.idNumberLabelText,
                        ),
                        validationMessages: {
                          'required': (object) => localizations.translate(
                            '${i18.individualDetails.idNumberLabelText}_IS_REQUIRED',
                          ),
                          'customError': (object) =>
                              localizations.translate(
                                fieldConfig['errorMessage'] ?? '',
                              )
                        },
                        padding: const EdgeInsets.only(
                          top: kPadding * 2,
                          left: kPadding / 2,
                          right: kPadding / 2,
                        ),
                      );
                    },
                  ),
                ],
              )
                  : SizedBox(height: 16);
              break;
            case _dobKey:
              DateTime before150Years =
              DateTime(now.year - 150, now.month, now.day);
              widget = individualDetailsShowcaseData.dateOfBirth.buildWith(
                child: AbsorbPointer(
                  absorbing: fieldConfig['readOnly'] ?? false,
                  child: Opacity(
                    opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
                    child: DigitDobPicker(
                      datePickerFormControl: _dobKey,
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
                      cancelText:
                      localizations.translate(i18.common.coreCommonCancel),
                      confirmText:
                      localizations.translate(i18.common.coreCommonOk),
                    ),
                  ),
                ),
              );
              break;
            case _genderKey:
              widget = AbsorbPointer(
                absorbing: fieldConfig['readOnly'] ?? false,
                child: Opacity(
                  opacity: (fieldConfig['readOnly'] ?? false) ? 0.5 : 1,
                  child: SelectionBox<String>(
                    title: '${localizations.translate(
                      i18.individualDetails.genderLabelText,
                    )}${fieldConfig['isRequired'] ?? false ? '*' : ''}',
                    allowMultipleSelection: false,
                    width: 126,
                    initialSelection:
                    model.form.control(_genderKey).value != null
                        ? [model.form.control(_genderKey).value]
                        : [],
                    options: RegistrationDeliverySingleton()
                        .genderOptions!
                        .map(
                          (e) => e,
                    )
                        .toList(),
                    onSelectionChanged: (value) {
                      model.func!(model.form,false,value);
                    },
                    valueMapper: (value) {
                      return localizations.translate(value);
                    },
                    errorMessage: model.form.control(_genderKey).hasErrors &&
                        model.form.control(_genderKey).touched
                        ? localizations.translate(i18.common.corecommonRequired)
                        : null,
                  ),
                ),
              );
              break;
            case _mobileNumberKey:
              widget = individualDetailsShowcaseData.mobile.buildWith(
                child: DigitTextFormField(
                  isRequired: fieldConfig['isRequired'] ?? false,
                  readOnly: fieldConfig['readOnly'] ?? false,
                  keyboardType: TextInputType.number,
                  formControlName: _mobileNumberKey,
                  maxLength: 10,
                  label: localizations.translate(
                    i18.individualDetails.mobileNumberLabelText,
                  ),
                  validationMessages: {
                    'required': (object) => localizations.translate(
                      '${i18.individualDetails.idNumberLabelText}_IS_REQUIRED',
                    ),
                    'maxLength': (object) => localizations.translate(i18
                        .individualDetails.mobileNumberLengthValidationMessage),
                    'minLength': (object) => localizations.translate(i18
                        .individualDetails.mobileNumberLengthValidationMessage),
                    'customError': (object) => localizations.translate(
                      fieldConfig['errorMessage'] ?? '',
                    )
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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

  FormGroup buildForm(BeneficiaryRegistrationState state, BuildContext context, Function getGenderOptions) {
    final individual = state.mapOrNull<IndividualModel>(
      editIndividual: (value) {
        if (value.projectBeneficiaryModel?.tag != null) {
          context.read<DigitScannerBloc>().add(DigitScannerScanEvent(
              barCode: [], qrCode: [value.projectBeneficiaryModel!.tag!]));
        }

        return value.individualModel;
      },
      create: (value) {
        return value.individualModel;
      },
      summary: (value) {
        return value.individualModel;
      },
    );

    final searchQuery = state.mapOrNull<String>(
      create: (value) {
        return value.searchQuery;
      },
    );

    final formGroup = fb.group(<String, Object>{
      _individualNameKey: FormControl<String>(
        validators: [
          CustomValidator.requiredMin,
          Validators.maxLength(200),
        ],
        value: individual?.name?.givenName ?? searchQuery?.trim(),
      ),
      _idTypeKey: FormControl<String>(
        value: individual?.identifiers?.firstOrNull?.identifierType,
      ),
      _idNumberKey: FormControl<String>(
        value: individual?.identifiers?.firstOrNull?.identifierId,
      ),
      _dobKey: FormControl<DateTime>(
        value: individual?.dateOfBirth != null
            ? DateFormat(Constants().dateFormat).parse(
          individual!.dateOfBirth!,
        )
            : null,
      ),
      _genderKey: FormControl<String>(value: getGenderOptions(individual)),
      _mobileNumberKey:
      FormControl<String>(value: individual?.mobileNumber, validators: [
        CustomValidator.validMobileNumber,
        CustomValidator.minPhoneNumValidation,
        Validators.maxLength(10)
      ]),
    });

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
          fieldConfig.containsKey('regex') &&
          fieldConfig['regex'] is List) {
        List<String> regexList = fieldConfig['regex'];
        String errorMessages = fieldConfig['errorMessage'];

        regexList.asMap().forEach((index, regexPattern) {
          updatedValidators.add((control) {
            final value = control.value?.toString() ??
                ''; // Convert to string or default to empty
            if (value.isNotEmpty && !RegExp(regexPattern).hasMatch(value)) {
              // Ensure there's a matching error message for this index
              return {
                'customError': errorMessages[index]
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

    return formGroup;
  }
}