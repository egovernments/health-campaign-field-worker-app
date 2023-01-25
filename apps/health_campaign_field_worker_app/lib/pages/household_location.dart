import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

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
                      if (form.valid) {
                        // TODO: Complete implementation
                        context.router.push(HouseHoldDetailsRoute());
                      } else {
                        form.markAllAsTouched();
                      }
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
                        formControlName: 'administrationArea',
                        label: localizations.translate(
                          i18.householdLocation.administrationAreaFormLabel,
                        ),
                      ),
                      DigitTextFormField(
                        formControlName: 'addressLine1',
                        label: localizations.translate(
                          i18.householdLocation.householdAddressLine1LabelText,
                        ),
                      ),
                      DigitTextFormField(
                        formControlName: 'addressLine2',
                        label: localizations.translate(
                          i18.householdLocation.householdAddressLine2LabelText,
                        ),
                      ),
                      DigitTextFormField(
                        formControlName: 'landmark',
                        label: localizations.translate(
                          i18.householdLocation.landmarkFormLabel,
                        ),
                      ),
                      DigitTextFormField(
                        formControlName: 'postalCode',
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
        'administrationArea': FormControl<String>(value: ''),
        'addressLine1': FormControl<String>(value: ''),
        'addressLine2': FormControl<String>(value: ''),
        'landmark': FormControl<String>(value: ''),
        'postalCode': FormControl<String>(value: ''),
      });
}
