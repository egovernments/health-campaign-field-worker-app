import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_scanner/utils/scanner_utils.dart';
import 'package:digit_scanner/widgets/localized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:digit_scanner/utils/i18_key_constants.dart' as i18;
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/widgets/vision_detector_views/detector_view.dart';

@RoutePage()
class CustomDigitScannerPage extends LocalizedStatefulWidget {
  final bool singleValue;
  final int quantity;
  final bool isGS1code;
  final bool isEditEnabled;

  const CustomDigitScannerPage({
    super.key,
    super.appLocalizations,
    required this.quantity,
    required this.isGS1code,
    this.singleValue = false,
    this.isEditEnabled = false,
  });

  @override
  State<CustomDigitScannerPage> createState() => _CustomDigitScannerPageState();
}

class _CustomDigitScannerPageState
    extends LocalizedState<CustomDigitScannerPage> {
  final BarcodeScanner _barcodeScanner = BarcodeScanner();
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  var _cameraLensDirection = CameraLensDirection.back;
  AudioPlayer player = AudioPlayer();
  CameraController? _cameraController;
  static List<CameraDescription> _cameras = [];
  int _cameraIndex = -1;
  List<GS1Barcode> result = [];
  List<String> codes = [];
  bool manualCode = false;
  bool flashStatus = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  static const _manualCodeFormKey = 'manualCode';

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
                          color: theme.colorScheme.onSurfaceVariant
                              .withOpacity(0.5),
                          child: DetectorView(
                            cameraController: _cameraController,
                            cameras: _cameras,
                            title: localizations
                                .translate(i18.scanner.barCodeScannerLabel),
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
                              style: TextStyle(
                                color: theme.colorScheme.onError,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        if (widget.isGS1code)
                          const SizedBox.shrink()
                        else
                          Align(
                            alignment: Alignment.center,
                            widthFactor: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: kPadding),
                                  child: Text(
                                    localizations.translate(
                                      i18.scanner.manualScan,
                                    ),
                                    style: TextStyle(
                                      color: theme.colorScheme.onError,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                TextButton(
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
                                    padding:
                                        const EdgeInsets.only(top: kPadding),
                                    child: Text(
                                      localizations.translate(
                                        i18.scanner.enterManualCode,
                                      ),
                                      style: TextStyle(
                                        color: theme.colorScheme.secondary,
                                        fontSize: theme
                                            .textTheme.headlineMedium?.fontSize,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                                  DigitScannerUtils().buildDialog(
                                    context,
                                    localizations,
                                    widget.quantity,
                                  );
                                } else {
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
                              ? state.barCodes.length < 3
                                  ? (state.barCodes.length * 60) + 80
                                  : MediaQuery.of(context).size.height / 3
                              : state.qrCodes.length < 2
                                  ? ((state.qrCodes.length + 1) * 60)
                                  : MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            width: 100,
                            height: 120,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onError,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(kPadding + 4),
                                topRight: Radius.circular(kPadding + 4),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.onError,
                                    borderRadius: const BorderRadius.only(
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
                                                      : DigitScannerUtils()
                                                          .trimString(state
                                                              .qrCodes[index]
                                                              .toString()),
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  color:
                                                      theme.colorScheme.error,
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
                  : BlocBuilder<DigitScannerBloc, DigitScannerState>(
                      builder: (context, state) {
                      return ReactiveFormBuilder(
                          form: () => buildForm(),
                          builder: (context, form, child) {
                            return DigitCard(
                              child: ScrollableContent(
                                backgroundColor: theme.colorScheme.onError,
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
                                  onPressed: () async {
                                    if (form
                                                .control(_manualCodeFormKey)
                                                .value ==
                                            null ||
                                        form
                                            .control(_manualCodeFormKey)
                                            .value
                                            .toString()
                                            .trim()
                                            .isEmpty) {
                                      DigitToast.show(context,
                                          options: DigitToastOptions(
                                            localizations.translate(
                                                i18.scanner.enterManualCode),
                                            true,
                                            theme,
                                          ));
                                    } else {
                                      final bloc =
                                          context.read<DigitScannerBloc>();
                                      codes.add(form
                                          .control(_manualCodeFormKey)
                                          .value);
                                      bloc.add(
                                        DigitScannerEvent.handleScanner(
                                          barCode: state.barCodes,
                                          qrCode: codes,
                                        ),
                                      );
                                      if (widget.isGS1code &&
                                          result.length < widget.quantity) {
                                        DigitScannerUtils().buildDialog(
                                          context,
                                          localizations,
                                          widget.quantity,
                                        );
                                      }

                                      setState(() {
                                        manualCode = false;
                                        initializeCameras();
                                      });
                                    }
                                  },
                                  child: Text(localizations.translate(
                                    i18.common.coreCommonSubmit,
                                  )),
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
                                  DigitTextFormField(
                                    formControlName: _manualCodeFormKey,
                                    label: localizations.translate(
                                      i18.scanner.resourceCode,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    })
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    await DigitScannerUtils().processImage(
      context: context,
      inputImage: inputImage,
      canProcess: _canProcess,
      isBusy: _isBusy,
      setBusy: (busy) => mounted ? setState(() => _isBusy = busy) : null,
      setText: (text) => mounted ? setState(() => _text = text) : null,
      updateCustomPaint: (customPaint) => _customPaint = customPaint,
      isGS1code: widget.isGS1code,
      quantity: widget.quantity,
      result: result,
      handleError: handleErrorWrapper,
      storeValue: storeValueWrapper,
      storeCode: storeCodeWrapper,
      cameraLensDirection: _cameraLensDirection,
      barcodeScanner: _barcodeScanner,
      localizations: localizations,
    );
  }

  Future<void> handleErrorWrapper(String message) async {
    await DigitScannerUtils().handleError(
      context: context,
      message: message,
      player: player,
      result: result,
      setStateCallback: () {
        setState(() {
          _canProcess = true;
          _isBusy = false;
        });
      },
      localizations: localizations,
    );
  }

  Future<void> storeCodeWrapper(String code) async {
    await DigitScannerUtils().storeCode(
      context: context,
      code: code,
      player: player,
      singleValue: widget.singleValue,
      updateCodes: (newCodes) {
        setState(() {
          codes = newCodes;
        });
      },
      initialCodes: codes,
    );
  }

  Future<void> storeValueWrapper(GS1Barcode scanData) async {
    await DigitScannerUtils().storeValue(
      context: context,
      scanData: scanData,
      player: player,
      updateResult: (newResult) {
        setState(() {
          result = newResult;
        });
      },
      initialResult: result,
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _barcodeScanner.close();
    super.dispose();
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

  FormGroup buildForm() {
    return fb
        .group(<String, Object>{_manualCodeFormKey: FormControl<String>()});
  }
}
