import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../models/address.dart';
import '../../models/address_type.dart';
import '../../models/boundary.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return ScrollableContent(
            header: Column(children: const [
              BackNavigationHelpHeaderWidget(),
            ]),
            footer: Offstage(
              offstage: false,
              child: SizedBox(
                height: 90,
                child: DigitCard(
                  child: DigitElevatedButton(
                    onPressed: () {
                      if (!form.valid) return;

                      final administrationArea =
                          form.control(_administrationAreaKey).value as String;
                      final addressLine1 =
                          form.control(_addressLine1Key).value as String;
                      final addressLine2 =
                          form.control(_addressLine2Key).value as String;
                      final landmark =
                          form.control(_landmarkKey).value as String;
                      final postalCode =
                          form.control(_postalCodeKey).value as String;

                      final model = AddressModel(
                        tenantId: 'default',
                        clientReferenceId: Uuid().v1(),
                        type: AddressType.correspondence,
                        addressLine1: addressLine1,
                        addressLine2: addressLine2,
                        landmark: landmark,
                        pincode: postalCode,
                        locality: BoundaryModel(
                          name: '',
                          code: '',
                          clientReferenceId: '',
                        ),
                      );

                      context.read<BeneficiaryRegistrationBloc>().add(
                            BeneficiaryRegistrationSaveAddressEvent(model),
                          );

                      context.router.push(HouseHoldDetailsRoute());
                    },
                    child: Center(
                      child: Text(localizations
                          .translate(i18.householdLocation.actionLabel)),
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
                          i18.householdLocation.householdAddressLine1LabelText,
                        ),
                      ),
                      DigitTextFormField(
                        formControlName: _addressLine2Key,
                        label: localizations.translate(
                          i18.householdLocation.householdAddressLine2LabelText,
                        ),
                      ),
                      DigitTextFormField(
                        formControlName: _landmarkKey,
                        label: localizations.translate(
                          i18.householdLocation.landmarkFormLabel,
                        ),
                      ),
                      DigitTextFormField(
                        formControlName: _postalCodeKey,
                        label: localizations.translate(
                          i18.householdLocation.postalCodeFormLabel,
                        ),
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
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        _administrationAreaKey: FormControl<String>(
          value: 'Solimbo',
          validators: [Validators.required],
        ),
        _addressLine1Key: FormControl<String>(value: ''),
        _addressLine2Key: FormControl<String>(value: ''),
        _landmarkKey: FormControl<String>(value: ''),
        _postalCodeKey: FormControl<String>(value: ''),
      });
}
