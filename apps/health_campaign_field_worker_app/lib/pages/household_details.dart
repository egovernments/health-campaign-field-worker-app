import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../utils/18KeyConstants.dart';

class HouseHoldDetailsPage extends StatelessWidget {
  const HouseHoldDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return ScrollableContent(
            header: Column(children: const [
              // BackNavigationHelpHeaderWidget(),
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
                      child: Text(i18.housholdDetails.actionLabel),
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
                      i18.housholdDetails.householdDetailsLabel,
                      style: theme.textTheme.displayMedium,
                    ),
                    Column(children: [
                      DigitDateFormPicker(
                        formControlName: 'dateOfRegistration',
                        label: i18.housholdDetails.dateOfRegistrationLabel,
                        isRequired: false,
                      ),
                      DigitIntegerFormPicker(
                        form: form,
                        formControlName: 'memberCount',
                        label: i18.housholdDetails.dateOfRegistrationLabel,
                        incrementer: true,
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
        'dateOfRegistration': FormControl<String>(value: ''),
        'memberCount': FormControl<int>(value: 1),
      });
}
