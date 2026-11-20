import 'package:digit_forms_engine/helper/validator_helper.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  group('ValidationRule and buildValidators', () {
    test('required validation', () {
      final schema = PropertySchema(
        type: PropertySchemaType.string,
        label: 'Name',
        validations: [
          ValidationRule(type: 'required', value: true, message: 'Required!'),
        ],
      );
      final validators = buildValidators(schema);
      final form = FormGroup({
        'name': FormControl<String>(validators: validators),
      });
      expect(form.control('name').valid, isFalse);
      form.control('name').value = 'John';
      expect(form.control('name').valid, isTrue);
    });

    test('minLength and maxLength validation', () {
      final schema = PropertySchema(
        type: PropertySchemaType.string,
        label: 'Username',
        validations: [
          ValidationRule(type: 'minLength', value: 3, message: 'Too short'),
          ValidationRule(type: 'maxLength', value: 5, message: 'Too long'),
        ],
      );
      final validators = buildValidators(schema);
      final form = FormGroup({
        'username': FormControl<String>(validators: validators),
      });
      form.control('username').value = 'Jo';
      expect(form.control('username').valid, isFalse);
      form.control('username').value = 'John';
      expect(form.control('username').valid, isTrue);
      form.control('username').value = 'Johnny';
      expect(form.control('username').valid, isFalse);
    });

    test('pattern validation', () {
      final schema = PropertySchema(
        type: PropertySchemaType.string,
        label: 'Email',
        validations: [
          ValidationRule(
              type: 'pattern',
              value: r'^\S+@\S+\.\S+$',
              message: 'Invalid email'),
        ],
      );
      final validators = buildValidators(schema);
      final form = FormGroup({
        'email': FormControl<String>(validators: validators),
      });
      form.control('email').value = 'not-an-email';
      expect(form.control('email').valid, isFalse);
      form.control('email').value = 'test@example.com';
      expect(form.control('email').valid, isTrue);
    });

    test('min and max value validation', () {
      final schema = PropertySchema(
        type: PropertySchemaType.integer,
        label: 'Age',
        validations: [
          ValidationRule(type: 'min', value: 18, message: 'Too young'),
          ValidationRule(type: 'max', value: 60, message: 'Too old'),
        ],
      );
      final validators = buildValidators(schema);
      final form = FormGroup({
        'age': FormControl<int>(validators: validators),
      });
      form.control('age').value = 15;
      expect(form.control('age').valid, isFalse);
      form.control('age').value = 30;
      expect(form.control('age').valid, isTrue);
      form.control('age').value = 70;
      expect(form.control('age').valid, isFalse);
    });
  });

  // AEFI: date of onset can't be before the date of vaccination.
  group('startDate / endDate pointing at another date field', () {
    PropertySchema dateSchema(List<ValidationRule> rules) => PropertySchema(
          type: PropertySchemaType.string,
          format: PropertySchemaFormat.date,
          validations: rules,
        );

    /// Vaccination + onset, where onset has `startDate: {{dateOfVaccination}}`
    /// and `endDate: {{today}}`, as in aefi_flows.dart.
    Future<FormGroup> datesForm() async {
      final form = FormGroup({
        'dateOfVaccination': FormControl<DateTime>(),
        'dateOfOnset': FormControl<DateTime>(
          validators: buildValidators(dateSchema(const [
            ValidationRule(
                type: 'startDate',
                value: '{{dateOfVaccination}}',
                message: 'Onset before vaccination'),
            ValidationRule(type: 'endDate', value: '{{today}}'),
          ])),
        ),
      });
      // The validator attaches its listener once the control is in a group.
      await Future<void>.delayed(Duration.zero);
      return form;
    }

    test('onset before vaccination is invalid', () async {
      final form = await datesForm();
      form.control('dateOfVaccination').value = DateTime(2026, 11, 10);
      form.control('dateOfOnset').value = DateTime(2026, 11, 9);
      expect(form.control('dateOfOnset').hasError('startDate'), isTrue);
    });

    test('onset on the vaccination day passes, whatever the time', () async {
      final form = await datesForm();
      form.control('dateOfVaccination').value = DateTime(2026, 11, 10, 18);
      form.control('dateOfOnset').value = DateTime(2026, 11, 10, 8);
      expect(form.control('dateOfOnset').valid, isTrue);
    });

    test('onset picked first is re-checked when vaccination is set or changed',
        () async {
      final form = await datesForm();
      form.control('dateOfOnset').value = DateTime(2026, 11, 10);
      expect(form.control('dateOfOnset').valid, isTrue);

      // Vaccination after the onset: onset becomes invalid. valueChanges is
      // delivered asynchronously, so let the re-check run first.
      form.control('dateOfVaccination').value = DateTime(2026, 11, 12);
      await Future<void>.delayed(Duration.zero);
      expect(form.control('dateOfOnset').hasError('startDate'), isTrue);

      // Vaccination moved back on/before the onset: valid again.
      form.control('dateOfVaccination').value = DateTime(2026, 11, 10);
      await Future<void>.delayed(Duration.zero);
      expect(form.control('dateOfOnset').valid, isTrue);
    });

    test('empty dates pass (required handles those)', () async {
      final form = await datesForm();
      form.control('dateOfOnset').value = DateTime(2026, 11, 10);
      expect(form.control('dateOfOnset').valid, isTrue);

      form.control('dateOfOnset').value = null;
      form.control('dateOfVaccination').value = DateTime(2026, 11, 12);
      await Future<void>.delayed(Duration.zero);
      expect(form.control('dateOfOnset').valid, isTrue);
    });

    test('reads prefilled "dd MMM yyyy" and ISO strings', () async {
      final form = FormGroup({
        'dateOfVaccination': FormControl<String>(),
        'dateOfOnset': FormControl<String>(
          validators: buildValidators(dateSchema(const [
            ValidationRule(type: 'startDate', value: '{{dateOfVaccination}}'),
          ])),
        ),
      });
      await Future<void>.delayed(Duration.zero);
      form.control('dateOfVaccination').value = '2026-11-12';
      form.control('dateOfOnset').value = '10 Nov 2026';
      expect(form.control('dateOfOnset').hasError('startDate'), isTrue);
    });

    test('endDate {{field}}: date after the other field is invalid', () async {
      final form = FormGroup({
        'dateOfOnset': FormControl<DateTime>(),
        'dateOfVaccination': FormControl<DateTime>(
          validators: buildValidators(dateSchema(const [
            ValidationRule(type: 'endDate', value: '{{dateOfOnset}}'),
          ])),
        ),
      });
      await Future<void>.delayed(Duration.zero);
      form.control('dateOfOnset').value = DateTime(2026, 11, 10);
      form.control('dateOfVaccination').value = DateTime(2026, 11, 11);
      expect(form.control('dateOfVaccination').hasError('endDate'), isTrue);
    });

    test('{{today}} and fixed bounds still add no validator', () {
      final validators = buildValidators(dateSchema(const [
        ValidationRule(type: 'startDate', value: 0),
        ValidationRule(type: 'endDate', value: '{{today}}'),
      ]));
      expect(validators, isEmpty);
    });
  });
}
