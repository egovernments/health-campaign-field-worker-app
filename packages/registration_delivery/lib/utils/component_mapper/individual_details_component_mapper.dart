import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_reactive_search_dropdown.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_components/widgets/atoms/text_block.dart';
import 'package:digit_components/widgets/digit_card.dart';
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
import '../form_controller.dart';
import '../models/widget_config_model.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../utils.dart';
import '../widgetfactory.dart';

class IndividualsDatailsComponentMapper {
  static const _individualNameKey =
      IndividualDetailsPageState.individualNameKey;
  static const _idTypeKey = IndividualDetailsPageState.idTypeKey;
  static const _idNumberKey = IndividualDetailsPageState.idNumberKey;
  static const _dobKey = IndividualDetailsPageState.dobKey;
  static const _genderKey = IndividualDetailsPageState.genderKey;
  static const _mobileNumberKey = IndividualDetailsPageState.mobileNumberKey;
  DateTime now = DateTime.now();
  bool isHeadOfHousehold = false;
  static const maxLength = 200;

  IndividualsDatailsComponentMapper({this.isHeadOfHousehold = false});

  Map<String, dynamic> configs = {
    "name": "IndividualDetails",
    "type": "page",
    "components": [
      {
        "title": "Individual Details",
        // "description":
        //     "Make sure the village name matches the one where you are today.",
        "order": 1,
        "attributes": [
          {
            'name': 'individualName',
            'isEnabled': true,
            'readOnly': true,
            'attribute': 'textField',
            'order': 1,
          },
          {
            'name': 'idType',
            'isEnabled': true,
            'readOnly': false,
            'attribute': 'dropdown',
            'isRequired': true,
            'order': 2,
          },
          {
            'name': 'idNumber',
            'isEnabled': true,
            'readOnly': false,
            'attribute': 'textField',
            'isRequired': true,
            'order': 3,
          },
          {
            'name': 'dob',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': false,
            'attribute': 'dobPicker',
            'order': 4,
          },
          {
            'name': 'gender',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': true,
            'attribute': 'selectionbox',
            'order': 5,
          },
          {
            'name': 'mobileNumber',
            'isEnabled': true,
            'readOnly': false,
            'attribute': 'textField',
            'order': 6,
          },
          {
            'name': 'isPregnant',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': false,
            'order': 7,
            'type': 'additionalField',
            'label': 'Is Pregnant',
            'attribute': 'checkbox',
            'formDataType': 'bool'
          },
          {
            'name': 'ttVaccinesTaken',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': true,
            'order': 8,
            'initialValue': 0,
            'type': 'additionalField',
            'label': 'How many TT vaccines taken',
            'attribute': 'integerFormPicker',
            'formDataType': 'int'
          },
          {
            'name': 'noOfMonthsPregnant',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': true,
            'order': 9,
            'initialValue': 0,
            'type': 'additionalField',
            'label': 'How many months pregnancy',
            'attribute': 'integerFormPicker',
            'formDataType': 'int'
          },
          {
            'name': 'noOfTimesVisitedHF',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': true,
            'order': 10,
            'initialValue': 0,
            'type': 'additionalField',
            'label': 'How many months visited HF for ANC',
            'attribute': 'integerFormPicker',
            'formDataType': 'int'
          },{
            'name': 'noOfChildrenLessThan5',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': true,
            'order': 11,
            'initialValue': 0,
            'type': 'additionalField',
            'label': 'How many childs less than 5',
            'attribute': 'integerFormPicker',
            'formDataType': 'int'
          },{
            'name': 'isVaccinationCondition',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': true,
            'order': 12,
            'type': 'additionalField',
            'label': 'Does child have vaccination card',
            'attribute': 'radioButton',
            'formDataType': 'KeyValue',
            "menuItems": ["Yes", "No"],
          },{
            'name': 'antigens',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': true,
            'order': 13,
            'type': 'additionalField',
            'label': 'Select antigens given',
            'attribute': 'dropdown',
            'formDataType': 'String',
            "menuItems": ["Bacteria","Viruses","Fungi"],
          },
          {
            'name': 'vaccinationPart',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': true,
            'order': 13,
            'type': 'additionalField',
            'label': 'On which part of body vaccination was given',
            'attribute': 'dropdown',
            'formDataType': 'String',
            "menuItems": ["Left Arm","Right Arm","Left Leg","Right Leg"],
          },
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
        Map<String, String Function(Object control)> validationMessages = {};

        if (fieldConfig['validation'] != null) {
          fieldConfig['validation'].forEach((element) {
            validationMessages[element['key']] =
                (_) => localizations.translate(element['errorMessage']);
          });
        }

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
              form: form,
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
                func!(form, true, value);
              },
              isRequired: fieldConfig['isRequired'] ?? false,
              validationMessage: form.control(_idTypeKey).hasErrors &&
                      form.control(_idTypeKey).touched
                  ? localizations.translate(
                      i18.common.corecommonRequired,
                    )
                  : null,
              emptyText: localizations.translate(i18.common.noMatchFound),
            );
            break;
          case _idNumberKey:
            widget = form.control(_idTypeKey).value != 'DEFAULT'
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
                : const SizedBox(height: 16);
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
                  initialSelection: form.control(_genderKey).value != null
                      ? [form.control(_genderKey).value]
                      : [],
                  options: RegistrationDeliverySingleton()
                      .genderOptions!
                      .map(
                        (e) => e,
                      )
                      .toList(),
                  onSelectionChanged: (value) {
                    func!(form, false, value);
                  },
                  valueMapper: (value) {
                    return localizations.translate(value);
                  },
                  errorMessage: form.control(_genderKey).hasErrors &&
                          form.control(_genderKey).touched
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

    return widgets;
  }

  FormGroup buildForm(
      BeneficiaryRegistrationState state,
      BuildContext context,
      Function getGenderOptions,
      RegistrationDeliveryLocalization localizations) {
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

    final existingConfigs = [
      _dobKey,
      _genderKey,
      _idNumberKey,
      _idTypeKey,
      _individualNameKey,
      _mobileNumberKey
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
