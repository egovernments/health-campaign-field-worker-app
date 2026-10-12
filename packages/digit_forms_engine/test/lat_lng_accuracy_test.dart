import 'package:digit_forms_engine/helper/validator_helper.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/models/schema_object/schema_object.dart';
import 'package:digit_forms_engine/utils/gps_warmup.dart';
import 'package:digit_forms_engine/widgets/json_schema_builder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('classifyLocationAccuracy (ODK Collect thresholds)', () {
    LocationAccuracyLevel classify(double accuracy) =>
        classifyLocationAccuracy(
          accuracy,
          accuracyThreshold: kDefaultLocationAccuracyThreshold,
          unacceptableAccuracyThreshold:
              kDefaultUnacceptableLocationAccuracyThreshold,
        );

    test('within threshold + 5 m is improving', () {
      expect(classify(3), LocationAccuracyLevel.improving);
      expect(classify(10), LocationAccuracyLevel.improving);
    });

    test('above threshold + 5 m is poor', () {
      expect(classify(10.1), LocationAccuracyLevel.poor);
      expect(classify(100), LocationAccuracyLevel.poor);
    });

    test('above unacceptable threshold is unacceptable', () {
      expect(classify(100.1), LocationAccuracyLevel.unacceptable);
    });
  });

  test('accuracy threshold rules do not become form validators', () {
    const schema = PropertySchema(
      type: PropertySchemaType.string,
      validations: [
        ValidationRule(type: kAccuracyThresholdRule, value: 10),
        ValidationRule(type: kUnacceptableAccuracyThresholdRule, value: 50),
      ],
    );

    expect(buildValidators<String>(schema), isEmpty);
  });

  group('GpsWarmup.schemaHasLocationField', () {
    SchemaObject formWith(PropertySchemaFormat format) => SchemaObject(
          name: 'test',
          version: 1,
          pages: {
            'page1': const PropertySchema(
              type: PropertySchemaType.object,
              properties: {
                'name': PropertySchema(type: PropertySchemaType.string),
              },
            ),
            'page2': PropertySchema(
              type: PropertySchemaType.object,
              properties: {
                'field': PropertySchema(
                  type: PropertySchemaType.string,
                  format: format,
                ),
              },
            ),
          },
        );

    test('detects a location field on a later page', () {
      expect(
        GpsWarmup.schemaHasLocationField(
            formWith(PropertySchemaFormat.latLng)),
        isTrue,
      );
    });

    test('ignores forms without a location field', () {
      expect(
        GpsWarmup.schemaHasLocationField(formWith(PropertySchemaFormat.text)),
        isFalse,
      );
    });
  });

  group('locationCaptureHint', () {
    LocationCaptureHint hint({
      int elapsed = 45,
      double? accuracy,
      int? satellites,
    }) =>
        locationCaptureHint(
          elapsedSeconds: elapsed,
          accuracy: accuracy,
          satellites: satellites,
          accuracyThreshold: kDefaultLocationAccuracyThreshold,
          unacceptableAccuracyThreshold:
              kDefaultUnacceptableLocationAccuracyThreshold,
        );

    test('no hint during the first 30 seconds', () {
      expect(hint(elapsed: 29, accuracy: 50, satellites: 0),
          LocationCaptureHint.none);
    });

    test('no reading yet asks to check location', () {
      expect(hint(), LocationCaptureHint.checkLocation);
    });

    test('too few satellites asks for open sky', () {
      expect(hint(accuracy: 14, satellites: 3), LocationCaptureHint.openSky);
    });

    test('unknown satellite count asks for open sky', () {
      expect(hint(accuracy: 14), LocationCaptureHint.openSky);
    });

    test('enough satellites but poor accuracy asks to hold still', () {
      expect(hint(accuracy: 14, satellites: 9), LocationCaptureHint.holdStill);
    });

    test('close to the threshold says almost there', () {
      expect(hint(accuracy: 7, satellites: 6),
          LocationCaptureHint.almostThere);
    });

    test('near the threshold without a satellite fix asks for open sky', () {
      expect(hint(accuracy: 8, satellites: 2), LocationCaptureHint.openSky);
    });
  });
}
