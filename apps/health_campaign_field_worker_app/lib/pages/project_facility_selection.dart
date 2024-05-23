import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/localization/app_localization.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';

@RoutePage()
class ProjectFacilitySelectionPage extends StatelessWidget {
  final List<ProjectFacilityModel> projectFacilities;

  const ProjectFacilitySelectionPage({
    Key? key,
    required this.projectFacilities,
  }) : super(key: key);

  static const _facilityName = 'facilityKey';
  static const _selectedFacility = 'selectedFacilityKey';

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
              final filteredProjectFacilities =
                  (projectFacilities ?? []).isNotEmpty
                      ? projectFacilities.where((element) {
                          final query =
                              form.control(_facilityName).value as String?;
                          if (query == null || query.isEmpty) return true;
                          if (element.id
                              .toLowerCase()
                              .contains(query.toLowerCase())) {
                            return true;
                          }

                          return false;
                        })
                      : null;

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
                        padding: const EdgeInsets.only(
                          left: kPadding * 2,
                          right: kPadding * 2,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(kPadding),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  localizations.translate(
                                    i18.common.projectFacilitySearchHeaderLabel,
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
                              formControlName: _facilityName,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final projectFacility =
                            filteredProjectFacilities?.elementAt(index);

                        return Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Container(
                            margin: const EdgeInsets.only(left: 8, right: 8),
                            decoration: BoxDecoration(
                              color: DigitTheme.instance.colors.alabasterWhite,
                              border: Border(
                                top: index == 0 ? borderSide : BorderSide.none,
                                bottom: (filteredProjectFacilities != null &&
                                        index ==
                                            filteredProjectFacilities.length -
                                                1)
                                    ? borderSide
                                    : BorderSide.none,
                                left: borderSide,
                                right: borderSide,
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                context.router.pop(projectFacility);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: kPadding,
                                  left: kPadding,
                                  right: kPadding,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      DigitTheme.instance.colors.alabasterWhite,
                                  border: Border(
                                    bottom: BorderSide(
                                      //                   <--- left side
                                      color: theme.colorScheme.outline,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: kPadding * 2,
                                    bottom: kPadding * 2,
                                    top: kPadding * 2,
                                  ),
                                  child: Text(projectFacility != null
                                      ? localizations.translate(
                                          'PJ_FAC_${projectFacility.id}',
                                        )
                                      : ''),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: filteredProjectFacilities != null
                          ? filteredProjectFacilities.length
                          : 0,
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
      _facilityName: FormControl<String>(),
      _selectedFacility: FormControl<ProjectFacilityModel>(
        validators: [Validators.required],
      ),
    });
  }
}

class ProjectFacilityValueAccessor
    extends ControlValueAccessor<ProjectFacilityModel, String> {
  final List<ProjectFacilityModel> models;

  ProjectFacilityValueAccessor(this.models);

  @override
  String? modelToViewValue(ProjectFacilityModel? modelValue) {
    return modelValue?.id;
  }

  @override
  ProjectFacilityModel? viewToModelValue(String? viewValue) {
    return models.firstWhereOrNull((element) => element.id == viewValue);
  }
}
