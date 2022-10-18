import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

typedef LocationStateEmitter = Emitter<LocationState>;

/// LocationBLoC
///
/// Follow setup instructions for appropriate platform
/// Android - <https://docs.page/Lyokone/flutterlocation/installation/android>
/// iOS - <https://docs.page/Lyokone/flutterlocation/installation/ios>
/// macOS - <https://docs.page/Lyokone/flutterlocation/installation/macos>
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationState()) {
    on<LoadLocationEvent>(_handleLoadLocation);
  }

  FutureOr<void> _handleLoadLocation(
    LoadLocationEvent event,
    LocationStateEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final location = await getLocation();
      emit(state.copyWith(
        latitude: location.latitude,
        longitude: location.longitude,
        accuracy: location.accuracy,
      ));
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.load() = LoadLocationEvent;
}

@freezed
class LocationState with _$LocationState {
  const LocationState._();

  const factory LocationState({
    double? latitude,
    double? longitude,
    double? accuracy,
    @Default(false) bool loading,
  }) = _LocationState;

  String? get latLngString {
    if (latitude == null || longitude == null) return null;
    return [latitude, longitude].join(', ');
  }
}
