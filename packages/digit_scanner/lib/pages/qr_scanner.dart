import 'dart:io';

import 'package:camera/camera.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_scanner/utils/extensions/extensions.dart';
import 'package:digit_scanner/widgets/localized.dart';
import 'package:digit_scanner/widgets/vision_detector_views/painters/barcode_detector_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../blocs/scanner.dart';
import '../widgets/vision_detector_views/detector_view.dart';

class DigitScannerPage extends LocalizedStatefulWidget {
  final bool singleValue;
  final int quantity;
  final bool isGS1code;
  final bool isEditEnabled;

  const DigitScannerPage({
    super.key,
    super.appLocalizations,
    required this.quantity,
    required this.isGS1code,
    this.singleValue = false,
    this.isEditEnabled = false,
  });

  @override
  State<DigitScannerPage> createState() => _DigitScannerPageState();
}

class _DigitScannerPageState extends LocalizedState<DigitScannerPage> {
  final BarcodeScanner _barcodeScanner = BarcodeScanner();
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  var _cameraLensDirection = CameraLensDirection.back;
  CameraController? _cameraController;
  static List<CameraDescription> _cameras = [];
  int _cameraIndex = -1;
  List<GS1Barcode> result = [];
  List<String> codes = [];
  bool manualCode = false;
  bool flashStatus = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final _resourceController = TextEditingController();

  @override
  void initState() {
    initializeCameras();
    if (!widget.isEditEnabled) {
      context
          .read<DigitScannerBloc>()
          .add(const DigitScannerEvent.handleScanner());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<DigitScannerBloc, DigitScannerState>(
        builder: (context, state) {
          return _cameras.isNotEmpty
              ? !manualCode
                  ? Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.green[300],
                          child: DetectorView(
                            cameraController: _cameraController,
                            cameras: _cameras,
                            title: 'Barcode Scanner',
                            customPaint: _customPaint,
                            text: _text,
                            onImage: _processImage,
                            initialCameraLensDirection: _cameraLensDirection,
                            onCameraLensDirectionChanged: (value) =>
                                _cameraLensDirection = value,
                          ),
                        ),
                        Positioned(
                          top: kPadding * 1.5,
                          left: kPadding,
                          child: SizedBox(
                            child: InkWell(
                              onTap: () async {
                                _cameraController?.setFlashMode(
                                  flashStatus ? FlashMode.off : FlashMode.torch,
                                );
                                setState(() {
                                  flashStatus = !flashStatus;
                                });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    flashStatus
                                        ? Icons.flashlight_off
                                        : Icons.flashlight_on,
                                    color: theme.colorScheme.secondary,
                                  ),
                                  Text(
                                    localizations.translate(
                                      flashStatus
                                          ? i18.scanner.flashOff
                                          : i18.scanner.flashOn,
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
                          top: MediaQuery.of(context).size.width / 7.5,
                          left: MediaQuery.of(context).size.width / 2.6,
                          width: 250,
                          height: 250,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 3,
                            child: Text(
                              localizations.translate(
                                i18.scanner.scannerLabel,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 2.4,
                          left: MediaQuery.of(context).size.width / 5,
                          width: 300,
                          height: 250,
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(top: kPadding),
                              child: Text(
                                localizations.translate(
                                  i18.scanner.manualScan,
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: MediaQuery.of(context).size.height / 2.2,
                          left: MediaQuery.of(context).size.width / 5,
                          width: 250,
                          height: 50,
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                context.read<DigitScannerBloc>().add(
                                      const DigitScannerEvent.handleScanner(
                                        barCode: [],
                                        qrCode: [],
                                      ),
                                    );
                                setState(() {
                                  manualCode = true;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: kPadding),
                                child: Text(
                                  localizations.translate(
                                    i18.scanner.enterManualCode,
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
                        ),

                        Positioned(
                          bottom: 0,
                          width: MediaQuery.of(context).size.width,
                          child: DigitCard(
                            margin: const EdgeInsets.only(top: kPadding),
                            padding: const EdgeInsets.fromLTRB(
                                kPadding, 0, kPadding, 0),
                            child: DigitElevatedButton(
                              child: Text(localizations
                                  .translate(i18.common.coreCommonSubmit)),
                              onPressed: () async {
                                if (widget.isGS1code &&
                                    result.length < widget.quantity) {
                                  buildDialog();
                                } else {
                                  // final bloc =
                                  //     context.read<SearchBlocWrapper>();
                                  // final hfBloc =
                                  //     context.read<SearchReferralsBloc>();

                                  final bloc = context.read<DigitScannerBloc>();
                                  bloc.add(DigitScannerEvent.handleScanner(
                                    barCode: state.barCodes,
                                    qrCode: state.qrCodes,
                                  ));
                                  Navigator.of(
                                    context,
                                  ).pop();
                                }
                              },
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: (kPadding * 7.5),
                          height: widget.isGS1code
                              ? state.barCodes.length < 10
                                  ? (state.barCodes.length * 60) + 80
                                  : MediaQuery.of(context).size.height / 2.2
                              : state.qrCodes.length < 10
                                  ? (state.qrCodes.length * 60) + 80
                                  : MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            width: 100,
                            height: 120,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
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
                                      topLeft: Radius.circular(kPadding * 2),
                                      topRight: Radius.circular(kPadding * 2),
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(
                                    bottom: kPadding * 2,
                                    top: kPadding * 2,
                                    left: kPadding * 3,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: widget.isGS1code
                                      ? Text(
                                          '${state.barCodes.length.toString()} ${localizations.translate(i18.scanner.resourcesScanned)}',
                                          style: theme.textTheme.headlineMedium,
                                        )
                                      : Text(
                                          '${state.qrCodes.length.toString()} ${localizations.translate(i18.scanner.resourcesScanned)}',
                                          style: theme.textTheme.headlineMedium,
                                        ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: widget.isGS1code
                                        ? state.barCodes.length
                                        : state.qrCodes.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        shape: const Border(),
                                        title: Container(
                                          margin: const EdgeInsets.only(
                                            left: kPadding,
                                            right: kPadding,
                                          ),
                                          height: kPadding * 6,
                                          decoration: BoxDecoration(
                                            color: DigitTheme.instance
                                                .colorScheme.background,
                                            border: Border.all(
                                              color: DigitTheme
                                                  .instance.colorScheme.outline,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(4.0),
                                            ),
                                          ),
                                          padding:
                                              const EdgeInsets.all(kPadding),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  widget.isGS1code
                                                      ? state
                                                          .barCodes[index]
                                                          .elements
                                                          .entries
                                                          .last
                                                          .value
                                                          .data
                                                          .toString()
                                                      : trimString(state
                                                          .qrCodes[index]
                                                          .toString()),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 24,
                                                ),
                                                onPressed: () {
                                                  final bloc = context
                                                      .read<DigitScannerBloc>();
                                                  if (widget.isGS1code) {
                                                    result = List.from(
                                                      state.barCodes,
                                                    );
                                                    result.removeAt(index);
                                                    setState(() {
                                                      result = result;
                                                    });

                                                    bloc.add(
                                                      DigitScannerEvent
                                                          .handleScanner(
                                                        barCode: result,
                                                        qrCode: state.qrCodes,
                                                      ),
                                                    );
                                                  } else {
                                                    codes = List.from(
                                                      state.qrCodes,
                                                    );
                                                    codes.removeAt(index);
                                                    setState(() {
                                                      codes = codes;
                                                    });

                                                    bloc.add(
                                                      DigitScannerEvent
                                                          .handleScanner(
                                                        barCode: state.barCodes,
                                                        qrCode: codes,
                                                      ),
                                                    );
                                                  }
                                                },
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
                        backgroundColor: Colors.white,
                        header: GestureDetector(
                          onTap: () {
                            setState(() {
                              manualCode = false;
                              initializeCameras();
                            });
                          },
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.close),
                          ),
                        ),
                        footer: DigitElevatedButton(
                          child: Text(localizations.translate(
                            i18.common.coreCommonSubmit,
                          )),
                          onPressed: () async {
                            final bloc = context.read<DigitScannerBloc>();
                            codes.add(_resourceController.value.text);
                            bloc.add(
                              DigitScannerEvent.handleScanner(
                                barCode: state.barCodes,
                                qrCode: codes,
                              ),
                            );
                            if (widget.isGS1code &&
                                result.length < widget.quantity) {
                              buildDialog();
                            }
                          },
                        ),
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              localizations.translate(
                                i18.scanner.enterManualCode,
                              ),
                              style: theme.textTheme.headlineLarge,
                            ),
                          ),
                          const SizedBox(
                            height: kPadding * 2,
                          ),
                          Text(localizations.translate(
                            i18.scanner.manualCodeDescription,
                          )),
                          const SizedBox(
                            height: kPadding * 2,
                          ),
                          DigitTextField(
                            label: localizations.translate(
                              i18.scanner.resourceCode,
                            ),
                            controller: _resourceController,
                          ),
                        ],
                      ),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
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
          i18.scanner.scannerDialogTitle,
        ),
        contentText: localizations.translate(
          i18.scanner.scannerDialogContent,
        ),
        primaryAction: DigitDialogActions(
          label: localizations.translate(
            i18.scanner.scannerDialogPrimaryAction,
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
            i18.scanner.scannerDialogSecondaryAction,
          ),
          action: (ctx) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pop(true);

            Navigator.of(
              context,
            ).pop();
          },
        ),
      ),
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final barcodes = await _barcodeScanner.processImage(inputImage);

    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      if (barcodes.isNotEmpty) {
        final bloc = context.read<DigitScannerBloc>();
        if (widget.isGS1code) {
          try {
            final parser = GS1BarcodeParser.defaultParser();
            final parsedResult =
                parser.parse(barcodes.first.displayValue.toString());
            final alreadyScanned = bloc.state.barCodes.any((element) =>
                element.elements.entries.last.value.data ==
                parsedResult.elements.entries.last.value.data);
            if (alreadyScanned) {
              await handleError(
                i18.scanner.resourceAlreadyScanned,
              );
            } else if (widget.quantity > result.length) {
              await storeValue(parsedResult);
            } else {
              await handleError(
                i18.scanner.scannedResourceCountMisMatch,
              );
            }
          } catch (e) {
            await handleError(
              i18.scanner.invalidResourceCode,
            );
          }
        } else {
          if (bloc.state.qrCodes.contains(barcodes.first.displayValue)) {
            await handleError(
              i18.scanner.resourceAlreadyScanned,
            );
            return;
          } else {
            await storeCode(barcodes.first.displayValue.toString());
          }
        }
      }

      final painter = BarcodeDetectorPainter(
        barcodes,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection,
      );
      _customPaint = CustomPaint(painter: painter);
    } else {
      String text = 'Barcodes found: ${barcodes.length}\n\n';
      for (final barcode in barcodes) {
        text += 'Barcode: ${barcode.rawValue}\n\n';
      }
      _text = text;
      // TODO: set _customPaint to draw boundingRect on top of image
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

// need to remove this

  Future handleError(String message) async {
    // player.play(AssetSource("audio/buzzer.wav"));

    if (result.isEmpty) {
      DigitToast.show(
        context,
        options: DigitToastOptions(
          localizations.translate(message),
          true,
          Theme.of(context),
        ),
      );
    }
    await Future.delayed(
      const Duration(seconds: 2),
    );
    setState(() {
      _canProcess = true;
      _isBusy = false;
    });
  }

  Future storeCode(
    String code,
  ) async {
    final bloc = context.read<DigitScannerBloc>();
    codes = List.from(bloc.state.qrCodes);
    if (widget.singleValue) {
      codes = [];
    }

    codes.add(code);

    setState(() {
      codes = codes;
    });

    bloc.add(DigitScannerEvent.handleScanner(
      barCode: bloc.state.barCodes,
      qrCode: codes,
    ));
    await Future.delayed(
      const Duration(seconds: 5),
    );

    return;
  }

  Future storeValue(
    GS1Barcode scanData,
  ) async {
    final parsedResult = scanData;
    final bloc = context.read<DigitScannerBloc>();

    await Future.delayed(const Duration(seconds: 3));

    result = List.from(bloc.state.barCodes);
    result.removeDuplicates(
      (element) => element.elements.entries.last.value.data,
    );

    result.add(parsedResult);
    bloc.add(DigitScannerEvent.handleScanner(
      barCode: result,
      qrCode: bloc.state.qrCodes,
    ));
    setState(() {
      result = result;
    });
    await Future.delayed(
      const Duration(seconds: 5),
    );

    return;
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _barcodeScanner.close();
    super.dispose();
  }

  String trimString(String input) {
    return input.length > 20 ? '${input.substring(0, 20)}...' : input;
  }

  void initializeCameras() async {
    if (_cameras.isEmpty) {
      _cameras = await availableCameras();
    }
    for (var i = 0; i < _cameras.length; i++) {
      if (_cameras[i].lensDirection == _cameraLensDirection) {
        setState(() {
          _cameraIndex = i;
        });
        break;
      }
    }
    var camera = _cameras[_cameraIndex];
    _cameraController = CameraController(
      camera,
      // Set to ResolutionPreset.high. Do NOT set it to ResolutionPreset.max because for some phones does NOT work.
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
  }
}
