import 'package:auto_route/auto_route.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
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

class LayoutRendererPage extends StatelessWidget {
  final Map<String, dynamic> config;
  final List<String>? watchedScreenKeys;

  const LayoutRendererPage({
    super.key,
    required this.config,
    this.watchedScreenKeys,
  });

  @override
  Widget build(BuildContext context) {
    final List<dynamic> body = config['body'] ?? [];
    final List<dynamic> actions = config['actions'] ?? [];

    final screenKey =
        getScreenKeyFromArgs(context) ?? context.router.currentPath;

    return ValueListenableBuilder(
      valueListenable: FlowCrudStateRegistry().listen(screenKey),
      builder: (context, _, __) {
        final stateData = extractCrudStateData(screenKey);

        return Scaffold(
          body: ScrollableContent(
            header: const Column(
              children: [
                BackNavigationHelpHeaderWidget(),
              ],
            ),
            footer: actions.isNotEmpty
                ? DigitCard(
                    children: actions
                        .map((e) => LayoutMapper.map(
                              preprocessConfigWithState(e, stateData),
                              stateData,
                              context,
                              screenKey: screenKey,
                              (action) {
                                ActionHandler.execute(action, context, {
                                  'wrappers': const [],
                                });
                              },
                            ))
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
                      heading: config['heading'] ?? "",
                      headingStyle: Theme.of(context)
                          .digitTextTheme(context)
                          .headingXl
                          .copyWith(
                              color: Theme.of(context)
                                  .colorTheme
                                  .primary
                                  .primary2),
                      description: config['description'] ?? "",
                    ),
                    const SizedBox(height: 16),
                    ...body
                        .map((e) {
                          final processed =
                              preprocessConfigWithState(e, stateData);

                          return CrudItemContext(
                            stateData: stateData,
                            screenKey: screenKey,
                            child: LayoutMapper.map(
                              processed,
                              stateData,
                              context,
                              (action) {
                                ActionHandler.execute(action, context, {
                                  'wrappers': const [],
                                });
                              },
                            ),
                          );
                        })
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
      },
    );
  }
}

class LayoutMapper {
  static Widget map(
    Map<String, dynamic> json,
    CrudStateData? stateData,
    BuildContext context,
    void Function(ActionConfig) onAction, {
    Map<String, dynamic>? item,
    int? listIndex,
    String? screenKey,
  }) {
    return CrudItemContext(
      stateData: stateData,
      listIndex: listIndex,
      item: item,
      screenKey: screenKey ?? CrudItemContext.of(context)?.screenKey,
      child: ValueListenableBuilder(
        valueListenable: FlowCrudStateRegistry().listen(
          screenKey ?? CrudItemContext.of(context)?.screenKey ?? "",
        ),
        builder: (context, _, __) {
          return WidgetRegistry.build(json, context, onAction);
        },
      ),
    );
  }
}
