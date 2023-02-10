// import 'package:digit_components/digit_components.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:health_campaign_field_worker_app/blocs/auth/auth.dart';
// import 'package:health_campaign_field_worker_app/blocs/localization/app_localization.dart';
// import 'package:health_campaign_field_worker_app/data/repositories/remote/auth.dart';
// import 'package:health_campaign_field_worker_app/pages/login.dart';
// import 'package:health_campaign_field_worker_app/utils/i18_key_constants.dart'
//     as i18;
// import 'package:mocktail/mocktail.dart';

// import '../widget_app.dart';

// class MockAppLocalization extends Mock implements AppLocalizations {}

// class MockNavigatorObserver extends Mock implements NavigatorObserver {}

// class FakeRoute extends Fake implements Route {}

// class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

// void main() {
//   group('Login page', () {
//     final mockObserver = MockNavigatorObserver();
//     final mockLocalization = MockAppLocalization();

//     Future<void> buildTester(WidgetTester tester) async {
//       await tester.pumpWidget(WidgetApp(
//         navigatorObserver: mockObserver,
//         child: BlocProvider(
//           create: (context) => AuthBloc(
//             const AuthState(),
//             AuthRepository(client),
//           ),
//           child: LoginPage(appLocalizations: mockLocalization),
//         ),
//       ));
//     }

//     setUpAll(() {
//       for (final element in [
//         i18.login.userIdPlaceholder,
//         i18.login.passwordPlaceholder,
//         i18.login.labelText,
//         i18.login.actionLabel,
//         i18.forgotPassword.labelText,
//         i18.forgotPassword.contentText,
//         i18.forgotPassword.primaryActionLabel,
//         i18.forgotPassword.actionLabel,
//       ]) {
//         when(() => mockLocalization.translate(element)).thenReturn(element);
//       }

//       registerFallbackValue(FakeRoute());
//       registerFallbackValue(FakeDialogRoute());
//     });

//     testWidgets('is initialized correctly', (widgetTester) async {
//       await buildTester(widgetTester);

//       expect(
//         find.widgetWithText(
//           DigitTextField,
//           i18.login.userIdPlaceholder,
//         ),
//         findsOneWidget,
//       );
//       expect(
//         find.widgetWithText(
//           DigitTextField,
//           i18.login.passwordPlaceholder,
//         ),
//         findsOneWidget,
//       );
//       expect(
//         find.widgetWithText(
//           DigitElevatedButton,
//           i18.login.actionLabel,
//         ),
//         findsOneWidget,
//       );
//       expect(
//         find.widgetWithText(
//           TextButton,
//           i18.forgotPassword.actionLabel,
//         ),
//         findsOneWidget,
//       );
//     });

//     testWidgets(
//       'shows dialog on pressing forgot password button',
//       (widgetTester) async {
//         await buildTester(widgetTester);

//         await widgetTester.tap(
//           find.widgetWithText(
//             TextButton,
//             i18.forgotPassword.actionLabel,
//           ),
//           warnIfMissed: false,
//         );

//         await widgetTester.pumpAndSettle();
//         verify(() => mockObserver.didPush(any<DialogRoute>(), any()));

//         expect(find.byType(DigitDialog), findsOneWidget);

//         final dialog = widgetTester.firstWidget(
//           find.byType(DigitDialog),
//         ) as DigitDialog;

//         expect(dialog.options.title.runtimeType, Text);
//         expect(dialog.options.content.runtimeType, Text);
//         expect(
//           dialog.options.primaryAction?.label,
//           i18.forgotPassword.primaryActionLabel,
//         );

//         final title = dialog.options.title as Text;
//         final content = dialog.options.content as Text;

//         expect(title.data, i18.forgotPassword.labelText);
//         expect(
//           content.data,
//           i18.forgotPassword.contentText,
//         );

//         await widgetTester.tap(
//           find.text(i18.forgotPassword.primaryActionLabel),
//           warnIfMissed: false,
//         );

//         await widgetTester.pumpAndSettle();

//         verify(() => mockObserver.didPop(any(), any<DialogRoute>()));
//         expect(find.byType(DigitDialog, skipOffstage: false), findsNothing);
//       },
//     );
//   });
// }
