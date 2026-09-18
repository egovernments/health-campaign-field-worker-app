import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' show Size;

import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;

/// Utility class for preprocessing camera frames for face recognition.
class ImagePreprocessing {
  /// MobileFaceNet expects 112x112 input.
  static const int inputSize = 112;

  /// Converts a [CameraImage] (YUV420/NV21) to an [img.Image].
  /// Handles both planar YUV420 (3 planes) and semi-planar NV21 (1-2 planes).
  static img.Image convertCameraImage(CameraImage cameraImage) {
    final int width = cameraImage.width;
    final int height = cameraImage.height;

    final image = img.Image(width: width, height: height);

    final yPlane = cameraImage.planes[0];

    if (cameraImage.planes.length < 3) {
      // Semi-planar NV21: plane[0]=Y, plane[1]=VU interleaved
      final vuPlane = cameraImage.planes.length > 1
          ? cameraImage.planes[1]
          : yPlane;

      for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
          final int yIndex = y * yPlane.bytesPerRow + x;
          final int vuIndex = (y ~/ 2) * vuPlane.bytesPerRow + (x ~/ 2) * 2;

          final int yVal = yPlane.bytes[yIndex];
          final int vVal = vuPlane.bytes[vuIndex];
          final int uVal = vuPlane.bytes[vuIndex + 1];

          int r = (yVal + 1.370705 * (vVal - 128)).round().clamp(0, 255);
          int g = (yVal - 0.337633 * (uVal - 128) - 0.698001 * (vVal - 128))
              .round()
              .clamp(0, 255);
          int b = (yVal + 1.732446 * (uVal - 128)).round().clamp(0, 255);

          image.setPixelRgba(x, y, r, g, b, 255);
        }
      }
    } else {
      // Planar YUV420: 3 separate planes. Account for bytesPerPixel (pixel stride).
      final uPlane = cameraImage.planes[1];
      final vPlane = cameraImage.planes[2];
      final int uvPixelStride = uPlane.bytesPerPixel ?? 1;

      for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
          final int yIndex = y * yPlane.bytesPerRow + x;
          final int uvIndex =
              (y ~/ 2) * uPlane.bytesPerRow + (x ~/ 2) * uvPixelStride;

          final int yVal = yPlane.bytes[yIndex];
          final int uVal = uPlane.bytes[uvIndex];
          final int vVal = vPlane.bytes[uvIndex];

          int r = (yVal + 1.370705 * (vVal - 128)).round().clamp(0, 255);
          int g = (yVal - 0.337633 * (uVal - 128) - 0.698001 * (vVal - 128))
              .round()
              .clamp(0, 255);
          int b = (yVal + 1.732446 * (uVal - 128)).round().clamp(0, 255);

          image.setPixelRgba(x, y, r, g, b, 255);
        }
      }
    }

    return image;
  }

  /// Converts an [img.Image] to [InputImage] for ML Kit processing.
  static InputImage imageToInputImage(
    img.Image image, {
    InputImageRotation rotation = InputImageRotation.rotation0deg,
  }) {
    final bytes = _imageToBytes(image);
    return InputImage.fromBytes(
      bytes: bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: InputImageFormat.bgra8888,
        bytesPerRow: image.width * 4,
      ),
    );
  }


  static Uint8List _imageToBytes(img.Image image) {
    final int width = image.width;
    final int height = image.height;
    final bytes = Uint8List(width * height * 4);

    int index = 0;
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final pixel = image.getPixel(x, y);
        bytes[index++] = pixel.b.toInt(); // B
        bytes[index++] = pixel.g.toInt(); // G
        bytes[index++] = pixel.r.toInt(); // R
        bytes[index++] = pixel.a.toInt(); // A
      }
    }
    return bytes;
  }

  /// Crops a face region from the image using the ML Kit [Face] bounding box.
  /// Adds [paddingPercent] padding around the face for better recognition.
  static img.Image cropFace(
    img.Image image,
    Face face, {
    double paddingPercent = 0.20,
  }) {
    final rect = face.boundingBox;

    final padX = (rect.width * paddingPercent).round();
    final padY = (rect.height * paddingPercent).round();

    final x = max(0, rect.left.round() - padX);
    final y = max(0, rect.top.round() - padY);
    final w = min(image.width - x, rect.width.round() + 2 * padX);
    final h = min(image.height - y, rect.height.round() + 2 * padY);

    return img.copyCrop(image, x: x, y: y, width: w, height: h);
  }

  /// Applies adaptive histogram equalization to improve contrast for darker
  /// skin tones. Works on the luminance (Y) channel to preserve color.
  /// This is critical for African face verification where standard models
  /// struggle with low-contrast features on darker skin.
  static img.Image enhanceContrast(img.Image face, {double clipLimit = 2.0}) {
    final w = face.width;
    final h = face.height;

    // Convert to HSL, equalize L channel, convert back
    // Using a simplified global histogram equalization on luminance
    final luminances = List<int>.filled(w * h, 0);
    final histogram = List<int>.filled(256, 0);

    // Extract luminance and build histogram
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        final pixel = face.getPixel(x, y);
        // ITU-R BT.601 luminance
        final lum = (0.299 * pixel.r + 0.587 * pixel.g + 0.114 * pixel.b)
            .round()
            .clamp(0, 255);
        luminances[y * w + x] = lum;
        histogram[lum]++;
      }
    }

    // Build cumulative distribution function (CDF)
    final cdf = List<int>.filled(256, 0);
    cdf[0] = histogram[0];
    for (int i = 1; i < 256; i++) {
      cdf[i] = cdf[i - 1] + histogram[i];
    }

    // Find CDF min (first non-zero)
    int cdfMin = 0;
    for (int i = 0; i < 256; i++) {
      if (cdf[i] > 0) {
        cdfMin = cdf[i];
        break;
      }
    }

    // Build equalization lookup table with clip limiting
    final totalPixels = w * h;
    final lut = List<int>.filled(256, 0);
    final denom = totalPixels - cdfMin;
    if (denom > 0) {
      for (int i = 0; i < 256; i++) {
        lut[i] = (((cdf[i] - cdfMin) * 255) / denom).round().clamp(0, 255);
      }
    }

    // Apply: scale each RGB channel by the luminance ratio
    final result = img.Image(width: w, height: h);
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        final pixel = face.getPixel(x, y);
        final oldLum = luminances[y * w + x];
        final newLum = lut[oldLum];

        if (oldLum == 0) {
          result.setPixelRgba(x, y, newLum, newLum, newLum, 255);
        } else {
          // Scale RGB channels proportionally
          final scale = newLum / oldLum;
          final r = (pixel.r * scale).round().clamp(0, 255);
          final g = (pixel.g * scale).round().clamp(0, 255);
          final b = (pixel.b * scale).round().clamp(0, 255);
          result.setPixelRgba(x, y, r, g, b, 255);
        }
      }
    }

    return result;
  }

  /// Resizes the cropped face to [inputSize]x[inputSize] (112x112).
  static img.Image resizeFace(img.Image face) {
    return img.copyResize(
      face,
      width: inputSize,
      height: inputSize,
      interpolation: img.Interpolation.linear,
    );
  }

  /// Normalizes pixel values from [0, 255] to [-1.0, 1.0] for MobileFaceNet.
  /// Returns a Float32List in NCHW format: [1, 3, 112, 112].
  static Float32List normalizeToFloat32(img.Image image) {
    final int size = inputSize;
    final Float32List result = Float32List(1 * 3 * size * size);

    int index = 0;
    for (int c = 0; c < 3; c++) {
      for (int y = 0; y < size; y++) {
        for (int x = 0; x < size; x++) {
          final pixel = image.getPixel(x, y);
          double value;
          switch (c) {
            case 0:
              value = pixel.r.toDouble();
              break;
            case 1:
              value = pixel.g.toDouble();
              break;
            case 2:
              value = pixel.b.toDouble();
              break;
            default:
              value = 0;
          }
          // Normalize to [-1, 1]
          result[index++] = (value - 127.5) / 127.5;
        }
      }
    }

    return result;
  }

  /// Alternative normalization in NHWC format: [1, 112, 112, 3].
  /// MobileFaceNet TFLite models typically expect NHWC.
  static Float32List normalizeToFloat32NHWC(img.Image image) {
    final int size = inputSize;
    final Float32List result = Float32List(1 * size * size * 3);

    int index = 0;
    for (int y = 0; y < size; y++) {
      for (int x = 0; x < size; x++) {
        final pixel = image.getPixel(x, y);
        result[index++] = (pixel.r.toDouble() - 127.5) / 127.5;
        result[index++] = (pixel.g.toDouble() - 127.5) / 127.5;
        result[index++] = (pixel.b.toDouble() - 127.5) / 127.5;
      }
    }

    return result;
  }

  /// Gets the camera rotation for ML Kit based on device sensor orientation.
  static InputImageRotation rotationFromSensorOrientation(
      int sensorOrientation) {
    switch (sensorOrientation) {
      case 0:
        return InputImageRotation.rotation0deg;
      case 90:
        return InputImageRotation.rotation90deg;
      case 180:
        return InputImageRotation.rotation180deg;
      case 270:
        return InputImageRotation.rotation270deg;
      default:
        return InputImageRotation.rotation0deg;
    }
  }
}
