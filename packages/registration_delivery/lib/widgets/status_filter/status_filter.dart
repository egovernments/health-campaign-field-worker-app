import 'package:digit_data_model/models/entities/beneficiary_type.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_scanner/widgets/localized.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../models/entities/status.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;

/// Filter option model (code for backend, name for UI)
class FilterOption {
  final String code;
  final String name;

  FilterOption({required this.code, required this.name});
}

class StatusFilter extends LocalizedStatefulWidget {
  final List<String>? selectedFilters; // list of codes
  final bool isCloseIcon;
  final Icon? titleIcon;
  final String? titleText;
  final List<Map<String, dynamic>>? filters;

  const StatusFilter({
    super.key,
    super.appLocalizations,
    this.isCloseIcon = false,
    this.titleIcon,
    this.titleText,
    this.selectedFilters,
    this.filters,
  });

  @override
  State<StatusFilter> createState() => StatusFilterState();
}

class StatusFilterState extends LocalizedState<StatusFilter> {
  List<FilterOption> selectedButtons = [];
  bool isLoading = false;

  @override
  void initState() {
    assignSelectedButtons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: isLoading
            ? [
                Padding(
                  padding: const EdgeInsets.only(top: spacer2 * 2),
                  child: Icon(
                    Icons.autorenew,
                    color: DigitTheme.instance.colorScheme.primary,
                    size: spacer2 * 4,
                  ),
                ),
                const SizedBox(height: spacer2 * 2),
                Center(
                  child: Text(
                    localizations.translate(i18.common.coreCommonLoadingText),
                    style: textTheme.headingM.copyWith(
                      color: DigitTheme.instance.colorScheme.primary,
                    ),
                  ),
                ),
              ]
            : [
                Row(
                  children: [
                    if (widget.titleIcon != null) ...[
                      Padding(
                        padding: const EdgeInsets.all(spacer2),
                        child: widget.titleIcon!,
                      ),
                    ],
                    if (widget.titleText != null)
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: spacer2),
                          child: Text(
                            widget.titleText!,
                            textAlign: TextAlign.left,
                            style: DigitTheme
                                .instance.mobileTheme.textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    if (widget.isCloseIcon)
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.close),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(spacer2),
                  child: SelectionCard<FilterOption>(
                    options: getFilters(),
                    allowMultipleSelection: false,
                    width: MediaQuery.of(context).size.width * 0.6,
                    initialSelection: [...selectedButtons],
                    onSelectionChanged: (selected) {
                      setState(() {
                        selectedButtons = selected;
                      });
                    },
                    valueMapper: (value) => localizations
                        .translate(value.name), // show localized name
                  ),
                ),
                const SizedBox(height: spacer2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacer2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: DigitButton(
                          label: localizations.translate(
                            i18.searchBeneficiary.clearFilter,
                          ),
                          isDisabled: selectedButtons.isEmpty,
                          type: DigitButtonType.secondary,
                          size: DigitButtonSize.medium,
                          onPressed: () {
                            setState(() {
                              selectedButtons.clear();
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: spacer2),
                      Expanded(
                        child: DigitButton(
                          label: localizations.translate(
                            i18.searchBeneficiary.applyFilter,
                          ),
                          isDisabled: selectedButtons.isEmpty,
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.medium,
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                            });
                            var selectedCodes =
                                selectedButtons.map((e) => e.code).toList();

                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.pop(context, selectedCodes);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
      ),
    );
  }

  /// Build available filters based on household/beneficiary type
  List<FilterOption> getFilters() {
    final pageKey = SearchBeneficiaryRoute.name.replaceAll('Route', '');
    final searchTemplate =
        RegistrationDeliverySingleton().templateConfigs?[pageKey];

    // enums can now be list of objects
    final rawEnums = (RegistrationDeliverySingleton().householdType ==
                HouseholdType.community
            ? RegistrationDeliverySingleton().searchCLFFilters ?? []
            : (searchTemplate?.properties?['filter']?.enums ?? []).isNotEmpty
                ? (searchTemplate?.properties?['filter']?.enums ?? [])
                : RegistrationDeliverySingleton().searchHouseHoldFilter ?? [])
        .cast<Map<String, dynamic>>();

    // take only active = true
    final activeEnums = rawEnums.where((e) => e['active'] == true).toList();

    var finalStatuses = activeEnums
        .map(
          (e) => FilterOption(
            code: e['code'],
            name: localizations.translate(
              e['name'] ?? e['code'],
            ),
          ),
        )
        .toList();

    // remove unwanted for household
    if (RegistrationDeliverySingleton().beneficiaryType ==
        BeneficiaryType.household) {
      finalStatuses.removeWhere(
        (f) => f.code == Status.beneficiaryReferred.toValue(),
      );
    }

    return finalStatuses;
  }

  void assignSelectedButtons() {
    if (widget.selectedFilters == null || widget.selectedFilters!.isEmpty) {
      return;
    }

    final allFilters = getFilters();

    setState(() {
      selectedButtons = allFilters
          .where((f) => widget.selectedFilters!.contains(f.code))
          .toList();
    });
  }
}
