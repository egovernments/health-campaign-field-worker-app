import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/layout_renderer.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:digit_flow_builder/utils/widget_parsers.dart';
import 'package:digit_flow_builder/widget_registry.dart';
import 'package:digit_flow_builder/widgets/resolved_flow_widget.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

class GroupListViewWidget extends ResolvedFlowWidget {
  @override
  String get format => 'groupListView';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final stateData = resolved.stateData;
    List items = resolved.resolveField(json['items']) ?? [];

    // Optional client-side filtering for already-resolved list items.
    final clientFilters = json['clientFilter'] as List<dynamic>?;
    if (clientFilters != null && clientFilters.isNotEmpty && items is List) {
      final searchClientFilter = clientFilters
          .firstWhere((e) => e['type'] == 'search', orElse: () => null);
      final filterField = searchClientFilter['field'] as String?;
      final widgetKey = searchClientFilter['widgetKey'] as String?;
      final operation =
          (searchClientFilter['operation'] as String? ?? 'contains')
              .toLowerCase();

      if (filterField != null && widgetKey != null) {
        final searchTerm = (resolved.widgetData[widgetKey] ?? '').toString();
        if (searchTerm.isNotEmpty) {
          items = (items as List).where((item) {
            final rawValue = item is Map ? item[filterField] : null;
            final value = rawValue?.toString() ?? '';

            if (operation == 'contains') {
              return value.toLowerCase().contains(searchTerm.toLowerCase());
            }

            if (operation == 'equals') {
              return value.toLowerCase() == searchTerm.toLowerCase();
            }

            return true;
          }).toList();
        }
      }

      // Attendance status filter
      final markedAttendanceFilter = clientFilters
          .firstWhere((e) => e['type'] == 'filter', orElse: () => null);

      if (markedAttendanceFilter != null) {
        var statusValues = markedAttendanceFilter['values'];
        var widgetKey = markedAttendanceFilter['widgetKey'] as String?;
        if (statusValues is List && widgetKey != null) {
          statusValues = statusValues.map((e) => e.toString()).toList();
          items = (items as List).where((item) {
            if ((resolved.widgetData[widgetKey] ?? false) == false) {
              return true; // If checkbox is unchecked, show all items regardless of status
            }
            final rawStatus = item is Map ? item['status'] : null;
            final status = rawStatus != null ? rawStatus.toString() : '';
            return statusValues.contains(status);
          }).toList();
        }
      }

      // Sorting logic based on attendance status
      final sortFilter = clientFilters.firstWhere((e) => e['type'] == 'sort',
          orElse: () => null);

      if (sortFilter != null) {
        var widgetKey = sortFilter['widgetKey'] as String?;
        var presentValue = sortFilter['presentValue']?.toString();
        var absentValue = sortFilter['absentValue']?.toString();

        if (widgetKey != null &&
            presentValue != null &&
            absentValue != null &&
            resolved.widgetData[widgetKey] != null) {
          try {
            items.sort((a, b) {
              double statusA = a["status"] ?? -1.0;
              double statusB = b["status"] ?? -1.0;
              if (resolved.widgetData[widgetKey] == presentValue) {
                // For present first, sort in descending order of status (present > half day > absent)
                return statusB.compareTo(statusA);
              } else {
                // For absent first, sort in ascending order of status (absent > half day > present)
                return statusA.compareTo(statusB);
              }
            });
          } catch (e) {}
        }
      }
    }

    if (items == null || (items is List && items.isEmpty)) {
      final emptyListMessage = json['emptyListMessage'];
      if (emptyListMessage != null) {
        return Center(child: Text(resolved.resolveText(emptyListMessage)));
      }
      return const SizedBox.shrink();
    }

    // Read spacing property (e.g., "spacer4")
    final properties = json['properties'] as Map<String, dynamic>?;

    // Optional grouping config.
    // Supported forms:
    // "groupBy": "entity.tag"
    // "groupBy": {"field": "entity.tag", "defaultLabel": "UNGROUPED"}
    final groupByRaw = json['groupBy'];
    String? groupByField;
    String defaultGroupLabel = 'Ungrouped';

    if (groupByRaw is String && groupByRaw.trim().isNotEmpty) {
      groupByField = groupByRaw.trim();
    } else if (groupByRaw is Map<String, dynamic>) {
      final field = groupByRaw['field'] as String?;
      if (field != null && field.trim().isNotEmpty) {
        groupByField = field.trim();
      }
      final customDefaultLabel = groupByRaw['defaultLabel'] as String?;
      if (customDefaultLabel != null && customDefaultLabel.trim().isNotEmpty) {
        defaultGroupLabel = customDefaultLabel.trim();
      }
    }

    if (groupByField == null) {
      // No grouping, render all items in a single list
      return _ItemsListWidget(
        null,
        items,
        json,
        context,
        onAction,
        resolved,
        stateData,
        properties,
      );
    }

    final groupedItems =
        groupBy(items, (e) => _resolveNestedField(e, groupByField!));

    List<Widget> groupWidgets = [];

    for (final group in groupedItems.entries) {
      final groupLabel =
          (group.key == null || group.key.toString().trim().isEmpty)
              ? defaultGroupLabel
              : group.key.toString().trim();

      final filteredItems = group.value;

      groupWidgets.add(_ItemsListWidget(
        groupLabel,
        filteredItems,
        json,
        context,
        onAction,
        resolved,
        stateData,
        properties,
      ));
    }

    return Column(children: groupWidgets);
  }

  Widget _ItemsListWidget(
      String? groupName,
      List<dynamic> items,
      Map<String, dynamic> json,
      BuildContext context,
      Function(ActionConfig) onAction,
      dynamic resolved,
      CrudStateData? stateData,
      Map<String, dynamic>? properties) {
    List<Widget> widgets = [];
    final spacingKey = properties?['spacing']?.toString();
    final double spacing = _mapSpacingValue(context, spacingKey);
    final groupTextStyle = properties?['groupTextStyle']?.toString();

    for (int index = 0; index < items.length; index++) {
      final item = items[index];
      final safeItem = _normalizeItemData(item);

      final itemWidget = _ListItemWidget.tryBuild(
        json: json,
        context: context,
        onAction: onAction,
        resolved: resolved,
        stateData: stateData,
        safeItem: safeItem,
        listIndex: index,
        totalItems: items.length,
        spacing: spacing,
      );

      if (itemWidget != null) {
        widgets.add(itemWidget);
      }
    }
    if (groupName == null) {
      return Column(children: widgets);
    }
    return Column(
      children: [
        DigitCard(
          children: [
            Text(
              groupName,
              style: groupTextStyle != null
                  ? WidgetParsers.parseTextStyle(context, groupTextStyle)
                      ?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : null,
            ),
            Column(children: widgets),
          ],
        ),
        SizedBox(height: spacing),
      ],
    );
  }

  // Map your "spacer" keywords to actual pixel values
  double _mapSpacingValue(BuildContext context, String? key) {
    switch (key) {
      case 'spacer1':
        return spacer1;
      case 'spacer2':
        return spacer2;
      case 'spacer3':
        return spacer3;
      case 'spacer4':
        return spacer4;
      case 'spacer5':
        return spacer5;
      case 'spacer6':
        return spacer6;
      case 'spacer7':
        return spacer7;
      case 'spacer8':
        return spacer8;
      default:
        return 0.0;
    }
  }

  Map<String, dynamic> _normalizeItemData(dynamic item) {
    if (item is Map) {
      return Map<String, dynamic>.from(
        item.map((k, v) => MapEntry(k.toString(), v)),
      );
    }

    if (item is EntityModel) {
      return item.toMap();
    }

    return <String, dynamic>{};
  }

  dynamic _resolveNestedField(Map<String, dynamic> item, String fieldPath) {
    final parts = fieldPath.split('.');
    dynamic current = item;

    for (final part in parts) {
      if (current == null) return null;
      if (current is Map) {
        current = current[part];
      } else if (current is EntityModel) {
        try {
          current = current.toMap()[part];
        } catch (_) {
          return null;
        }
      } else {
        return null;
      }
    }
    return current;
  }
}

class _ListItemWidget extends StatelessWidget {
  const _ListItemWidget({
    required this.stateData,
    required this.safeItem,
    required this.listIndex,
    required this.totalItems,
    required this.screenKey,
    required this.compositeKey,
    required this.mappedChild,
    required this.spacing,
    required this.isHidden,
  });

  final CrudStateData? stateData;
  final Map<String, dynamic> safeItem;
  final int listIndex;
  final int totalItems;
  final String? screenKey;
  final String? compositeKey;
  final Widget mappedChild;
  final double spacing;
  final bool isHidden;

  static Widget? tryBuild({
    required Map<String, dynamic> json,
    required BuildContext context,
    required void Function(ActionConfig) onAction,
    required ResolvedWidgetContext resolved,
    required CrudStateData? stateData,
    required Map<String, dynamic> safeItem,
    required int listIndex,
    required int totalItems,
    required double spacing,
    String? groupLabel,
  }) {
    final childJson = Map<String, dynamic>.from(json['child'] as Map);
    final processedChild = preprocessConfigWithState(
      childJson,
      stateData!,
      listIndex: listIndex,
      item: safeItem,
    );

    final mappedChild = LayoutMapper.map(
      processedChild,
      stateData,
      context,
      onAction,
      item: safeItem,
      listIndex: listIndex,
      compositeKey: resolved.compositeKey,
    );

    final isHidden = _isZeroSizedBox(mappedChild);
    if (isHidden && groupLabel == null) {
      return null;
    }

    return _ListItemWidget(
      stateData: stateData,
      safeItem: safeItem,
      listIndex: listIndex,
      totalItems: totalItems,
      screenKey: resolved.screenKey,
      compositeKey: resolved.compositeKey,
      mappedChild: mappedChild,
      spacing: spacing,
      isHidden: isHidden,
    );
  }

  static bool _isZeroSizedBox(Widget widget) {
    return widget is SizedBox && widget.width == 0.0 && widget.height == 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    if (!isHidden) {
      children.add(
        CrudItemContext(
          stateData: stateData,
          listIndex: listIndex,
          item: safeItem,
          screenKey: screenKey,
          compositeKey: compositeKey,
          child: Column(
            children: [
              mappedChild,
              if (listIndex < totalItems - 1 && spacing > 0)
                SizedBox(height: spacing),
            ],
          ),
        ),
      );
    }

    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    if (children.length == 1) {
      return children.first;
    }

    return Column(children: children);
  }
}
