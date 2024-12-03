import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:attendance_management/widgets/back_navigation_help_header.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';

import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../../widgets/showcase/showcase_wrappers.dart';
import 'data_receiver.dart';

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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ScrollableContent(
        backgroundColor: DigitTheme.instance.colors.light.primary1Bg,
        enableFixedButton: true,
        footer: DigitCard(
          margin: const EdgeInsets.only(top: spacer2),
          padding: const EdgeInsets.all(spacer2),
          children: [
            if (widget.deviceType == DeviceType.sender)
              Button(
                onPressed: () {
                  if (connectedDevices.isNotEmpty) {
                    context.router.push(DataTransferRoute(
                      connectedDevice: connectedDevices,
                      nearbyService: nearbyService,
                    ));
                  } else {
                    DigitToast.show(context,
                        options: DigitToastOptions(
                            localizations
                                .translate(i18.dataShare.noDevicesConnected),
                            true,
                            theme));
                  }
                },
                type: ButtonType.primary,
                label: localizations.translate(i18.dataShare.sendAction),
                size: ButtonSize.large,
                mainAxisSize: MainAxisSize.max,
              ),
          ],
        ),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const BackNavigationHelpHeaderWidget(
                  showHelp: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.deviceType.name.toUpperCase(),
                      style: textTheme.headingM,
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.6,
                  width: screenWidth * 0.9,
                  margin: const EdgeInsets.all(kPadding),
                  decoration: BoxDecoration(
                    color: DigitTheme.instance.colors.light.primary2,
                    borderRadius: BorderRadius.circular(kPadding),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Radar Circles
                      ...List.generate(3, (index) {
                        return Container(
                          width: screenWidth * 0.5 + (index * 50),
                          height: screenHeight * 0.3 + (index * 50),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: DigitTheme.instance.colors.light.primary1Bg
                                  .withOpacity(0.3),
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
                              width: screenWidth * 0.9,
                              height: screenHeight * 0.6,
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
                      ..._generateRandomDevicePositions(
                          devices, screenWidth * 0.9, screenHeight * 0.6),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _generateRandomDevicePositions(
      List<Device> devices, double width, double height) {
    final random = Random();
    return widget.deviceType == DeviceType.receiver
        ? connectedDevices.asMap().entries.map((entry) {
            // Use the device index to offset the randomization for uniqueness
            final angle = random.nextDouble() * 2 * pi +
                entry.key * 0.1; // slight offset for uniqueness
            final radius = random.nextDouble() * rippleRadius;
            final x = radius * cos(angle);
            final y = radius * sin(angle);

            return Positioned(
              left: width / 2 + x - 20, // Adjust based on the container size
              top: height / 2 + y - 20,
              child: _buildDeviceWidget(entry.value),
            );
          }).toList()
        : devices.asMap().entries.map((entry) {
            final angle = random.nextDouble() * 2 * pi +
                entry.key * 0.1; // slight offset for uniqueness
            final radius = (random.nextDouble() * rippleRadius) +
                20; // Ensure enough space between devices
            final x = radius * cos(angle);
            final y = radius * sin(angle);

            return Positioned(
              left: width / 2 + x - 20,
              top: height / 2 + y - 20,
              child: _buildDeviceWidget(entry.value),
            );
          }).toList();
  }

  // Build each device widget with icon and name
  Widget _buildDeviceWidget(Device device) {
    return device.state == SessionState.connecting
        ? const CircularProgressIndicator()
        : GestureDetector(
            onTap: () {
              _onButtonClicked(device);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: DigitTheme.instance.colors.light.primary1Bg
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(kPadding),
                      border: Border.all(
                          color: DigitTheme.instance.colors.light.primary1Bg
                              .withOpacity(0.2),
                          width: 1.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(kPadding),
                    child: Column(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 24, // Adjust size of the device icon
                          color: DigitTheme.instance.colors.light.primary1Bg,
                        ),
                        Text(
                          device.deviceName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                            color: DigitTheme.instance.colors.light.primary1Bg,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(kPadding),
                  color: DigitTheme.instance.colors.light.primary1Bg,
                  child: Padding(
                    padding: const EdgeInsets.all(kPadding / 2),
                    child: Text(
                      getStateName(device.state),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 8, color: getStateColor(device.state)),
                    ),
                  ),
                ),
              ],
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
        return DigitTheme.instance.colors.light.alertWarning;
      case SessionState.connecting:
        return DigitTheme.instance.colors.light.alertWarning;
      default:
        return DigitTheme.instance.colors.light.alertSuccess;
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
