import 'package:attendance_management/utils/date_util_attendance.dart';
import 'package:attendance_management/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/utils/utils.dart';
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
import '../blocs/app_localization.dart';
import '../models/entities/attendance_register.dart';
import '../models/entities/attendee.dart';
import '../models/entities/scanned_individual_data.dart';

@RoutePage()
class AttendanceDigitScannerPage extends DigitScannerPage {
  final AttendanceRegisterModel registerModel;
  final void Function(
    ScannedIndividualDataModel scannedUser,
    AttendanceValidationResult result,
  ) onScanResult;

  const AttendanceDigitScannerPage(
      {super.key,
      required this.registerModel,
      required this.onScanResult,
      required super.quantity,
      super.singleValue,
      required super.isGS1code});

  @override
  AttendanceScannerPageState createState() => AttendanceScannerPageState();
}

class AttendanceScannerPageState extends DigitScannerPageState {
  static const _manualCodeFormKey = 'manualCode';
  late final AttendanceRegisterModel registerModel;
  static const _reasonKey = 'reason';
  static const _reasonCommentKey = 'reasonComment';

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
  Future<void> handleErrorWrapper(String message) {
    return super.handleErrorWrapper(i18.attendance.qrAlreadyScanned);
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
                  showManualAttendanceReasonDialog(
                      context: context,
                      reasonList: AttendanceSingleton()
                          .manualAttendanceReasons
                          .reversed
                          .toList());
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
  Future<void> storeCodeWrapper(String code) async {
    try {
      final scannedData = ScannedIndividualDataModelMapper.fromMap(
          DataMapEncryptor.decrypt(code));

      if (validateIndividualAttendance(scannedData, registerModel).isValid) {
        if (scannedData.manualEntry == null ||
            scannedData.manualEntry == false) {
          showAttendanceSuccessPopup(scannedData);
        }
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
    } catch (e) {
      if (mounted) {
        context.read<DigitScannerBloc>().add(
              const DigitScannerEvent.handleScanner(
                barCode: [],
                qrCode: [],
              ),
            );
        Toast.showToast(
          context,
          type: ToastType.error,
          message: localizations.translate(i18.attendance.attendeeNotFound),
        );
      }
      if (kDebugMode) {
        print("Error decoding QR code: $e");
      }
      rethrow;
    }

    return super.storeCodeWrapper(code);
  }

  AttendanceValidationResult validateIndividualAttendance(
    ScannedIndividualDataModel scannedData,
    AttendanceRegisterModel registerModel, {
    int allowedIntervalInMinutes = 2,
    BuildContext? context,
  }) {
    var callBack = widget as AttendanceDigitScannerPage;

    // Manual entry: only check attendee presence
    if (scannedData.manualEntry == true) {
      final found = _isAttendeeInRegister(scannedData, registerModel.attendees);
      var callBack = widget as AttendanceDigitScannerPage;

      callBack.onScanResult(
          scannedData,
          AttendanceValidationResult(
            isValid: found,
            errorMessage: found ? null : i18.attendance.attendeeNotFound,
          ));
      return AttendanceValidationResult(
        isValid: found,
        errorMessage: found ? null : i18.attendance.attendeeNotFound,
      );
    }

    final int? qrCreatedTimeMillis = scannedData.qrCreatedTime;
    if (qrCreatedTimeMillis == null) {
      callBack.onScanResult(
          scannedData,
          AttendanceValidationResult(
            isValid: false,
            errorMessage: i18.attendance.userQRTimeExpiredError,
          ));
      return AttendanceValidationResult(
        isValid: false,
        errorMessage: i18.attendance.userQRTimeExpiredError,
      );
    }

    final int currentTimeMillis = DateTime.now().millisecondsSinceEpoch;
    final Duration timeDifference = Duration(
      milliseconds: (currentTimeMillis - qrCreatedTimeMillis).abs(),
    );

    final int allowedTimeInMillis = allowedIntervalInMinutes * 60 * 1000;

    if (kDebugMode) {
      print("Now (ms): $currentTimeMillis");
      print("QR (ms): $qrCreatedTimeMillis");
      print(
          "Time Difference: ${timeDifference.inMinutes} min ${timeDifference.inSeconds % 60} sec");
      print("Allowed Time: ${allowedTimeInMillis ~/ 60000} min");
    }

    if (timeDifference.inMilliseconds > allowedTimeInMillis) {
      callBack.onScanResult(
          scannedData,
          AttendanceValidationResult(
            isValid: false,
            errorMessage: i18.attendance.userQRTimeExpiredError,
          ));
      return AttendanceValidationResult(
        isValid: false,
        errorMessage: i18.attendance.userQRTimeExpiredError,
      );
    }

    // Attendee validation
    final found = _isAttendeeInRegister(scannedData, registerModel.attendees);
    if (!found) {
      callBack.onScanResult(
          scannedData,
          AttendanceValidationResult(
            isValid: false,
            errorMessage: i18.attendance.attendeeNotFound,
          ));
      return AttendanceValidationResult(
        isValid: false,
        errorMessage: i18.attendance.attendeeNotFound,
      );
    }

    return AttendanceValidationResult(isValid: true);
  }

// Helper: Check if individual exists in attendees list
  bool _isAttendeeInRegister(
      ScannedIndividualDataModel ind, List<AttendeeModel>? attendees) {
    if (ind.individualId == null ||
        ind.individualId!.isEmpty ||
        attendees == null ||
        attendees.isEmpty) {
      return false;
    }

    final found = attendees.any((a) => a.individualNumber == ind.individualId);
    if (found) {
      var callBack = widget as AttendanceDigitScannerPage;

      callBack.onScanResult(
          ind,
          AttendanceValidationResult(
            isValid: found,
            errorMessage: found ? null : i18.attendance.attendeeNotFound,
          ));
      if (kDebugMode) {
        print("Individual (ID: ${ind.individualId}) found in register.");
      }
    }

    return found;
  }

  Future<Map<String, String>?> showManualAttendanceReasonDialog({
    required BuildContext context,
    required List<DropdownItem> reasonList,
  }) async {
    final localizations = AttendanceLocalization.of(context);

    final form = fb.group(<String, Object>{
      _reasonKey: FormControl<String>(validators: [Validators.required]),
      _reasonCommentKey: FormControl<String>(),
    });

    return showDialog<Map<String, String>>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ReactiveForm(
              formGroup: form,
              child: Popup(
                title: localizations
                    .translate(i18.attendance.reasonForManualAttendance),
                type: PopUpType.alert,
                description: localizations.translate(
                  i18.attendance.reasonForManualAttendanceDesc,
                ),
                additionalWidgets: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReactiveWrapperField(
                        formControlName: _reasonKey,
                        showErrors: (control) =>
                            control.invalid && control.touched,
                        validationMessages: {
                          'required': (_) => localizations.translate(
                                i18.common.corecommonRequired,
                              ),
                        },
                        builder: (field) => LabeledField(
                          label: localizations
                              .translate(i18.attendance.selectReason),
                          capitalizedFirstLetter: false,
                          isRequired: true,
                          child: DigitDropdown<String>(
                            selectedOption:
                                (form.control(_reasonKey).value != null)
                                    ? DropdownItem(
                                        name: localizations.translate(
                                            form.control(_reasonKey).value),
                                        code: form.control(_reasonKey).value)
                                    : const DropdownItem(name: '', code: ''),
                            items: reasonList,
                            onSelect: (value) {
                              form.control(_reasonKey).markAsTouched();
                              form.control(_reasonKey).value = value.code;
                              setState(() {
                                form.control(_reasonKey).value = value.code;

                                if (form.control(_reasonKey).value ==
                                    'OTHERS') {
                                  form
                                      .control(_reasonCommentKey)
                                      .setValidators([Validators.required]);
                                } else {
                                  form
                                      .control(_reasonCommentKey)
                                      .clearValidators();
                                }
                                form
                                    .control(_reasonCommentKey)
                                    .updateValueAndValidity();
                              });
                            },
                            emptyItemText: localizations
                                .translate(i18.common.noMatchFound),
                            errorMessage: field.errorText,
                          ),
                        ),
                      ),
                      if (form.control(_reasonKey).value == 'OTHERS') ...[
                        const SizedBox(
                          height: spacer2,
                        ),
                        ReactiveWrapperField(
                          formControlName: _reasonCommentKey,
                          showErrors: (control) =>
                              control.invalid && control.touched,
                          validationMessages: {
                            'required': (object) => localizations.translate(
                                i18.attendance.validationRequiredError),
                          },
                          builder: (field) => LabeledField(
                            capitalizedFirstLetter: false,
                            label:
                                localizations.translate(i18.common.commentKey),
                            isRequired: true,
                            child: DigitTextAreaFormInput(
                              errorMessage: field.errorText,
                              maxLine: 3,
                              onChange: (value) {
                                form.control(_reasonCommentKey).markAsTouched();
                                setState(() {
                                  form.control(_reasonCommentKey).value = value;
                                });
                              },
                              initialValue:
                                  form.control(_reasonCommentKey).value,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
                actions: [
                  DigitButton(
                    label: localizations
                        .translate(i18.attendance.markAttendanceManually),
                    type: DigitButtonType.primary,
                    size: DigitButtonSize.large,
                    isDisabled: !form.valid,
                    onPressed: () {
                      form.markAllAsTouched();
                      if (form.valid) {
                        final reason =
                            form.control(_reasonKey).value?.toString() ?? '';
                        final reasonComment = reason == 'OTHERS'
                            ? form
                                    .control(_reasonCommentKey)
                                    .value
                                    ?.toString() ??
                                ''
                            : null;

                        final Map<String, String> result = {
                          'isManualScan': true.toString(),
                          _reasonKey: reason,
                          if (reason == 'OTHERS' && reasonComment != null)
                            _reasonCommentKey: reasonComment,
                        };
                        Navigator.of(ctx).pop();

                        Navigator.of(context).pop(result);
                      } else {
                        form.control(_reasonCommentKey).markAllAsTouched();
                      }
                    },
                  ),
                  DigitButton(
                    label: localizations.translate(i18.common.coreCommonBack),
                    type: DigitButtonType.tertiary,
                    size: DigitButtonSize.medium,
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void showAttendanceSuccessPopup(ScannedIndividualDataModel scannedData) {
    final formattedTime = scannedData.qrCreatedTime != null
        ? AttendanceDateTimeManagement.getDateFromTimestamp(
            scannedData.qrCreatedTime!)
        : '-';

    showCustomPopup(
      context: context,
      builder: (ctx) => Popup(
        type: PopUpType.alert,
        titleIcon: Icon(
          Icons.check_circle,
          size: spacer12,
          color: const DigitColors().light.alertSuccess,
        ),
        onCrossTap: () => Navigator.of(ctx).pop(),
        title: localizations.translate(i18.attendance.markedAsPresent),
        additionalWidgets: [
          LabelValueSummary(
            items: [
              LabelValueItem(
                label: localizations.translate(i18.common.coreCommonName),
                labelFlex: 5,
                value: scannedData.name,
              ),
              LabelValueItem(
                label: localizations.translate(i18.common.coreCommonAge),
                labelFlex: 5,
                value: scannedData.age?.toString() ?? '-',
              ),
              LabelValueItem(
                label: localizations.translate(i18.attendance.qrCreatedTime),
                labelFlex: 5,
                value: formattedTime,
              ),
              LabelValueItem(
                label: localizations.translate(i18.attendance.individualId),
                labelFlex: 5,
                value: scannedData.individualId,
              ),
              LabelValueItem(
                label: localizations.translate(i18.common.locationLabel),
                labelFlex: 5,
                value: scannedData.locality,
              ),
            ],
          ),
        ],
        actions: [
          DigitButton(
            capitalizeLetters: false,
            label: localizations.translate(i18.attendance.scanAnotherQR),
            onPressed: () => Navigator.of(ctx).pop(),
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
          ),
          DigitButton(
            capitalizeLetters: false,
            label:
                localizations.translate(i18.attendance.backToAttendanceManager),
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
                      codes.add(DataMapEncryptor().encryptWithRandomKey(
                          ScannedIndividualDataModel(
                                  manualEntry: true,
                                  individualId:
                                      form.control(_manualCodeFormKey).value)
                              .toMap()));
                      storeCodeWrapper(DataMapEncryptor().encryptWithRandomKey(
                          ScannedIndividualDataModel(
                                  manualEntry: true,
                                  individualId:
                                      form.control(_manualCodeFormKey).value)
                              .toMap()));
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

class AttendanceValidationResult {
  final bool isValid;
  final String? errorMessage;

  AttendanceValidationResult({required this.isValid, this.errorMessage});
}
