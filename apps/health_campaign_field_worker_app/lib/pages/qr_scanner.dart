import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../router/app_router.dart';
import '../../utils/utils.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import '../../widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../blocs/scanner/scanner.dart';
import '../blocs/search_households/search_households.dart';
import '../models/entities/scanner_type.dart';

class QRScannerPage extends LocalizedStatefulWidget {
  final bool sinlgleValue;
  final int quantity;
  final bool isGS1code;
  final bool isEditEnabled;

  const QRScannerPage({
    super.key,
    super.appLocalizations,
    required this.quantity,
    required this.isGS1code,
    this.sinlgleValue = false,
    this.isEditEnabled = false,
  });

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends LocalizedState<QRScannerPage> {
  AudioPlayer player = AudioPlayer();
  QRViewController? controller;
  List<GS1Barcode> result = [];
  List<String> codes = [];
  bool manualcode = false;
  bool flashstatus = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final _resourceController = TextEditingController();

  @override
  void initState() {
    if (!widget.isEditEnabled) {
      context.read<ScannerBloc>().add(const ScannerEvent.handleScanner([], []));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<ScannerBloc, ScannerState>(
        builder: (context, state) {
          return !manualcode
              ? Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        controller?.pauseCamera();
                        controller?.resumeCamera();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.green[300],
                        child: _buildQrView(context),
                      ),
                    ),
                    Positioned(
                      top: kPadding * 2,
                      left: kPadding,
                      child: SizedBox(
                        // [TODO: Localization need to be added]
                        child: GestureDetector(
                          onTap: () async {
                            controller?.toggleFlash();
                            var status = await controller?.getFlashStatus();
                            if (status != null) {
                              setState(() {
                                flashstatus = status;
                              });
                            }
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.flashlight_on,
                                color: theme.colorScheme.secondary,
                              ),
                              Text(
                                localizations.translate(
                                  flashstatus
                                      ? i18.deliverIntervention.flashOff
                                      : i18.deliverIntervention.flashOn,
                                ),
                                style: TextStyle(
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // [TODO : Need move to constants]
                    Positioned(
                      top: kPadding * 8,
                      left: MediaQuery.of(context).size.width / 3,
                      width: 250,
                      height: 250,
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        // [TODO: Localization need to be added]
                        child: Text(
                          localizations.translate(
                            i18.deliverIntervention.scannerLabel,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 2.4,
                      left: MediaQuery.of(context).size.width / 4.5,
                      width: 250,
                      height: 250,
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        // [TODO: Localization need to be added]
                        child: Text(
                          localizations.translate(
                            i18.deliverIntervention.manualScan,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 2.2,
                      left: MediaQuery.of(context).size.width / 4,
                      width: 250,
                      height: 250,
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        // [TODO: Localization need to be added]
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              manualcode = true;
                            });
                          },
                          child: Text(
                            localizations.translate(
                              i18.deliverIntervention.manualEnterCode,
                            ),
                            style: TextStyle(
                              color: theme.colorScheme.secondary,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      width: MediaQuery.of(context).size.width,
                      height: kPadding * 12,
                      child: DigitCard(
                        child: DigitElevatedButton(
                          child: Text(localizations
                              .translate(i18.common.coreCommonSubmit)),
                          onPressed: () async {
                            if (widget.isGS1code &&
                                result.length < widget.quantity) {
                              buildDialog();
                            } else {
                              final bloc = context.read<SearchHouseholdsBloc>();

                              final scannerState =
                                  context.read<ScannerBloc>().state;

                              if (scannerState.qrcodes.isNotEmpty) {
                                bloc.add(SearchHouseholdsEvent.searchByTag(
                                  tag: scannerState.qrcodes.first,
                                  projectId: context.projectId,
                                ));
                              }
                              context.router.pop();
                            }
                          },
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: (kPadding * 8),
                      height: widget.isGS1code
                          ? state.barcodes.length < 10
                              ? (state.barcodes.length * 60) + 80
                              : MediaQuery.of(context).size.height / 2
                          : state.qrcodes.length < 10
                              ? (state.qrcodes.length * 60) + 80
                              : MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        margin: const EdgeInsets.all(kPadding),
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: DigitTheme.instance.colorScheme.outline,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                bottom: kPadding * 2,
                                top: kPadding * 2,
                                left: kPadding * 2,
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: widget.isGS1code
                                  ? Text(
                                      '${state.barcodes.length.toString()} ${localizations.translate(i18.deliverIntervention.resourcesScanned)}',
                                      style: theme.textTheme.headlineMedium,
                                    )
                                  : Text(
                                      '${state.qrcodes.length.toString()} ${localizations.translate(i18.deliverIntervention.resourcesScanned)}',
                                      style: theme.textTheme.headlineMedium,
                                    ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: widget.isGS1code
                                    ? state.barcodes.length
                                    : state.qrcodes.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    shape: const Border(),
                                    title: Container(
                                      height: kPadding * 6,
                                      decoration: BoxDecoration(
                                        color: DigitTheme
                                            .instance.colorScheme.background,
                                        border: Border.all(
                                          color: DigitTheme
                                              .instance.colorScheme.outline,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(4.0),
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(kPadding),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            overflow: TextOverflow.ellipsis,
                                            widget.isGS1code
                                                ? state.barcodes[index].elements
                                                    .entries.last.value.data
                                                    .toString()
                                                : state.qrcodes[index]
                                                    .toString(),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                              bottom: kPadding,
                                            ),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              onPressed: () {
                                                final bloc =
                                                    context.read<ScannerBloc>();
                                                if (widget.isGS1code) {
                                                  result = List.from(
                                                    state.barcodes,
                                                  );
                                                  result.removeAt(index);
                                                  setState(() {
                                                    result = result;
                                                  });

                                                  bloc.add(
                                                    ScannerEvent.handleScanner(
                                                      result,
                                                      state.qrcodes,
                                                    ),
                                                  );
                                                } else {
                                                  codes = List.from(
                                                    state.qrcodes,
                                                  );
                                                  codes.removeAt(index);
                                                  setState(() {
                                                    codes = codes;
                                                  });

                                                  bloc.add(
                                                    ScannerEvent.handleScanner(
                                                      state.barcodes,
                                                      codes,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : DigitCard(
                  child: ScrollableContent(
                    header: GestureDetector(
                      onTap: () {
                        setState(() {
                          manualcode = false;
                        });
                      },
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.close),
                      ),
                    ),
                    footer: DigitElevatedButton(
                      child: Text(localizations.translate(
                        i18.deliverIntervention.saveScannedResource,
                      )),
                      onPressed: () async {
                        final bloc = context.read<ScannerBloc>();
                        codes.add(_resourceController.value.text);
                        bloc.add(
                          ScannerEvent.handleScanner(
                            state.barcodes,
                            codes,
                          ),
                        );
                        if (widget.isGS1code &&
                            result.length < widget.quantity) {
                          buildDialog();
                        } else {
                          final bloc = context.read<SearchHouseholdsBloc>();
                          final scannerState =
                              context.read<ScannerBloc>().state;

                          if (scannerState.qrcodes.isNotEmpty || manualcode) {
                            bloc.add(SearchHouseholdsEvent.searchByTag(
                              tag: manualcode
                                  ? _resourceController.value.text
                                  : scannerState.qrcodes.first,
                              projectId: context.projectId,
                            ));
                          }
                          context.router.pop();
                        }
                      },
                    ),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(kPadding),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            localizations.translate(
                              i18.deliverIntervention.manualEnterCode,
                            ),
                            style: theme.textTheme.headlineLarge,
                          ),
                        ),
                      ),
                      Text(localizations.translate(
                        i18.deliverIntervention.manualCodeDescription,
                      )),
                      DigitTextField(
                        label: localizations.translate(
                          i18.deliverIntervention.resourceCode,
                        ),
                        controller: _resourceController,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  void buildDialog() async {
    await DigitDialog.show<bool>(
      context,
      options: DigitDialogOptions(
        titleText: localizations.translate(
          i18.deliverIntervention.scannerDialogTitle,
        ),
        contentText: localizations.translate(
          i18.deliverIntervention.scannerDialogContent,
        ),
        primaryAction: DigitDialogActions(
          label: localizations.translate(
            i18.deliverIntervention.scannerDialogPrimaryAction,
          ),
          action: (ctx) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pop(false);
          },
        ),
        secondaryAction: DigitDialogActions(
          label: localizations.translate(
            i18.deliverIntervention.scannerDialogSecondaryAction,
          ),
          action: (ctx) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pop(true);

            context.router.pop();
          },
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.

    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller

    return Stack(
      children: [
        // [TODO: Localization need to be added]
        const Positioned(top: 500, child: Text('coundnot scan the QR code')),
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            cutOutBottomOffset: 150,
            cutOutWidth: 250,
            cutOutHeight: 250,
          ),
          onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    controller.flipCamera();

    controller.flipCamera();
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) async {
      try {
        controller.pauseCamera();
        final bloc = context.read<ScannerBloc>();

        if (!widget.isGS1code) {
          if (bloc.state.qrcodes.contains(scanData.code)) {
            Future.delayed(const Duration(seconds: 10));
            await handleError(
              controller,
              i18.deliverIntervention.resourceAlreadyScanned,
            );
            Future.delayed(const Duration(seconds: 3));

            return;
          } else {
            await storeCode(scanData.code!, controller);
            Future.delayed(const Duration(seconds: 3));
          }
        } else {
          final parser = GS1BarcodeParser.defaultParser();
          final parsedResult = parser.parse(scanData.code!);
          if (parsedResult.elements.keys.join('') != '01111021') {
            await handleError(
              controller,
              i18.deliverIntervention.scanValidResource,
            );
          } else {
            final alreadyScanned = bloc.state.barcodes.any((element) =>
                element.elements.entries.last.value.data ==
                parsedResult.elements.entries.last.value.data);

            if (alreadyScanned) {
              await handleError(
                controller,
                i18.deliverIntervention.resourceAlreadyScanned,
              );
            } else if (widget.quantity > result.length) {
              await storeValue(parsedResult, controller);
            } else {
              await handleError(
                controller,
                i18.deliverIntervention.scannedResourceCountMisMatch,
              );
            }
          }
        }
      } catch (e) {
        await handleError(controller, i18.deliverIntervention.unableToScan);
      }
    });
  }

  Future handleError(QRViewController controller, String message) async {
    controller.pauseCamera();
    player.play(AssetSource("audio/buzzer.wav"));

    if (player.state == PlayerState.completed || result.isEmpty) {
      DigitToast.show(
        context,
        options: DigitToastOptions(
          localizations.translate(message),
          true,
          Theme.of(context),
        ),
      );
    }
    Future.delayed(const Duration(seconds: 1), () => controller.resumeCamera());
  }

  Future storeCode(String code, QRViewController controller) async {
    player.play(AssetSource("audio/add.wav"));
    final bloc = context.read<ScannerBloc>();
    codes = List.from(bloc.state.qrcodes);
    if (widget.sinlgleValue) {
      codes = [];
    }

    codes.add(code);

    setState(() {
      codes = codes;
    });

    bloc.add(ScannerEvent.handleScanner(
      bloc.state.barcodes,
      codes,
    ));

    Future.delayed(const Duration(seconds: 1), () => controller.resumeCamera());

    return;
  }

  Future storeValue(GS1Barcode scanData, QRViewController controller) async {
    controller.pauseCamera();
    final parsedresult = scanData;
    final bloc = context.read<ScannerBloc>();

    player.play(AssetSource("audio/add.wav"));
    Future.delayed(const Duration(seconds: 3));

    result = List.from(bloc.state.barcodes);
    result.removeDuplicates(
      (element) => element.elements.entries.last.value.data,
    );

    result.add(parsedresult);
    bloc.add(ScannerEvent.handleScanner(result, bloc.state.qrcodes));
    setState(() {
      result = result;
    });
    Future.delayed(const Duration(seconds: 1), () => controller.resumeCamera());

    return;
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        // [TODO: Localization need to be added]
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
