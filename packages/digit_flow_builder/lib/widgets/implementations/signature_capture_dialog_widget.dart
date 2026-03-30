import 'dart:convert';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/flow_widget_state.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'dart:ui' as ui;

import '../../action_handler/action_config.dart';
import '../resolved_flow_widget.dart';

class SignatureCaptureWidget extends ResolvedFlowWidget {
  @override
  String get format => 'signatureCapture';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    return WidgetStateContext.reactive(context, (ctx, state) {
      final signatureData = state.widgetData["signatureData"];
      final actionsList = List<Map<String, dynamic>>.from(json['onAction']);
      final actionData = actionsList
              .any((e) => e["actionType"] == "MARK_ATTENDANCE")
          ? actionsList.firstWhere(
              (e) => e["actionType"] == "MARK_ATTENDANCE")["properties"]["data"]
          : null;
      final individualId =
          actionData.firstWhere((e) => e['key'] == 'individualId')['value'];
      final registerId =
          actionData.firstWhere((e) => e['key'] == 'registerId')['value'];
      if (signatureData != null) {
        return CompareSignature(
          resolved: resolved,
          onActions: (data) async {
            await resolved.executeActions(actionsList, context);
            state.updateWidgetData("signatureData", null);
          },
          individualName: json['individualName'] ?? "",
          individualId: individualId,
          registerId: registerId,
          signatureData: signatureData,
          compareSignatureLabel:
              resolved.resolveText(json['compareSignatureLabel']) ?? '',
          presentSignatureLabel:
              resolved.resolveText(json['presentSignatureLabel']) ?? '',
          absentSignatureLabel:
              resolved.resolveText(json['absentSignatureLabel']) ?? '',
        );
      }
      return SignatureCapture(
        individualName: resolved.resolveText(json['individualName']) ?? '',
        captureSignatureLabel:
            resolved.resolveText(json['captureSignatureLabel']) ?? '',
        clearSignatureLabel:
            resolved.resolveText(json['clearSignatureLabel']) ?? '',
        saveSignatureLabel:
            resolved.resolveText(json['saveSignatureLabel']) ?? '',
        signatureRequiredLabel:
            resolved.resolveText(json['signatureRequiredLabel']) ?? '',
        fieldName: resolved.resolveText(json['fieldName']) ?? 'signature',
        onSave: (data) async {
          state.updateWidgetData("signatureData", data);
        },
        resolved: resolved,
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
          // Expanded(
          //   child: DigitCard(padding: const EdgeInsets.all(0), children: [
          //     Image.memory(
          //       base64Decode(existingSignatureData!),
          //       height: 90,
          //       fit: BoxFit.contain,
          //       gaplessPlayback: true,
          //     ),
          //     const Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text("Reference Signature"),
          //       ],
          //     ),
          //   ]),
          // ),
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

/// A dialog that wraps the SignaturePad widget and provides
/// Clear, Cancel, and Save functionality.
class SignatureCapture extends StatefulWidget {
  final String individualName;
  final String captureSignatureLabel;
  final String clearSignatureLabel;
  final String saveSignatureLabel;
  final String signatureRequiredLabel;
  final String fieldName;
  final ResolvedWidgetContext resolved;
  final Function onSave;

  const SignatureCapture({
    super.key,
    required this.individualName,
    required this.captureSignatureLabel,
    required this.clearSignatureLabel,
    required this.saveSignatureLabel,
    required this.signatureRequiredLabel,
    required this.resolved,
    this.fieldName = 'signature',
    required this.onSave,
  });

  @override
  State<SignatureCapture> createState() => _SignatureCaptureState();
}

class _SignatureCaptureState extends State<SignatureCapture> {
  final SignatureController _signatureController = SignatureController();
  final GlobalKey _repaintBoundaryKey = GlobalKey();
  bool _isSaving = false;

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Signature Pad
        Flexible(
          child: DigitCard(
            cardType: CardType.secondary,
            children: [
              AspectRatio(
                aspectRatio: 2,
                child: SignaturePad(
                  controller: _signatureController,
                  repaintBoundaryKey: _repaintBoundaryKey,
                  strokeWidth: 3.0,
                  strokeColor: Colors.black,
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: spacer4),

        // Action Buttons
        Row(
          children: [
            // Clear Button
            Expanded(
              child: DigitButton(
                label: widget.clearSignatureLabel,
                type: DigitButtonType.secondary,
                size: DigitButtonSize.large,
                onPressed: () {
                  _signatureController.clear();
                },
              ),
            ),
            const SizedBox(width: spacer3),
            // Save Button
            Expanded(
              child: DigitButton(
                label: widget.saveSignatureLabel,
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                isDisabled: _isSaving,
                onPressed: _isSaving ? () {} : _saveSignature,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _saveSignature() async {
    // If no new strokes, show error
    if (_signatureController.isEmpty) {
      Toast.showToast(
        context,
        message: widget.signatureRequiredLabel,
        type: ToastType.warning,
      );
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      Uint8List? signatureBytes;

      // Capture new signature
      signatureBytes = await SignaturePad.captureSignature(_repaintBoundaryKey);

      if (signatureBytes != null) {
        // Convert signature bytes to base64 for JSON transport
        final signatureBase64 = base64Encode(signatureBytes);
        widget.onSave(signatureBase64);
      }
    } catch (e) {
      debugPrint('Error saving signature: $e');
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }
}

/// A point in the signature with normalized coordinates (0-1)
class SigPoint {
  final double x;
  final double y;

  const SigPoint(this.x, this.y);
}

/// Controller for managing signature strokes
class SignatureController extends ChangeNotifier {
  final List<List<SigPoint>> _strokes = [];
  List<SigPoint> _currentStroke = [];

  List<List<SigPoint>> get strokes => List.unmodifiable(_strokes);

  bool get isEmpty => _strokes.isEmpty && _currentStroke.isEmpty;

  void startStroke() {
    _currentStroke = [];
  }

  void addPoint(SigPoint point) {
    _currentStroke.add(point);
    notifyListeners();
  }

  void endStroke() {
    if (_currentStroke.isNotEmpty) {
      _strokes.add(List.from(_currentStroke));
      _currentStroke = [];
      notifyListeners();
    }
  }

  void clear() {
    _strokes.clear();
    _currentStroke.clear();
    notifyListeners();
  }

  List<List<SigPoint>> getAllStrokes() {
    if (_currentStroke.isNotEmpty) {
      return [..._strokes, _currentStroke];
    }
    return _strokes;
  }
}

/// A signature pad widget that allows users to draw signatures
class SignaturePad extends StatelessWidget {
  final SignatureController controller;
  final Color strokeColor;
  final double strokeWidth;
  final Color backgroundColor;
  final GlobalKey? repaintBoundaryKey;

  const SignaturePad({
    super.key,
    required this.controller,
    this.strokeColor = Colors.black,
    this.strokeWidth = 3.0,
    this.backgroundColor = Colors.transparent,
    this.repaintBoundaryKey,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: repaintBoundaryKey,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanStart: (_) => controller.startStroke(),
                onPanUpdate: (details) {
                  final local = details.localPosition;
                  // Normalize coordinates to 0-1 range
                  controller.addPoint(
                    SigPoint(
                      local.dx / width,
                      local.dy / height,
                    ),
                  );
                },
                onPanEnd: (_) => controller.endStroke(),
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) => Stack(
                    fit: StackFit.expand,
                    children: [
                      // Draw new strokes on top
                      CustomPaint(
                        painter: _SignaturePainter(
                          controller.getAllStrokes(),
                          strokeColor: strokeColor,
                          strokeWidth: strokeWidth,
                        ),
                        child: const SizedBox.expand(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Captures the signature as PNG bytes
  static Future<Uint8List?> captureSignature(GlobalKey key) async {
    try {
      final boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return null;

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return null;

      return byteData.buffer.asUint8List();
    } catch (e) {
      debugPrint('Error capturing signature: $e');
      return null;
    }
  }
}

class _SignaturePainter extends CustomPainter {
  final List<List<SigPoint>> strokes;
  final Color strokeColor;
  final double strokeWidth;

  _SignaturePainter(
    this.strokes, {
    this.strokeColor = Colors.black,
    this.strokeWidth = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    for (final stroke in strokes) {
      if (stroke.isEmpty) continue;

      if (stroke.length == 1) {
        // Draw a dot for single point
        final point = stroke.first;
        canvas.drawCircle(
          Offset(point.x * size.width, point.y * size.height),
          strokeWidth / 2,
          paint,
        );
        continue;
      }

      final path = Path();
      final first = stroke.first;
      path.moveTo(first.x * size.width, first.y * size.height);

      for (int i = 1; i < stroke.length; i++) {
        final point = stroke[i];
        path.lineTo(point.x * size.width, point.y * size.height);
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SignaturePainter oldDelegate) {
    return true; // Always repaint when notified
  }
}
