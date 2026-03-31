import 'dart:convert';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/flow_widget_state.dart';
import '../resolved_flow_widget.dart';

class ImageWidget extends ResolvedFlowWidget {
  @override
  String get format => 'image';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    return WidgetStateContext.reactive(context, (ctx, state) {
      final fieldKey = json['fieldKey'] as String? ?? 'image';
      final label = json['label'] as String?;
      final innerLabel = resolved.resolveText(json['innerLabel']) as String?;
      final imageBytes = resolved.resolveText(json['imageBytes']) as String?;

      if (imageBytes == null) {
        return const SizedBox.shrink();
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.memory(
            base64Decode(imageBytes),
            height: 90,
            fit: BoxFit.contain,
          ),
          if (innerLabel != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(innerLabel),
              ],
            ),
        ],
      );
    });
  }
}
