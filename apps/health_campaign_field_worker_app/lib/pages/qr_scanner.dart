import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/localized.dart';
import '../blocs/scanner/scanner.dart';
import '../blocs/search_households/search_bloc_common_wrapper.dart';
import '../blocs/search_households/search_households.dart';
import '../blocs/search_referrals/search_referrals.dart';
import '../models/data_model.dart';
import '../vision_detector_views/detector_view.dart';
import '../vision_detector_views/painters/barcode_detector_painter.dart';

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
  bool manualcode = false;
  bool flashstatus = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final _resourceController = TextEditingController();

  @override
  void initState() {
    initializeCameras();
    if (!widget.isEditEnabled) {
      context.read<ScannerBloc>().add(const ScannerEvent.handleScanner([], []));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isHealthFacilityWorker = context.loggedInUserRoles
        .where((role) => role.code == RolesType.healthFacilityWorker.toValue())
        .toList()
        .isNotEmpty;
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<ScannerBloc, ScannerState>(
        builder: (context, state) {
          return _cameras.isNotEmpty
              ? !manualcode
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
                                  flashstatus ? FlashMode.off : FlashMode.torch,
                                );
                                setState(() {
                                  flashstatus = !flashstatus;
                                });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    flashstatus
                                        ? Icons.flashlight_off
                                        : Icons.flashlight_on,
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
                          top: MediaQuery.of(context).size.width / 7.5,
                          left: MediaQuery.of(context).size.width / 2.6,
                          width: 250,
                          height: 250,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 3,
                            // [TODO: Localization need to be added]
                            child: Text(
                              localizations.translate(
                                i18.deliverIntervention.scannerLabel,
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
                                  i18.deliverIntervention.manualScan,
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
                                context.read<ScannerBloc>().add(
                                    const ScannerEvent.handleScanner([], []));
                                setState(() {
                                  manualcode = true;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: kPadding),
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
                                  final bloc =
                                      context.read<SearchBlocWrapper>();
                                  final hfBloc =
                                      context.read<SearchReferralsBloc>();

                                  final scannerState =
                                      context.read<ScannerBloc>().state;

                                  if (scannerState.qrcodes.isNotEmpty) {
                                    if (isHealthFacilityWorker) {
                                      hfBloc
                                          .add(SearchReferralsEvent.searchByTag(
                                        tag: scannerState.qrcodes.first,
                                        projectId: context.projectId,
                                      ));
                                    } else {
                                      bloc.tagSearchBloc.add(
                                        SearchHouseholdsEvent.searchByTag(
                                          tag: scannerState.qrcodes.first,
                                          projectId: context.projectId,
                                        ),
                                      );
                                    }
                                  }
                                  context.router.pop();
                                }
                              },
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: (kPadding * 7.5),
                          height: widget.isGS1code
                              ? state.barcodes.length < 10
                                  ? (state.barcodes.length * 60) + 80
                                  : MediaQuery.of(context).size.height / 2.2
                              : state.qrcodes.length < 10
                                  ? (state.qrcodes.length * 60) + 80
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
                                                          .barcodes[index]
                                                          .elements
                                                          .entries
                                                          .last
                                                          .value
                                                          .data
                                                          .toString()
                                                      : trimString(state
                                                          .qrcodes[index]
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
                                                      .read<ScannerBloc>();
                                                  if (widget.isGS1code) {
                                                    result = List.from(
                                                      state.barcodes,
                                                    );
                                                    result.removeAt(index);
                                                    setState(() {
                                                      result = result;
                                                    });

                                                    bloc.add(
                                                      ScannerEvent
                                                          .handleScanner(
                                                        result,
                                                        state.qrcodes,
                                                        isReferral:
                                                            isHealthFacilityWorker,
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
                                                      ScannerEvent
                                                          .handleScanner(
                                                        state.barcodes,
                                                        codes,
                                                        isReferral:
                                                            isHealthFacilityWorker,
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
                              manualcode = false;
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
                            final bloc = context.read<ScannerBloc>();
                            codes.add(_resourceController.value.text);
                            bloc.add(
                              ScannerEvent.handleScanner(
                                state.barcodes,
                                codes,
                                isReferral: isHealthFacilityWorker,
                              ),
                            );
                            if (widget.isGS1code &&
                                result.length < widget.quantity) {
                              buildDialog();
                            } else {
                              final bloc = context.read<SearchBlocWrapper>();
                              final scannerState =
                                  context.read<ScannerBloc>().state;
                              final hfBloc =
                                  context.read<SearchReferralsBloc>();

                              if (scannerState.qrcodes.isNotEmpty ||
                                  manualcode) {
                                if (isHealthFacilityWorker) {
                                  hfBloc.add(SearchReferralsEvent.searchByTag(
                                    tag: manualcode
                                        ? _resourceController.value.text
                                        : scannerState.qrcodes.first,
                                    projectId: context.projectId,
                                  ));
                                } else {
                                  bloc.tagSearchBloc
                                      .add(SearchHouseholdsEvent.searchByTag(
                                    tag: manualcode
                                        ? _resourceController.value.text
                                        : scannerState.qrcodes.first,
                                    projectId: context.projectId,
                                  ));
                                }
                              }
                              context.router.pop();
                            }
                          },
                        ),
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              localizations.translate(
                                i18.deliverIntervention.manualEnterCode,
                              ),
                              style: theme.textTheme.headlineLarge,
                            ),
                          ),
                          const SizedBox(
                            height: kPadding * 2,
                          ),
                          Text(localizations.translate(
                            i18.deliverIntervention.manualCodeDescription,
                          )),
                          const SizedBox(
                            height: kPadding * 2,
                          ),
                          DigitTextField(
                            label: localizations.translate(
                              i18.deliverIntervention.resourceCode,
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
        final bloc = context.read<ScannerBloc>();
        if (widget.isGS1code) {
          try {
            final parser = GS1BarcodeParser.defaultParser();
            final parsedResult =
                parser.parse(barcodes.first.displayValue.toString());
            final alreadyScanned = bloc.state.barcodes.any((element) =>
                element.elements.entries.last.value.data ==
                parsedResult.elements.entries.last.value.data);
            if (alreadyScanned) {
              await handleError(
                i18.deliverIntervention.resourceAlreadyScanned,
              );
            } else if (widget.quantity > result.length) {
              await storeValue(parsedResult);
            } else {
              await handleError(
                i18.deliverIntervention.scannedResourceCountMisMatch,
              );
            }
          } catch (e) {
            await handleError(
              i18.deliverIntervention.scannedResourceCountMisMatch,
            );
          }
        } else {
          if (bloc.state.qrcodes.contains(barcodes.first.displayValue)) {
            await handleError(
              i18.deliverIntervention.resourceAlreadyScanned,
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
    bool isHealthFacilityWorker = context.loggedInUserRoles
        .where((role) => role.code == RolesType.healthFacilityWorker.toValue())
        .toList()
        .isNotEmpty;
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
      isReferral: isHealthFacilityWorker,
    ));
    await Future.delayed(
      const Duration(seconds: 5),
    );

    return;
  }

  Future storeValue(
    GS1Barcode scanData,
  ) async {
    bool isHealthFacilityWorker = context.loggedInUserRoles
        .where((role) => role.code == RolesType.healthFacilityWorker.toValue())
        .toList()
        .isNotEmpty;
    final parsedresult = scanData;
    final bloc = context.read<ScannerBloc>();

    player.play(AssetSource("audio/add.wav"));
    await Future.delayed(const Duration(seconds: 3));

    result = List.from(bloc.state.barcodes);
    result.removeDuplicates(
      (element) => element.elements.entries.last.value.data,
    );

    result.add(parsedresult);
    bloc.add(ScannerEvent.handleScanner(
      result,
      bloc.state.qrcodes,
      isReferral: isHealthFacilityWorker,
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
