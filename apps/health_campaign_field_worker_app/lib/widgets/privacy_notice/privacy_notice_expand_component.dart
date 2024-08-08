import 'package:collection/collection.dart';
import 'package:digit_components/theme/colors.dart';
import 'package:flutter/material.dart';
import '../../models/privacy_notice/privacy_notice_model.dart';
import '../localized.dart';

class ExpandableSection extends LocalizedStatefulWidget {
  final ContentModel content;

  const ExpandableSection({
    super.key,
    super.appLocalizations,
    required this.content,
  });

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends LocalizedState<ExpandableSection> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(widget.content.header != null)
                  Flexible(
                    child: Text(
                      localizations.translate(widget.content.header!),
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.chevron_right, size: 24,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded && widget.content.descriptions != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.content.descriptions!.asMap().entries.map((entry) {
                  int index = entry.key;
                  DescriptionModel desc = entry.value;
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

class DescriptionWidget extends LocalizedStatefulWidget {
  final dynamic description; // Use dynamic or a base class for both Description and SubDescription
  final int? stepNumber;

  const DescriptionWidget({
    super.key,
    super.appLocalizations,
    required this.description,
    this.stepNumber,
  });

  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends LocalizedState<DescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    final descriptionText = widget.description.text;
    final descriptionType = widget.description.type;
    final isBold = widget.description.isBold;
    final hasSubDescriptions = widget.description is DescriptionModel && widget.description.subDescriptions != null;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (descriptionType == 'step')
            Text(
              '${widget.stepNumber}. ${localizations.translate(descriptionText)}',
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
                    localizations.translate(descriptionText),
                    style: TextStyle(
                      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            )
          else
            Text(
              localizations.translate(descriptionText),
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          if (hasSubDescriptions)
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (widget.description as DescriptionModel).subDescriptions!.mapIndexed((subIndex, subDesc) {
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
