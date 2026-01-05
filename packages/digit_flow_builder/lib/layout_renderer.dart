import 'dart:async';

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
  // Scroll listener state
  Timer? _debounceTimer;
  bool _isLoadingMore = false;
  bool _hasTriggeredAtEnd = false;

  // Scroll listener configuration (parsed from config)
  late final String _triggerMode;
  late final double _threshold;
  late final int _debounceMs;
  late final bool _showLoadingIndicator;
  late final List<dynamic>? _onScrollActions;

  @override
  void initState() {
    super.initState();

    // Parse scroll listener configuration from screen config
    final scrollListenerConfig =
        widget.config['scrollListener'] as Map<String, dynamic>? ?? {};

    _triggerMode = scrollListenerConfig['triggerMode'] as String? ?? 'end';
    _threshold = (scrollListenerConfig['threshold'] as num?)?.toDouble() ?? 0.9;
    _debounceMs = scrollListenerConfig['debounceMs'] as int? ?? 300;
    _showLoadingIndicator =
        scrollListenerConfig['showLoadingIndicator'] as bool? ?? true;
    // onScroll actions are now inside scrollListener for better clarity
    _onScrollActions = scrollListenerConfig['onScroll'] as List<dynamic>?;
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  /// Handles scroll notifications from the page
  bool _handleScrollNotification(ScrollNotification notification) {
    // Only handle scroll updates, not start/end
    if (notification is! ScrollUpdateNotification) return false;

    // Skip if no scroll actions configured
    final scrollActions = _onScrollActions;
    if (scrollActions == null || scrollActions.isEmpty) return false;

    final metrics = notification.metrics;

    // Skip if not scrollable or already loading
    if (metrics.maxScrollExtent == 0 || _isLoadingMore) return false;

    bool shouldTrigger = false;

    if (_triggerMode == 'end') {
      // Trigger when reaching the end (with small buffer)
      const buffer = 50.0; // pixels from bottom
      shouldTrigger = metrics.pixels >= (metrics.maxScrollExtent - buffer);
    } else if (_triggerMode == 'threshold') {
      // Trigger when scroll position exceeds threshold percentage
      final scrollPercentage = metrics.pixels / metrics.maxScrollExtent;
      shouldTrigger = scrollPercentage >= _threshold;
    }

    // Prevent duplicate triggers at the same scroll position
    if (shouldTrigger && !_hasTriggeredAtEnd) {
      _hasTriggeredAtEnd = true;
      _triggerScrollActions();
    } else if (!shouldTrigger && metrics.pixels < metrics.maxScrollExtent * 0.5) {
      // Reset trigger flag when scrolled back up past 50%
      _hasTriggeredAtEnd = false;
    }

    return false; // Don't consume the notification
  }

  void _triggerScrollActions() {
    // Cancel any pending debounce timer
    _debounceTimer?.cancel();

    // Debounce the action execution
    _debounceTimer = Timer(Duration(milliseconds: _debounceMs), () {
      _executeScrollActions();
    });
  }

  void _executeScrollActions() {
    final scrollActions = _onScrollActions;
    if (scrollActions == null || scrollActions.isEmpty) return;

    setState(() {
      _isLoadingMore = true;
    });

    // Execute all configured scroll actions
    for (final actionJson in scrollActions) {
      if (actionJson is Map<String, dynamic>) {
        final action = ActionConfig.fromJson(actionJson);
        ActionHandler.execute(action, context, {
          'wrappers': const [],
        });
      }
    }

    // Reset loading state after a delay
    // This will be reset when new data arrives and widget rebuilds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoadingMore = false;
          _hasTriggeredAtEnd = false; // Allow re-triggering after data loads
        });
      }
    });
  }

  /// Resets scroll listener state (call when new data is loaded)
  void resetScrollState() {
    _hasTriggeredAtEnd = false;
    _isLoadingMore = false;
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
          child: NotificationListener<ScrollNotification>(
            onNotification: _handleScrollNotification,
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
                            heading: (widget.config['heading'] != null &&
                                    localizations
                                        .translate(widget.config['heading']).trim()
                                        .isNotEmpty)
                                ? localizations
                                    .translate(widget.config['heading'])
                                : null,
                            headingStyle: Theme.of(context)
                                .digitTextTheme(context)
                                .headingXl
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorTheme
                                        .primary
                                        .primary2),
                            description: (widget.config['description'] !=
                                        null &&
                                    localizations
                                        .translate(widget.config['description']).trim()
                                        .isNotEmpty)
                                ? localizations
                                    .translate(widget.config['description'])
                                : null,
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
                          // Scroll loading indicator at bottom of content
                          if (_showLoadingIndicator && _isLoadingMore)
                             Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: Center(
                                child: DigitLoaders.inlineLoader(),
                              ),
                            ),
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
    final navigationParams =
        FlowCrudStateRegistry().getNavigationParams(screenKey);
    final contextData = {
      'navigation': navigationParams ?? {},
    };

    final resolved =
        resolveTemplate(headingStr, contextData, screenKey: screenKey);

    // Then translate
    final translated = localizations.translate(resolved);

    return translated.isNotEmpty ? translated : null;
  }

  String? _resolveDescription(dynamic description, String screenKey) {
    if (description == null) return null;

    // Resolve templates
    final descriptionStr = description.toString();

    // Get navigation params from FlowCrudStateRegistry
    final navigationParams =
        FlowCrudStateRegistry().getNavigationParams(screenKey);
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
