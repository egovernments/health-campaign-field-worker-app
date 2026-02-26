import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/interpolation.dart';
import '../../utils/widget_parsers.dart';
import '../../widget_registry.dart';
import '../resolved_flow_widget.dart';

class RowWidget extends ResolvedFlowWidget {
  @override
  String get format => 'row';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final stateData = resolved.stateData;
    final props = Map<String, dynamic>.from(json['properties'] ?? {});

    return WidgetParsers.wrapWithBottomGap(
      Row(
        mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
        mainAxisAlignment: WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
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
                item: resolved.state.itemData, listIndex: resolved.state.listIndex,
                compositeKey: resolved.compositeKey),
          );
        }).toList(),
      ),
      props,
    );
  }
}
