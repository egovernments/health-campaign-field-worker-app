import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/face_verification_bloc.dart';
import '../data/face_model_service.dart';
import 'face_capture_view.dart';

/// A wrapper widget that provides face verification before completing an action.
/// Designed to be pushed as a route before marking attendance.
///
/// Usage from attendance flow:
/// ```dart
/// Navigator.push(context, MaterialPageRoute(
///   builder: (_) => BlocProvider.value(
///     value: faceBloc,
///     child: FaceAttendanceWrapper(
///       individualId: attendeeId,
///       faceModelService: faceModelService,
///       onVerified: () {
///         // Mark attendance
///       },
///       onFailed: () {
///         // Show error
///       },
///     ),
///   ),
/// ));
/// ```
class FaceAttendanceWrapper extends StatefulWidget {
  final String individualId;
  final FaceModelService faceModelService;
  final void Function(double confidence, {Uint8List? faceImageBytes}) onVerified;
  final void Function(double confidence, {Uint8List? faceImageBytes})? onFailed;
  final VoidCallback? onCancel;

  /// Optional title shown in the AppBar. Defaults to 'Verify Identity'.
  final String? title;

  /// Optional subtitle shown below the camera view (e.g. "2 of 3").
  final String? subtitle;

  const FaceAttendanceWrapper({
    super.key,
    required this.individualId,
    required this.faceModelService,
    required this.onVerified,
    this.onFailed,
    this.onCancel,
    this.title,
    this.subtitle,
  });

  @override
  State<FaceAttendanceWrapper> createState() => _FaceAttendanceWrapperState();
}

class _FaceAttendanceWrapperState extends State<FaceAttendanceWrapper> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  double? _verifiedConfidence;
  int _resetTrigger = 0;
  // Tracks the last rejection confidence so X-button dismissal after any
  // failed attempt is reported as onFailed (not silently dropped as MISSED).
  double? _lastRejectedConfidence;
  // Cropped face image of the last rejected attempt, so failed events can
  // store the captured face (for audit / fraud review).
  Uint8List? _lastRejectedImageBytes;

  @override
  void initState() {
    super.initState();
    _audioPlayer.setAudioContext(AudioContext(
      android: AudioContextAndroid(
        audioFocus: AndroidAudioFocus.gainTransientMayDuck,
        usageType: AndroidUsageType.notificationEvent,
        contentType: AndroidContentType.sonification,
      ),
      iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient),
    ));
    _audioPlayer.setVolume(1.0);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSuccess() {
    _audioPlayer.play(AssetSource('audio/add.wav')).catchError((e) {
      debugPrint('[FaceAttend] success sound error: $e');
    });
  }

  void _playError() {
    _audioPlayer.play(AssetSource('audio/buzzer.wav')).catchError((e) {
      debugPrint('[FaceAttend] error sound error: $e');
    });
  }

  void _reset(BuildContext context) {
    setState(() => _resetTrigger++);
    context.read<FaceVerificationBloc>().add(const FaceVerificationEvent.reset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title ?? 'Verify Identity'),
            if (widget.subtitle != null)
              Text(
                widget.subtitle!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                ),
              ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            if (_lastRejectedConfidence != null) {
              widget.onFailed?.call(_lastRejectedConfidence!,
                  faceImageBytes: _lastRejectedImageBytes);
            } else {
              widget.onCancel?.call();
            }
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocListener<FaceVerificationBloc, FaceVerificationState>(
        listener: (context, state) {
          state.maybeWhen(
            verified: (confidence, faceImageBytes) {
              _playSuccess();
              if (mounted) setState(() => _verifiedConfidence = confidence);
              Future.delayed(const Duration(milliseconds: 2000), () {
                if (mounted) {
                  Navigator.of(context).pop();
                  widget.onVerified(confidence, faceImageBytes: faceImageBytes);
                }
              });
            },
            rejected: (confidence, faceImageBytes) {
              _lastRejectedConfidence = confidence;
              _lastRejectedImageBytes = faceImageBytes;
              _playError();
              _showRejectedDialog(context, confidence);
            },
            error: (message) {
              _playError();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 3),
                ),
              );
              Future.delayed(const Duration(milliseconds: 500), () {
                if (mounted) _reset(context);
              });
            },
            orElse: () {},
          );
        },
        child: Stack(
          children: [
            FaceCaptureView(
              key: ValueKey('verify_$_resetTrigger'),
              faceModelService: widget.faceModelService,
              guidanceText: 'Look straight at the camera',
              expectedAngle: ExpectedAngle.front,
              autoCapture: true,
              minQuality: 0.5,
              multiFrameCount: 5,
              resetTrigger: _resetTrigger,
              onFaceCaptured: (embedding, quality, {faceImageBytes}) {
                context.read<FaceVerificationBloc>().add(
                      FaceVerificationEvent.verifyFace(
                        individualId: widget.individualId,
                        embedding: embedding,
                        faceImageBytes: faceImageBytes,
                      ),
                    );
              },
            ),
            if (_verifiedConfidence != null)
              _VerificationSuccessOverlay(confidence: _verifiedConfidence!),
          ],
        ),
      ),
    );
  }

  void _showRejectedDialog(BuildContext context, double confidence) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.cancel, color: Colors.red, size: 28),
            SizedBox(width: 8),
            Text('Verification Failed'),
          ],
        ),
        content: Text(
          'Face did not match '
          '(${(confidence * 100).toStringAsFixed(1)}%). '
          'Please try again.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _reset(context);
            },
            child: const Text('Try Again'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              Navigator.of(context).pop();
              widget.onFailed?.call(confidence,
                  faceImageBytes: _lastRejectedImageBytes);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}

class _VerificationSuccessOverlay extends StatelessWidget {
  final double confidence;

  const _VerificationSuccessOverlay({required this.confidence});

  @override
  Widget build(BuildContext context) {
    final pct = (confidence * 100).toStringAsFixed(1);
    return Container(
      color: Colors.black.withOpacity(0.75),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_rounded,
                  color: Colors.white, size: 48),
            ),
            const SizedBox(height: 20),
            const Text(
              'Verified!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Match: $pct%',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
