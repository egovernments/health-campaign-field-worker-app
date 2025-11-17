import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/interpolation.dart';
import '../../utils/widget_parsers.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class RowWidget implements FlowWidget {
  @override
  String get format => 'row';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final stateData = crudCtx?.stateData;
    final props = Map<String, dynamic>.from(json['properties'] ?? {});

    return Row(
      mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
      mainAxisAlignment: WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
      children: (json['children'] as List).map<Widget>((childJson) {
        final processedChild = stateData != null
            ? preprocessConfigWithState(
                Map<String, dynamic>.from(childJson),
                stateData,
                listIndex: crudCtx?.listIndex,
                item: crudCtx?.item,
              )
            : Map<String, dynamic>.from(childJson);

        return CrudItemContext(
          stateData: stateData,
          listIndex: crudCtx?.listIndex,
          item: crudCtx?.item,
          screenKey: crudCtx?.screenKey,
          child: LayoutMapper.map(processedChild, stateData, context, onAction,
              item: crudCtx?.item, listIndex: crudCtx?.listIndex),
        );
      }).toList(),
    );
  }
}
