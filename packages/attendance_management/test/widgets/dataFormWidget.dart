import 'package:attendance_management/pages/session_select.dart';
import 'package:digit_components/widgets/atoms/digit_date_form_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:attendance_management/utils/i18_key_constants.dart' as i18;

void main() {
  const _dateOfSession = 'dateOfSession';
  const _sessionRadio = 'sessionRadio';
  testWidgets('DigitDateFormPicker test', (WidgetTester tester) async {
    // Build a MaterialApp with the DigitDateFormPicker

    FormGroup buildForm(BuildContext ctx) {
      return fb.group(<String, Object>{
        _dateOfSession:
            FormControl<DateTime>(value: DateTime.now(), validators: []),
        _sessionRadio: FormControl<KeyValue>(value: null),
      });
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ReactiveFormBuilder(
                form: () => buildForm(context),
                builder: (context, form, child) {
                  return DigitDateFormPicker(
                    start: DateTime(2022, 1, 1), // Provide start date
                    end: DateTime(2022, 12, 31), // Provide end date
                    label: 'Date of Session', // Provide label
                    formControlName:
                        'dateOfSession', // Provide form control name
                    cancelText: 'Cancel', // Provide cancel text
                    confirmText: 'Confirm', // Provide confirm text
                  );
                });
          }),
        ),
      ),
    );

    // Tap the Date of Session text field to open the date picker
    await tester.tap(find.byType(DigitDateFormPicker));
    await tester.pumpAndSettle();

    // // Expect to find the confirm button in the date picker
    expect(
        find.text(i18.common.coreCommonOk, findRichText: true), findsOneWidget);
  });
}
