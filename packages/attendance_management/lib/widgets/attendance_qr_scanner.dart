import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:digit_scanner/utils/scanner_utils.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/TextTheme/digit_text_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../models/entities/attendance_register.dart';
import '../models/entities/attendee.dart';

@RoutePage()
class AttendanceDigitScannerPage extends DigitScannerPage {
  final AttendanceRegisterModel registerModel;

  const AttendanceDigitScannerPage(
      {super.key,
      required this.registerModel,
      required super.quantity,
      super.singleValue,
      required super.isGS1code});

  @override
  AttendanceScannerPageState createState() => AttendanceScannerPageState();
}

class AttendanceScannerPageState extends DigitScannerPageState {
  static const _manualCodeFormKey = 'manualCode';
  late final AttendanceRegisterModel registerModel;

  @override
  void initState() {
    final specificWidget = widget as AttendanceDigitScannerPage;
    registerModel = specificWidget.registerModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseScanner = super.build(context);
    return baseScanner;
  }

  @override
  scanWidget(BuildContext context, ThemeData theme, DigitTextTheme textTheme,
      DigitScannerState state) {
    // TODO: implement scanWidget
    return super.scanWidget(context, theme, textTheme, state);
  }

  @override
  overlayForManualEntry(ThemeData theme, DigitTextTheme textTheme) {
    return Align(
      alignment: Alignment.center,
      widthFactor: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: spacer8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: spacer1),
              child: Text(
                  localizations.translate(
                    i18.attendance.manualScanLabel,
                  ),
                  style: textTheme.bodyL
                      .copyWith(color: theme.colorTheme.paper.primary)),
            ),
            DigitButton(
                label: localizations.translate(
                  i18.attendance.enterUniqueCode,
                ),
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
                type: DigitButtonType.link,
                size: DigitButtonSize.large),
            Padding(
              padding: const EdgeInsets.only(top: spacer1),
              child: Text(
                  localizations.translate(
                    i18.common.coreCommonOr,
                  ),
                  style: textTheme.bodyL
                      .copyWith(color: theme.colorTheme.paper.primary)),
            ),
            DigitButton(
                label: localizations.translate(
                  i18.attendance.markAttendanceManually,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                type: DigitButtonType.link,
                size: DigitButtonSize.large),
          ],
        ),
      ),
    );
  }

  @override
  renderScannedResource(
      ThemeData theme, DigitTextTheme textTheme, DigitScannerState state) {
    // NOTE: To hide the camera controls
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        color: theme.cardColor,
      ),
    );
  }

  @override
  Future<void> storeCodeWrapper(String code) {
    Map<String, dynamic> decodedData = jsonDecode(code) as Map<String, dynamic>;
    if (validateIndividualAttendance(decodedData, registerModel)) {
      showAttendanceSuccessPopup(jsonDecode(code));
    } else {
      if (mounted) {
        context.read<DigitScannerBloc>().add(
              const DigitScannerEvent.handleScanner(
                barCode: [],
                qrCode: [],
              ),
            );
      }
    }
    return super.storeCodeWrapper(code);
  }

  bool validateIndividualAttendance(
    Map<String, dynamic> scannedData,
    AttendanceRegisterModel registerModel,
  ) {
    // 1. Extract required IDs from scanned data
    final String? scannedIndividualId = scannedData['individualId'];
    final String? scannedRegisterId = scannedData['registerId'];
    final int? qrCreatedTimeMillis =
        scannedData['qrCreatedTime']; // Get QR creation time

    // 2. Basic validation: Ensure both IDs are present in scanned data
    if (scannedIndividualId == null ||
        scannedIndividualId.isEmpty ||
        scannedRegisterId == null ||
        scannedRegisterId.isEmpty) {
      if (kDebugMode) {
        print("Scanned data missing 'individualId' or 'registerId'.");
      }
      return false;
    }

    // // 3. Validate QR creation time
    // final currentTimeMillis = DateTime.now().millisecondsSinceEpoch;
    // final timeDifference =
    //     (currentTimeMillis - qrCreatedTimeMillis!).abs(); // Absolute difference
    //
    // const oneMinuteInMillis = 2 * 60 * 1000; // 2 minute in milliseconds
    //
    // if (timeDifference > oneMinuteInMillis) {
    //   if (mounted) {
    //     Toast.showToast(
    //       context,
    //       type: ToastType.error,
    //       message:
    //           localizations.translate(i18.attendance.userQRTimeExpiredError),
    //     );
    //   }
    //   return false;
    // } else {}

    // 4. Check if the registerModel has an attendees list and it's not empty
    if (registerModel.attendees == null || registerModel.attendees!.isEmpty) {
      if (kDebugMode) {
        print(
            "AttendanceRegisterModel has no attendees or attendees list is empty.");
      }
      return false;
    }

    // 5. Iterate through the attendees list to find a match
    for (AttendeeModel attendee in registerModel.attendees!) {
      if (attendee.individualId == scannedIndividualId &&
          attendee.registerId == scannedRegisterId) {
        if (kDebugMode) {
          print(
              "Individual (ID: $scannedIndividualId) found in register (ID: $scannedRegisterId).");
        }
        return true; // Match found
      }
    }

    if (kDebugMode) {
      print(
          "Individual (ID: $scannedIndividualId) not found in register (ID: $scannedRegisterId) attendees.");
    }
    return false; // No match found after checking all attendees
  }

  void showAttendanceSuccessPopup(Map<String, dynamic> code) {
    showCustomPopup(
      context: context,
      builder: (ctx) => Popup(
        type: PopUpType.alert,
        titleIcon: Icon(
          Icons.check_circle,
          color: const DigitColors().light.alertSuccess,
        ),
        onCrossTap: () => Navigator.of(ctx).pop(),
        title: i18.attendance.markedAsPresent,
        additionalWidgets: [
          LabelValueSummary(
            heading: "",
            items: code.entries
                .map((e) =>
                    LabelValueItem(label: e.key, value: e.value.toString()))
                .toList(),
          ),
        ],
        actions: [
          DigitButton(
            label: i18.attendance.scanAnotherQR,
            onPressed: () => Navigator.of(ctx).pop(),
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
          ),
          DigitButton(
            label: i18.attendance.backToAttendanceManager,
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            type: DigitButtonType.secondary,
            size: DigitButtonSize.large,
          ),
        ],
      ),
    );
  }

  @override
  manualEntryWidget(
      BuildContext context, ThemeData theme, DigitTextTheme textTheme) {
    return BlocBuilder<DigitScannerBloc, DigitScannerState>(
        builder: (context, state) {
      return ReactiveFormBuilder(
          form: () => buildForm(),
          builder: (context, form, child) {
            return ScrollableContent(
              backgroundColor: theme.colorScheme.onError,
              header: GestureDetector(
                onTap: () {
                  setState(() {
                    manualCode = false;
                    initializeCameras();
                  });
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).colorTheme.text.primary,
                  ),
                ),
              ),
              footer: Padding(
                padding: const EdgeInsets.all(spacer4),
                child: DigitButton(
                  mainAxisSize: MainAxisSize.max,
                  onPressed: () async {
                    if (form.control(_manualCodeFormKey).value == null ||
                        form
                            .control(_manualCodeFormKey)
                            .value
                            .toString()
                            .trim()
                            .isEmpty) {
                      Toast.showToast(
                        context,
                        type: ToastType.error,
                        message: localizations
                            .translate(i18.attendance.enterUniqueCode),
                      );
                    } else {
                      final bloc = context.read<DigitScannerBloc>();
                      codes.add(form.control(_manualCodeFormKey).value);
                      bloc.add(
                        DigitScannerEvent.handleScanner(
                          barCode: state.barCodes,
                          qrCode: codes,
                        ),
                      );
                      Navigator.of(
                        context,
                      ).pop();
                      if (widget.isGS1code && result.length < widget.quantity) {
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
                  type: DigitButtonType.primary,
                  size: DigitButtonSize.large,
                  label: localizations.translate(
                    i18.common.coreCommonSubmit,
                  ),
                ),
              ),
              children: [
                DigitCard(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      localizations.translate(
                        i18.attendance.enterUniqueCode,
                      ),
                      style: textTheme.headingL.copyWith(
                        color: theme.colorTheme.text.primary,
                      ),
                    ),
                  ),
                  ReactiveWrapperField(
                    formControlName: _manualCodeFormKey,
                    builder: (field) {
                      return InputField(
                          label: localizations.translate(
                            i18.attendance.uniqueCodeLabel,
                          ),
                          errorMessage: field.errorText,
                          isRequired: true,
                          type: InputType.text,
                          onChange: (value) {
                            form.control(_manualCodeFormKey).value = value;
                          });
                    },
                  ),
                ])
              ],
            );
          });
    });
  }
}
