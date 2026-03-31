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
        currentSignatureData:
            resolved.resolveField(json['currentSignatureData']),
        existingSignatureData:
            resolved.resolveField(json['existingSignatureData']),
        compareSignatureLabel:
            resolved.resolveText(json['compareSignatureLabel']),
        presentSignatureLabel:
            resolved.resolveText(json['presentSignatureLabel']),
        absentSignatureLabel:
            resolved.resolveText(json['absentSignatureLabel']),
        referenceSignatureLabel:
            resolved.resolveText(json['referenceSignatureLabel']),
        actualSignatureLabel:
            resolved.resolveText(json['actualSignatureLabel']),
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
  final String? currentSignatureData;
  final String? existingSignatureData;
  final String compareSignatureLabel;
  final String presentSignatureLabel;
  final String absentSignatureLabel;
  final String referenceSignatureLabel;
  final String actualSignatureLabel;

  const CompareSignature(
      {super.key,
      required this.resolved,
      required this.onActions,
      required this.individualName,
      required this.individualId,
      required this.registerId,
      required this.currentSignatureData,
      required this.existingSignatureData,
      required this.compareSignatureLabel,
      required this.presentSignatureLabel,
      required this.absentSignatureLabel,
      required this.referenceSignatureLabel,
      required this.actualSignatureLabel});

  @override
  State<CompareSignature> createState() => _CompareSignatureState();
}

class _CompareSignatureState extends State<CompareSignature> {
  String? individualId;
  String? registerId;
  String? status;

  @override
  void initState() {
    individualId = widget.resolved.resolveText(widget.individualId);
    registerId = widget.resolved.resolveText(widget.registerId);
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Text("Name: ${widget.individualName}"),
          const SizedBox(height: spacer2),
          if (widget.existingSignatureData != null)
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius4),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: Base.defaultBorderWidth,
                      color: theme.colorTheme.generic.divider,
                    ),
                    borderRadius: BorderRadius.circular(radius4),
                    color: theme.colorTheme.paper.secondary,
                  ),
                  child: Stack(alignment: Alignment.center, children: [
                    Center(
                      child: Image.memory(
                        base64Decode(widget.existingSignatureData!),
                        color: null,
                        colorBlendMode: null,
                        height: widget.existingSignatureData == null ? 200 : 90,
                        fit: BoxFit.contain,
                        gaplessPlayback: true,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withAlpha(50),
                          border: Border.all(
                            width: Base.defaultBorderWidth,
                            color: Colors.blueAccent,
                          ),
                        ),
                        child:
                            Center(child: Text(widget.referenceSignatureLabel)),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          const SizedBox(height: spacer3),
          if (widget.currentSignatureData != null)
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius4),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: Base.defaultBorderWidth,
                      color: theme.colorTheme.generic.divider,
                    ),
                    borderRadius: BorderRadius.circular(radius4),
                    color: theme.colorTheme.paper.secondary,
                  ),
                  child: Stack(alignment: Alignment.center, children: [
                    Center(
                      child: Image.memory(
                        base64Decode(widget.currentSignatureData!),
                        color: null,
                        colorBlendMode: null,
                        height: widget.existingSignatureData == null ? 200 : 90,
                        fit: BoxFit.contain,
                        gaplessPlayback: true,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withAlpha(50),
                          border: Border.all(
                            width: Base.defaultBorderWidth,
                            color: Colors.blueAccent,
                          ),
                        ),
                        child: Center(child: Text(widget.actualSignatureLabel)),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          const SizedBox(height: spacer4),
        ],
      ),
    );
  }
}
