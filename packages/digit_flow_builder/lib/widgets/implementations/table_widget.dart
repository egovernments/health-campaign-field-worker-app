import 'dart:convert';

import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class TableWidget implements FlowWidget {
  @override
  String get format => 'table';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final stateData = crudCtx?.stateData;

    final data = Map<String, dynamic>.from(json['data'] ?? {});

    // Store raw column configuration for later evaluation
    final rawColumns = (data['columns'] as List<dynamic>?) ?? [];

    // Create column headers
    final columns = rawColumns.map((col) {
      final cellValue = col['cellValue'];

      return DigitTableColumn(
        header: col['header']?.toString() ?? '',
        cellValue: cellValue is String ? cellValue : jsonEncode(cellValue),
      );
    }).toList();

    // Step 1: Resolve data source
    List<dynamic> sourceList = [];

    if (data['rows'] != null) {
      final rowsKey = data['rows'].toString();

      // Case 1: Singleton path
      if (rowsKey.startsWith("singleton")) {
        final resolved = resolveValueRaw("{{ $rowsKey }}", null);
        if (resolved is List) {
          sourceList = resolved;
        } else if (resolved != null) {
          sourceList = [resolved];
        }
      }
      // Case 2: If the current item already has this source (table inside listView)
      else if (crudCtx?.item != null && (crudCtx!.item?[rowsKey] != null)) {
        final localSource = resolveValueRaw(rowsKey, crudCtx.item);
        if (localSource is List) {
          sourceList = localSource;
        } else if (localSource != null) {
          sourceList = [localSource];
        }
      }
      // Case 3: Fallback to global modelMap
      else if (stateData != null) {
        final localSource = resolveValueRaw(rowsKey, stateData.rawState);
        if (localSource is List) {
          sourceList = localSource;
        } else if (localSource != null) {
          sourceList = [localSource];
        }
      }
    }

    if (sourceList.isEmpty) return const SizedBox.shrink();

    final rows = sourceList.asMap().entries.map((entry) {
      final rowIndex = entry.key;
      final rowItem = entry.value;

      return DigitTableRow(
        tableRow: rawColumns.asMap().entries.map((entry) {
          final colIndex = entry.key;
          final colConfig = entry.value;

          // Create evaluation context for this row with full context
          final evalContext = <String, dynamic>{
            'currentItem': rowItem,
            ...((crudCtx?.stateData?.rawState.first as Map<String, dynamic>?) ??
                {}),
          };

          // Get the raw cellValue configuration
          final rawCellValue = colConfig['cellValue'];

          // Evaluate cell value (handles both conditional and regular values)
          final cellValue =
              ConditionalEvaluator.evaluate(rawCellValue, evalContext);

          // Resolve templates in the evaluated value
          final finalText = resolveTemplate(cellValue, rowItem).toString();

          return DigitTableData(
            finalText,
            cellKey: rawCellValue is Map
                ? 'conditional_$colIndex'
                : rawCellValue?.toString() ?? '',
          );
        }).toList(),
      );
    }).toList();

    return SizedBox(
      height: (rows.length * 52.0 + 64),
      child: DigitTable(
        enableBorder: true,
        withRowDividers: false,
        withColumnDividers: false,
        showSelectedState: false,
        showPagination: false,
        columns: columns,
        rows: rows,
      ),
    );
  }
}
