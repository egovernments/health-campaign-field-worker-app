import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../localization_context.dart';
import '../resolved_flow_widget.dart';

class DropdownWidget extends ResolvedFlowWidget {
  @override
  String get format => 'dropdownTemplate';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final crudCtx = CrudItemContext.of(context);

    final label = resolved.resolvedLabel ?? '';
    final key = (json['key'] ?? json['fieldName']) as String?;
    final isRequired = json['required'] == true;
    final displayKey = json['displayKey'] as String? ?? 'name';
    final valueKey = json['valueKey'] as String? ?? 'id';

    // Use compositeKey for registry operations
    final compositeKey = resolved.compositeKey;

    // If no compositeKey, fall back to non-reactive behavior
    if (compositeKey == null) {
      return _buildDropdownContent(
        json: json,
        context: context,
        onAction: onAction,
        localization: resolved.localization,
        crudCtx: crudCtx,
        compositeKey: compositeKey,
        evalContext: resolved.evalContext,
        label: label,
        key: key,
        isRequired: isRequired,
        displayKey: displayKey,
        valueKey: valueKey,
        formData: resolved.formData,
        widgetData: resolved.widgetData,
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
          ...resolved.evalContext,
          'formData': formData,
          'widgetData': widgetData,
        };

        return _buildDropdownContent(
          json: json,
          context: context,
          onAction: onAction,
          localization: resolved.localization,
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
    final localization = LocalizationContext.maybeOf(context);
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
          final cacheKey = '_cached_$cleanKey';
          if (formData.containsKey(cacheKey)) {
            sourceData = formData[cacheKey];
          } else {
            final navigationParams = compositeKey != null
                ? FlowCrudStateRegistry().getNavigationParams(compositeKey)
                : null;
            final navContext = {
              ...evalContext,
              'navigation': navigationParams ?? {},
            };

            sourceData = resolveValueRaw("{{ $cleanKey }}", navContext,
                screenKey: compositeKey);

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
        // Case 4: Try modelMap first
        else if (crudCtx?.stateData?.modelMap != null &&
            crudCtx!.stateData!.modelMap.containsKey(cleanKey)) {
          sourceData = crudCtx.stateData!.modelMap[cleanKey];
        }
        // Case 5: Try rawState as map
        else if (crudCtx?.stateData?.rawState != null) {
          final rawState = crudCtx!.stateData!.rawState;
          if (rawState is List && rawState.isNotEmpty) {
            for (var item in rawState) {
              if (item is Map && item.containsKey(cleanKey)) {
                sourceData = item[cleanKey];
                break;
              }
            }
          }
          sourceData ??= resolveValueRaw("{{ $cleanKey }}", rawState,
              screenKey: compositeKey);
        }
      }
      // Case 6: Direct array
      else if (sourceField is List) {
        sourceData = sourceField;
      }
    }

    // Get current selected value from state
    dynamic currentValue;
    if (key != null) {
      if (widgetData.containsKey(key)) {
        currentValue = widgetData[key];
      } else {
        currentValue =
            resolveValue('{{$key}}', evalContext, screenKey: compositeKey);
        if (currentValue == '{{$key}}' || currentValue == null) {
          currentValue = formData[key];
        }
      }
    }

    // Build dropdown items
    final items =
        _buildDropdownItems(sourceData, displayKey, valueKey, context);

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

    // Hide dropdown when only one item (search triggered via initActions)
    if (items.length <= 1) {
      return const SizedBox.shrink();
    }

    return LabeledField(
      label: label,
      isRequired: isRequired,
      child: DigitDropdown(
        key: ValueKey('${compositeKey}_${key}_${currentValue ?? ''}'),
        selectedOption: selectedItem,
        sentenceCaseEnabled: false,
        items: items,
        emptyItemText: localization?.translate('NO_OPTIONS_AVAILABLE') ??
            "NO_OPTIONS_AVAILABLE",
        onSelect: (value) {
          if (key != null) {
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

            if (compositeKey != null) {
              final currentState = FlowCrudStateRegistry().get(compositeKey);
              final existingWidgetData = currentState?.widgetData ?? {};

              final updatedWidgetData = {
                ...existingWidgetData,
                key: value.code,
                if (selectedObject != null) '$key-object': selectedObject,
              };

              final updatedState =
                  (currentState ?? const FlowCrudState()).copyWith(
                widgetData: updatedWidgetData,
              );
              FlowCrudStateRegistry().update(compositeKey, updatedState);
            }

            if (json['onChange'] != null) {
              final actionsList =
                  List<Map<String, dynamic>>.from(json['onChange']);

              for (var actionJson in actionsList) {
                var action = ActionConfig.fromJson(actionJson);

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

  List<DropdownItem> _buildDropdownItems(dynamic sourceData, String displayKey,
      String valueKey, BuildContext context) {
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
            items.add(DropdownItem(
                name: localization?.translate(name) ?? name, code: code));
          }
        } else {
          final value = item?.toString() ?? '';
          if (value.isNotEmpty) {
            items.add(DropdownItem(name: value, code: value));
          }
        }
      }
    }

    return items;
  }

  dynamic _getValue(Map<String, dynamic> map, String path) {
    final parts = path.split('.');
    dynamic current = map;

    for (var part in parts) {
      if (current == null) {
        return null;
      }

      if (current is Map<String, dynamic>) {
        if (!current.containsKey(part)) {
          return null;
        }
        current = current[part];
      } else if (current is Map) {
        if (!current.containsKey(part)) {
          return null;
        }
        current = current[part];
      } else {
        return null;
      }
    }

    return current;
  }
}
