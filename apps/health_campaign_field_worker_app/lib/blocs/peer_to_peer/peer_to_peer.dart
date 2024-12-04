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

import '../../data/repositories/sync/remote_type.dart';
import '../../utils/utils.dart';

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

  List<dynamic> receivedData = [];
  int receivedBytes = 0;
  int totalData = 0;
  String entityType = '';
  late Device connectedDevice;
  PeerToPeerBloc({
    required this.individualLocalRepository,
    required this.householdLocalRepository,
    required this.householdMemberLocalRepository,
    required this.projectBeneficiaryLocalRepository,
    required this.taskLocalRepository,
    required this.sideEffectLocalRepository,
    required this.referralLocalRepository,
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
          progress: 0, entityName: ''));

      final downloadsDirectory = await getDownloadsDirectory();

      final file = File('${downloadsDirectory!.path}/down_sync_data.json');

      final content = await file.readAsString();

      if (content.isNotEmpty) {
        final entities = jsonDecode(content);

        for (var entityName in entities.keys) {
          List<dynamic> entityData = entities[entityName]!;
          int totalSize = entityData.length;
          int offset = 0;

          while (offset < totalSize) {
            // Calculate the chunk
            const int chunkSize = 1000;
            int end = (offset + chunkSize < totalSize)
                ? offset + chunkSize
                : totalSize;
            List<dynamic> chunk = entityData.sublist(offset, end);

            // Send the chunk
            for (var device in event.connectedDevice) {
              await event.nearbyService.sendMessage(
                device.deviceId,
                jsonEncode({
                  "entityType": entityName,
                  "message": chunk,
                  "offset": offset + chunk.length,
                  "totalData": totalSize,
                }),
              );
            }

            // Wait for chunk confirmation
            await waitForConfirmation(
              entityName,
              event.nearbyService,
              confirmationType: "chunk",
              offset: offset + chunk.length,
            );

            // Update progress
            final progress = (offset + chunk.length) / totalSize;
            emit(PeerToPeerState.transferInProgress(
                progress: progress, entityName: entityName));
            offset = end;
          }

          // Wait for final confirmation
          await waitForConfirmation(
            entityName,
            event.nearbyService,
            confirmationType: "final",
          );
        }

        emit(const PeerToPeerState.completedDataTransfer());
      }
    } catch (e) {
      emit(PeerToPeerState.failedToTransfer(error: e.toString()));
    }
  }

  Future<void> waitForConfirmation(
    String entityName,
    NearbyService nearbyService, {
    required String confirmationType,
    int? offset,
  }) async {
    final completer = Completer<void>();

    final subscription =
        nearbyService.dataReceivedSubscription(callback: (data) {
      try {
        var receivedJson = jsonDecode(data["message"]);
        if (receivedJson["type"] == "confirmation" &&
            receivedJson["entityType"] == entityName &&
            receivedJson["confirmationType"] == confirmationType) {
          if (confirmationType == "chunk" &&
              receivedJson["offset"] != null &&
              receivedJson["offset"] == offset) {
            debugPrint("Chunk confirmation received for $entityName");
            completer.complete();
          } else if (confirmationType == "final") {
            debugPrint("Final confirmation received for $entityName");
            completer.complete();
          }
        }
      } catch (e) {
        debugPrint("Error processing confirmation: $e");
      }
    });

    // Add timeout logic if required
    await completer.future;
    subscription.cancel();
  }

  Future<void> _handleReceiveEntities(
    DataReceiverEvent event,
    Emitter<PeerToPeerState> emit,
  ) async {
    try {
      // Decode the received data
      var receivedJson = jsonDecode(event.data["message"]);
      entityType = receivedJson["entityType"];
      int offset = receivedJson["offset"];
      totalData = receivedJson["totalData"];
      List<dynamic> receivedChunk = receivedJson["message"];

      // Update received bytes and data
      receivedBytes = offset;
      double progress = receivedBytes / totalData;
      receivedData.addAll(receivedChunk);

      // Emit progress for UI/State tracking
      emit(PeerToPeerState.receivingInProgress(
          progress: progress, entityName: entityType));

      // Send a chunk-level confirmation
      event.nearbyService.sendMessage(
        event.data["deviceId"],
        jsonEncode({
          "type": "confirmation",
          "confirmationType": "chunk",
          "entityType": entityType,
          "status": "received",
          "offset": offset,
          "progress": progress,
          "message": "Chunk received successfully.",
        }),
      );

      // Check if all data is received
      if (receivedBytes >= totalData) {
        // Save the received entity data
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

        final entityList =
            receivedData.whereType<Map<String, dynamic>>().toList();
        createDbRecords(local, entityList, entityType);

        debugPrint("$entityType data saved successfully.");

        // Clear buffer for the next entity
        receivedData.clear();
        receivedBytes = 0;

        // Send a final confirmation
        event.nearbyService.sendMessage(
          event.data["deviceId"],
          jsonEncode({
            "type": "confirmation",
            "confirmationType": "final",
            "entityType": entityType,
            "status": "success",
            "message": "$entityType saved successfully.",
          }),
        );

        // Emit final state
        emit(const PeerToPeerState.dataReceived());
      }
    } catch (e) {
      debugPrint("Error processing received data: $e");
      emit(PeerToPeerState.failedToReceive(error: e.toString()));
    }
  }
}

@freezed
class PeerToPeerEvent with _$PeerToPeerEvent {
  const factory PeerToPeerEvent.dataTransfer(
      {required NearbyService nearbyService,
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
      required String entityName}) = TransferInProgress;

  const factory PeerToPeerState.completedDataTransfer() = CompletedDataTransfer;

  const factory PeerToPeerState.failedToTransfer({required String error}) =
      FailedToTransfer;

  const factory PeerToPeerState.receivingInProgress(
      {required double progress,
      required String entityName}) = ReceivingInProgress;

  const factory PeerToPeerState.dataReceived() = DataReceived;

  const factory PeerToPeerState.failedToReceive({required String error}) =
      FailedDataTransfer;
}
