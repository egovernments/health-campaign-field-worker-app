import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:health_campaign_field_worker_app/blocs/localization/app_localization.dart';
import 'package:inventory_management/utils/constants.dart';
import 'package:inventory_management/widgets/localized.dart';
import 'package:path/path.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import 'package:inventory_management/widgets/back_navigation_help_header.dart';

@RoutePage()
class CustomInventoryFacilitySelectionPage extends LocalizedStatefulWidget {
  final List<FacilityModel> facilities;

  const CustomInventoryFacilitySelectionPage({
    super.key,
    super.appLocalizations,
    required this.facilities,
  });

  @override
  State<CustomInventoryFacilitySelectionPage> createState() =>
      CustomInventoryFacilitySelectionPageState();
}

class CustomInventoryFacilitySelectionPageState
    extends LocalizedState<CustomInventoryFacilitySelectionPage> {
  static const _facilityName = 'facilityKey';
  static const _selectedFacility = 'selectedFacilityKey';

  @override
  Widget build(BuildContext context) {
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
                final filteredFacilities = widget.facilities.where((element) {
                  final query = form.control(_facilityName).value as String?;
                  if (query == null || query.isEmpty) return true;
                  final localizedFacilityIdWithPrefix = element.name ??
                      localizations
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
                                  padding: EdgeInsets.all(kPadding),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: kPadding),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: kPadding),
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
                                      facility.name ??
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
  BuildContext context;

  FacilityValueAccessor(this.models, this.context);

  @override
  String? modelToViewValue(FacilityModel? modelValue) {
    AppLocalizations localizations = AppLocalizations.of(context);

    return modelValue == null
        ? ""
        : modelValue?.name ??
            localizations.translate('$facilityPrefix${modelValue?.id}');
  }

  @override
  FacilityModel? viewToModelValue(String? viewValue) {
    return models.firstWhereOrNull(
        (element) => element.id == viewValue || element.name == viewValue);
  }
}
