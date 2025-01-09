import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_components/widgets/digit_dob_picker.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/utils/constants.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/component_mapper/individual_details_component_mapper.dart';
import '../../utils/convert_to_map.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/models/widget_config_model.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class IndividualDetailsPage extends LocalizedStatefulWidget {
  final List<RegistrationDeliveryFormConfig>? widgetConfig;
  final bool isHeadOfHousehold;

  const IndividualDetailsPage({
    this.widgetConfig,
    super.key,
    super.appLocalizations,
    this.isHeadOfHousehold = false,
  });

  @override
  State<IndividualDetailsPage> createState() => IndividualDetailsPageState();
}

class IndividualDetailsPageState extends LocalizedState<IndividualDetailsPage> {
  static const individualNameKey = 'individualName';
  static const idTypeKey = 'idType';
  static const idNumberKey = 'idNumber';
  static const dobKey = 'dob';
  static const genderKey = 'gender';
  static const mobileNumberKey = 'mobileNumber';
  bool isDuplicateTag = false;
  final clickedStatus = ValueNotifier<bool>(false);
  DateTime now = DateTime.now();
  late IndividualsDatailsComponentMapper mapper;

  @override
  void initState() {
    mapper = IndividualsDatailsComponentMapper(
        isHeadOfHousehold: widget.isHeadOfHousehold);
    if (widget.widgetConfig != null) {
      final converter = FieldConverter(widget.widgetConfig);
      mapper.configs = converter.convertWidgetConfigToJsonByName(IndividualDetailsRoute.name)!;
    }
    super.initState();
  }

  void updateState(dynamic form, bool flag, var value) {
    if (flag) {
      setState(() {
        if (value == 'DEFAULT') {
          form.control(idNumberKey).setValidators([
            (control) => null, // No validation
          ]);
          form.control(idNumberKey).value = IdGen.i.identifier.toString();
        } else {
          var config = {};
          bool fg = false;
          for (var component in mapper.configs["components"]) {
            for (var fieldConfig in component["attributes"]) {
              final key = fieldConfig["name"];
              if (key == idNumberKey) {
                config = fieldConfig;
                fg = true;
                break;
              }
            }
            if (fg) {
              break;
            }
          }
          form.control(idNumberKey).setValidators([
            (control) => null, // No validation
          ]);

          // Retrieve current validators
          final currentValidators = form.control(idNumberKey).validators ?? [];

// Create a new list of validators
          List<Map<String, dynamic>? Function(AbstractControl<dynamic>)>
              updatedValidators = List.from(currentValidators);
          if (config['isRequired'] == true && config['isEnabled'] == true) {
            // Add the new validator to the list
            updatedValidators = [
              ...updatedValidators,
              Validators.required // Example new validator
            ];
          }

          // If JSON config has regex, add it as a validator
          if (config['isEnabled'] == true &&
              config.containsKey('validation') &&
              config['validation'] is List) {
            List<dynamic> validationList = config['validation'];

            validationList.asMap().forEach((index, regex) {
              updatedValidators.add((control) {
                final value = control.value?.toString() ??
                    ''; // Convert to string or default to empty
                if (value.isNotEmpty &&
                    !RegExp(regex['pattern']).hasMatch(value)) {
                  // Ensure there's a matching error message for this index
                  return {
                    '${regex['key']}': regex['errorMessage']
                  }; // Use the correct error message for the index
                }
                return null;
              });
            });
          }
          form.control(idNumberKey).setValidators(updatedValidators);
          form.control(idNumberKey).value = null;
        }

        // Ensure that changes to validators are applied
        form.control(idNumberKey).updateValueAndValidity();
      });
    } else {
      setState(() {
        if (value.isNotEmpty) {
          form.control(genderKey).value = value.first;
        } else {
          form.control(genderKey).value = null;
          setState(() {
            form.control(genderKey).setErrors({'': true});
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;
    final theme = Theme.of(context);
    DateTime before150Years = DateTime(now.year - 150, now.month, now.day);

    void validate(final form, final key, final fieldConfig) {
      if (fieldConfig?['attribute'] != 'textField' &&
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
        form: () => mapper.buildForm(
            bloc.state, context, getGenderOptions, localizations),
        builder: (context, form, child) => BlocConsumer<
            BeneficiaryRegistrationBloc, BeneficiaryRegistrationState>(
          listener: (context, state) {
            state.mapOrNull(
              persisted: (value) async {
                if (value.navigateToRoot) {
                  final overviewBloc = context.read<HouseholdOverviewBloc>();

                  overviewBloc.add(
                    HouseholdOverviewReloadEvent(
                      projectId:
                          RegistrationDeliverySingleton().projectId.toString(),
                      projectBeneficiaryType:
                          RegistrationDeliverySingleton().beneficiaryType ??
                              BeneficiaryType.household,
                    ),
                  );

                  await overviewBloc.stream.firstWhere((element) =>
                      element.loading == false &&
                      element.householdMemberWrapper.household != null);
                  HouseholdMemberWrapper memberWrapper =
                      overviewBloc.state.householdMemberWrapper;
                  final route = router.parent() as StackRouter;
                  route.popUntilRouteWithName(SearchBeneficiaryRoute.name);
                  route.push(BeneficiaryWrapperRoute(wrapper: memberWrapper));
                }
              },
            );
          },
          builder: (context, state) {
            // context.
            return ScrollableContent(
              enableFixedButton: true,
              header: const Column(children: [
                BackNavigationHelpHeaderWidget(
                  showHelp: false,
                  showcaseButton: ShowcaseButton(),
                ),
              ]),
              footer: DigitCard(
                margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                child: ValueListenableBuilder(
                  valueListenable: clickedStatus,
                  builder: (context, bool isClicked, _) {
                    return DigitElevatedButton(
                      onPressed: () async {
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
                                val is List ? val.join("|")
                                    .toString() : val.toString(),
                              ));
                            }
                          }
                        }
                        final userId =
                            RegistrationDeliverySingleton().loggedInUserUuid;
                        final projectId =
                            RegistrationDeliverySingleton().projectId;
                        form.markAllAsTouched();
                        if (!form.valid) return;
                        FocusManager.instance.primaryFocus?.unfocus();

                        state.maybeWhen(
                          orElse: () {
                            return;
                          },
                          create: (
                            addressModel,
                            householdModel,
                            individualModel,
                            projectBeneficiaryModel,
                            registrationDate,
                            searchQuery,
                            loading,
                            isHeadOfHousehold,
                          ) async {
                            final individual = _getIndividualModel(
                              context,
                              fields,
                              form: form,
                              oldIndividual: null,
                            );

                            final boundary =
                                RegistrationDeliverySingleton().boundary;

                            bloc.add(
                              BeneficiaryRegistrationSaveIndividualDetailsEvent(
                                model: individual,
                                isHeadOfHousehold: widget.isHeadOfHousehold,
                              ),
                            );
                            final scannerBloc =
                                context.read<DigitScannerBloc>();

                            if (scannerBloc.state.duplicate) {
                              DigitToast.show(
                                context,
                                options: DigitToastOptions(
                                  localizations.translate(
                                    i18.deliverIntervention
                                        .resourceAlreadyScanned,
                                  ),
                                  true,
                                  theme,
                                ),
                              );
                            } else {
                              clickedStatus.value = true;
                              final scannerBloc =
                                  context.read<DigitScannerBloc>();
                              bloc.add(
                                BeneficiaryRegistrationSummaryEvent(
                                  projectId: projectId!,
                                  userUuid: userId!,
                                  boundary: boundary!,
                                  tag: scannerBloc.state.qrCodes.isNotEmpty
                                      ? scannerBloc.state.qrCodes.first
                                      : null,
                                ),
                              );
                              router.push(SummaryRoute());
                            }
                          },
                          editIndividual: (
                            householdModel,
                            individualModel,
                            addressModel,
                            projectBeneficiaryModel,
                            loading,
                          ) {
                            final scannerBloc =
                                context.read<DigitScannerBloc>();
                            final individual = _getIndividualModel(
                              context,
                              fields,
                              form: form,
                              oldIndividual: individualModel,
                            );
                            final tag = scannerBloc.state.qrCodes.isNotEmpty
                                ? scannerBloc.state.qrCodes.first
                                : null;

                            if (tag != null &&
                                tag != projectBeneficiaryModel?.tag &&
                                scannerBloc.state.duplicate) {
                              DigitToast.show(
                                context,
                                options: DigitToastOptions(
                                  localizations.translate(
                                    i18.deliverIntervention
                                        .resourceAlreadyScanned,
                                  ),
                                  true,
                                  theme,
                                ),
                              );
                            } else {
                              bloc.add(
                                BeneficiaryRegistrationUpdateIndividualDetailsEvent(
                                  addressModel: addressModel,
                                  householdModel: householdModel,
                                  model: individual.copyWith(
                                    clientAuditDetails: (individual
                                                    .clientAuditDetails
                                                    ?.createdBy !=
                                                null &&
                                            individual.clientAuditDetails
                                                    ?.createdTime !=
                                                null)
                                        ? ClientAuditDetails(
                                            createdBy: individual
                                                .clientAuditDetails!.createdBy,
                                            createdTime: individual
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
                                  tag: scannerBloc.state.qrCodes.isNotEmpty
                                      ? scannerBloc.state.qrCodes.first
                                      : null,
                                ),
                              );
                            }
                          },
                          addMember: (
                            addressModel,
                            householdModel,
                            loading,
                          ) {
                            final individual = _getIndividualModel(
                              context,
                              fields,
                              form: form,
                            );

                            if (context.mounted) {
                              final scannerBloc =
                                  context.read<DigitScannerBloc>();

                              if (scannerBloc.state.duplicate) {
                                DigitToast.show(
                                  context,
                                  options: DigitToastOptions(
                                    localizations.translate(
                                      i18.deliverIntervention
                                          .resourceAlreadyScanned,
                                    ),
                                    true,
                                    theme,
                                  ),
                                );
                              } else {
                                bloc.add(
                                  BeneficiaryRegistrationAddMemberEvent(
                                    beneficiaryType:
                                        RegistrationDeliverySingleton()
                                            .beneficiaryType!,
                                    householdModel: householdModel,
                                    individualModel: individual,
                                    addressModel: addressModel,
                                    userUuid: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    projectId: RegistrationDeliverySingleton()
                                        .projectId!,
                                    tag: scannerBloc.state.qrCodes.isNotEmpty
                                        ? scannerBloc.state.qrCodes.first
                                        : null,
                                  ),
                                );
                              }
                            }
                          },
                        );
                      },
                      child: Center(
                        child: Text(
                          state.mapOrNull(
                                editIndividual: (value) => localizations
                                    .translate(i18.common.coreCommonSave),
                              ) ??
                              localizations
                                  .translate(i18.common.coreCommonSubmit),
                        ),
                      ),
                    );
                  },
                ),
              ),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      ...mapper.buildWidgetsFromConfig(
                          WidgetConfigModel(
                              config: mapper.configs,
                              form: form,
                              localizations: localizations,
                              func: updateState),
                          context),
                      if ((RegistrationDeliverySingleton().beneficiaryType ==
                                  BeneficiaryType.household &&
                              widget.isHeadOfHousehold) ||
                          (RegistrationDeliverySingleton().beneficiaryType ==
                              BeneficiaryType.individual))
                        BlocBuilder<DigitScannerBloc, DigitScannerState>(
                          buildWhen: (p, c) {
                            return true;
                          },
                          builder: (context, state) => state.qrCodes.isNotEmpty
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Text(
                                        localizations.translate(
                                          i18.deliverIntervention.voucherCode,
                                        ),
                                        style: theme.textTheme.headlineSmall,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        localizations
                                            .translate(state.qrCodes.last),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: kPadding * 2,
                                      ),
                                      child: IconButton(
                                        color: theme.colorScheme.secondary,
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            //[TODO: Add the route to auto_route]
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const DigitScannerPage(
                                                quantity: 1,
                                                isGS1code: false,
                                                singleValue: true,
                                                isEditEnabled: true,
                                              ),
                                              settings: const RouteSettings(
                                                  name: '/qr-scanner'),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],

                                  // ignore: no-empty-block
                                )
                              : DigitOutlineIconButton(
                                  buttonStyle: OutlinedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      // [TODO: Add the route to auto_route]
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DigitScannerPage(
                                          quantity: 1,
                                          isGS1code: false,
                                          singleValue: true,
                                        ),
                                        settings: const RouteSettings(
                                            name: '/qr-scanner'),
                                      ),
                                    );
                                  },
                                  icon: Icons.qr_code,
                                  label: localizations.translate(
                                    i18.individualDetails
                                        .linkVoucherToIndividual,
                                  ),
                                ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  IndividualModel _getIndividualModel(
    BuildContext context,
    List<AdditionalField> fields, {
    required FormGroup form,
    IndividualModel? oldIndividual,
  }) {
    final dob = form.control(dobKey).value as DateTime?;
    String? dobString;
    if (dob != null) {
      dobString = DateFormat(Constants().dateFormat).format(dob);
    }

    var individual = oldIndividual;
    individual ??= IndividualModel(
      clientReferenceId: IdGen.i.identifier,
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      additionalFields: IndividualAdditionalFields(version: 1, fields: fields),
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    var name = individual.name;
    name ??= NameModel(
      individualClientReferenceId: individual.clientReferenceId,
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      additionalFields: NameAdditionalFields(version: 1, fields: fields),
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    var identifier = (individual.identifiers?.isNotEmpty ?? false)
        ? individual.identifiers!.first
        : null;

    identifier ??= IdentifierModel(
      clientReferenceId: individual.clientReferenceId,
      tenantId: RegistrationDeliverySingleton().tenantId,
      rowVersion: 1,
      additionalFields: IdentifierAdditionalFields(version: 1, fields: fields),
      auditDetails: AuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );

    String? individualName = form.control(individualNameKey).value as String?;
    individual = individual.copyWith(
      name: name.copyWith(
        givenName: individualName?.trim(),
      ),
      gender: form.control(genderKey).value == null
          ? null
          : Gender.values
              .byName(form.control(genderKey).value.toString().toLowerCase()),
      mobileNumber: form.control(mobileNumberKey).value,
      dateOfBirth: dobString,
      identifiers: [
        identifier.copyWith(
          identifierId: form.control(idNumberKey).value,
          identifierType: form.control(idTypeKey).value,
        ),
      ],
    );

    return individual;
  }

  getGenderOptions(IndividualModel? individual) {
    final options = RegistrationDeliverySingleton().genderOptions;

    return options?.map((e) => e).firstWhereOrNull(
          (element) => element.toLowerCase() == individual?.gender?.name,
        );
  }
}
