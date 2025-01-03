// GENERATED using mason_cli
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:sync_service/data/repositories/sync/remote_type.dart';

import '../../data/sync_service_mapper.dart';
import '../../models/downsync/downsync.dart';

part 'peer_to_peer.freezed.dart';

typedef PeerToPeerEmitter = Emitter<PeerToPeerState>;

class PeerToPeerBloc extends Bloc<PeerToPeerEvent, PeerToPeerState> {
  final LocalRepository<IndividualModel, IndividualSearchModel>
      individualLocalRepository;
  final LocalRepository<HouseholdModel, HouseholdSearchModel>
      householdLocalRepository;
  final LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel>
      householdMemberLocalRepository;
  final LocalRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>
      projectBeneficiaryLocalRepository;
  final LocalRepository<TaskModel, TaskSearchModel> taskLocalRepository;
  final LocalRepository<SideEffectModel, SideEffectSearchModel>
      sideEffectLocalRepository;
  final LocalRepository<ReferralModel, ReferralSearchModel>
      referralLocalRepository;
  final LocalRepository<DownsyncModel, DownsyncSearchModel>
      downSyncLocalRepository;

  List<dynamic> receivedData = [];
  int receivedBytes = 0;
  int totalCount = 0;
  String entityType = '';
  late Device connectedDevice;
  late String selectedBoundaryCode;

  PeerToPeerBloc(
      {required this.individualLocalRepository,
      required this.householdLocalRepository,
      required this.householdMemberLocalRepository,
      required this.projectBeneficiaryLocalRepository,
      required this.taskLocalRepository,
      required this.sideEffectLocalRepository,
      required this.referralLocalRepository,
      required this.downSyncLocalRepository})
      : super(const PeerToPeerInitial()) {
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

      final downloadsDirectory = await getDownloadsDirectory();
      final file = File(
          '${downloadsDirectory!.path}/${event.selectedProject}/${event.selectedBoundaryCode}/down_sync_data.json');

      if (await file.exists()) {
        final fileStream = file.openRead();
        final jsonStream =
            fileStream.transform(utf8.decoder).transform(json.decoder);

        await for (final offsets in jsonStream) {
          // Ensure that 'entities' is a Map<String, dynamic>
          if (offsets is! Map<String, dynamic>) {
            emit(PeerToPeerState.failedToTransfer(
                error:
                    'Expected a Map<String, dynamic>, but got ${offsets.runtimeType}'));
            return;
          }

          final castedOffsets = offsets;

          for (var offset in castedOffsets.entries) {
            int offsetValue = int.parse(offset.key);
            Map<String, dynamic> offsetData = offset.value;

            var entityData = offsetData.keys
                .where((element) => element == 'response')
                .map((e) => offsetData[e])
                .toList();

            var selectedBoundaryCode = offsetData.keys
                .where((element) => element == 'boundaryCode')
                .map((e) => offsetData[e])
                .firstOrNull;

            var selectedBoundaryName = offsetData.keys
                .where((element) => element == 'boundaryName')
                .map((e) => offsetData[e])
                .firstOrNull;

            totalCount = offsetData.keys
                .where((element) => element == 'totalCount')
                .map((e) => offsetData[e])
                .toList()
                .first;

            for (var entity in entityData) {
              Map<String, dynamic> entityResponse = entity;

              for (var device in event.connectedDevice) {
                await event.nearbyService.sendMessage(
                  device.deviceId,
                  jsonEncode({
                    "type": "chunk",
                    "selectedBoundaryCode": selectedBoundaryCode,
                    "selectedBoundaryName": selectedBoundaryName,
                    "message": compressJson(entityResponse),
                    "offset": offsetValue,
                    "totalData": totalCount,
                  }),
                );
              }

              // Wait for confirmation before proceeding
              await waitForConfirmation(
                event.nearbyService,
                confirmationType: "chunk",
                offset: offsetValue,
              );

              emit(PeerToPeerState.transferInProgress(
                  progress: offsetValue / totalCount,
                  offset: offsetValue,
                  totalCount: totalCount));
            }
          }

          // Send final acknowledgment to all devices
          for (var device in event.connectedDevice) {
            await event.nearbyService.sendMessage(
              device.deviceId,
              jsonEncode({
                "type": "confirmation",
                "confirmationType": "finalTransfer",
                "status": "completed",
                "message": "All entities have been sent successfully.",
              }),
            );
          }

          // Wait for receiver's overall acknowledgment
          await waitForConfirmation(
            event.nearbyService,
            confirmationType: "finalAcknowledgment",
          );

          emit(const PeerToPeerState.completedDataTransfer());
        }
      } else {
        emit(const PeerToPeerState.failedToTransfer(
            error: "File doesn't exist"));
      }
    } catch (e) {
      emit(PeerToPeerState.failedToTransfer(error: e.toString()));
    }
  }

  String compressJson(Map<String, dynamic> jsonData) {
    // Convert JSON data to string
    final jsonString = jsonEncode(jsonData);

    // Compress using zlib
    final compressedData = zlib.encode(utf8.encode(jsonString));

    // Encode to Base64 to ensure JSON-compatible transmission
    return base64.encode(compressedData);
  }

  // Function to decompress JSON data
  Map<String, dynamic> decompressJson(String base64Data) {
    // Decode Base64 to binary data
    final compressedData = base64.decode(base64Data);

    // Decompress using zlib
    final decompressedString = utf8.decode(zlib.decode(compressedData));

    // Convert back to JSON
    return jsonDecode(decompressedString);
  }

  Future<void> _handleReceiveEntities(
    DataReceiverEvent event,
    PeerToPeerEmitter emit,
  ) async {
    try {
      var receivedJson = jsonDecode(event.data["message"]);
      var messageType = receivedJson["type"];

      if (messageType == "chunk") {
        // Process chunk
        int offset = receivedJson["offset"];
        int totalCount = receivedJson["totalData"];
        selectedBoundaryCode = receivedJson["selectedBoundaryCode"];
        final compressedMessage = receivedJson["message"];
        final entityList = decompressJson(compressedMessage).entries;

        for (var entity in entityList) {
          entityType = entity.key;

          if (entityType == 'DownsyncCriteria') {
            final existingDownSyncData =
                await downSyncLocalRepository.search(DownsyncSearchModel(
              locality: selectedBoundaryCode,
            ));

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
            // Save chunk to database immediately
            final local = RepositoryType.getLocalForType(
              DataModels.getDataModelForEntityName(entityType),
              [
                individualLocalRepository,
                householdLocalRepository,
                householdMemberLocalRepository,
                projectBeneficiaryLocalRepository,
                taskLocalRepository,
                sideEffectLocalRepository,
                referralLocalRepository,
              ],
            );

            SyncServiceMapper().createDbRecords(local, entityList, entityType);
          }
        }

        // Update progress and clear processed data
        receivedBytes = offset;
        double progress = receivedBytes / totalCount;

        // Emit progress
        emit(PeerToPeerState.receivingInProgress(
          progress: progress,
          offset: offset,
          totalCount: totalCount,
        ));

        // Send chunk acknowledgment
        await event.nearbyService.sendMessage(
          event.data["deviceId"],
          jsonEncode({
            "type": "confirmation",
            "confirmationType": "chunk",
            "status": "received",
            "offset": offset,
            "progress": progress,
            "message": "Chunk received and saved successfully.",
          }),
        );
      } else if (messageType == "confirmation" &&
          receivedJson["confirmationType"] == "finalTransfer") {
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

        // Handle overall transfer final acknowledgment
        emit(const PeerToPeerState.dataReceived());

        // Send overall transfer acknowledgment
        await event.nearbyService.sendMessage(
          event.data["deviceId"],
          jsonEncode({
            "type": "confirmation",
            "confirmationType": "finalAcknowledgment",
            "status": "success",
            "message": "All entities received and processed successfully.",
          }),
        );
        emit(const PeerToPeerState.dataReceived());
      }
    } catch (e) {
      debugPrint("Error processing received data: $e");
      emit(PeerToPeerState.failedToReceive(error: e.toString()));
      await event.nearbyService.sendMessage(
        event.data["deviceId"],
        jsonEncode({
          "type": "confirmation",
          "confirmationType": "failed",
          "status": "fail",
          "message": "$e",
        }),
      );
    }
  }

  Future<void> waitForConfirmation(
    NearbyService nearbyService, {
    required String confirmationType,
    int? offset,
  }) async {
    final completer = Completer<void>();

    final subscription = nearbyService.dataReceivedSubscription(
      callback: (data) {
        try {
          var receivedJson = jsonDecode(data["message"]);
          if (receivedJson["type"] == "confirmation") {
            if (confirmationType == "chunk" &&
                receivedJson["offset"] == offset) {
              completer.complete();
            } else if (confirmationType == "finalAcknowledgment") {
              completer.complete();
            } else if (confirmationType == "final") {
              completer.complete();
            } else if (confirmationType == "failed") {
              completer.complete();
              emit(const PeerToPeerState.failedToTransfer(
                  error: "File doesn't exist"));
              throw "Failed to transfer ${receivedJson['message']}";
            }
          }
        } catch (e) {
          debugPrint("Error processing confirmation: $e");
        }
      },
    );

    await completer.future;
    subscription.cancel();
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
      {required NearbyService nearbyService,
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
      required int totalCount}) = ReceivingInProgress;

  const factory PeerToPeerState.dataReceived() = DataReceived;

  const factory PeerToPeerState.failedToReceive({required String error}) =
      FailedDataTransfer;
}
