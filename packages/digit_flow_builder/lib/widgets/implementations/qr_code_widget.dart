import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../action_handler/action_config.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class QrCodeWidget implements FlowWidget {
  @override
  String get format => 'qr_code';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);

    // Get screen key for navigation params resolution
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);

    // For resolving item-specific fields, we use the current item or first item
    final itemStateData = (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
        ? crudCtx.item
        : crudCtx?.stateData?.rawState != null &&
                crudCtx!.stateData!.rawState.isNotEmpty
            ? crudCtx.stateData?.rawState.first
            : null;

    // Resolve the QR data (supports placeholders like {{singleton.loggedInUserUuid}})
    final dataTemplate = json['data'] as String? ?? '';
    final qrData =
        resolveTemplate(dataTemplate, itemStateData, screenKey: screenKey);

    // If no data, return empty widget
    if (qrData.isEmpty) {
      return const SizedBox.shrink();
    }

    // Get size (can be a number or responsive)
    final sizeValue = json['size'];
    double? qrSize;
    if (sizeValue is num) {
      qrSize = sizeValue.toDouble();
    } else if (sizeValue is String) {
      // Support responsive sizes like "small", "medium", "large"
      switch (sizeValue.toLowerCase()) {
        case 'small':
          qrSize = MediaQuery.of(context).size.width / 2;
          break;
        case 'medium':
          qrSize = MediaQuery.of(context).size.width / 1.5;
          break;
        case 'large':
          qrSize = MediaQuery.of(context).size.width / 1.25;
          break;
        default:
          qrSize = MediaQuery.of(context).size.width / 1.5;
      }
    } else {
      // Default size
      qrSize = MediaQuery.of(context).size.width / 1.5;
    }

    // Get version (defaults to auto)
    final version = json['version'] as int? ?? QrVersions.auto;

    // Get colors
    final dataModuleColor =
        _parseColor(json['dataModuleColor']) ?? Colors.black;
    final backgroundColor =
        _parseColor(json['backgroundColor']) ?? Colors.white;

    // Get error correction level
    final errorCorrectionLevel = _parseErrorCorrectionLevel(
      json['errorCorrectionLevel'] as String?,
    );

    // Get padding
    final padding = json['padding'] as num? ?? 10.0;

    // Check if we should show in a dialog/modal
    final showInDialog = json['showInDialog'] as bool? ?? false;

    final qrWidget = Center(
      child: QrImageView(
        data: qrData,
        version: version,
        size: qrSize,
        dataModuleStyle: QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: dataModuleColor,
        ),
        eyeStyle: QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: dataModuleColor,
        ),
        backgroundColor: backgroundColor,
        errorCorrectionLevel: errorCorrectionLevel,
        padding: EdgeInsets.all(padding.toDouble()),
      ),
    );

    // If showInDialog is true, we would typically trigger this via an action
    // For now, just return the QR code widget
    return qrWidget;
  }

  /// Parse color from string (hex or named colors)
  Color? _parseColor(dynamic colorValue) {
    if (colorValue == null) return null;

    if (colorValue is String) {
      // Handle hex colors like "#000000" or "000000"
      final hexColor = colorValue.replaceAll('#', '');
      if (hexColor.length == 6) {
        return Color(int.parse('FF$hexColor', radix: 16));
      } else if (hexColor.length == 8) {
        return Color(int.parse(hexColor, radix: 16));
      }

      // Handle named colors
      switch (colorValue.toLowerCase()) {
        case 'black':
          return Colors.black;
        case 'white':
          return Colors.white;
        case 'red':
          return Colors.red;
        case 'blue':
          return Colors.blue;
        case 'green':
          return Colors.green;
        default:
          return null;
      }
    }

    return null;
  }

  /// Parse error correction level from string
  int _parseErrorCorrectionLevel(String? level) {
    switch (level?.toUpperCase()) {
      case 'L':
        return QrErrorCorrectLevel.L;
      case 'M':
        return QrErrorCorrectLevel.M;
      case 'Q':
        return QrErrorCorrectLevel.Q;
      case 'H':
        return QrErrorCorrectLevel.H;
      default:
        return QrErrorCorrectLevel.L;
    }
  }
}
