import 'package:collection/collection.dart';
import 'package:digit_components/theme/colors.dart';
import 'package:flutter/material.dart';
import '../../models/privacy_notice/privacy_notice_model.dart';


class ExpandableSection extends StatefulWidget {
  final Content content;

  const ExpandableSection({
    super.key,
    required this.content,
  });

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const DigitColors().alabasterWhite,
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        border: Border.all(color: const DigitColors().quillGray, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.content.header,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.chevron_right,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.content.descriptions.asMap().entries.map((entry) {
                  int index = entry.key;
                  Description desc = entry.value;
                  int? stepNumber = desc.type == 'step' ? index + 1 : null;
                  return DescriptionWidget(
                    description: desc,
                    stepNumber: stepNumber,
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  final dynamic description; // Use dynamic or a base class for both Description and SubDescription
  final int? stepNumber;

  const DescriptionWidget({
    super.key,
    required this.description,
    this.stepNumber,
  });

  @override
  Widget build(BuildContext context) {
    final descriptionText = description.text;
    final descriptionType = description.type;
    final isBold = description.isBold;
    final hasSubDescriptions = description is Description && description.subDescriptions != null;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (descriptionType == 'step')
            Text(
              '$stepNumber. $descriptionText',
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else if (descriptionType == 'points')
            Row(
              children: [
                const Icon(Icons.circle, size: 8),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    descriptionText,
                    style: TextStyle(
                      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            )
          else
            Text(
              descriptionText,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          if (hasSubDescriptions)
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (description as Description).subDescriptions!.mapIndexed((subIndex, subDesc) {
                  int subStepNumber = subIndex + 1;
                  return DescriptionWidget(
                    description: subDesc,
                    stepNumber: subDesc.type == 'step' ? subStepNumber : null,
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

