import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/blocs/auth/auth.dart';
import 'package:health_campaign_field_worker_app/pages/login.dart';
import 'package:mocktail/mocktail.dart';

import '../widget_app.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  group('Login page', () {
    final mockObserver = MockNavigatorObserver();

    Future<void> buildTester(WidgetTester tester) async {
      await tester.pumpWidget(WidgetApp(
        navigatorObserver: mockObserver,
        child: BlocProvider(
          create: (context) => AuthBloc(const AuthState()),
          child: const LoginPage(),
        ),
      ));
    }

    setUpAll(() {
      registerFallbackValue(FakeRoute());
      registerFallbackValue(FakeDialogRoute());
    });

    testWidgets('is initialized correctly', (widgetTester) async {
      await buildTester(widgetTester);

      expect(find.widgetWithText(DigitTextField, 'User ID'), findsOneWidget);
      expect(find.widgetWithText(DigitTextField, 'Password'), findsOneWidget);
      expect(find.widgetWithText(DigitElevatedButton, 'Login'), findsOneWidget);
      expect(
        find.widgetWithText(TextButton, 'Forgot Password?'),
        findsOneWidget,
      );
    });

    testWidgets(
      'shows dialog on pressing forgot password button',
      (widgetTester) async {
        await buildTester(widgetTester);

        await widgetTester.tap(
          find.widgetWithText(TextButton, 'Forgot Password?'),
        );

        await widgetTester.pumpAndSettle();
        verify(() => mockObserver.didPush(any<DialogRoute>(), any()));

        expect(find.byType(DigitDialog), findsOneWidget);

        final dialog = widgetTester.firstWidget(
          find.byType(DigitDialog),
        ) as DigitDialog;

        expect(dialog.title.runtimeType, Text);
        expect(dialog.content.runtimeType, Text);
        expect(dialog.primaryActionLabel, 'OK');

        final title = dialog.title as Text;
        final content = dialog.content as Text;

        expect(title.data, 'Forgot Password?');
        expect(
          content.data,
          'Please contact the administrator if you have forgotten your password',
        );

        await widgetTester.tap(find.text('OK'));
        await widgetTester.pumpAndSettle();

        verify(() => mockObserver.didPop(any(), any<DialogRoute>()));
        expect(find.byType(DigitDialog, skipOffstage: false), findsNothing);
      },
    );
  });
}
