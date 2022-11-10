import 'package:digit_components/electrons/digit_triangle_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('DigitPointer Widget', (widgetTester) async {
    await widgetTester.pumpWidget(CustomPaint(
        key: const GlobalObjectKey('TRIANGULAR_PAINTER'),
        painter: (DigitTrianglePainter(
          strokeColor: Colors.white,
          strokeWidth: 5,
          paintingStyle: PaintingStyle.fill,
        ))));

    expect(
      find.byKey(const GlobalObjectKey('TRIANGULAR_PAINTER')),
      findsOneWidget,
    );
  });
}
