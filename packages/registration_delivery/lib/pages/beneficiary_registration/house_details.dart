import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../models/entities/additional_fields_type.dart';
import '../../utils/convert_to_map.dart';
import '../../utils/formController.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/models/widget_config_model.dart';
import '../../utils/utils.dart';
import '../../utils/widgetfactory.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class HouseDetailsPage extends LocalizedStatefulWidget {
  final List<FormConfigModel>? widgetConfig;

  const HouseDetailsPage({
    this.widgetConfig,
    super.key,
    super.appLocalizations,
  });

  @override
  State<HouseDetailsPage> createState() => HouseDetailsPageState();
}

class HouseDetailsPageState extends LocalizedState<HouseDetailsPage> {
  static const _noOfRoomsKey = 'noOfRooms';
  static const _householdStructureKey = 'householdStructure';
  List<String>? selectedHouseStructureTypes;
  Map<String, Map<String, dynamic>> configs = {
    'householdStructure': {
      'isEnabled': true,
      'readOnly': false,
      'isRequired': false,
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

  @override
  void initState() {
    final registrationState = context.read<BeneficiaryRegistrationBloc>().state;

    if(widget.widgetConfig != null) {
      final converter = FieldConverter(widget.widgetConfig);
      configs = converter.convertFields('Housedetails');
    }
    super.initState();
  }

  List<Widget> buildWidgetsFromConfig(WidgetConfigModel model) {
    List<Widget> widgets = [];

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
                          setState(() {
                            model.form
                                .control(_householdStructureKey)
                                .setErrors({'': true});
                          });
                        } else {
                          setState(() {
                            model.form.control(_householdStructureKey).value =
                                values;
                          });
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;

    return Scaffold(
      body: ReactiveFormBuilder(
          form: () => buildForm(bloc.state),
          builder: (_, form, __) => BlocBuilder<BeneficiaryRegistrationBloc,
                  BeneficiaryRegistrationState>(
                builder: (context, registrationState) {
                  return ScrollableContent(
                    enableFixedButton: true,
                    header: const Column(
                      children: [
                        BackNavigationHelpHeaderWidget(
                          showcaseButton: ShowcaseButton(),
                          showHelp: false,
                        ),
                      ],
                    ),
                    footer: DigitCard(
                      margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                      padding:
                          const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                      child: DigitElevatedButton(
                        onPressed: () {
                          form.markAllAsTouched();
                          if (form.control(_householdStructureKey).value ==
                                  null &&
                              (configs[_householdStructureKey]
                                      ?['isRequired'] ??
                                  false) && (configs[_householdStructureKey]?['isEnabled'] ?? false)) {
                            setState(() {
                              form
                                  .control(_householdStructureKey)
                                  .setErrors({'': true});
                            });
                          }

                          if (!form.valid) return;
                          selectedHouseStructureTypes =
                              form.control(_householdStructureKey).value;

                          final noOfRooms =
                              form.control(_noOfRoomsKey).value as int;
                          registrationState.maybeWhen(
                            orElse: () {
                              return;
                            },
                            create: (
                              address,
                              householdModel,
                              individualModel,
                              projectBeneficiaryModel,
                              registrationDate,
                              searchQuery,
                              loading,
                              isHeadOfHousehold,
                            ) {
                              var houseModel = HouseholdModel(
                                  clientReferenceId: IdGen.i.identifier,
                                  tenantId:
                                      RegistrationDeliverySingleton().tenantId,
                                  rowVersion: 1,
                                  auditDetails: AuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    createdTime:
                                        context.millisecondsSinceEpoch(),
                                  ),
                                  memberCount: householdModel?.memberCount,
                                  clientAuditDetails: ClientAuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    createdTime:
                                        context.millisecondsSinceEpoch(),
                                    lastModifiedBy:
                                        RegistrationDeliverySingleton()
                                            .loggedInUserUuid,
                                    lastModifiedTime:
                                        context.millisecondsSinceEpoch(),
                                  ),
                                  additionalFields: HouseholdAdditionalFields(
                                      version: 1,
                                      fields: [
                                        ...?householdModel
                                            ?.additionalFields?.fields
                                            .where((e) =>
                                                e.key !=
                                                    AdditionalFieldsType
                                                        .houseStructureTypes
                                                        .toValue() &&
                                                e.key !=
                                                    AdditionalFieldsType
                                                        .noOfRooms
                                                        .toValue()),
                                        AdditionalField(
                                          AdditionalFieldsType
                                              .houseStructureTypes
                                              .toValue(),
                                          selectedHouseStructureTypes
                                              ?.join("|")
                                              .toString(),
                                        ),
                                        AdditionalField(
                                          AdditionalFieldsType.noOfRooms
                                              .toValue(),
                                          noOfRooms,
                                        )
                                      ]));

                              bloc.add(
                                BeneficiaryRegistrationSaveHouseDetailsEvent(
                                  model: houseModel,
                                ),
                              );
                              router.push(HouseHoldDetailsRoute());
                            },
                            editHousehold: (
                              address,
                              householdModel,
                              individuals,
                              registrationDate,
                              projectBeneficiaryModel,
                              loading,
                              headOfHousehold,
                            ) {
                              var houseModel = householdModel.copyWith(
                                  additionalFields: HouseholdAdditionalFields(
                                      version: 1,
                                      fields: [
                                    ...?householdModel.additionalFields?.fields
                                        .where((e) =>
                                            e.key !=
                                                AdditionalFieldsType
                                                    .houseStructureTypes
                                                    .toValue() &&
                                            e.key !=
                                                AdditionalFieldsType.noOfRooms
                                                    .toValue()),
                                    AdditionalField(
                                      AdditionalFieldsType.houseStructureTypes
                                          .toValue(),
                                      selectedHouseStructureTypes
                                          ?.join("|")
                                          .toString(),
                                    ),
                                    AdditionalField(
                                      AdditionalFieldsType.noOfRooms.toValue(),
                                      noOfRooms,
                                    )
                                  ]));
                              // TODO [Linking of Voucher for Household based project  need to be handled]

                              bloc.add(
                                BeneficiaryRegistrationSaveHouseDetailsEvent(
                                  model: houseModel,
                                ),
                              );
                              router.push(HouseHoldDetailsRoute());
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            localizations.translate(
                              i18.householdLocation.actionLabel,
                            ),
                          ),
                        ),
                      ),
                    ),
                    slivers: [
                      SliverToBoxAdapter(
                        child: DigitCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0, 0, 0, kPadding),
                                child: Text(
                                  localizations.translate(
                                    i18.householdDetails.houseDetailsLabel,
                                  ),
                                  style: theme.textTheme.displayMedium,
                                ),
                              ),
                              Column(
                                  children: buildWidgetsFromConfig(
                                      WidgetConfigModel(
                                          config: configs,
                                          form: form)))
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )),
    );
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
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
