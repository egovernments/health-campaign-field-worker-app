import 'dart:convert';
import 'dart:typed_data';

import 'package:digit_flow_builder/utils/flow_widget_state.dart';
import 'package:digit_ui_components/digit_components.dart';
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
      final fieldKey = resolved.resolveText(json['fieldKey']);
      final groupKey = resolved.resolveText(json['groupKey']);

      if (json['fieldKey'] == null || json['groupKey'] == null) {
        throw ArgumentError(
            'fieldKey and groupKey are required for signatureCapture widget');
      }

      Map<String, dynamic>? previousSignetureData = state.widgetData[groupKey];

      final actionsList = List<Map<String, dynamic>>.from(json['onAction']);
      return SignatureCapture(
        captureSignatureLabel:
            resolved.resolveText(json['captureSignatureLabel']),
        clearSignatureLabel: resolved.resolveText(json['clearSignatureLabel']),
        saveSignatureLabel: resolved.resolveText(json['saveSignatureLabel']),
        signatureRequiredLabel:
            resolved.resolveText(json['signatureRequiredLabel']),
        fieldName: resolved.resolveText(json['fieldName']),
        resolved: resolved,
        onSave: (data) async {
          state.updateWidgetData(
              groupKey, {...?previousSignetureData, fieldKey: data});
          await resolved.executeActions(actionsList, context);
        },
      );
    });
  }
}

/// A dialog that wraps the SignaturePad widget and provides
/// Clear, Cancel, and Save functionality.
class SignatureCapture extends StatefulWidget {
  final String captureSignatureLabel;
  final String clearSignatureLabel;
  final String saveSignatureLabel;
  final String signatureRequiredLabel;
  final String fieldName;
  final ResolvedWidgetContext resolved;
  final Function onSave;

  const SignatureCapture({
    super.key,
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
        widget.onSave({
          "encoding": "base64",
          "signatureData": signatureBase64,
        });
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
