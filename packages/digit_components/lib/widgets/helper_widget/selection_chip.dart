import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../enum/app_enums.dart';
import '../../models/chipModel.dart';
import '../../theme/colors.dart';

class SelectionChip<T> extends StatelessWidget {
  final SelectionType? selectionType;
  final ChipConfig chipConfig;
  final Function(dynamic) onItemDelete;
  final dynamic item;

  const SelectionChip({
    Key? key,
    required this.chipConfig,
    required this.item,
    required this.onItemDelete,
    this.selectionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: chipConfig.padding,
      label: selectionType == SelectionType.nestedMultiSelect
          ? Text('${item.type}: ${item.name}')
          : Text(item.name),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      deleteIcon: Icon(
        Icons.cancel,
        color: const DigitColors().davyGray,
      ),
      deleteIconColor: chipConfig.deleteIconColor,
      labelPadding: const EdgeInsets.only(top: 4, bottom: 4),
      backgroundColor: const DigitColors().quillGray,
      labelStyle: chipConfig.labelStyle ?? DigitTheme.instance.mobileTheme.textTheme.bodyMedium,
      onDeleted: () => onItemDelete(item),
    );
  }
}

