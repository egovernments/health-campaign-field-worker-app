import 'package:digit_flow_builder/blocs/app_localization.dart';
import 'package:digit_flow_builder/utils/function_registry.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/atoms/digit_tag.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/atoms/switch.dart';
import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import 'action_handler/action_config.dart';
import 'blocs/flow_crud_bloc.dart';
import 'layout_renderer.dart';

/// Provides stateData, listIndex, item, screenKey automatically down the tree
class CrudItemContext extends InheritedWidget {
  final CrudStateData? stateData;
  final int? listIndex;
  final Map<String, dynamic>? item;
  final String? screenKey;

  const CrudItemContext({
    super.key,
    required super.child,
    this.stateData,
    this.listIndex,
    this.item,
    this.screenKey,
  });

  static CrudItemContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CrudItemContext>();
  }

  @override
  bool updateShouldNotify(CrudItemContext oldWidget) {
    final stateChanged = stateData?.rawState != oldWidget.stateData?.rawState;
    final listIndexChanged = listIndex != oldWidget.listIndex;
    final itemChanged = item.toString() != oldWidget.item.toString();
    final screenChanged = screenKey != oldWidget.screenKey;

    return stateChanged || listIndexChanged || itemChanged || screenChanged;
  }
}

typedef WidgetBuilderFn = Widget Function(
  Map<String, dynamic>,
  BuildContext,
  void Function(ActionConfig),
);

class WidgetRegistry {
  static final _builders = <String, WidgetBuilderFn>{};

  static void register(String format, WidgetBuilderFn builder) {
    _builders[format] = builder;
  }

  static Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final format = json['format'] as String? ?? '';
    final builder = _builders[format];
    if (builder != null) {
      return builder(json, context, onAction);
    }
    return Text('Unknown widget format: $format');
  }

  void initializeDefaultWidgetRegistry() {
    initializeFunctionRegistry();
    // BUTTON
    WidgetRegistry.register('button', (json, context, onAction) {
      final props = Map<String, dynamic>.from(json['properties'] ?? {});
      return DigitButton(
        label: json['label'] ?? '',
        onPressed: () {
          if (json['onAction'] != null) {
            // Parse onAction as a list of actions
            final actionsList =
                List<Map<String, dynamic>>.from(json['onAction']);

            final crudCtx = CrudItemContext.of(context);
            final stateData =
                (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
                    ? crudCtx.item
                    : crudCtx?.stateData?.rawState != null &&
                            crudCtx!.stateData!.rawState.isNotEmpty
                        ? crudCtx.stateData?.rawState.first
                        : null;

            // Process each action
            for (var actionJson in actionsList) {
              var action = ActionConfig.fromJson(actionJson);

              // Resolve navigation data if present
              final navData = action.properties['data'] as List<dynamic>?;

              if (navData != null && stateData != null) {
                final resolvedData = navData.map((entry) {
                  final key = entry['key'] as String;
                  final rawValue = entry['value'];

                  final resolvedValue = resolveValue(rawValue, stateData);

                  return {
                    "key": key,
                    "value": resolvedValue,
                  };
                }).toList();

                action = ActionConfig(
                  action: action.action,
                  actionType: action.actionType,
                  properties: {
                    ...action.properties,
                    'data': resolvedData,
                  },
                  condition: action.condition,
                  actions: action.actions,
                );
              }

              // Trigger each action
              onAction(action);
            }
          }
        },
        type: _parseButtonType(props['type']),
        size: _parseButtonSize(props['size']),
        mainAxisSize: _parseMainAxisSize(props['mainAxisSize']),
        mainAxisAlignment: _parseMainAxisAlignment(props['mainAxisAlignment']),
        suffixIcon:
            json['suffixIcon'] != null ? _parseIcon(json['suffixIcon']) : null,
      );
    });

    // SEARCH BAR
    WidgetRegistry.register('searchBar', (json, context, onAction) {
      return DigitSearchBar(
        hintText: json['label'] ?? '',
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (json['onAction'] != null) {
              final actionsList =
                  List<Map<String, dynamic>>.from(json['onAction']);

              for (var raw in actionsList) {
                raw['properties'] ??= {};
                final data = raw['properties']['data'];

                if (data is List &&
                    data.isNotEmpty &&
                    data[0] is Map<String, dynamic>) {
                  data[0]['value'] = value;
                }

                final action = ActionConfig.fromJson(raw);
                onAction(action);
              }
            }
          } else {
            FlowCrudStateRegistry().clearAll();
          }
        },
      );
    });

    // CARD
    WidgetRegistry.register('card', (json, context, onAction) {
      final crudCtx = CrudItemContext.of(context);
      final stateData = crudCtx?.stateData;

      return DigitCard(
        cardType: parseCardType(json['type'] as String? ?? 'primary'),
        children: (json['children'] as List).map<Widget>((childJson) {
          final processed = stateData != null
              ? preprocessConfigWithState(
                  Map<String, dynamic>.from(childJson),
                  stateData,
                  listIndex: crudCtx?.listIndex,
                  item: crudCtx?.item,
                )
              : Map<String, dynamic>.from(childJson);

          return CrudItemContext(
            stateData: stateData,
            listIndex: crudCtx?.listIndex,
            item: crudCtx?.item,
            screenKey: crudCtx?.screenKey,
            child: LayoutMapper.map(processed, stateData, context, onAction,
                item: crudCtx?.item, listIndex: crudCtx?.listIndex),
          );
        }).toList(),
      );
    });

    // FILTER
    WidgetRegistry.register('filter', (json, context, onAction) {
      return DigitButton(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        label: json['label'] ?? '',
        onPressed: () {
          if (json['onAction'] != null) {
            final actionsList = json['onAction'] is List
                ? List<Map<String, dynamic>>.from(json['onAction'])
                : [Map<String, dynamic>.from(json['onAction'])];

            for (var raw in actionsList) {
              final action = ActionConfig.fromJson(raw);
              onAction(action);
            }
          }
        },
        type: DigitButtonType.tertiary,
        size: DigitButtonSize.large,
        suffixIcon: Icons.filter_alt_sharp,
      );
    });

    // INFO CARD
    WidgetRegistry.register('infoCard', (json, context, onAction) {
      final crudCtx = CrudItemContext.of(context);
      final items = crudCtx?.stateData?.rawState ?? [];
      if (items.isNotEmpty) return const SizedBox.shrink();
      return InfoCard(
        type: InfoType.info,
        title: json['label'] ?? '',
        description: json['description'] ?? '',
      );
    });

    // COLUMN
    WidgetRegistry.register('column', (json, context, onAction) {
      final crudCtx = CrudItemContext.of(context);
      final stateData = crudCtx?.stateData;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (json['children'] as List).map<Widget>((childJson) {
          final processedChild = stateData != null
              ? preprocessConfigWithState(
                  Map<String, dynamic>.from(childJson),
                  stateData,
                  listIndex: crudCtx?.listIndex,
                  item: crudCtx?.item,
                )
              : Map<String, dynamic>.from(childJson);

          return CrudItemContext(
            stateData: stateData,
            listIndex: crudCtx?.listIndex,
            item: crudCtx?.item,
            screenKey: crudCtx?.screenKey,
            child: LayoutMapper.map(
                processedChild, stateData, context, onAction,
                listIndex: crudCtx?.listIndex, item: crudCtx?.item),
          );
        }).toList(),
      );
    });

    // ROW
    WidgetRegistry.register('row', (json, context, onAction) {
      final crudCtx = CrudItemContext.of(context);
      final stateData = crudCtx?.stateData;
      final props = Map<String, dynamic>.from(json['properties'] ?? {});

      return Row(
        mainAxisSize: _parseMainAxisSize(props['mainAxisSize']),
        mainAxisAlignment: _parseMainAxisAlignment(props['mainAxisAlignment']),
        children: (json['children'] as List).map<Widget>((childJson) {
          final processedChild = stateData != null
              ? preprocessConfigWithState(
                  Map<String, dynamic>.from(childJson),
                  stateData,
                  listIndex: crudCtx?.listIndex,
                  item: crudCtx?.item,
                )
              : Map<String, dynamic>.from(childJson);

          return CrudItemContext(
            stateData: stateData,
            listIndex: crudCtx?.listIndex,
            item: crudCtx?.item,
            screenKey: crudCtx?.screenKey,
            child: LayoutMapper.map(
                processedChild, stateData, context, onAction,
                item: crudCtx?.item, listIndex: crudCtx?.listIndex),
          );
        }).toList(),
      );
    });

    // TEXT
    WidgetRegistry.register('text', (json, context, onAction) {
      final crudCtx = CrudItemContext.of(context);

      final value = json['value'] ?? '';
      final finalText = (crudCtx?.stateData != null && value is String)
          ? interpolateWithCrudStates(
              template: value,
              stateData: crudCtx!.stateData!,
              listIndex: crudCtx.listIndex,
              item: crudCtx.item,
            )
          : value;
      return Text(FlowBuilderLocalization.of(context).translate(
        finalText,
      ));
    });

    WidgetRegistry.register('table', (json, context, onAction) {
      final crudCtx = CrudItemContext.of(context);
      final stateData = crudCtx?.stateData;

      final data = Map<String, dynamic>.from(json['data'] ?? {});
      final columns = (data['columns'] as List<dynamic>?)
              ?.map((col) => DigitTableColumn(
                    header: col['header'],
                    cellValue: col['cellValue'],
                  ))
              .toList() ??
          [];

      // Step 1: Resolve data source
      List<dynamic> sourceList = [];

      if (data['rows'] != null) {
        final rowsKey = data['rows'].toString();

        // Case 1: Singleton path
        if (rowsKey.startsWith("singleton")) {
          final resolved = resolveValueRaw("{{ $rowsKey }}", null);
          if (resolved is List) {
            sourceList = resolved;
          } else if (resolved != null) {
            sourceList = [resolved];
          }
        }
        // Case 2: If the current item already has this source (table inside listView)
        else if (crudCtx?.item != null && (crudCtx!.item?[rowsKey] != null)) {
          final localSource = resolveValueRaw(rowsKey, crudCtx.item);
          if (localSource is List) {
            sourceList = localSource;
          } else if (localSource != null) {
            sourceList = [localSource];
          }
        }
        // Case 3: Fallback to global modelMap
        else if (stateData != null) {
          final localSource = resolveValueRaw(rowsKey, stateData.rawState);
          if (localSource is List) {
            sourceList = localSource;
          } else if (localSource != null) {
            sourceList = [localSource];
          }
        }
      }

      if (sourceList.isEmpty) return const SizedBox.shrink();

      final rows = sourceList.asMap().entries.map((entry) {
        final rowIndex = entry.key;
        final rowItem = entry.value;

        return DigitTableRow(
          tableRow: columns.map((col) {
            final finalText = resolveValue(col.cellValue, rowItem);

            return DigitTableData(
              finalText?.toString() ?? '',
              cellKey: col.cellValue,
            );
          }).toList(),
        );
      }).toList();

      return SizedBox(
        height: (rows.length * 52.0 + 64),
        child: DigitTable(
          enableBorder: true,
          withRowDividers: false,
          withColumnDividers: false,
          showSelectedState: false,
          showPagination: false,
          columns: columns,
          rows: rows,
        ),
      );
    });

    // LabelPairList
    WidgetRegistry.register('labelPairList', (json, context, onAction) {
      final crudCtx = CrudItemContext.of(context);
      final List<dynamic> data = json['data'] ?? [];

      return LabelValueSummary(
        padding: const EdgeInsets.all(0),
        items: data.map((e) {
          final key = e['key'] ?? '';
          final value = e['value'];

          final valueText = resolveValue(
              value,
              crudCtx?.item != null
                  ? crudCtx!.item
                  : crudCtx?.stateData?.rawState);

          return LabelValueItem(
            maxLines: 5,
            label: key,
            value: valueText,
            labelFlex: 9,
          );
        }).toList(),
      );
    });

    // SWITCH
    WidgetRegistry.register('switch', (json, context, onAction) {
      return DigitSwitch(
        label: json['label'] ?? '',
        value: false,
        mainAxisAlignment: MainAxisAlignment.start,
        onChanged: (value) {
          if (json['onAction'] != null) {
            final actionsList = json['onAction'] is List
                ? List<Map<String, dynamic>>.from(json['onAction'])
                : [Map<String, dynamic>.from(json['onAction'])];

            for (var raw in actionsList) {
              raw['properties'] ??= {};
              raw['properties']['data'] = [
                {
                  'key': json['fieldName'] ?? 'switch',
                  'value': value,
                }
              ];
              final action = ActionConfig.fromJson(raw);
              onAction(action);
            }
          }
        },
      );
    });

    // TAG
    WidgetRegistry.register('tag', (json, context, onAction) {
      final crudCtx = CrudItemContext.of(context);
      final label = json['label'] ?? '';
      final finalLabel = crudCtx?.stateData != null
          ? interpolateWithCrudStates(
              template: label,
              stateData: crudCtx!.stateData!,
              listIndex: crudCtx.listIndex,
              item: crudCtx.item,
            )
          : label;
      return Tag(
        label: finalLabel,
        type: TagType.error,
      );
    });

    WidgetRegistry.register('panelCard', (json, context, onAction) {
      final crudCtx = CrudItemContext.of(context);
      final label = json['label'] ?? '';
      final description = json['description'] ?? '';
      return PanelCard(
        title: label,
        type: PanelType.success,
        description: description,
      );
    });

    // LISTVIEW
    WidgetRegistry.register('listView', (json, context, onAction) {
      final crudCtx = CrudItemContext.of(context);
      final stateData = crudCtx?.stateData;

      // Read `dataSource` from config (ex: "members")
      final dataSourceKey = json['dataSource'] as String?;

      // Default to full rawState if no key provided
      final rawState = stateData?.rawState ?? [];
      var items = rawState;
      if (dataSourceKey != null && rawState.isNotEmpty) {
        items = rawState[0]?[dataSourceKey];
      }

      if (items.isEmpty) return const SizedBox.shrink();

      return Column(
        children: List.generate(items.length, (index) {
          final safeItem = (items[index] is Map)
              ? Map<String, dynamic>.from(
                  (items[index] as Map)
                      .map((k, v) => MapEntry(k.toString(), v)),
                )
              : <String, dynamic>{};

          // Deep clone the child JSON for each item
          final childJson = Map<String, dynamic>.from(json['child'] as Map);

          final processedChild = preprocessConfigWithState(
            childJson,
            stateData!,
            listIndex: index,
            item: safeItem,
          );

          return CrudItemContext(
            stateData: stateData,
            listIndex: index,
            item: safeItem,
            screenKey: crudCtx?.screenKey,
            child: LayoutMapper.map(
              processedChild,
              stateData,
              context,
              onAction,
              listIndex: index,
              item: safeItem,
              screenKey: crudCtx?.screenKey,
            ),
          );
        }).expand((widget) => [widget, const SizedBox(height: 8)]).toList()
          ..removeLast(),
      );
    });
  }

  // --- helpers ---
  DigitButtonType _parseButtonType(String? type) {
    switch (type) {
      case 'primary':
        return DigitButtonType.primary;
      case 'secondary':
        return DigitButtonType.secondary;
      case 'tertiary':
        return DigitButtonType.tertiary;
      default:
        return DigitButtonType.primary;
    }
  }

  DigitButtonSize _parseButtonSize(String? size) {
    switch (size) {
      case 'small':
        return DigitButtonSize.small;
      case 'medium':
        return DigitButtonSize.medium;
      case 'large':
        return DigitButtonSize.large;
      default:
        return DigitButtonSize.large;
    }
  }

  MainAxisSize _parseMainAxisSize(String? size) {
    switch (size) {
      case 'max':
        return MainAxisSize.max;
      case 'min':
        return MainAxisSize.min;
      default:
        return MainAxisSize.min;
    }
  }

  MainAxisAlignment _parseMainAxisAlignment(String? alignment) {
    switch (alignment) {
      case 'start':
        return MainAxisAlignment.start;
      case 'center':
        return MainAxisAlignment.center;
      case 'end':
        return MainAxisAlignment.end;
      case 'spaceBetween':
        return MainAxisAlignment.spaceBetween;
      default:
        return MainAxisAlignment.start;
    }
  }

  IconData? _parseIcon(String? iconName) {
    switch (iconName) {
      case 'filter':
        return Icons.filter_alt_sharp;
      case 'edit':
        return Icons.edit;
      default:
        return null;
    }
  }

  CardType parseCardType(String? raw) {
    switch ((raw ?? '').toLowerCase()) {
      case 'primary':
        return CardType.primary;
      case 'secondary':
        return CardType.secondary;
      default:
        return CardType.primary;
    }
  }
}
