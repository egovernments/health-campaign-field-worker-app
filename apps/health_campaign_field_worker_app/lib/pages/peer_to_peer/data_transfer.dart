import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:path_provider/path_provider.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';

@RoutePage()
class DataTransferPage extends LocalizedStatefulWidget {
  final Device connectedDevice;
  final NearbyService nearbyService;

  const DataTransferPage(
      {super.key, required this.nearbyService, required this.connectedDevice});

  @override
  State<DataTransferPage> createState() => _DataTransferScreenState();
}

class _DataTransferScreenState extends LocalizedState<DataTransferPage> {
  late NearbyService nearbyService;
  double progress = 0.0; // To track progress

  @override
  void initState() {
    super.initState();
    nearbyService = widget.nearbyService;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void sendEntities(Map<String, dynamic> entities) async {
    for (var entityName in entities.keys) {
      List<dynamic> entityData = entities[entityName]!;
      int totalSize = entityData.length;
      int offset = 0;

      try {
        while (offset < totalSize) {
          const int chunkSize = 100;
          int end =
              (offset + chunkSize < totalSize) ? offset + chunkSize : totalSize;
          List<dynamic> chunk = entityData.sublist(offset, end);

          // Send the chunk
          widget.nearbyService.sendMessage(
            widget.connectedDevice.deviceId,
            jsonEncode({
              "entityType": entityName,
              "message": chunk,
              "offset": offset + chunk.length,
              "totalData": totalSize,
            }),
          );

          // Update progress for the entity
          setState(() {
            progress = (offset + chunk.length) / totalSize;
          });

          // Simulate delay for smoother UX
          await Future.delayed(const Duration(milliseconds: 200));
          offset = end;
        }

        // Wait for receiver's confirmation for the current entity
        await waitForConfirmation(entityName);
      } catch (e) {
        debugPrint('Error sending $entityName: $e');
      }
    }

    // Notify completion
    if (mounted) {
      setState(() {
        progress = 1.0;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Transfer Complete"),
          content: const Text("All entities have been sent successfully."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  Future<void> waitForConfirmation(String entityName) async {
    final completer = Completer<void>();

    final subscription =
        nearbyService.dataReceivedSubscription(callback: (data) {
      try {
        var receivedJson = jsonDecode(data["message"]);
        if (receivedJson["type"] == "confirmation" &&
            receivedJson["entityType"] == entityName &&
            receivedJson["status"] == "success") {
          debugPrint("Confirmation received for $entityName");
          completer.complete();
        }
      } catch (e) {
        debugPrint("Error processing confirmation: $e");
      }
    });

    Future.delayed(const Duration(seconds: 10), () {
      if (!completer.isCompleted) {
        completer
            .completeError("Timeout waiting for confirmation for $entityName");
      }
    });

    await completer.future;
    subscription.cancel();
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
            children: [
              const Text(
                "Transferring data to the connected device...",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(value: progress),
              const SizedBox(height: 10),
              Text("${(progress * 100).toStringAsFixed(1)}%"),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  // Example data to transfer
                  readDownSyncData();
                },
                child: const Text("Start Transfer"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void readDownSyncData() async {
    final downloadsDirectory = await getDownloadsDirectory();

    final file = File('${downloadsDirectory!.path}/down_sync_data.json');

    final content = await file.readAsString();
    if (content.isNotEmpty) {
      try {
        sendEntities(jsonDecode(content));
        // nearbyService.sendMessage(widget.connectedDevice.deviceId, content);
      } catch (e) {
        debugPrint('Error parsing data: $e');
      }
    }
  }
}
