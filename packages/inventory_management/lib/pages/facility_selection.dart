import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/utils/constants.dart';
import 'package:inventory_management/widgets/localized.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../widgets/back_navigation_help_header.dart';

@RoutePage()
class InventoryFacilitySelectionPage extends LocalizedStatefulWidget {
  final List<FacilityModel> facilities;

  const InventoryFacilitySelectionPage({
    super.key,
    super.appLocalizations,
    required this.facilities,
  });

  @override
  State<InventoryFacilitySelectionPage> createState() =>
      InventoryFacilitySelectionPageState();
}

class InventoryFacilitySelectionPageState
    extends LocalizedState<InventoryFacilitySelectionPage> {
  static const _facilityName = 'facilityKey';
  static const _selectedFacility = 'selectedFacilityKey';

  @override
  Widget build(BuildContext context) {
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
                final filteredFacilities = widget.facilities.where((element) {
                  final query = form.control(_facilityName).value as String?;
                  if (query == null || query.isEmpty) return true;
                  final localizedFacilityIdWithPrefix = localizations
                      .translate('$facilityPrefix${element.id}')
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
                              horizontal: spacer4),
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
                               ReactiveWrapperField(
                                  formControlName: _facilityName,
                                  builder: (field) {
                                    return DigitSearchFormInput(
                                      onChange: (value){
                                        field.control.value = value;
                                      },
                                    );
                                  }
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: spacer2),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: spacer2),
                              decoration: BoxDecoration(
                                color:Theme.of(context).colorTheme.paper.secondary,
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
                                    color: Theme.of(context).colorTheme.paper.secondary,
                                    border: Border(
                                      bottom: BorderSide(
                                        color: theme.colorScheme.outline,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(spacer4),
                                    child: Text(
                                      localizations.translate(
                                          '$facilityPrefix${facility.id}'),
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
