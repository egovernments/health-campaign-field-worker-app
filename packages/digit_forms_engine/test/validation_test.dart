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
}
