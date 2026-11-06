import 'package:digit_flow_builder/layout_renderer.dart';
import 'package:digit_flow_builder/utils/flow_widget_state.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_flow_builder/widget_registry.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../flow_widget_interface.dart';

class SizedBoxWidget implements FlowWidget {
  @override
  String get format => 'sizedBox';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final flowState = WidgetStateContext.of(context);
    final crudCtx = CrudItemContext.of(context);
    final stateData = flowState.stateData;
    var childJson = json['child'];
    if (childJson == null) {
      return SizedBox(
        width: json['width'],
        height: json['height'],
      );
    }
    final processed = stateData != null
        ? preprocessConfigWithState(
            Map<String, dynamic>.from(childJson),
            stateData,
            listIndex: crudCtx?.listIndex,
            item: crudCtx?.item,
          )
        : Map<String, dynamic>.from(childJson);

    return SizedBox(
      width: json['width'],
      height: json['height'],
      child: CrudItemContext(
        stateData: stateData,
        listIndex: crudCtx?.listIndex,
        item: crudCtx?.item,
        screenKey: crudCtx?.screenKey,
        compositeKey: flowState.compositeKey,
        child: LayoutMapper.map(processed, stateData, context, onAction,
            item: crudCtx?.item,
            listIndex: crudCtx?.listIndex,
            compositeKey: flowState.compositeKey),
      ),
    );
  }
}
