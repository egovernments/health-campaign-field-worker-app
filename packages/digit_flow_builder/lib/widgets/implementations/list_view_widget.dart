import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/theme/spacers.dart';
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
      if (dataSourceKey.startsWith('item.')) {
        final fieldPath = dataSourceKey.substring(5);
        final currentItem = crudCtx?.item;
        items = currentItem != null
            ? _resolveNestedField(currentItem, fieldPath)
            : [];
      } else {
        items = rawState[0]?[dataSourceKey];
      }
    }

    if (items == null || (items is List && items.isEmpty)) {
      return const SizedBox.shrink();
    }

    // 🔹 Read spacing property (e.g., "spacer4")
    final properties = json['properties'] as Map<String, dynamic>?;
    final spacingKey = properties?['spacing']?.toString();
    final double spacing = _mapSpacingValue(context, spacingKey);

    final widgets = <Widget>[];

    for (int index = 0; index < items.length; index++) {
      final item = items[index];
      Map<String, dynamic> safeItem;

      if (item is Map) {
        safeItem = Map<String, dynamic>.from(
          item.map((k, v) => MapEntry(k.toString(), v)),
        );
      } else if (item is EntityModel) {
        safeItem = item.toMap();
      } else {
        safeItem = <String, dynamic>{};
      }

      final childJson = Map<String, dynamic>.from(json['child'] as Map);
      final processedChild = preprocessConfigWithState(
        childJson,
        stateData!,
        listIndex: index,
        item: safeItem,
      );

      final mappedChild = LayoutMapper.map(
        processedChild,
        stateData,
        context,
        onAction,
        item: safeItem,
        listIndex: index,
      );

      if (mappedChild is SizedBox &&
          mappedChild.width == 0.0 &&
          mappedChild.height == 0.0) continue;

      // 🔹 Add spacing below each item except the last
      widgets.add(
        CrudItemContext(
          stateData: stateData,
          listIndex: index,
          item: safeItem,
          screenKey: crudCtx?.screenKey,
          child: Column(
            children: [
              mappedChild,
              if (index < items.length - 1 && spacing > 0)
                SizedBox(height: spacing),
            ],
          ),
        ),
      );
    }

    if (widgets.isEmpty) return const SizedBox.shrink();

    return Column(children: widgets);
  }

  // 🔹 Map your "spacer" keywords to actual pixel values
  double _mapSpacingValue(BuildContext context, String? key) {
    switch (key) {
      case 'spacer1':
        return spacer1;
      case 'spacer2':
        return spacer2;
      case 'spacer3':
        return spacer3;
      case 'spacer4':
        return spacer4;
      case 'spacer5':
        return spacer5;
      case 'spacer6':
        return spacer6;
      case 'spacer7':
        return spacer7;
      case 'spacer8':
        return spacer8;
      default:
        return 0.0;
    }
  }

  dynamic _resolveNestedField(Map<String, dynamic> item, String fieldPath) {
    final parts = fieldPath.split('.');
    dynamic current = item;

    for (final part in parts) {
      if (current == null) return null;
      if (current is Map) {
        current = current[part];
      } else if (current is EntityModel) {
        try {
          current = current.toMap()[part];
        } catch (_) {
          return null;
        }
      } else {
        return null;
      }
    }
    return current;
  }
}
