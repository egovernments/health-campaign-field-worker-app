import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../router/app_router.dart';
import '../blocs/localization/app_localization.dart';

class HouseHoldDetailsPage extends LocalizedStatefulWidget {
  const HouseHoldDetailsPage({
    super.key,
    super.appLocalizations,
  });
  @override
  State<HouseHoldDetailsPage> createState() => _HouseHoldDetailsPageState();
}

class _HouseHoldDetailsPageState extends LocalizedState<HouseHoldDetailsPage> {
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
            footer: SizedBox(
              height: 90,
              child: DigitCard(
                child: DigitElevatedButton(
                  onPressed: () {
                    if (form.valid) {
                      // TODO: Complete implementation
                      context.router.push(IndividualDetailsRoute());
                    } else {
                      form.markAllAsTouched();
                    }
                  },
                  child: Center(
                    child: Text(localizations
                        .translate(i18.householdDetails.actionLabel)),
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
                        i18.householdDetails.householdDetailsLabel,
                      ),
                      style: theme.textTheme.displayMedium,
                    ),
                    Column(children: [
                      DigitDateFormPicker(
                        formControlName: 'dateOfRegistration',
                        label: localizations.translate(
                          i18.householdDetails.dateOfRegistrationLabel,
                        ),
                        isRequired: false,
                      ),
                      DigitIntegerFormPicker(
                        form: form,
                        formControlName: 'memberCount',
                        label: localizations.translate(
                          i18.householdDetails.noOfMembersCountLabel,
                        ),
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
