import 'package:digit_components/digit_components.dart';
import 'package:digit_scanner/widgets/localized.dart';
import 'package:flutter/material.dart';

import '../../models/entities/status.dart';
import '../../utils/i18_key_constants.dart' as i18;

class StatusFilter extends LocalizedStatefulWidget {
  final List<Status> status;
  final Set<String>? selectedFilters;
  const StatusFilter({
    super.key,
    super.appLocalizations,
    required this.status,
    this.selectedFilters,
  });

  @override
  State<StatusFilter> createState() => _StatusFilterState();
}

class _StatusFilterState extends LocalizedState<StatusFilter> {
  Set<String> selectedButtons = {};

  @override
  void initState() {
    selectedButtons = widget.selectedFilters ?? {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(kPadding),
            child: GridView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio: 3.0,
                ),
                shrinkWrap: true,
                itemCount: widget.status.length,
                itemBuilder: (context, index) =>
                    _buildButton(widget.status[index].toValue())),
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
                      Navigator.pop(context, selectedButtons);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }

  void selectButton(String button) {
    setState(() {
      if (selectedButtons.contains(button)) {
        selectedButtons.remove(button);
      } else {
        selectedButtons.add(button);
      }
    });
  }

  Widget _buildButton(String label) {
    bool isSelected = selectedButtons.contains(label);
    return GestureDetector(
      onTap: () => selectButton(label),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const DigitColors().burningOrange : Colors.white,
          border: Border.all(color: const DigitColors().cloudGray),
          borderRadius: BorderRadius.circular(kPadding / 2),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? const DigitColors().white
                : const DigitColors().davyGray,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
