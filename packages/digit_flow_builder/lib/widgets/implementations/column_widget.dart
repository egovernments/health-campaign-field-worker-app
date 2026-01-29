import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class ColumnWidget implements FlowWidget {
  @override
  String get format => 'column';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final flowState = WidgetStateContext.of(context);
    final stateData = flowState.stateData;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              listIndex: flowState.listIndex, item: flowState.itemData),
        );
      }).toList(),
    );
  }
}
