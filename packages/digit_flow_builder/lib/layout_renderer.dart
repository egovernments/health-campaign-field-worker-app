import 'package:digit_forms_engine/widgets/back_header/back_navigation_help_header.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import 'action_handler/action_config.dart';
import 'action_handler/action_handler.dart';
import 'widget_registry.dart';

class LayoutRendererPage extends StatelessWidget {
  final Map<String, dynamic> config;

  const LayoutRendererPage({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> body = config['body'] ?? [];
    return Scaffold(
      body: ScrollableContent(
          header: const BackNavigationHelpHeaderWidget(),
          children: body
              .map((e) => LayoutMapper.map(e, context, ActionHandler.execute))
              .toList()),
    );
  }
}

class LayoutMapper {
  static Widget map(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    return WidgetRegistry.build(json, context, onAction);
  }
}
