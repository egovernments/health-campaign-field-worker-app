import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../models/entities/additional_fields_type.dart';
import '../../utils/component_mapper/house_details_component_mapper.dart';
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
  final List<config>? widgetConfig;

  const HouseDetailsPage({
    this.widgetConfig,
    super.key,
    super.appLocalizations,
  });

  @override
  State<HouseDetailsPage> createState() => HouseDetailsPageState();
}

class HouseDetailsPageState extends LocalizedState<HouseDetailsPage> {
  static const noOfRoomsKey = 'noOfRooms';
  static const householdStructureKey = 'householdStructure';
  List<String>? selectedHouseStructureTypes;
  HouseDetailsComponentMapper mapper = HouseDetailsComponentMapper();

  @override
  void initState() {
    final registrationState = context.read<BeneficiaryRegistrationBloc>().state;

    if (widget.widgetConfig != null) {
      final converter = FieldConverter(widget.widgetConfig);
      mapper.configs =
          converter.convertWidgetConfigToJsonByName(HouseDetailsRoute.name)!;
    }
    super.initState();
  }

  void updateState(dynamic form, bool flag, var values) {
    if (flag) {
      setState(() {
        form.control(householdStructureKey).setErrors({'': true});
      });
    } else {
      setState(() {
        form.control(householdStructureKey).value = values;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;

    void validate(final form, final key, final fieldConfig) {
      if (fieldConfig?['attribute'] != null &&
          fieldConfig?['attribute'] != 'textField' &&
          fieldConfig?['attribute'] != 'dateFormPicker' &&
          fieldConfig?['attribute'] != 'dobPicker') {
        if (form.control(key).value == null &&
            (fieldConfig?['isRequired'] ?? false) &&
            (fieldConfig?['isEnabled'] ?? false)) {
          setState(() {
            form.control(key).setErrors({'': true});
          });
        }
      }
      if (fieldConfig?['attribute'] == 'dobPicker') {
        final age = DigitDateUtils.calculateAge(
          form.control(key).value as DateTime?,
        );
        if ((fieldConfig?['isRequired'] ?? false) &&
            (fieldConfig?['isEnabled'] ?? false) &&
            ((age.years == 0 && age.months == 0) ||
                (age.years >= 150 && age.months > 0))) {
          setState(() {
            form.control(key).setErrors({'': true});
          });
        }
      }
    }

    return Scaffold(
      body: ReactiveFormBuilder(
          form: () => mapper.buildForm(bloc.state, localizations),
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
                          List<AdditionalField> fields = [];
                          for (var component in mapper.configs["components"]) {
                            for (var fieldConfig in component["attributes"]) {
                              var key = fieldConfig["name"];
                              validate(form, key, fieldConfig);
                              if (fieldConfig['type'] == 'additionalField' &&
                                  fieldConfig['isEnabled'] == true) {
                                var val = form.control(key).value ?? '';
                                fields.add(AdditionalField(
                                  key,
                                  val is List
                                      ? val.join("|").toString()
                                      : val.toString(),
                                ));
                              }
                            }
                          }
                          form.markAllAsTouched();
                          if (!form.valid) return;
                          selectedHouseStructureTypes =
                              form.control(householdStructureKey).value;

                          final noOfRooms =
                              form.control(noOfRoomsKey).value as int;
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
                                        ...fields,
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
                                    ...fields,
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
                          child: Column(
                              children: mapper.buildWidgetsFromConfig(
                                  WidgetConfigModel(
                                      config: mapper.configs,
                                      form: form,
                                      func: updateState,
                                      localizations: localizations),
                                  context))),
                    ],
                  );
                },
              )),
    );
  }
}
