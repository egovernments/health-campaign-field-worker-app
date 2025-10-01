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
      items = rawState[0]?[dataSourceKey];
    }

    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      children: List.generate(items.length, (index) {
        final safeItem = (items[index] is Map)
            ? Map<String, dynamic>.from(
                (items[index] as Map).map((k, v) => MapEntry(k.toString(), v)),
              )
            : <String, dynamic>{};

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
}
