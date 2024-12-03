import 'package:auto_route/annotations.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';

import '../../blocs/peer_to_peer/peer_to_peer.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';

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
      peerToPeerBloc.add(
          DataReceiverEvent(nearbyService: widget.nearbyService, data: data));
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
    return PopScope(
      onPopInvoked: (pop) {
        if (pop) {
          widget.nearbyService
              .disconnectPeer(deviceID: widget.connectedDevice.deviceId);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              "${localizations.translate(i18.dataShare.connectedTo)} ${widget.connectedDevice.deviceName}"),
        ),
        body: BlocBuilder<PeerToPeerBloc, PeerToPeerState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => const Center(child: CircularProgressIndicator()),
                receivingInProgress: (progress) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.2,
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  DigitTheme
                                      .instance.colors.light.alertSuccess),
                              backgroundColor:
                                  DigitTheme.instance.colors.light.textDisabled,
                              value: progress),
                        ),
                        const SizedBox(height: 16),
                        Text('${(progress * 100).toInt()} / 100')
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
