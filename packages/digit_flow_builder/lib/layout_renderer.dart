import 'package:auto_route/auto_route.dart';
import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:digit_flow_builder/widgets/localization_context.dart';
import 'package:digit_flow_builder/widgets/localized.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import 'action_handler/action_config.dart';
import 'action_handler/action_handler.dart';
import 'blocs/flow_crud_bloc.dart';
import 'widget_registry.dart';

class LayoutRendererPage extends LocalizedStatefulWidget {
  final Map<String, dynamic> config;
  final List<String>? watchedScreenKeys;

  const LayoutRendererPage({
    super.key,
    super.appLocalizations,
    required this.config,
    this.watchedScreenKeys,
  });

  @override
  State<LayoutRendererPage> createState() => LayoutRendererPageState();
}

class LayoutRendererPageState extends LocalizedState<LayoutRendererPage> {
  @override
  void initState() {
    super.initState();
    // You can handle any locale-specific logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> body = widget.config['body'] ?? [];
    final List<dynamic> actions = widget.config['footer'] ?? [];
    final List<dynamic> headers = widget.config['header'] ?? [];

    final screenKey =
        getScreenKeyFromArgs(context) ?? context.router.currentPath;

    return ValueListenableBuilder(
      valueListenable: FlowCrudStateRegistry().listen(screenKey),
      builder: (context, flowState, __) {
        final stateData = extractCrudStateData(screenKey);
        final isLoading = flowState?.base is CrudStateLoading;

        return LocalizationContext(
          localization: localizations,
          child: Stack(
            children: [
              Scaffold(
                body: ScrollableContent(
                  header: headers.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: spacer4, left: spacer4),
                          child: Row(
                            children: headers
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
                          ),
                        )
                      : null,
                  enableFixedDigitButton: actions.isNotEmpty ? true : false,
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
                      padding: const EdgeInsets.all(spacer4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DigitTextBlock(
                            padding: EdgeInsets.zero,
                            heading: _resolveHeading(
                                widget.config['heading'], screenKey),
                            headingStyle: Theme.of(context)
                                .digitTextTheme(context)
                                .headingXl
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorTheme
                                        .primary
                                        .primary2),
                            description: _resolveDescription(
                                widget.config['description'], screenKey),
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
              ),
              // Loading overlay when search/CRUD operation is in progress
              if (isLoading) DigitLoaders.inlineLoader(),
            ],
          ),
        );
      },
    );
  }

  String? _resolveHeading(dynamic heading, String screenKey) {
    if (heading == null) return null;

    // Resolve templates like {{navigation.reportType}}
    final headingStr = heading.toString();

    // Get navigation params from FlowCrudStateRegistry
    final navigationParams = FlowCrudStateRegistry().getNavigationParams(screenKey);
    final contextData = {
      'navigation': navigationParams ?? {},
    };

    final resolved = resolveTemplate(headingStr, contextData, screenKey: screenKey);

    // Then translate
    final translated = localizations.translate(resolved);

    return translated.isNotEmpty ? translated : null;
  }

  String? _resolveDescription(dynamic description, String screenKey) {
    if (description == null) return null;

    // Resolve templates
    final descriptionStr = description.toString();

    // Get navigation params from FlowCrudStateRegistry
    final navigationParams = FlowCrudStateRegistry().getNavigationParams(screenKey);
    final contextData = {
      'navigation': navigationParams ?? {},
    };

    final resolved =
        resolveTemplate(descriptionStr, contextData, screenKey: screenKey);

    // Then translate
    final translated = localizations.translate(resolved);

    return translated.isNotEmpty ? translated : null;
  }

  Future<void> _handleBackNavigation(BuildContext context) async {
    final backNavigationConfig =
        widget.config['header'] as Map<String, dynamic>?;

    if (backNavigationConfig != null) {
      // Execute configured back navigation action
      final actionConfig = ActionConfig.fromJson(backNavigationConfig);
      await ActionHandler.execute(actionConfig, context, {});
    } else {
      // Default behavior - single pop
      final actionConfig = ActionConfig.fromJson({
        'actionType': 'BACK_NAVIGATION',
        'properties': {},
      });

      await ActionHandler.execute(actionConfig, context, {});
    }
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
