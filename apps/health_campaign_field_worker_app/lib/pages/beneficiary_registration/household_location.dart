import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../models/entities/address.dart';
import '../../models/entities/address_type.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return ScrollableContent(
            header: Column(children: const [BackNavigationHelpHeaderWidget()]),
            footer: SizedBox(
              height: 90,
              child: DigitCard(
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

                    final addressModel = AddressModel(
                      tenantId: envConfig.variables.tenantId,
                      clientReferenceId: IdGen.i.identifier,
                      type: AddressType.correspondence,
                      addressLine1: addressLine1,
                      addressLine2: addressLine2,
                      landmark: landmark,
                      pincode: postalCode,
                      rowVersion: 1,
                    );

                    context.read<BeneficiaryRegistrationBloc>().add(
                          BeneficiaryRegistrationSaveAddressEvent(addressModel),
                        );

                    context.router.push(HouseHoldDetailsRoute());
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
                          i18.householdLocation.householdAddressLine1LabelText,
                        ),
                        maxLength: 64,
                      ),
                      DigitTextFormField(
                        formControlName: _addressLine2Key,
                        label: localizations.translate(
                          i18.householdLocation.householdAddressLine2LabelText,
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
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        _administrationAreaKey: FormControl<String>(
          value: 'Solimbo',
          validators: [Validators.required],
        ),
        _addressLine1Key: FormControl<String>(),
        _addressLine2Key: FormControl<String>(),
        _landmarkKey: FormControl<String>(),
        _postalCodeKey: FormControl<String>(),
      });
}
