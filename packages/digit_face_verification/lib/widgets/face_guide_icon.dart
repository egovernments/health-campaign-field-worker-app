import 'dart:math';
import 'package:flutter/material.dart';

/// Visual face guide showing the expected head pose for each enrollment step.
/// Uses a simple face illustration with directional arrows/indicators.
class FaceGuideIcon extends StatefulWidget {
  final FaceGuideType type;
  final double size;

  const FaceGuideIcon({
    super.key,
    required this.type,
    this.size = 80,
  });

  @override
  State<FaceGuideIcon> createState() => _FaceGuideIconState();
}

class _FaceGuideIconState extends State<FaceGuideIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: _FaceGuidePainter(
            type: widget.type,
            animValue: _animation.value,
          ),
        );
      },
    );
  }
}

enum FaceGuideType {
  front,
  blink,
  turnLeft,
  turnRight,
  lookUp,
  lookDown,
}

class _FaceGuidePainter extends CustomPainter {
  final FaceGuideType type;
  final double animValue;

  _FaceGuidePainter({required this.type, required this.animValue});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final faceRadius = size.width * 0.35;

    // Draw face outline
    final facePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    // Apply rotation/offset based on type
    canvas.save();
    switch (type) {
      case FaceGuideType.turnLeft:
        final offset = animValue * size.width * 0.08;
        canvas.translate(-offset, 0);
        break;
      case FaceGuideType.turnRight:
        final offset = animValue * size.width * 0.08;
        canvas.translate(offset, 0);
        break;
      case FaceGuideType.lookUp:
        final offset = animValue * size.height * 0.06;
        canvas.translate(0, -offset);
        break;
      case FaceGuideType.lookDown:
        final offset = animValue * size.height * 0.06;
        canvas.translate(0, offset);
        break;
      default:
        break;
    }

    // Face oval
    canvas.drawOval(
      Rect.fromCenter(
        center: center,
        width: faceRadius * 2,
        height: faceRadius * 2.4,
      ),
      facePaint..color = Colors.white.withOpacity(0.15),
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: center,
        width: faceRadius * 2,
        height: faceRadius * 2.4,
      ),
      borderPaint,
    );

    // Eyes
    final eyeY = center.dy - faceRadius * 0.2;
    final eyeSpacing = faceRadius * 0.45;
    final eyeWidth = faceRadius * 0.28;

    if (type == FaceGuideType.blink) {
      // Animated blink: eyes close and open
      final eyeOpenness = (1.0 - animValue).clamp(0.15, 1.0);
      final eyeHeight = eyeWidth * 0.5 * eyeOpenness;
      _drawEye(canvas, Offset(center.dx - eyeSpacing, eyeY), eyeWidth,
          eyeHeight, borderPaint);
      _drawEye(canvas, Offset(center.dx + eyeSpacing, eyeY), eyeWidth,
          eyeHeight, borderPaint);
    } else {
      // Normal open eyes
      _drawEye(canvas, Offset(center.dx - eyeSpacing, eyeY), eyeWidth,
          eyeWidth * 0.5, borderPaint);
      _drawEye(canvas, Offset(center.dx + eyeSpacing, eyeY), eyeWidth,
          eyeWidth * 0.5, borderPaint);
      // Pupils
      final pupilPaint = Paint()..color = Colors.white.withOpacity(0.9);
      canvas.drawCircle(
          Offset(center.dx - eyeSpacing, eyeY), eyeWidth * 0.15, pupilPaint);
      canvas.drawCircle(
          Offset(center.dx + eyeSpacing, eyeY), eyeWidth * 0.15, pupilPaint);
    }

    // Nose (small line)
    final nosePaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(center.dx, center.dy + faceRadius * 0.05),
      Offset(center.dx, center.dy + faceRadius * 0.35),
      nosePaint,
    );

    // Mouth (small arc)
    final mouthRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + faceRadius * 0.6),
      width: faceRadius * 0.5,
      height: faceRadius * 0.2,
    );
    canvas.drawArc(mouthRect, 0.1, pi - 0.2, false, nosePaint);

    canvas.restore();

    // Draw directional arrow outside the face
    _drawDirectionArrow(canvas, size, center, faceRadius);
  }

  void _drawEye(Canvas canvas, Offset center, double width, double height,
      Paint paint) {
    canvas.drawOval(
      Rect.fromCenter(center: center, width: width, height: max(height, 2)),
      paint,
    );
  }

  void _drawDirectionArrow(
      Canvas canvas, Size size, Offset center, double faceRadius) {
    final arrowPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final arrowLen = faceRadius * 0.5;
    final headLen = arrowLen * 0.35;

    switch (type) {
      case FaceGuideType.turnLeft:
        final startX = center.dx - faceRadius * 1.4;
        final arrowY = center.dy;
        final offset = animValue * 6;
        // Arrow pointing left
        canvas.drawLine(
          Offset(startX + arrowLen - offset, arrowY),
          Offset(startX - offset, arrowY),
          arrowPaint,
        );
        canvas.drawLine(
          Offset(startX - offset, arrowY),
          Offset(startX + headLen - offset, arrowY - headLen),
          arrowPaint,
        );
        canvas.drawLine(
          Offset(startX - offset, arrowY),
          Offset(startX + headLen - offset, arrowY + headLen),
          arrowPaint,
        );
        break;

      case FaceGuideType.turnRight:
        final startX = center.dx + faceRadius * 1.4;
        final arrowY = center.dy;
        final offset = animValue * 6;
        // Arrow pointing right
        canvas.drawLine(
          Offset(startX - arrowLen + offset, arrowY),
          Offset(startX + offset, arrowY),
          arrowPaint,
        );
        canvas.drawLine(
          Offset(startX + offset, arrowY),
          Offset(startX - headLen + offset, arrowY - headLen),
          arrowPaint,
        );
        canvas.drawLine(
          Offset(startX + offset, arrowY),
          Offset(startX - headLen + offset, arrowY + headLen),
          arrowPaint,
        );
        break;

      case FaceGuideType.lookUp:
        final arrowX = center.dx;
        final startY = center.dy - faceRadius * 1.6;
        final offset = animValue * 6;
        // Arrow pointing up
        canvas.drawLine(
          Offset(arrowX, startY + arrowLen - offset),
          Offset(arrowX, startY - offset),
          arrowPaint,
        );
        canvas.drawLine(
          Offset(arrowX, startY - offset),
          Offset(arrowX - headLen, startY + headLen - offset),
          arrowPaint,
        );
        canvas.drawLine(
          Offset(arrowX, startY - offset),
          Offset(arrowX + headLen, startY + headLen - offset),
          arrowPaint,
        );
        break;

      case FaceGuideType.lookDown:
        final arrowX = center.dx;
        final startY = center.dy + faceRadius * 1.6;
        final offset = animValue * 6;
        // Arrow pointing down
        canvas.drawLine(
          Offset(arrowX, startY - arrowLen + offset),
          Offset(arrowX, startY + offset),
          arrowPaint,
        );
        canvas.drawLine(
          Offset(arrowX, startY + offset),
          Offset(arrowX - headLen, startY - headLen + offset),
          arrowPaint,
        );
        canvas.drawLine(
          Offset(arrowX, startY + offset),
          Offset(arrowX + headLen, startY - headLen + offset),
          arrowPaint,
        );
        break;

      case FaceGuideType.blink:
        // Blinking arrows pointing at the eyes
        final arrowOpacity = (1.0 - animValue).clamp(0.3, 1.0);
        arrowPaint.color = Colors.white.withOpacity(arrowOpacity);
        // Small downward arrows near each eye
        final eyeY = center.dy - faceRadius * 0.2;
        for (final eyeX in [
          center.dx - faceRadius * 0.45,
          center.dx + faceRadius * 0.45
        ]) {
          final topY = eyeY - faceRadius * 0.55;
          canvas.drawLine(
            Offset(eyeX, topY),
            Offset(eyeX, topY + faceRadius * 0.2),
            arrowPaint,
          );
          canvas.drawLine(
            Offset(eyeX, topY + faceRadius * 0.2),
            Offset(eyeX - 4, topY + faceRadius * 0.12),
            arrowPaint,
          );
          canvas.drawLine(
            Offset(eyeX, topY + faceRadius * 0.2),
            Offset(eyeX + 4, topY + faceRadius * 0.12),
            arrowPaint,
          );
        }
        break;

      case FaceGuideType.front:
        // No arrow for front face — just a checkmark-style circle
        break;
    }
  }

  @override
  bool shouldRepaint(covariant _FaceGuidePainter oldDelegate) =>
      oldDelegate.type != type || oldDelegate.animValue != animValue;
}
