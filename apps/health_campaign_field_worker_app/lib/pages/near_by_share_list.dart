import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:registration_delivery/models/entities/household.dart';

import '../utils/extensions/extensions.dart';

enum DeviceType { receiver, sender }

class DevicesListScreen extends StatefulWidget {
  const DevicesListScreen({super.key, required this.deviceType});

  final DeviceType deviceType;

  @override
  _DevicesListScreenState createState() => _DevicesListScreenState();
}

class _DevicesListScreenState extends State<DevicesListScreen>
    with TickerProviderStateMixin {
  List<Device> devices = [];
  List<Device> connectedDevices = [];
  late NearbyService nearbyService;
  late StreamSubscription subscription;
  late StreamSubscription receivedDataSubscription;
  late AnimationController _controller;
  late AnimationController _radarController;

  late Animation<Color?> _colorAnimation1;
  late Animation<Color?> _colorAnimation2;

  bool isInit = false;
  double rippleRadius = 0;

  @override
  void initState() {
    super.initState();
    createAnimation();
    init();
  }

  @override
  void dispose() {
    subscription.cancel();
    receivedDataSubscription.cancel();
    nearbyService.stopBrowsingForPeers();
    nearbyService.stopAdvertisingPeer();
    _controller.dispose();
    _radarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DigitTheme.instance.colors.regalBlue,
      body: Column(
        children: [
          Text(
            widget.deviceType.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Radar Circles
                  ...List.generate(4, (index) {
                    return Container(
                      width: 200.0 + (index * 50),
                      height: 200.0 + (index * 50),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    );
                  }),
                  // Radar Sweep
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _controller.value * 2 * pi,
                        child: Container(
                          width: 400,
                          height: 400,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: SweepGradient(
                              colors: [
                                Colors.white.withOpacity(0.3),
                                Colors.transparent,
                              ],
                              stops: [0.7, 1.0],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ..._generateRandomDevicePositions(devices, 400, 200),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _generateRandomDevicePositions(
      List<Device> devices,
      double size,
      double
          rippleRadius // Pass rippleRadius here to position devices inside it
      ) {
    final random = Random();
    return widget.deviceType == DeviceType.receiver
        ? connectedDevices.asMap().entries.map((entry) {
            // Ensure that the device is placed within the ripple's growing radius
            final angle = random.nextDouble() * 2 * pi; // Random angle
            final radius = random.nextDouble() *
                rippleRadius; // Ensure radius is within ripple radius
            final x = radius * cos(angle);
            final y = radius * sin(angle);

            return Positioned(
              left: size / 2 +
                  x -
                  40, // Adjust icon position (centered around the circle)
              top: size / 2 + y - 40,
              child: _buildDeviceWidget(entry.value),
            );
          }).toList()
        : devices.asMap().entries.map((entry) {
            // Ensure that the device is placed within the ripple's growing radius
            final angle = random.nextDouble() * 2 * pi; // Random angle
            final radius = random.nextDouble() *
                rippleRadius; // Ensure radius is within ripple radius
            final x = radius * cos(angle);
            final y = radius * sin(angle);

            return Positioned(
              left: size / 2 +
                  x -
                  40, // Adjust icon position (centered around the circle)
              top: size / 2 + y - 40,
              child: _buildDeviceWidget(entry.value),
            );
          }).toList();
  }

  // Build each device widget with icon and name
  Widget _buildDeviceWidget(Device device) {
    return GestureDetector(
      onTap: () {
        _onButtonClicked(device);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: Icon(
              Icons.phone_android,
              size: 50, // Adjust size of the device icon
              color: DigitTheme.instance.colors.amber,
            ),
          ),
          const SizedBox(
            height: kPadding,
          ),
          Text(
            device.deviceName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12, color: DigitTheme.instance.colors.amber),
          ),
        ],
      ),
    );
  }

  String getStateName(SessionState state) {
    switch (state) {
      case SessionState.notConnected:
        return "disconnected";
      case SessionState.connecting:
        return "waiting";
      default:
        return "connected";
    }
  }

  String getButtonStateName(SessionState state) {
    switch (state) {
      case SessionState.notConnected:
      case SessionState.connecting:
        return "Connect";
      default:
        return "Disconnect";
    }
  }

  Color getStateColor(SessionState state) {
    switch (state) {
      case SessionState.notConnected:
        return Colors.black;
      case SessionState.connecting:
        return Colors.grey;
      default:
        return Colors.green;
    }
  }

  Color getButtonColor(SessionState state) {
    switch (state) {
      case SessionState.notConnected:
      case SessionState.connecting:
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  int getItemCount() {
    if (widget.deviceType == DeviceType.receiver) {
      return connectedDevices.length;
    } else {
      return devices.length;
    }
  }

  _onButtonClicked(Device device) {
    switch (device.state) {
      case SessionState.notConnected:
        nearbyService.invitePeer(
          deviceID: device.deviceId,
          deviceName: device.deviceName,
        );
        break;
      case SessionState.connected:
        nearbyService.disconnectPeer(deviceID: device.deviceId);
        break;
      case SessionState.connecting:
        break;
    }
  }

  void init() async {
    nearbyService = NearbyService();
    String devInfo = '';
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      devInfo = androidInfo.model;
    }
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      devInfo = iosInfo.localizedModel;
    }
    await nearbyService.init(
        serviceType: 'mpconn',
        deviceName: devInfo,
        strategy: Strategy.P2P_CLUSTER,
        callback: (isRunning) async {
          if (isRunning) {
            if (widget.deviceType == DeviceType.sender) {
              await nearbyService.stopBrowsingForPeers();
              await Future.delayed(const Duration(microseconds: 200));
              await nearbyService.startBrowsingForPeers();
            } else {
              await nearbyService.stopAdvertisingPeer();
              await nearbyService.stopBrowsingForPeers();
              await Future.delayed(const Duration(microseconds: 200));
              await nearbyService.startAdvertisingPeer();
              await nearbyService.startBrowsingForPeers();
            }
          }
        });
    subscription =
        nearbyService.stateChangedSubscription(callback: (devicesList) {
      for (var element in devicesList) {
        print(
            "deviceId: ${element.deviceId} | deviceName: ${element.deviceName} | state: ${element.state}");

        // Handle Android-specific browsing
        if (Platform.isAndroid) {
          if (element.state == SessionState.connected) {
            print('connection successful');
            showModalBottomSheet(
                context: context,
                elevation: 5,
                builder: (context) => Column(
                      children: [
                        Text(
                          "Connected to ${element.deviceName}...",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ));
            // nearbyService.stopBrowsingForPeers();
          } else if (element.state == SessionState.notConnected) {
            nearbyService.startBrowsingForPeers();
          }
        }
      }

      setState(() {
        // Deduplicate the devices list
        final uniqueDevices = <String, Device>{}; // Use a map for deduplication
        for (var device in devicesList) {
          uniqueDevices[device.deviceId] =
              device; // Replace entries with the same deviceId
        }

        // Update the devices list and connected devices
        devices
          ..clear()
          ..addAll(uniqueDevices.values); // Add only unique devices

        connectedDevices
          ..clear()
          ..addAll(devices.where((d) => d.state == SessionState.connected));
      });
    });

    receivedDataSubscription =
        nearbyService.dataReceivedSubscription(callback: (data) {
      try {
        // Extract the raw JSON string
        var receivedData = data["message"];
        print('Decoded data: $receivedData');

        // Step 1: Decode the outer JSON string (array)
        Map<String, dynamic> outerArray = jsonDecode(receivedData);
        print('data ${outerArray["model"][0]}');

        HouseholdModel model =
            HouseholdModelMapper.fromJson(outerArray["model"][0]);
        print('model $model');
        // saveDataInDb(model);
        // // Step 3: Use the parsed data
        // if (models.isNotEmpty) {
        //   saveDataInDb(models.first);
        // }
      } catch (e) {
        debugPrint('Error parsing data: $e');
      }

      // showToast(jsonEncode(data["message"]),
      //     context: context,
      //     axis: Axis.horizontal,
      //     alignment: Alignment.center,
      //     position: StyledToastPosition.bottom);
    });
  }

  void fetchDbRecords(Device device) async {
    var records = await context
        .repository<HouseholdModel, HouseholdSearchModel>()
        .search(HouseholdSearchModel());

    // Convert the list of models to JSON
    var serializedData = records.map((model) => model).toList();

    nearbyService.sendMessage(
        device.deviceId, jsonEncode({'model': serializedData}));
  }

  void saveDataInDb(HouseholdModel model) async {
    var projectBeneficiaryModel = await context
        .repository<HouseholdModel, HouseholdSearchModel>()
        .create(model);
  }

  void createAnimation() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat();
    _radarController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: false);

    _colorAnimation1 = ColorTween(
      begin: const Color.fromRGBO(255, 255, 255, 1.0),
      end: const Color.fromRGBO(234, 138, 59, 1),
    ).animate(_controller);

    _colorAnimation2 = ColorTween(
      begin: const Color.fromRGBO(234, 138, 59, 1),
      end: const Color.fromRGBO(234, 138, 59, 1),
    ).animate(_controller);
  }
}
