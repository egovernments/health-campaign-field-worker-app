import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/localization/app_localization.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/header/back_navigation_help_header.dart';

class SchoolSelectionPage extends StatelessWidget {
  final List<String> schools;

  const SchoolSelectionPage({
    super.key,
    required this.schools,
  });

  static const _schoolName = 'schoolKey';

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final BorderSide borderSide = BorderSide(
      color: theme.colorScheme.outline,
      width: 1.0,
    );

    return ReactiveFormBuilder(
      form: _form,
      builder: (context, form, child) {
        return Scaffold(
          body: ScrollableContent(
            backgroundColor: Colors.white,
            header: const BackNavigationHelpHeaderWidget(),
            footer: DigitElevatedButton(
              onPressed: form.valid
                  ? () {
                      if (!form.valid) return;
                      context.router.push(
                        BeneficiaryRegistrationWrapperRoute(
                          initialState: BeneficiaryRegistrationCreateState(
                            searchQuery: form.control(_schoolName).value,
                          ),
                          children: [SchoolDetailsRoute()],
                        ),
                      );
                    }
                  : null,
              child: Text(
                localizations.translate(i18.common.coreCommonContinue),
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(kPadding),
                child: DigitCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.translate(i18.schoolDetails.selectSchool),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      DigitDropdown<String>(
                        label: localizations.translate(
                          i18.schoolDetails.selectSchool,
                        ),
                        valueMapper: (value) => localizations.translate(value),
                        initialValue: schools.firstOrNull,
                        menuItems: schools
                            .map(
                              (e) => e,
                            )
                            .toList(),
                        formControlName: _schoolName,
                        isRequired: true,
                        onChanged: (value) {
                          form.control(_schoolName).value = value;
                          form.markAllAsTouched();
                        },
                        validationMessages: {
                          'required': (object) => localizations.translate(
                                i18.common.corecommonRequired,
                              ),
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  FormGroup _form() {
    return fb.group({
      _schoolName: FormControl<String>(
        value: schools.firstOrNull,
        validators: [Validators.required],
      ),
    });
  }
}
