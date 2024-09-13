import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_scanner/widgets/localized.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/registration_delivery.dart';
import '../../utils/i18_key_constants.dart' as i18;

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
                  padding: const EdgeInsets.only(top: kPadding * 2),
                  child: Icon(
                    Icons.autorenew,
                    color: const DigitColors().burningOrange,
                    size: kPadding * 4,
                  ),
                ),
                const SizedBox(height: kPadding * 2),
                Center(
                  child: Text(
                    localizations.translate(i18.common.coreCommonLoadingText),
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(color: const DigitColors().burningOrange),
                  ),
                )
              ]
            : [
                Row(
                  children: [
                    if (widget.titleIcon != null) ...[
                      Padding(
                        padding: const EdgeInsets.all(kPadding),
                        child: widget.titleIcon!,
                      ),
                    ],
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: kPadding),
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
                  padding: const EdgeInsets.all(kPadding),
                  child: SelectionBox<Status>(
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
                      return localizations
                          .translate(value.toValue().toString());
                    },
                  ),
                ),
                const SizedBox(
                  height: kPadding,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kPadding),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly, // Adjust button spacing
                    children: [
                      Expanded(
                        child: DigitOutLineButton(
                            label: localizations.translate(
                              i18.searchBeneficiary.clearFilter,
                            ),
                            onPressed: selectedButtons.isEmpty
                                ? null
                                : () {
                                    setState(() {
                                      selectedButtons.clear();
                                    });
                                  }),
                      ),
                      const SizedBox(
                        width: kPadding,
                      ),
                      Expanded(
                        child: DigitElevatedButton(
                            onPressed: selectedButtons.isEmpty
                                ? null
                                : () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    var selected = selectedButtons
                                        .map((e) => e.name)
                                        .toList();

                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      Navigator.pop(context, selected);
                                    });
                                  },
                            child: Text(
                              localizations.translate(
                                i18.searchBeneficiary.applyFilter,
                              ),
                            )),
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
