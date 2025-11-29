import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/flow_crud_bloc.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../action_config.dart';
import '../action_handler.dart';
import 'action_executor.dart';

/// Executor for OPEN_SCANNER action type
/// Opens the scanner page and handles the scanned result
///
/// Usage in config:
/// ```json
/// {
///   "actionType": "OPEN_SCANNER",
///   "properties": {
///     "scanType": "qr",           // "qr", "barcode", or "any"
///     "fieldName": "scannedMrn",  // Field to store scanned value
///     "singleValue": true,        // Single scan mode
///     "quantity": 1,              // Number of items to scan
///     "isGS1code": false,         // GS1 barcode mode
///     "onSuccess": [...],         // Actions to execute after successful scan
///     "onError": [...]            // Actions to execute on error
///   }
/// }
/// ```
class OpenScannerExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'OPEN_SCANNER';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final properties = action.properties;

    // Scanner configuration
    final scanType = properties['scanType'] as String? ?? 'qr';
    final fieldName = properties['fieldName'] as String? ?? 'scannedData';
    final singleValue = properties['singleValue'] as bool? ?? true;
    final quantity = properties['quantity'] as int? ?? 1;
    final isGS1code = properties['isGS1code'] as bool? ?? false;

    // Get onSuccess and onError actions
    final onSuccessActions = properties['onSuccess'] as List<dynamic>?;
    final onErrorActions = properties['onError'] as List<dynamic>?;

    // Get current screen key - try CrudItemContext first (has correct format),
    // then fall back to route args
    final crudCtx = CrudItemContext.of(context);
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);

    try {
      final scannerBloc = context.read<DigitScannerBloc>();

      // Reset scanner state before opening
      scannerBloc.add(
        const DigitScannerEvent.handleScanner(
          barCode: [],
          qrCode: [],
        ),
      );

      // Navigate to scanner and await return
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (scannerContext) => DigitScannerPage(
            quantity: quantity,
            isGS1code: isGS1code,
            singleValue: singleValue,
          ),
          settings: const RouteSettings(name: '/qr-scanner'),
        ),
      );

      // User has returned from scanner - process the scanned data
      final scannerState = scannerBloc.state;
      String? scannedValue;

      // Extract scanned value based on scan type
      if (scanType == 'qr' && scannerState.qrCodes.isNotEmpty) {
        scannedValue = scannerState.qrCodes.lastOrNull;
      } else if (scanType == 'barcode' && scannerState.barCodes.isNotEmpty) {
        scannedValue = scannerState.barCodes.lastOrNull?.toString();
      } else if (scanType == 'any') {
        if (scannerState.qrCodes.isNotEmpty) {
          scannedValue = scannerState.qrCodes.lastOrNull;
        } else if (scannerState.barCodes.isNotEmpty) {
          scannedValue = scannerState.barCodes.lastOrNull?.toString();
        }
      }

      // If we have a scanned value, process it
      if (scannedValue != null && scannedValue.isNotEmpty) {
        debugPrint('OPEN_SCANNER: Scanned value: $scannedValue');

        // Update form data in FlowCrudStateRegistry
        if (screenKey != null) {
          final currentState = FlowCrudStateRegistry().get(screenKey);
          final formData = currentState?.formData ?? {};
          final existingStateWrapper = currentState?.stateWrapper;

          final updatedFormData = {...formData, fieldName: scannedValue};
          final updatedState = (currentState ?? const FlowCrudState()).copyWith(
            formData: updatedFormData,
            stateWrapper: existingStateWrapper, // Preserve stateWrapper
          );

          FlowCrudStateRegistry().update(screenKey, updatedState);

          // Return updated context with scanned value and preserve stateWrapper
          Map<String, dynamic> updatedContext = {
            ...contextData,
            fieldName: scannedValue,
            'formData': updatedFormData,
            'stateWrapper': existingStateWrapper,
          };

          // Execute onSuccess actions if provided
          if (onSuccessActions != null && onSuccessActions.isNotEmpty) {
            debugPrint('OPEN_SCANNER: Executing onSuccess actions');

            // Resolve any template values in the actions using scanned value
            final resolvedActions = _resolveActionsWithContext(
              onSuccessActions,
              {fieldName: scannedValue, ...updatedFormData},
            );

            // Execute onSuccess actions directly
            updatedContext = await ActionHandler.executeActions(
              resolvedActions,
              context,
              updatedContext,
            );
          }

          return updatedContext;
        }
      } else {
        // No value scanned - check for errors
        if (scannerState.error != null && scannerState.error!.isNotEmpty) {
          debugPrint('OPEN_SCANNER: Scanner error: ${scannerState.error}');

          if (onErrorActions != null && onErrorActions.isNotEmpty) {
            Map<String, dynamic> errorContext = {
              ...contextData,
              'errorType': 'scanError',
              'errorMessage': scannerState.error,
            };

            // Execute onError actions directly
            return await ActionHandler.executeActions(
              onErrorActions,
              context,
              errorContext,
            );
          }
        }
      }
    } catch (e, stackTrace) {
      debugPrint('OPEN_SCANNER: Error: $e');
      debugPrint('Stack trace: $stackTrace');

      if (onErrorActions != null && onErrorActions.isNotEmpty) {
        Map<String, dynamic> errorContext = {
          ...contextData,
          'errorType': 'exception',
          'errorMessage': e.toString(),
        };

        // Execute onError actions directly
        return await ActionHandler.executeActions(
          onErrorActions,
          context,
          errorContext,
        );
      }
    }

    return contextData;
  }

  /// Resolves template values in actions using the provided context data
  List<dynamic> _resolveActionsWithContext(
    List<dynamic> actions,
    Map<String, dynamic> contextData,
  ) {
    return actions.map((action) {
      if (action is Map<String, dynamic>) {
        return _resolveMapTemplates(action, contextData);
      }
      return action;
    }).toList();
  }

  /// Recursively resolves template values in a map
  Map<String, dynamic> _resolveMapTemplates(
    Map<String, dynamic> map,
    Map<String, dynamic> contextData,
  ) {
    final resolved = <String, dynamic>{};

    for (final entry in map.entries) {
      final key = entry.key;
      final value = entry.value;

      if (value is String) {
        resolved[key] = resolveValue(value, contextData);
      } else if (value is Map<String, dynamic>) {
        resolved[key] = _resolveMapTemplates(value, contextData);
      } else if (value is List) {
        resolved[key] = value.map((item) {
          if (item is String) {
            return resolveValue(item, contextData);
          } else if (item is Map<String, dynamic>) {
            return _resolveMapTemplates(item, contextData);
          }
          return item;
        }).toList();
      } else {
        resolved[key] = value;
      }
    }

    return resolved;
  }
}
