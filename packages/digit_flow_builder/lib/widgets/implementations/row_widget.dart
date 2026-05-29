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
    final childrenList = json['children'] as List;
    final isSpaceBetween = props['mainAxisAlignment'] == 'spaceBetween';
    final hasMultipleChildren = childrenList.length > 1;

    return WidgetParsers.wrapWithBottomGap(
      Row(
        mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
        mainAxisAlignment: WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: childrenList.map<Widget>((childJson) {
          final processedChild = stateData != null
              ? preprocessConfigWithState(
                  Map<String, dynamic>.from(childJson),
                  stateData,
                  listIndex: resolved.state.listIndex,
                  item: resolved.state.itemData,
                )
              : Map<String, dynamic>.from(childJson);

          final flex = processedChild['flex'];
          final flexValue = flex is int ? flex : (flex is String ? int.tryParse(flex) : null);
          final childFormat = processedChild['format']?.toString() ?? '';
          final isActionChild = childFormat == 'button' || childFormat == 'actionPopup';

          Widget child = CrudItemContext(
            stateData: stateData,
            listIndex: resolved.state.listIndex,
            item: resolved.state.itemData,
            screenKey: resolved.screenKey,
            compositeKey: resolved.compositeKey,
            child: LayoutMapper.map(processedChild, stateData, context, onAction,
                item: resolved.state.itemData, listIndex: resolved.state.listIndex,
                compositeKey: resolved.compositeKey),
          );

          if (flexValue != null) {
            child = Expanded(flex: flexValue, child: child);
          } else if (isSpaceBetween && hasMultipleChildren && !isActionChild) {
            child = Expanded(child: child);
          }

          return child;
        }).toList(),
      ),
      props,
    );
  }
}
