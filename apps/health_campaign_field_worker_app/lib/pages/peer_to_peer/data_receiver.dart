import 'package:attendance_management/widgets/back_navigation_help_header.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:lottie/lottie.dart';

import '../../blocs/peer_to_peer/peer_to_peer.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
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
                  .popAndPush(AcknowledgementRoute(isDataRecordSuccess: false));
            }
            // if (state is FailedDataTransfer) {
            //   Toast.showToast(
            //     context,
            //     message: localizations.translate(state.error),
            //     type: ToastType.error,
            //     position: ToastPosition.aboveOneButtonFooter,
            //   );
            //   context.router.maybePop();
            // }
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
                        DigitButton(
                          type: DigitButtonType.primary,
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () {
                            context.router.maybePop();
                          },
                          label: localizations
                              .translate(i18.common.coreCommonGoback),
                          size: DigitButtonSize.large,
                        ),
                      ]),
                  slivers: [
                    SliverToBoxAdapter(
                        child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(spacer2),
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
                          color: DigitTheme.instance.colors.light.paperPrimary,
                          margin: const EdgeInsets.all(spacer4),
                          child: state.maybeWhen(
                            orElse: () => Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(receiveData,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15),
                                  Text(
                                    localizations.translate(
                                        i18.dataShare.receivingActionMessage),
                                    style: textTheme.headingM.copyWith(
                                        color: DigitTheme
                                            .instance.colors.light.primary2),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.all(spacer2),
                                      child: ProgressIndicatorContainer(
                                        value: 0,
                                        label: '',
                                        prefixLabel: '',
                                        suffixLabel: '',
                                        height: spacer3,
                                        radius: spacer4,
                                      )),
                                ],
                              ),
                            ),
                            receivingInProgress:
                                (progress, offset, totalCount) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Lottie.asset(receiveData,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15),
                                    Text(
                                      localizations.translate(
                                          i18.dataShare.receivingActionMessage),
                                      style: textTheme.headingM.copyWith(
                                          color: DigitTheme
                                              .instance.colors.light.primary2),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(spacer2),
                                        child: ProgressIndicatorContainer(
                                          value: progress,
                                          label: '',
                                          prefixLabel: '',
                                          suffixLabel: '',
                                          height: spacer3,
                                          radius: spacer4,
                                        )),
                                  ],
                                ),
                              );
                            },
                            failedToReceive: (message) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Lottie.asset(receiveData),
                                Text(
                                  localizations
                                      .translate(i18.dataShare.failedToReceive),
                                  style: textTheme.headingM.copyWith(
                                      color: DigitTheme
                                          .instance.colors.light.alertError),
                                ),
                                const SizedBox(height: spacer4),
                                Text(
                                  localizations.translate(
                                      i18.dataShare.failedToTransfer),
                                  style: textTheme.bodyS.copyWith(
                                      color: DigitTheme.instance.colors.light
                                          .paperSecondary),
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
