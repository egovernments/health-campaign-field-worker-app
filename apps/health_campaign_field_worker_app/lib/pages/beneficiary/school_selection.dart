import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/localization/app_localization.dart';
import '../../models/entities/facility.dart';
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
  static const _selectedSchool = '_selectedSchoolKey';

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
          backgroundColor: Colors.white,
          body: ReactiveFormConsumer(
            builder: (context, form, _) {
              final filteredSchools = schools.where((element) {
                final query = form.control(_schoolName).value as String?;
                if (query == null || query.isEmpty) return true;
                if ((element).toLowerCase().contains(query.toLowerCase())) {
                  return true;
                }

                return false;
              }).toList();

              return ScrollableContent(
                backgroundColor: Colors.white,
                header: const BackNavigationHelpHeaderWidget(
                  showHelp: false,
                ),
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kPadding * 2,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(kPadding),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  localizations.translate(
                                    i18.stockReconciliationDetails
                                        .facilityLabel,
                                  ),
                                  style: theme.textTheme.displayMedium,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            const DigitTextFormField(
                              suffix: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.search),
                              ),
                              label: '',
                              formControlName: _schoolName,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final school = filteredSchools[index];

                        return Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: DigitTheme.instance.colors.alabasterWhite,
                              border: Border(
                                top: index == 0 ? borderSide : BorderSide.none,
                                bottom: index == filteredSchools.length - 1
                                    ? borderSide
                                    : BorderSide.none,
                                left: borderSide,
                                right: borderSide,
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                context.router.pop(school);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(kPadding),
                                decoration: BoxDecoration(
                                  color:
                                      DigitTheme.instance.colors.alabasterWhite,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: theme.colorScheme.outline,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(kPadding * 2),
                                  child: Text(
                                    school,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: filteredSchools.length,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  FormGroup _form() {
    return fb.group({
      _schoolName: FormControl<String>(),
      _selectedSchool: FormControl<FacilityModel>(
        validators: [Validators.required],
      ),
    });
  }
}
