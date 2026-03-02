import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../notification_service.dart';

part 'push_notification.freezed.dart';

typedef PushNotificationEmitter = Emitter<PushNotificationState>;

class PushNotificationBloc
    extends Bloc<PushNotificationEvent, PushNotificationState> {
  StreamSubscription<String>? _tokenRefreshSubscription;

  PushNotificationBloc() : super(const PushNotificationState.initial()) {
    on(_onInitialize);
    on(_onTokenRefreshed);
    on(_onNotificationReceived);
  }

  FutureOr<void> _onInitialize(
    PushNotificationInitializeEvent event,
    PushNotificationEmitter emit,
  ) async {
    try {
      final notificationService = NotificationService();

      // FCM is already initialized in main.dart — just get the stored token
      final fcmToken = await NotificationService.getStoredFcmToken();

      // Set up the notification tap callback to emit bloc events
      notificationService.onNotificationTap = (data) {
        if (!isClosed) {
          add(PushNotificationEvent.notificationReceived(data: data));
        }
      };

      // Listen for token refresh events
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

  FutureOr<void> _onTokenRefreshed(
    PushNotificationTokenRefreshedEvent event,
    PushNotificationEmitter emit,
  ) async {
    emit(PushNotificationState.initialized(fcmToken: event.token));
  }

  FutureOr<void> _onNotificationReceived(
    PushNotificationNotificationReceivedEvent event,
    PushNotificationEmitter emit,
  ) async {
    emit(PushNotificationState.notificationTapped(data: event.data));
    // Return to initialized state so future taps can also be handled
    final token = await NotificationService.getStoredFcmToken();
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

  const factory PushNotificationEvent.tokenRefreshed({
    required String token,
  }) = PushNotificationTokenRefreshedEvent;

  const factory PushNotificationEvent.notificationReceived({
    required Map<String, dynamic> data,
  }) = PushNotificationNotificationReceivedEvent;
}

@freezed
class PushNotificationState with _$PushNotificationState {
  const factory PushNotificationState.initial() =
      PushNotificationInitialState;

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
