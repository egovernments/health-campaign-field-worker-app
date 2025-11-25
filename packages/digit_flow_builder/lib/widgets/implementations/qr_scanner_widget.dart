import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../utils/widget_parsers.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

/// Scanner Button Widget
///
/// A button that opens the scanner page and waits for scan results.
/// When user returns after scanning, it processes the scanned data and executes onChange actions.
///
/// This ensures onChange actions only execute AFTER returning from the scanner page.
class QRScannerWidget implements FlowWidget {
  @override
  String get format => 'qrScanner';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final localization = LocalizationContext.maybeOf(context);
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);

    // Button configuration
    final labelText = json['label'] as String? ?? 'Scan QR Code';
    final localizedLabel = localization?.translate(labelText) ?? labelText;

    final properties = json['properties'] as Map<String, dynamic>? ?? {};
    final buttonType = WidgetParsers.parseButtonType(properties['type']);
    final buttonSize = WidgetParsers.parseButtonSize(properties['size']);
    final mainAxisSize =
        WidgetParsers.parseMainAxisSize(properties['mainAxisSize']);
    final mainAxisAlignment =
        WidgetParsers.parseMainAxisAlignment(properties['mainAxisAlignment']);

    final prefixIcon = json['prefixIcon'] != null
        ? DigitIconMapping.getIcon(json['prefixIcon'])
        : null;
    final suffixIcon = json['suffixIcon'] != null
        ? DigitIconMapping.getIcon(json['suffixIcon'])
        : null;

    // Scanner configuration
    final key = json['key'] as String? ?? 'scannedData';
    final scanType = json['scanType'] as String? ?? 'qr';
    final updateFormData = json['updateFormData'] as bool? ?? true;
    final storeAsList = json['storeAsList'] as bool? ?? false;

    // Get onChange and onError actions
    final onChangeActions = json['onChange'] as List<dynamic>?;
    final onErrorActions = json['onError'] as List<dynamic>?;

    // Validation configuration
    final validation = json['validation'] as Map<String, dynamic>?;
    final maxScans = validation?['maxScans'] as int?;
    final preventDuplicates =
        validation?['preventDuplicates'] as bool? ?? false;

    return DigitButton(
      label: localizedLabel,
      type: buttonType,
      size: buttonSize,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: () async {
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
            builder: (scannerContext) => const DigitScannerPage(
              quantity: 1,
              isGS1code: false,
              singleValue: true,
            ),
            settings: const RouteSettings(name: '/qr-scanner'),
          ),
        );

        // User has returned from scanner - now process the scanned data
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
          debugPrint('Scanned value after return: $scannedValue');

          // Get current form data
          final currentState =
              screenKey != null ? FlowCrudStateRegistry().get(screenKey) : null;
          final formData = currentState?.formData ?? {};

          // Check if this value was already processed
          final previousValue = formData[key];
          if (previousValue == scannedValue) {
            debugPrint('Value already processed: $scannedValue');
            return;
          }

          // Validation checks
          if (storeAsList && preventDuplicates) {
            final existingList = formData[key] as List<dynamic>? ?? [];
            if (existingList.contains(scannedValue)) {
              debugPrint('Duplicate scan detected: $scannedValue');
              _executeActions(
                onErrorActions ?? [],
                context,
                onAction,
                screenKey,
                {
                  ...formData,
                  'errorType': 'duplicate',
                  'scannedValue': scannedValue
                },
              );
              return;
            }
          }

          if (storeAsList && maxScans != null) {
            final existingList = formData[key] as List<dynamic>? ?? [];
            if (existingList.length >= maxScans) {
              debugPrint('Max scans reached: $maxScans');
              _executeActions(
                onErrorActions ?? [],
                context,
                onAction,
                screenKey,
                {
                  ...formData,
                  'errorType': 'maxScans',
                  'scannedValue': scannedValue
                },
              );
              return;
            }
          }

          // Update form data
          if (updateFormData && screenKey != null) {
            Map<String, dynamic> updatedFormData;

            if (storeAsList) {
              final existingList = formData[key] as List<dynamic>? ?? [];
              updatedFormData = {
                ...formData,
                key: [...existingList, scannedValue],
              };
            } else {
              updatedFormData = {...formData, key: scannedValue};
            }

            final updatedState =
                (currentState ?? const FlowCrudState()).copyWith(
              formData: updatedFormData,
            );

            FlowCrudStateRegistry().update(screenKey, updatedState);

            // Execute onChange actions now that we're back on main screen
            if (onChangeActions != null && onChangeActions.isNotEmpty) {
              debugPrint(
                  'Executing onChange actions with value: $scannedValue');
              _executeActions(
                onChangeActions,
                context,
                onAction,
                screenKey,
                updatedFormData,
              );
            }
          } else {
            // Execute onChange actions with scanned value
            if (onChangeActions != null && onChangeActions.isNotEmpty) {
              _executeActions(
                onChangeActions,
                context,
                onAction,
                screenKey,
                {...formData, key: scannedValue},
              );
            }
          }
        }

        // Handle scanner errors
        if (scannerState.error != null && scannerState.error!.isNotEmpty) {
          debugPrint('Scanner error: ${scannerState.error}');

          final currentState =
              screenKey != null ? FlowCrudStateRegistry().get(screenKey) : null;
          final formData = currentState?.formData ?? {};

          if (onErrorActions != null && onErrorActions.isNotEmpty) {
            _executeActions(
              onErrorActions,
              context,
              onAction,
              screenKey,
              {
                ...formData,
                'errorType': 'scanError',
                'errorMessage': scannerState.error
              },
            );
          }
        }
      },
    );
  }

  /// Executes a list of actions with context data (following button_widget pattern)
  void _executeActions(
    List<dynamic> actions,
    BuildContext context,
    void Function(ActionConfig) onAction,
    String? screenKey,
    Map<String, dynamic> contextData,
  ) {
    for (var actionJson in actions) {
      if (actionJson is! Map<String, dynamic>) continue;

      try {
        var action = ActionConfig.fromJson(actionJson);

        // Resolve data array if present (for SEARCH_EVENT, NAVIGATION, etc.)
        final dataArray = action.properties['data'] as List<dynamic>?;
        if (dataArray != null) {
          final resolvedData = dataArray.map((entry) {
            final key = entry['key'] as String;
            final rawValue = entry['value'];
            final operation = entry['operation'];

            // Resolve value from contextData (scanned value is here)
            final resolvedValue = resolveValue(rawValue, contextData);

            return {
              "key": key,
              "value": resolvedValue,
              if (operation != null) "operation": operation,
            };
          }).toList();

          action = ActionConfig(
            action: action.action,
            actionType: action.actionType,
            properties: {
              ...action.properties,
              'data': resolvedData,
            },
            condition: action.condition,
            actions: action.actions,
          );
        }

        // Call onAction - let the action handler system deal with execution
        onAction(action);
      } catch (e) {
        debugPrint('Error executing action: $e');
      }
    }
  }
}
