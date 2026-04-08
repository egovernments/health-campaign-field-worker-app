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
class FaceAttendanceWrapper extends StatelessWidget {
  final String individualId;
  final FaceModelService faceModelService;
  final VoidCallback onVerified;
  final VoidCallback? onFailed;
  final VoidCallback? onCancel;

  const FaceAttendanceWrapper({
    super.key,
    required this.individualId,
    required this.faceModelService,
    required this.onVerified,
    this.onFailed,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Verify Identity'),
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
            verified: (confidence) {
              Navigator.of(context).pop();
              onVerified();
            },
            rejected: (confidence) {
              _showRejectedDialog(context, confidence);
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
          guidanceText: 'Look at the camera to verify your identity',
          onFaceCaptured: (embedding, quality, {faceImageBytes}) {
            context.read<FaceVerificationBloc>().add(
                  FaceVerificationEvent.verifyFace(
                    individualId: individualId,
                    embedding: embedding,
                  ),
                );
          },
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
          'Face does not match (${(confidence * 100).toStringAsFixed(1)}% similarity). '
          'Please try again.',
        ),
        actions: [
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
              onFailed?.call();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
