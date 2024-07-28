import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/selection_card.dart';
import 'package:digit_scanner/widgets/localized.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../models/entities/status.dart';
import '../../utils/i18_key_constants.dart' as i18;

class StatusFilter extends LocalizedStatefulWidget {
  final List<String>? selectedFilters;
  const StatusFilter({
    super.key,
    super.appLocalizations,
    this.selectedFilters,
  });

  @override
  State<StatusFilter> createState() => StatusFilterState();
}

class StatusFilterState extends LocalizedState<StatusFilter> {
  List<Status> selectedButtons = [];

  @override
  void initState() {
    assignSelectedButtons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectionBox<Status>(
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
              return localizations.translate(value.toValue().toString());
            },
          ),
          const SizedBox(
            height: kPadding,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Adjust button spacing
            children: [
              Expanded(
                child: DigitOutLineButton(
                    label: localizations.translate(
                      i18.searchBeneficiary.clearFilter,
                    ),
                    onPressed: selectedButtons.isEmpty ? null : () {
                      setState(() {
                        selectedButtons.clear();
                      });
                    }),
              ),
              const SizedBox(
                width: kPadding / 2,
              ),
              Expanded(
                child: DigitElevatedButton(
                    child: Text(
                      localizations.translate(
                        i18.searchBeneficiary.applyFilter,
                      ),
                    ),
                    onPressed: () {
                      var selected =
                          selectedButtons.map((e) => e.name).toList();
                      Navigator.pop(context, selected);
                    }),
              ),
            ],
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
