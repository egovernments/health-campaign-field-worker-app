import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/models/schema_object/schema_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SchemaObject Tests', () {
    test('fromJson creates correct object', () {
      final json = {
        'name': 'test_schema',
        'version': 1,
        'summary': true,
        'pages': {
          'page1': {
            'type': 'object',
            'label': 'Test Page',
            'properties': {
              'field1': {
                'type': 'string',
                'label': 'Field 1',
              }
            }
          }
        }
      };

      final schema = SchemaObject.fromJson(json);

      expect(schema.name, equals('test_schema'));
      expect(schema.version, equals(1));
      expect(schema.summary, isTrue);
    });

    test('toJson serializes correctly', () {
      final schema = SchemaObject(
        name: 'test_schema',
        version: 1,
        summary: true,
        pages: {
          'page1': PropertySchema(
            type: PropertySchemaType.object,
            label: 'Test Page',
            properties: {
              'field1': PropertySchema(
                type: PropertySchemaType.string,
                label: 'Field 1',
              )
            },
          )
        },
      );

      final json = schema.toJson();

      expect(json['name'], equals('test_schema'));
      expect(json['version'], equals(1));
      expect(json['summary'], isTrue);
      expect(json['pages'], isA<Map<String, dynamic>>());
    });
  });

  group('PropertySchema Tests', () {
    test('fromJson creates correct object', () {
      final json = {
        'type': 'string',
        'label': 'Test Field',
        'hint': 'Enter test value',
        'format': 'text',
        'hidden': false,
        'readOnly': false,
        'value': 'test value',
        'order': 1,
      };

      final property = PropertySchema.fromJson(json);

      expect(json['type'], equals('string'));
      expect(json['label'], equals('Test Field'));
      expect(json['format'], equals('text'));
      expect(property.hidden, isFalse);
      expect(property.readOnly, isFalse);
      expect(property.value, equals('test value'));
      expect(property.order, equals(1));
    });

    test('toJson serializes correctly', () {
      final property = PropertySchema(
        type: PropertySchemaType.string,
        label: 'Test Field',
        innerLabel: 'Enter test value',
        format: PropertySchemaFormat.text,
        hidden: false,
        readOnly: false,
        value: 'test value',
        order: 1,
      );

      final json = property.toJson();

      expect(json['type'], equals('string'));
      expect(json['label'], equals('Test Field'));
      expect(json['format'], equals('text'));
      expect(json['hidden'], isFalse);
      expect(json['readOnly'], isFalse);
      expect(json['value'], equals('test value'));
      expect(json['order'], equals(1));
    });

    test('copyWith creates new instance with updated values', () {
      final original = PropertySchema(
        type: PropertySchemaType.string,
        format: PropertySchemaFormat.text,
        label: 'Original Label',
        value: 'original value',
      );

      final updated = original.copyWith(
        label: 'Updated Label',
        value: 'updated value',
      );

      expect(updated.type, equals(PropertySchemaType.string));
      expect(updated.label, equals('Updated Label'));
      expect(updated.value, equals('updated value'));
      expect(original.label, equals('Original Label')); // Original unchanged
    });
  });
}
