import 'package:complaints/widgets/no_result_card/no_result_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NoResultCard displays SVG and label correctly',
      (WidgetTester tester) async {
    // Test with custom label
    const customLabel = 'No complaints found';

    // Build the widget tree
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: NoResultCard(label: customLabel),
        ),
      ),
    );

    // Check that the SVG is rendered (you can also check for specific attributes if needed)
    expect(find.byType(SvgPicture), findsOneWidget);

    // Check if the custom label is displayed correctly
    expect(find.text(customLabel), findsOneWidget);

    // Test with no label
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: NoResultCard(),
        ),
      ),
    );

    // Check that the SVG is still rendered
    expect(find.byType(SvgPicture), findsOneWidget);

    // Check that no label is rendered (empty label passed)
    expect(find.text(''), findsOneWidget);
  });
}
