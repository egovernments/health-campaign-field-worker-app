import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../resolved_flow_widget.dart';

class VisibilityWidget extends ResolvedFlowWidget {
  @override
  String get format => 'visibility';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final visible = json['visible'];
    final flowState = WidgetStateContext.of(context);
    final crudCtx = CrudItemContext.of(context);
    final stateData = flowState.stateData;
    var childJson = json['child'];
    final processed = stateData != null
        ? preprocessConfigWithState(
            Map<String, dynamic>.from(childJson),
            stateData,
            listIndex: crudCtx?.listIndex,
            item: crudCtx?.item,
          )
        : Map<String, dynamic>.from(childJson);

    return Visibility(
        visible: visible,
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
        ));
  }
}
