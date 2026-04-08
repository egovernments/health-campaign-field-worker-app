import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../blocs/face_verification_bloc.dart';
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

  const FaceCaptureView({
    super.key,
    required this.faceModelService,
    required this.onFaceCaptured,
    this.guidanceText = 'Position your face in the circle',
    this.minQuality = 0.5,
    this.onFaceDetected,
    this.compact = false,
    this.multiFrameCount = 3,
    this.expectedAngle,
    this.captureEnabled = true,
  });

  @override
  State<FaceCaptureView> createState() => _FaceCaptureViewState();
}

class _FaceCaptureViewState extends State<FaceCaptureView>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];
  bool _isProcessing = false;
  bool _isCaptured = false;
  Face? _detectedFace;
  bool _isFlashOn = false;
  CameraLensDirection _currentLens = CameraLensDirection.front;
  FaceDetectionResult? _latestResult;

  int _frameCount = 0;
  static const int _processEveryNthFrame = 4;

  Timer? _autoCaptureTimer;
  static const Duration _autoCaptureDelay = Duration(milliseconds: 800);

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
    _scanController.dispose();
    _stopImageStream();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _stopImageStream();
      _cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera(_currentLens);
    }
  }

  Future<void> _initializeCamera(CameraLensDirection direction) async {
    if (_cameraController != null) {
      _stopImageStream();
      while (_isProcessing) {
        await Future.delayed(const Duration(milliseconds: 16));
      }
      await _cameraController!.dispose();
      _cameraController = null;
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

    try {
      await _cameraController!.initialize();
      if (!mounted) return;
      _isFlashOn = false;
      setState(() {});
      _startImageStream();
    } catch (e) {
      debugPrint('Camera initialization failed: $e');
    }
  }

  Future<void> _switchCamera() async {
    final newLens = _currentLens == CameraLensDirection.front
        ? CameraLensDirection.back
        : CameraLensDirection.front;
    setState(() {
      _currentLens = newLens;
      _detectedFace = null;
      _latestResult = null;
    });
    await _initializeCamera(newLens);
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

    if (widget.compact && _faceReady && !_isCaptured) {
      _autoCaptureTimer?.cancel();
      _autoCaptureTimer = Timer(_autoCaptureDelay, () {
        if (mounted && _faceReady && !_isCaptured) {
          _manualCapture();
        }
      });
    } else if (widget.compact && !_faceReady) {
      _autoCaptureTimer?.cancel();
    }
  }

  void _manualCapture() {
    final result = _latestResult;
    if (result == null || _isCaptured) return;

    if (widget.multiFrameCount <= 1) {
      // Legacy single-frame mode
      setState(() => _isCaptured = true);
      _stopImageStream();
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
        return yaw.abs() < 12 && pitch.abs() < 12;
      case ExpectedAngle.left:
        return yaw > 18;
      case ExpectedAngle.right:
        return yaw < -18;
      case ExpectedAngle.up:
        return pitch > 12;
      case ExpectedAngle.down:
        return pitch < -12;
    }
  }

  /// Guidance text when the angle doesn't match.
  String? get _angleGuidance {
    final expected = widget.expectedAngle;
    if (expected == null || _detectedFace == null || _angleMatched) return null;

    switch (expected) {
      case ExpectedAngle.front:
        return 'Look straight at the camera';
      case ExpectedAngle.left:
        return 'Turn your head to the left';
      case ExpectedAngle.right:
        return 'Turn your head to the right';
      case ExpectedAngle.up:
        return 'Tilt your head slightly up';
      case ExpectedAngle.down:
        return 'Tilt your head slightly down';
    }
  }

  bool get _faceReady =>
      _latestResult != null &&
      !_isCaptured &&
      (_latestResult?.faceQuality ?? 0) >= widget.minQuality &&
      (_lightingResult?.isSufficient ?? true) &&
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
      ? 'Processing...'
      : _isCollectingFrames
          ? 'Scanning ${_collectedEmbeddings.length}/${widget.multiFrameCount}...'
          : (_lightingResult != null && !_lightingResult!.isSufficient)
              ? _lightingResult!.guidance
              : (_angleGuidance != null)
                  ? _angleGuidance!
                  : _faceReady
                      ? 'Face detected — tap capture'
                      : _detectedFace != null
                          ? 'Scanning — hold steady'
                          : widget.guidanceText;

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
                'Starting camera...',
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
                          overlayColor: const Color(0x22000000),
                        ),
                      );
                    },
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
                            const Text(
                              'Scanning...',
                              style: TextStyle(
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

          // Bottom capture button
          Padding(
            padding: EdgeInsets.only(
              top: 12,
              bottom: MediaQuery.of(context).padding.bottom + 16,
              left: 32,
              right: 32,
            ),
            child: Row(
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

                // Flash
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
                      ? 'Scanning...'
                      : _faceReady
                          ? 'Hold still...'
                          : _detectedFace != null
                              ? 'Move closer'
                              : widget.guidanceText,
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
              result.guidance,
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
