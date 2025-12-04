import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/interpolation.dart';
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
    final crudCtx = CrudItemContext.of(context);

    // Get screen key for navigation params resolution
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);

    // Get form data from registry to check for stored values
    final currentState =
        screenKey != null ? FlowCrudStateRegistry().get(screenKey) : null;
    final formData = currentState?.formData ?? {};
    // For resolving item-specific fields (like labels), we use the current item or first item
    final itemStateData = (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
        ? crudCtx.item
        : crudCtx?.stateData?.rawState != null &&
                crudCtx!.stateData!.rawState.isNotEmpty
            ? crudCtx.stateData?.rawState.first
            : null;

    final label = resolveTemplate(json['label'], itemStateData,
            screenKey: screenKey, localization: localization) ??
        '';
    final key = json['key'] as String?;
    final isRequired = json['required'] == true;
    final visible = json['visible'] == null ||
        (json['visible'] is bool && json['visible'] == true) ||
        (json['visible'] is String &&
            resolveValue(json['visible'], itemStateData,
                    screenKey: screenKey) ==
                true);

    if (!visible) {
      return const SizedBox.shrink();
    }

    // Resolve source data
    dynamic sourceData;
    if (json['source'] != null) {
      if (json['source'] is String) {
        final sourceKey = json['source'] as String;

        // Strip {{ }} if present
        String cleanKey = sourceKey;
        if (sourceKey.startsWith('{{') && sourceKey.endsWith('}}')) {
          cleanKey = sourceKey.substring(2, sourceKey.length - 2).trim();
        }

        // Case 1: Singleton path
        if (cleanKey.startsWith("singleton")) {
          sourceData =
              resolveValueRaw("{{ $cleanKey }}", null, screenKey: screenKey);
        }
        // Case 2: Navigation path (NEW - now handled by resolveValueRaw)
        else if (cleanKey.startsWith("navigation.")) {
          // First check if we've cached this navigation data in formData
          final cacheKey = '_cached_$cleanKey';
          if (formData.containsKey(cacheKey)) {
            sourceData = formData[cacheKey];
          } else {
            // Get navigation params from FlowCrudStateRegistry
            final navigationParams = screenKey != null
                ? FlowCrudStateRegistry().getNavigationParams(screenKey)
                : null;
            final contextData = {
              'navigation': navigationParams ?? {},
            };

            // Resolve from navigation params
            sourceData = resolveValueRaw("{{ $cleanKey }}", contextData,
                screenKey: screenKey);

            // Cache the navigation data in formData to survive state updates
            // IMPORTANT: Defer this until after the build phase completes to avoid setState during build
            if (sourceData != null && screenKey != null) {
              final dataToCache = sourceData;
              final screenKeyToCache = screenKey;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                final currentStateForCache =
                    FlowCrudStateRegistry().get(screenKeyToCache);
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
                    .update(screenKeyToCache, updatedStateForCache);
              });
            }
          }
        }
        // Case 3: If the current item already has this source
        else if (crudCtx?.item != null && (crudCtx!.item?[cleanKey] != null)) {
          sourceData =
              resolveValueRaw(cleanKey, crudCtx.item, screenKey: screenKey);
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
              resolveValueRaw(cleanKey, rawState, screenKey: screenKey);
        }
      }
      // Case 6: Direct array
      else if (json['source'] is List) {
        sourceData = json['source'];
      }
    }

    final displayKey = json['displayKey'] as String? ?? 'name';
    final valueKey = json['valueKey'] as String? ?? 'id';

    // Get current selected value from state
    // First try itemStateData, then fall back to formData
    dynamic currentValue;
    if (key != null) {
      currentValue =
          resolveValue('{{$key}}', itemStateData, screenKey: screenKey);
      // If not found in itemStateData, check formData directly
      if (currentValue == '{{$key}}' || currentValue == null) {
        currentValue = formData[key];
      }
    }

    // Build dropdown items
    final items = _buildDropdownItems(sourceData, displayKey, valueKey);

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

            // IMPORTANT: Store the selected value in the form state before triggering onChange
            if (screenKey != null) {
              final currentState = FlowCrudStateRegistry().get(screenKey);
              final existingFormData = currentState?.formData ?? {};

              // Update form data with the selected value
              final updatedFormData = {
                ...existingFormData,
                key: value.code,
                // Store the selected value ID
                if (selectedObject != null) '$key-object': selectedObject,
                // Store the full object
              };

              // Update the registry
              final updatedState =
                  (currentState ?? const FlowCrudState()).copyWith(
                formData: updatedFormData,
              );
              FlowCrudStateRegistry().update(screenKey, updatedState);
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
  ) {
    final items = <DropdownItem>[];

    if (sourceData == null) return items;

    if (sourceData is List) {
      for (var i = 0; i < sourceData.length; i++) {
        final item = sourceData[i];
        if (item is Map<String, dynamic>) {
          final name = _getValue(item, displayKey)?.toString() ?? '';
          final code = _getValue(item, valueKey)?.toString() ?? '';

          if (name.isNotEmpty && code.isNotEmpty) {
            items.add(DropdownItem(name: name, code: code));
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
