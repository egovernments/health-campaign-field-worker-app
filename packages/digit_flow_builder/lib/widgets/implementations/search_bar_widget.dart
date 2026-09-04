import 'dart:async';

import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../blocs/search_state_manager.dart';
import '../../utils/conditional_evaluator.dart';
import '../localization_context.dart';
import '../resolved_flow_widget.dart';

class SearchBarWidget extends ResolvedFlowWidget {
  @override
  String get format => 'searchBar';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final localization = LocalizationContext.maybeOf(context);
    final hintText = json['label'] ?? '';
    final localizedHint = localization?.translate(hintText) ?? hintText;
    final fieldName = (json['format'] ?? 'searchBar') as String;
    final compositeKey = resolved.compositeKey ?? resolved.screenKey;

    final validations = json['validations'] as List<dynamic>? ?? [];
    int minSearchChars = 1;
    int debounceMs = 400;
    final currentEvalContext = resolved.getFreshEvalContext();

    for (final validation in validations) {
      if (validation is Map<String, dynamic> &&
          validation['type'] == 'minSearchChars') {
        final value = validation['value'];
        if (value is int) {
          minSearchChars = value;
        } else if (value is String) {
          minSearchChars = int.tryParse(value) ?? 1;
        } else if (validation['type'] == 'debounceMs') {
          final value = validation['value'];
          if (value is int) {
            debounceMs = value;
          } else if (value is String) {
            debounceMs = int.tryParse(value) ?? 400;
          }
        }
      }
    }

    final initialValue =
        compositeKey != null
            ? (FlowCrudStateRegistry().get(compositeKey)?.widgetData?[fieldName]
                    ?.toString() ??
                '')
            : '';

    return _ReactiveSearchBar(
      key: ValueKey('${compositeKey}_$fieldName'),
      json: json,
      hintText: localizedHint,
      fieldName: fieldName,
      compositeKey: compositeKey,
      minSearchChars: minSearchChars,
      debounceMs: debounceMs,
      initialValue: initialValue,
      onAction: onAction,
      resolved: resolved,
      capitalizeWords: json['textCapitalization'] == 'words',
    );
  }
}

class _ReactiveSearchBar extends StatefulWidget {
  final Map<String, dynamic> json;
  final String hintText;
  final String fieldName;
  final String? compositeKey;
  final int minSearchChars;
  final int debounceMs;
  final String initialValue;
  final void Function(ActionConfig) onAction;
  final ResolvedWidgetContext resolved;
  final bool capitalizeWords;

  const _ReactiveSearchBar({
    super.key,
    required this.json,
    required this.hintText,
    required this.fieldName,
    required this.compositeKey,
    required this.minSearchChars,
    required this.debounceMs,
    required this.initialValue,
    required this.onAction,
    required this.resolved,
    this.capitalizeWords = false,
  });

  @override
  State<_ReactiveSearchBar> createState() => _ReactiveSearchBarState();
}

class _ReactiveSearchBarState extends State<_ReactiveSearchBar> {
  late final TextEditingController _controller;
  String _lastHandledValue = '';
  bool _syncingExternalValue = false;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _lastHandledValue = widget.initialValue;
    _controller.addListener(_handleControllerChange);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.removeListener(_handleControllerChange);
    _controller.dispose();
    super.dispose();
  }

  void _handleControllerChange() {
    if (_syncingExternalValue) {
      return;
    }

    final value = _controller.text;
    if (value == _lastHandledValue) {
      return;
    }

    _lastHandledValue = value;
    _updateWidgetData(value);

    // Debounce guarantee: every keystroke cancels the pending timer and
    // schedules a fresh one. Dart's `Timer.cancel()` prevents an
    // un-fired callback from running. `dispose()` also cancels the
    // timer. Combined with the `mounted` + stale-value guards inside
    // `_dispatchSearch`, only the latest keystroke's dispatch can
    // reach the action layer.
    _debounceTimer?.cancel();
    if (widget.debounceMs <= 0) {
      _dispatchSearch(value);
      return;
    }
    _debounceTimer = Timer(
      Duration(milliseconds: widget.debounceMs),
      () => _dispatchSearch(value),
    );
  }

  void _dispatchSearch(String value) {
    if (!mounted) return;
    // Defence in depth: if some external caller reset `_lastHandledValue`
    // (e.g. programmatic clear) between schedule and fire, drop this
    // callback — a fresh dispatch will follow.
    if (value != _lastHandledValue) return;

    if (value.length >= widget.minSearchChars) {
      _executeSearchActions(value);
    } else {
      _clearSearchResultsState();
      _executeClearActions(value);
    }
  }

  void _clearSearchResultsState() {
    final compositeKey = widget.compositeKey;
    if (compositeKey == null) {
      return;
    }

    final currentState = FlowCrudStateRegistry().get(compositeKey);
    if (currentState == null) {
      return;
    }

    FlowCrudStateRegistry().update(
      compositeKey,
      FlowCrudState(
        base: null,
        stateWrapper: const [],
        formData: currentState.formData,
        widgetData: currentState.widgetData,
        isLoading: false,
      ),
    );
  }

  void _updateWidgetData(String value) {
    final compositeKey = widget.compositeKey;
    if (compositeKey == null) {
      return;
    }

    final currentState = FlowCrudStateRegistry().get(compositeKey);
    final updatedWidgetData = <String, dynamic>{
      ...?currentState?.widgetData,
      widget.fieldName: value,
    };

    final updatedState =
        (currentState ?? const FlowCrudState()).copyWith(
          widgetData: updatedWidgetData,
        );

    FlowCrudStateRegistry().update(compositeKey, updatedState);
  }

  void _executeSearchActions(String value) {
    if (widget.json['onAction'] == null) {
      return;
    }

    final actionsList = List<Map<String, dynamic>>.from(widget.json['onAction']);
    final currentEvalContext = widget.resolved.getFreshEvalContext();

    for (int i = 0; i < actionsList.length; i++) {
      final raw = actionsList[i];
      if (raw.containsKey('condition')) {
        final condition = raw['condition'] as Map<String, dynamic>?;
        final expression = condition?['expression'] as String?;

        bool conditionMet = false;
        if (expression == null || expression == 'DEFAULT') {
          conditionMet = true;
        } else {
          conditionMet = ConditionalEvaluator.evaluateExpression(
            expression,
            currentEvalContext,
          );
        }

        if (conditionMet) {
          // Clear filters from every NON-matching branch so stale filters
          // from a previously active branch don't AND into the current
          // one via SearchStateManager.getAllFilters(). Generic across
          // any set of searchNames declared in config.
          _clearNonMatchingBranchFilters(actionsList, i);

          final subActions = raw['actions'] as List<dynamic>? ?? const [];
          for (final subActionJson in subActions) {
            if (subActionJson is! Map) continue;
            final processedAction = _processAction(
              Map<String, dynamic>.from(subActionJson),
              value,
            );
            widget.onAction(processedAction);
          }
          break;
        }
      } else {
        final processedAction = _processAction(raw, value);
        widget.onAction(processedAction);
      }
    }
  }

  /// Extracts the set of `SEARCH_EVENT` searchNames declared inside a
  /// branch's `actions` list. Non-SEARCH_EVENT action types (NAVIGATION,
  /// CLOSE_POPUP, etc.) are ignored so we never clear a name that isn't
  /// actually a search bucket.
  Set<String> _eventNamesInBranch(List<dynamic> branchActions) {
    final searchModes = <String>{};
    for (final action in branchActions) {
      if (action is! Map) continue;
      if (action['actionType'] != 'SEARCH_EVENT') continue;
      final props = action['properties'];
      if (props is! Map) continue;
      final searchMode = props['name'];
      if (searchMode is String && searchMode.isNotEmpty) {
        searchModes.add(searchMode);
      }
    }
    return searchModes;
  }

  /// Clears every non-matching conditional branch's SEARCH_EVENT
  /// searchName entirely (filters + orderBy + pagination window) from
  /// [SearchStateManager].
  ///
  /// **Assumption (contract):** conditional branches inside a search
  /// bar's `onAction` are treated as **mutually exclusive** — one and
  /// only one branch's SEARCH_EVENTs represent the current search mode.
  /// If a future config needs additive/independent branches, wire an
  /// explicit config flag (e.g. `"exclusiveSearchBranches": false`) and
  /// gate this call on it. Unconditional entries in the list are always
  /// left alone (they're treated as additive side-effects like toasts).
  ///
  /// **Filtering rules:**
  /// - Only `SEARCH_EVENT` actions contribute names (via
  ///   [_eventNamesInBranch]).
  /// - Names that ALSO appear in the matched branch's SEARCH_EVENTs are
  ///   preserved — clearing them would wipe the search we're about to
  ///   dispatch on this same keystroke.
  ///
  /// Called on each dispatch — idempotent when the same branch fires
  /// repeatedly (clear on an already-empty bucket is a no-op).
  void _clearNonMatchingBranchFilters(
    List<Map<String, dynamic>> actionsList,
    int matchedIndex,
  ) {
    final compositeKey = widget.compositeKey;
    if (compositeKey == null) return;

    // Names the matched branch will (re)populate this dispatch — never
    // clear these, or we'd erase the search we're about to fire.
    final matchedActions = actionsList[matchedIndex]['actions'];
    final matchedSearchModes = matchedActions is List
        ? _eventNamesInBranch(matchedActions)
        : const <String>{};

    final siblingSearchModes = <String>{};
    for (int j = 0; j < actionsList.length; j++) {
      if (j == matchedIndex) continue;
      final branch = actionsList[j];
      if (!branch.containsKey('condition')) continue;

      final branchActions = branch['actions'];
      if (branchActions is! List) continue;

      for (final searchMode in _eventNamesInBranch(branchActions)) {
        if (matchedSearchModes.contains(searchMode)) continue;
        siblingSearchModes.add(searchMode);
      }
    }

    for (final searchMode in siblingSearchModes) {
      SearchStateManager().clear(compositeKey, searchMode);
    }
  }

  void _executeClearActions(String value) {
    if (widget.json['onAction'] == null) {
      return;
    }

    final actionsList = List<Map<String, dynamic>>.from(widget.json['onAction']);
    final currentEvalContext = widget.resolved.getFreshEvalContext();

    for (int i = 0; i < actionsList.length; i++) {
      final raw = actionsList[i];
      if (raw.containsKey('condition')) {
        final condition = raw['condition'] as Map<String, dynamic>?;
        final expression = condition?['expression'] as String?;

        bool conditionMet = false;
        if (expression == null || expression == 'DEFAULT') {
          conditionMet = true;
        } else {
          conditionMet = ConditionalEvaluator.evaluateExpression(
            expression,
            currentEvalContext,
          );
        }

        if (conditionMet) {
          // Symmetric with _executeSearchActions: when the user drops
          // below minSearchChars we still switched conditional modes,
          // so drop the sibling branches' searchName state. Prevents
          // "backspace to empty then switch mode → stale filters
          // re-enter" regressions.
          _clearNonMatchingBranchFilters(actionsList, i);

          final subActions = raw['actions'] as List<dynamic>? ?? [];
          _executeClearForActions(subActions, clearWidgetKey: value.isEmpty);
          break;
        }
      } else {
        _executeClearForSingleAction(raw, clearWidgetKey: value.isEmpty);
      }
    }
  }

  void _executeClearForActions(
    List<dynamic> actions, {
    required bool clearWidgetKey,
  }) {
    final searchBarFilterKeys = <String>[];
    String searchName = 'default';

    for (final action in actions) {
      if (action is! Map<String, dynamic>) continue;

      searchName = (action['properties']?['name'] as String?) ?? searchName;
      final data = action['properties']?['data'] as List?;
      if (data != null) {
        for (final item in data) {
          if (item is Map && item['key'] != null) {
            searchBarFilterKeys.add(item['key'].toString());
          }
        }
      }
    }

    if (searchBarFilterKeys.isNotEmpty) {
      widget.onAction(
        ActionConfig.fromJson({
          'actionType': 'CLEAR_STATE',
          'properties': {
            'type': 'CLEAR_STATE',
            'name': searchName,
            'filterKeys': searchBarFilterKeys,
            if (clearWidgetKey) 'widgetKeys': [widget.fieldName],
            'triggerSearch': true,
          },
        }),
      );
    }
  }

  void _executeClearForSingleAction(
    Map<String, dynamic> raw, {
    required bool clearWidgetKey,
  }) {
    final searchBarFilterKeys = <String>[];
    String searchName = 'default';

    searchName = (raw['properties']?['name'] as String?) ?? searchName;
    final data = raw['properties']?['data'] as List?;
    if (data != null) {
      for (final item in data) {
        if (item is Map && item['key'] != null) {
          searchBarFilterKeys.add(item['key'].toString());
        }
      }
    }

    if (searchBarFilterKeys.isNotEmpty) {
      widget.onAction(
        ActionConfig.fromJson({
          'actionType': 'CLEAR_STATE',
          'properties': {
            'type': 'CLEAR_STATE',
            'name': searchName,
            'filterKeys': searchBarFilterKeys,
            if (clearWidgetKey) 'widgetKeys': [widget.fieldName],
            'triggerSearch': true,
          },
        }),
      );
    }
  }

  ActionConfig _processAction(Map<String, dynamic> raw, String searchValue) {
    final actionJson = Map<String, dynamic>.from(raw);
    actionJson['properties'] ??= {};
    final data = actionJson['properties']['data'];

    if (data is List && data.isNotEmpty && data[0] is Map<String, dynamic>) {
      data[0]['value'] = searchValue;
    }

    return ActionConfig.fromJson(actionJson);
  }

  @override
  Widget build(BuildContext context) {
    final compositeKey = widget.compositeKey;
    final pattern = widget.json['pattern'];
    final formatters = [
      if (pattern is String && pattern.isNotEmpty)
        FilteringTextInputFormatter.allow(RegExp(pattern)),
      if (widget.capitalizeWords) _CapitalizeWordsFormatter(),
    ];
    if (compositeKey == null) {
      return DigitSearchBar(
        hintText: widget.hintText,
        controller: _controller,
        textCapitalization: widget.capitalizeWords
            ? TextCapitalization.words
            : TextCapitalization.none,
        inputFormatters: formatters,
      );
    }

    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable: FlowCrudStateRegistry().listen(compositeKey),
      builder: (context, flowState, child) {
        final externalValue =
            flowState?.widgetData?[widget.fieldName]?.toString() ?? '';

        if (externalValue != _controller.text) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted || _controller.text == externalValue) {
              return;
            }

            _syncingExternalValue = true;
            _controller.value = TextEditingValue(
              text: externalValue,
              selection: TextSelection.collapsed(offset: externalValue.length),
            );
            _lastHandledValue = externalValue;
            _syncingExternalValue = false;
          });
        }

        return DigitSearchBar(
          hintText: widget.hintText,
          controller: _controller,
          textCapitalization: widget.capitalizeWords
              ? TextCapitalization.words
              : TextCapitalization.none,
          inputFormatters: formatters,
        );
      },
    );
  }
}

class _CapitalizeWordsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    final newText = newValue.text.replaceAllMapped(
      RegExp(r'(^|\s)\S'),
      (match) => match.group(0)!.toUpperCase(),
    );
    return newValue.copyWith(text: newText, selection: newValue.selection);
  }
}
