// GENERATED using mason_cli
import 'dart:async';
import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:disk_space_update/disk_space_update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sync_service/data/repositories/sync/remote_type.dart';

import '../../data/sync_service_mapper.dart';
import '../../models/downsync/downsync.dart';
import '../../models/entities/peer_to_peer/message_types.dart';
import '../../models/entities/peer_to_peer/peer_to_peer_message.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/least_level_boundary_singleton.dart';
import '../../utils/utils.dart';

part 'peer_to_peer.freezed.dart';

typedef PeerToPeerEmitter = Emitter<PeerToPeerState>;

class PeerToPeerBloc extends Bloc<PeerToPeerEvent, PeerToPeerState> {
  final LocalRepository<IndividualModel, IndividualSearchModel>
      individualLocalRepository;
  final LocalRepository<DownsyncModel, DownsyncSearchModel>
      downSyncLocalRepository;

  List<dynamic> receivedData = [];
  int receivedBytes = 0;
  int totalCount = 0;
  String entityType = '';
  late Device connectedDevice;
  late String? selectedBoundaryCode;
  final Set<String> receivedBoundaries = {};
  double? receivedProgress;

  PeerToPeerBloc({
    required this.individualLocalRepository,
    required this.downSyncLocalRepository,
  }) : super(const PeerToPeerInitial()) {
    on(_handleSendEntities);
    on(_handleReceiveEntities);
  }

  FutureOr<void> _handleSendEntities(
    DataTransferEvent event,
    PeerToPeerEmitter emit,
  ) async {
    try {
      emit(const PeerToPeerState.transferInProgress(
          progress: 0, offset: 0, totalCount: 0));

      final file = await getDownSyncFilePath();

      if (await file.exists()) {
        final fileStream = file.openRead();
        final jsonStream =
            fileStream.transform(utf8.decoder).transform(json.decoder);

        await for (final offsets in jsonStream) {
          // Ensure the root is a Map<String, dynamic>
          if (offsets is! Map<String, dynamic>) {
            emit(PeerToPeerState.failedToTransfer(
                error: i18.dataShare.invalidFileError));
            return;
          }

          final castedOffsets = offsets;

          for (var offset in castedOffsets.entries) {
            int offsetValue = int.parse(offset.key);
            Map<String, dynamic> offsetData = offset.value;

            int totalCount = offsetData['totalCount'] ?? 0;
            List<dynamic> boundaries = offsetData['boundaries'] ?? [];

            var entityData;
            String? selectedBoundaryCode, selectedBoundaryName;

            for (var boundary in boundaries) {
              selectedBoundaryCode = boundary['boundaryCode'];
              selectedBoundaryName = boundary['boundaryName'];

              // This matches your original entityData format (a list)
              entityData = [boundary['response']];

              for (var device in event.connectedDevice) {
                for (var entity in entityData) {
                  var entityResponse = entity;

                  await event.nearbyService.sendMessage(
                    device.deviceId,
                    PeerToPeerMessageModel(
                            messageType: MessageTypes.chunk.toValue(),
                            selectedBoundaryCode: selectedBoundaryCode,
                            message: entityResponse,
                            offset: offsetValue,
                            totalCount: totalCount)
                        .toJson(),
                  );
                }

                // Wait for confirmation before proceeding
                await waitForConfirmation(
                  event.nearbyService,
                  confirmationType: ConfirmationTypes.chunk.toValue(),
                  offset: offsetValue,
                );

                emit(PeerToPeerState.transferInProgress(
                    progress: offsetValue / totalCount,
                    offset: offsetValue,
                    totalCount: totalCount));
              }
            }
          }

          // Send final acknowledgment to all devices
          for (var device in event.connectedDevice) {
            await event.nearbyService.sendMessage(
              device.deviceId,
              PeerToPeerMessageModel(
                messageType: MessageTypes.confirmation.toValue(),
                message: "All entities have been sent successfully.",
                confirmationType: ConfirmationTypes.finalTransfer.toValue(),
                status: MessageStatus.completed.toValue(),
              ).toJson(),
            );
          }
          emit(PeerToPeerState.transferInProgress(
              progress: 100, offset: 0, totalCount: totalCount));

          // Wait for receiver's overall acknowledgment
          await waitForConfirmation(
            event.nearbyService,
            confirmationType: ConfirmationTypes.finalAcknowledgment.toValue(),
          );

          emit(const PeerToPeerState.completedDataTransfer());
        }
      } else {
        emit(PeerToPeerState.failedToTransfer(
            error: i18.dataShare.fileNotFoundError));
        return;
      }
    } catch (e) {
      emit(PeerToPeerState.failedToTransfer(error: e.toString()));
    }
  }

  Future<void> _handleReceiveEntities(
    DataReceiverEvent event,
    PeerToPeerEmitter emit,
  ) async {
    try {
      PeerToPeerMessageModel messageModel =
          PeerToPeerMessageModelMapper.fromJson(event.data["message"]);
      if (messageModel.messageType == MessageTypes.chunk.toValue()) {
        int? offset = messageModel.offset;
        int? totalCount = messageModel.totalCount;
        selectedBoundaryCode = messageModel.selectedBoundaryCode;
        final compressedMessage = messageModel.message;

        // Check boundary match
        final isValidBoundary = LeastLevelBoundarySingleton()
            .boundary!
            .contains(selectedBoundaryCode);

        if (isValidBoundary) {
          final entityList =
              DataMapEncryptor.decrypt(compressedMessage).entries;

          for (var entity in entityList) {
            entityType = entity.key;

            double? diskSpace = 0;
            // [TODO: Move the function DiskSpace.getFreeDiskSpace to utils
            diskSpace = await DiskSpace
                .getFreeDiskSpace; // Returns the device available space in MB
            // diskSpace in MB * 1024 comparison with serverTotalCount * 150KB * Number of entities * 2
            if ((diskSpace ?? 0) * 1024 < (totalCount ?? 0 * 150 * 2)) {
              emit(PeerToPeerState.failedToReceive(
                  error: i18.beneficiaryDetails.insufficientStorage));
            }

            if (entityType == 'DownsyncCriteria') {
              final existingDownSyncData = await downSyncLocalRepository.search(
                DownsyncSearchModel(locality: selectedBoundaryCode),
              );

              if (existingDownSyncData.isNotEmpty) {
                await downSyncLocalRepository
                    .update(DownsyncModelMapper.fromMap(entity.value));
              } else {
                await downSyncLocalRepository
                    .create(DownsyncModelMapper.fromMap(entity.value));
              }
            } else {
              final List<dynamic> entityResponse = entity.value ?? [];
              final entityList =
                  entityResponse.whereType<Map<String, dynamic>>().toList();

              final local = RepositoryType.getLocalForType(
                DataModels.getDataModelForEntityName(entityType),
                [
                  individualLocalRepository,
                ],
              );

              SyncServiceMapper()
                  .createDbRecords(local, entityList, entityType);
            }
          }

          // Add boundary to received list
          receivedBoundaries.add(selectedBoundaryCode!);
          // Update progress even if boundary was skipped
          receivedBytes = offset!;
          receivedProgress = receivedBytes / totalCount!;
        }

        emit(PeerToPeerState.receivingInProgress(
          progress: receivedProgress ?? 0,
          offset: offset ?? 0,
          totalCount: totalCount ?? 0,
          receivedBoundaries: receivedBoundaries,
        ));

        // Send acknowledgment regardless of whether it was processed
        await event.nearbyService.sendMessage(
          event.data["deviceId"],
          PeerToPeerMessageModel(
            messageType: MessageTypes.confirmation.toValue(),
            confirmationType: ConfirmationTypes.chunk.toValue(),
            status: MessageStatus.received.toValue(),
            progress: receivedProgress,
            offset: offset,
            message: isValidBoundary
                ? "Chunk received and saved successfully."
                : "Boundary mismatch – chunk skipped but acknowledged.",
          ).toJson(),
        );
      } else if (messageModel.messageType ==
              MessageTypes.confirmation.toValue() &&
          messageModel.confirmationType ==
              ConfirmationTypes.finalTransfer.toValue()) {
        if (receivedBoundaries.isNotEmpty) {
          for (var selectedBoundaryCode in receivedBoundaries) {
            final existingDownSyncData =
                await downSyncLocalRepository.search(DownsyncSearchModel(
              locality: selectedBoundaryCode,
            ));

            await downSyncLocalRepository.update(
              existingDownSyncData.first.copyWith(
                offset: 0,
                limit: 0,
                lastSyncedTime: DateTime.now().millisecondsSinceEpoch,
              ),
            );
          }
        }
        // Send overall transfer acknowledgment
        await event.nearbyService.sendMessage(
            event.data["deviceId"],
            PeerToPeerMessageModel(
              messageType: MessageTypes.confirmation.toValue(),
              message: "All entities received and processed successfully.",
              confirmationType: ConfirmationTypes.finalAcknowledgment.toValue(),
              status: MessageStatus.success.toValue(),
            ).toJson());
        emit(PeerToPeerState.receivingInProgress(
          progress: 100,
          offset: 0,
          totalCount: totalCount,
          receivedBoundaries: receivedBoundaries,
        ));
        emit(PeerToPeerState.dataReceived(
            receivedBoundaries: receivedBoundaries));
      }
    } catch (e) {
      debugPrint("Error processing received data: $e");
      emit(PeerToPeerState.failedToReceive(error: e.toString()));
      await event.nearbyService.sendMessage(
          event.data["deviceId"],
          PeerToPeerMessageModel(
            messageType: MessageTypes.confirmation.toValue(),
            message: "$e",
            confirmationType: ConfirmationTypes.failed.toValue(),
            status: MessageStatus.fail.toValue(),
          ).toJson());
    }
  }

  Future<bool> waitForConfirmation(
    NearbyService nearbyService, {
    required String confirmationType,
    int? offset,
  }) async {
    final completer = Completer<bool>();

    final subscription = nearbyService.dataReceivedSubscription(
      callback: (data) {
        try {
          PeerToPeerMessageModel messageModel =
              PeerToPeerMessageModelMapper.fromJson(data["message"]);

          if (messageModel.messageType == MessageTypes.confirmation.toValue() ||
              messageModel.confirmationType ==
                  ConfirmationTypes.finalTransfer.toValue()) {
            if (confirmationType == ConfirmationTypes.chunk.toValue() &&
                messageModel.offset == offset) {
              completer.complete(true);
            } else if (confirmationType ==
                    ConfirmationTypes.finalAcknowledgment.toValue() ||
                confirmationType == ConfirmationTypes.finalTransfer.toValue() ||
                confirmationType == ConfirmationTypes.handShake.toValue()) {
              completer.complete(true);
            } else if (confirmationType == ConfirmationTypes.failed.toValue()) {
              completer.complete(false);
              emit(PeerToPeerState.failedToTransfer(
                  error: i18.dataShare.failedToTransfer));
            }
          }
        } catch (e) {
          debugPrint("Error processing confirmation: $e");
          completer.complete(false);
        }
      },
    );

    bool result = await completer.future;
    subscription.cancel();
    return result;
  }
}

@freezed
class PeerToPeerEvent with _$PeerToPeerEvent {
  const factory PeerToPeerEvent.dataTransfer(
      {required NearbyService nearbyService,
      required String selectedProject,
      required String selectedBoundaryCode,
      required List<Device> connectedDevice}) = DataTransferEvent;

  const factory PeerToPeerEvent.dataReceiver(
      {required String projectId,
      required String selectedBoundaryCode,
      required NearbyService nearbyService,
      required dynamic data}) = DataReceiverEvent;
}

@freezed
class PeerToPeerState with _$PeerToPeerState {
  const factory PeerToPeerState.initial() = PeerToPeerInitial;

  const factory PeerToPeerState.loading() = PeerToPeerLoading;

  const factory PeerToPeerState.transferInProgress(
      {required double progress,
      required int offset,
      required int totalCount}) = TransferInProgress;

  const factory PeerToPeerState.completedDataTransfer() = CompletedDataTransfer;

  const factory PeerToPeerState.failedToTransfer({required String error}) =
      FailedToTransfer;

  const factory PeerToPeerState.receivingInProgress(
      {required double progress,
      required int offset,
      required int totalCount,
      required Set<String> receivedBoundaries}) = ReceivingInProgress;

  const factory PeerToPeerState.dataReceived(
      {required Set<String> receivedBoundaries}) = DataReceived;

  const factory PeerToPeerState.failedToReceive({required String error}) =
      FailedDataTransfer;
}
