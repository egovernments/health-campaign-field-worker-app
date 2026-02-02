import 'dart:async';

import 'package:auto_route/auto_route.dart';
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
  final String? compositeKey;

  const LayoutRendererPage({
    super.key,
    super.appLocalizations,
    required this.config,
    this.watchedScreenKeys,
    this.compositeKey,
  });

  @override
  State<LayoutRendererPage> createState() => LayoutRendererPageState();
}

class LayoutRendererPageState extends LocalizedState<LayoutRendererPage> {
  // Scroll listener state
  Timer? _debounceTimer;
  bool _hasTriggeredAtBottom = false;
  bool _hasTriggeredAtTop = false;

  // Scroll listener configuration (parsed from config)
  late final String _triggerMode;
  late final double _threshold;
  late final int _debounceMs;
  late final bool _showLoadingIndicator;
  late final List<dynamic>? _onScrollDownActions;
  late final List<dynamic>? _onScrollUpActions;

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

    // For bidirectional mode, we have separate actions for up and down
    // For backwards compatibility, 'onScroll' is treated as 'onScrollDown'
    if (_triggerMode == 'bidirectional') {
      _onScrollDownActions = scrollListenerConfig['onScrollDown'] as List<dynamic>? ??
          scrollListenerConfig['onScroll'] as List<dynamic>?;
      _onScrollUpActions = scrollListenerConfig['onScrollUp'] as List<dynamic>?;
    } else {
      _onScrollDownActions = scrollListenerConfig['onScroll'] as List<dynamic>?;
      _onScrollUpActions = null;
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  /// Handles scroll notifications from the page
  bool _handleScrollNotification(ScrollNotification notification, String compositeKey) {
    // Only handle scroll updates, not start/end
    if (notification is! ScrollUpdateNotification) return false;

    final metrics = notification.metrics;

    // Skip if not scrollable or already loading
    final isLoading = FlowCrudStateRegistry().get(compositeKey)?.isLoading ?? false;
    if (metrics.maxScrollExtent == 0 || isLoading) return false;

    if (_triggerMode == 'bidirectional') {
      _handleBidirectionalScroll(metrics);
    } else {
      _handleUnidirectionalScroll(metrics);
    }

    return false; // Don't consume the notification
  }

  void _handleBidirectionalScroll(ScrollMetrics metrics) {
    const buffer = 50.0; // pixels from edge

    // Check if near bottom
    final nearBottom = metrics.pixels >= (metrics.maxScrollExtent - buffer);
    // Check if near top
    final nearTop = metrics.pixels <= buffer;

    // Debug: Log scroll state periodically
    debugPrint('ScrollState: pixels=${metrics.pixels.toInt()}, max=${metrics.maxScrollExtent.toInt()}, '
        'nearTop=$nearTop, nearBottom=$nearBottom, '
        'triggeredTop=$_hasTriggeredAtTop, triggeredBottom=$_hasTriggeredAtBottom, '
        'hasUpActions=${_onScrollUpActions != null}');

    // Trigger load down when reaching bottom
    if (nearBottom && !_hasTriggeredAtBottom && _onScrollDownActions != null) {
      debugPrint('ScrollListener: Triggering scroll DOWN');
      _hasTriggeredAtBottom = true;
      _triggerScrollActions('down');
    } else if (!nearBottom && metrics.pixels < metrics.maxScrollExtent * 0.8) {
      // Reset bottom trigger when scrolled away from bottom
      _hasTriggeredAtBottom = false;
    }

    // Trigger load up when reaching top
    if (nearTop && !_hasTriggeredAtTop && _onScrollUpActions != null) {
      debugPrint('ScrollListener: Triggering scroll UP');
      _hasTriggeredAtTop = true;
      _triggerScrollActions('up');
    } else if (!nearTop && metrics.pixels > metrics.maxScrollExtent * 0.2) {
      // Reset top trigger when scrolled away from top
      _hasTriggeredAtTop = false;
    }
  }

  void _handleUnidirectionalScroll(ScrollMetrics metrics) {
    // Skip if no scroll actions configured
    if (_onScrollDownActions == null || _onScrollDownActions.isEmpty) return;

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
    if (shouldTrigger && !_hasTriggeredAtBottom) {
      _hasTriggeredAtBottom = true;
      _triggerScrollActions('down');
    } else if (!shouldTrigger && metrics.pixels < metrics.maxScrollExtent * 0.5) {
      // Reset trigger flag when scrolled back up past 50%
      _hasTriggeredAtBottom = false;
    }
  }

  void _triggerScrollActions(String direction) {
    // Cancel any pending debounce timer
    _debounceTimer?.cancel();

    // Debounce the action execution
    _debounceTimer = Timer(Duration(milliseconds: _debounceMs), () {
      _executeScrollActions(direction);
    });
  }

  void _executeScrollActions(String direction) {
    final scrollActions = direction == 'up' ? _onScrollUpActions : _onScrollDownActions;
    if (scrollActions == null || scrollActions.isEmpty) return;

    // Execute all configured scroll actions with direction context
    // Loading state is managed by FlowCrudBloc
    for (final actionJson in scrollActions) {
      if (actionJson is Map<String, dynamic>) {
        // Inject direction into action properties
        final actionWithDirection = Map<String, dynamic>.from(actionJson);
        final properties = Map<String, dynamic>.from(
            actionWithDirection['properties'] as Map<String, dynamic>? ?? {});
        properties['direction'] = direction;
        actionWithDirection['properties'] = properties;

        final action = ActionConfig.fromJson(actionWithDirection);
        ActionHandler.execute(action, context, {
          'wrappers': const [],
          'scrollDirection': direction,
        });
      }
    }
  }

  /// Resets scroll listener state (call when new data is loaded)
  void resetScrollState() {
    _hasTriggeredAtBottom = false;
    _hasTriggeredAtTop = false;
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> body = widget.config['body'] ?? [];
    final List<dynamic> actions = widget.config['footer'] ?? [];
    final List<dynamic> headers = widget.config['header'] ?? [];

    final screenKey =
        getScreenKeyFromArgs(context) ?? context.router.currentPath;
    // Use widget.compositeKey if provided (from ScreenBuilder), otherwise fallback to computing it
    final compositeKey = widget.compositeKey ?? getCompositeKey(context, screenKey: screenKey) ?? screenKey;

    return ValueListenableBuilder(
      valueListenable: FlowCrudStateRegistry().listen(compositeKey),
      builder: (context, flowState, __) {
        final stateData = extractCrudStateData(compositeKey);
        final isLoading = flowState?.isLoading ?? false;
        final currentWrapperLength = flowState?.stateWrapper?.length ?? 0;

        debugPrint('LayoutRenderer: REBUILD - screenKey=$screenKey, '
            'wrapperLength=$currentWrapperLength, isLoading=$isLoading');

        return LocalizationContext(
          localization: localizations,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) => _handleScrollNotification(notification, compositeKey),
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
                                  compositeKey: compositeKey,
                                  child: LayoutMapper.map(
                                    processed,
                                    stateData,
                                    context,
                                    (action) {
                                      ActionHandler.execute(action, context, {
                                        'wrappers': const [],
                                      });
                                    },
                                    compositeKey: compositeKey,
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
                          if (_showLoadingIndicator && isLoading)
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
    String? compositeKey,
  }) {
    final effectiveScreenKey = screenKey ?? CrudItemContext.of(context)?.screenKey;
    final effectiveCompositeKey = compositeKey ??
        CrudItemContext.of(context)?.compositeKey ??
        effectiveScreenKey;

    return CrudItemContext(
      stateData: stateData,
      listIndex: listIndex,
      item: item,
      screenKey: effectiveScreenKey,
      compositeKey: effectiveCompositeKey,
      child: ValueListenableBuilder(
        valueListenable: FlowCrudStateRegistry().listen(
          effectiveCompositeKey ?? "",
        ),
        builder: (context, _, __) {
          return WidgetRegistry.build(json, context, onAction);
        },
      ),
    );
  }
}
