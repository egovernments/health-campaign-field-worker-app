import 'package:auto_route/auto_route.dart';
import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/face_auth/face_gate_bloc.dart';

/// PIN fallback page — shown when face verification fails after max attempts.
/// Allows user to enter their 4-digit PIN as an alternative.
@RoutePage()
class PinFallbackPage extends StatefulWidget {
  final VoidCallback onVerified;

  const PinFallbackPage({super.key, required this.onVerified});

  @override
  State<PinFallbackPage> createState() => _PinFallbackPageState();
}

class _PinFallbackPageState extends State<PinFallbackPage> {
  final _pinController = TextEditingController();
  String? _selectedIndividualId;
  List<FaceEnrollmentProfile> _profiles = [];
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadProfiles();
  }

  Future<void> _loadProfiles() async {
    final repo = context.read<FaceEmbeddingRepository>();
    final profiles = await repo.getAllProfiles();
    setState(() {
      _profiles = profiles;
      if (profiles.length == 1) {
        _selectedIndividualId = profiles.first.individualId;
      }
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  void _verifyPin() {
    if (_selectedIndividualId == null) {
      setState(() => _errorMessage = 'Please select a profile');
      return;
    }
    if (_pinController.text.length != 4) {
      setState(() => _errorMessage = 'PIN must be 4 digits');
      return;
    }

    context.read<FaceGateBloc>().add(
          FaceGateEvent.pinFallback(
            pin: _pinController.text,
            individualId: _selectedIndividualId!,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FaceGateBloc, FaceGateState>(
      listener: (context, state) {
        state.maybeWhen(
          passed: (_, method, __, ___) => widget.onVerified(),
          error: (message) {
            setState(() => _errorMessage = message);
            _pinController.clear();
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('PIN Verification')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_outline, size: 64, color: Colors.blue),
                const SizedBox(height: 24),
                const Text(
                  'Enter your fallback PIN',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // Profile selector (if multiple users)
                if (_profiles.length > 1)
                  DropdownButtonFormField<String>(
                    value: _selectedIndividualId,
                    decoration: const InputDecoration(
                      labelText: 'Select Profile',
                      border: OutlineInputBorder(),
                    ),
                    items: _profiles
                        .map((p) => DropdownMenuItem(
                              value: p.individualId,
                              child: Text(
                                p.isSystemUser
                                    ? 'System User'
                                    : 'Helper: ${p.individualId.substring(0, 8)}...',
                              ),
                            ))
                        .toList(),
                    onChanged: (v) =>
                        setState(() => _selectedIndividualId = v),
                  ),
                if (_profiles.length > 1) const SizedBox(height: 16),

                // PIN input
                TextField(
                  controller: _pinController,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 28, letterSpacing: 12),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: '****',
                    counterText: '',
                    errorText: _errorMessage,
                  ),
                  onChanged: (_) {
                    if (_errorMessage != null) {
                      setState(() => _errorMessage = null);
                    }
                  },
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: _verifyPin,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text('Verify PIN'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
