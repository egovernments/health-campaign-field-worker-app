import 'dart:typed_data';

import 'package:digit_face_verification/utils/image_preprocessing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

void main() {
  group('ImagePreprocessing', () {
    group('resizeFace', () {
      test('resizes image to 112x112', () {
        final image = img.Image(width: 200, height: 300);
        final resized = ImagePreprocessing.resizeFace(image);
        expect(resized.width, equals(112));
        expect(resized.height, equals(112));
      });

      test('handles already-correct size', () {
        final image = img.Image(width: 112, height: 112);
        final resized = ImagePreprocessing.resizeFace(image);
        expect(resized.width, equals(112));
        expect(resized.height, equals(112));
      });

      test('handles small images', () {
        final image = img.Image(width: 10, height: 10);
        final resized = ImagePreprocessing.resizeFace(image);
        expect(resized.width, equals(112));
        expect(resized.height, equals(112));
      });
    });

    group('normalizeToFloat32NHWC', () {
      test('returns correct shape [1, 112, 112, 3]', () {
        final image = img.Image(width: 112, height: 112);
        final result = ImagePreprocessing.normalizeToFloat32NHWC(image);
        expect(result.length, equals(1 * 112 * 112 * 3));
      });

      test('normalizes pixel values to [-1, 1] range', () {
        final image = img.Image(width: 112, height: 112);
        // Set all pixels to white (255, 255, 255)
        for (int y = 0; y < 112; y++) {
          for (int x = 0; x < 112; x++) {
            image.setPixelRgba(x, y, 255, 255, 255, 255);
          }
        }

        final result = ImagePreprocessing.normalizeToFloat32NHWC(image);

        // All values should be 1.0 for white pixels
        for (int i = 0; i < result.length; i++) {
          expect(result[i], closeTo(1.0, 0.01));
        }
      });

      test('normalizes black pixels to -1.0', () {
        final image = img.Image(width: 112, height: 112);
        // Default is black (0, 0, 0)

        final result = ImagePreprocessing.normalizeToFloat32NHWC(image);

        // Values should be close to -1.0 for black pixels
        // Note: default img.Image pixels may not be exactly 0,
        // so we check the first few values
        expect(result[0], closeTo(-1.0, 0.1));
      });

      test('normalizes mid-gray to approximately 0.0', () {
        final image = img.Image(width: 112, height: 112);
        for (int y = 0; y < 112; y++) {
          for (int x = 0; x < 112; x++) {
            image.setPixelRgba(x, y, 128, 128, 128, 255);
          }
        }

        final result = ImagePreprocessing.normalizeToFloat32NHWC(image);
        // 128 normalized: (128 - 127.5) / 127.5 ≈ 0.0039
        expect(result[0], closeTo(0.0, 0.01));
      });
    });

    group('normalizeToFloat32 (NCHW)', () {
      test('returns correct shape [1, 3, 112, 112]', () {
        final image = img.Image(width: 112, height: 112);
        final result = ImagePreprocessing.normalizeToFloat32(image);
        expect(result.length, equals(1 * 3 * 112 * 112));
      });
    });

    group('rotationFromSensorOrientation', () {
      test('maps 0 to rotation0deg', () {
        final rotation =
            ImagePreprocessing.rotationFromSensorOrientation(0);
        expect(rotation.index, equals(0));
      });

      test('maps 90 to rotation90deg', () {
        final rotation =
            ImagePreprocessing.rotationFromSensorOrientation(90);
        expect(rotation.index, equals(1));
      });

      test('maps 270 to rotation270deg', () {
        final rotation =
            ImagePreprocessing.rotationFromSensorOrientation(270);
        expect(rotation.index, equals(3));
      });

      test('maps unknown values to rotation0deg', () {
        final rotation =
            ImagePreprocessing.rotationFromSensorOrientation(45);
        expect(rotation.index, equals(0));
      });
    });
  });
}
