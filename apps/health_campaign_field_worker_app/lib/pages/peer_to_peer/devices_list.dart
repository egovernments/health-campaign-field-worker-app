import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:attendance_management/widgets/back_navigation_help_header.dart';
import 'package:auto_route/annotations.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import 'data_receiver.dart';
import 'data_transfer.dart';

enum DeviceType { receiver, sender }

@RoutePage()
class DevicesListPage extends LocalizedStatefulWidget {
  const DevicesListPage({super.key, required this.deviceType});

  final DeviceType deviceType;

  @override
  DevicesListPageState createState() => DevicesListPageState();
}

class DevicesListPageState extends LocalizedState<DevicesListPage>
    with TickerProviderStateMixin {
  List<Device> devices = [];
  List<Device> connectedDevices = [];
  late NearbyService nearbyService;
  late StreamSubscription subscription;
  late AnimationController _controller;
  late AnimationController _radarController;

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
    nearbyService.stopBrowsingForPeers();
    nearbyService.stopAdvertisingPeer();
    _controller.dispose();
    _radarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ScrollableContent(
        backgroundColor: DigitTheme.instance.colors.white,
        footer: widget.deviceType == DeviceType.sender
            ? DigitElevatedButton(
                onPressed: connectedDevices.isNotEmpty
                    ? () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DataTransferPage(
                            connectedDevice: connectedDevices.first,
                            nearbyService: nearbyService,
                          );
                        }));
                      }
                    : null,
                child: Text(localizations.translate(i18.dataShare.sendAction)),
              )
            : const Spacer(),
        children: [
          const BackNavigationHelpHeaderWidget(),
          Text(
            widget.deviceType.name.toUpperCase(),
            style: textTheme.headingM,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            color: DigitTheme.instance.colors.regalBlue,
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
                            stops: const [0.7, 1.0],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ..._generateRandomDevicePositions(devices, 400, 200),
              ],
            ),
          )
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
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(kPadding),
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.phone_android,
                size: 50, // Adjust size of the device icon
                color: DigitTheme.instance.colors.amber,
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
              Text(
                getStateName(device.state),
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 8, color: getStateColor(device.state)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getStateName(SessionState state) {
    switch (state) {
      case SessionState.notConnected:
        return SessionState.notConnected.name.toUpperCase();
      case SessionState.connecting:
        return SessionState.connecting.name.toUpperCase();
      case SessionState.connected:
        return SessionState.connected.name.toUpperCase();
      default:
        return "UNKNOWN";
    }
  }

  Color getStateColor(SessionState state) {
    switch (state) {
      case SessionState.notConnected:
        return DigitTheme.instance.colors.amber;
      case SessionState.connecting:
        return DigitTheme.instance.colors.white;
      default:
        return DigitTheme.instance.colors.darkSpringGreen;
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
    String deviceId = '';
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final Set<String> navigatedDevices = {};

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.model;
    }
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.localizedModel;
    }
    await nearbyService.init(
        serviceType: 'mpconn',
        deviceName: deviceId,
        strategy: Strategy.Wi_Fi_P2P,
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
      if (devicesList.isNotEmpty) {
        var element = devicesList.first;
        if (kDebugMode) {
          print(
              "deviceId: ${element.deviceId} | deviceName: ${element.deviceName} | state: ${element.state}");
        }

        // Handle Android-specific browsing
        if (Platform.isAndroid) {
          if (element.state == SessionState.connected) {
            if (!navigatedDevices.contains(element.deviceId)) {
              if (kDebugMode) {
                print('connection successful');
              }
              navigatedDevices.add(element.deviceId);
              if (widget.deviceType == DeviceType.receiver) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DataReceiverPage(
                              connectedDevice: element,
                              nearbyService: nearbyService,
                            )));
              }
              nearbyService.stopBrowsingForPeers();
            }
          } else if (element.state == SessionState.notConnected) {
            nearbyService.startBrowsingForPeers();
            navigatedDevices.remove(
                element.deviceId); // Allow re-navigation if disconnected
          }
        }

        setState(() {
          // Deduplicate the devices list
          final uniqueDevices =
              <String, Device>{}; // Use a map for deduplication
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
      }
    });
  }

  void createAnimation() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat();
    _radarController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: false);
  }
}
