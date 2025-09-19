import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/interpolation.dart';
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
      mainAxisSize: _parseMainAxisSize(props['mainAxisSize']),
      mainAxisAlignment: _parseMainAxisAlignment(props['mainAxisAlignment']),
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
          child: LayoutMapper.map(
              processedChild, stateData, context, onAction,
              item: crudCtx?.item, listIndex: crudCtx?.listIndex),
        );
      }).toList(),
    );
  }

  MainAxisSize _parseMainAxisSize(String? size) {
    switch (size) {
      case 'max':
        return MainAxisSize.max;
      case 'min':
        return MainAxisSize.min;
      default:
        return MainAxisSize.min;
    }
  }

  MainAxisAlignment _parseMainAxisAlignment(String? alignment) {
    switch (alignment) {
      case 'start':
        return MainAxisAlignment.start;
      case 'center':
        return MainAxisAlignment.center;
      case 'end':
        return MainAxisAlignment.end;
      case 'spaceBetween':
        return MainAxisAlignment.spaceBetween;
      default:
        return MainAxisAlignment.start;
    }
  }
}