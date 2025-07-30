import 'package:digit_forms_engine/widgets/back_header/back_navigation_help_header.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
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
    final List<dynamic> actions = config['actions'] ?? [];
    return Scaffold(
      body: ScrollableContent(
        header: const BackNavigationHelpHeaderWidget(),
        footer: actions.isNotEmpty
            ? DigitCard(
                children: actions
                    .map((e) =>
                        LayoutMapper.map(e, context, ActionHandler.execute))
                    .toList(),
              )
            : null,
        children: [
          /// TODO: need to remove column as scrollable content should handle that
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DigitTextBlock(
                  padding: EdgeInsets.zero,
                  heading: config['heading'] ?? "",
                  headingStyle: Theme.of(context)
                      .digitTextTheme(context)
                      .headingXl
                      .copyWith(
                          color: Theme.of(context).colorTheme.primary.primary2),
                  description: config['description'] ?? "",
                ),
                const SizedBox(height: 16), // space below heading
                ...body
                    .map((e) =>
                        LayoutMapper.map(e, context, ActionHandler.execute))
                    .expand((widget) => [
                          widget,
                          const SizedBox(height: 16),
                        ])
                    .toList()
                  ..removeLast(), // remove trailing SizedBox
              ],
            ),
          )
        ],
      ),
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
