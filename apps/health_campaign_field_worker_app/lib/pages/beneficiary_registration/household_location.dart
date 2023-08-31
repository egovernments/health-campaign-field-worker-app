import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
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
                header: const Column(
                  children: [
                    BackNavigationHelpHeaderWidget(),
                  ],
                ),
                footer: SizedBox(
                  height: 85,
                  child: DigitCard(
                    margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
                    child: DigitElevatedButton(
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
                              addressLine1: addressLine1,
                              addressLine2: addressLine2,
                              landmark: landmark,
                              pincode: postalCode,
                              type: AddressType.correspondence,
                              latitude: form.control(_latKey).value,
                              longitude: form.control(_lngKey).value,
                              locationAccuracy:
                                  form.control(_accuracyKey).value,
                              locality: LocalityModel(
                                code: context.boundary.code!,
                                name: context.boundary.name,
                              ),
                              tenantId: envConfig.variables.tenantId,
                              rowVersion: 1,
                              clientAuditDetails: ClientAuditDetails(
                                createdBy: context.loggedInUserUuid,
                                createdTime: context.millisecondsSinceEpoch(),
                              ),
                              auditDetails: AuditDetails(
                                createdBy: context.loggedInUserUuid,
                                createdTime: context.millisecondsSinceEpoch(),
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
                            loading,
                          ) {
                            var addressModel = address.copyWith(
                              addressLine1: addressLine1,
                              addressLine2: addressLine2,
                              landmark: landmark,
                              locality: address.locality,
                              pincode: postalCode,
                              type: AddressType.correspondence,
                              latitude: form.control(_latKey).value,
                              longitude: form.control(_lngKey).value,
                              locationAccuracy:
                                  form.control(_accuracyKey).value,
                            );

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
                          localizations
                              .translate(i18.householdLocation.actionLabel),
                        ),
                      ),
                    ),
                  ),
                ),
                children: [
                  DigitCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          localizations.translate(
                            i18.householdLocation.householdLocationLabelText,
                          ),
                          style: theme.textTheme.displayMedium,
                        ),
                        Column(children: [
                          DigitTextFormField(
                            formControlName: _administrationAreaKey,
                            label: localizations.translate(
                              i18.householdLocation.administrationAreaFormLabel,
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
                          DigitTextFormField(
                            formControlName: _addressLine1Key,
                            label: localizations.translate(
                              i18.householdLocation
                                  .householdAddressLine1LabelText,
                            ),
                            maxLength: 64,
                          ),
                          DigitTextFormField(
                            formControlName: _addressLine2Key,
                            label: localizations.translate(
                              i18.householdLocation
                                  .householdAddressLine2LabelText,
                            ),
                            maxLength: 64,
                          ),
                          DigitTextFormField(
                            formControlName: _landmarkKey,
                            label: localizations.translate(
                              i18.householdLocation.landmarkFormLabel,
                            ),
                            maxLength: 64,
                          ),
                          DigitTextFormField(
                            keyboardType: TextInputType.text,
                            formControlName: _postalCodeKey,
                            label: localizations.translate(
                              i18.householdLocation.postalCodeFormLabel,
                            ),
                            maxLength: 64,
                          ),
                        ]),
                        const SizedBox(height: 16),
                      ],
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
      ]),
      _addressLine2Key: FormControl<String>(
        value: addressModel?.addressLine2,
        validators: [CustomValidator.requiredMin],
      ),
      _landmarkKey:
          FormControl<String>(value: addressModel?.landmark, validators: [
        CustomValidator.requiredMin,
      ]),
      _postalCodeKey:
          FormControl<String>(value: addressModel?.pincode, validators: [
        CustomValidator.requiredMin,
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
