import 'package:auto_route/auto_route.dart';
import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote_client.dart';
import '../../services/worker_registry_service.dart';
import '../../utils/environment_config.dart';
import '../../utils/extensions/extensions.dart';

/// Full-screen face enrollment page for non-mobile users (beneficiaries).
/// The field worker captures the beneficiary's face and a PIN is assigned.
@RoutePage()
class NonMobileFaceEnrollPage extends StatefulWidget {
  final String individualId;
  final String individualName;

  const NonMobileFaceEnrollPage({
    super.key,
    required this.individualId,
    required this.individualName,
  });

  @override
  State<NonMobileFaceEnrollPage> createState() =>
      _NonMobileFaceEnrollPageState();
}

class _NonMobileFaceEnrollPageState extends State<NonMobileFaceEnrollPage> {
  bool _isDismissing = false;

  Future<void> _updateWorkerRegistry(String individualId) async {
    final repository = context.read<FaceEmbeddingRepository>();
    final service = WorkerRegistryService(
      dio: DioClient().dio,
      tenantId: envConfig.variables.tenantId,
    );
    await service.updateWorkerWithFaceEnrollment(
      individualId: individualId,
      repository: repository,
    );
  }

  Future<void> _onResult(bool success, String? pin) async {
    debugPrint('NonMobileFaceEnrollPage._onResult: success=$success, pin=$pin, mounted=$mounted, isDismissing=$_isDismissing');
    if (!success || !mounted || _isDismissing) return;
    _isDismissing = true;
    debugPrint('NonMobileFaceEnrollPage: calling _updateWorkerRegistry for ${widget.individualId}');
    await _updateWorkerRegistry(widget.individualId);

    if (pin != null && pin.isNotEmpty) {
      _showPinDialog(pin);
    } else {
      _showSuccessAndPop();
    }
  }

  void _showPinDialog(String pin) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('Enrollment Successful'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Face enrolled for ${widget.individualName}.'),
            const SizedBox(height: 16),
            const Text(
              'Backup PIN:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              pin,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 8,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Please note this PIN. It can be used as a backup for face verification.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // close dialog
              if (mounted) context.router.maybePop(true);
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _showSuccessAndPop() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Face enrolled for ${widget.individualName}'),
        backgroundColor: Colors.green,
      ),
    );
    context.router.maybePop(true);
  }

  @override
  Widget build(BuildContext context) {
    final faceModelService = context.read<FaceModelService>();
    final repository = context.read<FaceEmbeddingRepository>();
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    final orangeTheme = theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: colorTheme.primary.primary1,
        onPrimary: colorTheme.paper.primary,
      ),
    );

    return Theme(
      data: orangeTheme,
      child: BlocProvider(
        create: (_) => FaceEnrollmentBloc(repository: repository),
        child: FaceEnrollmentView(
          faceModelService: faceModelService,
          individualId: widget.individualId,
          isSystemUser: false,
          enrolledBy: context.loggedInUserUuid,
          onResult: _onResult,
          onCancel: () {
            if (mounted) context.router.maybePop(false);
          },
        ),
      ),
    );
  }
}
