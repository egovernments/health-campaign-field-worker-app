import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_forms_engine/widgets/back_header/back_navigation_help_header.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import 'action_handler/action_config.dart';
import 'action_handler/action_handler.dart';
import 'blocs/flow_crud_bloc.dart';
import 'widget_registry.dart';

class LayoutRendererPage extends StatefulWidget {
  final Map<String, dynamic> config;
  final List<String>? watchedScreenKeys;

  const LayoutRendererPage({
    super.key,
    required this.config,
    this.watchedScreenKeys,
  });

  @override
  State<LayoutRendererPage> createState() => _LayoutRendererPageState();
}

class _LayoutRendererPageState extends State<LayoutRendererPage> {
  List<dynamic> _wrappers = [];

  @override
  void initState() {
    super.initState();
    FlowCrudStateRegistry().addListener(_onCrudStateChange);
    _onCrudStateChange(); // Initial build
  }

  @override
  void dispose() {
    FlowCrudStateRegistry().removeListener(_onCrudStateChange);
    super.dispose();
  }

  void _onCrudStateChange() {
    final keys = widget.watchedScreenKeys;
    if (keys == null || keys.isEmpty) {
      setState(() {}); // Rebuild on any update
    } else {
      final updated = keys.any(
        (key) => FlowCrudStateRegistry().get(key) != null,
      );
      if (updated) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> body = widget.config['body'] ?? [];
    final List<dynamic> actions = widget.config['actions'] ?? [];

    final screenKeyToShow = widget.watchedScreenKeys?.first;
    final crudState = screenKeyToShow != null
        ? FlowCrudStateRegistry().get(screenKeyToShow)
        : null;

    final isPersisted = crudState is CrudStatePersisted;

    return Scaffold(
      body: ScrollableContent(
        header: Column(
          children: [
            const BackNavigationHelpHeaderWidget(),
            if (isPersisted)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '✔ Data saved',
                  style: TextStyle(color: Colors.green.shade700),
                ),
              ),
          ],
        ),
        footer: actions.isNotEmpty
            ? DigitCard(
                children: actions
                    .map((e) => LayoutMapper.map(e, context, (action) {
                          ActionHandler.execute(action, context, {
                            'wrappers': _wrappers,
                          });
                        }))
                    .toList(),
              )
            : null,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DigitTextBlock(
                  padding: EdgeInsets.zero,
                  heading: widget.config['heading'] ?? "",
                  headingStyle: Theme.of(context)
                      .digitTextTheme(context)
                      .headingXl
                      .copyWith(
                          color: Theme.of(context).colorTheme.primary.primary2),
                  description: widget.config['description'] ?? "",
                ),
                const SizedBox(height: 16),
                ...body
                    .map((e) => LayoutMapper.map(e, context, (action) {
                          ActionHandler.execute(action, context, {
                            'wrappers': _wrappers,
                          });
                        }))
                    .expand((widget) => [
                          widget,
                          const SizedBox(height: 16),
                        ])
                    .toList()
                  ..removeLast(),
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
