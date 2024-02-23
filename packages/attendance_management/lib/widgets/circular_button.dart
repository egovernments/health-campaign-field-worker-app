import 'dart:math';

import 'package:attendance_management/attendance_management.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../utils/i18_key_constants.dart' as i18;

class CircularButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final double index;
  final bool isNotGreyed;
  final void Function()? onTap;
  final bool viewOnly;

  //set index -1 to not select the Circular button
  //set index 0 for empty circle with red border
  //set index 0.5 to select half of the Circular button
  //set index 1 to completely select the Circular button
  // set isNotGreyed to true if your background is white else false

  const CircularButton({
    super.key,
    required this.icon,
    required this.size,
    required this.color,
    required this.index,
    required this.isNotGreyed,
    this.onTap,
    this.viewOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: viewOnly ? null : onTap,
        child: index == 0.5
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      kPadding / 4,
                    ),
                    child: CustomPaint(
                      size: const Size(
                        30,
                        30,
                      ),
                      painter: HalfCirclePainter(
                        color: const DigitColors().amber,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: kPadding / 2,
                    ),
                    child: Text(
                      AttendanceLocalization.of(context)
                          .translate(i18.attendance.halfDay),
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.labelSmall
                          ?.apply(
                        color: const DigitColors().amber,
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.all(
                      kPadding / 4,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index.isNegative || index == 0.0
                          ? Colors.white
                          : index == 0.5
                              ? const DigitColors().amber
                              : const DigitColors().darkSpringGreen,
                      border: Border.all(
                        width: 2,
                        color: onTap != null
                            ? index.isNegative
                                ? Colors.black
                                : index == 0.0
                                    ? const DigitColors().lavaRed
                                    : index == 0.5
                                        ? const DigitColors().amber
                                        : const DigitColors().darkSpringGreen
                            : const DigitColors().cloudGray,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  if (index != -1)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: kPadding / 2,
                      ),
                      child: Text(
                        AttendanceLocalization.of(context).translate(
                            index == 0.0
                                ? i18.attendance.absent
                                : i18.attendance.present),
                        style: DigitTheme
                            .instance.mobileTheme.textTheme.labelSmall
                            ?.apply(
                          color: index == 0.0
                              ? const DigitColors().lavaRed
                              : const DigitColors().darkSpringGreen,
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  final Color color;

  const HalfCirclePainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, size.height / 2)
      ..arcTo(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        pi / 2, // Start angle at -90 degrees (top)
        pi, // Sweep angle of pi radians (180 degrees)
        true,
      )
      ..lineTo(size.width / 2, 0) // Draw a line to the top center
      ..close(); // Close the path

    canvas.drawPath(path, paint);

    // Draw yellow border around the entire circle
    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius,
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
