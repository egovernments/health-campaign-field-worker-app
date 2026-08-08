import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/function_registry.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../resolved_flow_widget.dart';

/// Carries an item plus its sort rank and original position so [ListViewWidget]
/// can perform a stable priority sort (see `sortByFn` / `sortPriority`).
class _RankedItem {
  final int rank;
  final int index;
  final dynamic value;

  const _RankedItem(this.rank, this.index, this.value);
}

class ListViewWidget extends ResolvedFlowWidget {
  @override
  String get format => 'listView';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final stateData = resolved.stateData;

    final dataSourceKey = json['dataSource'] ?? json['dataSource'] as String?;
    final rawState = resolved.state.contextData ?? [];
    dynamic items = rawState;

    if (dataSourceKey != null && rawState.isNotEmpty) {
      if (dataSourceKey.startsWith('item.')) {
        final fieldPath = dataSourceKey.substring(5);
        items = resolved.state.itemData != null
            ? _resolveNestedField(resolved.state.itemData!, fieldPath)
            : [];
      } else {
        items = rawState[0]?[dataSourceKey];
      }
    }

    if (items == null || (items is List && items.isEmpty)) {
      return const SizedBox.shrink();
    }

    // listView without CrudStateData context can't preprocess child configs.
    // Bail out gracefully instead of null-asserting on stateData and crashing
    // the page — surfaces a config error visibly as "no list" rather than as
    // a top-level error overlay.
    if (stateData == null) {
      return const SizedBox.shrink();
    }

    // Read spacing property (e.g., "spacer4")
    final properties = json['properties'] as Map<String, dynamic>?;
    final spacingKey = properties?['spacing']?.toString();
    final double spacing = _mapSpacingValue(context, spacingKey);

    // Optional ordering. `sortByFn` names a FunctionRegistry entry invoked with
    // each item; `sortPriority` lists the return values that should float to
    // the top, in the order given. Items whose result isn't listed keep their
    // original position, after all prioritised groups.
    //
    // Used by the referral inbox to surface un-actioned (PENDING) referrals
    // above actioned ones — otherwise a worker has to scan past already
    // handled rows to find the ones still needing a decision, and the rows
    // needing action are exactly the ones that are easy to miss.
    final sortByFn = properties?['sortByFn']?.toString();
    final sortPriority = (properties?['sortPriority'] as List?)
            ?.map((e) => e.toString())
            .toList() ??
        const <String>[];

    if (sortByFn != null &&
        sortByFn.isNotEmpty &&
        sortPriority.isNotEmpty &&
        items is List &&
        items.length > 1) {
      int rankOf(dynamic item) {
        final result =
            FunctionRegistry.call(sortByFn, [item], stateData)?.toString();
        final rank = sortPriority.indexOf(result ?? '');
        return rank < 0 ? sortPriority.length : rank;
      }

      // Decorate-sort-undecorate: Dart's List.sort is NOT stable, so sorting
      // on rank alone would let equal-rank rows swap order between rebuilds
      // and make the list visibly jitter. Tie-breaking on the original index
      // keeps the existing (server) ordering intact within each group.
      final decorated = <_RankedItem>[];
      for (var i = 0; i < items.length; i++) {
        decorated.add(_RankedItem(rankOf(items[i]), i, items[i]));
      }
      decorated.sort((a, b) => a.rank != b.rank
          ? a.rank.compareTo(b.rank)
          : a.index.compareTo(b.index));
      items = decorated.map((e) => e.value).toList();
    }

    final widgets = <Widget>[];

    for (int index = 0; index < items.length; index++) {
      final item = items[index];
      Map<String, dynamic> safeItem;

      if (item is Map) {
        safeItem = Map<String, dynamic>.from(
          item.map((k, v) => MapEntry(k.toString(), v)),
        );
      } else if (item is EntityModel) {
        safeItem = item.toMap();
      } else {
        safeItem = <String, dynamic>{};
      }

      final childJson = Map<String, dynamic>.from(json['child'] as Map);
      final processedChild = preprocessConfigWithState(
        childJson,
        stateData,
        listIndex: index,
        item: safeItem,
      );

      final mappedChild = LayoutMapper.map(
        processedChild,
        stateData,
        context,
        onAction,
        item: safeItem,
        listIndex: index,
        compositeKey: resolved.compositeKey,
      );

      if (mappedChild is SizedBox &&
          mappedChild.width == 0.0 &&
          mappedChild.height == 0.0) continue;

      // Add spacing below each item except the last
      widgets.add(
        CrudItemContext(
          stateData: stateData,
          listIndex: index,
          item: safeItem,
          screenKey: resolved.screenKey,
          compositeKey: resolved.compositeKey,
          child: Column(
            children: [
              mappedChild,
              if (index < items.length - 1 && spacing > 0)
                SizedBox(height: spacing),
            ],
          ),
        ),
      );
    }

    if (widgets.isEmpty) return const SizedBox.shrink();

    return Column(children: widgets);
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
