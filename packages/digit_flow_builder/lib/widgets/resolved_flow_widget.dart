import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';

import '../action_handler/action_config.dart';
import '../action_handler/action_handler.dart';
import '../blocs/flow_crud_bloc.dart';
import '../utils/conditional_evaluator.dart';
import '../utils/flow_widget_state.dart';
import '../utils/interpolation.dart';
import '../utils/utils.dart';
import '../widget_registry.dart';
import 'flow_widget_interface.dart';
import 'localization_context.dart';

/// Pre-resolved context available to all widgets that extend [ResolvedFlowWidget].
///
/// Contains the resolved state, localization, visibility/disabled status,
/// pre-resolved label/description, and helper methods for template resolution
/// and action handling.
class ResolvedWidgetContext {
  final WidgetStateContext state;
  final dynamic localization;
  final bool isDisabled;
  final String? resolvedLabel;
  final String? resolvedDescription;

  ResolvedWidgetContext({
    required this.state,
    required this.localization,
    this.isDisabled = false,
    this.resolvedLabel,
    this.resolvedDescription,
  });

  // ── Convenience accessors ──────────────────────────────────────────────

  Map<String, dynamic> get evalContext => state.evalContext;
  CrudStateData? get stateData => state.stateData;
  String? get screenKey => state.screenKey;
  String? get compositeKey => state.compositeKey;
  Map<String, dynamic> get formData => state.formData;
  Map<String, dynamic> get widgetData => state.widgetData;

  // ── Template resolution helpers ────────────────────────────────────────

  /// Resolves a template string with the current evaluation context
  /// and localization. Returns the original string if resolution fails.
  String resolveText(String? template) {
    if (template == null || template.isEmpty) return '';
    return resolveTemplate(
          template,
          evalContext,
          localization: localization,
          screenKey: screenKey,
          stateData: stateData,
        ) ??
        template;
  }

  /// Resolves a template using interpolateWithCrudStates (for complex templates
  /// with list index support), then falls back to resolveTemplate.
  String resolveTextWithCrudStates(String? template) {
    if (template == null || template.isEmpty) return '';
    if (stateData != null && template.contains('{{')) {
      final resolved = interpolateWithCrudStates(
        template: template,
        stateData: stateData!,
        item: state.itemData,
      );
      if (!resolved.contains('{{')) {
        return localization?.translate(resolved) ?? resolved;
      }
      return resolved;
    }
    return resolveText(template);
  }

  /// Resolves a value (preserving its actual type: int, bool, List, etc.).
  dynamic resolveField(dynamic value) {
    if (value == null) return null;
    return resolveValue(value, evalContext, screenKey: screenKey);
  }

  /// Resolves a value using resolveValueRaw for type-preserved resolution.
  dynamic resolveFieldRaw(dynamic value) {
    if (value == null) return null;
    return resolveValueRaw(
      value,
      evalContext,
      screenKey: compositeKey,
      stateData: stateData,
    );
  }

  /// Evaluates a conditional value (supports @condition configs and expressions).
  dynamic evaluateCondition(dynamic value) {
    return ConditionalEvaluator.evaluate(
      value,
      evalContext,
      screenKey: screenKey,
      stateData: stateData,
    );
  }

  // ── Action resolution helpers ──────────────────────────────────────────

  /// Returns an evalContext with the latest widgetData/formData from the
  /// registry (not stale build-time data).
  Map<String, dynamic> getFreshEvalContext() {
    final key = compositeKey ?? screenKey;
    final registryState =
        key != null ? FlowCrudStateRegistry().get(key) : null;
    final currentWidgetData = registryState?.widgetData ?? widgetData;
    final currentFormData = registryState?.formData ?? formData;

    return <String, dynamic>{
      ...evalContext,
      ...currentFormData,
      ...currentWidgetData,
      'widgetData': currentWidgetData,
      'formData': currentFormData,
    };
  }

  /// Resolves navigation data values within an action JSON map.
  /// Returns a new map with resolved 'data' entries in properties.
  Map<String, dynamic> resolveActionNavData(
    Map<String, dynamic> actionJson,
    Map<String, dynamic> currentEvalContext,
  ) {
    var action = ActionConfig.fromJson(actionJson);
    final navData = action.properties['data'] as List<dynamic>?;

    if (navData == null) return actionJson;

    final key = compositeKey ?? screenKey;
    final registryState =
        key != null ? FlowCrudStateRegistry().get(key) : null;
    final currentWidgetData = registryState?.widgetData ?? widgetData;
    final currentFormData = registryState?.formData ?? formData;

    final resolvedData = navData.map((entry) {
      final rawValue = entry['value'];

      // Try evalContext first, then widgetData, then formData
      dynamic resolvedValue = resolveValue(rawValue, currentEvalContext) ?? rawValue;

      if (resolvedValue == rawValue && currentWidgetData.isNotEmpty) {
        resolvedValue = resolveValue(rawValue, currentWidgetData);
      }

      if (resolvedValue == rawValue && currentFormData.isNotEmpty) {
        resolvedValue = resolveValue(rawValue, currentFormData);
      }

      return {
        ...Map<String, dynamic>.from(entry),
        "value": resolvedValue ?? rawValue,
      };
    }).toList();

    return {
      ...actionJson,
      'properties': {
        ...action.properties,
        'data': resolvedData,
      },
    };
  }

  /// Resolves condition expression templates within an action JSON map.
  /// Returns a new map with the resolved condition expression.
  Map<String, dynamic> resolveActionCondition(
    Map<String, dynamic> actionJson,
    Map<String, dynamic> currentEvalContext,
  ) {
    if (actionJson['condition'] == null) return actionJson;

    final condition = Map<String, dynamic>.from(actionJson['condition']);
    final expression = condition['expression'] as String?;

    if (expression == null || !expression.contains('{{')) return actionJson;

    String resolvedExpression =
        resolveTemplate(expression, currentEvalContext) ?? expression;
    if (resolvedExpression == expression && stateData != null) {
      resolvedExpression = resolveValueRaw(expression, currentEvalContext);
    }
    condition['expression'] = resolvedExpression;

    return {
      ...actionJson,
      'condition': condition,
    };
  }

  /// Fully resolves and executes a list of actions.
  ///
  /// This encapsulates the common pattern found in button_widget, card_widget, etc.:
  /// 1. Read fresh state from registry
  /// 2. Resolve nav data and conditions for all actions
  /// 3. Build initial context with navigation params
  /// 4. Call ActionHandler.executeActions
  Future<void> executeActions(
    List<Map<String, dynamic>>? actionsJson,
    BuildContext context,
  ) async {
    if (actionsJson == null || actionsJson.isEmpty) return;

    final currentEvalContext = getFreshEvalContext();

    // Resolve nav data and conditions for all actions
    final resolvedActionsList = actionsJson.map((actionJson) {
      var resolved = Map<String, dynamic>.from(actionJson);

      // Resolve condition expression
      resolved = resolveActionCondition(resolved, currentEvalContext);

      // Handle nested actions array (conditional action blocks)
      if (actionJson['actions'] != null) {
        final nestedActions =
            List<Map<String, dynamic>>.from(actionJson['actions']);
        final resolvedNested = nestedActions.map((nested) {
          return resolveActionNavData(
              Map<String, dynamic>.from(nested), currentEvalContext);
        }).toList();
        resolved['actions'] = resolvedNested;
      } else {
        resolved = resolveActionNavData(resolved, currentEvalContext);
      }

      return resolved;
    }).toList();

    // Build initial context with navigation params
    final key = compositeKey ?? screenKey;
    final navigationParams = screenKey != null
        ? FlowCrudStateRegistry().getNavigationParams(key ?? screenKey!) ??
            FlowCrudStateRegistry()
                .getNavigationParams(screenKey!.split('::').last) ??
            {}
        : <String, dynamic>{};

    // Get entities from registry state (from initActions SEARCH_EVENT)
    final registryState = key != null ? FlowCrudStateRegistry().get(key) : null;
    List<EntityModel> entities = [];
    final base = registryState?.base;
    if (base is CrudStateLoaded) {
      for (final entityList in base.results.values) {
        entities.addAll(entityList);
      }
    }
    if (entities.isEmpty) {
      final wrapper = registryState?.stateWrapper;
      if (wrapper is List) {
        entities = wrapper.whereType<EntityModel>().toList();
      }
    }

    final initialContextData = <String, dynamic>{
      'wrappers': const [],
      ...currentEvalContext,
      'navigation': navigationParams,
      if (entities.isNotEmpty) 'entities': entities,
    };

    await ActionHandler.executeActions(
      resolvedActionsList,
      context,
      initialContextData,
    );
  }

  /// Resolves a single action and returns the ActionConfig.
  /// Useful for widgets that trigger actions individually (menu_card, card).
  ActionConfig resolveAction(
    Map<String, dynamic> actionJson,
    Map<String, dynamic> currentEvalContext,
  ) {
    final resolved = resolveActionNavData(actionJson, currentEvalContext);
    return ActionConfig.fromJson(resolved);
  }
}

/// Abstract base class for flow widgets that auto-resolves common concerns.
///
/// Handles:
/// - State context setup (WidgetStateContext.of)
/// - Localization lookup
/// - Visibility check (json['visible'])
/// - Disabled check (json['disabled'])
/// - Label/description template resolution
///
/// Subclasses override [buildResolved] instead of [build].
///
/// Example:
/// ```dart
/// class TextWidget extends ResolvedFlowWidget {
///   @override
///   String get format => 'textTemplate';
///
///   @override
///   Widget buildResolved(json, context, onAction, resolved) {
///     return Text(resolved.resolvedLabel ?? '');
///   }
/// }
/// ```
abstract class ResolvedFlowWidget implements FlowWidget {
  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final state = WidgetStateContext.of(context);
    final localization = LocalizationContext.maybeOf(context);

    // Auto-resolve visibility
    if (json['visible'] != null) {
      final visible = ConditionalEvaluator.evaluate(
        json['visible'],
        state.evalContext,
        screenKey: state.screenKey,
        stateData: state.stateData,
        widgetdata: state.widgetData
      );
      if (visible == false) {
        return const SizedBox.shrink();
      }
    }

    // Auto-resolve disabled state
    bool isDisabled = false;
    if (json['disabled'] != null) {
      final disabledResult = ConditionalEvaluator.evaluate(
        json['disabled'],
        state.evalContext,
        screenKey: state.screenKey,
        stateData: state.stateData,
          widgetdata: state.widgetData
      );
      isDisabled = disabledResult == true;
    }

    // Auto-resolve label and description templates
    final labelText = json['label'] as String?;
    String? resolvedLabel;
    if (labelText != null && labelText.isNotEmpty) {
      if (state.stateData != null && labelText.contains('{{')) {
        resolvedLabel = interpolateWithCrudStates(
          template: labelText,
          stateData: state.stateData!,
          item: state.itemData,
        );
        if (!resolvedLabel.contains('{{')) {
          resolvedLabel = localization?.translate(resolvedLabel) ?? resolvedLabel;
        }
      } else {
        resolvedLabel = resolveTemplate(
              labelText,
              state.evalContext,
              localization: localization,
              screenKey: state.screenKey,
              stateData: state.stateData,
            ) ??
            labelText;
      }
    }

    final descriptionText = json['description'] as String?;
    String? resolvedDescription;
    if (descriptionText != null && descriptionText.isNotEmpty) {
      resolvedDescription = resolveTemplate(
            descriptionText,
            state.evalContext,
            localization: localization,
            screenKey: state.screenKey,
            stateData: state.stateData,
          ) ??
          descriptionText;
    }

    final resolved = ResolvedWidgetContext(
      state: state,
      localization: localization,
      isDisabled: isDisabled,
      resolvedLabel: resolvedLabel,
      resolvedDescription: resolvedDescription,
    );

    return buildResolved(json, context, onAction, resolved);
  }

  /// Override this method to build the widget UI.
  ///
  /// Visibility, disabled state, label and description are already resolved
  /// in [resolved]. Use the helper methods on [ResolvedWidgetContext] for
  /// additional template resolution and action handling.
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  );
}
