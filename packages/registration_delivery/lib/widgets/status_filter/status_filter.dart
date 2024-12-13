import 'package:digit_scanner/widgets/localized.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../models/entities/status.dart';
import '../../utils/i18_key_constants.dart' as i18;

class StatusFilter extends LocalizedStatefulWidget {
  final List<String>? selectedFilters;
  final bool isCloseIcon;
  final Icon? titleIcon;
  final String? titleText;

  const StatusFilter({
    super.key,
    super.appLocalizations,
    this.isCloseIcon = false,
    this.titleIcon,
    this.titleText,
    this.selectedFilters,
  });

  @override
  State<StatusFilter> createState() => StatusFilterState();
}

class StatusFilterState extends LocalizedState<StatusFilter> {
  List<Status> selectedButtons = [];
  bool isLoading = false;

  @override
  void initState() {
    assignSelectedButtons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                    style: theme.textTheme.headlineSmall?.copyWith(
                        color: DigitTheme.instance.colorScheme.primary),
                  ),
                )
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
                  child: SelectionCard<Status>(
                    options: getFilters() ?? [],
                    allowMultipleSelection: false,
                    equalWidthOptions: true,
                    initialSelection: [...selectedButtons],
                    onSelectionChanged: (selected) {
                      setState(() {
                        selectedButtons = selected;
                      });
                    },
                    valueMapper: (value) {
                      return localizations.translate(value ==
                              Status.administeredSuccess
                          ? '${RegistrationDeliverySingleton().selectedProject!.name}_${value.toValue().toString()}'
                          : value.toValue().toString());
                    },
                  ),
                ),
                const SizedBox(
                  height: spacer2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacer2),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly, // Adjust button spacing
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
                            }),
                      ),
                      const SizedBox(
                        width: spacer2,
                      ),
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
                            var selected =
                                selectedButtons.map((e) => e.name).toList();

                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.pop(context, selected);
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

  void selectButton(Status button) {
    setState(() {
      if (selectedButtons.contains(button)) {
        selectedButtons.remove(button);
      } else {
        selectedButtons.add(button);
      }
    });
  }

  getFilters() {
    var finalStatues = <Status>[];
    finalStatues.addAll((RegistrationDeliverySingleton()
                .searchHouseHoldFilter ??
            [])
        .map((e) => Status.values.where((element) => element.toValue() == e))
        .expand((element) => element)
        .toList());

    return finalStatues;
  }

  void assignSelectedButtons() {
    setState(() {
      selectedButtons = widget.selectedFilters!
          .map((e) => Status.values.where((element) => element.name == e))
          .expand((element) => element)
          .toList();
    });
  }
}
