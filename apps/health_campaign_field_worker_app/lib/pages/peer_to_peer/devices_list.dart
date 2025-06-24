import 'dart:async';
import 'dart:io';

import 'package:attendance_management/widgets/back_navigation_help_header.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/TextTheme/digit_text_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../router/app_router.dart';
import '../../utils/constants.dart';
import '../../utils/extensions/extensions.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';

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
  late final String senderDeviceDetails;
  late NearbyService nearbyService;
  late StreamSubscription<dynamic> stateSubscription;
  late AnimationController _controller;
  late AnimationController _radarController;
  final ValueNotifier<List<Device>> _deviceNotifier = ValueNotifier([]);
  bool _isSheetShown = false;
  Timer? _debounceTimer;

  late ThemeData theme;
  late DigitTextTheme textTheme;
  late double screenWidth;
  late double screenHeight;

  @override
  void initState() {
    super.initState();
    createAnimations();
    initializeNearbyService();
    fetchSenderDeviceDetails();
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
    theme = Theme.of(context);
    textTheme = theme.digitTextTheme(context);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ScrollableContent(
        backgroundColor: DigitTheme.instance.colors.light.primary1Bg,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const BackNavigationHelpHeaderWidget(showHelp: true),
                Padding(
                  padding: EdgeInsets.all(spacer4),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      localizations
                          .translate(widget.deviceType.name.toUpperCase()),
                      style: textTheme.headingXl
                          .copyWith(color: theme.colorTheme.primary.primary2),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Lottie.asset(searchingLottie),
                    // This will be the background
                    SvgPicture.asset(
                      peerSearchSvg,
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
                Text(
                  localizations.translate(widget.deviceType == DeviceType.sender
                      ? i18.dataShare.sendActionMessage
                      : i18.dataShare.receiveActionMessage),
                  style: textTheme.bodyL
                      .copyWith(color: theme.colorTheme.text.secondary),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildDeviceListTile(Device device) {
    var connected = device.state == SessionState.connected;
    return Container(
      margin: const EdgeInsets.all(spacer4),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(spacer2)),
          border: Border.all(
              color: connected
                  ? theme.colorTheme.primary.primary1
                  : theme.disabledColor)),
      child: ListTile(
        onTap: () => handleDeviceTap(device),
        selected: connected,
        selectedColor: connected
            ? theme.colorTheme.primary.primaryBg
            : theme.disabledColor,
        selectedTileColor: connected
            ? theme.colorTheme.primary.primaryBg
            : theme.disabledColor,
        leading: Icon(
          connected ? Icons.check_circle : Icons.circle_outlined,
          size: spacer8,
          color: connected
              ? theme.colorTheme.primary.primary1
              : theme.disabledColor,
        ),
        title: Text(
          device.deviceName,
          style: connected
              ? textTheme.headingS
                  .copyWith(color: theme.colorTheme.primary.primary2)
              : textTheme.bodyL
                  .copyWith(color: theme.colorTheme.primary.primary2),
        ),
      ),
    );
  }

  void handleFooterButtonPress() {
    if (connectedDevices.isEmpty) {
      Toast.showToast(
        context,
        message: localizations.translate(i18.dataShare.noDevicesConnected),
        type: ToastType.error,
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
          deviceID: device.deviceId, deviceName: context.loggedInUser.userName);
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
      serviceType: 'DigitShare',
      deviceName: deviceId,
      strategy: Strategy.Wi_Fi_P2P,
      callback: (isRunning) async {
        if (isRunning) {
          if (widget.deviceType == DeviceType.sender) {
            await nearbyService.startBrowsingForPeers();
          } else {
            await nearbyService.startAdvertisingPeer(
              deviceName: context.loggedInUser.userName,
            );
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
        });
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

        _deviceNotifier.value = List.from(
            widget.deviceType == DeviceType.receiver
                ? connectedDevices
                : devices);

        if (_deviceNotifier.value.isNotEmpty &&
            widget.deviceType == DeviceType.receiver) {
          _debounceTimer?.cancel();
          _debounceTimer = Timer(const Duration(milliseconds: 300), () {
            showCustomPopup(
              context: context,
              builder: (BuildContext ctx) => Popup(
                  title: localizations.translate(i18
                          .dataShare.receiverDialogTitle +
                      '{}'.replaceAll('{}', connectedDevices.first.deviceName)),
                  description: localizations.translate(i18
                      .dataShare.receiverDialogDescription
                      .replaceAll('{}', connectedDevices.first.deviceName)),
                  type: PopUpType.alert,
                  onCrossTap: () {
                    nearbyService.disconnectPeer(
                        deviceID: connectedDevices.first.deviceId);
                    Navigator.of(
                      ctx,
                      rootNavigator: true,
                    ).pop();
                  },
                  actions: [
                    DigitButton(
                        label: localizations
                            .translate(i18.dataShare.receiveAction),
                        onPressed: () {
                          Navigator.of(
                            ctx,
                            rootNavigator: true,
                          ).pop();
                          context.router.push(DataReceiverRoute(
                              connectedDevice: connectedDevices.first,
                              nearbyService: nearbyService));
                        },
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large)
                  ]),
            );
          });
        }

        // Show bottom sheet once when devices are available
        if (!_isSheetShown &&
            _deviceNotifier.value.isNotEmpty &&
            widget.deviceType == DeviceType.sender) {
          _debounceTimer?.cancel();
          _debounceTimer = Timer(const Duration(milliseconds: 300), () {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              if (mounted) {
                _isSheetShown = true;

                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: false,
                  isDismissible:
                      widget.deviceType == DeviceType.sender ? false : true,
                  enableDrag: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(spacer4)),
                  ),
                  elevation: 2,
                  showDragHandle: true,
                  builder: (context) {
                    return SafeArea(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Sheet title and close button row
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: spacer4, vertical: spacer3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    localizations.translate(
                                        i18.dataShare.selectRecipients),
                                    style: textTheme.headingL.copyWith(
                                        color:
                                            theme.colorTheme.primary.primary2),
                                  ),
                                ],
                              ),
                            ),

                            // Device list
                            Expanded(
                              child: ValueListenableBuilder<List<Device>>(
                                valueListenable: _deviceNotifier,
                                builder: (context, deviceList, _) {
                                  return ListView.builder(
                                    itemCount:
                                        widget.deviceType == DeviceType.receiver
                                            ? connectedDevices.length
                                            : devices.length,
                                    itemBuilder: (context, index) {
                                      final device = widget.deviceType ==
                                              DeviceType.receiver
                                          ? connectedDevices[index]
                                          : devices[index];
                                      return buildDeviceListTile(device);
                                    },
                                  );
                                },
                              ),
                            ),

                            // Bottom button
                            DigitCard(
                              margin: const EdgeInsets.only(top: spacer4),
                              padding: const EdgeInsets.all(spacer4),
                              children: [
                                DigitButton(
                                  onPressed: handleFooterButtonPress,
                                  type: DigitButtonType.primary,
                                  label: widget.deviceType == DeviceType.sender
                                      ? localizations
                                          .translate(i18.dataShare.sendAction)
                                      : localizations.translate(
                                          i18.dataShare.receiveAction),
                                  size: DigitButtonSize.large,
                                  mainAxisSize: MainAxisSize.max,
                                  capitalizeLetters: false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
                _isSheetShown = false;
              }
            });
          });
        }
      },
    );
  }

  Future<String> getSenderDeviceName() async {
    var deviceId = '';
    final deviceInfo = DeviceInfoPlugin();
    deviceId = Platform.isAndroid
        ? (await deviceInfo.androidInfo).model
        : (await deviceInfo.iosInfo).localizedModel;
    return deviceId;
  }

  void fetchSenderDeviceDetails() async {
    senderDeviceDetails = await getSenderDeviceName();
  }
}
