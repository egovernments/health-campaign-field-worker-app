import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_localization.dart';
import '../blocs/face_verification_bloc.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../data/face_model_service.dart';
import 'face_capture_view.dart';

/// Mode determines whether the view is used for registration or verification.
enum FaceVerificationMode { register, verify }

/// Full-screen face verification/registration page.
///
/// Usage:
/// ```dart
/// Navigator.push(context, MaterialPageRoute(
///   builder: (_) => FaceVerificationView(
///     mode: FaceVerificationMode.verify,
///     individualId: 'worker-123',
///     faceModelService: faceModelService,
///     onResult: (success, confidence) {
///       // Handle result
///     },
///   ),
/// ));
/// ```
class FaceVerificationView extends StatefulWidget {
  final FaceVerificationMode mode;
  final String individualId;
  final FaceModelService faceModelService;
  final void Function(bool success, double confidence) onResult;
  final VoidCallback? onCancel;

  const FaceVerificationView({
    super.key,
    required this.mode,
    required this.individualId,
    required this.faceModelService,
    required this.onResult,
    this.onCancel,
  });

  @override
  State<FaceVerificationView> createState() => _FaceVerificationViewState();
}

class _FaceVerificationViewState extends State<FaceVerificationView> {
  final AudioPlayer _audioPlayer = AudioPlayer();

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
      debugPrint('[FaceVerif] success sound error: $e');
    });
  }

  void _playError() {
    _audioPlayer.play(AssetSource('audio/buzzer.wav')).catchError((e) {
      debugPrint('[FaceVerif] error sound error: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        title: Text(
          FaceVerificationLocalization.of(context).translate(
            widget.mode == FaceVerificationMode.register
                ? i18.faceVerification.enrollmentTitle
                : i18.faceVerification.verifyIdentity,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            widget.onCancel?.call();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocListener<FaceVerificationBloc, FaceVerificationState>(
        listener: (context, state) {
          state.maybeWhen(
            registered: (individualId, confidence) {
              _playSuccess();
              widget.onResult(true, confidence);
              _showResultDialog(
                context,
                success: true,
                title: FaceVerificationLocalization.of(context).translate(i18.faceVerification.enrolledTitle),
                message: FaceVerificationLocalization.of(context).translate(i18.faceVerification.enrolledMessage),
              );
            },
            verified: (confidence, faceImageBytes) {
              _playSuccess();
              widget.onResult(true, confidence);
              _showResultDialog(
                context,
                success: true,
                title: FaceVerificationLocalization.of(context).translate(i18.faceVerification.verifiedTitle),
                message:
                    '${FaceVerificationLocalization.of(context).translate(i18.faceVerification.verifiedMessage)} (${(confidence * 100).toStringAsFixed(1)}%).',
              );
            },
            rejected: (confidence, faceImageBytes) {
              _playError();
              widget.onResult(false, confidence);
              _showResultDialog(
                context,
                success: false,
                title: FaceVerificationLocalization.of(context).translate(i18.faceVerification.verificationFailedTitle),
                message:
                    '${FaceVerificationLocalization.of(context).translate(i18.faceVerification.rejectedMessage)} (${(confidence * 100).toStringAsFixed(1)}%)',
              );
            },
            error: (message) {
              _playError();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(FaceVerificationLocalization.of(context).translate(message)),
                  backgroundColor: Colors.red,
                ),
              );
            },
            orElse: () {},
          );
        },
        child: FaceCaptureView(
          faceModelService: widget.faceModelService,
          guidanceText: i18.faceVerification.positionFace,
          onFaceCaptured: (embedding, quality, {faceImageBytes}) {
            final bloc = context.read<FaceVerificationBloc>();

            if (widget.mode == FaceVerificationMode.register) {
              bloc.add(FaceVerificationEvent.registerFace(
                individualId: widget.individualId,
                embedding: embedding,
                quality: quality,
              ));
            } else {
              bloc.add(FaceVerificationEvent.verifyFace(
                individualId: widget.individualId,
                embedding: embedding,
              ));
            }
          },
        ),
      ),
    );
  }

  void _showResultDialog(
    BuildContext context, {
    required bool success,
    required String title,
    required String message,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: Row(
          children: [
            Icon(
              success ? Icons.check_circle : Icons.cancel,
              color: success ? Colors.green : Colors.red,
              size: 28,
            ),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
        content: Text(FaceVerificationLocalization.of(context).translate(message)),
        actions: [
          if (!success)
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<FaceVerificationBloc>().add(
                      const FaceVerificationEvent.reset(),
                    );
              },
              child: Text(FaceVerificationLocalization.of(context).translate(i18.faceVerification.tryAgain)),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              Navigator.of(context).pop();
            },
            child: Text(FaceVerificationLocalization.of(context).translate(
              success
                  ? i18.faceVerification.done
                  : i18.common.coreCommonCancel,
            )),
          ),
        ],
      ),
    );
  }
}
