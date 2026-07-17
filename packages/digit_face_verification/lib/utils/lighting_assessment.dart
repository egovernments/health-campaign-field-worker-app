import 'dart:typed_data';

import 'package:camera/camera.dart';

/// Result of a lighting assessment.
class LightingResult {
  final double brightness; // 0.0 (dark) to 1.0 (bright)
  final bool isSufficient;
  final String guidance;

  const LightingResult({
    required this.brightness,
    required this.isSufficient,
    required this.guidance,
  });
}

/// Analyzes camera frame brightness to detect poor lighting conditions.
class LightingAssessment {
  /// Minimum brightness threshold (0.0-1.0). Below this, capture is prevented.
  final double minBrightness;

  const LightingAssessment({this.minBrightness = 0.3});

  /// Assess the lighting from a camera image.
  /// Works with YUV420 (NV21) format — uses the Y (luminance) plane.
  LightingResult assess(CameraImage image) {
    if (image.planes.isEmpty) {
      return const LightingResult(
        brightness: 0.0,
        isSufficient: false,
        guidance: 'Unable to assess lighting',
      );
    }

    // Y plane is the first plane in YUV420/NV21
    final yPlane = image.planes[0].bytes;
    final brightness = _averageLuminance(yPlane);

    if (brightness < minBrightness) {
      return LightingResult(
        brightness: brightness,
        isSufficient: false,
        guidance: 'Move to a brighter area',
      );
    }

    if (brightness > 0.85) {
      return LightingResult(
        brightness: brightness,
        isSufficient: true,
        guidance: 'Avoid direct bright light',
      );
    }

    return LightingResult(
      brightness: brightness,
      isSufficient: true,
      guidance: 'Good lighting',
    );
  }

  /// Calculate average luminance from the Y plane.
  /// Samples every 4th pixel for performance.
  double _averageLuminance(Uint8List yPlane) {
    if (yPlane.isEmpty) return 0.0;

    double sum = 0.0;
    int count = 0;
    final step = 4; // Sample every 4th pixel

    for (int i = 0; i < yPlane.length; i += step) {
      sum += yPlane[i];
      count++;
    }

    if (count == 0) return 0.0;

    // Normalize from 0-255 to 0.0-1.0
    return (sum / count) / 255.0;
  }
}
