import 'package:attendance_management/widgets/back_navigation_help_header.dart';
import 'package:auto_route/annotations.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';

import '../../blocs/peer_to_peer/peer_to_peer.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../../widgets/showcase/showcase_wrappers.dart';

@RoutePage()
class DataTransferPage extends LocalizedStatefulWidget {
  final List<Device> connectedDevice;
  final NearbyService nearbyService;

  const DataTransferPage(
      {super.key, required this.nearbyService, required this.connectedDevice});

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
        connectedDevice: widget.connectedDevice, nearbyService: nearbyService));
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
      onPopInvoked: (pop) {},
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
                  onPressed: () {},
                  label: localizations.translate(i18.common.coreCommonCancel),
                  size: ButtonSize.large,
                ),
              ]),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(kPadding),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        localizations.translate(i18.dataShare.sendAction),
                        style: textTheme.headingM,
                      ),
                    ),
                  ),
                  Material(
                    child: Column(
                      children: [
                        state.maybeWhen(
                            orElse: () => Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    DigitTheme.instance.colors
                                                        .light.alertSuccess),
                                            backgroundColor: DigitTheme.instance
                                                .colors.light.textDisabled,
                                            value: 0),
                                      ),
                                    ],
                                  ),
                                ),
                            transferInProgress: (progress) => Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  DigitTheme.instance.colors
                                                      .light.alertSuccess),
                                          backgroundColor: DigitTheme.instance
                                              .colors.light.textDisabled,
                                          value: progress),
                                    ),
                                    const SizedBox(height: 16),
                                    Button(
                                      onPressed: () {
                                        context.read<PeerToPeerBloc>().add(
                                            DataTransferEvent(
                                                nearbyService: nearbyService,
                                                connectedDevice:
                                                    widget.connectedDevice));
                                      },
                                      size: ButtonSize.large,
                                      label: localizations.translate(
                                          i18.common.coreCommonRetry),
                                      type: ButtonType.primary,
                                    ),
                                  ],
                                ),
                            failedToTransfer: (error) => Center(
                                  child: Button(
                                    onPressed: () {
                                      context.read<PeerToPeerBloc>().add(
                                          DataTransferEvent(
                                              nearbyService: nearbyService,
                                              connectedDevice:
                                                  widget.connectedDevice));
                                    },
                                    size: ButtonSize.large,
                                    label: localizations
                                        .translate(i18.common.coreCommonRetry),
                                    type: ButtonType.primary,
                                  ),
                                ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
