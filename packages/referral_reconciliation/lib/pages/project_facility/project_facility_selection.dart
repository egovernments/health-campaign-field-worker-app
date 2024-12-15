import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:referral_reconciliation/utils/constants.dart';
import 'package:referral_reconciliation/widgets/localized.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/back_navigation_help_header.dart';

@RoutePage()
class ReferralReconProjectFacilitySelectionPage
    extends LocalizedStatefulWidget {
  final List<ProjectFacilityModel> projectFacilities;

  const ReferralReconProjectFacilitySelectionPage({
    super.key,
    super.appLocalizations,
    required this.projectFacilities,
  });

  @override
  State<ReferralReconProjectFacilitySelectionPage> createState() =>
      _ReferralReconProjectFacilitySelectionPageState();
}

class _ReferralReconProjectFacilitySelectionPageState
    extends LocalizedState<ReferralReconProjectFacilitySelectionPage> {
  static const _facilityName = 'facilityKey';
  static const _selectedFacility = 'selectedFacilityKey';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
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
                  (widget.projectFacilities).isNotEmpty
                      ? widget.projectFacilities.where((element) {
                          final query =
                              form.control(_facilityName).value as String?;
                          if (query == null || query.isEmpty) return true;
                          final localizedFacilityIdWithPrefix = localizations
                              .translate('$projectFacilityPrefix${element.id}')
                              .toLowerCase();
                          final lowerCaseQuery = query.toLowerCase();
                          return localizedFacilityIdWithPrefix
                              .contains(lowerCaseQuery);
                        }).toList()
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
                        padding: EdgeInsets.only(
                          left: theme.spacerTheme.spacer2 * 2,
                          right: theme.spacerTheme.spacer2 * 2,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.all(theme.spacerTheme.spacer2),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  localizations.translate(
                                    i18.common.projectFacilitySearchHeaderLabel,
                                  ),
                                  style: textTheme.headingXl,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            ReactiveWrapperField<String>(
                                formControlName: _facilityName,
                                builder: (field) {
                                  return LabeledField(
                                    label: '',
                                    child: DigitSearchFormInput(
                                      onChange: (val) => {
                                        form
                                            .control(_facilityName)
                                            .markAsTouched(),
                                        form.control(_facilityName).value = val,
                                      },
                                      initialValue:
                                          form.control(_facilityName).value ??
                                              "",
                                    ),
                                  );
                                }),
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
                              color: theme.colorTheme.paper.secondary,
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
                                Navigator.of(context).pop(projectFacility);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: theme.spacerTheme.spacer2,
                                  left: theme.spacerTheme.spacer2,
                                  right: theme.spacerTheme.spacer2,
                                ),
                                decoration: BoxDecoration(
                                  color: DigitTheme.instance.colors.transparent,
                                  border: Border(
                                    bottom: BorderSide(
                                      //                   <--- left side
                                      color: theme.colorScheme.outline,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: theme.spacerTheme.spacer2 * 2,
                                    bottom: theme.spacerTheme.spacer2 * 2,
                                    top: theme.spacerTheme.spacer2 * 2,
                                  ),
                                  child: Text(projectFacility != null
                                      ? localizations.translate(
                                          '$projectFacilityPrefix${projectFacility.id}',
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
