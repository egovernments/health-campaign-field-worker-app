// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../utils/root_detection_utils.dart';
// import '../../app_security.dart';
// import '../../utils/environment_config.dart';

// part 'root_detection.freezed.dart';

// typedef RootDetectionEmitter = Emitter<RootDetectionState>;

// class RootDetectionBloc extends Bloc<RootDetectionEvent, RootDetectionState> {
//   Timer? _periodicTimer;
//   final RootDetectionUtils _rootDetectionUtils = RootDetectionUtils.instance;

//   RootDetectionBloc()
//       : super(const RootDetectionState(
//           isRooted: null,
//           isPeriodicCheckRunning: false,
//         )) {
//     on<RootDetectionStartPeriodicChecksEvent>(_handleStartPeriodicChecks);
//     on<RootDetectionStopPeriodicChecksEvent>(_handleStopPeriodicChecks);
//     on<RootDetectionPerformCheckEvent>(_handlePerformCheck);
//   }

//   FutureOr<void> _handleStartPeriodicChecks(
//     RootDetectionStartPeriodicChecksEvent event,
//     RootDetectionEmitter emit,
//   ) async {
//     // Don't start if already running
//     if (state.isPeriodicCheckRunning) {
//       debugPrint('Periodic security checks already running');
//       return;
//     }

//     // Only run in production
//     if (kDebugMode && envConfig.variables.envType != EnvType.prod) {
//       debugPrint('Skipping periodic security checks in debug mode');
//       return;
//     }

//     debugPrint(
//         'Starting periodic security checks with interval: ${event.interval}');
//     emit(state.copyWith(isPeriodicCheckRunning: true));

//     // Perform initial check immediately
//     add(const RootDetectionEvent.performCheck());

//     // Setup periodic timer
//     _periodicTimer?.cancel();
//     _periodicTimer = Timer.periodic(event.interval, (timer) {
//       if (!isClosed) {
//         add(const RootDetectionEvent.performCheck());
//       } else {
//         timer.cancel();
//       }
//     });
//   }

//   FutureOr<void> _handleStopPeriodicChecks(
//     RootDetectionStopPeriodicChecksEvent event,
//     RootDetectionEmitter emit,
//   ) async {
//     debugPrint('Stopping periodic security checks');
//     _periodicTimer?.cancel();
//     _periodicTimer = null;
//     emit(state.copyWith(isPeriodicCheckRunning: false));
//   }

//   FutureOr<void> _handlePerformCheck(
//     RootDetectionPerformCheckEvent event,
//     RootDetectionEmitter emit,
//   ) async {
//     try {
//       // Perform comprehensive security checks
//       final result = await _rootDetectionUtils.performSecurityChecks();

//       debugPrint(
//           'Security check completed: Passed=${result.isPassed}, Threats=${result.threats}');

//       // Update state with results
//       emit(state.copyWith(
//         lastSecurityCheck: result,
//         isRooted: result.threats.contains(SecurityThreatType.root),
//         isSecurityCompromised: !result.isPassed,
//       ));

//       // Handle security threats in production
//       if (!result.isPassed && envConfig.variables.envType == EnvType.prod) {
//         debugPrint('Security threats detected: ${result.threats.join(", ")}');

//         // Report to server
//         await _rootDetectionUtils.reportSecurityStatusToServer(result);

//         // You can emit additional events or trigger actions here
//         // For example, show a dialog, restrict features, etc.
//       }
//     } catch (e) {
//       debugPrint('Security check failed with error: $e');
//       emit(state.copyWith(
//         isSecurityCompromised: true,
//       ));
//     }
//   }

//   @override
//   Future<void> close() {
//     _periodicTimer?.cancel();
//     return super.close();
//   }
// }

// @freezed
// class RootDetectionEvent with _$RootDetectionEvent {
//   const factory RootDetectionEvent.startPeriodicChecks({
//     @Default(Duration(minutes: 5)) Duration interval,
//   }) = RootDetectionStartPeriodicChecksEvent;

//   const factory RootDetectionEvent.stopPeriodicChecks() =
//       RootDetectionStopPeriodicChecksEvent;

//   const factory RootDetectionEvent.performCheck() =
//       RootDetectionPerformCheckEvent;
// }

// @freezed
// class RootDetectionState with _$RootDetectionState {
//   const factory RootDetectionState({
//     bool? isRooted,
//     @Default(false) bool isPeriodicCheckRunning,
//     SecurityCheckResult? lastSecurityCheck,
//     @Default(false) bool isSecurityCompromised,
//   }) = _RootDetectionState;
// }
