import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/environment_config.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

class HouseholdLocationPage extends LocalizedStatefulWidget {
  const HouseholdLocationPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HouseholdLocationPage> createState() => _HouseholdLocationPageState();
}

class _HouseholdLocationPageState
    extends LocalizedState<HouseholdLocationPage> {
  static const _administrationAreaKey = 'administrationArea';
  static const _addressLine1Key = 'addressLine1';
  static const _addressLine2Key = 'addressLine2';
  static const _landmarkKey = 'landmark';
  static const _postalCodeKey = 'postalCode';
  static const _latKey = 'lat';
  static const _lngKey = 'lng';
  static const _accuracyKey = 'accuracy';
  static const maxLength = 64;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (_, form, __) => BlocListener<LocationBloc, LocationState>(
          listener: (context, locationState) {
            final lat = locationState.latitude;
            final lng = locationState.longitude;
            final accuracy = locationState.accuracy;

            form.control(_latKey).value ??= lat;
            form.control(_lngKey).value ??= lng;
            form.control(_accuracyKey).value ??= accuracy;
          },
          listenWhen: (previous, current) {
            final lat = form.control(_latKey).value;
            final lng = form.control(_lngKey).value;
            final accuracy = form.control(_accuracyKey).value;

            return lat != null || lng != null || accuracy != null
                ? false
                : true;
          },
          child: BlocBuilder<BeneficiaryRegistrationBloc,
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
                  padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                  child: BlocBuilder<LocationBloc, LocationState>(
                    builder: (context, locationState) {
                      return DigitElevatedButton(
                        onPressed: () {
                          form.markAllAsTouched();
                          if (!form.valid) return;

                          final addressLine1 =
                              form.control(_addressLine1Key).value as String?;
                          final addressLine2 =
                              form.control(_addressLine2Key).value as String?;
                          final landmark =
                              form.control(_landmarkKey).value as String?;
                          final postalCode =
                              form.control(_postalCodeKey).value as String?;

                          registrationState.maybeWhen(
                            orElse: () {
                              return;
                            },
                            create: (
                              address,
                              householdModel,
                              individualModel,
                              registrationDate,
                              searchQuery,
                              loading,
                              isHeadOfHousehold,
                            ) {
                              var addressModel = AddressModel(
                                addressLine1: addressLine1 != null &&
                                        addressLine1.trim().isNotEmpty
                                    ? addressLine1
                                    : null,
                                addressLine2: addressLine2 != null &&
                                        addressLine2.trim().isNotEmpty
                                    ? addressLine2
                                    : null,
                                landmark: landmark != null &&
                                        landmark.trim().isNotEmpty
                                    ? landmark
                                    : null,
                                pincode: postalCode != null &&
                                        postalCode.trim().isNotEmpty
                                    ? postalCode
                                    : null,
                                type: AddressType.correspondence,
                                latitude: form.control(_latKey).value ??
                                    locationState.latitude,
                                longitude: form.control(_lngKey).value ??
                                    locationState.longitude,
                                locationAccuracy:
                                    form.control(_accuracyKey).value ??
                                        locationState.accuracy,
                                locality: LocalityModel(
                                  code: context.boundary.code!,
                                  name: context.boundary.name,
                                ),
                                tenantId: envConfig.variables.tenantId,
                                rowVersion: 1,
                                auditDetails: AuditDetails(
                                  createdBy: context.loggedInUserUuid,
                                  createdTime: context.millisecondsSinceEpoch(),
                                ),
                                clientAuditDetails: ClientAuditDetails(
                                  createdBy: context.loggedInUserUuid,
                                  createdTime: context.millisecondsSinceEpoch(),
                                  lastModifiedBy: context.loggedInUserUuid,
                                  lastModifiedTime:
                                      context.millisecondsSinceEpoch(),
                                ),
                              );

                              bloc.add(
                                BeneficiaryRegistrationSaveAddressEvent(
                                  addressModel,
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
                            ) {
                              var addressModel = address.copyWith(
                                addressLine1: addressLine1 != null &&
                                        addressLine1.trim().isNotEmpty
                                    ? addressLine1
                                    : null,
                                addressLine2: addressLine2 != null &&
                                        addressLine2.trim().isNotEmpty
                                    ? addressLine2
                                    : null,
                                landmark: landmark != null &&
                                        landmark.trim().isNotEmpty
                                    ? landmark
                                    : null,
                                locality: address.locality,
                                pincode: postalCode != null &&
                                        postalCode.trim().isNotEmpty
                                    ? postalCode
                                    : null,
                                type: AddressType.correspondence,
                                latitude: form.control(_latKey).value,
                                longitude: form.control(_lngKey).value,
                                locationAccuracy:
                                    form.control(_accuracyKey).value,
                              );
                              // TODO [Linking of Voucher for Household based project  need to be handled]

                              bloc.add(
                                BeneficiaryRegistrationSaveAddressEvent(
                                  addressModel,
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
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0, 0, 0, kPadding),
                            child: Text(
                              localizations.translate(
                                i18.householdLocation
                                    .householdLocationLabelText,
                              ),
                              style: theme.textTheme.displayMedium,
                            ),
                          ),
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
                                isRequired: true,
                                validationMessages: {
                                  'required': (_) => localizations.translate(
                                        i18.householdLocation
                                            .administrationAreaRequiredValidation,
                                      ),
                                },
                              ),
                            ),
                            householdLocationShowcaseData.addressLine1
                                .buildWith(
                              child: DigitTextFormField(
                                formControlName: _addressLine1Key,
                                label: localizations.translate(
                                  i18.householdLocation
                                      .householdAddressLine1LabelText,
                                ),
                                validationMessages: {
                                  'required': (_) => localizations.translate(
                                        i18.common.min2CharsRequired,
                                      ),
                                  'maxLength': (object) => localizations
                                      .translate(i18.common.maxCharsRequired)
                                      .replaceAll('{}', maxLength.toString()),
                                },
                              ),
                            ),
                            householdLocationShowcaseData.addressLine2
                                .buildWith(
                              child: DigitTextFormField(
                                formControlName: _addressLine2Key,
                                label: localizations.translate(
                                  i18.householdLocation
                                      .householdAddressLine2LabelText,
                                ),
                                validationMessages: {
                                  'required': (_) => localizations.translate(
                                        i18.common.min2CharsRequired,
                                      ),
                                  'maxLength': (object) => localizations
                                      .translate(i18.common.maxCharsRequired)
                                      .replaceAll('{}', maxLength.toString()),
                                },
                              ),
                            ),
                            householdLocationShowcaseData.landmark.buildWith(
                              child: DigitTextFormField(
                                formControlName: _landmarkKey,
                                label: localizations.translate(
                                  i18.householdLocation.landmarkFormLabel,
                                ),
                                validationMessages: {
                                  'required': (_) => localizations.translate(
                                        i18.common.min2CharsRequired,
                                      ),
                                  'maxLength': (object) => localizations
                                      .translate(i18.common.maxCharsRequired)
                                      .replaceAll('{}', maxLength.toString()),
                                },
                              ),
                            ),
                            householdLocationShowcaseData.postalCode.buildWith(
                              child: DigitTextFormField(
                                keyboardType: TextInputType.text,
                                formControlName: _postalCodeKey,
                                label: localizations.translate(
                                  i18.householdLocation.postalCodeFormLabel,
                                ),
                                validationMessages: {
                                  'required': (_) => localizations.translate(
                                        i18.common.min2CharsRequired,
                                      ),
                                  'maxLength': (object) => localizations
                                      .translate(i18.common.maxCharsRequired)
                                      .replaceAll('{}', '6'),
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final addressModel = state.mapOrNull(
      editHousehold: (value) => value.addressModel,
    );

    return fb.group(<String, Object>{
      _administrationAreaKey: FormControl<String>(
        value: context.boundary.name,
        validators: [Validators.required],
      ),
      _addressLine1Key:
          FormControl<String>(value: addressModel?.addressLine1, validators: [
        CustomValidator.requiredMin,
        Validators.maxLength(64),
      ]),
      _addressLine2Key: FormControl<String>(
        value: addressModel?.addressLine2,
        validators: [
          CustomValidator.requiredMin,
          Validators.maxLength(64),
        ],
      ),
      _landmarkKey:
          FormControl<String>(value: addressModel?.landmark, validators: [
        CustomValidator.requiredMin,
        Validators.maxLength(64),
      ]),
      _postalCodeKey:
          FormControl<String>(value: addressModel?.pincode, validators: [
        CustomValidator.requiredMin,
        Validators.maxLength(6),
      ]),
      _latKey: FormControl<double>(value: addressModel?.latitude, validators: [
        CustomValidator.requiredMin,
      ]),
      _lngKey: FormControl<double>(
        value: addressModel?.longitude,
      ),
      _accuracyKey: FormControl<double>(
        value: addressModel?.locationAccuracy,
      ),
    });
  }
}
