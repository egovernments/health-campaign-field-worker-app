// GENERATED using mason_cli
import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_data.freezed.dart';

typedef DeviceConnectionEmitter = Emitter<DeviceConnectionState>;

class DeviceConnectionBloc
    extends Bloc<DeviceConnectionEvent, DeviceConnectionState> {
  final NearbyService nearbyService;
  final Device connectedDevice;

  DeviceConnectionBloc({
    required this.nearbyService,
    required this.connectedDevice,
  }) : super(const DeviceConnectionInitial()) {
    on(_handleSendEntities);
  }

  FutureOr<void> _handleSendEntities(
    SendEntitiesEvent event,
    DeviceConnectionEmitter emit,
  ) async {
    try {
      emit(const DeviceConnectionState.sending(progress: 0));

      for (var entityName in event.entities.keys) {
        List<dynamic> entityData = event.entities[entityName]!;
        int totalSize = entityData.length;
        int offset = 0;

        while (offset < totalSize) {
          // Calculate the chunk
          const int chunkSize = 100;
          int end =
              (offset + chunkSize < totalSize) ? offset + chunkSize : totalSize;
          List<dynamic> chunk = entityData.sublist(offset, end);

          // Send the chunk
          await nearbyService.sendMessage(
            connectedDevice.deviceId,
            jsonEncode({
              "entityType": entityName,
              "message": chunk,
              "offset": offset + chunk.length,
              "totalData": totalSize,
            }),
          );

          // Update progress
          final progress = (offset + chunk.length) / totalSize;
          emit(DeviceConnectionState.sending(progress: progress));
          offset = end;
        }
      }

      // Notify completion
      emit(const DeviceConnectionState.completed());
    } catch (e) {
      emit(DeviceConnectionState.failed(error: e.toString()));
    }
  }
}

@freezed
class DeviceConnectionEvent with _$DeviceConnectionEvent {
  const factory DeviceConnectionEvent.sendEntities(
    Map<String, dynamic> entities,
  ) = SendEntitiesEvent;
}

@freezed
class DeviceConnectionState with _$DeviceConnectionState {
  const factory DeviceConnectionState.initial() = DeviceConnectionInitial;

  const factory DeviceConnectionState.loading() = DeviceConnectionLoading;

  const factory DeviceConnectionState.sending({required double progress}) =
      DeviceConnectionSending;

  const factory DeviceConnectionState.completed() = DeviceConnectionCompleted;

  const factory DeviceConnectionState.failed({required String error}) =
      DeviceConnectionFailed;
}
