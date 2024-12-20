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
    final registrationState = context.read<BeneficiaryRegistrationBloc>().state;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;
    final textTheme = theme.digitTextTheme(context);

    return BlocConsumer<BeneficiaryRegistrationBloc,
        BeneficiaryRegistrationState>(
      listener: (context, state) {
        if (state is BeneficiaryRegistrationPersistedState && state.isEdit) {
          final overviewBloc = context.read<HouseholdOverviewBloc>();

          overviewBloc.add(
            HouseholdOverviewReloadEvent(
              projectId: RegistrationDeliverySingleton().projectId.toString(),
              projectBeneficiaryType:
                  RegistrationDeliverySingleton().beneficiaryType ??
                      BeneficiaryType.household,
            ),
          );
          HouseholdMemberWrapper memberWrapper =
              overviewBloc.state.householdMemberWrapper;
          final route = router.parent() as StackRouter;
          route.popUntilRouteWithName(SearchBeneficiaryRoute.name);
          route.push(BeneficiaryWrapperRoute(wrapper: memberWrapper));
        }
      },
      listenWhen: (previous, current) =>
          RegistrationDeliverySingleton().householdType ==
          HouseholdType.community,
      builder: (context, registrationState) {
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
                            margin: const EdgeInsets.only(top: spacer2),
                            padding: const EdgeInsets.all(spacer2),
                            children: [
                              Button(
                                onPressed: () {
                                  form.markAllAsTouched();
                                  if (form
                                          .control(_householdStructureKey)
                                          .value ==
                                      null) {
                                    setState(() {
                                      form
                                          .control(_householdStructureKey)
                                          .setErrors({'': true});
                                    });
                                  }

                                  if (!form.valid) return;
                                  selectedHouseStructureTypes = form
                                      .control(_householdStructureKey)
                                      .value;

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
                                          householdType:
                                              RegistrationDeliverySingleton()
                                                  .householdType,
                                          clientReferenceId: IdGen.i.identifier,
                                          tenantId:
                                              RegistrationDeliverySingleton()
                                                  .tenantId,
                                          rowVersion: 1,
                                          auditDetails: AuditDetails(
                                            createdBy:
                                                RegistrationDeliverySingleton()
                                                    .loggedInUserUuid!,
                                            createdTime: context
                                                .millisecondsSinceEpoch(),
                                          ),

                                          ///[TODO]: NEED TO FIX THIS
                                          memberCount:
                                              (RegistrationDeliverySingleton()
                                                          .householdType ==
                                                      HouseholdType.community)
                                                  ? 0
                                                  : householdModel?.memberCount,
                                          clientAuditDetails:
                                              ClientAuditDetails(
                                            createdBy:
                                                RegistrationDeliverySingleton()
                                                    .loggedInUserUuid!,
                                            createdTime: context
                                                .millisecondsSinceEpoch(),
                                            lastModifiedBy:
                                                RegistrationDeliverySingleton()
                                                    .loggedInUserUuid,
                                            lastModifiedTime: context
                                                .millisecondsSinceEpoch(),
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
                                      if (RegistrationDeliverySingleton()
                                              .householdType ==
                                          HouseholdType.community) {
                                        router.push(IndividualDetailsRoute(
                                            isHeadOfHousehold: true));
                                      } else {
                                        router.push(HouseHoldDetailsRoute());
                                      }
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

                                      if (RegistrationDeliverySingleton()
                                              .householdType ==
                                          HouseholdType.community) {
                                        bloc.add(
                                          BeneficiaryRegistrationUpdateHouseholdDetailsEvent(
                                            household: houseModel.copyWith(
                                              clientAuditDetails: (address
                                                              .clientAuditDetails
                                                              ?.createdBy !=
                                                          null &&
                                                      address.clientAuditDetails
                                                              ?.createdTime !=
                                                          null)
                                                  ? ClientAuditDetails(
                                                      createdBy: address
                                                          .clientAuditDetails!
                                                          .createdBy,
                                                      createdTime: address
                                                          .clientAuditDetails!
                                                          .createdTime,
                                                      lastModifiedBy:
                                                          RegistrationDeliverySingleton()
                                                              .loggedInUserUuid,
                                                      lastModifiedTime: context
                                                          .millisecondsSinceEpoch(),
                                                    )
                                                  : null,
                                            ),
                                            addressModel: address.copyWith(
                                              clientAuditDetails: (address
                                                              .clientAuditDetails
                                                              ?.createdBy !=
                                                          null &&
                                                      address.clientAuditDetails
                                                              ?.createdTime !=
                                                          null)
                                                  ? ClientAuditDetails(
                                                      createdBy: address
                                                          .clientAuditDetails!
                                                          .createdBy,
                                                      createdTime: address
                                                          .clientAuditDetails!
                                                          .createdTime,
                                                      lastModifiedBy:
                                                          RegistrationDeliverySingleton()
                                                              .loggedInUserUuid,
                                                      lastModifiedTime: context
                                                          .millisecondsSinceEpoch(),
                                                    )
                                                  : null,
                                            ),
                                          ),
                                        );
                                      } else {
                                        bloc.add(
                                          BeneficiaryRegistrationSaveHouseDetailsEvent(
                                            model: houseModel,
                                          ),
                                        );
                                        router.push(HouseHoldDetailsRoute());
                                      }
                                    },
                                  );
                                },
                                type: ButtonType.primary,
                                size: ButtonSize.large,
                                mainAxisSize: MainAxisSize.max,
                                label: (RegistrationDeliverySingleton()
                                            .householdType ==
                                        HouseholdType.community)
                                    ? registrationState.mapOrNull(
                                          editHousehold: (value) =>
                                              localizations.translate(
                                                  i18.common.coreCommonSave),
                                        ) ??
                                        localizations.translate(
                                            i18.householdDetails.actionLabel)
                                    : localizations.translate(
                                        i18.householdDetails.actionLabel),
                              ),
                            ]),
                        slivers: [
                          SliverToBoxAdapter(
                            child: DigitCard(children: [
                              Padding(
                                padding: const EdgeInsets.all(spacer2),
                                child: Text(
                                  localizations.translate(
                                    i18.householdDetails.houseDetailsLabel,
                                  ),
                                  style: textTheme.headingXl,
                                ),
                              ),
                              houseShowcaseData.typeOfStructure.buildWith(
                                child: SelectionCard<String>(
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
                                    label: localizations.translate(
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
      },
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
