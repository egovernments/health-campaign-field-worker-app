import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/blocs/app_localization.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/entities/facility.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/header/back_navigation_help_header.dart';

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
    InventoryLocalization localizations = InventoryLocalization.of(context);
    final theme = Theme.of(context);
    final BorderSide borderSide = BorderSide(
      color: theme.colorScheme.outline,
      width: 1.0,
    );

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
                  if (element.id.toLowerCase().contains(query.toLowerCase())) {
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
                              horizontal: kPadding * 2),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(kPadding),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    localizations.translate(
                                      i18.common.facilitySearchHeaderLabel,
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
                          final facility = filteredFacilities[index];

                          return Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color:
                                DigitTheme.instance.colors.alabasterWhite,
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
                                  margin: const EdgeInsets.all(kPadding),
                                  decoration: BoxDecoration(
                                    color: DigitTheme
                                        .instance.colors.alabasterWhite,
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
