import 'dart:async';
import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/localized.dart';

class DataReceiverPage extends LocalizedStatefulWidget {
  final Device connectedDevice;
  final NearbyService nearbyService;
  const DataReceiverPage(
      {super.key, required this.connectedDevice, required this.nearbyService});

  @override
  State<DataReceiverPage> createState() => _DataReceiverPageState();
}

class _DataReceiverPageState extends LocalizedState<DataReceiverPage> {
  late NearbyService nearbyService;
  List<dynamic> receivedData = [];
  double progress = 0.0;
  int receivedBytes = 0;
  int totalBytes = 0;
  late StreamSubscription receivedDataSubscription;

  @override
  void initState() {
    super.initState();
    nearbyService = widget.nearbyService;
    initReceiver();
  }

  @override
  void dispose() {
    nearbyService.stopAdvertisingPeer();
    nearbyService.stopBrowsingForPeers();
    receivedDataSubscription.cancel();
    super.dispose();
  }

  Future<void> initReceiver() async {
    nearbyService.stateChangedSubscription(callback: (state) {
      debugPrint("Nearby state changed: $state");
    });

    receivedDataSubscription =
        nearbyService.dataReceivedSubscription(callback: (data) {
      try {
        var receivedJson = jsonDecode(data["message"]);
        String entityType = receivedJson["entityType"];
        int offset = receivedJson["offset"];
        int totalData = receivedJson["totalData"];
        List<dynamic> receivedChunk = receivedJson["message"];

        // Update progress
        setState(() {
          receivedBytes = offset;
          progress = receivedBytes / totalData;
          receivedData.addAll(receivedChunk);
        });

        // When data for this entity is fully received
        if (receivedBytes >= totalData) {
          // Save the received entity data
          LocalRepository repository = _getRepositoryForEntity(entityType);
          final entityList =
              receivedData.whereType<Map<String, dynamic>>().toList();
          createDbRecords(repository, entityList, entityType);

          debugPrint("$entityType data saved successfully.");

          // Clear the received data buffer for the next entity
          receivedData.clear();

          // Send confirmation back to the sender
          nearbyService.sendMessage(
            data["senderDeviceId"],
            jsonEncode({
              "type": "confirmation",
              "entityType": entityType,
              "status": "success",
              "message": "$entityType saved successfully."
            }),
          );
        }
      } catch (e) {
        debugPrint("Error processing received data: $e");
      }
    });
  }

  LocalRepository _getRepositoryForEntity(String entityType) {
    switch (entityType) {
      case 'Individuals':
        return context
            .read<LocalRepository<IndividualModel, IndividualSearchModel>>();
      case 'Households':
        return context
            .read<LocalRepository<HouseholdModel, HouseholdSearchModel>>();
      case 'HouseholdMembers':
        return context.read<
            LocalRepository<HouseholdMemberModel,
                HouseholdMemberSearchModel>>();
      case 'ProjectBeneficiaries':
        return context.read<
            LocalRepository<ProjectBeneficiaryModel,
                ProjectBeneficiarySearchModel>>();
      case 'SideEffects':
        return context
            .read<LocalRepository<SideEffectModel, SideEffectSearchModel>>();
      case 'Tasks':
        return context.read<LocalRepository<TaskModel, TaskSearchModel>>();
      case 'Referrals':
        return context
            .read<LocalRepository<ReferralModel, ReferralSearchModel>>();
      default:
        throw Exception("Unknown entity type: $entityType");
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (pop) {
        if (pop) {
          widget.nearbyService
              .disconnectPeer(deviceID: widget.connectedDevice.deviceId);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              "${localizations.translate(i18.dataShare.connectedTo)} ${widget.connectedDevice.deviceName}"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Receiving data from the connected device...",
                style: TextStyle(fontSize: 18),
              ),
              LinearProgressIndicator(value: progress),
              const SizedBox(height: 10),
              Text("${(progress * 100).toStringAsFixed(1)}%"),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
