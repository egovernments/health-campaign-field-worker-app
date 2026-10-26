import 'package:digit_forms_engine/helper/validator_helper.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/models/schema_object/schema_object.dart';
import 'package:digit_forms_engine/utils/gps_warmup.dart';
import 'package:digit_forms_engine/widgets/json_schema_builder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('canSaveLocation', () {
    const timer = Duration(minutes: 1, seconds: 30);

    test('needs a reading', () {
      expect(
          canSaveLocation(
              level: null, elapsedSeconds: 200, saveEnabledAfter: timer),
          isFalse);
    });

    test('without a timer, only good accuracy can be saved', () {
      expect(
          canSaveLocation(
              level: LocationAccuracyLevel.fair, elapsedSeconds: 600),
          isFalse);
      expect(
          canSaveLocation(level: LocationAccuracyLevel.good, elapsedSeconds: 0),
          isTrue);
    });


    test('with a timer, only good accuracy saves before it runs out', () {
      expect(
          canSaveLocation(
              level: LocationAccuracyLevel.good,
              elapsedSeconds: 0,
              saveEnabledAfter: timer),
          isTrue);
      expect(
          canSaveLocation(
              level: LocationAccuracyLevel.fair,
              elapsedSeconds: 89,
              saveEnabledAfter: timer),
          isFalse);
      expect(
          canSaveLocation(
              level: LocationAccuracyLevel.fair,
              elapsedSeconds: 90,
              saveEnabledAfter: timer),
          isTrue);
    });

    test('low accuracy only after the popup timer runs out', () {
      expect(
          canSaveLocation(
              level: LocationAccuracyLevel.low, elapsedSeconds: 600),
          isFalse);
      expect(
          canSaveLocation(
              level: LocationAccuracyLevel.low,
              elapsedSeconds: 89,
              saveEnabledAfter: timer),
          isFalse);
      expect(
          canSaveLocation(
              level: LocationAccuracyLevel.low,
              elapsedSeconds: 90,
              saveEnabledAfter: timer),
          isTrue);
    });
  });

  group('PopupTimer', () {
    PropertySchema field(Map<String, dynamic> popupTimer) =>
        PropertySchema.fromJson({
          'type': 'string',
          'format': 'latLng',
          'popupTimer': popupTimer,
        });

    test('reads minutes and seconds', () {
      expect(
          field({'enabled': true, 'minutes': 1, 'seconds': '30'})
              .popupTimer
              ?.duration,
          const Duration(minutes: 1, seconds: 30));
    });

    test('is on unless enabled is false', () {
      expect(
          field({'enabled': false, 'minutes': 2}).popupTimer?.duration, isNull);
      expect(field({'minutes': 0, 'seconds': 59}).popupTimer?.duration,
          const Duration(seconds: 59));
    });
  });

  group('locationPopupTimer', () {
    PopupTimer? timer(Map<String, dynamic>? popupTimer) =>
        PropertySchema.fromJson({
          'type': 'string',
          'format': 'latLng',
          if (popupTimer != null) 'popupTimer': popupTimer,
        }).popupTimer;

    test('defaults to 30 seconds when the config has no popupTimer', () {
      expect(locationPopupTimer(timer(null)), const Duration(seconds: 30));
      expect(kDefaultLocationPopupTimer, const Duration(seconds: 30));
    });

    test('defaults to 30 seconds when no time is set', () {
      expect(locationPopupTimer(timer({'enabled': true})),
          const Duration(seconds: 30));
      expect(locationPopupTimer(timer({'minutes': 0, 'seconds': 0})),
          const Duration(seconds: 30));
    });

    test('uses the configured time', () {
      expect(locationPopupTimer(timer({'minutes': 0, 'seconds': 59})),
          const Duration(seconds: 59));
    });

    test('any minutes / seconds combination from the campaign', () {
      Duration? t(Map<String, dynamic> config) =>
          locationPopupTimer(timer(config));
      expect(t({'minutes': 1, 'seconds': 59}), const Duration(seconds: 119));
      expect(t({'seconds': 59}), const Duration(seconds: 59));
      expect(t({'minutes': 1}), const Duration(minutes: 1));
      expect(t({'minutes': 1, 'seconds': 10}), const Duration(seconds: 70));
      expect(t({'minutes': 0, 'seconds': 59}), const Duration(seconds: 59));
      expect(t({'minutes': null, 'seconds': 59}), const Duration(seconds: 59));
      expect(t({'minutes': '', 'seconds': 59}), const Duration(seconds: 59));
    });

    test('accepts numbers sent as text or decimals', () {
      Duration? t(Map<String, dynamic> config) =>
          locationPopupTimer(timer(config));
      expect(t({'minutes': '1', 'seconds': '59'}), const Duration(seconds: 119));
      expect(t({'minutes': '1.0', 'seconds': '59.0'}),
          const Duration(seconds: 119));
      expect(t({'minutes': 1.0, 'seconds': 59.0}), const Duration(seconds: 119));
      expect(t({'minutes': ' 1 ', 'seconds': ' 10'}),
          const Duration(seconds: 70));
    });

    test('accepts enabled sent as text', () {
      expect(locationPopupTimer(timer({'enabled': 'true', 'minutes': 1})),
          const Duration(minutes: 1));
      expect(
          locationPopupTimer(timer({'enabled': 'false', 'minutes': 1})), isNull);
    });

    test('no timer when switched off', () {
      expect(
          locationPopupTimer(timer({'enabled': false, 'seconds': 59})), isNull);
    });
  });

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

    test('above 5 m is low by default (no 10 m band)', () {
      expect(kDefaultUnacceptableLocationAccuracyThreshold, 5);
      expect(classify(5.1), LocationAccuracyLevel.low);
      expect(classify(10), LocationAccuracyLevel.low);
      expect(classify(150), LocationAccuracyLevel.low);
    });

    test('a configured unacceptableAccuracyThreshold adds a fair band', () {
      LocationAccuracyLevel classifyWide(double accuracy) =>
          classifyLocationAccuracy(
            accuracy,
            accuracyThreshold: kDefaultLocationAccuracyThreshold,
            unacceptableAccuracyThreshold: 10,
          );
      expect(classifyWide(7), LocationAccuracyLevel.fair);
      expect(classifyWide(10.1), LocationAccuracyLevel.low);
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
          // A configured fair band, so the fair-accuracy hints are covered.
          unacceptableAccuracyThreshold: 10,
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
}
