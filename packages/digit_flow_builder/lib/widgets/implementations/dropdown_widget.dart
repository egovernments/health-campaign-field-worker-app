import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class DropdownWidget implements FlowWidget {
  @override
  String get format => 'dropdownTemplate';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final localization = LocalizationContext.maybeOf(context);
    final state = WidgetStateContext.of(context);
    final crudCtx = CrudItemContext.of(context);

    final label = resolveTemplate(json['label'], state.evalContext,
            screenKey: state.screenKey, localization: localization) ??
        '';
    final key = (json['key'] ?? json['fieldName']) as String?;
    final isRequired = json['required'] == true;
    final visible = json['visible'] == null ||
        (json['visible'] is bool && json['visible'] == true) ||
        (json['visible'] is String &&
            resolveValue(json['visible'], state.evalContext,
                    screenKey: state.screenKey) ==
                true);

    if (!visible) {
      return const SizedBox.shrink();
    }

    final displayKey = json['displayKey'] as String? ?? 'name';
    final valueKey = json['valueKey'] as String? ?? 'id';

    // Use compositeKey for registry operations (includes instanceId for proper isolation)
    final compositeKey = state.compositeKey ?? state.screenKey;

    // If no compositeKey, fall back to non-reactive behavior
    if (compositeKey == null) {
      return _buildDropdownContent(
        json: json,
        context: context,
        onAction: onAction,
        localization: localization,
        crudCtx: crudCtx,
        compositeKey: compositeKey,
        evalContext: state.evalContext,
        label: label,
        key: key,
        isRequired: isRequired,
        displayKey: displayKey,
        valueKey: valueKey,
        formData: state.formData,
        widgetData: state.widgetData,
      );
    }

    // Wrap in ValueListenableBuilder to react to state changes
    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable: FlowCrudStateRegistry().listen(compositeKey),
      builder: (context, flowState, _) {
        final formData = flowState?.formData ?? {};
        final widgetData = flowState?.widgetData ?? {};

        // Rebuild evalContext with updated formData/widgetData from registry
        final updatedEvalContext = {
          ...state.evalContext,
          'formData': formData,
          'widgetData': widgetData,
        };

        return _buildDropdownContent(
          json: json,
          context: context,
          onAction: onAction,
          localization: localization,
          crudCtx: crudCtx,
          compositeKey: compositeKey,
          evalContext: updatedEvalContext,
          label: label,
          key: key,
          isRequired: isRequired,
          displayKey: displayKey,
          valueKey: valueKey,
          formData: formData,
          widgetData: widgetData,
        );
      },
    );
  }

  Widget _buildDropdownContent({
    required Map<String, dynamic> json,
    required BuildContext context,
    required void Function(ActionConfig) onAction,
    required dynamic localization,
    required CrudItemContext? crudCtx,
    required String? compositeKey,
    required Map<String, dynamic> evalContext,
    required String label,
    required String? key,
    required bool isRequired,
    required String displayKey,
    required String valueKey,
    required Map<String, dynamic> formData,
    required Map<String, dynamic> widgetData,
  }) {
    // Resolve source data (support both 'source' and 'enums' fields)
    dynamic sourceData;
    final sourceField = json['source'] ?? json['enums'];
    if (sourceField != null) {
      if (sourceField is String) {
        final sourceKey = sourceField as String;

        // Strip {{ }} if present
        String cleanKey = sourceKey;
        if (sourceKey.startsWith('{{') && sourceKey.endsWith('}}')) {
          cleanKey = sourceKey.substring(2, sourceKey.length - 2).trim();
        }

        // Case 0: Function call (fn:functionName(...))
        if (cleanKey.startsWith("fn:")) {
          // Use evalContext which already contains all data sources
          sourceData = resolveValueRaw(
            "{{ $cleanKey }}",
            evalContext,
            screenKey: compositeKey,
            stateData: crudCtx?.stateData,
          );
        }
        // Case 1: Singleton path
        else if (cleanKey.startsWith("singleton")) {
          sourceData =
              resolveValueRaw("{{ $cleanKey }}", null, screenKey: compositeKey);
        }
        // Case 2: Navigation path
        else if (cleanKey.startsWith("navigation.")) {
          // First check if we've cached this navigation data in formData
          final cacheKey = '_cached_$cleanKey';
          if (formData.containsKey(cacheKey)) {
            sourceData = formData[cacheKey];
          } else {
            // Get navigation params and add to evalContext
            final navigationParams = compositeKey != null
                ? FlowCrudStateRegistry().getNavigationParams(compositeKey)
                : null;
            final navContext = {
              ...evalContext,
              'navigation': navigationParams ?? {},
            };

            // Resolve from navigation context
            sourceData = resolveValueRaw("{{ $cleanKey }}", navContext,
                screenKey: compositeKey);

            // Cache the navigation data in formData to survive state updates
            if (sourceData != null && compositeKey != null) {
              final dataToCache = sourceData;
              final compositeKeyToCache = compositeKey;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                final currentStateForCache =
                    FlowCrudStateRegistry().get(compositeKeyToCache);
                final existingFormDataForCache =
                    currentStateForCache?.formData ?? {};
                final updatedFormDataForCache = {
                  ...existingFormDataForCache,
                  cacheKey: dataToCache,
                };
                final updatedStateForCache =
                    (currentStateForCache ?? const FlowCrudState()).copyWith(
                  formData: updatedFormDataForCache,
                );
                FlowCrudStateRegistry()
                    .update(compositeKeyToCache, updatedStateForCache);
              });
            }
          }
        }
        // Case 3: If the current item already has this source
        else if (crudCtx?.item != null && (crudCtx!.item?[cleanKey] != null)) {
          sourceData =
              resolveValueRaw(cleanKey, crudCtx.item, screenKey: compositeKey);
        }
        // Case 4: Try modelMap first (for grouped entities like ProjectFacilityModel)
        else if (crudCtx?.stateData?.modelMap != null &&
            crudCtx!.stateData!.modelMap.containsKey(cleanKey)) {
          sourceData = crudCtx.stateData!.modelMap[cleanKey];
        }
        // Case 5: Try rawState as map (wrapper output with groupByType)
        else if (crudCtx?.stateData?.rawState != null) {
          // rawState is a list of maps when groupByType is true
          // Try to find the key in the maps
          final rawState = crudCtx!.stateData!.rawState;
          if (rawState is List && rawState.isNotEmpty) {
            for (var item in rawState) {
              if (item is Map && item.containsKey(cleanKey)) {
                sourceData = item[cleanKey];
                break;
              }
            }
          }
          // Fallback: try resolveValueRaw
          sourceData ??=
              resolveValueRaw("{{ $cleanKey }}", rawState, screenKey: compositeKey);
        }
      }
      // Case 6: Direct array
      else if (sourceField is List) {
        sourceData = sourceField;
      }
    }

    // Get current selected value from state
    // Priority: widgetData (persisted selection) > evalContext (entity data) > formData
    dynamic currentValue;
    if (key != null) {
      // First check widgetData for persisted selection
      if (widgetData.containsKey(key)) {
        currentValue = widgetData[key];
      }
      else {
        // Then try evalContext (contains itemData, parentData, formData, etc.)
        currentValue =
            resolveValue('{{$key}}', evalContext, screenKey: compositeKey);
        // If not found, check formData directly
        if (currentValue == '{{$key}}' || currentValue == null) {
          currentValue = formData[key];
        }
      }
    }

    // Build dropdown items
    final items = _buildDropdownItems(sourceData, displayKey, valueKey, context);

    // Find selected item
    DropdownItem? selectedItem;
    if (currentValue != null) {
      selectedItem = items.firstWhere(
        (item) => item.code == currentValue.toString(),
        orElse: () => const DropdownItem(name: '', code: ''),
      );
      if (selectedItem.code.isEmpty) {
        selectedItem = null;
      }
    }

    return LabeledField(
      label: label,
      isRequired: isRequired,
      child: DigitDropdown(
        key: ValueKey('${compositeKey}_${key}_${currentValue ?? ''}'),
        selectedOption: selectedItem,
        sentenceCaseEnabled: true,
        items: items,
        emptyItemText: 'NO_OPTIONS_AVAILABLE',
        onSelect: (value) {
          // Update state
          if (key != null) {
            // Find the full object from sourceData
            Map<String, dynamic>? selectedObject;
            if (sourceData is List) {
              try {
                selectedObject = sourceData.firstWhere(
                  (item) => _getValue(item, valueKey) == value.code,
                  orElse: () => <String, dynamic>{},
                );
                if (selectedObject?.isEmpty ?? true) {
                  selectedObject = null;
                }
              } catch (e) {
                selectedObject = null;
              }
            }

            // IMPORTANT: Store the selected value in the form state and widget data before triggering onChange
            if (compositeKey != null) {
              final currentState = FlowCrudStateRegistry().get(compositeKey);
              final existingFormData = currentState?.formData ?? {};
              final existingWidgetData = currentState?.widgetData ?? {};

              // Update widget data with the selected value (for filters)
              final updatedWidgetData = {
                ...existingWidgetData,
                key: value.code,
                if (selectedObject != null) '$key-object': selectedObject,
              };

              // Update the registry with both formData and widgetData
              final updatedState =
                  (currentState ?? const FlowCrudState()).copyWith(
                widgetData: updatedWidgetData,
              );
              FlowCrudStateRegistry().update(compositeKey, updatedState);
            }

            // Trigger onChange actions if defined
            if (json['onChange'] != null) {
              final actionsList =
                  List<Map<String, dynamic>>.from(json['onChange']);

              for (var actionJson in actionsList) {
                var action = ActionConfig.fromJson(actionJson);

                // Add selected value to action context
                final enhancedProperties = {
                  ...action.properties,
                  key: selectedObject,
                  '${key}Id': value.code,
                  '${key}Name': value.name,
                };

                action = ActionConfig(
                  action: action.action,
                  actionType: action.actionType,
                  properties: enhancedProperties,
                  condition: action.condition,
                  actions: action.actions,
                );

                onAction(action);
              }
            }
          }
        },
      ),
    );
  }

  /// Builds dropdown items from source data
  List<DropdownItem> _buildDropdownItems(
    dynamic sourceData,
    String displayKey,
    String valueKey,
      BuildContext context
  ) {
    final items = <DropdownItem>[];

    if (sourceData == null) return items;
    final localization = LocalizationContext.maybeOf(context);

    if (sourceData is List) {
      for (var i = 0; i < sourceData.length; i++) {
        final item = sourceData[i];
        if (item is Map<String, dynamic>) {
          final name = _getValue(item, displayKey)?.toString() ?? '';
          final code = _getValue(item, valueKey)?.toString() ?? '';

          if (name.isNotEmpty && code.isNotEmpty) {
            items.add(DropdownItem(name: localization?.translate(name) ?? name, code: code));
          }
        } else {
          // Handle primitive types (strings, etc.)
          final value = item?.toString() ?? '';
          if (value.isNotEmpty) {
            items.add(DropdownItem(name: value, code: value));
          }
        }
      }
    }

    return items;
  }

  /// Gets a value from a map using dot notation
  dynamic _getValue(Map<String, dynamic> map, String path) {
    final parts = path.split('.');
    dynamic current = map;

    for (var part in parts) {
      if (current == null) {
        return null;
      }

      if (current is Map<String, dynamic>) {
        // Check if the key exists before accessing
        if (!current.containsKey(part)) {
          return null;
        }
        current = current[part];
      } else if (current is Map) {
        // Handle non-typed Map (Map<dynamic, dynamic>)
        if (!current.containsKey(part)) {
          return null;
        }
        current = current[part];
      } else {
        // Current is not a map, can't traverse further
        return null;
      }
    }

    return current;
  }
}
