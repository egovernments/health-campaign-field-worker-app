import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class DropdownWidget implements FlowWidget {
  @override
  String get format => 'dropdown';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);

    // For resolving source data (like {{projectFacility}}), we need the full rawState
    final fullStateData = crudCtx?.stateData?.rawState;

    // For resolving item-specific fields (like labels), we use the current item or first item
    final itemStateData = (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
        ? crudCtx.item
        : crudCtx?.stateData?.rawState != null &&
                crudCtx!.stateData!.rawState.isNotEmpty
            ? crudCtx.stateData?.rawState.first
            : null;

    final label = resolveTemplate(json['label'], itemStateData) ?? '';
    final key = json['key'] as String?;
    final isRequired = json['required'] == true;
    final visible = json['visible'] == null ||
        (json['visible'] is bool && json['visible'] == true) ||
        (json['visible'] is String &&
            resolveValue(json['visible'], itemStateData) == true);

    if (!visible) {
      return const SizedBox.shrink();
    }

    // Resolve source data using fullStateData to access search results
    final sourceData = _resolveSource(json, fullStateData);
    final displayKey = json['displayKey'] as String? ?? 'name';
    final valueKey = json['valueKey'] as String? ?? 'id';

    // Get current selected value from state
    final currentValue =
        key != null ? resolveValue('{{$key}}', itemStateData) : null;

    // Build dropdown items
    final items = _buildDropdownItems(sourceData, displayKey, valueKey);

    // Find selected item
    DropdownItem? selectedItem;
    if (currentValue != null) {
      selectedItem = items.firstWhere(
        (item) => item.code == currentValue.toString(),
        orElse: () => const DropdownItem(name: '', code: ''),
      );
      if (selectedItem.code.isEmpty) selectedItem = null;
    }

    return LabeledField(
      label: label,
      isRequired: isRequired,
      child: DigitDropdown(
        selectedOption: selectedItem,
        items: items,
        emptyItemText: 'NO_OPTIONS_AVAILABLE',
        onSelect: (value) {
          // Update state
          if (key != null) {
            // Find the full object from sourceData
            final selectedObject = sourceData?.firstWhere(
              (item) => _getValue(item, valueKey) == value.code,
              orElse: () => null,
            );

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

  /// Resolves the source data from various possible configurations
  dynamic _resolveSource(Map<String, dynamic> json, dynamic stateData) {
    // Check for direct source array
    if (json['source'] != null) {
      final source = json['source'];
      if (source is String) {
        // Resolve from state
        return resolveValue(source, stateData);
      } else if (source is List) {
        // Direct array
        return source;
      }
    }

    // Check for options array (legacy support)
    if (json['options'] != null) {
      final options = json['options'];
      if (options is String) {
        return resolveValue(options, stateData);
      } else if (options is List) {
        return options;
      }
    }

    return null;
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
      for (var item in sourceData) {
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
      if (current is Map<String, dynamic>) {
        current = current[part];
      } else {
        return null;
      }
    }

    return current;
  }
}
