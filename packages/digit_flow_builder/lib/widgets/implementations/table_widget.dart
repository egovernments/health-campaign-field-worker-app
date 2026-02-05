import 'dart:convert';

import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class TableWidget implements FlowWidget {
  @override
  String get format => 'table';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final flowState = WidgetStateContext.of(context);
    final stateData = flowState.stateData;
    final localization = LocalizationContext.maybeOf(context);

    // Use compositeKey for registry operations (includes instanceId for proper isolation)
    final compositeKey = flowState.compositeKey ?? flowState.screenKey;

    // Get navigation params for visibility evaluation
    final navigationParams = compositeKey != null
        ? FlowCrudStateRegistry().getNavigationParams(compositeKey) ?? {}
        : <String, dynamic>{};

    // Build evaluation context with navigation params
    final evalContext = {
      ...flowState.evalContext,
      'navigation': navigationParams,
      // Legacy support for existing templates
      'currentItem': flowState.itemData,
    };

    // Check visibility condition
    final visible = ConditionalEvaluator.evaluate(
      json['visible'] ?? true,
      evalContext,
      screenKey: flowState.screenKey,
    );

    if (visible == false) {
      return const SizedBox.shrink();
    }

    final data = Map<String, dynamic>.from(json['data'] ?? {});

    // Store raw column configuration for later evaluation
    final rawColumns = (data['columns'] as List<dynamic>?) ?? [];

    // Create column headers with resolved templates
    final columns = rawColumns
        .where((col) => col['isActive'] != false)
        .map((col) {
      final cellValue = col['cellValue'];
      final headerTemplate = col['header']?.toString() ?? '';

      // Resolve header template using evalContext (supports {{formData.x}}, {{itemData.x}}, etc.)
      final resolvedHeader =
      resolveTemplate(headerTemplate, evalContext, screenKey: flowState.screenKey);

      return DigitTableColumn(
        header: localization?.translate(resolvedHeader) ?? resolvedHeader,
        cellValue: cellValue is String ? cellValue : jsonEncode(cellValue),
      );
    })
        .toList();

    // Step 1: Resolve data source from either 'rows' or 'source' (both should point to same data)
    List<dynamic> sourceList = [];

    // Prefer 'rows' if specified, fallback to 'source'
    final dataSourceKey = data['rows'] ?? data['source'];

    if (dataSourceKey != null) {
      final rowsKey = dataSourceKey.toString();

      // Strip {{ }} if present
      String cleanKey = rowsKey;
      if (rowsKey.startsWith('{{') && rowsKey.endsWith('}}')) {
        cleanKey = rowsKey.substring(2, rowsKey.length - 2).trim();
      }

      // Case 1: Singleton path
      if (cleanKey.startsWith("singleton")) {
        final resolved =
            resolveValueRaw("{{ $cleanKey }}", null, screenKey: flowState.screenKey);
        if (resolved is List) {
          sourceList = resolved;
        } else if (resolved != null) {
          sourceList = [resolved];
        }
      }
      // Case 2: If the current item already has this source (table inside listView)
      else if (flowState.itemData != null && (flowState.itemData?[cleanKey] != null)) {
        final localSource =
            resolveValueRaw("{{ $cleanKey }}", flowState.itemData, screenKey: flowState.screenKey);
        if (localSource is List) {
          sourceList = localSource;
        } else if (localSource != null) {
          sourceList = [localSource];
        }
      }
      // Case 3: Try modelMap first for named entities like 'stock', 'productVariant'
      else if (stateData?.modelMap != null &&
          stateData!.modelMap.containsKey(cleanKey)) {
        final localSource = stateData.modelMap[cleanKey];
        if (localSource is List) {
          sourceList = List<dynamic>.from(localSource as List);
        }
      }
      // Case 4: Fallback to resolving from rawState
      else if (stateData != null) {
        final localSource =
            resolveValueRaw(rowsKey, evalContext, screenKey: flowState.screenKey);
        if (localSource is List) {
          sourceList = localSource;
        } else if (localSource != null) {
          sourceList = [localSource];
        }
      }
    }

    if (sourceList.isEmpty) return const SizedBox.shrink();

    // Use contextData from evalContext (already contains the rawState list)
    final contextDataList = flowState.contextData ?? [];

    final rows = sourceList.asMap().entries.map((entry) {
      final rowItem = entry.value;

      // Build evaluation context for cell values
      // Uses evalContext as base, with row-specific 'item' and 'itemData' override
      final cellEvalContext = {
        ...evalContext,
        'item': rowItem,
        'itemData': rowItem is Map<String, dynamic> ? rowItem : null,
        'currentItem': rowItem, // Legacy support
      };

      return DigitTableRow(
        tableRow: rawColumns.asMap().entries.map((entry) {
          final colIndex = entry.key;
          final colConfig = entry.value;

          // Get the raw cellValue configuration
          // Resolve static localization keys from cellValue (text without {{}})
          final rawCellValue = colConfig['cellValue'] is String ? resolveStaticString(colConfig['cellValue'], localization) : colConfig['cellValue'];

          final cellValue = ConditionalEvaluator.evaluate(
              rawCellValue, cellEvalContext,
              screenKey: flowState.screenKey, stateData: stateData);

          // cellValue should already be resolved by ConditionalEvaluator
          // Just convert to string
          final finalText = cellValue?.toString() ?? '';

          final displayText = finalText != "null"
              ? (localization?.translate(finalText) ?? finalText)
              : "--";

          return DigitTableData(
            displayText,
            cellKey: rawCellValue is Map
                ? 'conditional_$colIndex'
                : rawCellValue?.toString() ?? '',
            widget: Text(
              displayText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
      );
    }).toList();

    return SizedBox(
      height: rows.length * 52.0 + 64,
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
