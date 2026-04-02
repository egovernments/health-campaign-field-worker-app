import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/action_handler/executors/action_executor.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomDataExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'CUSTOM_DATA';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final screenKey = getEffectiveScreenKey(context, contextData);
    final compositeKey = contextData['_compositeKey']?.toString() ??
        getCompositeKey(context, screenKey: screenKey) ??
        screenKey ??
        '';

    final currentState = FlowCrudStateRegistry().get(compositeKey);
    final widgetData =
        Map<String, dynamic>.from(currentState?.widgetData ?? {});

    // Get Data from action properties
    Map<String, dynamic>? widgetDataMap =
        action.properties['widgetData'] == null
            ? null
            : resolveValue(action.properties['widgetData'], contextData);
    final List<EntityModel> entities = action.properties['entities'] == null
        ? []
        : resolveValue(action.properties['entities'], contextData);

    //Add WidgetData Data
    if (widgetDataMap != null) {
      widgetData.addAll(widgetDataMap);
    }
    //Triggers ValueListenable rebuild → widget refreshes immediately
    FlowCrudStateRegistry().update(
      compositeKey,
      (currentState ?? const FlowCrudState()).copyWith(widgetData: widgetData),
    );

    if (entities.isNotEmpty) return {...contextData, 'entities': entities};
    return {...contextData};
  }
}
