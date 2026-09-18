import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../blocs/app_localization.dart';
import '../blocs/face_verification_bloc.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../data/face_model_service.dart';
import '../utils/dashed_oval_painter.dart';
import '../utils/lighting_assessment.dart';

/// Expected head pose angle for enrollment validation.
enum ExpectedAngle {
  /// Front-facing, yaw and pitch near zero.
  front,
  /// Head turned to the left (positive yaw).
  left,
  /// Head turned to the right (negative yaw).
  right,
  /// Head tilted up (negative pitch on most devices).
  up,
  /// Head tilted down (positive pitch on most devices).
  down,
}

/// Camera view with face detection overlay for capturing face embeddings.
/// Uses a white/light theme with dashed oval frame and scanner line.
class FaceCaptureView extends StatefulWidget {
  final FaceModelService faceModelService;
  final void Function(List<double> embedding, double quality, {Uint8List? faceImageBytes}) onFaceCaptured;
  final String guidanceText;
  final double minQuality;
  final void Function(Face face)? onFaceDetected;

  /// When true, hides camera controls and auto-captures when face is ready.
  final bool compact;

  /// Number of frames to capture and average for more robust embeddings.
  /// 1 = single frame (legacy), 3+ recommended for verification.
  final int multiFrameCount;

  /// Expected head pose angle. When set, capture is blocked until the user
  /// turns to the requested angle. Null means no angle validation.
  final ExpectedAngle? expectedAngle;

  /// When false, disables capture entirely — the camera streams continuously
  /// and only fires [onFaceDetected]. Used for liveness detection.
  final bool captureEnabled;

  /// When true, automatically captures when the face is ready (angle matched
  /// + quality sufficient) without requiring a manual button press.
  final bool autoCapture;

  /// Increment this value to programmatically reset the capture state and
  /// restart the image stream without recreating the widget.
  final int resetTrigger;

  /// When set, overrides the persisted lens direction for this instance.
  /// Use [CameraLensDirection.front] to force front camera (e.g. self-verification).
  /// Null means use the last-used direction (default).
  final CameraLensDirection? preferredLens;

  /// Called whenever the user switches cameras.
  final void Function(CameraLensDirection)? onLensChanged;

  const FaceCaptureView({
    super.key,
    required this.faceModelService,
    required this.onFaceCaptured,
    this.guidanceText = 'FACE_AUTH_POSITION_FACE',
    this.minQuality = 0.3,
    this.onFaceDetected,
    this.compact = false,
    this.multiFrameCount = 3,
    this.expectedAngle,
    this.captureEnabled = true,
    this.autoCapture = false,
    this.resetTrigger = 0,
    this.preferredLens,
    this.onLensChanged,
  });

  @override
  State<FaceCaptureView> createState() => _FaceCaptureViewState();
}

class _FaceCaptureViewState extends State<FaceCaptureView>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  static CameraLensDirection _lastLensDirection = CameraLensDirection.front;

  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];
  bool _isProcessing = false;
  bool _isCaptured = false;
  bool _isSwitchingCamera = false;
  bool _isInitializingCamera = false;
  Face? _detectedFace;
  bool _isFlashOn = false;
  late CameraLensDirection _currentLens;
  FaceDetectionResult? _latestResult;

  int _frameCount = 0;
  static const int _processEveryNthFrame = 4;

  Timer? _autoCaptureTimer;
  static const Duration _autoCaptureDelay = Duration(milliseconds: 800);

  // If _isCaptured stays true for this long without a bloc response, auto-reset.
  Timer? _captureTimeoutTimer;
  static const Duration _captureTimeout = Duration(seconds: 3);

  // Multi-frame averaging state
  final List<List<double>> _collectedEmbeddings = [];
  final List<double> _collectedQualities = [];
  bool _isCollectingFrames = false;
  Uint8List? _lastFaceImageBytes;

  // Lighting assessment
  static const _lightingAssessment = LightingAssessment(minBrightness: 0.25);
  LightingResult? _lightingResult;

  late AnimationController _scanController;
  late Animation<double> _scanAnimation;

  @override
  void initState() {
    super.initState();
    _currentLens = widget.preferredLens ?? _lastLensDirection;
    // Notify the parent of the initial lens too — otherwise it only learns
    // about lens changes via _switchCamera, missing the case where this view
    // opens directly on the back camera (e.g. co-worker enrollment inherits
    // the static _lastLensDirection from a prior back-camera session). The
    // post-frame callback defers it past initState so a parent setState is
    // legal.
    final initialLens = _currentLens;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) widget.onLensChanged?.call(initialLens);
    });
    WidgetsBinding.instance.addObserver(this);
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _scanAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scanController, curve: Curves.easeInOut),
    );
    _initializeCamera(_currentLens);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _autoCaptureTimer?.cancel();
    _captureTimeoutTimer?.cancel();
    _scanController.dispose();
    _stopImageStream();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FaceCaptureView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.resetTrigger != oldWidget.resetTrigger) {
      resetCapture();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _stopImageStream();
      _cameraController?.dispose();
      _cameraController = null;
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera(_currentLens);
    }
  }

  Future<void> _initializeCamera(CameraLensDirection direction) async {
    if (_isInitializingCamera) return;
    _isInitializingCamera = true;
    try {
    if (_cameraController != null) {
      _stopImageStream();
      while (_isProcessing) {
        await Future.delayed(const Duration(milliseconds: 16));
      }
      // Set controller to null and wait for the frame to complete BEFORE
      // calling dispose(). CameraPreview has its own ValueNotifier listener —
      // if dispose() fires notifyListeners() while CameraPreview is still in
      // the tree, it calls buildPreview() on the disposed controller and throws.
      // Waiting for the post-frame callback guarantees the rebuild from setState
      // has finished and CameraPreview is gone before dispose() is called.
      final old = _cameraController!;
      if (mounted) {
        setState(() => _cameraController = null);
        final completer = Completer<void>();
        WidgetsBinding.instance.addPostFrameCallback((_) => completer.complete());
        await completer.future;
      }
      await old.dispose();
    }

    _cameras = await availableCameras();
    final camera = _cameras.firstWhere(
      (c) => c.lensDirection == direction,
      orElse: () => _cameras.first,
    );

    _cameraController = CameraController(
      camera,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.nv21,
    );

    // Retry initialization — camera hardware from the previous page may still
    // be releasing when this page opens (dispose() is fire-and-forget).
    const maxAttempts = 3;
    for (int attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        await _cameraController!.initialize();
        break; // success
      } catch (e) {
        debugPrint('Camera initialization attempt $attempt/$maxAttempts failed: $e');
        if (!mounted) return;
        if (attempt < maxAttempts) {
          await Future.delayed(const Duration(milliseconds: 600));
          if (!mounted) return;
        } else {
          debugPrint('Camera initialization failed after $maxAttempts attempts');
          return;
        }
      }
    }
    if (!mounted) return;
    _isFlashOn = false;
    setState(() {});
    _startImageStream();
    } finally {
      _isInitializingCamera = false;
    }
  }

  Future<void> _switchCamera() async {
    if (_isSwitchingCamera) return;
    _isSwitchingCamera = true;
    try {
      final newLens = _currentLens == CameraLensDirection.front
          ? CameraLensDirection.back
          : CameraLensDirection.front;
      _lastLensDirection = newLens;
      _autoCaptureTimer?.cancel();
      _autoCaptureTimer = null;
      setState(() {
        _currentLens = newLens;
        _isCaptured = false;
        _isCollectingFrames = false;
        _collectedEmbeddings.clear();
        _collectedQualities.clear();
        _lastFaceImageBytes = null;
        _detectedFace = null;
        _latestResult = null;
        // Front camera has no flash hardware — turn it off when switching
        // so reopening the rear camera later starts in a known state.
        if (newLens == CameraLensDirection.front) {
          _isFlashOn = false;
        }
      });
      widget.onLensChanged?.call(newLens);
      while (_isInitializingCamera) {
        await Future.delayed(const Duration(milliseconds: 16));
        if (!mounted) return;
      }
      await _initializeCamera(newLens);
    } finally {
      _isSwitchingCamera = false;
    }
  }

  void _startImageStream() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    _cameraController!.startImageStream((CameraImage image) {
      if (_isProcessing || _isCaptured) return;
      _frameCount++;
      if (_frameCount % _processEveryNthFrame != 0) return;
      _isProcessing = true;
      _processFrame(image).then((_) {
        _isProcessing = false;
      }).catchError((e) {
        debugPrint('FaceCaptureView: frame processing error: $e');
        _isProcessing = false;
      });
    });
  }

  void _stopImageStream() {
    if (_cameraController != null &&
        _cameraController!.value.isInitialized &&
        _cameraController!.value.isStreamingImages) {
      _cameraController!.stopImageStream();
    }
  }

  Future<void> _processFrame(CameraImage image) async {
    if (!widget.faceModelService.isInitialized) return;
    final controller = _cameraController;
    if (controller == null || !controller.value.isInitialized) return;

    // Assess lighting on every processed frame
    final lighting = _lightingAssessment.assess(image);
    if (mounted) {
      setState(() => _lightingResult = lighting);
    }

    final camera = controller.description;
    final result = await widget.faceModelService.processFrame(
      image,
      sensorOrientation: camera.sensorOrientation,
      lensDirection: camera.lensDirection,
    );

    if (!mounted || _cameraController != controller) return;

    if (result == null) {
      setState(() {
        _detectedFace = null;
        _latestResult = null;
      });
      context.read<FaceVerificationBloc>().add(
            const FaceVerificationEvent.faceDetected(faceCount: 0),
          );
      return;
    }

    setState(() {
      _detectedFace = result.face;
      _latestResult = result;
    });

    widget.onFaceDetected?.call(result.face);

    context.read<FaceVerificationBloc>().add(
          FaceVerificationEvent.faceDetected(
            faceCount: 1,
            quality: result.faceQuality,
          ),
        );

    // If capture is disabled (liveness mode), just stream detections
    if (!widget.captureEnabled) return;

    // If we're collecting multi-frame embeddings, add this frame
    if (_isCollectingFrames && !_isCaptured) {
      _collectFrame(result);
      return;
    }

    if ((widget.compact || widget.autoCapture) && _faceReady && !_isCaptured) {
      // Only start the timer once — don't restart it on every frame
      if (_autoCaptureTimer == null || !_autoCaptureTimer!.isActive) {
        _autoCaptureTimer = Timer(_autoCaptureDelay, () {
          if (mounted && _faceReady && !_isCaptured) {
            _manualCapture();
          }
        });
      }
    } else if ((widget.compact || widget.autoCapture) && !_faceReady) {
      // Cancel if face moves away or angle no longer matches
      _autoCaptureTimer?.cancel();
      _autoCaptureTimer = null;
    }
  }

  void _manualCapture() {
    final result = _latestResult;
    if (result == null || _isCaptured) return;

    if (widget.multiFrameCount <= 1) {
      // Legacy single-frame mode
      setState(() => _isCaptured = true);
      _stopImageStream();
      _captureTimeoutTimer?.cancel();
      _captureTimeoutTimer = Timer(_captureTimeout, () {
        if (mounted && _isCaptured) {
          debugPrint('FaceCaptureView: capture timeout — resetting');
          context.read<FaceVerificationBloc>().add(
                const FaceVerificationEvent.reset(),
              );
          resetCapture();
        }
      });
      widget.onFaceCaptured(result.embedding, result.faceQuality, faceImageBytes: result.faceImageBytes);
      return;
    }

    // Multi-frame mode: start collecting frames
    if (!_isCollectingFrames) {
      setState(() {
        _isCollectingFrames = true;
        _collectedEmbeddings.clear();
        _collectedQualities.clear();
      });
      _collectedEmbeddings.add(result.embedding);
      _collectedQualities.add(result.faceQuality);
      debugPrint('FaceCaptureView: collecting frame 1/${widget.multiFrameCount}');
      // Continue streaming to collect more frames
    }
  }

  /// Called from _processFrame when in multi-frame collection mode.
  void _collectFrame(FaceDetectionResult result) {
    if (!_isCollectingFrames || _isCaptured) return;
    if (result.faceQuality < widget.minQuality) return; // skip low quality

    _collectedEmbeddings.add(result.embedding);
    _collectedQualities.add(result.faceQuality);
    if (result.faceImageBytes != null) _lastFaceImageBytes = result.faceImageBytes;
    debugPrint('FaceCaptureView: collecting frame '
        '${_collectedEmbeddings.length}/${widget.multiFrameCount}');

    if (_collectedEmbeddings.length >= widget.multiFrameCount) {
      // Average all collected embeddings
      final averaged = _averageEmbeddings(_collectedEmbeddings);
      final avgQuality = _collectedQualities.reduce((a, b) => a + b) /
          _collectedQualities.length;

      setState(() {
        _isCaptured = true;
        _isCollectingFrames = false;
      });
      _stopImageStream();
      // Safety net: if the bloc never responds, auto-reset after timeout.
      _captureTimeoutTimer?.cancel();
      _captureTimeoutTimer = Timer(_captureTimeout, () {
        if (mounted && _isCaptured) {
          debugPrint('FaceCaptureView: capture timeout — resetting');
          context.read<FaceVerificationBloc>().add(
                const FaceVerificationEvent.reset(),
              );
          resetCapture();
        }
      });
      debugPrint('FaceCaptureView: multi-frame capture complete, '
          'avgQuality=$avgQuality');
      widget.onFaceCaptured(averaged, avgQuality, faceImageBytes: _lastFaceImageBytes);
    } else {
      setState(() {}); // update UI with progress
    }
  }

  /// Average multiple embedding vectors and L2-normalize the result.
  List<double> _averageEmbeddings(List<List<double>> embeddings) {
    final dim = embeddings.first.length;
    final avg = List<double>.filled(dim, 0.0);
    for (final emb in embeddings) {
      for (int i = 0; i < dim; i++) {
        avg[i] += emb[i];
      }
    }
    // Normalize to unit length (L2)
    double norm = 0.0;
    for (int i = 0; i < dim; i++) {
      avg[i] /= embeddings.length;
      norm += avg[i] * avg[i];
    }
    norm = norm > 0 ? sqrt(norm) : 1.0;
    for (int i = 0; i < dim; i++) {
      avg[i] /= norm;
    }
    return avg;
  }

  Future<void> _toggleFlash() async {
    if (_cameraController == null) return;
    _isFlashOn = !_isFlashOn;
    await _cameraController!.setFlashMode(
      _isFlashOn ? FlashMode.torch : FlashMode.off,
    );
    setState(() {});
  }

  void resetCapture() {
    _captureTimeoutTimer?.cancel();
    _captureTimeoutTimer = null;
    setState(() {
      _isCaptured = false;
      _isCollectingFrames = false;
      _collectedEmbeddings.clear();
      _collectedQualities.clear();
      _lastFaceImageBytes = null;
      _detectedFace = null;
      _latestResult = null;
    });
    _startImageStream();
  }

  /// Whether the detected face matches the expected head pose angle.
  /// Returns true if no angle validation is required.
  bool get _angleMatched {
    final expected = widget.expectedAngle;
    if (expected == null || _detectedFace == null) return true;

    final yaw = _detectedFace!.headEulerAngleY ?? 0.0; // left/right
    final pitch = _detectedFace!.headEulerAngleX ?? 0.0; // up/down

    switch (expected) {
      case ExpectedAngle.front:
        return yaw.abs() < 15 && pitch.abs() < 15;
      case ExpectedAngle.left:
        return yaw > 12;
      case ExpectedAngle.right:
        return yaw < -12;
      case ExpectedAngle.up:
        return pitch > 10;
      case ExpectedAngle.down:
        return pitch < -10;
    }
  }

  /// Guidance text when the angle doesn't match.
  /// Wording is kept identical for front and back cameras — the user asked
  /// to see the same instruction text regardless of which camera is active.
  String? get _angleGuidance {
    final expected = widget.expectedAngle;
    if (expected == null || _detectedFace == null || _angleMatched) return null;

    switch (expected) {
      case ExpectedAngle.front:
        return FaceVerificationLocalization.of(context).translate(i18.faceVerification.angleStraight);
      case ExpectedAngle.left:
        return FaceVerificationLocalization.of(context).translate(i18.faceVerification.livenessTurnLeft);
      case ExpectedAngle.right:
        return FaceVerificationLocalization.of(context).translate(i18.faceVerification.livenessTurnRight);
      case ExpectedAngle.up:
        return FaceVerificationLocalization.of(context).translate(i18.faceVerification.tiltUp);
      case ExpectedAngle.down:
        return FaceVerificationLocalization.of(context).translate(i18.faceVerification.tiltDown);
    }
  }

  /// Hint when the face is meaningfully too close or too far from the
  /// camera. Returns null when the face fills a reasonable share of the
  /// frame, so callers can prefer angle / lighting hints instead.
  ///
  /// Thresholds are chosen so the typical arm's-length selfie distance
  /// (face ~30 % of frame width) is "comfortable". Below 18 % the face
  /// is too small for ML Kit landmark accuracy; above 60 % it tends to
  /// clip the dashed oval.
  String? get _distanceGuidance {
    if (_detectedFace == null) return null;
    final ratio = _latestResult?.faceFillRatio;
    if (ratio == null) return null;
    if (ratio < 0.18) {
      return FaceVerificationLocalization.of(context).translate(i18.faceVerification.moveCloser);
    }
    if (ratio > 0.60) {
      return FaceVerificationLocalization.of(context).translate(i18.faceVerification.moveBack);
    }
    return null;
  }

  bool get _distanceOk {
    final r = _latestResult?.faceFillRatio;
    if (r == null) return true;
    return r >= 0.18 && r <= 0.60;
  }

  bool get _faceReady =>
      _latestResult != null &&
      !_isCaptured &&
      (_latestResult?.faceQuality ?? 0) >= widget.minQuality &&
      (_lightingResult?.isSufficient ?? true) &&
      _distanceOk &&
      _angleMatched;

  Color get _statusColor => _isCaptured
      ? const Color(0xFF00BCD4)
      : _faceReady
          ? const Color(0xFF2E7D32)
          : (_angleGuidance != null)
              ? const Color(0xFFE65100) // orange when wrong angle
              : _detectedFace != null
                  ? const Color(0xFF00BCD4)
                  : const Color(0xFF78909C);

  String get _statusText => _isCaptured
      ? FaceVerificationLocalization.of(context).translate(i18.faceVerification.processing)
      : _isCollectingFrames
          ? '${FaceVerificationLocalization.of(context).translate(i18.faceVerification.scanning)} ${_collectedEmbeddings.length}/${widget.multiFrameCount}...'
          : (_lightingResult != null && !_lightingResult!.isSufficient)
              ? FaceVerificationLocalization.of(context).translate(_lightingResult!.guidance)
              : (_angleGuidance != null)
                  ? _angleGuidance!
                  : (_distanceGuidance != null)
                      ? _distanceGuidance!
                      : _faceReady
                          ? (widget.autoCapture
                              ? FaceVerificationLocalization.of(context).translate(i18.faceVerification.holdStillCapturing)
                              : FaceVerificationLocalization.of(context).translate(i18.faceVerification.tapCapture))
                          : _detectedFace != null
                              ? FaceVerificationLocalization.of(context).translate(i18.faceVerification.scanningHoldSteady)
                              : FaceVerificationLocalization.of(context).translate(widget.guidanceText);

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
                strokeWidth: 2.5,
              ),
              const SizedBox(height: 16),
              Text(
                FaceVerificationLocalization.of(context)
                    .translate(i18.faceVerification.initializing),
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.5),
                    fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    return BlocListener<FaceVerificationBloc, FaceVerificationState>(
      listener: (context, state) {
        if (_isCaptured && state is FaceVerificationIdleState) {
          resetCapture();
        }
      },
      child: widget.compact
          ? _buildCompactLayout(context)
          : _buildFullLayout(context),
    );
  }

  // ── Full Layout (white theme) ──

  Widget _buildFullLayout(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          // Status banner
          _StatusBanner(
            text: _statusText,
            color: _statusColor,
            isCaptured: _isCaptured,
          ),

          // Lighting indicator
          if (_lightingResult != null && !_isCaptured)
            _LightingIndicator(result: _lightingResult!),

          // Camera area in dashed frame
          Expanded(
            child: DashedFrameContainer(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Camera preview
                  ClipRect(
                    child: OverflowBox(
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width:
                              _cameraController!.value.previewSize!.height,
                          height:
                              _cameraController!.value.previewSize!.width,
                          child: CameraPreview(_cameraController!),
                        ),
                      ),
                    ),
                  ),

                  // Dashed oval overlay + scanner
                  AnimatedBuilder(
                    animation: _scanAnimation,
                    builder: (context, child) {
                      return CustomPaint(
                        size: Size.infinite,
                        painter: DashedOvalPainter(
                          borderColor: _detectedFace != null
                              ? _statusColor
                              : const Color(0xFFB0BEC5),
                          ovalWidth: 200,
                          ovalHeight: 260,
                          centerYOffset: -10,
                          scanProgress: _detectedFace != null
                              ? _scanAnimation.value
                              : -1,
                          scanColor: _statusColor,
                          overlayColor: Colors.white.withOpacity(0.88),
                        ),
                      );
                    },
                  ),

                  // Centered guidance text overlay (below oval)
                  if (!_isCaptured)
                    Positioned(
                      bottom: 16,
                      left: 24,
                      right: 24,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.55),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _statusText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(blurRadius: 4, color: Colors.black54),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  // Processing overlay
                  if (_isCaptured)
                    Container(
                      color: const Color(0x66000000),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              FaceVerificationLocalization.of(context)
                                  .translate(
                                      i18.faceVerification.gateScanning),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Bottom controls
          Padding(
            padding: EdgeInsets.only(
              top: 12,
              bottom: MediaQuery.of(context).padding.bottom + 16,
              left: 32,
              right: 32,
            ),
            child: (widget.autoCapture || !widget.captureEnabled)
                // In auto-capture mode OR when capture is disabled (e.g. the
                // liveness step), show only the camera switch button — no
                // manual capture trigger, no flash control.
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _LightControlButton(
                        icon: Icons.cameraswitch_rounded,
                        onPressed: _isCaptured ? null : _switchCamera,
                      ),
                    ],
                  )
                // In manual mode show switch + capture + flash
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Camera switch
                      _LightControlButton(
                        icon: Icons.cameraswitch_rounded,
                        onPressed: _isCaptured ? null : _switchCamera,
                      ),

                      // Capture button
                      GestureDetector(
                        onTap: _faceReady ? _manualCapture : null,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _faceReady
                                ? theme.colorScheme.primary
                                : theme.dividerColor,
                            boxShadow: _faceReady
                                ? [
                                    BoxShadow(
                                      color: theme.colorScheme.primary
                                          .withOpacity(0.3),
                                      blurRadius: 12,
                                      spreadRadius: 1,
                                    ),
                                  ]
                                : null,
                          ),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: _faceReady
                                ? theme.colorScheme.onPrimary
                                : theme.colorScheme.onSurface.withOpacity(0.4),
                            size: 28,
                          ),
                        ),
                      ),

                      // Flash — only show on rear camera (no flash on selfie cam)
                      if (_currentLens != CameraLensDirection.front)
                        _LightControlButton(
                          icon: _isFlashOn
                              ? Icons.flash_on_rounded
                              : Icons.flash_off_rounded,
                          onPressed: _toggleFlash,
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  // ── Compact Layout ──

  Widget _buildCompactLayout(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRect(
          child: OverflowBox(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _cameraController!.value.previewSize!.height,
                height: _cameraController!.value.previewSize!.width,
                child: CameraPreview(_cameraController!),
              ),
            ),
          ),
        ),

        AnimatedBuilder(
          animation: _scanAnimation,
          builder: (context, child) {
            return CustomPaint(
              size: Size.infinite,
              painter: DashedOvalPainter(
                borderColor: _detectedFace != null
                    ? _statusColor
                    : const Color(0xFFB0BEC5),
                ovalWidth: 160,
                ovalHeight: 200,
                centerYOffset: 0,
                scanProgress:
                    _detectedFace != null ? _scanAnimation.value : -1,
                scanColor: _statusColor,
                overlayColor: const Color(0x22000000),
              ),
            );
          },
        ),

        // Lighting warning (compact)
        if (_lightingResult != null &&
            !_lightingResult!.isSufficient &&
            !_isCaptured)
          Positioned(
            top: 8,
            left: 16,
            right: 16,
            child: _LightingIndicator(
              result: _lightingResult!,
              compact: true,
            ),
          ),

        // Status bar at bottom
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _statusColor,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _isCaptured
                      ? FaceVerificationLocalization.of(context).translate(i18.faceVerification.scanning)
                      : (_angleGuidance != null)
                          ? _angleGuidance!
                          : (_distanceGuidance != null)
                              ? _distanceGuidance!
                              : _faceReady
                                  ? FaceVerificationLocalization.of(context).translate(i18.faceVerification.holdStill)
                                  : _detectedFace != null
                                      ? FaceVerificationLocalization.of(context).translate(i18.faceVerification.holdSteady)
                                      : FaceVerificationLocalization.of(context).translate(widget.guidanceText),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),

        if (_isCaptured)
          Container(
            color: const Color(0x66000000),
            child: const Center(
              child: SizedBox(
                width: 36,
                height: 36,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// ── Status Banner ──

class _StatusBanner extends StatelessWidget {
  final String text;
  final Color color;
  final bool isCaptured;

  const _StatusBanner({
    required this.text,
    required this.color,
    required this.isCaptured,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isCaptured)
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: color,
              ),
            )
          else
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Light Control Button ──

// ── Lighting Indicator ──

class _LightingIndicator extends StatelessWidget {
  final LightingResult result;
  final bool compact;

  const _LightingIndicator({
    required this.result,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = result.brightness.clamp(0.0, 1.0);
    final isSufficient = result.isSufficient;
    final color = isSufficient ? const Color(0xFF2E7D32) : const Color(0xFFE65100);
    final icon = isSufficient ? Icons.wb_sunny : Icons.wb_sunny_outlined;

    if (compact) {
      // Floating chip style for compact layout
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 16),
            const SizedBox(width: 6),
            Text(
              FaceVerificationLocalization.of(context).translate(result.guidance),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    // Full layout: brightness bar below status banner
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: brightness,
                minHeight: 6,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(
                  isSufficient ? const Color(0xFF2E7D32) : const Color(0xFFE65100),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${(brightness * 100).round()}%',
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Light Control Button ──

class _LightControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _LightControlButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.scaffoldBackgroundColor,
          border: Border.all(color: theme.dividerColor),
        ),
        child: Icon(
          icon,
          color: onPressed != null
              ? theme.colorScheme.onSurface.withOpacity(0.7)
              : theme.disabledColor,
          size: 22,
        ),
      ),
    );
  }
}
