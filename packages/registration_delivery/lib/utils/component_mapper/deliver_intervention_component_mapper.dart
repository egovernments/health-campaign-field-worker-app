import 'package:collection/collection.dart';
import 'package:digit_components/widgets/atoms/digit_date_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_icon_button.dart';
import 'package:digit_components/widgets/atoms/digit_integer_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_reactive_search_dropdown.dart';
import 'package:digit_components/widgets/atoms/digit_stepper.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_components/widgets/atoms/text_block.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_data_model/models/entities/beneficiary_type.dart';
import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_data_model/models/entities/project_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/app_localization.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../models/entities/additional_fields_type.dart';
import '../../pages/beneficiary/deliver_intervention.dart';
import '../../pages/beneficiary_registration/house_details.dart';
import '../../widgets/beneficiary/resource_beneficiary_card.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_wrappers.dart';
import '../formController.dart';
import '../models/widget_config_model.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../utils.dart';
import '../widgetfactory.dart';

class DeliverInterventionComponentMapper {
  static const _resourceDeliveredKey =
      DeliverInterventionPageState.resourceDeliveredKey;
  static const _quantityDistributedKey =
      DeliverInterventionPageState.quantityDistributedKey;
  static const _deliveryCommentKey =
      DeliverInterventionPageState.deliveryCommentKey;
  static const _doseAdministrationKey =
      DeliverInterventionPageState.doseAdministrationKey;
  static const _dateOfAdministrationKey =
      DeliverInterventionPageState.dateOfAdministrationKey;

  Map<String, dynamic> configs = {
    "name": "DeliverIntervention",
    "type": "page",
    "components": [
      {
        "title": "Deliver Intervention",
        // "description":
        //     "Make sure the village name matches the one where you are today.",
        "order": 3,
        "attributes": [
          {
            'name': 'doseAdministered',
            'attribute': 'textField',
            'isEnabled': true,
            'readOnly': true,
            'isRequired': true,
            'order': 4,
          },
          {
            'name': 'dateOfAdministration',
            'attribute': 'dateFormPicker',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': true,
            'order': 5,
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
        ]
      },
      {
        "title": "DELIVER_INTERVENTION_RESOURCE_LABEL",
        // "description":
        //     "Make sure the village name matches the one where you are today.",
        "order": 2,
        "attributes": [
          {
            'name': 'resourceDelivered',
            'attribute': 'resourceBeneficiaryCard',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': false,
            'order': 1,
          },
        ]
      },
      {
        "title": "DELIVER_INTERVENTION_DELIVERY_COMMENT_LABEL",
        // "description":
        //     "Make sure the village name matches the one where you are today.",
        "order": 1,
        "attributes": [
          {
            'name': 'deliveryComment',
            'attribute': 'dropdown',
            'isEnabled': true,
            'readOnly': false,
            'isRequired': false,
            'order': 3,
          }
        ]
      },
    ]
  };

  List<Widget> buildWidgetsFromConfig(
      WidgetConfigModel model, Map<String, dynamic> arguments) {
    final context = arguments['context'];
    arguments['func'] = model.func;
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
                children: buildAttributesFromConfig({
              "config": component['attributes'],
              "form": model.form,
              "localizations": localizations,
              ...arguments
            })),
          ],
        ),
      );
      widgets.add(widget);
    }

    return widgets;
  }

  List<Widget> buildAttributesFromConfig(Map<String, dynamic> arguments) {
    List<Widget> widgets = [];
    final config = arguments["config"];
    final localizations = arguments["localizations"];
    final form = arguments["form"];
    final context = arguments["context"];
    final deliveryInterventionState = arguments["deliveryInterventionState"];
    final numberOfDoses = arguments["numberOfDoses"];
    final steps = arguments["steps"];
    final productVariants = arguments["productVariants"];
    final func = arguments["func"];
    final controllers = arguments["controllers"];
    final theme = Theme.of(context);

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
          case _doseAdministrationKey:
            widget = RegistrationDeliverySingleton().beneficiaryType ==
                    BeneficiaryType.individual
                ? DigitTextFormField(
                    readOnly: fieldConfig['readOnly'] ?? false,
                    isRequired: fieldConfig['isRequired'] ?? false,
                    formControlName: _doseAdministrationKey,
                    keyboardType: fieldConfig['keyboardType'] == "number"
                        ? TextInputType.number
                        : TextInputType.text,
                    label: localizations
                        .translate(i18.deliverIntervention.currentCycle),
                    validationMessages: {
                        'required': (_) => localizations.translate(
                              i18.common.corecommonRequired,
                            ),
                        ...validationMessages
                      })
                : const SizedBox();
            widgets.add(widget);
            widget = numberOfDoses > 1
                ? DigitStepper(
                    activeStep: deliveryInterventionState.dose - 1,
                    stepRadius: 12.5,
                    steps: steps,
                    maxStepReached: 3,
                    lineLength: (MediaQuery.of(context).size.width -
                            12.5 * 2 * steps.length -
                            50) /
                        (steps.length - 1),
                  )
                : const SizedBox();
            break;
          case _dateOfAdministrationKey:
            widget = DigitDateFormPicker(
              isEnabled: (fieldConfig['readOnly'] ?? false) != true,
              formControlName: _dateOfAdministrationKey,
              label: localizations.translate(
                i18.householdDetails.dateOfRegistrationLabel,
              ),
              confirmText: localizations.translate(
                i18.common.coreCommonOk,
              ),
              cancelText: localizations.translate(
                i18.common.coreCommonCancel,
              ),
              isRequired: fieldConfig['isRequired'] ?? false,
              padding: const EdgeInsets.only(
                top: kPadding,
              ),
            );
          case _deliveryCommentKey:
            widget = DigitReactiveSearchDropdown<String>(
              enabled: (fieldConfig['readOnly'] ?? false) != true,
              label: localizations.translate(
                i18.deliverIntervention.deliveryCommentLabel,
              ),
              form: form,
              menuItems: RegistrationDeliverySingleton()
                  .deliveryCommentOptions!
                  .map((e) {
                    return localizations.translate(e);
                  })
                  .toList()
                  .cast<String>() // Cast to List<String>
                ..sort((a, b) => a.compareTo(b)),
              formControlName: _deliveryCommentKey,
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
          case _resourceDeliveredKey:
            if (controllers is List) {
              widgets.addAll(controllers.map((e) => ResourceBeneficiaryCard(
                    form: form,
                    cardIndex: controllers.indexOf(e),
                    totalItems: controllers.length,
                    onDelete: (index) {
                      (form.control(
                        _resourceDeliveredKey,
                      ) as FormArray)
                          .removeAt(
                        index,
                      );
                      (form.control(
                        _quantityDistributedKey,
                      ) as FormArray)
                          .removeAt(
                        index,
                      );
                      controllers.removeAt(
                        index,
                      );
                      func(form, controllers, "delete");
                    },
                  )));
            } else {
              throw ArgumentError('controllers must be a List');
            }
            widget = Center(
              child: DigitIconButton(
                onPressed:
                    ((form.control(_resourceDeliveredKey) as FormArray).value ??
                                    [])
                                .length <
                            (productVariants ?? []).length
                        ? () async {
                            await func(form, controllers, "pressed");
                          }
                        : null,
                icon: Icons.add_circle,
                iconColor:
                    ((form.control(_resourceDeliveredKey) as FormArray).value ??
                                    [])
                                .length <
                            (productVariants ?? []).length
                        ? theme.colorScheme.secondary
                        : theme.colorScheme.outline,
                iconTextColor:
                    ((form.control(_resourceDeliveredKey) as FormArray).value ??
                                    [])
                                .length <
                            (productVariants ?? []).length
                        ? theme.colorScheme.secondary
                        : theme.colorScheme.outline,
                iconText: localizations.translate(
                  i18.deliverIntervention.resourceAddBeneficiary,
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

  // This method builds a form used for delivering interventions.

  FormGroup buildForm(
      BuildContext context,
      List<DeliveryProductVariant>? productVariants,
      List<ProductVariantModel>? variants,
      RegistrationDeliveryLocalization localizations,
      List controllers) {
    final bloc = context.read<DeliverInterventionBloc>().state;
    final overViewbloc = context.read<HouseholdOverviewBloc>().state;
    controllers.forEachIndexed((index, element) {
      controllers.removeAt(index);
    });

    // Add controllers for each product variant to the _controllers list.
    if (controllers.isEmpty) {
      final int r = RegistrationDeliverySingleton()
                  .selectedProject
                  ?.additionalDetails
                  ?.projectType
                  ?.cycles ==
              null
          ? 1
          : fetchProductVariant(
                      RegistrationDeliverySingleton()
                          .selectedProject
                          ?.additionalDetails
                          ?.projectType
                          ?.cycles![bloc.cycle - 1]
                          .deliveries?[bloc.dose - 1],
                      overViewbloc.selectedIndividual,
                      overViewbloc.householdMemberWrapper.household)!
                  .productVariants
                  ?.length ??
              0;

      controllers.addAll(List.generate(r, (index) => index)
          .mapIndexed((index, element) => index));
    }

    final formGroup = fb.group(<String, Object>{
      _doseAdministrationKey: FormControl<String>(
        value:
            '${localizations.translate(i18.deliverIntervention.cycle)} ${bloc.cycle == 0 ? (bloc.cycle + 1) : bloc.cycle}'
                .toString(),
        validators: [],
      ),
      _deliveryCommentKey: FormControl<String>(
        value: RegistrationDeliverySingleton().beneficiaryType !=
                BeneficiaryType.individual
            ? (bloc.tasks?.lastOrNull?.additionalFields?.fields
                            .where((a) =>
                                a.key ==
                                AdditionalFieldsType.deliveryComment.toValue())
                            .toList() ??
                        [])
                    .isNotEmpty
                ? bloc.tasks?.lastOrNull?.additionalFields?.fields
                    .where((a) =>
                        a.key == AdditionalFieldsType.deliveryComment.toValue())
                    .first
                    .value
                : ''
            : null,
        validators: [],
      ),
      _dateOfAdministrationKey:
          FormControl<DateTime>(value: DateTime.now(), validators: []),
      _resourceDeliveredKey: FormArray<ProductVariantModel>(
        [
          ...controllers.map((e) => FormControl<ProductVariantModel>(
                value: variants != null && variants.length < controllers.length
                    ? variants.last
                    : (variants != null &&
                            controllers.indexOf(e) < variants.length
                        ? variants.firstWhereOrNull(
                            (element) =>
                                element.id ==
                                productVariants
                                    ?.elementAt(controllers.indexOf(e))
                                    .productVariantId,
                          )
                        : null),
              )),
        ],
      ),
      _quantityDistributedKey: FormArray<int>([
        ...controllers.mapIndexed(
          (i, e) => FormControl<int>(
            value: RegistrationDeliverySingleton().beneficiaryType !=
                    BeneficiaryType.individual
                ? int.tryParse(
                    bloc.tasks?.lastOrNull?.resources?.elementAt(i).quantity ??
                        '0',
                  )
                : 0,
            // validators: [Validators.min(1)],
          ),
        ),
      ]),
    });

    final existingConfigs = [
      _doseAdministrationKey,
      _deliveryCommentKey,
      _dateOfAdministrationKey,
      _resourceDeliveredKey,
      _quantityDistributedKey,
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
