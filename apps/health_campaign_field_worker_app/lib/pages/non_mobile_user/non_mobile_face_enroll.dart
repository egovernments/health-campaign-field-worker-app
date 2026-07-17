import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../blocs/localization/app_localization.dart';
import '../../blocs/project/project.dart';
import '../../data/remote_client.dart';
import '../../services/face_auth_event_logger.dart';
import '../../services/worker_registry_service.dart';
import '../../utils/environment_config.dart';
import '../../utils/extensions/extensions.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/face_auth/reverification_popup.dart';

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
  bool _fetchingLocation = false;

  @override
  void initState() {
    super.initState();
    faceEnrollmentActiveNotifier.value = true;
  }

  /// Fetches device location with permission handling and a 15s timeout —
  /// mirrors FaceGatePage._fetchLocation so co-worker enrollments capture
  /// the same coordinates the distributor flow does.
  static Future<LocationData?> _fetchLocation() async {
    try {
      final loc = Location();
      if (!await loc.serviceEnabled()) {
        if (!await loc.requestService()) return null;
      }
      var perm = await loc.hasPermission();
      if (perm == PermissionStatus.denied) {
        perm = await loc.requestPermission();
      }
      if (perm != PermissionStatus.granted &&
          perm != PermissionStatus.grantedLimited) {
        return null;
      }
      await loc.changeSettings(
        accuracy: LocationAccuracy.balanced,
        distanceFilter: 0,
      );
      return await loc.getLocation().timeout(const Duration(seconds: 4));
    } catch (e) {
      debugPrint('NonMobileFaceEnrollPage: location fetch failed: $e');
      return null;
    }
  }

  @override
  void dispose() {
    faceEnrollmentActiveNotifier.value = false;
    super.dispose();
  }

  /// Returns true if the worker registry update succeeded, false if it
  /// failed (offline / network error). On failure the individualId is left
  /// in the pending-sync queue so AuthenticatedPage retries when online.
  Future<bool> _updateWorkerRegistry(String individualId) async {
    final repository = context.read<FaceEmbeddingRepository>();
    final service = WorkerRegistryService(
      dio: DioClient().dio,
      tenantId: envConfig.variables.tenantId,
    );
    // Queue this individual id as pending BEFORE the call so an offline /
    // network failure leaves a retryable marker. AuthenticatedPage's
    // _retryPendingWorkerRegistrySync drains the list on connectivity-restore.
    await _markPendingRegistrySync(individualId);
    final ok = await service.updateWorkerWithFaceEnrollment(
      individualId: individualId,
      repository: repository,
    );
    if (ok) {
      await _clearPendingRegistrySync(individualId);
      debugPrint(
          'NonMobileFaceEnrollPage: worker registry updated for $individualId');
    } else {
      debugPrint(
          'NonMobileFaceEnrollPage: worker registry update failed offline — left in queue for retry');
    }
    return ok;
  }

  /// Append [individualId] to the persisted list of pending registry-sync IDs
  /// so offline enrollments survive app restarts. De-duplicates the list.
  Future<void> _markPendingRegistrySync(String individualId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final list = prefs.getStringList('face_registry_sync_pending_ids') ?? [];
      if (!list.contains(individualId)) {
        list.add(individualId);
        await prefs.setStringList('face_registry_sync_pending_ids', list);
      }
    } catch (e) {
      debugPrint(
          'NonMobileFaceEnrollPage: _markPendingRegistrySync failed: $e');
    }
  }

  Future<void> _clearPendingRegistrySync(String individualId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final list = prefs.getStringList('face_registry_sync_pending_ids') ?? [];
      list.remove(individualId);
      await prefs.setStringList('face_registry_sync_pending_ids', list);
    } catch (e) {
      debugPrint(
          'NonMobileFaceEnrollPage: _clearPendingRegistrySync failed: $e');
    }
  }

  Future<void> _logEnrollment({LocationData? location}) async {
    try {
      final projectId =
          context.read<ProjectBloc>().state.selectedProject?.id ?? '';
      final logger = FaceAuthEventLogger(
        repository: context.read<
            LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>(),
        userId: widget.individualId,
        userUuid: context.loggedInUserUuid,
        projectId: projectId,
        boundaryCode: context.boundaryOrNull?.code ?? '',
        subjectName: widget.individualName,
      );
      await logger.logEnrollment(
        success: true,
        latitude: location?.latitude ?? 0.0,
        longitude: location?.longitude ?? 0.0,
        locationAccuracy: location?.accuracy ?? 0.0,
      );
    } catch (e) {
      debugPrint('NonMobileFaceEnrollPage: failed to log enrollment: $e');
    }
  }

  Future<void> _onResult(bool success, String? pin) async {
    debugPrint('NonMobileFaceEnrollPage._onResult: success=$success, pin=$pin, mounted=$mounted, isDismissing=$_isDismissing');
    if (!success || !mounted || _isDismissing) return;
    _isDismissing = true;
    // Show the same "Fetching location…" loading screen as the distributor
    // enrollment flow (FaceGatePage), so co-worker enrollment captures GPS
    // before logging and navigating away.
    if (mounted) setState(() => _fetchingLocation = true);
    final location = await _fetchLocation();
    if (!mounted) return;
    final registryUpdated = await _updateWorkerRegistry(widget.individualId);
    await _logEnrollment(location: location);

    if (!registryUpdated && mounted) {
      // Block before navigating away so the field worker explicitly
      // acknowledges the offline-enrollment state. They need to know the
      // server hasn't confirmed and the registry will sync later.
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          title: Row(
            children: [
              const Icon(Icons.wifi_off, color: Colors.orange),
              const SizedBox(width: 8),
              Expanded(
                  child: Text(AppLocalizations.of(context)
                      .translate(i18.faceAuth.internetRequired))),
            ],
          ),
          content: Text(
            'Face enrolled locally for ${widget.individualName}, but the '
            'server could not be reached.\n\n'
            'The enrollment is saved on this device and will sync to the '
            'worker registry automatically when internet returns.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      if (!mounted) return;
    }

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
        title: Text(AppLocalizations.of(context)
            .translate(i18.faceAuth.enrollmentSuccessful)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                '${AppLocalizations.of(context).translate(i18.faceAuth.enrolledFor)} ${widget.individualName}.'),
            const SizedBox(height: 16),
            const Text(
              'Backup PIN:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              pin,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 8,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)
                  .translate(i18.faceAuth.enrollmentPinNote),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // close dialog
              if (mounted) context.router.maybePop(true);
            },
            child: Text(
                AppLocalizations.of(context).translate(i18.faceAuth.doneButton)),
          ),
        ],
      ),
    );
  }

  void _showSuccessAndPop() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            '${AppLocalizations.of(context).translate(i18.faceAuth.enrolledFor)} ${widget.individualName}'),
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

    if (_fetchingLocation) {
      return Theme(data: orangeTheme, child: const _LocationFetchingView());
    }

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
            if (mounted) Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

/// Loading screen shown while GPS is being fetched after a successful
/// co-worker enrollment. Matches the look of FaceGatePage's
/// _LocationFetchingView used in the distributor enrollment flow.
class _LocationFetchingView extends StatelessWidget {
  const _LocationFetchingView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return Scaffold(
      backgroundColor: colorTheme.paper.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: colorTheme.primary.primary1,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'Fetching location…',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colorTheme.text.primary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(context)
                    .translate(i18.faceAuth.capturingGps),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: colorTheme.text.secondary,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
