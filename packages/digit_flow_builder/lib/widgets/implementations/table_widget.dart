import 'dart:convert';

import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/interpolation.dart';
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
    final modelMap = crudCtx?.stateData?.modelMap ?? {};

    // Get screenKey and navigation params for visibility evaluation
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
    final navigationParams = screenKey != null
        ? FlowCrudStateRegistry().getNavigationParams(screenKey) ?? {}
        : <String, dynamic>{};
    final formData = screenKey != null
        ? FlowCrudStateRegistry().get(screenKey)?.formData ?? {}
        : <String, dynamic>{};

    // Create evaluation context that includes modelMap for named entity access
    final evalContext = {
      'item': crudCtx?.item,
      'contextData': crudCtx?.stateData?.rawState ?? {},
      'navigation': navigationParams,
      ...modelMap,
      // Include modelMap so {{stock}}, {{productVariant}} etc. can be resolved
      ...formData,
      // Include formData for {{selectedProduct}}, {{selectedFacility}} etc.
    };

    // Check visibility condition
    final visible = ConditionalEvaluator.evaluate(
      json['visible'] ?? true,
      evalContext,
      screenKey: screenKey,
    );

    if (visible == false) {
      return const SizedBox.shrink();
    }

    final data = Map<String, dynamic>.from(json['data'] ?? {});

    // Store raw column configuration for later evaluation
    final rawColumns = (data['columns'] as List<dynamic>?) ?? [];

    // Create column headers with resolved templates
    final columns = rawColumns.map((col) {
      final cellValue = col['cellValue'];
      final headerTemplate = col['header']?.toString() ?? '';

      // Resolve header template to support {{selectedProduct.sku}} etc.
      final resolvedHeader =
          resolveTemplate(headerTemplate, formData, screenKey: screenKey);

      return DigitTableColumn(
        header: resolvedHeader,
        cellValue: cellValue is String ? cellValue : jsonEncode(cellValue),
      );
    }).toList();

    // Step 1: Resolve data source from either 'rows' or 'source' (both should point to same data)
    List<dynamic> sourceList = [];

    // Prefer 'rows' if specified, fallback to 'source'
    final dataSourceKey = data['rows'] ?? data['source'];

    if (dataSourceKey != null) {
      final rowsKey = dataSourceKey.toString();

      // Strip {{ }} if present
      String cleanKey = rowsKey;

      // Case 1: Singleton path
      if (cleanKey.startsWith("singleton")) {
        final resolved =
            resolveValueRaw("{{ $cleanKey }}", null, screenKey: screenKey);
        if (resolved is List) {
          sourceList = resolved;
        } else if (resolved != null) {
          sourceList = [resolved];
        }
      }
      // Case 2: If the current item already has this source (table inside listView)
      else if (crudCtx?.item != null && (crudCtx!.item?[cleanKey] != null)) {
        final localSource =
            resolveValueRaw(cleanKey, crudCtx.item, screenKey: screenKey);
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
            resolveValueRaw(rowsKey, stateData.rawState, screenKey: screenKey);
        if (localSource is List) {
          sourceList = localSource;
        } else if (localSource != null) {
          sourceList = [localSource];
        }
      }
    }

    if (sourceList.isEmpty) return const SizedBox.shrink();

    final rows = sourceList.asMap().entries.map((entry) {
      final rowItem = entry.value;

      return DigitTableRow(
        tableRow: rawColumns.asMap().entries.map((entry) {
          final colIndex = entry.key;
          final colConfig = entry.value;

          // Get the raw cellValue configuration
          final rawCellValue = colConfig['cellValue'];

          // For cell value resolution, we need to pass rowItem as the contextData
          // The resolveTemplate/resolveValueRaw handles {{item.field}} by stripping "item." prefix
          final cellValue = ConditionalEvaluator.evaluate(rawCellValue, rowItem,
              screenKey: screenKey);

          // cellValue should already be resolved by ConditionalEvaluator
          // Just convert to string
          final finalText = cellValue?.toString() ?? '';

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
