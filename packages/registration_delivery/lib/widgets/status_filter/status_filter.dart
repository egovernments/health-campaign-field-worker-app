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
            initialSelection: [
              ...selectedButtons
            ], // [TODO : fix selected not displaying]
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
                    onPressed: () {
                      setState(() {
                        selectedButtons.clear();
                        Navigator.pop(context);
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
                      Navigator.pop(
                          context, selectedButtons.map((e) => e.name).toList());
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
    return (RegistrationDeliverySingleton().searchHouseHoldFilter ?? [])
        .map((e) => Status.values.where((element) => element.toValue() == e))
        .expand((element) => element)
        .toList();
  }

  void assignSelectedButtons() {
    setState(() {
      selectedButtons = widget.selectedFilters!
          .map((e) => Status.values.where((element) => element.toValue() == e))
          .expand((element) => element)
          .toList();
    });
  }
}
