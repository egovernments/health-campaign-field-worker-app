import 'dart:ui';

import 'package:flutter/material.dart';

/// Draws a dashed oval border with an optional scan line.
/// Used as the camera frame overlay in face capture/verification screens.
class DashedOvalPainter extends CustomPainter {
  final Color borderColor;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;
  final double ovalWidth;
  final double ovalHeight;
  final double centerYOffset;

  /// 0..1 scan progress, or -1 to hide scan line.
  final double scanProgress;
  final Color? scanColor;
  final bool showOverlay;
  final Color overlayColor;

  DashedOvalPainter({
    this.borderColor = const Color(0xFFB0BEC5),
    this.strokeWidth = 2.0,
    this.dashWidth = 8.0,
    this.dashGap = 5.0,
    this.ovalWidth = 220,
    this.ovalHeight = 280,
    this.centerYOffset = -20,
    this.scanProgress = -1,
    this.scanColor,
    this.showOverlay = true,
    this.overlayColor = const Color(0x33000000),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2 + centerYOffset);
    final ovalRect = Rect.fromCenter(
      center: center,
      width: ovalWidth,
      height: ovalHeight,
    );

    // 1) Semi-transparent overlay outside oval
    if (showOverlay) {
      final overlayPath = Path()
        ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
        ..addOval(ovalRect)
        ..fillType = PathFillType.evenOdd;
      canvas.drawPath(overlayPath, Paint()..color = overlayColor);
    }

    // 2) Dashed oval border
    final ovalPath = Path()..addOval(ovalRect);
    final dashPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    for (final metric in ovalPath.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final end = (distance + dashWidth).clamp(0, metric.length).toDouble();
        final extractPath = metric.extractPath(distance, end);
        canvas.drawPath(extractPath, dashPaint);
        distance += dashWidth + dashGap;
      }
    }

    // 3) Corner brackets
    _drawCornerBrackets(canvas, ovalRect);

    // 4) Scan line (when face detected)
    if (scanProgress >= 0) {
      canvas.save();
      canvas.clipPath(Path()..addOval(ovalRect));

      final effectiveColor = scanColor ?? const Color(0xFF00BCD4);
      final lineY = ovalRect.top + (ovalRect.height * scanProgress);

      // Glow
      final glowRect = Rect.fromLTRB(
        ovalRect.left,
        lineY - 25,
        ovalRect.right,
        lineY + 25,
      );
      canvas.drawRect(
        glowRect,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              effectiveColor.withOpacity(0.0),
              effectiveColor.withOpacity(0.2),
              effectiveColor.withOpacity(0.0),
            ],
          ).createShader(glowRect),
      );

      // Line
      canvas.drawLine(
        Offset(ovalRect.left + 16, lineY),
        Offset(ovalRect.right - 16, lineY),
        Paint()
          ..color = effectiveColor
          ..strokeWidth = 1.5
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5),
      );

      canvas.restore();
    }
  }

  void _drawCornerBrackets(Canvas canvas, Rect oval) {
    final paint = Paint()
      ..color = borderColor.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    const len = 20.0;
    const inset = 6.0;

    final tl = Offset(oval.left + inset, oval.top + inset);
    canvas.drawLine(tl, Offset(tl.dx + len, tl.dy), paint);
    canvas.drawLine(tl, Offset(tl.dx, tl.dy + len), paint);

    final tr = Offset(oval.right - inset, oval.top + inset);
    canvas.drawLine(tr, Offset(tr.dx - len, tr.dy), paint);
    canvas.drawLine(tr, Offset(tr.dx, tr.dy + len), paint);

    final bl = Offset(oval.left + inset, oval.bottom - inset);
    canvas.drawLine(bl, Offset(bl.dx + len, bl.dy), paint);
    canvas.drawLine(bl, Offset(bl.dx, bl.dy - len), paint);

    final br = Offset(oval.right - inset, oval.bottom - inset);
    canvas.drawLine(br, Offset(br.dx - len, br.dy), paint);
    canvas.drawLine(br, Offset(br.dx, br.dy - len), paint);
  }

  @override
  bool shouldRepaint(covariant DashedOvalPainter old) {
    return old.borderColor != borderColor ||
        old.scanProgress != scanProgress ||
        old.ovalWidth != ovalWidth ||
        old.ovalHeight != ovalHeight;
  }
}

/// Wraps camera content in a dashed-border rounded rectangle frame.
/// Used in white-theme screens to contain the camera preview area.
class DashedFrameContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsets? margin;

  const DashedFrameContainer({
    super.key,
    required this.child,
    this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
      child: CustomPaint(
        painter: _DashedRectPainter(
          color: const Color(0xFFB0BEC5),
          strokeWidth: 1.5,
          dashWidth: 6,
          dashGap: 4,
          radius: 12,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;
  final double radius;

  _DashedRectPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashGap,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );
    final path = Path()..addRRect(rrect);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final end = (distance + dashWidth).clamp(0, metric.length).toDouble();
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance += dashWidth + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRectPainter old) => false;
}
