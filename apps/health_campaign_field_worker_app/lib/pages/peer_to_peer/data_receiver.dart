import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:lottie/lottie.dart';

import '../../blocs/peer_to_peer/peer_to_peer.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/progress_indicator/progress_indicator.dart';

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

  @override
  void initState() {
    super.initState();
    nearbyService = widget.nearbyService;
    peerToPeerBloc = context.read<PeerToPeerBloc>();
    nearbyService.dataReceivedSubscription(callback: (data) {
      peerToPeerBloc.add(DataReceiverEvent(
          nearbyService: widget.nearbyService,
          data: data,
          selectedBoundaryCode: context.boundary.code!,
          projectId: context.projectId));
    });
    nearbyService.stateChangedSubscription(callback: (devices) {
      for (var device in devices) {
        if (device.state == SessionState.notConnected) {
          if (mounted) {
            context.router.maybePop();
            Toast.showToast(
              context,
              message: localizations.translate(
                  '${device.deviceName} ${SessionState.notConnected.toString().toUpperCase()}'),
              type: ToastType.error,
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    nearbyService.stopAdvertisingPeer();
    nearbyService.disconnectPeer(deviceID: widget.connectedDevice.deviceId);
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
            if (state is FailedDataTransfer) {
              Toast.showToast(
                context,
                message: localizations.translate(state.error),
                type: ToastType.error,
                position: ToastPosition.aboveOneButtonFooter,
              );
            }
          },
          child: BlocBuilder<PeerToPeerBloc, PeerToPeerState>(
            builder: (context, state) {
              return ScrollableContent(
                  enableFixedDigitButton: true,
                  header: const BackNavigationHelpHeaderWidget(
                    showHelp: true,
                  ),
                  footer: DigitCard(
                      margin: const EdgeInsets.only(top: spacer2),
                      padding: const EdgeInsets.all(spacer2),
                      children: [
                        DigitButton(
                          capitalizeLetters: false,
                          type: DigitButtonType.primary,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () {
                            context.router.replaceAll([HomeRoute()]);
                          },
                          label: localizations
                              .translate(i18.common.coreCommonGoHome),
                          size: DigitButtonSize.large,
                        ),
                      ]),
                  slivers: [
                    SliverToBoxAdapter(
                        child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: spacer4),
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
                          margin: const EdgeInsets.all(spacer4),
                          child: state.maybeWhen(
                            orElse: () => DigitCard(
                              children: [
                                Center(
                                  child: Lottie.asset(receiveData,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15),
                                ),
                                Center(
                                  child: Text(
                                    localizations.translate(
                                        i18.dataShare.receivingActionMessage),
                                    style: textTheme.headingM.copyWith(
                                        color: DigitTheme
                                            .instance.colors.light.primary2),
                                  ),
                                ),
                                const Center(
                                  child: Padding(
                                      padding: EdgeInsets.all(spacer2),
                                      child: ProgressIndicatorContainer(
                                        value: 0,
                                        label: '',
                                        prefixLabel: '',
                                        suffixLabel: '',
                                        height: spacer3,
                                        radius: spacer4,
                                      )),
                                ),
                              ],
                            ),
                            receivingInProgress: (progress, offset, totalCount,
                                receivedBoundaries) {
                              return Column(
                                children: [
                                  DigitCard(children: [
                                    Center(
                                      child: Lottie.asset(receiveData,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15),
                                    ),
                                    Center(
                                      child: Text(
                                        localizations.translate(i18
                                            .dataShare.receivingActionMessage),
                                        style: textTheme.headingM.copyWith(
                                            color: DigitTheme.instance.colors
                                                .light.primary2),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                          padding:
                                              const EdgeInsets.all(spacer2),
                                          child: ProgressIndicatorContainer(
                                            value: progress,
                                            label: '',
                                            prefixLabel: '',
                                            suffixLabel: '',
                                            height: spacer3,
                                            radius: spacer4,
                                          )),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: spacer4,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: DigitCard(
                                        children: receivedBoundaries.isNotEmpty
                                            ? [
                                                Text(
                                                  localizations.translate(i18
                                                      .dataShare
                                                      .dateReceivedForBoundaries),
                                                  style: textTheme.headingM
                                                      .copyWith(
                                                          color: DigitTheme
                                                              .instance
                                                              .colors
                                                              .light
                                                              .primary2),
                                                ),
                                                ...receivedBoundaries.map((e) =>
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          localizations
                                                              .translate(e),
                                                          style: textTheme.bodyS
                                                              .copyWith(
                                                                  color: DigitTheme
                                                                      .instance
                                                                      .colors
                                                                      .light
                                                                      .primary2),
                                                        ),
                                                        const DigitDivider(
                                                          dividerType:
                                                              DividerType.small,
                                                        )
                                                      ],
                                                    ))
                                              ]
                                            : [
                                                Text(
                                                  localizations.translate(i18
                                                      .dataShare
                                                      .noBoundariesMatchedTitle),
                                                  style: textTheme.headingM
                                                      .copyWith(
                                                          color: DigitTheme
                                                              .instance
                                                              .colors
                                                              .light
                                                              .primary2),
                                                ),
                                                Text(
                                                  localizations.translate(i18
                                                      .dataShare
                                                      .noBoundariesMatchedDesc),
                                                  style: textTheme.bodyS
                                                      .copyWith(
                                                          color: DigitTheme
                                                              .instance
                                                              .colors
                                                              .light
                                                              .primary2),
                                                ),
                                              ]),
                                  )
                                ],
                              );
                            },
                            dataReceived: (receivedBoundaries) => Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  DigitCard(children: [
                                    Center(
                                      child: Lottie.asset(downloadSuccess,
                                          repeat: false,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15),
                                    ),
                                    Center(
                                      child: Text(
                                        localizations.translate(i18
                                            .dataShare.receivedSuccessMessage),
                                        style: textTheme.headingM.copyWith(
                                            color: DigitTheme.instance.colors
                                                .light.primary2),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                          padding:
                                              const EdgeInsets.all(spacer2),
                                          child: ProgressIndicatorContainer(
                                            value: 1,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              theme.colorTheme.alert.success,
                                            ),
                                            label: '',
                                            prefixLabel: '',
                                            suffixLabel: '',
                                            height: spacer3,
                                            radius: spacer4,
                                          )),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: spacer2,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: DigitCard(children: [
                                      Text(
                                        localizations.translate(
                                            receivedBoundaries.isNotEmpty
                                                ? i18.dataShare
                                                    .dateReceivedForBoundaries
                                                : i18.dataShare
                                                    .noBoundariesMatchedTitle),
                                        style: textTheme.headingM.copyWith(
                                            color: DigitTheme.instance.colors
                                                .light.primary2),
                                      ),
                                      ...receivedBoundaries.map((e) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                localizations.translate(e),
                                                style: textTheme.bodyS.copyWith(
                                                    color: DigitTheme.instance
                                                        .colors.light.primary2),
                                              ),
                                              const DigitDivider(
                                                dividerType: DividerType.small,
                                              )
                                            ],
                                          )),
                                      if (receivedBoundaries.isEmpty)
                                        Text(
                                          localizations.translate(i18.dataShare
                                              .noBoundariesMatchedDesc),
                                          style: textTheme.bodyS.copyWith(
                                              color: DigitTheme.instance.colors
                                                  .light.primary2),
                                        ),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                            failedToReceive: (message) => DigitCard(
                              children: [
                                Center(
                                    child: Lottie.asset(receiveData,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15)),
                                Center(
                                  child: Text(
                                    localizations.translate(
                                        i18.dataShare.failedToReceive),
                                    style: textTheme.headingM.copyWith(
                                        color: DigitTheme
                                            .instance.colors.light.alertError),
                                  ),
                                ),
                                const SizedBox(height: spacer2),
                                Center(
                                  child: Text(
                                    localizations.translate(i18
                                        .dataShare.failedToReceiveDescription),
                                    style: textTheme.bodyS.copyWith(
                                        color: theme.colorTheme.text.secondary),
                                  ),
                                ),
                                const Center(
                                  child: Padding(
                                      padding: EdgeInsets.all(spacer2),
                                      child: ProgressIndicatorContainer(
                                        value: 0.7,
                                        label: '',
                                        prefixLabel: '',
                                        suffixLabel: '',
                                        height: spacer3,
                                        radius: spacer4,
                                      )),
                                ),
                              ],
                            ),
                          )),
                    ]))
                  ]);
            },
          ),
        ));
  }
}
