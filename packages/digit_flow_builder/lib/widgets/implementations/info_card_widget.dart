import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_info_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/conditional_evaluator.dart';
import '../../widget_registry.dart';
import '../resolved_flow_widget.dart';

class InfoCardWidget extends ResolvedFlowWidget {
  @override
  String get format => 'infoCard';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final compositeKey = resolved.compositeKey;

    // If no compositeKey, build without state listening
    if (compositeKey == null) {
      return _buildInfoCard(json, context, resolved);
    }

    // Wrap in ValueListenableBuilder to react to state changes
    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable: FlowCrudStateRegistry().listen(compositeKey),
      builder: (context, flowState, _) {
        final widgetData = flowState?.widgetData ?? {};
        final formData = flowState?.formData ?? {};
        final modelMap = crudCtx?.stateData?.modelMap ?? {};

        // Create evaluation context
        final evalContext = {
          'item': crudCtx?.item,
          'contextData': crudCtx?.stateData?.rawState ?? {},
          'context': modelMap,
          ...modelMap,
          ...formData,
          ...widgetData,
        };

        // Check hidden condition
        if (json['hidden'] != null) {
          final hiddenResult = ConditionalEvaluator.evaluate(
            json['hidden'],
            evalContext,
            screenKey: compositeKey,
            stateData: crudCtx?.stateData,
          );
          if (hiddenResult == true) {
            return const SizedBox.shrink();
          }
        }

        return _buildInfoCard(json, context, resolved);
      },
    );
  }

  Widget _buildInfoCard(
    Map<String, dynamic> json,
    BuildContext context,
    ResolvedWidgetContext resolved,
  ) {
    // Determine info type from config (default to info)
    final typeString =
        json['properties']?['type']?.toString().toLowerCase() ?? 'info';
    final infoType = typeString == 'error'
        ? InfoType.error
        : typeString == 'warning'
            ? InfoType.warning
            : typeString == 'success'
                ? InfoType.success
                : InfoType.info;

    return InfoCard(
      type: infoType,
      title: resolved.resolvedLabel ?? (json['label'] ?? ''),
      description: resolved.resolvedDescription ?? (json['description'] ?? ''),
    );
  }
}
