import 'package:digit_components/widgets/atoms/digit_date_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_integer_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_components/widgets/atoms/text_block.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/app_localization.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../models/entities/additional_fields_type.dart';
import '../../pages/beneficiary_registration/household_details.dart';
import '../../pages/beneficiary_registration/household_location.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_wrappers.dart';
import '../formController.dart';
import '../models/widget_config_model.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../utils.dart';
import '../widgetfactory.dart';

class HouseholdDetailsComponentMapper {
  static const _dateOfRegistrationKey =
      HouseHoldDetailsPageState.dateOfRegistrationKey;
  static const _memberCountKey = HouseHoldDetailsPageState.memberCountKey;
  static const _pregnantWomenCountKey =
      HouseHoldDetailsPageState.pregnantWomenCountKey;
  static const _childrenCountKey = HouseHoldDetailsPageState.childrenCountKey;

  Map<String, dynamic> configs = {
    "name": "HouseDetails",
    "type": "page",
    "components": [
      {
        "title": "House Details",
        "description":
            "Make sure the village name matches the one where you are today.",
        "order": 1,
        "attributes": [
          {
            'name': 'dateOfRegistration',
            'isEnabled': true,
            'readOnly': true,
            'isRequired': true,
            'order': 4,
          },
          {
            'name': 'memberCount',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': true,
            'order': 1,
          },
          {
            'name': 'pregnantWomenCount',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': true,
            'order': 2,
          },
          {
            'name': 'childrenCount',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': false,
            'order': 4,
          },
          {
            'name': 'abcd',
            'type': 'additionalField',
            'label': 'abcd',
            'attribute': 'dateFormPicker',
            'initialValue': DateTime.now(),
            'formDataType': 'DateTime',
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
                    localizations: localizations)),
            const SizedBox(height: 16),
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

    for (var fieldConfig in config) {
      var key = fieldConfig['name'];

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
            int pregnantWomen = form.control(_pregnantWomenCountKey).value;
            int children = form.control(_childrenCountKey).value;
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
                          form.control(_pregnantWomenCountKey).value;
                      int children = form.control(_childrenCountKey).value;
                      int memberCount = form.control(_memberCountKey).value;
                      if (memberCount <= pregnantWomen + children) {
                        form.control(_memberCountKey).value =
                            (children + pregnantWomen);
                      }
                    },
                    form: form,
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
                          form.control(_pregnantWomenCountKey).value;
                      int children = form.control(_childrenCountKey).value;
                      int memberCount = form.control(_memberCountKey).value;
                      form.control(_memberCountKey).value =
                          memberCount < (children + pregnantWomen)
                              ? children + pregnantWomen
                              : memberCount;
                    },
                    form: form,
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
                          form.control(_pregnantWomenCountKey).value;
                      int children = form.control(_childrenCountKey).value;
                      int memberCount = form.control(_memberCountKey).value;
                      form.control(_memberCountKey).value =
                          memberCount <= (children + pregnantWomen)
                              ? children + pregnantWomen
                              : memberCount;
                    },
                    form: form,
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

    final formGroup = fb.group(<String, Object>{
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
    final existingConfigs = [
      _childrenCountKey,
      _memberCountKey,
      _pregnantWomenCountKey,
      _dateOfRegistrationKey
    ];

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

    for (var component in configs["components"]) {
      for (var attribute in component["attributes"]) {
        addValidators(formGroup,attribute);
      }
    }

    return formGroup;
  }
}
