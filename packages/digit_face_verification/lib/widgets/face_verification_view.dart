import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/face_verification_bloc.dart';
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
class FaceVerificationView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        title: Text(
          mode == FaceVerificationMode.register
              ? 'Register Face'
              : 'Verify Identity',
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            onCancel?.call();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocListener<FaceVerificationBloc, FaceVerificationState>(
        listener: (context, state) {
          state.maybeWhen(
            registered: (individualId, confidence) {
              onResult(true, confidence);
              _showResultDialog(
                context,
                success: true,
                title: 'Face  Enrolled',
                message: 'Face Enrolled successfully.',
              );
            },
            verified: (confidence) {
              onResult(true, confidence);
              _showResultDialog(
                context,
                success: true,
                title: 'Verified',
                message:
                    'Face verified (${(confidence * 100).toStringAsFixed(1)}% match).',
              );
            },
            rejected: (confidence) {
              onResult(false, confidence);
              _showResultDialog(
                context,
                success: false,
                title: 'Verification Failed',
                message:
                    'Face does not match (${(confidence * 100).toStringAsFixed(1)}% similarity). '
                    'Please try again.',
              );
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                ),
              );
            },
            orElse: () {},
          );
        },
        child: FaceCaptureView(
          faceModelService: faceModelService,
          guidanceText: mode == FaceVerificationMode.register
              ? 'Position your face in the oval to register'
              : 'Position your face in the oval to verify',
          onFaceCaptured: (embedding, quality, {faceImageBytes}) {
            final bloc = context.read<FaceVerificationBloc>();

            if (mode == FaceVerificationMode.register) {
              bloc.add(FaceVerificationEvent.registerFace(
                individualId: individualId,
                embedding: embedding,
                quality: quality,
              ));
            } else {
              bloc.add(FaceVerificationEvent.verifyFace(
                individualId: individualId,
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
        content: Text(message),
        actions: [
          if (!success)
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<FaceVerificationBloc>().add(
                      const FaceVerificationEvent.reset(),
                    );
              },
              child: const Text('Try Again'),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              Navigator.of(context).pop();
            },
            child: Text(success ? 'Done' : 'Cancel'),
          ),
        ],
      ),
    );
  }
}
