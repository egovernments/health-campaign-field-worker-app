import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:forms_engine/models/property_schema/property_schema.dart';
import 'package:forms_engine/models/schema_object/schema_object.dart';
import 'package:intl/intl.dart';

import 'constants/schema.dart';

void main() {
  group('Schema Object', () {
    final schemaObject = json.decode(schema);
    final parsedObject = SchemaObject.fromJson(schemaObject);

    test('is parsed successfully', () {
      expect(parsedObject.toJson(), schemaObject);
    });
  });

  group('Property schema', () {
    final schemaObject = json.decode(schema);
    final parsedObject = SchemaObject.fromJson(schemaObject);
    final propertySchema = parsedObject.pages['dummy']!;

    test('contains property schema map if type is object', () {
      if (propertySchema.type == PropertySchemaType.object) {
        expect(propertySchema.properties is Map<String, PropertySchema>, true);
        expect(propertySchema.properties!.isNotEmpty, true);
      }
    });

    for (final type in PropertySchemaType.values.where(
      (element) => element != PropertySchemaType.object,
    )) {
      final properties = propertySchema.properties!.entries
          .where((element) => element.value.type == type);

      for (final property in properties) {
        test('no property schema for ${property.key} (${type.name})', () {
          expect(property.value.properties == null, true);
        });

        switch (type) {
          case PropertySchemaType.string:
            final dateRange = <DateFormatValue?>[
              property.value.firstDate,
              property.value.lastDate,
            ].whereType<DateFormatValue>();
            if (property.value.format == PropertySchemaFormat.date) {
              for (var dateItem in dateRange) {
                test(
                  '${property.key} contains date limit in ${dateItem.format} format',
                  () => expect(
                    dateItem.dateValue,
                    DateFormat(dateItem.format).parse(dateItem.value),
                  ),
                );
              }
            }
            break;
          default:
            break;
        }
      }

      test('DateValue object is generated', () {
        final expected = {'value': '2022-01-01', 'format': 'yyyy-MM-dd'};
        final actual = DateFormatValue.fromDateTime(
          DateTime(2022, 1, 1),
          'yyyy-MM-dd',
        ).toJson();

        expect(actual, expected);
      });
    }

    test('contains required parameters if required array is provided', () {
      if (propertySchema.required != null) {
        expect(propertySchema.required is List<String>, true);
        expect(propertySchema.required!.isNotEmpty, true);
      }
    });
  });
}
