import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../blocs/app_localization.dart';
import '../../widgets/localization_context.dart';
import '../action_config.dart';
import 'action_executor.dart';

class ToastExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'SHOW_TOAST';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final message = _resolveMessage(context, action.properties['message']);
    final typeStr = action.properties['type']?.toString() ?? 'error';

    final ToastType toastType;
    switch (typeStr) {
      case 'success':
        toastType = ToastType.success;
        break;
      case 'warning':
        toastType = ToastType.warning;
        break;
      case 'info':
        toastType = ToastType.info;
        break;
      default:
        toastType = ToastType.error;
    }

    _show(context, contextData, message, toastType);
    return contextData;
  }

  /// Resolves the message without letting a dead context swallow it.
  ///
  /// The widget that started this action chain can be deactivated before the
  /// chain finishes — e.g. OPEN_SCANNER pushes the scanner, the scan updates
  /// `DigitScannerBloc`, the page underneath rebuilds and replaces the
  /// button's Element, and only then does the scanner pop and the onError
  /// branch run. Ancestor lookups assert on such a context, so fall back to
  /// the context-free lookup table, which carries the same strings.
  String _resolveMessage(BuildContext context, dynamic rawMessage) {
    final key = rawMessage?.toString() ?? '';
    if (key.isEmpty) return 'Unknown error';

    try {
      final localization = LocalizationContext.maybeOf(context) ??
          Localizations.of<FlowBuilderLocalization>(
              context, FlowBuilderLocalization);
      if (localization != null) return localization.translate(key);
    } catch (_) {
      // Context no longer active for ancestor lookup.
    }

    return FlowBuilderLocalization.translateStatic(key);
  }

  /// Shows the toast, falling back to the Navigator captured by the calling
  /// widget at build time when the chain's own context is no longer usable.
  ///
  /// `Toast.showToast` needs `Theme.of` and `Overlay.of`, so a deactivated
  /// context fails it too. A NavigatorState outlives the widgets it hosts, so
  /// `_preCaptured['navigator']` is a usable stand-in wherever that navigator
  /// has an ancestor Overlay. If neither context works the toast is skipped
  /// rather than aborting the action chain.
  void _show(
    BuildContext context,
    Map<String, dynamic> contextData,
    String message,
    ToastType type,
  ) {
    final preCaptured = contextData['_preCaptured'] as Map<String, Object>?;
    final navigator = preCaptured?['navigator'];

    final candidates = <BuildContext>[
      context,
      if (navigator is NavigatorState) navigator.context,
    ];

    for (final candidate in candidates) {
      if (!candidate.mounted) continue;
      try {
        Toast.showToast(candidate, message: message, type: type);
        return;
      } catch (_) {
        // Try the next candidate.
      }
    }

    debugPrint('⚠️ SHOW_TOAST: no live context to display "$message"');
  }
}
