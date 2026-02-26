import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../resolved_flow_widget.dart';

class ColumnWidget extends ResolvedFlowWidget {
  @override
  String get format => 'column';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final stateData = resolved.stateData;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: (json['children'] as List? ?? []).map<Widget>((childJson) {
        final processedChild = stateData != null
            ? preprocessConfigWithState(
                Map<String, dynamic>.from(childJson),
                stateData,
                listIndex: resolved.state.listIndex,
                item: resolved.state.itemData,
              )
            : Map<String, dynamic>.from(childJson);

        return CrudItemContext(
          stateData: stateData,
          listIndex: resolved.state.listIndex,
          item: resolved.state.itemData,
          screenKey: resolved.screenKey,
          compositeKey: resolved.compositeKey,
          child: LayoutMapper.map(processedChild, stateData, context, onAction,
              listIndex: resolved.state.listIndex, item: resolved.state.itemData,
              compositeKey: resolved.compositeKey),
        );
      }).toList(),
    );
  }
}
