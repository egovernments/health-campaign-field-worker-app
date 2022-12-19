import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class DigitTable extends StatelessWidget {
  final Function getTitleWidget;
  final Widget Function(BuildContext, int)? generateFirstColumnRow;
  final Widget Function(BuildContext, int)? generateRightHandSideColumnRow;
  final double height;
  final int itemCount;
  final double leftHandSideColumnWidth;
  final double rightHandSideColumnWidth;
  final Color? color;
  final EdgeInsets? padding;
  
  const DigitTable({
    super.key,
    required this.getTitleWidget,
    required this.generateFirstColumnRow,
    required this.generateRightHandSideColumnRow,
    required this.height,
    required this.itemCount,
    required this.leftHandSideColumnWidth,
    required this.rightHandSideColumnWidth,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color ?? theme.scaffoldBackgroundColor)),
        padding: padding ?? const EdgeInsets.all(2),
        child: HorizontalDataTable(
          leftHandSideColumnWidth: leftHandSideColumnWidth,
          rightHandSideColumnWidth: rightHandSideColumnWidth,
          isFixedHeader: true,
          headerWidgets: getTitleWidget(),
          leftSideItemBuilder: generateFirstColumnRow,
          rightSideItemBuilder: generateRightHandSideColumnRow,
          itemCount: itemCount,
          rowSeparatorWidget: const Divider(
            color: Colors.black54,
            height: 1.0,
            thickness: 0.0,
          ),
        ),
      ),
    );
  }
}
