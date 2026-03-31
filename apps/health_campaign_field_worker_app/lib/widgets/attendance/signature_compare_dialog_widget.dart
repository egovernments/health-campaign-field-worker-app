import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/flow_widget_state.dart';
import 'package:digit_flow_builder/widgets/resolved_flow_widget.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

class SignatureCompareWidget extends ResolvedFlowWidget {
  @override
  String get format => 'signatureCompare';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    return WidgetStateContext.reactive(context, (ctx, state) {
      final signatureData = state.widgetData["signatureCollection"];
      final actionsList = List<Map<String, dynamic>>.from(json['onAction']);

      final registerId = resolved.resolveText(json['registerId']);
      final individualId = resolved.resolveText(json['individualId']);
      final individualName = resolved.resolveText(json['individualName']);

      return CompareSignature(
        resolved: resolved,
        onActions: (data) async {
          // await resolved.executeActions(actionsList, context);
          // state.updateWidgetData("signatureData", null);
        },
        individualName: individualName,
        individualId: individualId,
        registerId: registerId,
        signatureData: signatureData[individualId]["signatureData"],
        compareSignatureLabel:
            resolved.resolveText(json['compareSignatureLabel']),
        presentSignatureLabel:
            resolved.resolveText(json['presentSignatureLabel']),
        absentSignatureLabel:
            resolved.resolveText(json['absentSignatureLabel']),
      );
    });
  }
}

class CompareSignature extends StatefulWidget {
  final ResolvedWidgetContext resolved;
  final Function onActions;
  final String individualName;
  final String individualId;
  final String registerId;
  final String signatureData;
  final String compareSignatureLabel;
  final String presentSignatureLabel;
  final String absentSignatureLabel;
  const CompareSignature(
      {super.key,
      required this.resolved,
      required this.onActions,
      required this.individualName,
      required this.individualId,
      required this.registerId,
      required this.signatureData,
      required this.compareSignatureLabel,
      required this.presentSignatureLabel,
      required this.absentSignatureLabel});

  @override
  State<CompareSignature> createState() => _CompareSignatureState();
}

class _CompareSignatureState extends State<CompareSignature> {
  String? existingSignatureData;
  String? individualId;
  String? registerId;
  String? status;
  String? signatureData;

  @override
  void initState() {
    individualId = widget.resolved.resolveText(widget.individualId);
    registerId = widget.resolved.resolveText(widget.registerId);
    signatureData = widget.signatureData;
    existingSignatureData = _getExistingSignatureData();
    super.initState();
  }

  String? _getExistingSignatureData() {
    var attendanceLogs = widget.resolved.stateData?.modelMap['attendanceLog']
            as List<dynamic>? ??
        [];
    if (attendanceLogs.isEmpty) return null;
    List log = attendanceLogs
        .where(
          (log) =>
              log['individualId'] == individualId &&
              log['registerId'] == registerId,
        )
        .toList();
    if (log.isNotEmpty) {
      var filterLogs = log.firstWhereOrNull((log) {
        return log['additionalDetails'] != null &&
            log['additionalDetails'].containsKey('signatureData');
      });

      if (filterLogs == null) return null;
      var additionalDetails = filterLogs['additionalDetails'] ?? null;

      var signatureData = additionalDetails != null
          ? additionalDetails['signatureData'] as String?
          : null;
      return signatureData;
    }
    return null;
  }

  Future<void> _markAttendance(
    Map<String, dynamic> data,
    String? compositeKey,
  ) async {
    final individualId = data['individualId']?.toString();
    final registerId = data['registerId']?.toString();
    final status = (data['status'] as num?)?.toDouble() ?? 1.0;
    final isFirstSignature = data['isFirstSignature'] as bool? ?? false;
    final signatureData = data['signatureData'] as String?;

    if (individualId == null || individualId.isEmpty) return;
    if (compositeKey == null) return;

    final currentState = FlowCrudStateRegistry().get(compositeKey);
    final widgetData =
        Map<String, dynamic>.from(currentState?.widgetData ?? {});

    final collection = Map<String, dynamic>.from(
      widgetData['attendanceCollection'] as Map? ?? {},
    );

    // Toggle logic matching _onIndividualAttendanceMark
    final existing = collection[individualId];
    final currentStatus =
        existing is Map ? (existing['status'] as num?)?.toDouble() : null;

    final double finalStatus;
    if (currentStatus == null || currentStatus == -1) {
      finalStatus = status;
    } else if (currentStatus == 1.0 && status == 1.0) {
      finalStatus = 1.0; // already present, keep present
    } else {
      finalStatus = status;
    }

    collection[individualId] = {
      'status': finalStatus,
      'registerId': registerId,
      'individualId': individualId,
      'signatureData': signatureData,
      'isFirstSignature': isFirstSignature,
    };
    widgetData['attendanceCollection'] = collection;

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Text("Name: ${widget.individualName}"),
          const SizedBox(height: spacer2),
          if (existingSignatureData != null)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: Base.defaultBorderWidth,
                    color: theme.colorTheme.generic.divider,
                  ),
                  borderRadius: BorderRadius.circular(radius4),
                  color: theme.colorTheme.paper.secondary,
                ),
                child: Column(children: [
                  Center(
                    child: Image.memory(
                      base64Decode(existingSignatureData!),
                      color: null,
                      colorBlendMode: null,
                      height: existingSignatureData == null ? 200 : 90,
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withAlpha(50),
                      border: Border.all(
                        width: Base.defaultBorderWidth,
                        color: Colors.blueAccent,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(radius4),
                        bottomRight: Radius.circular(radius4),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Reference Signature"),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          const SizedBox(height: spacer3),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: Base.defaultBorderWidth,
                  color: theme.colorTheme.generic.divider,
                ),
                borderRadius: BorderRadius.circular(radius4),
                color: theme.colorTheme.paper.secondary,
              ),
              child: Column(children: [
                Center(
                  child: Image.memory(
                    base64Decode(widget.signatureData),
                    color: null,
                    colorBlendMode: null,
                    height: existingSignatureData == null ? 200 : 90,
                    fit: BoxFit.contain,
                    gaplessPlayback: true,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withAlpha(50),
                    border: Border.all(
                      width: Base.defaultBorderWidth,
                      color: Colors.blueAccent,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(radius4),
                      bottomRight: Radius.circular(radius4),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Actual Signature"),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(height: spacer4),

          // Action Buttons
          Row(
            children: [
              // Clear Button
              Expanded(
                child: DigitButton(
                  label: widget.presentSignatureLabel,
                  type: DigitButtonType.primary,
                  size: DigitButtonSize.small,
                  digitButtonThemeData: DigitButtonThemeData(
                    primaryDigitButtonColor:
                        DigitButtonThemeData.defaultTheme(context)
                            .primaryDigitButtonColor,
                    DigitButtonColor: Colors.green,
                    disabledColor: DigitButtonThemeData.defaultTheme(context)
                        .disabledColor,
                    radius: BorderRadius.circular(spacer3),
                    largeRadius: BorderRadius.circular(spacer3),
                    smallMediumRadius: BorderRadius.circular(spacer3),
                    padding: const EdgeInsets.all(spacer3),
                  ),
                  prefixIcon: Icons.check,
                  onPressed: () {
                    Map<String, dynamic> attendanceData = {
                      'individualId': individualId,
                      'registerId': registerId,
                      'status': 1.0,
                      'signatureData': signatureData,
                      'isFirstSignature': existingSignatureData ==
                          null, // Mark as first signature if no existing signature
                    };
                    _markAttendance(
                      attendanceData,
                      widget.resolved.compositeKey,
                    );
                    widget.onActions(attendanceData);
                  },
                ),
              ),
              const SizedBox(width: spacer3),
              // Save Button
              Expanded(
                child: DigitButton(
                    label: widget.absentSignatureLabel,
                    type: DigitButtonType.primary,
                    size: DigitButtonSize.small,
                    digitButtonThemeData: DigitButtonThemeData(
                      primaryDigitButtonColor:
                          DigitButtonThemeData.defaultTheme(context)
                              .primaryDigitButtonColor,
                      DigitButtonColor: Colors.red,
                      disabledColor: DigitButtonThemeData.defaultTheme(context)
                          .disabledColor,
                      radius: BorderRadius.circular(spacer3),
                      largeRadius: BorderRadius.circular(spacer3),
                      smallMediumRadius: BorderRadius.circular(spacer3),
                      padding: const EdgeInsets.all(spacer3),
                    ),
                    prefixIcon: Icons.close,
                    onPressed: () async {
                      Map<String, dynamic> attendanceData = {
                        'individualId':
                            widget.resolved.resolveText(widget.individualId),
                        'registerId':
                            widget.resolved.resolveText(widget.registerId),
                        'status': 0.0,
                        'signatureData': widget.signatureData,
                        'isFirstSignature': existingSignatureData ==
                            null, // Mark as first signature if no existing signature
                      };
                      _markAttendance(
                        attendanceData,
                        widget.resolved.compositeKey,
                      );
                      widget.onActions(attendanceData);
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
