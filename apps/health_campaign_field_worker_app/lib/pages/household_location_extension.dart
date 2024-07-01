// Importing necessary libraries and packages
import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/address_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/widgets/showcase/config/showcase_constants.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../utils/extensions/extensions.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/showcase/showcase_button.dart';

// A custom page that extends the HouseholdLocationPage
// This page is used to display a custom location for a household
@RoutePage()
class CustomHouseHoldLocationPage extends HouseholdLocationPage {
  // Constructor for the CustomHouseHoldLocationPage class
  // It takes a key and a customExtensionWidgetPage as parameters
  // The customExtensionWidgetPage is set to a default value of CustomExtensionWidgetPage
  const CustomHouseHoldLocationPage({
    super.key,
  });

  // Overriding the createState method to return a new instance of CustomHouseHoldLocationState
  @override
  CustomHouseHoldLocationState createState() => CustomHouseHoldLocationState();
}

// A custom state class that extends the HouseholdLocationPageState
class CustomHouseHoldLocationState extends HouseholdLocationPageState {
  static const _buildingName = 'buildingName';
  static const _administrationAreaKey = 'administrationArea';
  static const _addressLine1Key = 'addressLine1';
  static const _addressLine2Key = 'addressLine2';
  static const _landmarkKey = 'landmark';
  static const _postalCodeKey = 'postalCode';
  static const _latKey = 'lat';
  static const _lngKey = 'lng';
  static const _accuracyKey = 'accuracy';
  static const maxLength = 64;

  // Overriding the build method to return a widget that fits the entire screen
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
                        onPressed: () => proceedToNextPage(
                          context,
                          form,
                          registrationState,
                          router,
                          locationState,
                          bloc,
                        ),
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
                            DigitTextFormField(
                              keyboardType: TextInputType.text,
                              formControlName: _buildingName,
                              label: localizations.translate(
                                'Building Name',
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

  @override
  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final addressModel = state.mapOrNull(
      editHousehold: (value) => value.addressModel,
    );

    return fb.group(<String, Object>{
      _administrationAreaKey: FormControl<String>(
        value: RegistrationDeliverySingleton().boundary!.name,
        validators: [Validators.required],
      ),
      _addressLine1Key:
          FormControl<String>(value: addressModel?.addressLine1, validators: [
        Validators.minLength(2),
        Validators.maxLength(64),
      ]),
      _addressLine2Key: FormControl<String>(
        value: addressModel?.addressLine2,
        validators: [
          Validators.minLength(2),
          Validators.maxLength(64),
        ],
      ),
      _landmarkKey:
          FormControl<String>(value: addressModel?.landmark, validators: [
        Validators.minLength(2),
        Validators.maxLength(64),
      ]),
      _buildingName: FormControl<String>(),
      _postalCodeKey:
          FormControl<String>(value: addressModel?.pincode, validators: [
        Validators.minLength(2),
        Validators.maxLength(6),
      ]),
      _latKey: FormControl<double>(value: addressModel?.latitude),
      _lngKey: FormControl<double>(
        value: addressModel?.longitude,
      ),
      _accuracyKey: FormControl<double>(
        value: addressModel?.locationAccuracy,
      ),
    });
  }

  @override
  proceedToNextPage(
      BuildContext context,
      FormGroup form,
      BeneficiaryRegistrationState registrationState,
      StackRouter router,
      LocationState locationState,
      BeneficiaryRegistrationBloc bloc) {
    form.markAllAsTouched();

    final addressLine1 = form.control(_addressLine1Key).value as String?;
    final addressLine2 = form.control(_addressLine2Key).value as String?;
    final landmark = form.control(_landmarkKey).value as String?;
    final postalCode = form.control(_postalCodeKey).value as String?;

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
          addressLine1: addressLine1 != null && addressLine1.trim().isNotEmpty
              ? addressLine1
              : null,
          addressLine2: addressLine2 != null && addressLine2.trim().isNotEmpty
              ? addressLine2
              : null,
          landmark:
              landmark != null && landmark.trim().isNotEmpty ? landmark : null,
          pincode: postalCode != null && postalCode.trim().isNotEmpty
              ? postalCode
              : null,
          buildingName: form.control(_buildingName).value,
          type: AddressType.correspondence,
          latitude: form.control(_latKey).value ?? locationState.latitude,
          longitude: form.control(_lngKey).value ?? locationState.longitude,
          additionalFields: AddressAdditionalFields(
            version: 1,
            fields: [
              AdditionalField('building_name', form.control(_buildingName).value),
            ]
          ),
          locationAccuracy:
              form.control(_accuracyKey).value ?? locationState.accuracy,
          locality: LocalityModel(
            code: RegistrationDeliverySingleton().boundary!.code!,
            name: RegistrationDeliverySingleton().boundary!.name,
          ),
          tenantId: RegistrationDeliverySingleton().tenantId,
          rowVersion: 1,
          auditDetails: AuditDetails(
            createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
            createdTime: context.millisecondsSinceEpoch(),
          ),
          clientAuditDetails: ClientAuditDetails(
            createdBy: RegistrationDeliverySingleton().loggedInUserUuid!,
            createdTime: context.millisecondsSinceEpoch(),
            lastModifiedBy: RegistrationDeliverySingleton().loggedInUserUuid,
            lastModifiedTime: context.millisecondsSinceEpoch(),
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
          addressLine1: addressLine1 != null && addressLine1.trim().isNotEmpty
              ? addressLine1
              : null,
          addressLine2: addressLine2 != null && addressLine2.trim().isNotEmpty
              ? addressLine2
              : null,
          landmark:
              landmark != null && landmark.trim().isNotEmpty ? landmark : null,
          locality: address.locality,
          pincode: postalCode != null && postalCode.trim().isNotEmpty
              ? postalCode
              : null,
          type: AddressType.correspondence,
          latitude: form.control(_latKey).value,
          longitude: form.control(_lngKey).value,
          locationAccuracy: form.control(_accuracyKey).value,
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
  }

  // A custom method that prints a message to the console when the app is in debug mode
  static void customMethod1(BuildContext context) {
    if (kDebugMode) {
      print(
          'Custom1 method called ${context.read<BeneficiaryRegistrationBloc>().state}');
    }
  }
}
