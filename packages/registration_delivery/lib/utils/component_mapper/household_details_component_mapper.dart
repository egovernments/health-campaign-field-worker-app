import 'package:digit_components/widgets/atoms/digit_date_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_integer_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/app_localization.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../models/entities/additional_fields_type.dart';
import '../../pages/beneficiary_registration/household_details.dart';
import '../../pages/beneficiary_registration/household_location.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../models/widget_config_model.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../utils.dart';

class HouseholdDetailsComponentMapper {
  static const _dateOfRegistrationKey = HouseHoldDetailsPageState.dateOfRegistrationKey;
  static const _memberCountKey = HouseHoldDetailsPageState.memberCountKey;
  static const _pregnantWomenCountKey = HouseHoldDetailsPageState.pregnantWomenCountKey;
  static const _childrenCountKey = HouseHoldDetailsPageState.childrenCountKey;
  Map<String, Map<String, dynamic>> configs =  {
    'dateOfRegistration': {
      'isEnabled': true,
      'readOnly': true,
      'isRequired': true,
      'order': 4,
    },
    'memberCount': {
      'isEnabled': true,
      'readOnly': false,
      'isRequired': true,
      'order': 1,
    },
    'pregnantWomenCount': {
      'isEnabled': true,
      'readOnly': false,
      'isRequired': true,
      'order': 2,
    },
    'childrenCount': {
      'isEnabled': true,
      'readOnly': false,
      'isRequired': false,
      'order': 4,
    },
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
            case _dateOfRegistrationKey:
              widget = householdDetailsShowcaseData.dateOfRegistration.buildWith(
                child: DigitDateFormPicker(
                  isEnabled: (fieldConfig['readOnly'] ?? false) != true,
                  formControlName: _dateOfRegistrationKey,
                  label: localizations.translate(
                    i18.householdDetails.dateOfRegistrationLabel,
                  ),
                  isRequired: fieldConfig['isRequired'] ?? false,
                  confirmText: localizations.translate(
                    i18.common.coreCommonOk,
                  ),
                  cancelText: localizations.translate(
                    i18.common.coreCommonCancel,
                  ),
                ),
              );
              break;
            case _memberCountKey:
              int pregnantWomen =
                  model.form.control(_pregnantWomenCountKey).value;
              int children = model.form.control(_childrenCountKey).value;
              widget = householdDetailsShowcaseData
                  .numberOfMembersLivingInHousehold
                  .buildWith(
                child: AbsorbPointer(
                  absorbing: fieldConfig['readOnly'] ?? false,
                  child: Opacity(
                    opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
                    child: DigitIntegerFormPicker(
                      minimum: children + pregnantWomen != 0
                          ? children + pregnantWomen
                          : 1,
                      maximum: 30,
                      onChange: () {
                        int pregnantWomen =
                            model.form.control(_pregnantWomenCountKey).value;
                        int children =
                            model.form.control(_childrenCountKey).value;
                        int memberCount =
                            model.form.control(_memberCountKey).value;
                        if (memberCount <= pregnantWomen + children) {
                          model.form.control(_memberCountKey).value =
                          (children + pregnantWomen);
                        }
                      },
                      form: model.form,
                      formControlName: _memberCountKey,
                      label: localizations.translate(
                        i18.householdDetails.noOfMembersCountLabel,
                      ),
                      incrementer: true,
                    ),
                  ),
                ),
              );
              break;
            case _pregnantWomenCountKey:
              widget = householdDetailsShowcaseData
                  .numberOfPregnantWomenInHousehold
                  .buildWith(
                child: AbsorbPointer(
                  absorbing: fieldConfig['readOnly'] ?? false,
                  child: Opacity(
                    opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
                    child: DigitIntegerFormPicker(
                      minimum: 0,
                      maximum: 10,
                      onChange: () {
                        int pregnantWomen =
                            model.form.control(_pregnantWomenCountKey).value;
                        int children =
                            model.form.control(_childrenCountKey).value;
                        int memberCount =
                            model.form.control(_memberCountKey).value;
                        model.form.control(_memberCountKey).value =
                        memberCount < (children + pregnantWomen)
                            ? children + pregnantWomen
                            : memberCount;
                      },
                      form: model.form,
                      formControlName: _pregnantWomenCountKey,
                      label: '${localizations.translate(
                        i18.householdDetails.noOfPregnantWomenCountLabel,
                      )}${fieldConfig['isRequired'] ?? false ? '*' : ''}',
                      incrementer: true,
                    ),
                  ),
                ),
              );
              break;
            case _childrenCountKey:
              widget = householdDetailsShowcaseData
                  .numberOfChildrenBelow5InHousehold
                  .buildWith(
                child: AbsorbPointer(
                  absorbing: fieldConfig['readOnly'] ?? false,
                  child: Opacity(
                    opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
                    child: DigitIntegerFormPicker(
                      minimum: 0,
                      maximum: 20,
                      onChange: () {
                        int pregnantWomen =
                            model.form.control(_pregnantWomenCountKey).value;
                        int children =
                            model.form.control(_childrenCountKey).value;
                        int memberCount =
                            model.form.control(_memberCountKey).value;
                        model.form.control(_memberCountKey).value =
                        memberCount <= (children + pregnantWomen)
                            ? children + pregnantWomen
                            : memberCount;
                      },
                      form: model.form,
                      formControlName: _childrenCountKey,
                      label: '${localizations.translate(
                        i18.householdDetails.noOfChildrenBelow5YearsLabel,
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

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final household = state.mapOrNull(editHousehold: (value) {
      return value.householdModel;
    }, create: (value) {
      return value.householdModel;
    });

    final registrationDate = state.mapOrNull(
      editHousehold: (value) {
        return value.registrationDate;
      },
      create: (value) => DateTime.now(),
    );

    return fb.group(<String, Object>{
      _dateOfRegistrationKey:
      FormControl<DateTime>(value: registrationDate, validators: []),
      _memberCountKey: FormControl<int>(
        value: household?.memberCount ?? 1,
      ),
      _pregnantWomenCountKey: FormControl<int>(
        value: household?.additionalFields?.fields
            .where((h) =>
        h.key == AdditionalFieldsType.pregnantWomen.toValue())
            .firstOrNull
            ?.value !=
            null
            ? int.tryParse(household?.additionalFields?.fields
            .where((h) =>
        h.key == AdditionalFieldsType.pregnantWomen.toValue())
            .firstOrNull
            ?.value
            .toString() ??
            '0')
            : 0,
      ),
      _childrenCountKey: FormControl<int>(
        value: household?.additionalFields?.fields
            .where(
                (h) => h.key == AdditionalFieldsType.children.toValue())
            .firstOrNull
            ?.value !=
            null
            ? int.tryParse(household?.additionalFields?.fields
            .where(
                (h) => h.key == AdditionalFieldsType.children.toValue())
            .firstOrNull
            ?.value
            .toString() ??
            '0')
            : 0,
      )
    });
  }
}