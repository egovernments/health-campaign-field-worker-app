import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_info_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class InfoCardWidget implements FlowWidget {
  @override
  String get format => 'infoCard';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
    // Use compositeKey for registry operations (includes instanceId for proper isolation)
    final compositeKey = crudCtx?.compositeKey ?? getCompositeKey(context, screenKey: screenKey);

    // If no compositeKey, build without state listening
    if (compositeKey == null) {
      return _buildInfoCard(json, context, crudCtx, {}, {});
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

        // Handle showOnEmptySearch: only show when a search completed with no results
        final showOnEmptySearch = json['showOnEmptySearch'] == true;
        if (showOnEmptySearch) {
          final base = flowState?.base;
          final stateWrapper = flowState?.stateWrapper;
          // Show only when search has completed (CrudStateLoaded) and results are empty
          final hasSearchCompleted = base is CrudStateLoaded;
          final hasNoResults = stateWrapper == null || stateWrapper.isEmpty;
          if (!hasSearchCompleted || !hasNoResults) {
            return const SizedBox.shrink();
          }
        }

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

        // Check visible condition
        if (json['visible'] != null) {
          final visibleResult = ConditionalEvaluator.evaluate(
            json['visible'],
            evalContext,
            screenKey: compositeKey,
            stateData: crudCtx?.stateData,
          );
          if (visibleResult == false) {
            return const SizedBox.shrink();
          }
        }

        return _buildInfoCard(json, context, crudCtx, widgetData, formData);
      },
    );
  }

  Widget _buildInfoCard(
    Map<String, dynamic> json,
    BuildContext context,
    CrudItemContext? crudCtx,
    Map<String, dynamic> widgetData,
    Map<String, dynamic> formData,
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

    final localization = LocalizationContext.maybeOf(context);

    return InfoCard(
      type: infoType,
      title:
          localization?.translate(json['label'] ?? '') ?? (json['label'] ?? ''),
      description: localization?.translate(json['description'] ?? '') ??
          (json['description'] ?? ''),
    );
  }
}
