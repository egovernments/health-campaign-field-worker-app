library app_utils;

import 'dart:async';
import 'dart:io';

import 'package:attendance_management/attendance_management.dart'
    as attendance_mappers;
import 'package:complaints/complaints.init.dart' as complaints_mappers;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/digit_dialog.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_data_model/data_model.init.dart' as data_model_mappers;
import 'package:digit_dss/digit_dss.dart' as dss_mappers;
import 'package:disable_battery_optimization/disable_battery_optimization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/inventory_management.init.dart'
    as inventory_mappers;
import 'package:isar/isar.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart'
    as referral_reconciliation_mappers;
import 'package:registration_delivery/registration_delivery.init.dart'
    as registration_delivery_mappers;
import 'package:survey_form/survey_form.init.dart' as survey_form_mappers;

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/projects_beneficiary_downsync/project_beneficiaries_downsync.dart';
import '../data/local_store/app_shared_preferences.dart';
import '../data/local_store/no_sql/schema/localization.dart';
import '../data/local_store/secure_store/secure_store.dart';
import '../models/app_config/app_config_model.dart';
import '../models/data_model.init.dart';
import '../router/app_router.dart';
import '../widgets/progress_indicator/progress_indicator.dart';
import 'constants.dart';
import 'extensions/extensions.dart';

export 'app_exception.dart';
export 'constants.dart';
export 'extensions/extensions.dart';

class CustomValidator {
  /// Validates that control's value must be `true`
  static Map<String, dynamic>? requiredMin(
    AbstractControl<dynamic> control,
  ) {
    return control.value == null ||
            control.value.toString().length >= 2 ||
            control.value.toString().trim().isEmpty
        ? null
        : {'required': true};
  }

  static Map<String, dynamic>? validMobileNumber(
    AbstractControl<dynamic> control,
  ) {
    if (control.value == null || control.value.toString().isEmpty) {
      return null;
    }

    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    if (RegExp(pattern).hasMatch(control.value.toString())) return null;

    if (control.value.toString().length < 10) return {'mobileNumber': true};

    return {'mobileNumber': true};
  }
}

Future<void> requestDisableBatteryOptimization() async {
  bool isIgnoringBatteryOptimizations =
      await DisableBatteryOptimization.isBatteryOptimizationDisabled ?? false;

  if (!isIgnoringBatteryOptimizations) {
    await DisableBatteryOptimization.showDisableBatteryOptimizationSettings();
  }
}

setBgRunning(bool isBgRunning) async {
  final localSecureStore = LocalSecureStore.instance;
  await localSecureStore.setBackgroundService(isBgRunning);
}

performBackgroundService({
  BuildContext? context,
  required bool stopService,
  required bool isBackground,
}) async {
  final connectivityResult = await (Connectivity().checkConnectivity());

  final isOnline = connectivityResult.firstOrNull == ConnectivityResult.wifi ||
      connectivityResult.firstOrNull == ConnectivityResult.mobile;
  final service = FlutterBackgroundService();
  var isRunning = await service.isRunning();

  if (stopService) {
    if (isRunning) {
      if (!isBackground && context != null) {
        if (context.mounted) {
          DigitToast.show(
            context,
            options: DigitToastOptions(
              'Background Service Stopped',
              true,
              DigitTheme.instance.mobileTheme,
            ),
          );
        }
      }
    }
  } else {
    if (!isRunning && isOnline) {
      service.startService();
      if (context != null && context.mounted) {
        requestDisableBatteryOptimization();
        DigitToast.show(
          context,
          options: DigitToastOptions(
            'Background Service Started',
            false,
            DigitTheme.instance.mobileTheme,
          ),
        );
      }
    }
  }
}

String maskString(String input) {
  // Define the character to use for masking (e.g., "*")
  const maskingChar = '*';

  // Create a new string with the same length as the input string
  final maskedString =
      List<String>.generate(input.length, (index) => maskingChar).join();

  return maskedString;
}

List<MdmsMasterDetailModel> getMasterDetailsModel(List<String> masterNames) {
  return masterNames.map((e) => MdmsMasterDetailModel(e)).toList();
}

Timer makePeriodicTimer(
  Duration duration,
  void Function(Timer timer) callback, {
  bool fireNow = false,
}) {
  var timer = Timer.periodic(duration, callback);
  if (fireNow) {
    callback(timer);
  }

  return timer;
}

final requestData = {
  "data": [
    {
      "id": 1,
      "name": "John Doe",
      "age": 30,
      "email": "johndoe@example.com",
      "address": {
        "street": "123 Main Street",
        "city": "New York",
        "state": "NY",
        "zipcode": "10001",
      },
      "orders": [
        {
          "id": 101,
          "product": "Widget A",
          "quantity": 2,
          "price": 10.99,
        },
        {
          "id": 102,
          "product": "Widget B",
          "quantity": 1,
          "price": 19.99,
        },
      ],
    },
    {
      "id": 2,
      "name": "Jane Smith",
      "age": 25,
      "email": "janesmith@example.com",
      "address": {
        "street": "456 Elm Street",
        "city": "Los Angeles",
        "state": "CA",
        "zipcode": "90001",
      },
      "orders": [
        {
          "id": 201,
          "product": "Widget C",
          "quantity": 3,
          "price": 15.99,
        },
        {
          "id": 202,
          "product": "Widget D",
          "quantity": 2,
          "price": 12.99,
        },
      ],
    },
    // ... Repeat the above structure to reach approximately 100KB in size
  ],
};

Future<bool> getIsConnected() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }

    return false;
  } on SocketException catch (_) {
    return false;
  }
}

void showDownloadDialog(
  BuildContext context, {
  required DownloadBeneficiary model,
  required DigitProgressDialogType dialogType,
  bool isPop = true,
  StreamController<double>? downloadProgressController,
}) {
  if (isPop) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  switch (dialogType) {
    case DigitProgressDialogType.failed:
    case DigitProgressDialogType.checkFailed:
      DigitSyncDialog.show(
        context,
        type: DigitSyncDialogType.failed,
        label: model.title,
        primaryAction: DigitDialogActions(
          label: model.primaryButtonLabel ?? '',
          action: (ctx) {
            if (dialogType == DigitProgressDialogType.failed ||
                dialogType == DigitProgressDialogType.checkFailed) {
              Navigator.of(context, rootNavigator: true).pop();
              context.read<BeneficiaryDownSyncBloc>().add(
                    DownSyncGetBatchSizeEvent(
                      appConfiguration: [model.appConfiguartion!],
                      projectId: context.projectId,
                      boundaryCode: model.boundary,
                      pendingSyncCount: model.pendingSyncCount ?? 0,
                      boundaryName: model.boundaryName,
                    ),
                  );
            } else {
              Navigator.of(context, rootNavigator: true).pop();
              context.router.replaceAll([HomeRoute()]);
            }
          },
        ),
        secondaryAction: DigitDialogActions(
          label: model.secondaryButtonLabel ?? '',
          action: (ctx) {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.replaceAll([HomeRoute()]);
          },
        ),
      );
    case DigitProgressDialogType.dataFound:
    case DigitProgressDialogType.pendingSync:
    case DigitProgressDialogType.insufficientStorage:
      DigitDialog.show(
        context,
        options: DigitDialogOptions(
          titleText: model.title,
          titleIcon: Icon(
            dialogType == DigitProgressDialogType.insufficientStorage
                ? Icons.warning
                : Icons.info_outline_rounded,
            color: dialogType == DigitProgressDialogType.insufficientStorage
                ? DigitTheme.instance.colorScheme.error
                : DigitTheme.instance.colorScheme.surfaceTint,
          ),
          contentText: model.content,
          primaryAction: DigitDialogActions(
            label: model.primaryButtonLabel ?? '',
            action: (ctx) {
              if (dialogType == DigitProgressDialogType.pendingSync) {
                Navigator.of(context, rootNavigator: true).pop();
                context.router.replaceAll([HomeRoute()]);
              } else {
                if ((model.totalCount ?? 0) > 0) {
                  context.read<BeneficiaryDownSyncBloc>().add(
                        DownSyncBeneficiaryEvent(
                          projectId: context.projectId,
                          boundaryCode: model.boundary,
                          // Batch Size need to be defined based on Internet speed.
                          batchSize: model.batchSize ?? 1,
                          initialServerCount: model.totalCount ?? 0,
                          boundaryName: model.boundaryName,
                        ),
                      );
                } else {
                  Navigator.of(context, rootNavigator: true).pop();
                  context.read<BeneficiaryDownSyncBloc>().add(
                        const DownSyncResetStateEvent(),
                      );
                }
              }
            },
          ),
          secondaryAction: model.secondaryButtonLabel != null
              ? DigitDialogActions(
                  label: model.secondaryButtonLabel ?? '',
                  action: (ctx) async {
                    await LocalSecureStore.instance.setManualSyncTrigger(false);
                    if (context.mounted) {
                      Navigator.of(context, rootNavigator: true).pop();
                      context.router.replaceAll([HomeRoute()]);
                    }
                  },
                )
              : null,
        ),
      );
    case DigitProgressDialogType.inProgress:
      DigitDialog.show(
        context,
        options: DigitDialogOptions(
          title: StreamBuilder<double>(
            stream: downloadProgressController?.stream,
            builder: (context, snapshot) {
              return ProgressIndicatorContainer(
                label: '',
                prefixLabel: '',
                suffixLabel:
                    '${(snapshot.data == null ? 0 : snapshot.data! * model.totalCount!.toDouble()).toInt()}/${model.suffixLabel}',
                value: snapshot.data ?? 0,
                valueColor: AlwaysStoppedAnimation<Color>(
                  DigitTheme.instance.colorScheme.secondary,
                ),
                subLabel: model.title,
              );
            },
          ),
        ),
      );
    default:
      return;
  }
}

//Function to read the localizations from ISAR,
getLocalizationString(Isar isar, String selectedLocale) async {
  List<dynamic> localizationValues = [];

  final List<LocalizationWrapper> localizationList =
      await isar.localizationWrappers
          .filter()
          .localeEqualTo(
            selectedLocale.toString(),
          )
          .findAll();
  if (localizationList.isNotEmpty) {
    localizationValues.addAll(localizationList.first.localization!);
  }

  return localizationValues;
}

getSelectedLanguage(AppInitialized state, int index) {
  if (AppSharedPreferences().getSelectedLocale == null) {
    AppSharedPreferences()
        .setSelectedLocale(state.appConfiguration.languages!.last.value);
  }
  final selectedLanguage = AppSharedPreferences().getSelectedLocale;
  final isSelected =
      state.appConfiguration.languages![index].value == selectedLanguage;

  return isSelected;
}

initializeAllMappers() async {
  List<Future> initializations = [
    Future(() => initializeMappers()),
    Future(() => attendance_mappers.initializeMappers()),
    Future(() => referral_reconciliation_mappers.initializeMappers()),
    Future(() => inventory_mappers.initializeMappers()),
    Future(() => data_model_mappers.initializeMappers()),
    Future(() => registration_delivery_mappers.initializeMappers()),
    Future(() => dss_mappers.initializeMappers()),
    Future(() => survey_form_mappers.initializeMappers()),
    Future(() => complaints_mappers.initializeMappers())
  ];
  await Future.wait(initializations);
}

class LocalizationParams {
  static final LocalizationParams _singleton = LocalizationParams._internal();

  factory LocalizationParams() {
    return _singleton;
  }

  LocalizationParams._internal();

  List<String>? _code;
  String? _module;
  Locale? _locale;
  bool? _exclude = true;

  void setCode(List<String>? code) {
    _code = code;
  }

  void setModule(String? module, bool? exclude) {
    _module = module;
    _exclude = exclude;
  }

  void setLocale(Locale locale) {
    _locale = locale;
  }

  void clear() {
    _code = null;
    _module = null;
  }

  List<String>? get code => _code;

  String? get module => _module;

  Locale? get locale => _locale;

  bool? get exclude => _exclude;
}
