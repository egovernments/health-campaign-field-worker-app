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
    final gap = (props['gap'] as num?)?.toDouble() ?? 0.0;
    final crossAxisAlignment = WidgetParsers.parseCrossAxisAlignment(props['crossAxisAlignment']);
    final useIntrinsicHeight = props['intrinsicHeight'] == true;

    final children = (json['children'] as List).map<Widget>((childJson) {
      final rawChild = Map<String, dynamic>.from(childJson);
      final flex = rawChild['flex'] as int?;

      final processedChild = stateData != null
          ? preprocessConfigWithState(
              rawChild,
              stateData,
              listIndex: resolved.state.listIndex,
              item: resolved.state.itemData,
            )
          : rawChild;

      Widget child = CrudItemContext(
        stateData: stateData,
        listIndex: resolved.state.listIndex,
        item: resolved.state.itemData,
        screenKey: resolved.screenKey,
        compositeKey: resolved.compositeKey,
        child: LayoutMapper.map(processedChild, stateData, context, onAction,
            item: resolved.state.itemData,
            listIndex: resolved.state.listIndex,
            compositeKey: resolved.compositeKey),
      );

      if (flex != null) child = Expanded(flex: flex, child: child);
      return child;
    }).toList();

    // Insert gap SizedBoxes between children
    final childrenWithGaps = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      if (i > 0 && gap > 0) childrenWithGaps.add(SizedBox(width: gap));
      childrenWithGaps.add(children[i]);
    }

    Widget row = Row(
      mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
      mainAxisAlignment: WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
      crossAxisAlignment: crossAxisAlignment,
      children: childrenWithGaps,
    );

    if (useIntrinsicHeight) row = IntrinsicHeight(child: row);

    return WidgetParsers.wrapWithBottomGap(row, props);
  }
}
