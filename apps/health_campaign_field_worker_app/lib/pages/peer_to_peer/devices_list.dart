import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:attendance_management/widgets/back_navigation_help_header.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';

import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../../widgets/showcase/showcase_wrappers.dart';

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
  final List<Device> devices = [];
  final List<Device> connectedDevices = [];
  late final Device senderDeviceDetails;
  late NearbyService nearbyService;
  late StreamSubscription<dynamic> stateSubscription;
  late AnimationController _controller;
  late AnimationController _radarController;

  @override
  void initState() {
    super.initState();
    createAnimations();
    initializeNearbyService();
  }

  @override
  void dispose() {
    stateSubscription.cancel();
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ScrollableContent(
        backgroundColor: DigitTheme.instance.colors.light.primary1Bg,
        enableFixedButton: true,
        footer: DigitCard(
          margin: const EdgeInsets.only(top: 16.0),
          padding: const EdgeInsets.all(16.0),
          children: [
            Button(
              onPressed: handleFooterButtonPress,
              type: ButtonType.primary,
              label: widget.deviceType == DeviceType.sender
                  ? localizations.translate(i18.dataShare.sendAction)
                  : localizations.translate(i18.dataShare.receiveAction),
              size: ButtonSize.large,
              mainAxisSize: MainAxisSize.max,
              capitalizeLetters: false,
            ),
          ],
        ),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const BackNavigationHelpHeaderWidget(showHelp: true),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.deviceType.name.toUpperCase(),
                      style: textTheme.headingM,
                    ),
                  ),
                ),
                buildRadarScreen(screenWidth, screenHeight),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildRadarScreen(double width, double height) {
    return Container(
      height: height * 0.6,
      width: width * 0.9,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: DigitTheme.instance.colors.light.primary2,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...List.generate(3, (index) {
            return Container(
              width: width * 0.5 + (index * 50),
              height: height * 0.3 + (index * 50),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: DigitTheme.instance.colors.light.primary1Bg
                      .withOpacity(0.3),
                ),
              ),
            );
          }),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: Container(
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
          ...generateDeviceWidgets(width * 0.9, height * 0.6),
        ],
      ),
    );
  }

  List<Widget> generateDeviceWidgets(double width, double height) {
    final random = Random();
    final devicesToShow =
        widget.deviceType == DeviceType.receiver ? connectedDevices : devices;

    return devicesToShow.asMap().entries.map((entry) {
      final angle = random.nextDouble() * 2 * pi + entry.key * 0.1;
      final radius = 50 + random.nextDouble() * 100;
      final x = radius * cos(angle);
      final y = radius * sin(angle);

      return Positioned(
        left: width / 2 + x - 20,
        top: height / 2 + y - 20,
        child: buildDeviceWidget(entry.value),
      );
    }).toList();
  }

  Widget buildDeviceWidget(Device device) {
    return device.state == SessionState.connected ||
            device.state == SessionState.notConnected
        ? GestureDetector(
            onTap: () {
              handleDeviceTap(device);
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
          )
        : const CircularProgressIndicator();
  }

  void handleFooterButtonPress() {
    if (connectedDevices.isEmpty) {
      DigitToast.show(
        context,
        options: DigitToastOptions(
          localizations.translate(i18.dataShare.noDevicesConnected),
          true,
          Theme.of(context),
        ),
      );
      return;
    }

    if (widget.deviceType == DeviceType.sender) {
      context.router.push(DataTransferRoute(
        connectedDevices: connectedDevices,
        nearbyService: nearbyService,
      ));
    } else {
      context.router.push(DataReceiverRoute(
        connectedDevice: connectedDevices.first,
        nearbyService: nearbyService,
      ));
    }
  }

  void handleDeviceTap(Device device) {
    if (device.state == SessionState.notConnected) {
      nearbyService.invitePeer(
        deviceID: device.deviceId,
        deviceName: device.deviceName,
      );
    } else if (device.state == SessionState.connected) {
      nearbyService.disconnectPeer(deviceID: device.deviceId);
    }
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
      case SessionState.connected:
        return DigitTheme.instance.colors.light.alertSuccess;
      default:
        return Colors.grey;
    }
  }

  void createAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
    _radarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  Future<void> initializeNearbyService() async {
    final deviceInfo = DeviceInfoPlugin();
    final deviceId = Platform.isAndroid
        ? (await deviceInfo.androidInfo).model
        : (await deviceInfo.iosInfo).localizedModel;

    nearbyService = NearbyService();
    await nearbyService.init(
      serviceType: 'mpconn',
      deviceName: deviceId,
      strategy: Strategy.Wi_Fi_P2P,
      callback: (isRunning) async {
        if (isRunning) {
          if (widget.deviceType == DeviceType.sender) {
            await nearbyService.startBrowsingForPeers();
          } else {
            await nearbyService.startAdvertisingPeer();
          }
        }
      },
    );

    stateSubscription = nearbyService.stateChangedSubscription(
      callback: (devicesList) {
        setState(() {
          // Clear the existing lists to avoid stale data
          devices.clear();
          connectedDevices.clear();
          // Deduplicate the devices list
          final uniqueDevices = <String, Device>{};
          // Separate devices based on their connection state
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
      },
    );
  }
}
