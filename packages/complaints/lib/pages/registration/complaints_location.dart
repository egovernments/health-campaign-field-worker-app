import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:complaints/router/complaints_router.gm.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../models/pgr_address.dart';
import '/blocs/complaints_registration/complaints_registration.dart';
import '/utils/i18_key_constants.dart' as i18;
import '/utils/utils.dart';
import '/widgets/header/back_navigation_help_header.dart';
import '/widgets/localized.dart';

@RoutePage()
class ComplaintsLocationPage extends LocalizedStatefulWidget {
  const ComplaintsLocationPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsLocationPage> createState() => ComplaintsLocationPageState();
}

class ComplaintsLocationPageState
    extends LocalizedState<ComplaintsLocationPage> {
  static const _addressLine1Key = 'addressLine1';
  static const _addressLine2Key = 'addressLine2';
  static const _landmarkKey = 'landmark';
  static const _postalCodeKey = 'postalCode';
  static const _latKey = 'latKey';
  static const _lngKey = 'lngKey';
  static const _accuracyKey = 'accuracyKey';
  int maxLength = 64;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<ComplaintsRegistrationBloc>();
    final router = context.router;
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => bloc.state.map(
          create: (value) => buildForm(value),
          persisted: (value) =>
              throw const InvalidComplaintsRegistrationStateException(),
          view: (value) => buildForm(value),
        ),
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
          child: BlocBuilder<ComplaintsRegistrationBloc,
              ComplaintsRegistrationState>(
            builder: (context, state) {
              return ScrollableContent(
                enableFixedDigitButton: true,
                header: const Column(
                  children: [
                    BackNavigationHelpHeaderWidget(),
                  ],
                ),
                footer: DigitCard(
                    cardType: CardType.primary,
                    margin: const EdgeInsets.fromLTRB(0, spacer2, 0, 0),
                    children: [
                      DigitButton(
                        label:
                            localizations.translate(i18.complaints.actionLabel),
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        mainAxisSize: MainAxisSize.max,
                        onPressed: () {
                          form.markAllAsTouched();

                          if (!form.valid) return;
                          FocusManager.instance.primaryFocus?.unfocus();

                          final addressLine1 =
                              form.control(_addressLine1Key).value as String?;
                          final addressLine2 =
                              form.control(_addressLine2Key).value as String?;
                          final landmark =
                              form.control(_landmarkKey).value as String?;
                          final postalCode =
                              form.control(_postalCodeKey).value as String?;

                          state.whenOrNull(
                            create: (
                              loading,
                              complaintType,
                              _,
                              addressModel,
                              complaintsDetailsModel,
                            ) {
                              bloc.add(ComplaintsRegistrationEvent.saveAddress(
                                addressModel: PgrAddressModel(
                                  buildingName: addressLine1,
                                  street: addressLine2,
                                  landmark: landmark,
                                  pincode: postalCode,
                                  geoLocation: GeoLocation(
                                    latitude: form.control(_latKey).value,
                                    longitude: form.control(_lngKey).value,
                                  ),
                                ),
                              ));
                            },
                          );

                          router.push(ComplaintsDetailsRoute());
                        },
                      ),
                    ]),
                children: [
                  DigitCard(
                    margin: const EdgeInsets.all(spacer2),
                      cardType: CardType.primary, children: [
                    Text(
                      localizations.translate(
                        i18.complaints.complaintsLocationLabel,
                      ),
                      style: textTheme.headingXl,
                    ),
                    ReactiveWrapperField<String>(
                        formControlName: _addressLine1Key,
                        showErrors: (control) => control.invalid,
                        validationMessages: {
                          'required': (_) => localizations.translate(
                                i18.common.min2CharsRequired,
                              ),
                          'maxLength': (object) => localizations
                              .translate(i18.common.maxCharsRequired)
                              .replaceAll('{}', maxLength.toString()),
                        },
                        builder: (field) {
                          return LabeledField(
                            label: localizations.translate(
                              i18.householdLocation
                                  .householdAddressLine1LabelText,
                            ),
                            child: DigitTextFormInput(
                              errorMessage: field.errorText,
                              initialValue: field.value,
                              onChange: (value) => form
                                  .control(_addressLine1Key)
                                  .value = value,
                            ),
                          );
                        }),
                    ReactiveWrapperField<String>(
                        formControlName: _addressLine2Key,
                        builder: (field) {
                          return LabeledField(
                            label: localizations.translate(
                              i18.householdLocation
                                  .householdAddressLine2LabelText,
                            ),
                            padding: const EdgeInsets.only(top: spacer2 / 2),
                            child: DigitTextFormInput(
                              maxLength: maxLength,
                              initialValue: field.value,
                              onChange: (value) => form
                                  .control(_addressLine2Key)
                                  .value = value,
                              errorMessage: field.errorText,
                            ),
                          );
                        }),
                    ReactiveWrapperField<String>(
                        formControlName: _landmarkKey,
                        builder: (field) {
                          return LabeledField(
                            label: localizations.translate(
                              i18.householdLocation.landmarkFormLabel,
                            ),
                            padding: const EdgeInsets.only(top: spacer2 / 2),
                            child: DigitTextFormInput(
                              initialValue: field.value,
                              onChange: (value) => form
                                  .control(_landmarkKey)
                                  .value = value,
                              errorMessage: field.errorText,
                            ),
                          );
                        }),
                    ReactiveWrapperField<String>(
                        formControlName: _postalCodeKey,
                        builder: (field) {
                          return LabeledField(
                            label: localizations.translate(
                              i18.householdLocation.postalCodeFormLabel,
                            ),
                            padding: const EdgeInsets.only(top: spacer2 / 3.5),
                            child: DigitTextFormInput(
                              keyboardType: TextInputType.text,
                              initialValue: field.value,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChange: (value) => form
                                  .control(_postalCodeKey)
                                  .value = value,
                            ),
                          );
                        }),
                  ]),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  FormGroup buildForm(ComplaintsRegistrationState state) {
    final addressModel = state.mapOrNull(
      view: (value) => value.addressModel,
    );

    final shouldDisableForm = addressModel != null;

    return fb.group(<String, Object>{
      _addressLine1Key: FormControl<String>(
        value: addressModel?.buildingName,
        disabled: shouldDisableForm,
        validators: [
          Validators.delegate(
                  (validator) => CustomValidator.requiredMin(validator)),
          Validators.maxLength(maxLength),
        ],
      ),
      _addressLine2Key: FormControl<String>(
        value: addressModel?.street,
        disabled: shouldDisableForm,
        validators: [
          Validators.delegate(
                  (validator) => CustomValidator.requiredMin(validator)),
          Validators.maxLength(maxLength),
        ],
      ),
      _landmarkKey: FormControl<String>(
        value: addressModel?.landmark,
        disabled: shouldDisableForm,
        validators: [
          Validators.delegate(
                  (validator) => CustomValidator.requiredMin(validator)),
          Validators.maxLength(maxLength),
        ],
      ),
      _postalCodeKey: FormControl<String>(
        value: addressModel?.pincode,
        disabled: shouldDisableForm,
        validators: [
          Validators.delegate(
                  (validator) => CustomValidator.requiredMin(validator)),
          Validators.maxLength(6),
        ],
      ),
      _latKey: FormControl<double>(
        value: addressModel?.geoLocation?.latitude,
        validators: [
          Validators.delegate(
                  (validator) => CustomValidator.requiredMin(validator)),
        ],
      ),
      _lngKey: FormControl<double>(
        value: addressModel?.geoLocation?.longitude,
      ),
      _accuracyKey: FormControl<double>(),
    });
  }
}
