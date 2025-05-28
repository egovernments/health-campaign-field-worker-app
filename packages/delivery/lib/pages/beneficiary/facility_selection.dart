import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:delivery/blocs/app_localization.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/back_navigation_help_header.dart';

@RoutePage()
class FacilitySelectionPage extends StatelessWidget {
  final List<FacilityModel> facilities;

  const FacilitySelectionPage({
    super.key,
    required this.facilities,
  });

  static const _facilityName = 'facilityKey';
  static const _selectedFacility = 'selectedFacilityKey';

  @override
  Widget build(BuildContext context) {
    DeliveryLocalization localizations = DeliveryLocalization.of(context);
    final theme = Theme.of(context);
    final BorderSide borderSide = BorderSide(
      color: theme.colorScheme.outline,
      width: 1.0,
    );
    final textTheme = theme.digitTextTheme(context);

    return SafeArea(
      child: ReactiveFormBuilder(
        form: _form,
        builder: (context, form, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: ReactiveFormConsumer(
              builder: (context, form, _) {
                final filteredFacilities = facilities.where((element) {
                  final query = form.control(_facilityName).value as String?;
                  if (query == null || query.isEmpty) return true;
                  final localizedFacilityIdWithPrefix = localizations
                      .translate('FAC_${element.id}')
                      .toLowerCase();
                  final lowerCaseQuery = query.toLowerCase();
                  return localizedFacilityIdWithPrefix.contains(lowerCaseQuery);
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
                            horizontal: spacer2 * 2,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(spacer2),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    localizations.translate(
                                      i18.common.facilitySearchHeaderLabel,
                                    ),
                                    style: textTheme.headingXl,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(spacer2),
                                child: ReactiveWrapperField(
                                  formControlName: _facilityName,
                                  builder: (field) => DigitSearchFormInput(
                                    onChange: (value) {
                                      form.control(_facilityName).value = value;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final facility = filteredFacilities[index];

                          return Container(
                            color: Colors.white,
                            padding:
                                const EdgeInsets.symmetric(horizontal: spacer2),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: spacer2),
                              decoration: BoxDecoration(
                                color: DigitTheme
                                    .instance.colors.light.paperPrimary,
                                border: Border(
                                  top:
                                      index == 0 ? borderSide : BorderSide.none,
                                  bottom: index == filteredFacilities.length - 1
                                      ? borderSide
                                      : BorderSide.none,
                                  left: borderSide,
                                  right: borderSide,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop(facility);
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(spacer2),
                                  decoration: BoxDecoration(
                                    color: DigitTheme
                                        .instance.colors.light.paperPrimary,
                                    border: Border(
                                      bottom: BorderSide(
                                        color: theme.colorScheme.outline,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(spacer2 * 2),
                                    child: Text(
                                      localizations
                                          .translate('FAC_${facility.id}'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: filteredFacilities.length,
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  FormGroup _form() {
    return fb.group({
      _facilityName: FormControl<String>(),
      _selectedFacility: FormControl<FacilityModel>(
        validators: [Validators.required],
      ),
    });
  }
}

class FacilityValueAccessor
    extends ControlValueAccessor<FacilityModel, String> {
  final List<FacilityModel> models;

  FacilityValueAccessor(this.models);

  @override
  String? modelToViewValue(FacilityModel? modelValue) {
    return modelValue?.id;
  }

  @override
  FacilityModel? viewToModelValue(String? viewValue) {
    return models.firstWhereOrNull((element) => element.id == viewValue);
  }
}
