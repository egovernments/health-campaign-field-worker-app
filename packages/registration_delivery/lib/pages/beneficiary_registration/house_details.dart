import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../models/entities/additional_fields_type.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class HouseDetailsPage extends LocalizedStatefulWidget {
  const HouseDetailsPage({
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ReactiveFormBuilder(
          form: () => buildForm(bloc.state),
          builder: (_, form, __) => BlocBuilder<BeneficiaryRegistrationBloc,
                  BeneficiaryRegistrationState>(
                builder: (context, registrationState) {
                  return ScrollableContent(
                    enableFixedDigitButton: true,
                    header: const Column(
                      children: [
                        BackNavigationHelpHeaderWidget(
                          showcaseButton: ShowcaseButton(),
                          showHelp: false,
                        ),
                      ],
                    ),
                    footer: DigitCard(
                        margin: const EdgeInsets.only(top: spacer2),
                        children: [
                          DigitButton(
                            onPressed: () {
                              form.markAllAsTouched();
                              if (form.control(_householdStructureKey).value ==
                                  null) {
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
                                      householdType:
                                          RegistrationDeliverySingleton()
                                              .householdType,
                                      tenantId: RegistrationDeliverySingleton()
                                          .tenantId,
                                      rowVersion: 1,
                                      auditDetails: AuditDetails(
                                        createdBy:
                                            RegistrationDeliverySingleton()
                                                .loggedInUserUuid!,
                                        createdTime:
                                            context.millisecondsSinceEpoch(),
                                      ),
                                      memberCount: householdModel?.memberCount,
                                      clientAuditDetails: ClientAuditDetails(
                                        createdBy:
                                            RegistrationDeliverySingleton()
                                                .loggedInUserUuid!,
                                        createdTime:
                                            context.millisecondsSinceEpoch(),
                                        lastModifiedBy:
                                            RegistrationDeliverySingleton()
                                                .loggedInUserUuid,
                                        lastModifiedTime:
                                            context.millisecondsSinceEpoch(),
                                      ),
                                      additionalFields:
                                          HouseholdAdditionalFields(
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
                                      additionalFields:
                                          HouseholdAdditionalFields(
                                              version: 1,
                                              fields: [
                                        ...?householdModel
                                            .additionalFields?.fields
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
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                            mainAxisSize: MainAxisSize.max,
                            label: localizations.translate(
                              i18.householdLocation.actionLabel,
                            ),
                          ),
                        ]),
                    slivers: [
                      SliverToBoxAdapter(
                        child: DigitCard(
                            margin: const EdgeInsets.all(spacer2),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  (RegistrationDeliverySingleton()
                                              .householdType ==
                                          HouseholdType.community)
                                      ? localizations.translate(
                                          i18.householdDetails
                                              .clfStructureDetailsLabel,
                                        )
                                      : localizations.translate(
                                          i18.householdDetails
                                              .houseDetailsLabel,
                                        ),
                                  style: textTheme.headingXl,
                                ),
                              ),
                              houseShowcaseData.typeOfStructure.buildWith(
                                child: SelectionCard<String>(
                                  showParentContainer: true,
                                  isRequired: true,
                                  title: localizations.translate(
                                      i18.householdDetails.typeOfStructure),
                                  equalWidthOptions: true,
                                  allowMultipleSelection: false,
                                  options: RegistrationDeliverySingleton()
                                          .houseStructureTypes ??
                                      [],
                                  initialSelection: form
                                              .control(_householdStructureKey)
                                              .value !=
                                          null
                                      ? [
                                          ...form
                                              .control(_householdStructureKey)
                                              .value
                                        ]
                                      : [],
                                  onSelectionChanged: (values) {
                                    form
                                        .control(_householdStructureKey)
                                        .markAsTouched();
                                    if (values.isEmpty) {
                                      form
                                          .control(_householdStructureKey)
                                          .value = null;
                                      setState(() {
                                        form
                                            .control(_householdStructureKey)
                                            .setErrors({'': true});
                                      });
                                    } else {
                                      setState(() {
                                        form
                                            .control(_householdStructureKey)
                                            .value = values;
                                      });
                                    }
                                  },
                                  valueMapper: (value) {
                                    return localizations
                                        .translate(value.toString());
                                  },
                                  errorMessage: form
                                              .control(_householdStructureKey)
                                              .hasErrors &&
                                          form
                                              .control(_householdStructureKey)
                                              .touched
                                      ? localizations.translate(i18
                                          .householdDetails
                                          .selectStructureTypeError)
                                      : null,
                                ),
                              ),
                              houseShowcaseData.noOfRooms.buildWith(
                                child: ReactiveWrapperField(
                                  formControlName: _noOfRoomsKey,
                                  builder: (field) => LabeledField(
                                    label: (RegistrationDeliverySingleton()
                                                .householdType ==
                                            HouseholdType.community)
                                        ? localizations.translate(i18
                                            .householdDetails.noOfRoomsCLFLabel)
                                        : localizations.translate(
                                            i18.householdDetails.noOfRoomsLabel,
                                          ),
                                    child: DigitNumericFormInput(
                                      minValue: 1,
                                      maxValue: 20,
                                      initialValue: form
                                          .control(_noOfRoomsKey)
                                          .value
                                          .toString(),
                                      step: 1,
                                      onChange: (value) {
                                        form.control(_noOfRoomsKey).value =
                                            int.parse(value);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  );
                },
              )),
    );
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    return fb.group(<String, Object>{
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
              : 1),
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
  }
}
