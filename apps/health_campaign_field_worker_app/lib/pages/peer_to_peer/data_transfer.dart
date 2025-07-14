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
class DataTransferPage extends LocalizedStatefulWidget {
  final List<Device> connectedDevices;
  final NearbyService nearbyService;

  const DataTransferPage(
      {super.key, required this.nearbyService, required this.connectedDevices});

  @override
  State<DataTransferPage> createState() => _DataTransferScreenState();
}

class _DataTransferScreenState extends LocalizedState<DataTransferPage> {
  late NearbyService nearbyService;
  late PeerToPeerBloc peerToPeerBloc;

  @override
  void initState() {
    super.initState();
    nearbyService = widget.nearbyService;
    peerToPeerBloc = context.read<PeerToPeerBloc>();
    peerToPeerBloc.add(DataTransferEvent(
        connectedDevice: widget.connectedDevices,
        nearbyService: nearbyService,
        selectedBoundaryCode: context.boundary.code ?? '',
        selectedProject: context.selectedProject.id));
    nearbyService.stateChangedSubscription(callback: (devices) {
      for (var device in devices) {
        if (device.state == SessionState.notConnected) {
          if (mounted) {
            if (!devices.any((e) => e.state == SessionState.connected)) {
              context.router.maybePop();
            }
            Toast.showToast(
              context,
              message: localizations.translate(
                  '${device.deviceName} ${SessionState.notConnected.name}'),
              type: ToastType.error,
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return PopScope(
      onPopInvoked: (pop) {
        for (var e in widget.connectedDevices) {
          nearbyService.disconnectPeer(deviceID: e.deviceId);
        }
      },
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
                    label: localizations.translate(i18.common.coreCommonGoHome),
                    size: DigitButtonSize.large,
                  ),
                ]),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: spacer2),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          localizations.translate(i18.dataShare.sendAction),
                          style: textTheme.headingM,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(spacer2),
                        child: state.maybeWhen(
                          orElse: () => Center(
                            child: DigitCard(
                              children: [
                                Center(
                                  child: Lottie.asset(dataTransfer,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15),
                                ),
                                Center(
                                  child: Text(
                                    localizations.translate(
                                        i18.dataShare.sendingActionMessage),
                                    style: textTheme.label.copyWith(
                                        color: DigitTheme
                                            .instance.colors.light.primary1),
                                  ),
                                ),
                                const SizedBox(height: spacer4),
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
                          ),
                          transferInProgress: (progress, offset, totalCount) =>
                              SizedBox(
                            child: DigitCard(
                              children: [
                                Center(
                                  child: Lottie.asset(dataTransfer,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15),
                                ),
                                Center(
                                  child: Text(
                                    localizations.translate(
                                        i18.dataShare.sendingActionMessage),
                                    style: textTheme.headingM.copyWith(
                                        color: DigitTheme
                                            .instance.colors.light.primary2),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(spacer2),
                                      child: ProgressIndicatorContainer(
                                        value: progress,
                                        label: '',
                                        prefixLabel: '',
                                        suffixLabel: '',
                                        height: spacer3,
                                        radius: spacer4,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          completedDataTransfer: () => Center(
                            child: DigitCard(
                              children: [
                                Center(
                                  child: Lottie.asset(downloadSuccess,
                                      repeat: false,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15),
                                ),
                                Center(
                                  child: Text(
                                    localizations.translate(
                                        i18.dataShare.dataTransferCompleted),
                                    style: textTheme.headingM.copyWith(
                                        color: DigitTheme
                                            .instance.colors.light.primary2),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(spacer2),
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
                              ],
                            ),
                          ),
                          failedToTransfer: (message) => DigitCard(
                            children: [
                              Center(
                                  child: Lottie.asset(failedLottie,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15)),
                              Center(
                                child: Text(
                                  localizations.translate(
                                      i18.dataShare.failedToTransfer),
                                  style: textTheme.headingM.copyWith(
                                      color: DigitTheme
                                          .instance.colors.light.alertError),
                                ),
                              ),
                              const SizedBox(height: spacer4),
                              Center(
                                child: Text(
                                  localizations.translate(i18
                                      .dataShare.failedToTransferDescription),
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
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
