import 'package:digit_data_model/models/entities/attendee.dart';
import 'package:digit_data_model/models/entities/scanned_individual_data.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/widget_parsers.dart';
import 'package:digit_flow_builder/widget_registry.dart';
import 'package:digit_flow_builder/widgets/localization_context.dart';
import 'package:digit_flow_builder/widgets/resolved_flow_widget.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/attendance_qr_scanner.dart';
import '../../utils/i18_key_constants.dart' as i18;

class AttendanceQrScannerButton extends ResolvedFlowWidget {
  @override
  String get format => 'attendanceQRScannerButton';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final stateData = resolved.stateData;
    final crudCtx = CrudItemContext.of(context);
    final compositeKey = crudCtx?.compositeKey;

    final enableDynamicQRScanning =
        resolved.resolveField(json['enableDynamicQRScanning']) ?? true;

    final attendees = stateData?.modelMap['attendees'] as List<dynamic>? ?? [];

    final registerId = json['registerId'];
    final props = Map<String, dynamic>.from(json['properties'] ?? {});
    String padding = props['padding'] ?? 'spacer2';

    return WidgetParsers.wrapWithBottomGap(
      DigitButton(
        crossAxisAlignment: CrossAxisAlignment.center,
        label: resolved.resolvedLabel ?? '',
        isDisabled: resolved.isDisabled,
        onPressed: () async {
          if (json['onAction'] != null) {
            final actionsList =
                List<Map<String, dynamic>>.from(json['onAction']);
            await resolved.executeActions(actionsList, context);
          }
          final scannerBloc = context.read<DigitScannerBloc>();

          scannerBloc.add(
            const DigitScannerEvent.handleScanner(
              barCode: [],
              qrCode: [],
            ),
          );
          _openAttendanceScanner(context, compositeKey, registerId, attendees,
              enableDynamicQRScanning, (scannedData) async {});
        },
        type: WidgetParsers.parseButtonType(props['type']),
        size: WidgetParsers.parseButtonSize(props['size']),
        digitButtonThemeData: DigitButtonThemeData(
          primaryDigitButtonColor: DigitButtonThemeData.defaultTheme(context)
              .primaryDigitButtonColor,
          DigitButtonColor: colorMap[props["color"]] ??
              DigitButtonThemeData.defaultTheme(context).DigitButtonColor,
          disabledColor:
              DigitButtonThemeData.defaultTheme(context).disabledColor,
          radius: BorderRadius.circular(spacer3),
          largeRadius: BorderRadius.circular(spacer3),
          smallMediumRadius: BorderRadius.circular(spacer3),
          padding: EdgeInsets.all(WidgetParsers.parseSize(padding)),
        ),
        iconColor: colorMap[props["color"]],
        textColor: colorMap[props["color"]],
        mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
        mainAxisAlignment:
            WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
        suffixIcon: json['suffixIcon'] != null
            ? DigitIconMapping.getIcon(json['suffixIcon'])
            : null,
        prefixIcon: json['prefixIcon'] != null
            ? DigitIconMapping.getIcon(json['prefixIcon'])
            : null,
      ),
      props,
    );
  }

  Future<void> _openAttendanceScanner(
    BuildContext context,
    String? compositeKey,
    dynamic registerId,
    List<dynamic> attendees,
    bool enableDynamicQRScanning,
    Future<void> Function(ScannedIndividualDataModel) onSelected,
  ) async {
    // Navigate to scanner and await return
    List<AttendeeModel> attendeeModels = attendees.map<AttendeeModel>((e) {
      AttendeeModel attendee = e['entity'];
      String? individualNumber = e['individual'].first?.individualId;
      return attendee.copyWith(
        individualNumber: individualNumber,
      );
    }).toList();
    var manual = await Navigator.of(context).push(MaterialPageRoute(
      builder: (scanContext) => AttendanceDigitScannerPage(
        quantity: attendees.length,
        isGS1code: false,
        singleValue: false,
        attendees: attendeeModels,
        enableDynamicQRScanning: enableDynamicQRScanning,
        onScanResult: (scannedData, result) {
          if (result.isValid) {
            Map<String, dynamic> data = {
              "individualId": _getIndividualId(scannedData, attendeeModels),
              "isMarkedManually": scannedData
                  .manualEntry, // indicate manual marking for present
              "qrCreatedTime": scannedData.qrCreatedTime,
            };
            _markAttendance(data, compositeKey);
            onSelected(scannedData);
          } else {
            final localization = LocalizationContext.maybeOf(context);
            Toast.showToast(context,
                message: localization?.translate(
                      result.errorMessage!,
                    ) ??
                    result.errorMessage ??
                    i18.attendance.invalidQRCode,
                type: ToastType.error);
            context.read<DigitScannerBloc>().add(
                  const DigitScannerEvent.handleScanner(
                    barCode: [],
                    qrCode: [],
                  ),
                );
          }
        },
      ),
    ));
    if (manual != null) {
      _manualDataEntry(manual, compositeKey);
    }
  }

  _getIndividualId(
      ScannedIndividualDataModel user, List<AttendeeModel> attendeeModels) {
    var id = attendeeModels
        .firstWhere((e) => e.individualNumber == user.individualId!)
        .individualId!;

    return id;
  }

  Future<void> _manualDataEntry(
    Map<String, dynamic> data,
    String? compositeKey,
  ) async {
    if (compositeKey == null) return;

    final currentState = FlowCrudStateRegistry().get(compositeKey);
    final widgetData =
        Map<String, dynamic>.from(currentState?.widgetData ?? {});

    widgetData["attendanceManualData"] = data;

    if (currentState != null) {
      final updatedState = currentState.copyWith(
        widgetData: widgetData,
      );
      FlowCrudStateRegistry().update(compositeKey, updatedState);
    } else {
      final newState = FlowCrudState(
        widgetData: widgetData,
      );
      FlowCrudStateRegistry().update(compositeKey, newState);
    }
  }

  Future<void> _markAttendance(
    Map<String, dynamic> data,
    String? compositeKey,
  ) async {
    final individualId = data['individualId']?.toString();
    final isMarkedManually = data['isMarkedManually'] as bool? ?? false;
    final qrCreatedTime = data['qrCreatedTime'] as int?;

    if (individualId == null || individualId.isEmpty) return;
    if (compositeKey == null) return;

    final currentState = FlowCrudStateRegistry().get(compositeKey);
    final widgetData =
        Map<String, dynamic>.from(currentState?.widgetData ?? {});

    final collection = Map<String, dynamic>.from(
      widgetData['attendanceCollection'] as Map? ?? {},
    );

    final attendanceQRCollection = Map<String, dynamic>.from(
      widgetData['attendanceQRCollection'] as Map? ?? {},
    );

    collection[individualId] = "present";
    attendanceQRCollection[individualId] = {
      "isMarkedManually": isMarkedManually,
      "qrCreatedTime": qrCreatedTime,
    };

    widgetData['attendanceCollection'] = collection;
    widgetData['attendanceQRCollection'] = attendanceQRCollection;
    if (currentState != null) {
      final updatedState = currentState.copyWith(
        widgetData: widgetData,
      );
      FlowCrudStateRegistry().update(compositeKey, updatedState);
    } else {
      final newState = FlowCrudState(
        widgetData: widgetData,
      );
      FlowCrudStateRegistry().update(compositeKey, newState);
    }
  }

  Map<String, Color> colorMap = {'green': Colors.green};
}
