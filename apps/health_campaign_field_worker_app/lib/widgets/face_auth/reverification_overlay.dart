import 'dart:async';
import 'dart:typed_data';

import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/face_auth/reverification_bloc.dart';

/// Modal overlay for random re-verification.
/// Cannot be back-pressed away. Shows camera + countdown timer.
class ReVerificationOverlay extends StatefulWidget {
  const ReVerificationOverlay({super.key});

  @override
  State<ReVerificationOverlay> createState() => _ReVerificationOverlayState();
}

class _ReVerificationOverlayState extends State<ReVerificationOverlay> {
  int _remainingSeconds = 120;
  Timer? _countdownTimer;
  bool _showPinInput = false;
  final _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Material(
        color: Colors.black87,
        child: SafeArea(
          child: BlocConsumer<ReVerificationBloc, ReVerificationState>(
            listener: (context, state) {
              state.maybeWhen(
                verified: (confidence, elapsed) {
                  _countdownTimer?.cancel();
                },
                pinFallback: () {
                  setState(() => _showPinInput = true);
                },
                idle: () {
                  // Overlay will be removed by parent
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                verified: (confidence, elapsed) => _SuccessView(
                  confidence: confidence,
                ),
                orElse: () => _showPinInput
                    ? _PinInputView(
                        pinController: _pinController,
                        onSubmit: (pin) {
                          // TODO: Get individualId from current session
                          context.read<ReVerificationBloc>().add(
                                ReVerificationEvent.pinUsed(
                                  pin: pin,
                                  individualId: '',
                                ),
                              );
                        },
                      )
                    : _ScanView(
                        remainingSeconds: _remainingSeconds,
                        onCaptured: (embedding, quality, {faceImageBytes}) {
                          context.read<ReVerificationBloc>().add(
                                ReVerificationEvent.faceScanned(
                                  embedding: embedding,
                                ),
                              );
                        },
                        onUsePinInstead: () {
                          setState(() => _showPinInput = true);
                        },
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ScanView extends StatelessWidget {
  final int remainingSeconds;
  final void Function(List<double>, double, {Uint8List? faceImageBytes}) onCaptured;
  final VoidCallback onUsePinInstead;

  const _ScanView({
    required this.remainingSeconds,
    required this.onCaptured,
    required this.onUsePinInstead,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header with countdown
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Scan your face to Proceed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: remainingSeconds < 30 ? Colors.red : Colors.orange,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '${remainingSeconds ~/ 60}:${(remainingSeconds % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Camera feed
        Expanded(
          child: FaceCaptureView(
            faceModelService: context.read<FaceModelService>(),
            onFaceCaptured: (embedding, quality, {faceImageBytes}) {
              onCaptured(embedding, quality, faceImageBytes: faceImageBytes);
            },
            guidanceText: 'Verify your identity to continue',
          ),
        ),
        // PIN fallback button
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextButton(
            onPressed: onUsePinInstead,
            child: const Text(
              'Use PIN instead',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
      ],
    );
  }
}

class _PinInputView extends StatelessWidget {
  final TextEditingController pinController;
  final void Function(String) onSubmit;

  const _PinInputView({
    required this.pinController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock, size: 48, color: Colors.white),
            const SizedBox(height: 16),
            const Text(
              'Enter your PIN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: pinController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              obscureText: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                letterSpacing: 12,
              ),
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: '****',
                hintStyle: TextStyle(color: Colors.white30),
                counterText: '',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (pinController.text.length == 4) {
                  onSubmit(pinController.text);
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuccessView extends StatelessWidget {
  final double confidence;

  const _SuccessView({required this.confidence});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, size: 80, color: Colors.green),
          SizedBox(height: 16),
          Text(
            'Face Verified',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
