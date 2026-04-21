import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/face_auth/reverification_bloc.dart';
import '../../services/face_auth_event_logger.dart';
import '../../utils/extensions/extensions.dart';
import 'face_verification_dialog.dart';

/// Logs a re-verification result from any entry point (banner, popup, etc.)
/// and fires [ReVerificationEvent.externalVerified] on the bloc.
/// Safe to call from widgets that don't have access to [FaceAuthEventModel].
Future<void> logAndCompleteReVerification(
  BuildContext context,
  FaceVerificationResult result,
) async {
  if (!result.passed) return;
  try {
    final logger = FaceAuthEventLogger(
      repository: context.read<
          LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>(),
      userId: context.loggedInUserUuid,
      projectId: context.projectId,
      boundaryCode: context.boundaryOrNull?.code ?? '',
    );
    if (result.confidence > 0) {
      await logger.logFaceSuccess(
        eventType: FaceAuthEventType.reVerify,
        confidence: result.confidence,
        faceImageBytes: result.faceImageBytes,
      );
    } else {
      await logger.logPinFallback(
        eventType: FaceAuthEventType.reVerify,
      );
    }
  } catch (e) {
    debugPrint('logAndCompleteReVerification: failed to log: $e');
  }
  if (context.mounted) {
    context
        .read<ReVerificationBloc>()
        .add(const ReVerificationEvent.externalVerified());
  }
}

/// Listens to ReVerificationBloc and shows a bottom-sheet prompt
/// with a countdown timer when re-verification is triggered.
/// Also logs face auth events to the database for history display.
class ReVerificationListener extends StatefulWidget {
  final Widget child;

  const ReVerificationListener({super.key, required this.child});

  @override
  State<ReVerificationListener> createState() => _ReVerificationListenerState();
}

class _ReVerificationListenerState extends State<ReVerificationListener> {
  bool _isBusy = false; // true when sheet or dialog is open
  bool _lastVerifiedViaDialog = false; // prevents double-logging
  bool _dismissedThisCycle = false; // true after "Remind me later" — resets on new iteration
  int _lastShownIteration = 0; // tracks which iteration we last showed the sheet for

  FaceAuthEventLogger? _createLogger(BuildContext context) {
    try {
      return FaceAuthEventLogger(
        repository: context.read<LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>(),
        userId: context.loggedInUserUuid,
        projectId: context.projectId,
        boundaryCode: context.boundaryOrNull?.code ?? '',
      );
    } catch (e) {
      debugPrint('ReVerificationListener: failed to create logger: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReVerificationBloc, ReVerificationState>(
      listener: (context, state) async {
        if (state is ReVerificationPromptedState) {
          // Reset dismissed flag when a new iteration starts
          if (state.iteration != _lastShownIteration) {
            _dismissedThisCycle = false;
          }
          if (!_isBusy && !_dismissedThisCycle) {
            // Skip re-verification if no face enrollment exists yet
            try {
              final repository = context.read<FaceEmbeddingRepository>();
              final enrollmentCount = await repository.count();
              if (enrollmentCount == 0) return;
            } catch (_) {
              return;
            }
            if (!mounted) return;
            _lastShownIteration = state.iteration;
            _showReVerificationSheet(context);
          }
        } else if (state is ReVerificationIdleState) {
          _dismissedThisCycle = false;
          _lastShownIteration = 0;
        } else if (state is ReVerificationVerifiedState) {
          // Logging for re-verification is handled in _showReVerificationSheet
          // when using the external dialog flow (which returns face image bytes).
          // Only log here for inline verification (faceScanned/pinUsed events).
          if (!_lastVerifiedViaDialog) {
            final logger = _createLogger(context);
            if (logger == null) {
              debugPrint('ReVerificationListener: logger is null, skipping verified log');
            } else if (state.confidence > 0) {
              await logger.logFaceSuccess(
                eventType: FaceAuthEventType.reVerify,
                confidence: state.confidence,
                responseTime: state.elapsedMs,
              );
            } else {
              await logger.logPinFallback(
                eventType: FaceAuthEventType.reVerify,
              );
            }
          }
          _lastVerifiedViaDialog = false;
        } else if (state is ReVerificationMissedState) {
          final logger = _createLogger(context);
          if (logger == null) {
            debugPrint('ReVerificationListener: logger is null, skipping missed log');
          }
          await logger?.logMissed(popupTime: state.popupTime);
        }
      },
      child: widget.child,
    );
  }

  void _showReVerificationSheet(BuildContext context) {
    _isBusy = true;
    final repository = context.read<FaceEmbeddingRepository>();
    final faceModelService = context.read<FaceModelService>();
    final reVerificationBloc = context.read<ReVerificationBloc>();

    showModalBottomSheet<bool>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: reVerificationBloc,
        child: _ReVerificationSheet(),
      ),
    ).then((openDialog) async {
      if (openDialog == true && mounted) {
        // Don't pause the timer — let it keep running so the appbar
        // banner stays visible. If it expires while the dialog is open,
        // the next iteration will start automatically.
        final result = await showFaceVerificationDialog(
          context,
          repository: repository,
          faceModelService: faceModelService,
        );

        _isBusy = false;

        if (result.passed) {
          _lastVerifiedViaDialog = true;
          if (mounted) {
            await logAndCompleteReVerification(context, result);
          }
        } else {
          // User closed dialog without verifying — timer is still
          // running, banner keeps showing. Suppress the sheet for
          // this iteration so it doesn't immediately re-appear.
          _dismissedThisCycle = true;
        }
      } else {
        _isBusy = false;
        _dismissedThisCycle = true; // user tapped "Remind me later"
      }
    });
  }
}

class _ReVerificationSheet extends StatefulWidget {
  const _ReVerificationSheet();

  @override
  State<_ReVerificationSheet> createState() => _ReVerificationSheetState();
}

class _ReVerificationSheetState extends State<_ReVerificationSheet> {
  bool _popped = false;

  void _pop([bool? result]) {
    if (!_popped && mounted) {
      _popped = true;
      Navigator.of(context).pop(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return BlocConsumer<ReVerificationBloc, ReVerificationState>(
      listener: (context, state) {
        // Auto-dismiss on idle/verified/missed (e.g. timeout while sheet is open)
        if (state is ReVerificationIdleState ||
            state is ReVerificationVerifiedState ||
            state is ReVerificationMissedState) {
          _pop(false);
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
          decoration: BoxDecoration(
            color: colorTheme.paper.primary,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: colorTheme.generic.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Icon
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorTheme.primary.primary1.withOpacity(0.1),
                ),
                child: Icon(
                  Icons.face_rounded,
                  size: 32,
                  color: colorTheme.primary.primary1,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'Scan your face to Proceed',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colorTheme.text.primary,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Please verify your identity to continue working',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: colorTheme.text.secondary,
                ),
              ),

              const SizedBox(height: 20),

              // Countdown
              if (state is ReVerificationPromptedState) ...[
                _CountdownRing(
                  remainingSeconds: state.remainingSeconds,
                  totalSeconds: context.read<ReVerificationBloc>().config.countdownDuration.inSeconds,
                ),
                const SizedBox(height: 8),
                Text(
                  'Attempt ${state.iteration} of ${state.maxIterations}',
                  style: TextStyle(
                    fontSize: 13,
                    color: colorTheme.text.secondary,
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Verify button — pops sheet with `true` to signal "open dialog"
              DigitButton(
                label: 'Verify Now',
                onPressed: () => _pop(true),
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
                prefixIcon: Icons.face_rounded,
              ),

              const SizedBox(height: 12),

              // Dismiss — just close the sheet; countdown keeps running
              DigitButton(
                label: 'Remind me later',
                onPressed: () => _pop(false),
                type: DigitButtonType.tertiary,
                size: DigitButtonSize.medium,
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Circular countdown ring showing remaining time.
class _CountdownRing extends StatelessWidget {
  final int remainingSeconds;
  final int totalSeconds;

  const _CountdownRing({
    required this.remainingSeconds,
    required this.totalSeconds,
  });

  String _formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;
    final progress = remainingSeconds / totalSeconds;
    final isUrgent = remainingSeconds < 60;

    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 4,
              backgroundColor: colorTheme.generic.divider,
              valueColor: AlwaysStoppedAnimation<Color>(
                isUrgent
                    ? colorTheme.alert.error
                    : colorTheme.primary.primary1,
              ),
            ),
          ),
          Text(
            _formatTime(remainingSeconds),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isUrgent
                  ? colorTheme.alert.error
                  : colorTheme.text.primary,
            ),
          ),
        ],
      ),
    );
  }
}
