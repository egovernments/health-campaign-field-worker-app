import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../utils/I18KeyConstants.dart';
import '../widgets/header/back_navigation_help_header.dart';

class HouseholdLocationPage extends StatelessWidget {
  const HouseholdLocationPage({super.key});

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
                        print(form.value);
                      } else {
                        form.markAllAsTouched();
                      }
                    },
                    child: Center(
                      child: Text(i18.householdLocation.actionLabel),
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
                      i18.householdLocation.householdLocationLabelText,
                      style: theme.textTheme.displayMedium,
                    ),
                    Column(children: [
                      DigitTextFormField(
                        formControlName: 'administrationArea',
                        label:
                            i18.householdLocation.administrationAreaFormLabel,
                      ),
                      DigitTextFormField(
                        formControlName: 'housholdNo',
                        label: i18.householdLocation.householdLocationLabelText,
                      ),
                      DigitTextFormField(
                        formControlName: 'locality',
                        label: i18.householdLocation.householdLocationLabelText,
                      ),
                      DigitTextFormField(
                        formControlName: 'state',
                        label: i18.householdLocation.stateFormLabel,
                      ),
                      DigitTextFormField(
                        formControlName: 'postalCode',
                        label: i18.householdLocation.postalCodeFormLabel,
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
        'housholdNo': FormControl<String>(value: ''),
        'locality': FormControl<String>(value: ''),
        'state': FormControl<String>(value: ''),
        'postalCode': FormControl<String>(value: ''),
      });
}
