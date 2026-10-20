import 'package:digit_forms_engine/helper/validator_helper.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/models/schema_object/schema_object.dart';
import 'package:digit_forms_engine/utils/gps_warmup.dart';
import 'package:digit_forms_engine/widgets/json_schema_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  group('classifyLocationAccuracy', () {
    LocationAccuracyLevel classify(double accuracy) => classifyLocationAccuracy(
          accuracy,
          accuracyThreshold: kDefaultLocationAccuracyThreshold,
          unacceptableAccuracyThreshold:
              kDefaultUnacceptableLocationAccuracyThreshold,
        );

    test('5 m or less is good', () {
      expect(classify(3), LocationAccuracyLevel.good);
      expect(classify(5), LocationAccuracyLevel.good);
    });

    test('above 5 m up to 10 m is fair', () {
      expect(classify(5.1), LocationAccuracyLevel.fair);
      expect(classify(10), LocationAccuracyLevel.fair);
    });

    test('above 10 m is low', () {
      expect(classify(10.1), LocationAccuracyLevel.low);
      expect(classify(150), LocationAccuracyLevel.low);
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
        GpsWarmup.schemaHasLocationField(formWith(PropertySchemaFormat.latLng)),
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

    test('enough satellites but low accuracy asks to hold still', () {
      expect(hint(accuracy: 14, satellites: 9), LocationCaptureHint.holdStill);
    });

    test('fair accuracy says almost there', () {
      expect(hint(accuracy: 7, satellites: 6), LocationCaptureHint.almostThere);
    });

    test('fair accuracy without a satellite fix asks for open sky', () {
      expect(hint(accuracy: 8, satellites: 2), LocationCaptureHint.openSky);
    });

    test('good accuracy needs no hint', () {
      expect(hint(accuracy: 4, satellites: 2), LocationCaptureHint.none);
    });
  });

  group('shouldReplaceSavedReading', () {
    test('a more accurate recapture replaces the saved reading', () {
      expect(shouldReplaceSavedReading(saved: 8, candidate: 4), isTrue);
    });

    test('a less accurate recapture keeps the earlier reading', () {
      expect(shouldReplaceSavedReading(saved: 4, candidate: 8), isFalse);
    });

    test('equal accuracy takes the latest reading', () {
      expect(shouldReplaceSavedReading(saved: 6, candidate: 6), isTrue);
    });

    test('nothing saved, or saved without accuracy, is always replaced', () {
      expect(shouldReplaceSavedReading(saved: null, candidate: 9), isTrue);
      expect(shouldReplaceSavedReading(saved: null, candidate: null), isTrue);
    });

    test('a recapture without accuracy never replaces one with it', () {
      expect(shouldReplaceSavedReading(saved: 9, candidate: null), isFalse);
    });
  });

  group('LocationCaptureTimeouts', () {
    test('tracks timed-out fields per form and notifies on change', () {
      final form = FormGroup({'location': FormControl<String>()});
      final other = FormGroup({'location': FormControl<String>()});
      var notifications = 0;
      LocationCaptureTimeouts.of(form).addListener(() => notifications++);

      LocationCaptureTimeouts.set(form, 'location', true);
      expect(LocationCaptureTimeouts.of(form).value, {'location'});
      expect(LocationCaptureTimeouts.of(other).value, isEmpty);

      // Unchanged state doesn't notify.
      LocationCaptureTimeouts.set(form, 'location', true);
      expect(notifications, 1);

      LocationCaptureTimeouts.set(form, 'location', false);
      expect(LocationCaptureTimeouts.of(form).value, isEmpty);
      expect(notifications, 2);
    });
  });
}
