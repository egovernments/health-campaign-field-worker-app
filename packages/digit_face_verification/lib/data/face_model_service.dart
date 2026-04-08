import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' show Size;

import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

import '../utils/image_preprocessing.dart';

/// Result of face detection + embedding extraction pipeline.
class FaceDetectionResult {
  final List<double> embedding;
  final Face face;
  final double faceQuality;

  /// JPEG-encoded bytes of the cropped 112x112 face image.
  final Uint8List? faceImageBytes;

  const FaceDetectionResult({
    required this.embedding,
    required this.face,
    required this.faceQuality,
    this.faceImageBytes,
  });
}

/// Core ML service that handles:
/// 1. Face detection via Google ML Kit
/// 2. Face embedding extraction via MobileFaceNet TFLite
class FaceModelService {
  static const String _modelAssetPath = 'packages/digit_face_verification/assets/models/mobilefacenet.tflite';
  static const int _embeddingDim = 192;
  static const int _inputSize = 112;

  Interpreter? _interpreter;
  late final FaceDetector _faceDetector;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  /// Initialize the ML Kit face detector and TFLite interpreter.
  Future<void> initialize() async {
    if (_isInitialized) return;

    // Configure ML Kit face detector for single face detection
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableLandmarks: true,
        enableClassification: true,
        performanceMode: FaceDetectorMode.accurate,
        minFaceSize: 0.15,
      ),
    );

    // Load MobileFaceNet TFLite model
    try {
      _interpreter = await Interpreter.fromAsset(
        _modelAssetPath,
        options: InterpreterOptions()..threads = 2,
      );
    } catch (e) {
      throw Exception(
        'Failed to load MobileFaceNet model from $_modelAssetPath. '
        'Ensure the .tflite file is placed in assets/models/. Error: $e',
      );
    }

    _isInitialized = true;
  }

  /// Detect faces in a [CameraImage] from the live camera feed.
  /// Returns a list of detected [Face] objects.
  Future<List<Face>> detectFaces(
    CameraImage cameraImage, {
    required int sensorOrientation,
    required CameraLensDirection lensDirection,
  }) async {
    _ensureInitialized();

    final inputImage = _cameraImageToInputImage(
      cameraImage,
      sensorOrientation: sensorOrientation,
      lensDirection: lensDirection,
    );

    return _faceDetector.processImage(inputImage);
  }

  /// Detect faces from an [XFile] (captured photo).
  Future<List<Face>> detectFacesFromFile(XFile file) async {
    _ensureInitialized();
    final inputImage = InputImage.fromFilePath(file.path);
    return _faceDetector.processImage(inputImage);
  }

  /// Full pipeline: detect face + extract embedding from a [CameraImage].
  /// Returns null if no face or multiple faces are detected.
  Future<FaceDetectionResult?> processFrame(
    CameraImage cameraImage, {
    required int sensorOrientation,
    required CameraLensDirection lensDirection,
  }) async {
    _ensureInitialized();

    final faces = await detectFaces(
      cameraImage,
      sensorOrientation: sensorOrientation,
      lensDirection: lensDirection,
    );

    if (faces.isEmpty || faces.length > 1) return null;

    final face = faces.first;
    final quality = _assessFaceQuality(face);

    // Convert camera image to processable format and rotate to match
    // ML Kit's coordinate space. ML Kit applies the rotation hint internally,
    // so its bounding box is in the upright frame. We must rotate our RGB
    // image by the same amount before cropping.
    final rawImage = ImagePreprocessing.convertCameraImage(cameraImage);
    final image = sensorOrientation == 0
        ? rawImage
        : img.copyRotate(rawImage, angle: sensorOrientation);

    // Crop, enhance contrast (critical for darker skin tones), resize, normalize
    final cropped = ImagePreprocessing.cropFace(image, face);
    final enhanced = ImagePreprocessing.enhanceContrast(cropped);
    final resized = ImagePreprocessing.resizeFace(enhanced);
    final normalized = ImagePreprocessing.normalizeToFloat32NHWC(resized);

    // Run inference
    final embedding = _runInference(normalized);

    // Encode the cropped face as JPEG for audit storage
    final faceJpeg = Uint8List.fromList(img.encodeJpg(resized, quality: 75));

    return FaceDetectionResult(
      embedding: embedding,
      face: face,
      faceQuality: quality,
      faceImageBytes: faceJpeg,
    );
  }

  /// Extract embedding from an already-cropped and preprocessed face image.
  /// The image should already be 112x112.
  List<double> extractEmbedding(img.Image faceImage) {
    _ensureInitialized();

    final enhanced = ImagePreprocessing.enhanceContrast(faceImage);
    final resized = enhanced.width == _inputSize && enhanced.height == _inputSize
        ? enhanced
        : ImagePreprocessing.resizeFace(enhanced);

    final normalized = ImagePreprocessing.normalizeToFloat32NHWC(resized);
    return _runInference(normalized);
  }

  /// Run the TFLite model inference and return L2-normalized embedding.
  List<double> _runInference(Float32List input) {
    // Reshape input to [1, 112, 112, 3]
    final inputTensor = input.reshape([1, _inputSize, _inputSize, 3]);

    // Output shape: [1, 192]
    final output = List.filled(1 * _embeddingDim, 0.0).reshape([1, _embeddingDim]);

    _interpreter!.run(inputTensor, output);

    // Extract and L2-normalize the embedding
    final embedding = List<double>.from(output[0] as List);
    return _l2Normalize(embedding);
  }

  /// L2-normalize the embedding vector so that its magnitude is 1.
  List<double> _l2Normalize(List<double> embedding) {
    double sumSquares = 0.0;
    for (final val in embedding) {
      sumSquares += val * val;
    }

    final norm = sqrt(sumSquares);
    if (norm == 0.0) return embedding;

    return embedding.map((val) => val / norm).toList();
  }

  /// Assess face quality based on ML Kit classification scores.
  /// Returns a quality score from 0.0 to 1.0.
  double _assessFaceQuality(Face face) {
    double quality = 1.0;

    // Penalize low eye-open probability (possible blink/closed eyes)
    final leftEyeOpen = face.leftEyeOpenProbability ?? 1.0;
    final rightEyeOpen = face.rightEyeOpenProbability ?? 1.0;
    if (leftEyeOpen < 0.5 || rightEyeOpen < 0.5) {
      quality *= 0.7;
    }

    // Penalize extreme head rotation (yaw)
    final headY = face.headEulerAngleY ?? 0.0;
    if (headY.abs() > 20) {
      quality *= 0.6;
    }

    // Penalize extreme head tilt (roll)
    final headZ = face.headEulerAngleZ ?? 0.0;
    if (headZ.abs() > 15) {
      quality *= 0.8;
    }

    // Penalize small face (too far from camera)
    final faceWidth = face.boundingBox.width;
    if (faceWidth < 80) {
      quality *= 0.5;
    }

    return quality.clamp(0.0, 1.0);
  }

  /// Convert [CameraImage] to ML Kit [InputImage].
  ///
  /// CameraX outputs YUV_420_888 with separate planes that may have row
  /// padding and UV pixel stride of 2.  ML Kit's NV21 format expects a
  /// compact buffer of exactly width*height*1.5 bytes (Y + interleaved VU)
  /// with bytesPerRow == width.  We rebuild that buffer manually.
  InputImage _cameraImageToInputImage(
    CameraImage cameraImage, {
    required int sensorOrientation,
    required CameraLensDirection lensDirection,
  }) {
    final rotation = ImagePreprocessing.rotationFromSensorOrientation(
      sensorOrientation,
    );

    final width = cameraImage.width;
    final height = cameraImage.height;
    final nv21 = _yuv420ToNv21(cameraImage);

    return InputImage.fromBytes(
      bytes: nv21,
      metadata: InputImageMetadata(
        size: Size(width.toDouble(), height.toDouble()),
        rotation: rotation,
        format: InputImageFormat.nv21,
        bytesPerRow: width,
      ),
    );
  }

  /// Build a compact NV21 byte buffer from CameraX YUV_420_888 planes.
  /// NV21 layout: [Y plane: width*height] [VU interleaved: width*height/2]
  static Uint8List _yuv420ToNv21(CameraImage image) {
    final width = image.width;
    final height = image.height;
    final yPlane = image.planes[0];
    final uPlane = image.planes[1];
    final vPlane = image.planes[2];
    final uvPixelStride = uPlane.bytesPerPixel ?? 1;
    final uvRowStride = uPlane.bytesPerRow;

    final nv21 = Uint8List(width * height + width * (height ~/ 2));

    // Copy Y row-by-row (strips any row padding)
    int destIndex = 0;
    for (int row = 0; row < height; row++) {
      final rowStart = row * yPlane.bytesPerRow;
      for (int col = 0; col < width; col++) {
        nv21[destIndex++] = yPlane.bytes[rowStart + col];
      }
    }

    // Copy VU interleaved
    final uvHeight = height ~/ 2;
    final uvWidth = width ~/ 2;
    for (int row = 0; row < uvHeight; row++) {
      final rowStart = row * uvRowStride;
      for (int col = 0; col < uvWidth; col++) {
        final idx = rowStart + col * uvPixelStride;
        nv21[destIndex++] = vPlane.bytes[idx]; // V first in NV21
        nv21[destIndex++] = uPlane.bytes[idx]; // then U
      }
    }

    return nv21;
  }

  void _ensureInitialized() {
    if (!_isInitialized) {
      throw StateError(
        'FaceModelService not initialized. Call initialize() first.',
      );
    }
  }

  /// Dispose all ML resources.
  void dispose() {
    _interpreter?.close();
    _faceDetector.close();
    _isInitialized = false;
  }
}
