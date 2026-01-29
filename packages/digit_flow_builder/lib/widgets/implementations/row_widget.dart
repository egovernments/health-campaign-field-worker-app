import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/flow_widget_state.dart';
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
    final flowState = WidgetStateContext.of(context);
    final stateData = flowState.stateData;
    final props = Map<String, dynamic>.from(json['properties'] ?? {});

    return WidgetParsers.wrapWithBottomGap(
      Row(
        mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
        mainAxisAlignment: WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
        children: (json['children'] as List).map<Widget>((childJson) {
          final processedChild = stateData != null
              ? preprocessConfigWithState(
                  Map<String, dynamic>.from(childJson),
                  stateData,
                  listIndex: flowState.listIndex,
                  item: flowState.itemData,
                )
              : Map<String, dynamic>.from(childJson);

          return CrudItemContext(
            stateData: stateData,
            listIndex: flowState.listIndex,
            item: flowState.itemData,
            screenKey: flowState.screenKey,
            child: LayoutMapper.map(processedChild, stateData, context, onAction,
                item: flowState.itemData, listIndex: flowState.listIndex),
          );
        }).toList(),
      ),
      props,
    );
  }
}
