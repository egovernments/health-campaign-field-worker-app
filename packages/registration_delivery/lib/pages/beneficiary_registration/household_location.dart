import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/address_type.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class HouseholdLocationPage extends LocalizedStatefulWidget {
  const HouseholdLocationPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HouseholdLocationPage> createState() => HouseholdLocationPageState();
}

class HouseholdLocationPageState extends LocalizedState<HouseholdLocationPage> {
  static const _administrationAreaKey = 'administrationArea';
  static const _addressLine1Key = 'addressLine1';
  static const _addressLine2Key = 'addressLine2';
  static const _landmarkKey = 'landmark';
  static const _postalCodeKey = 'postalCode';
  static const _latKey = 'lat';
  static const _lngKey = 'lng';
  static const _accuracyKey = 'accuracy';
  static const maxLength = 64;
  static const _buildingNameKey = 'buildingName';

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
            DigitComponentsUtils.showDialog(
              context,
              localizations.translate(i18.common.locationCapturing),
              DialogType.inProgress,
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
                        DigitComponentsUtils.hideDialog(context);
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
                    BlocBuilder<LocationBloc, LocationState>(
                      builder: (context, locationState) {
                        return DigitButton(
                          label: localizations.translate(
                            i18.householdLocation.actionLabel,
                          ),
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
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
                                projectBeneficiaryModel,
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
                                    code: RegistrationDeliverySingleton()
                                        .boundary!
                                        .code!,
                                    name: RegistrationDeliverySingleton()
                                        .boundary!
                                        .name,
                                  ),
                                  tenantId:
                                      RegistrationDeliverySingleton().tenantId,
                                  rowVersion: 1,
                                  buildingName: (RegistrationDeliverySingleton()
                                              .householdType ==
                                          HouseholdType.community)
                                      ? form.control(_buildingNameKey).value
                                      : null,
                                  auditDetails: AuditDetails(
                                    createdBy: RegistrationDeliverySingleton()
                                        .loggedInUserUuid!,
                                    createdTime:
                                        context.millisecondsSinceEpoch(),
                                  ),
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
                                );

                                bloc.add(
                                  BeneficiaryRegistrationSaveAddressEvent(
                                    addressModel,
                                  ),
                                );
                                router.push(HouseDetailsRoute());
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
                                  buildingName: (RegistrationDeliverySingleton()
                                              .householdType ==
                                          HouseholdType.community)
                                      ? form.control(_buildingNameKey).value
                                      : null,
                                  locationAccuracy:
                                      form.control(_accuracyKey).value,
                                );
                                // TODO [Linking of Voucher for Household based project  need to be handled]

                                bloc.add(
                                  BeneficiaryRegistrationSaveAddressEvent(
                                    addressModel,
                                  ),
                                );
                                router.push(HouseDetailsRoute());
                              },
                            );
                          },
                        );
                      },
                    ),
                  ]),
              slivers: [
                SliverToBoxAdapter(
                  child: DigitCard(
                      margin: const EdgeInsets.all(spacer2),
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
                        householdLocationShowcaseData.administrativeArea
                            .buildWith(
                          child: ReactiveWrapperField(
                            formControlName: _administrationAreaKey,
                            validationMessages: {
                              'required': (_) => localizations.translate(
                                    i18.householdLocation
                                        .administrationAreaRequiredValidation,
                                  ),
                            },
                            builder: (field) => LabeledField(
                              label: localizations.translate(
                                i18.householdLocation
                                    .administrationAreaFormLabel,
                              ),
                              child: DigitTextFormInput(
                                readOnly: true,
                                errorMessage: field.errorText,
                                initialValue:
                                    form.control(_administrationAreaKey).value,
                                onChange: (value) {
                                  form.control(_administrationAreaKey).value =
                                      value;
                                },
                              ),
                            ),
                          ),
                        ),
                        householdLocationShowcaseData.gpsAccuracy.buildWith(
                          child: ReactiveWrapperField(
                            formControlName: _accuracyKey,
                            validationMessages: {
                              'required': (_) => localizations.translate(
                                    i18.common.corecommonRequired,
                                  ),
                            },
                            builder: (field) => LabeledField(
                              label: localizations.translate(
                                i18.householdLocation.gpsAccuracyLabel,
                              ),
                              child: DigitTextFormInput(
                                readOnly: true,
                                errorMessage: field.errorText,
                                initialValue:
                                    form.control(_accuracyKey).value.toString(),
                              ),
                            ),
                          ),
                        ),
                        if (RegistrationDeliverySingleton().householdType ==
                            HouseholdType.community)
                          householdLocationShowcaseData.buildingName.buildWith(
                              child: ReactiveWrapperField(
                                  formControlName: _buildingNameKey,
                                  validationMessages: {
                                    'required': (_) => localizations.translate(
                                          i18.common.corecommonRequired,
                                        ),
                                    'sizeLessThan2': (_) =>
                                        localizations.translate(
                                            i18.common.min3CharsRequired),
                                    'maxLength': (object) => localizations
                                        .translate(i18.common.maxCharsRequired)
                                        .replaceAll('{}', maxLength.toString()),
                                  },
                                  builder: (field) => LabeledField(
                                      label: localizations.translate(i18
                                          .householdLocation.buildingNameLabel),
                                      isRequired: true,
                                      child: DigitTextFormInput(
                                        errorMessage: field.errorText,
                                        onChange: (value) {
                                          form.control(_buildingNameKey).value =
                                              value;
                                        },
                                        initialValue: form
                                            .control(_buildingNameKey)
                                            .value,
                                      )))),
                        householdLocationShowcaseData.addressLine1.buildWith(
                          child: ReactiveWrapperField(
                            formControlName: _addressLine1Key,
                            validationMessages: {
                              'required': (_) => localizations.translate(
                                    i18.common.min2CharsRequired,
                                  ),
                              'maxLength': (object) => localizations
                                  .translate(i18.common.maxCharsRequired)
                                  .replaceAll('{}', maxLength.toString()),
                            },
                            builder: (field) => LabeledField(
                              label: localizations.translate(
                                i18.householdLocation
                                    .householdAddressLine1LabelText,
                              ),
                              child: DigitTextFormInput(
                                errorMessage: field.errorText,
                                onChange: (value) {
                                  form.control(_addressLine1Key).value = value;
                                },
                                initialValue:
                                    form.control(_addressLine1Key).value,
                              ),
                            ),
                          ),
                        ),
                        householdLocationShowcaseData.addressLine2.buildWith(
                          child: ReactiveWrapperField(
                            formControlName: _addressLine2Key,
                            validationMessages: {
                              'required': (_) => localizations.translate(
                                    i18.common.min2CharsRequired,
                                  ),
                              'maxLength': (object) => localizations
                                  .translate(i18.common.maxCharsRequired)
                                  .replaceAll('{}', maxLength.toString()),
                            },
                            builder: (field) => LabeledField(
                              label: localizations.translate(
                                i18.householdLocation
                                    .householdAddressLine2LabelText,
                              ),
                              child: DigitTextFormInput(
                                errorMessage: field.errorText,
                                onChange: (value) {
                                  form.control(_addressLine2Key).value = value;
                                },
                                initialValue:
                                    form.control(_addressLine2Key).value,
                              ),
                            ),
                          ),
                        ),
                        householdLocationShowcaseData.landmark.buildWith(
                          child: ReactiveWrapperField(
                            formControlName: _landmarkKey,
                            validationMessages: {
                              'required': (_) => localizations.translate(
                                    i18.common.min2CharsRequired,
                                  ),
                              'maxLength': (object) => localizations
                                  .translate(i18.common.maxCharsRequired)
                                  .replaceAll('{}', maxLength.toString()),
                            },
                            builder: (field) => LabeledField(
                              label: localizations.translate(
                                i18.householdLocation.landmarkFormLabel,
                              ),
                              child: DigitTextFormInput(
                                errorMessage: field.errorText,
                                onChange: (value) {
                                  form.control(_landmarkKey).value = value;
                                },
                                initialValue: form.control(_landmarkKey).value,
                              ),
                            ),
                          ),
                        ),
                        householdLocationShowcaseData.postalCode.buildWith(
                          child: ReactiveWrapperField(
                            formControlName: _postalCodeKey,
                            validationMessages: {
                              'required': (_) => localizations.translate(
                                    i18.common.min2CharsRequired,
                                  ),
                              'maxLength': (object) => localizations
                                  .translate(i18.common.maxCharsRequired)
                                  .replaceAll('{}', '6'),
                            },
                            builder: (field) => LabeledField(
                              label: localizations.translate(
                                i18.householdLocation.postalCodeFormLabel,
                              ),
                              child: DigitTextFormInput(
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                errorMessage: field.errorText,
                                onChange: (value) {
                                  form.control(_postalCodeKey).value = value;
                                },
                                maxLength: 6,
                                initialValue:
                                    form.control(_postalCodeKey).value,
                              ),
                            ),
                          ),
                        ),
                      ]),
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
            .translate(RegistrationDeliverySingleton().boundary!.name ?? ''),
        validators: [Validators.required],
      ),
      _addressLine1Key:
          FormControl<String>(value: addressModel?.addressLine1, validators: [
        Validators.delegate(
            (validator) => CustomValidator.requiredMin(validator)),
        Validators.maxLength(64),
      ]),
      _addressLine2Key: FormControl<String>(
        value: addressModel?.addressLine2,
        validators: [
          Validators.delegate(
              (validator) => CustomValidator.requiredMin(validator)),
          Validators.maxLength(64),
        ],
      ),
      _landmarkKey:
          FormControl<String>(value: addressModel?.landmark, validators: [
        Validators.delegate(
            (validator) => CustomValidator.requiredMin(validator)),
        Validators.maxLength(64),
      ]),
      _postalCodeKey:
          FormControl<String>(value: addressModel?.pincode, validators: [
        Validators.delegate(
            (validator) => CustomValidator.requiredMin(validator)),
        Validators.maxLength(6),
      ]),
      _latKey: FormControl<double>(value: addressModel?.latitude),
      _lngKey: FormControl<double>(
        value: addressModel?.longitude,
      ),
      _accuracyKey: FormControl<double>(
        value: addressModel?.locationAccuracy,
      ),
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
