import 'package:digit_components/utils/validators/validator.dart';
import 'package:digit_components/widgets/atoms/digit_location_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';

class MockGeolocator extends Mock implements GeolocatorPlatform {}

void main() {
  group('DigitTextFormInput Tests', () {
    late TextEditingController controller;
    late MockGeolocator mockGeolocator;

    setUp(() {
      controller = TextEditingController();
      mockGeolocator = MockGeolocator();
    });

    testWidgets('Initial rendering', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitLocationFormInput(controller: controller),
          ),
        ),
      );

      // Ensure the widget is rendered
      expect(find.byType(DigitLocationFormInput), findsOneWidget);
    });

    // TODO

    // testWidgets('Location permission denied does not update controller text', (WidgetTester tester) async {
    //   when(mockGeolocator.checkPermission()).thenAnswer((_) async => LocationPermission.denied);
    //
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: DigitLocationFormInput(controller: controller),
    //       ),
    //     ),
    //   );
    //
    //   // Tap the suffix icon to get location
    //   await tester.tap(find.byIcon(Icons.my_location));
    //
    //   // Allow time for the asynchronous operation to complete
    //   await tester.pumpAndSettle();
    //   print('tttttttttttttttttttttt${controller.text}');
    //
    //   // Ensure the controller's text is not updated
    //   expect(controller.text, isEmpty);
    // });

    // TODO

    // testWidgets('Location permission granted updates controller text', (WidgetTester tester) async {
    //   when(mockGeolocator.checkPermission()).thenAnswer((_) async => LocationPermission.whileInUse);
    //   when(mockGeolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high))
    //       .thenAnswer((_) async => Position(latitude: 40.7128, longitude: -74.0060));
    //
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: DigitLocationFormInput(controller: controller),
    //       ),
    //     ),
    //   );
    //
    //   // Tap the suffix icon to get location
    //   await tester.tap(find.byIcon(Icons.my_location));
    //   await tester.pumpAndSettle();
    //
    //   // Ensure the controller's text is updated with the location
    //   expect(controller.text, equals("40.7128, -74.0060"));
    // });

    //TODO

    // testWidgets('Location permission denied shows error message', (WidgetTester tester) async {
    //   when(mockGeolocator.checkPermission()).thenAnswer((_) async => LocationPermission.denied);
    //
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: DigitLocationFormInput(
    //           controller: controller,
    //           validations: [Validator(ValidatorType.required, 'Location is required')],
    //         ),
    //       ),
    //     ),
    //   );
    //
    //   // Tap the suffix icon to get location
    //   await tester.tap(find.byIcon(Icons.my_location));
    //   await tester.pumpAndSettle();
    //
    //   // Ensure the validation error is displayed
    //   expect(find.text('Location is required'), findsOneWidget);
    // });


  });
}
