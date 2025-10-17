import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class ListViewWidget implements FlowWidget {
  @override
  String get format => 'listView';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final stateData = crudCtx?.stateData;

    final dataSourceKey = json['dataSource'] as String?;
    final rawState = stateData?.rawState ?? [];
    var items = rawState;

    if (dataSourceKey != null && rawState.isNotEmpty) {
      // Handle nested data sources like "item.items"
      if (dataSourceKey.startsWith('item.')) {
        final fieldPath = dataSourceKey.substring(5); // Remove "item."
        final currentItem = crudCtx?.item;
        if (currentItem != null) {
          items = _resolveNestedField(currentItem, fieldPath);
        } else {
          items = [];
        }
      } else {
        items = rawState[0]?[dataSourceKey];
      }
    }

    if (items == null || (items is List && items.isEmpty)) return const SizedBox.shrink();

    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];

        // Handle different item types: Map, EntityModel, or other
        Map<String, dynamic> safeItem;

        if (item is Map) {
          safeItem = Map<String, dynamic>.from(
            item.map((k, v) => MapEntry(k.toString(), v)),
          );
        } else if (item is EntityModel) {
          // Convert EntityModel to Map
          safeItem = item.toMap();
        } else {
          // Fallback: empty map
          safeItem = <String, dynamic>{};
        }

        final childJson = Map<String, dynamic>.from(json['child'] as Map);
        final processedChild = preprocessConfigWithState(
          childJson,
          stateData!,
          listIndex: index,
          item: safeItem,
        );

        return CrudItemContext(
          stateData: stateData,
          listIndex: index,
          item: safeItem,
          screenKey: crudCtx?.screenKey,
          child: LayoutMapper.map(processedChild, stateData, context, onAction,
              item: safeItem, listIndex: index),
        );
      }).expand((widget) => [widget, const SizedBox(height: 8)]).toList()
        ..removeLast(),
    );
  }

  /// Resolves nested field paths like "items" from a map
  dynamic _resolveNestedField(Map<String, dynamic> item, String fieldPath) {
    final parts = fieldPath.split('.');
    dynamic current = item;

    for (final part in parts) {
      if (current == null) return null;

      if (current is Map) {
        current = current[part];
      } else if (current is EntityModel) {
        try {
          final map = current.toMap();
          current = map[part];
        } catch (e) {
          return null;
        }
      } else {
        return null;
      }
    }

    return current;
  }
}
