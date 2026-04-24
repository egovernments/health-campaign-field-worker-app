import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../blocs/flow_crud_bloc.dart';
import '../widget_registry.dart';
import 'interpolation.dart';

/// Unified state context for flow widgets.
///
/// Can be used directly with resolveValue via `toMap()` - template keys:
/// - `{{itemData.field}}` - Current item in list/loop context
/// - `{{parentData.field}}` - Parent item data (resolved from item or rawState.first)
/// - `{{contextData.0.field}}` - Access raw state by index
/// - `{{formData.field}}` - Form field values from registry
/// - `{{widgetData.field}}` - Widget-specific state (filters, selections)
/// - `{{ModelName.field}}` - Access from model map directly (e.g., HouseholdModel)
///
/// Usage:
/// ```dart
/// final state = WidgetStateContext.of(context);
/// final resolved = resolveValue("{{itemData.name}}", state.toMap());
/// ```
class WidgetStateContext {
  /// Current item data (in list/loop context).
  /// Use template: `{{itemData.fieldName}}`
  final Map<String, dynamic>? itemData;

  /// Parent/fallback item data.
  /// Resolved from item if not empty, otherwise from contextData.first.
  /// Use template: `{{parentData.fieldName}}`
  final Map<String, dynamic>? parentData;

  /// Complete raw state (all entities).
  /// Use template: `{{contextData.0.fieldName}}` for indexed access.
  final List<dynamic>? contextData;

  /// Form field values from the screen registry.
  /// Use template: `{{formData.fieldName}}`
  final Map<String, dynamic> formData;

  /// Widget-specific state (filters, selections, temporary state).
  /// Use template: `{{widgetData.fieldName}}`
  final Map<String, dynamic> widgetData;

  /// Model map for grouped entities by type.
  /// Use template: `{{ModelName.fieldName}}` (e.g., `{{HouseholdModel.name}}`)
  final Map<String, List<Map<String, dynamic>>> modelMap;

  /// The screen key for this widget context.
  final String? screenKey;

  /// The composite key (screenKey::instanceId) for FlowCrudStateRegistry operations.
  final String? compositeKey;

  /// Current list index (when in a list context).
  final int? listIndex;

  /// The raw CrudStateData object (for advanced use cases).
  final CrudStateData? stateData;

  /// Cached evaluation context map for use with resolveValue/resolveTemplate.
  /// This is the primary way to pass context to template resolution functions.
  ///
  /// Contains all data sources with proper keys:
  /// - `itemData` - Current item in list/loop context
  /// - `parentData` - Parent/fallback item data
  /// - `contextData` - Complete raw state (list)
  /// - `formData` - Form field values
  /// - `widgetData` - Widget-specific state
  /// - `item` - Legacy alias for itemData
  /// - Plus all keys from modelMap spread at root level
  ///
  /// Usage:
  /// ```dart
  /// final state = WidgetStateContext.of(context);
  /// final value = resolveValue("{{itemData.name}}", state.evalContext);
  /// ```
  late final Map<String, dynamic> evalContext = _buildEvalContext();

  WidgetStateContext({
    this.itemData,
    this.parentData,
    this.contextData,
    this.formData = const {},
    this.widgetData = const {},
    this.modelMap = const {},
    this.screenKey,
    this.compositeKey,
    this.listIndex,
    this.stateData,
  });

  /// Builds the evaluation context map.
  Map<String, dynamic> _buildEvalContext() {
    return {
      'itemData': itemData,
      'parentData': parentData,
      'contextData': contextData,
      'formData': formData,
      'widgetData': widgetData,
      // Spread modelMap so {{ModelName.field}} works directly
      ...modelMap,
      // Legacy support for existing templates using 'item'
      'item': itemData,
    };
  }

  // =========================================================================
  // Backward-compatible getters (deprecated - use new names instead)
  // =========================================================================

  /// @deprecated Use [itemData] instead.
  Map<String, dynamic>? get currentData => itemData;

  /// @deprecated Use [parentData] instead.
  Map<String, dynamic>? get parentItemData => parentData;

  /// @deprecated Use [contextData] instead.
  List<dynamic>? get wholeData => contextData;

  /// @deprecated Use [evalContext] instead.
  /// Convert to evaluation context Map for use with resolveValue.
  Map<String, dynamic> toMap() => evalContext;

  /// Get the FlowWidgetState for the current context.
  ///
  /// Consolidates all repetitive state access into one call:
  /// ```dart
  /// // Before (10+ lines):
  /// final crudCtx = CrudItemContext.of(context);
  /// final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
  /// final currentState = FlowCrudStateRegistry().get(screenKey);
  /// final formData = currentState?.formData ?? {};
  /// final widgetData = currentState?.widgetData ?? {};
  /// final itemStateData = (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
  ///     ? crudCtx.item : crudCtx?.stateData?.rawState.first;
  ///
  /// // After (1 line):
  /// final state = WidgetStateContext.of(context);
  /// ```
  static WidgetStateContext of(BuildContext context) {
    final crudCtx = CrudItemContext.of(context);
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
    final compositeKey =
        crudCtx?.compositeKey ?? getCompositeKey(context, screenKey: screenKey);
    final registryState =
        compositeKey != null ? FlowCrudStateRegistry().get(compositeKey) : null;

    // Fetch navigation params and include in contextData
    final key = compositeKey ?? screenKey;
    final navigationParams = key != null
        ? FlowCrudStateRegistry().getNavigationParams(key) ??
            FlowCrudStateRegistry()
                .getNavigationParams(screenKey?.split('::').last ?? '')
        : null;

    final rawContextData = crudCtx?.stateData?.rawState;
    final enrichedContextData = rawContextData;

    return WidgetStateContext(
      itemData: crudCtx?.item,
      parentData: _resolveParentData(crudCtx),
      contextData: enrichedContextData,
      formData: registryState?.formData ?? {},
      widgetData: registryState?.widgetData ?? {},
      modelMap: crudCtx?.stateData?.modelMap ?? {},
      screenKey: screenKey,
      compositeKey: compositeKey,
      listIndex: crudCtx?.listIndex,
      stateData: crudCtx?.stateData,
    );
  }

  /// Resolve parent data from context.
  /// Returns item if not empty, otherwise first item from rawState.
  static Map<String, dynamic>? _resolveParentData(CrudItemContext? crudCtx) {
    if (crudCtx?.item != null && crudCtx!.item!.isNotEmpty) {
      return crudCtx.item;
    }

    if (crudCtx?.stateData?.rawState != null &&
        crudCtx!.stateData!.rawState.isNotEmpty) {
      final first = crudCtx.stateData!.rawState.first;
      if (first is Map<String, dynamic>) {
        return first;
      }
    }

    return null;
  }

  /// Listen to state changes (returns ValueListenable for reactive widgets).
  static ValueListenable<FlowCrudState?> listen(BuildContext context) {
    final crudCtx = CrudItemContext.of(context);
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
    final compositeKey =
        crudCtx?.compositeKey ?? getCompositeKey(context, screenKey: screenKey);
    return FlowCrudStateRegistry().listen(compositeKey ?? '');
  }

  /// Get screen key from context.
  static String? getScreenKey(BuildContext context) {
    final crudCtx = CrudItemContext.of(context);
    return crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
  }

  /// Update widgetData for this screen in the registry.
  void updateWidgetData(String key, dynamic value) {
    if (compositeKey == null) return;

    final currentState = FlowCrudStateRegistry().get(compositeKey!);
    final existing = Map<String, dynamic>.from(currentState?.widgetData ?? {});
    existing[key] = value;

    final updatedState = (currentState ?? const FlowCrudState()).copyWith(
      widgetData: existing,
    );
        FlowCrudStateRegistry().update(compositeKey!, updatedState);
  }

  /// Update multiple widgetData entries.
  void updateWidgetDataBatch(Map<String, dynamic> updates) {
    if (compositeKey == null) return;

    final currentState = FlowCrudStateRegistry().get(compositeKey!);
    final existing = Map<String, dynamic>.from(currentState?.widgetData ?? {});
    existing.addAll(updates);

    final updatedState = (currentState ?? const FlowCrudState()).copyWith(
      widgetData: existing,
    );
    FlowCrudStateRegistry().update(compositeKey!, updatedState);
  }

  /// Update formData for this screen in the registry.
  void updateFormData(String key, dynamic value) {
    if (compositeKey == null) return;

    final currentState = FlowCrudStateRegistry().get(compositeKey!);
    final existing = Map<String, dynamic>.from(currentState?.formData ?? {});
    existing[key] = value;

    final updatedState = (currentState ?? const FlowCrudState()).copyWith(
      formData: existing,
    );
    FlowCrudStateRegistry().update(compositeKey!, updatedState);
  }

  /// Update multiple formData entries.
  void updateFormDataBatch(Map<String, dynamic> updates) {
    if (compositeKey == null) return;

    final currentState = FlowCrudStateRegistry().get(compositeKey!);
    final existing = Map<String, dynamic>.from(currentState?.formData ?? {});
    existing.addAll(updates);

    final updatedState = (currentState ?? const FlowCrudState()).copyWith(
      formData: existing,
    );
    FlowCrudStateRegistry().update(compositeKey!, updatedState);
  }

  /// Build a reactive widget that rebuilds on state changes.
  static Widget reactive(
    BuildContext context,
    Widget Function(BuildContext, WidgetStateContext) builder,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
    final compositeKey =
        crudCtx?.compositeKey ?? getCompositeKey(context, screenKey: screenKey);

    if (compositeKey == null) {
      return builder(context, of(context));
    }

    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable: FlowCrudStateRegistry().listen(compositeKey),
      builder: (context, flowState, _) {
        final state = WidgetStateContext(
          itemData: crudCtx?.item,
          parentData: _resolveParentData(crudCtx),
          contextData: crudCtx?.stateData?.rawState,
          formData: flowState?.formData ?? {},
          widgetData: flowState?.widgetData ?? {},
          modelMap: crudCtx?.stateData?.modelMap ?? {},
          screenKey: screenKey,
          compositeKey: compositeKey,
          listIndex: crudCtx?.listIndex,
          stateData: crudCtx?.stateData,
        );
        return builder(context, state);
      },
    );
  }
}

// Legacy alias for backward compatibility during migration
typedef FlowWidgetState = WidgetStateContext;
typedef FlowWidgetStateAccessor = WidgetStateContext;
