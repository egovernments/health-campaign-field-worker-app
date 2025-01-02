import 'dart:io';

import 'package:attendance_management/widgets/back_navigation_help_header.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../blocs/peer_to_peer/peer_to_peer.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../../widgets/peer_to_peer/file_transfer_animation.dart';
import '../../widgets/showcase/showcase_wrappers.dart';

@RoutePage()
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
  late PeerToPeerBloc peerToPeerBloc;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  @override
  void initState() {
    super.initState();
    nearbyService = widget.nearbyService;
    peerToPeerBloc = context.read<PeerToPeerBloc>();
    nearbyService.dataReceivedSubscription(callback: (data) {
      peerToPeerBloc.add(
          DataReceiverEvent(nearbyService: widget.nearbyService, data: data));
    });
    nearbyService.stateChangedSubscription(callback: (devices) {
      for (var device in devices) {
        if (device.state == SessionState.notConnected) {
          if (mounted) {
            context.router.maybePop();
            DigitToast.show(context,
                options: DigitToastOptions(
                    localizations.translate(
                        '${device.deviceName} ${SessionState.notConnected.name}'),
                    true,
                    Theme.of(context)));
          }
        }
      }
    });
  }

  @override
  void dispose() {
    nearbyService.stopAdvertisingPeer();
    nearbyService.stopBrowsingForPeers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return PopScope(
        onPopInvoked: (pop) {},
        child: BlocListener<PeerToPeerBloc, PeerToPeerState>(
          listener: (context, state) {
            if (state is DataReceived) {
              context.router
                  .popAndPush(AcknowledgementRoute(isDataRecordSuccess: true));
            }
          },
          child: BlocBuilder<PeerToPeerBloc, PeerToPeerState>(
            builder: (context, state) {
              return ScrollableContent(
                  header: const BackNavigationHelpHeaderWidget(
                    showHelp: true,
                  ),
                  footer: DigitCard(
                      margin: const EdgeInsets.only(top: spacer2),
                      padding: const EdgeInsets.all(spacer2),
                      children: [
                        Button(
                          type: ButtonType.secondary,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () {
                            context.router.maybePop();
                          },
                          label: localizations
                              .translate(i18.common.coreCommonCancel),
                          size: ButtonSize.large,
                        ),
                      ]),
                  slivers: [
                    SliverToBoxAdapter(
                        child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(kPadding),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            localizations
                                .translate(i18.dataShare.receiveAction),
                            style: textTheme.headingM,
                          ),
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          color: DigitTheme.instance.colors.light.paperPrimary,
                          margin: const EdgeInsets.all(kPadding),
                          child: state.maybeWhen(
                              orElse: () => Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 16),
                                        CircularPercentIndicator(
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          lineWidth: kPadding * 1.5,
                                          animation: false,
                                          percent: 0,
                                          // Update this dynamically for progress
                                          center: const Text(
                                            '0 %',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),

                                          progressBorderColor: DigitTheme
                                              .instance.colors.light.primary1Bg,
                                          progressColor: DigitTheme.instance
                                              .colors.light.alertSuccess,
                                          backgroundColor: DigitTheme
                                              .instance.colors.light.primary1Bg,
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FileTransferAnimation(),
                                            // Add animation here
                                          ],
                                        ),
                                        Wrap(
                                            spacing: 8.0,
                                            runSpacing: 4.0,
                                            children: [
                                              // buildDeviceChip(),
                                              Container(
                                                padding: const EdgeInsets.all(
                                                    kPadding),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: DigitTheme
                                                        .instance
                                                        .colors
                                                        .light
                                                        .primary1Bg,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          kPadding),
                                                ),
                                                child: Text(
                                                  widget.connectedDevice
                                                      .deviceName,
                                                  style: TextStyle(
                                                    color: DigitTheme.instance
                                                        .colors.light.primary2,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ],
                                    ),
                                  ),
                              receivingInProgress:
                                  (progress, offset, totalCount) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('Receiving $offset / $totalCount'),
                                      const SizedBox(height: 16),
                                      CircularPercentIndicator(
                                        radius:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        lineWidth: kPadding * 1.5,
                                        animation: false,
                                        percent: progress,
                                        // Update this dynamically for progress
                                        center: Text(
                                          '${(progress * 100).toStringAsFixed(1)} %',
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),

                                        progressBorderColor: DigitTheme
                                            .instance.colors.light.primary1Bg,
                                        progressColor: DigitTheme
                                            .instance.colors.light.alertSuccess,
                                        backgroundColor: DigitTheme
                                            .instance.colors.light.primary1Bg,
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FileTransferAnimation(),
                                          // Add animation here
                                        ],
                                      ),
                                      Wrap(
                                          spacing: 8.0,
                                          runSpacing: 4.0,
                                          children: [
                                            buildDeviceChip(),
                                            const SizedBox(width: 8),
                                            Container(
                                              padding: const EdgeInsets.all(
                                                  kPadding),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: DigitTheme.instance
                                                      .colors.light.primary1Bg,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        kPadding),
                                              ),
                                              child: Text(
                                                widget
                                                    .connectedDevice.deviceName,
                                                style: TextStyle(
                                                  color: DigitTheme.instance
                                                      .colors.light.primary2,
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ],
                                  ),
                                );
                              })),
                    ]))
                  ]);
            },
          ),
        ));
  }

  Future<String> getCurrentDeviceName() async {
    var deviceId = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.model;
    }
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.localizedModel;
    }
    return deviceId;
  }

  Widget buildDeviceChip() {
    return FutureBuilder<String>(
      future: getCurrentDeviceName(), // Call your async method here
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while the future is being resolved
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle error case
          return Chip(
            label: Text(localizations.translate(i18.common.coreCommonNA)),
            backgroundColor: DigitTheme.instance.colors.light.primary1Bg,
          );
        } else if (snapshot.hasData) {
          // Display the device name when available
          return Container(
            padding: const EdgeInsets.all(kPadding),
            decoration: BoxDecoration(
              border: Border.all(
                color: DigitTheme.instance.colors.light.primary1Bg,
              ),
              borderRadius: BorderRadius.circular(kPadding),
            ),
            child: Text(
              snapshot.data!,
              style: TextStyle(
                color: DigitTheme.instance.colors.light.primary2,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink(); // Handle unexpected case
        }
      },
    );
  }
}
