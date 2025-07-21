import 'package:digit_forms_engine/blocs/app_localization.dart';
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:digit_forms_engine/pages/forms_render.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'constants/schema.dart';

// Provide a minimal FormLocalization delegate for tests
class TestFormLocalizationDelegate
    extends LocalizationsDelegate<FormLocalization> {
  const TestFormLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<FormLocalization> load(Locale locale) async {
    return FormLocalization(locale, Future.value([]), []);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<FormLocalization> old) =>
      false;
}

Widget wrapWithMaterialApp(Widget child) {
  return MaterialApp(
    localizationsDelegates: const [
      TestFormLocalizationDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [Locale('en', 'US')],
    home: child,
  );
}

void main() {
  group('FormsRenderPage Widget Tests', () {
    late FormsBloc formsBloc;

    setUp(() {
      formsBloc = FormsBloc();
    });

    tearDown(() {
      formsBloc.close();
    });

    Widget createTestApp(Widget child) {
      return wrapWithMaterialApp(
        BlocProvider<FormsBloc>.value(
          value: formsBloc,
          child: child,
        ),
      );
    }

    testWidgets('shows error when page is not found',
        (WidgetTester tester) async {
      formsBloc.add(FormsEvent.load(schemas: [schema]));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();
      await tester.pumpWidget(createTestApp(
        FormsRenderPage(
          pageName: 'nonexistent',
          currentSchemaKey: 'registration',
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Form not found'), findsOneWidget);
    });

    testWidgets('renders form fields correctly', (WidgetTester tester) async {
      formsBloc.add(FormsEvent.load(schemas: [schema]));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();
      await tester.pumpWidget(createTestApp(
        FormsRenderPage(
          pageName: 'dummy',
          currentSchemaKey: 'registration',
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Gender'), findsOneWidget);
    });

    testWidgets('shows summary when isSummary is true',
        (WidgetTester tester) async {
      formsBloc.add(FormsEvent.load(schemas: [schema]));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();
      await tester.pumpWidget(createTestApp(
        FormsRenderPage(
          pageName: 'dummy',
          currentSchemaKey: 'registration',
          isSummary: true,
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(LabelValueSummary), findsOneWidget);
    });
  });

  group('JsonForms Widget Tests', () {
    testWidgets('creates form controls correctly', (WidgetTester tester) async {
      final schema = PropertySchema.fromJson({
        'type': 'object',
        'properties': {
          'name': {
            'type': 'string',
            'label': 'Name',
          },
          'age': {
            'type': 'integer',
            'label': 'Age',
          },
        },
      });
      final controls = JsonForms.getFormControls(schema);
      expect(controls.length, equals(2));
      expect(controls.containsKey('name'), isTrue);
      expect(controls.containsKey('age'), isTrue);
    });

    testWidgets('filters out hidden fields', (WidgetTester tester) async {
      final schema = PropertySchema.fromJson({
        'type': 'object',
        'properties': {
          'visible': {
            'type': 'string',
            'label': 'Visible Field',
          },
          'hidden': {
            'type': 'string',
            'label': 'Hidden Field',
            'hidden': true,
          },
          'included': {
            'type': 'string',
            'label': 'Included Hidden Field',
            'hidden': true,
            'includeInForm': true,
          },
        },
      });
      final controls = JsonForms.getFormControls(schema);
      expect(controls.length, equals(2));
      expect(controls.containsKey('visible'), isTrue);
      expect(controls.containsKey('included'), isTrue);
      expect(controls.containsKey('hidden'), isFalse);
    });

    testWidgets('extracts form values correctly', (WidgetTester tester) async {
      final schema = PropertySchema.fromJson({
        'type': 'object',
        'properties': {
          'name': {
            'type': 'string',
            'label': 'Name',
          },
          'age': {
            'type': 'integer',
            'label': 'Age',
          },
        },
      });
      final form = FormGroup({
        'name': FormControl(value: 'John Doe'),
        'age': FormControl(value: 25),
      });
      final values = JsonForms.getFormValues(form, schema);
      expect(values['name'], equals('John Doe'));
      expect(values['age'], equals(25));
    });
  });
}
