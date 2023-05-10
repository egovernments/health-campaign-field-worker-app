import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/complaints_registration/complaints_registration.dart';
import '../../../models/pgr_complaints/pgr_address.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

class ComplaintsLocationPage extends LocalizedStatefulWidget {
  const ComplaintsLocationPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsLocationPage> createState() => _ComplaintsLocationPageState();
}

class _ComplaintsLocationPageState
    extends LocalizedState<ComplaintsLocationPage> {
  static const _addressLine1Key = 'addressLine1';
  static const _addressLine2Key = 'addressLine2';
  static const _landmarkKey = 'landmark';
  static const _postalCodeKey = 'postalCode';
  static const _latKey = 'latKey';
  static const _lngKey = 'lngKey';
  static const _accuracyKey = 'accuracyKey';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<ComplaintsRegistrationBloc>();
    final router = context.router;

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
                header: Column(
                  children: const [
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
                      child: Center(
                        child: Text(
                          localizations.translate(i18.complaints.actionLabel),
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
                            i18.complaints.complaintsLocationLabel,
                          ),
                          style: theme.textTheme.displayMedium,
                        ),
                        Column(children: [
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
          CustomValidator.requiredMin,
        ],
      ),
      _addressLine2Key: FormControl<String>(
        value: addressModel?.street,
        disabled: shouldDisableForm,
        validators: [CustomValidator.requiredMin],
      ),
      _landmarkKey: FormControl<String>(
        value: addressModel?.landmark,
        disabled: shouldDisableForm,
        validators: [
          CustomValidator.requiredMin,
        ],
      ),
      _postalCodeKey: FormControl<String>(
        value: addressModel?.pincode,
        disabled: shouldDisableForm,
        validators: [
          CustomValidator.requiredMin,
        ],
      ),
      _latKey: FormControl<double>(
        value: addressModel?.geoLocation?.latitude,
        validators: [
          CustomValidator.requiredMin,
        ],
      ),
      _lngKey: FormControl<double>(
        value: addressModel?.geoLocation?.longitude,
      ),
      _accuracyKey: FormControl<double>(),
    });
  }
}
