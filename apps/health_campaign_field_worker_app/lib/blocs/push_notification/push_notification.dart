import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repositories/remote/notification_token.dart';
import '../../notification_service.dart';

part 'push_notification.freezed.dart';

typedef PushNotificationEmitter = Emitter<PushNotificationState>;

class PushNotificationBloc
    extends Bloc<PushNotificationEvent, PushNotificationState> {
  StreamSubscription<String>? _tokenRefreshSubscription;
  final NotificationTokenRepository notificationTokenRepository;

  String? _currentUserId;
  String? _lastApiEndPoint;
  List<String>? _lastFacilityIds;

  PushNotificationBloc({
    required this.notificationTokenRepository,
  }) : super(const PushNotificationState.initial()) {
    on(_onInitialize);
    on(_onLogin);
    on(_onTokenRefreshed);
    on(_onRegisterToken);
    on(_onNotificationReceived);
  }

  FutureOr<void> _onInitialize(
    PushNotificationInitializeEvent event,
    PushNotificationEmitter emit,
  ) async {
    try {
      final notificationService = NotificationService();
      await notificationService.init();
      final fcmToken = await notificationService.initializeFCM();

      notificationService.onNotificationTap = (data) {
        if (!isClosed) {
          add(PushNotificationEvent.notificationReceived(data: data));
        }
      };

      _tokenRefreshSubscription =
          FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
        if (!isClosed) {
          add(PushNotificationEvent.tokenRefreshed(token: newToken));
        }
      });

      emit(PushNotificationState.initialized(fcmToken: fcmToken));
    } catch (e, stackTrace) {
      debugPrint('PushNotificationBloc initialization error: $e');
      debugPrint('PushNotificationBloc stackTrace: $stackTrace');
      emit(PushNotificationState.error(error: e.toString()));
    }
  }

  FutureOr<void> _onLogin(
    PushNotificationLoginEvent event,
    PushNotificationEmitter emit,
  ) async {
    try {
      _currentUserId = event.userId;
      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null && _currentUserId != null) {
        await NotificationService.storeTokenForUser(
          _currentUserId!,
          fcmToken,
        );
      }
      emit(PushNotificationState.initialized(fcmToken: fcmToken));
    } catch (e) {
      debugPrint('PushNotificationBloc login token error: $e');
    }
  }

  FutureOr<void> _onTokenRefreshed(
    PushNotificationTokenRefreshedEvent event,
    PushNotificationEmitter emit,
  ) async {
    if (_currentUserId != null) {
      await NotificationService.storeTokenForUser(
        _currentUserId!,
        event.token,
      );
    }
    emit(PushNotificationState.initialized(fcmToken: event.token));

    // Re-register with backend if we have facility info
    if (_lastApiEndPoint != null && _lastFacilityIds != null) {
      add(PushNotificationEvent.registerToken(
        apiEndPoint: _lastApiEndPoint!,
        facilityIds: _lastFacilityIds!,
      ));
    }
  }

  FutureOr<void> _onRegisterToken(
    PushNotificationRegisterTokenEvent event,
    PushNotificationEmitter emit,
  ) async {
    _lastApiEndPoint = event.apiEndPoint;
    _lastFacilityIds = event.facilityIds;

    final currentState = state;
    final token = currentState is PushNotificationInitializedState
        ? currentState.fcmToken
        : null;

    if (token == null || token.isEmpty) return;

    await notificationTokenRepository.registerToken(
      apiEndPoint: event.apiEndPoint,
      token: token,
      facilityIds: event.facilityIds,
    );
  }

  FutureOr<void> _onNotificationReceived(
    PushNotificationNotificationReceivedEvent event,
    PushNotificationEmitter emit,
  ) async {
    emit(PushNotificationState.notificationTapped(data: event.data));
    final token = _currentUserId != null
        ? await NotificationService.getTokenForUser(_currentUserId!)
        : null;
    emit(PushNotificationState.initialized(fcmToken: token));
  }

  @override
  Future<void> close() {
    _tokenRefreshSubscription?.cancel();
    return super.close();
  }
}

@freezed
class PushNotificationEvent with _$PushNotificationEvent {
  const factory PushNotificationEvent.initialize() =
      PushNotificationInitializeEvent;

  const factory PushNotificationEvent.login({
    required String userId,
  }) = PushNotificationLoginEvent;

  const factory PushNotificationEvent.tokenRefreshed({
    required String token,
  }) = PushNotificationTokenRefreshedEvent;

  const factory PushNotificationEvent.registerToken({
    required String apiEndPoint,
    required List<String> facilityIds,
  }) = PushNotificationRegisterTokenEvent;

  const factory PushNotificationEvent.notificationReceived({
    required Map<String, dynamic> data,
  }) = PushNotificationNotificationReceivedEvent;
}

@freezed
class PushNotificationState with _$PushNotificationState {
  const factory PushNotificationState.initial() = PushNotificationInitialState;

  const factory PushNotificationState.initialized({
    String? fcmToken,
  }) = PushNotificationInitializedState;

  const factory PushNotificationState.notificationTapped({
    required Map<String, dynamic> data,
  }) = PushNotificationTappedState;

  const factory PushNotificationState.error({
    required String error,
  }) = PushNotificationErrorState;
}
