import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/text_block.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/address_type.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_text_form_input.dart';
import 'package:digit_ui_components/widgets/atoms/reactive_fields.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import 'package:registration_delivery/blocs/beneficiary_registration/beneficiary_registration.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/back_navigation_help_header.dart';
import 'package:registration_delivery/widgets/localized.dart';
import 'package:registration_delivery/widgets/showcase/config/showcase_constants.dart';
import 'package:registration_delivery/widgets/showcase/showcase_button.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_radio_list.dart';
import 'package:digit_ui_components/widgets/atoms/digit_text_form_input.dart';

import '../../router/app_router.dart';

@RoutePage()
class CustomHouseholdLocationPage extends LocalizedStatefulWidget {
  const CustomHouseholdLocationPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomHouseholdLocationPage> createState() =>
      CustomHouseholdLocationPageState();
}

class CustomHouseholdLocationPageState
    extends LocalizedState<CustomHouseholdLocationPage> {
  static const _administrationAreaKey = 'administrationArea';
  static const _latKey = 'lat';
  static const _lngKey = 'lng';
  static const _accuracyKey = 'accuracy';
  static const maxLength = 64;
  static const _buildingNameKey = 'buildingName';
  static const _refugeeKey = 'refugee';
  static const __refugeeCampsTypeKey = 'refugeeCamps';
  List<String> refugeeCampsList = ["camp1", "camp2", "camp3"];
  String? selectedRefugeeCamp;
  List<String> radioOptions = ["Yes", "No"];
  bool ifRefugeeCamp = false;
  bool isCommunity = false;

  @override
  void initState() {
    final regState = context.read<BeneficiaryRegistrationBloc>().state;
    context.read<LocationBloc>().add(const LoadLocationEvent());
    regState.maybeMap(
        orElse: () => false,
        editHousehold: (value) => false,
        create: (value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Show the dialog after the first frame is built
            DigitComponentsUtils().showLocationCapturingDialog(
              context,
              localizations.translate(i18.common.locationCapturing),
              DigitSyncDialogType.inProgress,
            );
          });
          return true;
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;

    return Scaffold(
      body: BlocBuilder<BeneficiaryRegistrationBloc,
          BeneficiaryRegistrationState>(builder: (context, registrationState) {
        return ReactiveFormBuilder(
          form: () => buildForm(bloc.state),
          builder: (_, form, __) => BlocListener<LocationBloc, LocationState>(
            listener: (context, locationState) {
              registrationState.maybeMap(
                  orElse: () => false,
                  create: (value) {
                    if (locationState.accuracy != null) {
                      //Hide the dialog after 1 seconds
                      Future.delayed(const Duration(seconds: 1), () {
                        DigitComponentsUtils().hideDialog(context);
                      });
                    }
                  });
              if (locationState.accuracy != null) {
                final lat = locationState.latitude;
                final lng = locationState.longitude;
                final accuracy = locationState.accuracy;

                form.control(_latKey).value ??= lat;
                form.control(_lngKey).value ??= lng;
                form.control(_accuracyKey).value ??= accuracy;
              }
            },
            listenWhen: (previous, current) {
              final lat = form.control(_latKey).value;
              final lng = form.control(_lngKey).value;
              final accuracy = form.control(_accuracyKey).value;

              return lat != null || lng != null || accuracy != null
                  ? false
                  : true;
            },
            child: ScrollableContent(
              enableFixedButton: true,
              header: const Column(
                children: [
                  BackNavigationHelpHeaderWidget(
                    showHelp: false,
                  ),
                ],
              ),
              footer: DigitCard(
                margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                child: BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, locationState) {
                    return DisableWidget(
                      isDisable: ifRefugeeCamp && (selectedRefugeeCamp == null),
                      child: DigitElevatedButton(
                        onPressed: () {
                          form.markAllAsTouched();
                          if (!form.valid) return;

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
                              var addressModel = AddressModel(
                                type: AddressType.correspondence,
                                latitude: form.control(_latKey).value ??
                                    locationState.latitude,
                                longitude: form.control(_lngKey).value ??
                                    locationState.longitude,
                                locationAccuracy:
                                    form.control(_accuracyKey).value ??
                                        locationState.accuracy,
                                locality: LocalityModel(
                                  code: RegistrationDeliverySingleton()
                                      .boundary!
                                      .code!,
                                  name: RegistrationDeliverySingleton()
                                      .boundary!
                                      .name,
                                ),
                                tenantId:
                                    RegistrationDeliverySingleton().tenantId,
                                buildingName: (RegistrationDeliverySingleton()
                                            .householdType ==
                                        HouseholdType.community)
                                    ? form.control(_buildingNameKey).value
                                    : null,
                                rowVersion: 1,
                                auditDetails: AuditDetails(
                                  createdBy: RegistrationDeliverySingleton()
                                      .loggedInUserUuid!,
                                  createdTime: context.millisecondsSinceEpoch(),
                                ),
                                clientAuditDetails: ClientAuditDetails(
                                  createdBy: RegistrationDeliverySingleton()
                                      .loggedInUserUuid!,
                                  createdTime: context.millisecondsSinceEpoch(),
                                  lastModifiedBy:
                                      RegistrationDeliverySingleton()
                                          .loggedInUserUuid,
                                  lastModifiedTime:
                                      context.millisecondsSinceEpoch(),
                                ),
                              );

                              bloc.add(
                                BeneficiaryRegistrationSaveAddressEvent(
                                  addressModel,
                                ),
                              );
                              router.push(CustomHouseHoldDetailsRoute(
                                refugeeCamp: selectedRefugeeCamp,
                              ));
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
                              var addressModel = address.copyWith(
                                type: AddressType.correspondence,
                                latitude: form.control(_latKey).value,
                                longitude: form.control(_lngKey).value,
                                locationAccuracy:
                                    form.control(_accuracyKey).value,
                                buildingName: (RegistrationDeliverySingleton()
                                            .householdType ==
                                        HouseholdType.community)
                                    ? form.control(_buildingNameKey).value
                                    : null,
                              );
                              // TODO [Linking of Voucher for Household based project  need to be handled]

                              bloc.add(
                                BeneficiaryRegistrationSaveAddressEvent(
                                  addressModel,
                                ),
                              );
                              router.push(CustomHouseHoldDetailsRoute(
                                refugeeCamp: selectedRefugeeCamp,
                              ));
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
                    );
                  },
                ),
              ),
              slivers: [
                SliverToBoxAdapter(
                  child: DigitCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DigitTextBlock(
                            padding: const EdgeInsets.only(top: spacer2),
                            heading: (RegistrationDeliverySingleton()
                                        .householdType ==
                                    HouseholdType.community)
                                ? localizations.translate(
                                    i18.householdLocation.clfLocationLabelText)
                                : localizations.translate(
                                    i18.householdLocation
                                        .householdLocationLabelText,
                                  ),
                            description: (RegistrationDeliverySingleton()
                                        .householdType ==
                                    HouseholdType.community)
                                ? null
                                : localizations.translate(
                                    i18.householdLocation
                                        .householdLocationDescriptionText,
                                  )),
                        Column(children: [
                          householdLocationShowcaseData.administrativeArea
                              .buildWith(
                            child: DigitTextFormField(
                              formControlName: _administrationAreaKey,
                              label: localizations.translate(
                                i18.householdLocation
                                    .administrationAreaFormLabel,
                              ),
                              readOnly: true,
                              validationMessages: {
                                'required': (_) => localizations.translate(
                                      i18.householdLocation
                                          .administrationAreaRequiredValidation,
                                    ),
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                kPadding, kPadding, 0, kPadding),
                            child: LabeledField(
                              label: "Is it a Refugee Camp?",
                              isRequired: true,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(top: spacer1),
                                      child: RadioList(
                                        containerPadding:
                                            const EdgeInsets.fromLTRB(
                                                kPadding * 2,
                                                kPadding / 6,
                                                kPadding * 2,
                                                kPadding / 6),
                                        radioDigitButtons: radioOptions
                                            .map((item) => RadioButtonModel(
                                                  code: item,
                                                  name: localizations
                                                      .translate(item.trim()),
                                                ))
                                            .toList(),
                                        groupValue:
                                            form.control(_refugeeKey).value ??
                                                "",
                                        onChanged: (changedValue) {
                                          setState(() {
                                            form.control(_refugeeKey).value =
                                                changedValue.code;
                                            if (changedValue.code == "Yes") {
                                              setState(() {
                                                ifRefugeeCamp = true;
                                              });
                                            } else {
                                              setState(() {
                                                ifRefugeeCamp = false;
                                                form
                                                    .control(
                                                        __refugeeCampsTypeKey)
                                                    .value = null;
                                                selectedRefugeeCamp = null;
                                              });
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Offstage(
                            offstage: !ifRefugeeCamp,
                            child: DigitReactiveDropdown<String>(
                              key: const Key(__refugeeCampsTypeKey),
                              label: localizations.translate(
                                'Refugee Camps List',
                              ),
                              menuItems: refugeeCampsList ?? [],
                              formControlName: __refugeeCampsTypeKey,
                              onChanged: (value) {
                                setState(() {
                                  selectedRefugeeCamp = value;
                                });
                              },
                              valueMapper: (value) =>
                                  localizations.translate(value),
                              // isRequired: true,
                            ),
                          ),
                          if (RegistrationDeliverySingleton().householdType ==
                              HouseholdType.community)
                            householdLocationShowcaseData.buildingName
                                .buildWith(
                                    child: ReactiveWrapperField(
                                        formControlName: _buildingNameKey,
                                        validationMessages: {
                                          'required': (_) =>
                                              localizations.translate(
                                                i18.common.corecommonRequired,
                                              ),
                                          'sizeLessThan2': (_) =>
                                              localizations.translate(
                                                  i18.common.min3CharsRequired),
                                          'maxLength': (object) => localizations
                                              .translate(
                                                  i18.common.maxCharsRequired)
                                              .replaceAll(
                                                  '{}', maxLength.toString()),
                                        },
                                        builder: (field) => LabeledField(
                                            label: localizations.translate(i18
                                                .householdLocation
                                                .buildingNameLabel),
                                            isRequired: true,
                                            child: DigitTextFormInput(
                                              errorMessage: field.errorText,
                                              onChange: (value) {
                                                form
                                                    .control(_buildingNameKey)
                                                    .value = value;
                                              },
                                              initialValue: form
                                                  .control(_buildingNameKey)
                                                  .value,
                                            )))),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final addressModel = state.mapOrNull(
      create: (value) => value.addressModel,
      editHousehold: (value) => value.addressModel,
    );

    final searchQuery = state.mapOrNull<String>(
      create: (value) {
        return value.searchQuery;
      },
    );

    return fb.group(<String, Object>{
      _administrationAreaKey: FormControl<String>(
        value: localizations
            .translate(RegistrationDeliverySingleton().boundary!.code ?? ''),
        validators: [Validators.required],
      ),
      _latKey: FormControl<double>(value: addressModel?.latitude, validators: [
        Validators.delegate(
            (validator) => CustomValidator.requiredMin(validator))
      ]),
      _lngKey: FormControl<double>(
        value: addressModel?.longitude,
      ),
      _accuracyKey: FormControl<double>(
        value: addressModel?.locationAccuracy,
      ),
      _refugeeKey: FormControl<String>(),
      __refugeeCampsTypeKey: FormControl<String>(),
      if (RegistrationDeliverySingleton().householdType ==
          HouseholdType.community)
        _buildingNameKey: FormControl<String>(
          validators: [
            Validators.required,
            Validators.delegate(
                (validator) => CustomValidator.sizeLessThan2(validator)),
            Validators.maxLength(64),
          ],
          value: addressModel?.buildingName ?? searchQuery?.trim(),
        ),
    });
  }
}

class DisableWidget extends StatelessWidget {
  final bool isDisable;
  final Widget child;
  const DisableWidget({super.key, this.isDisable = false, required this.child});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isDisable,
      child: Opacity(
        opacity: isDisable ? 0.5 : 1,
        child: child,
      ),
    );
  }
}
