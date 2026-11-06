import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/layout_renderer.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_flow_builder/utils/widget_parsers.dart';
import 'package:digit_flow_builder/widget_registry.dart';
import 'package:digit_flow_builder/widgets/resolved_flow_widget.dart';
import 'package:flutter/material.dart';

class CustomRowWidget extends ResolvedFlowWidget {
  @override
  String get format => 'customRow';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final stateData = resolved.stateData;
    final props = Map<String, dynamic>.from(json['properties'] ?? {});
    final spacing = WidgetParsers.parseSize(props['spacing']) ?? 0.0;
    final hide = resolved.resolveField(json['hide']) as bool? ?? false;

    if (hide) {
      return const SizedBox.shrink();
    }
    return WidgetParsers.wrapWithBottomGap(
      Row(
        mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
        mainAxisAlignment:
            WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
        children: (json['children'] as List).map<Widget>((childJson) {
          final processedChild = stateData != null
              ? preprocessConfigWithState(
                  Map<String, dynamic>.from(childJson),
                  stateData,
                  listIndex: resolved.state.listIndex,
                  item: resolved.state.itemData,
                )
              : Map<String, dynamic>.from(childJson);

          return CrudItemContext(
            stateData: stateData,
            listIndex: resolved.state.listIndex,
            item: resolved.state.itemData,
            screenKey: resolved.screenKey,
            compositeKey: resolved.compositeKey,
            child: Expanded(
              child: Row(
                children: [
                  LayoutMapper.map(processedChild, stateData, context, onAction,
                      item: resolved.state.itemData,
                      listIndex: resolved.state.listIndex,
                      compositeKey: resolved.compositeKey),
                  if (json['children'].indexOf(childJson) !=
                      (json['children'] as List).length - 1)
                    SizedBox(width: spacing),
                ],
              ),
            ),
          );
        }).toList(),
      ),
      props,
    );
  }
}
