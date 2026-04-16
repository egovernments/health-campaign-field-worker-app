import 'dart:async';

import 'package:attendance_management/utils/utils.dart';
import 'package:collection/collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/attendance_log.dart';
import 'package:digit_data_model/models/entities/enum_values.dart';
import 'package:digit_dss/data/local_store/no_sql/schema/dashboard_config_schema.dart';
import 'package:digit_dss/models/entities/dashboard_response_model.dart';
import 'package:digit_dss/router/dashboard_router.gm.dart';
import 'package:digit_dss/utils/utils.dart';
import 'package:digit_flow_builder/data/digit_crud_service.dart';
import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_flow_builder/router/flow_builder_routes.gm.dart';
import 'package:digit_flow_builder/utils/function_registry.dart';
import 'package:digit_flow_builder/widgets/flow_widget_interface.dart';
import 'package:digit_location_tracker/utils/utils.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recase/recase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_form/router/survey_form_router.gm.dart';
import 'package:survey_form/survey_form.dart';
import 'package:sync_service/blocs/sync/sync.dart';
import 'package:sync_service/data/sync_service.dart';
import 'package:transit_post/router/transit_post_router.gm.dart';
import 'package:transit_post/utils/utils.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/localization/localization.dart';
import '../blocs/stock_downsync/stock_downsync.dart';
import '../data/local_store/app_shared_preferences.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/local_store/no_sql/schema/service_registry.dart';
import '../data/local_store/secure_store/secure_store.dart';
import '../models/entities/roles_type.dart';
import '../router/app_router.dart';
import '../sampleJsonConfigs/attendance/attendance_flows.dart';
import '../sampleJsonConfigs/closed_household.dart';
import '../sampleJsonConfigs/complaints.dart';
import '../sampleJsonConfigs/hf_referral.dart';
import '../sampleJsonConfigs/inventory_reports.dart';
import '../sampleJsonConfigs/manage_stock.dart';
import '../sampleJsonConfigs/registration_flows.dart';
import '../sampleJsonConfigs/stock_reconciliation.dart';
import '../utils/attendance_utils.dart';
import '../utils/date_util_attendance.dart';
import '../utils/debound.dart';
import '../utils/environment_config.dart';
import '../utils/flow_navigation_utils.dart';
import '../utils/function_registries.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/least_level_boundary_singleton.dart';
import '../utils/stock_downsync_utils.dart';
import '../utils/utils.dart';
import '../widgets/attendance/attendance_qr_scanner_button.dart';
import '../widgets/attendance/custom_row_widget.dart';
import '../widgets/attendance/group_list_view_widget.dart';
import '../widgets/attendance/signature_compare_dialog_widget.dart';
import '../widgets/h_f_referral/evaluation_facility.dart';
import '../widgets/h_f_referral/project_cycles.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/home/home_item_card.dart';
import '../widgets/inventory/custom_facility_widgets.dart';
import '../widgets/inventory/custom_product_selection_card.dart';
import '../widgets/localized.dart';
import '../widgets/progress_bar/beneficiary_progress.dart';
import '../widgets/progress_bar/hf_referral_progress.dart';
import '../widgets/resource_card/custom_resource_card.dart';
import '../widgets/showcase/config/showcase_constants.dart';
import '../widgets/showcase/showcase_button.dart';
import '../widgets/stock_balance/stock_balance_card.dart';
import '../widgets/stock_reconciliation/stock_reconciliation_card.dart';
import '../widgets/task_functions.dart';

@RoutePage()
class HomePage extends LocalizedStatefulWidget {
  const HomePage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends LocalizedState<HomePage> {
  bool skipProgressBar = false;
  final storage = const FlutterSecureStorage();
  late StreamSubscription<List<ConnectivityResult>> subscription;
  bool isTriggerLocalisation = true;
  final _syncDebouncer = Debouncer(seconds: 5);
  final StreamController<double> stockDownloadProgress =
      StreamController<double>.broadcast();

  @override
  initState() {
    super.initState();

    // If background service was killed with the app, release orphaned lock
    // and restart the service.
    FlutterBackgroundService().isRunning().then((isRunning) {
      if (!isRunning) {
        SyncLock.release();
        if (context.mounted) {
          performBackgroundService(
            isBackground: false,
            stopService: false,
            context: context,
          );
        }
      }
    });

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      if (result.firstOrNull == ConnectivityResult.none) {
        if (context.mounted) {
          context.syncRefresh();
        }
      }
    });
    //// Function to set initial Data required for the packages to run
    setPackagesSingleton(context);

    // Register custom components for forms
    _registerCustomComponents();
  }

  /// Register custom components for forms engine
  void _registerCustomComponents() {
    FlowWidgetFactory.register(AttendanceQrScannerButton());
    FlowWidgetFactory.register(GroupListViewWidget());
    FlowWidgetFactory.register(CustomRowWidget());
    FlowWidgetFactory.register(SignatureCompareWidget());

    // Register resource card for DELIVERY and REDOSE
    CustomComponentRegistry().registerBuilder(
      'resourceCard',
      (context, stateAccessor) {
        final beneficiaryDetails =
            stateAccessor.getPageData('beneficiaryDetails');

        if (beneficiaryDetails != null) {
          // DELIVERY flow
          return ResourceCard(
            stateData: beneficiaryDetails,
            pageSchema: 'DELIVERY',
          );
        }

        // REDOSE flow - compute product variants same as DELIVERY
        // Use navigation params to filter by age condition
        final navParams = FlowCrudStateRegistry().getNavigationParams('REDOSE');
        final cycleIndex = navParams?['cycleIndex'];
        final ageStr = navParams?['selectedIndividualAgeInMonths'];
        final age = int.tryParse(ageStr?.toString() ?? '');

        final projectType = context.selectedProjectType;
        final cycles = projectType?.cycles;

        // Find the cycle matching cycleIndex from nav params
        final currentCycle = cycles?.firstWhereOrNull(
          (c) => c.id.toString() == cycleIndex?.toString(),
        );

        // Use first delivery's dose criteria (all deliveries have same criteria)
        final firstDelivery = currentCycle?.deliveries?.firstOrNull;
        final matchingCriteria = <Map<String, dynamic>>[];

        if (firstDelivery?.doseCriteria != null && age != null) {
          for (final dc in firstDelivery!.doseCriteria!) {
            if (dc.condition != null && dc.condition!.isNotEmpty) {
              // Evaluate condition e.g. "3<=ageandage<=11"
              final sanitized = dc.condition!
                  .replaceAll(' and ', ' && ')
                  .replaceAll('and', '&&');
              try {
                final parser = FormulaParser(sanitized, {'age': age});
                final result = parser.parse;
                if (result['isSuccess'] && result['value'] == true) {
                  matchingCriteria.add(dc.toMap());
                }
              } catch (e) {
                debugPrint('REDOSE condition eval error: $e');
              }
            } else {
              // No condition - include by default
              matchingCriteria.add(dc.toMap());
            }
          }
        }

        final redoseState = FlowCrudState(
          stateWrapper: [
            {'eligibleProductVariants': matchingCriteria}
          ],
        );

        return ResourceCard(
          stateData: redoseState,
          pageSchema: 'REDOSE',
        );
      },
    );

    CustomComponentRegistry().registerBuilder(
      'evaluationFacility',
      (context, stateAccessor) {
        // Build your component with access to all this data
        return const EvaluationKeyDropDown(
            schemaName: "REFERRAL_CREATE",
            formControlName: "evaluationFacility");
      },
    );

    CustomComponentRegistry().registerBuilder(
      'healthFacility',
      (context, stateAccessor) {
        // Build your component with access to all this data
        return const EvaluationKeyDropDown(
            schemaName: "REFER_BENEFICIARY", formControlName: "healthFacility");
      },
    );

    CustomComponentRegistry().registerBuilder(
      'referralCycle',
      (context, stateAccessor) {
        // Build your component with access to all this data
        return const CycleDropDown();
      },
    );
    CustomComponentRegistry().registerBuilder(
      'facilityToWhich',
      (context, stateAccessor) {
        final stockData = stateAccessor.getPageData('manageStock');

        // Use stateAccessor.currentPageName which is set by the screen builder
        // to the active form's schemaKey (e.g., 'RECORDSTOCK' or 'RECORDLESSEXCESS')
        final schemaName = stateAccessor.currentPageName;

        return FacilityCard(
          stateData: stockData,
          schemaName: schemaName,
          formKey: 'facilityToWhich',
          dependantFormKey: 'teamCode',
        );
      },
    );
    CustomComponentRegistry().registerBuilder(
      'facilityFromWhich',
      (context, stateAccessor) {
        final stockData = stateAccessor.getPageData('manageStock');

        // Use stateAccessor.currentPageName for the active form's schemaKey
        final schemaName = stateAccessor.currentPageName;

        return FacilityCard(
          stateData: stockData,
          schemaName: schemaName,
          formKey: 'facilityFromWhich',
          dependantFormKey: 'deliveryTeam',
        );
      },
    );
    CustomComponentRegistry().registerBuilder(
      'productdetail',
      (context, stateAccessor) {
        // Access data from any page in the flow
        final stockData = stateAccessor.getPageData('manageStock');

        // Build your component with access to all this data
        return ProductSelectionCard(
          stateData: stockData,
          pageSchema: 'RECORDSTOCK',
        );
      },
    );
    CustomComponentRegistry().registerBuilder(
      'productVariant',
      (context, stateAccessor) {
        final stockData = stateAccessor.getPageData('manageStock');

        return ProductSelectionCard(
          stateData: stockData,
          pageSchema: 'RECORDLESSEXCESS',
          formKey: 'productVariant',
        );
      },
    );
    CustomComponentRegistry().registerBuilder(
      'stockReconciliationCard',
      (context, stateAccessor) {
        // Access data from stock reconciliation page
        final reconciliationData = stateAccessor.getPageData('stockRecon');

        // Build stock reconciliation component with facility, product, and metrics
        return StockReconciliationCard(
          stateData: reconciliationData,
          pageSchema: 'stockReconciliationDetails',
        );
      },
    );
    FunctionRegistries(context).registerAll();
    registerTaskFunctions();

    // Attendance

    FunctionRegistry.register('todayAttendanceLogs', (args, stateData) {
      if (args.isEmpty || args.first == null) return [];

      final widgetData = args.first;
      var attendanceRegister =
          args.length > 1 && args[1] != null ? args[1] : null;

      if (attendanceRegister == null) return [];

      List attendanceLogs = attendanceRegister.attendanceLog ?? [];

      final selectedDate = widgetData['selectedDate'] as int?;
      final isMorning = widgetData['sessionToggle'] as bool? ?? true;

      Map<String, dynamic>? attendanceTime = AttendanceUtils.attendanceTime(
          selectedDate, isMorning, attendanceRegister);

      var entryTime = attendanceTime?['entryTime'];
      var exitTime = attendanceTime?['exitTime'];

      if (entryTime == null || exitTime == null) return [];

      List filteredLogs = attendanceLogs.where((log) {
        final logTime = log.time;
        return logTime == entryTime || logTime == exitTime;
      }).toList();

      return filteredLogs;
    });

    // Update attendanceStatus to also check in-memory collection (4th arg)
    FunctionRegistry.register('attendanceStatus', (args, stateData) {
      final widgetData = args.isNotEmpty ? args[0] : null;
      final attendee = args.length > 1 ? args[1] : null;

      double? currentStatus;

      String attendanceUnmarked = 'ATTENDANCE_UNMARKED';
      String markAsPresent = 'MARK_AS_PRESENT';
      String markedAsAbsent = 'MARK_AS_ABSENT';

      final individualId = attendee?["individualId"];

      var attendanceCollectionData =
          widgetData["attendanceCollection"]?[individualId];

      if (attendanceCollectionData == 'present') {
        currentStatus = 1.0;
      } else if (attendanceCollectionData == 'absent') {
        currentStatus = 0.0;
      }

      var status = currentStatus ?? attendee?['status'] ?? -1.0;

      if (status == 1.0) {
        return markAsPresent;
      } else if (status == 0.0) {
        return markedAsAbsent;
      } else if (status == -1.0) {
        return attendanceUnmarked;
      }
    });

    FunctionRegistry.register('buttonType', (args, stateData) {
      final widgetData = args.isNotEmpty ? args[0] : null;
      final attendee = args.length > 1 ? args[1] : null;
      final targetStatus = args.length > 2 ? args[2] : null;

      double? currentStatus;

      final individualId = attendee?["individualId"];

      var attendanceCollectionData =
          widgetData["attendanceCollection"]?[individualId];

      if (attendanceCollectionData == 'present') {
        currentStatus = 1.0;
      } else if (attendanceCollectionData == 'absent') {
        currentStatus = 0.0;
      }

      var status = currentStatus ?? attendee?['status'] ?? -1.0;

      if (status == targetStatus) {
        return "primary";
      } else {
        return "secondary";
      }
    });

    FunctionRegistry.register('hideMarkAttendanceButtons', (args, stateData) {
      final widgetData = args.isNotEmpty ? args[0] : null;
      final attendee = args.length > 1 ? args[1] : null;
      final attendanceRegister =
          args.length > 2 && args[2] != null ? args[2] : [];

      if (widgetData == null ||
          attendee == null ||
          attendanceRegister == null) {
        return false; // hide buttons if no attendee or logs
      }

      final individualId = attendee?["individualId"];
      List attendanceLogs = attendanceRegister.attendanceLog ?? [];

      final selectedDate = widgetData['selectedDate'] as int?;
      final isMorning = widgetData['sessionToggle'] as bool? ?? true;
      final attendanceManualData = widgetData['attendanceManualData'] as Map?;

      if (selectedDate == null)
        return false; // hide buttons if no date selected

      Map<String, dynamic>? attendanceTime = AttendanceUtils.attendanceTime(
          selectedDate, isMorning, attendanceRegister);

      var entryTime = attendanceTime?['entryTime'];
      var exitTime = attendanceTime?['exitTime'];

      // Filter logs for this individual and selected session times
      List filterLocalAttendanceLogs = attendanceLogs.where((log) {
        return ((entryTime != null && log.time == entryTime) ||
                (exitTime != null && log.time == exitTime)) &&
            log.individualId == individualId?.toString() &&
            log.uploadToServer != true;
      }).toList();

      // Filter logs for this individual and selected session times
      List filterUploadedAttendanceLogs = attendanceLogs.where((log) {
        return ((entryTime != null && log.time == entryTime) ||
                (exitTime != null && log.time == exitTime)) &&
            log.individualId == individualId?.toString() &&
            log.uploadToServer == true;
      }).toList();

      final now = DateTime.now();
      final selectedDateTime =
          DateTime.fromMillisecondsSinceEpoch(selectedDate);
      bool isSameDay = selectedDateTime.year == now.year &&
          selectedDateTime.month == now.month &&
          selectedDateTime.day == now.day;

      bool show = false;

      if (filterUploadedAttendanceLogs.isNotEmpty) {
        show =
            false; // hide buttons if already uploaded logs exist for this session
      } else if (!isSameDay) {
        show = true; // show buttons for past dates if no uploaded logs exist
      } else {
        show = filterLocalAttendanceLogs.isNotEmpty ||
            (isSameDay &&
                attendanceManualData !=
                    null); // show buttons for current day if local logs exist or manual marking is enabled
      }

      return !show;
    });

    FunctionRegistry.register('showAttendanceQRButton', (args, stateData) {
      final selectedDate = args.isNotEmpty ? args[0] : null;
      final isMorning = args.length > 1 ? args[1] : null;
      final attendanceRegisterModel = args.length > 2 ? args[2] : null;

      if (attendanceRegisterModel == null) {
        return false; // hide if no attendance data
      }

      if (selectedDate == null) {
        return false; // hide buttons if no date selected
      }

      Map<String, dynamic>? attendanceTime = AttendanceUtils.attendanceTime(
          selectedDate,
          isMorning == "true" ? true : false,
          attendanceRegisterModel);

      var entryTime = attendanceTime?['entryTime'];
      var exitTime = attendanceTime?['exitTime'];

      final attendanceLogs = attendanceRegisterModel.attendanceLog;

      // Filter logs for the selected entry and exit times that are uploaded
      final filterUploadedAttendanceLogs = attendanceLogs?.where((log) {
        final logTime = log.time;
        if (logTime == null) return false;
        return (logTime == entryTime || logTime == exitTime) &&
            log.uploadToServer == true;
      }).toList();

      final now = DateTime.now();
      final selectedDateTime =
          DateTime.fromMillisecondsSinceEpoch(selectedDate);
      bool isSameDay = selectedDateTime.year == now.year &&
          selectedDateTime.month == now.month &&
          selectedDateTime.day == now.day;
      return isSameDay && (filterUploadedAttendanceLogs?.isEmpty ?? true);
    });

    FunctionRegistry.register('todayAttendeesList', (args, stateData) {
      final widgetData = args.isNotEmpty && args[0] != null ? args[0] : null;
      List items = args.length > 1 && args[1] != null ? args[1] : [];
      final attendanceLogs = args.length > 2 && args[2] != null ? args[2] : [];
      final attendanceRegisterModel =
          args.length > 3 && args[3] != null ? args[3] : null;

      final selectedDate = widgetData?['selectedDate'] as int?;
      final isMorning = widgetData?['sessionToggle'] as bool? ?? true;

      Map<String, dynamic>? attendanceTime = AttendanceUtils.attendanceTime(
          selectedDate, isMorning, attendanceRegisterModel);

      var entryTime = attendanceTime?['entryTime'];
      var exitTime = attendanceTime?['exitTime'];

      // Filter logs for the selected entry and exit times that are uploaded
      final todayAttendanceLogs = attendanceLogs?.where((log) {
        final logTime = log.time;
        if (logTime == null) return false;
        return (logTime == entryTime || logTime == exitTime);
      }).toList();

      items = items.map((item) {
        if (item is Map && item['individualId'] != null) {
          double status = -1.0;
          final individualId = item['individualId'];
          List filterAttendanceLogs = todayAttendanceLogs.where((log) {
            return log.individualId == individualId;
          }).toList();
          if (filterAttendanceLogs.isEmpty) {
            status = -1.0; // no logs
            item['status'] = status;
            return item;
          }
          final hasMorningLog = filterAttendanceLogs.any((element) {
            final elementType = element.type?.toString();
            final elementStatus = element.status;
            if (elementStatus == null) return false;
            if (elementType == "ENTRY") {
              return elementStatus == 'ACTIVE';
            }
            return false;
          });
          ;
          final hasEveningLog = filterAttendanceLogs.any((element) {
            final elementType = element.type?.toString();
            final elementStatus = element.status;
            if (elementStatus == null) return false;
            if (elementType == "EXIT") {
              return elementStatus == 'ACTIVE';
            }
            return false;
          });
          if (hasMorningLog && hasEveningLog) {
            status = 1.0; // present
          } else if (!hasMorningLog && !hasEveningLog) {
            status = 0.0; // absent
          } else {
            status = 0.5; // half day
          }
          item['status'] = status;
        }
        return item;
      }).toList();

      return items;
    });

    FunctionRegistry.register('allAttendanceSelected', (args, stateData) {
      if (args.isEmpty || args.first == null) return false;

      final widgetData = args.first;
      final attendanceRegisterModel = args.length > 1 ? args[1] : null;

      final selectedDate = widgetData?['selectedDate'] as int?;
      final isMorning = widgetData?['sessionToggle'] as bool? ?? true;

      Map<String, dynamic>? attendanceTime = AttendanceUtils.attendanceTime(
          selectedDate, isMorning, attendanceRegisterModel);

      var entryTime = attendanceTime?['entryTime'];
      var exitTime = attendanceTime?['exitTime'];

      final attendanceCollection = widgetData?['attendanceCollection'] as Map?;

      final attendees = attendanceRegisterModel?.attendees ?? [];
      final attendanceLogs = attendanceRegisterModel?.attendanceLog ?? [];

      // Filter logs for the selected entry and exit times that are not yet uploaded
      final filterAttendanceLogs = attendanceLogs.where((log) {
        final logTime = log.time;
        final logUploadToServer = log.uploadToServer;
        return (logTime == entryTime || logTime == exitTime) &&
            logUploadToServer != true;
      }).toList();

      if (filterAttendanceLogs.isNotEmpty) {
        return attendees.length != (filterAttendanceLogs.length / 2);
      }

      return attendees.length != attendanceCollection?.length;
    });

    FunctionRegistry.register('updateAttendeeStatus', (args, stateData) {
      if (args.isEmpty || args.first == null) return null;

      List<dynamic> attendees = args.first;
      List<dynamic> attendanceLogs =
          args.length > 1 && args[1] != null ? args[1] : [];
      final selectedDate = args.length > 2 && args[2] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              int.tryParse(args[2].toString()) ??
                  DateTime.now().millisecondsSinceEpoch)
          : DateTime.now();

      for (var attendee in attendees) {
        String? individualId;
        try {
          individualId = attendee.individualId?.toString();
        } catch (_) {
          individualId = null;
        }
        if (individualId == null) continue;

        // Find logs for this attendee
        final filteredLogs = attendanceLogs
            .where((log) => log.individualId?.toString() == individualId)
            .toList();

        // Determine attendance status based on logs
        final hasMorningLog =
            AttendanceUtils.hasLogWithType(filteredLogs, selectedDate, 'ENTRY');
        final hasEveningLog =
            AttendanceUtils.hasLogWithType(filteredLogs, selectedDate, 'EXIT');

        double status;
        if (hasMorningLog && hasEveningLog) {
          final morningLogActive = AttendanceUtils.hasLogActiveStatus(
              filteredLogs, selectedDate, 'ENTRY');
          final eveningActive = AttendanceUtils.hasLogActiveStatus(
              filteredLogs, selectedDate, 'EXIT');

          if (morningLogActive && eveningActive) {
            status = 1.0; // present
          } else if (!morningLogActive && !eveningActive) {
            status = 0.0; // absent
          } else {
            status = 0.5; // half day
          }
        } else {
          status = -1.0; // not marked
        }

        // Update attendee with computed status
        try {
          attendee.attendanceStatus = status;
        } catch (_) {
          // If attendee is a Map, update the field directly
          if (attendee is Map) {
            attendee['status'] = status;
          }
        }
      }

      return attendees;
    });

    FunctionRegistry.register('entryTime', (args, stateData) {
      DateTime today = DateTime.now();
      if (args.isNotEmpty && args.first != null) {
        today = DateTime.fromMillisecondsSinceEpoch(
            int.tryParse(args.first.toString()) ??
                today.millisecondsSinceEpoch);
      }
      final startOfDay = DateTime(
        today.year,
        today.month,
        today.day,
        9,
        0,
        0,
      );
      return startOfDay.millisecondsSinceEpoch;
    });

    FunctionRegistry.register('exitTime', (args, stateData) {
      DateTime today = DateTime.now();
      if (args.isNotEmpty && args.first != null) {
        today = DateTime.fromMillisecondsSinceEpoch(
            int.tryParse(args.first.toString()) ??
                today.millisecondsSinceEpoch);
      }

      final endOfDay = DateTime(
        today.year,
        today.month,
        today.day,
        18,
        0,
        0,
        0,
      );
      return endOfDay.millisecondsSinceEpoch;
    });

    /// Registers a function to calculate completed attendance days.
    ///
    /// - **Function Name**: `'calculateCompletedDays'`
    /// - **Arguments**: A list where:
    ///   - First element is the AttendanceRegisterModel or its Map representation.
    ///   - Second element (optional) is the attendance logs list from wrapper relations (List<AttendanceLogModel> or List<Map>).
    /// - **Returns**: A formatted string like `"3/5"` representing completed/total days.
    ///
    /// This function handles both:
    /// 1. Model's attendanceLog field (List<Map<DateTime, bool>>?) - legacy format
    /// 2. Wrapper's attendanceLog relation (List<AttendanceLogModel>) - raw attendance records

    FunctionRegistry.register('calculateCompletedDays', (args, stateData) {
      if (args.isEmpty || args.first == null) return '0/0';

      final attendanceRegister = args.first;

      if (attendanceRegister == null) return '0/0';

      List list = AttendanceUtils.generateAttendanceLogDateList(
        attendanceRegister.startDate!,
        attendanceRegister.endDate!,
        attendanceRegister.attendanceLog,
      );

      var completedDays = 0;
      var totalDays = 0;
      totalDays = list.length;
      for (var element in list) {
        if (element.containsValue(true)) {
          completedDays++;
        }
      }
      return '$completedDays/$totalDays';
    });

    FunctionRegistry.register('filterAttendeesByTeam', (args, stateData) {
      if (args.isEmpty || args.first == null) return null;

      final item = args.first;
      List<dynamic>? attendees;

      try {
        attendees = item.attendees;
      } catch (_) {
        attendees = null;
      }

      return attendees;
    });

    FunctionRegistry.register('todayDate', (args, stateData) {
      return DateTime.now().millisecondsSinceEpoch.toString();
    });

    FunctionRegistry.register('isActiveAttendee', (args, stateData) {
      if (args.isEmpty) return true;
      final denrollmentDate = args.first;
      if (denrollmentDate == null) return true;
      final deDate = denrollmentDate is int
          ? denrollmentDate
          : int.tryParse(denrollmentDate.toString());
      if (deDate == null) return true;
      return deDate >= DateTime.now().millisecondsSinceEpoch;
    });

    FunctionRegistry.register('isLogNotMarked', (args, stateData) {
      String? individualId = args.isNotEmpty ? args[0] : null;
      int? selectedDateRaw =
          args.length > 1 ? int.tryParse(args[1]?.toString() ?? '') : null;
      List<dynamic>? attendanceLogs =
          args.length > 2 ? args[2] as List<dynamic>? : null;
      bool? filter = args.length > 3 ? args[3] as bool? : null;

      DateTime selectedDate = selectedDateRaw != null
          ? DateTime.fromMillisecondsSinceEpoch(selectedDateRaw)
          : DateTime.now();

      double status = AttendanceUtils.attendanceLogsStatus(
          individualId, selectedDate, attendanceLogs);
      bool isLogNotMarked = status == -1.0;
      if (filter != null) {
        return filter
            ? isLogNotMarked
            : true; // If filter is true, return isLogNotMarked; if false, ignore and return true
      }
      return isLogNotMarked;
    });

    FunctionRegistry.register('isAbsentMarked', (args, stateData) {
      String? individualId = args.isNotEmpty ? args[0] : null;
      int? selectedDateRaw =
          args.length > 1 ? int.tryParse(args[1]?.toString() ?? '') : null;
      Map? attendanceCollection = args.length > 2 ? args[2] as Map? : null;

      DateTime selectedDate = selectedDateRaw != null
          ? DateTime.fromMillisecondsSinceEpoch(selectedDateRaw)
          : DateTime.now();

      double status = AttendanceUtils.attendanceStatus(
          individualId, selectedDate, attendanceCollection);
      if (status == -1.0) {
        return false;
      } else if (status == 1.0) {
        return false;
      } else if (status == 0.0) {
        return true;
      }
    });

    FunctionRegistry.register('attendanceLogStatus', (args, stateData) {
      String? individualId = args.isNotEmpty ? args[0] : null;
      int? selectedDateRaw =
          args.length > 1 ? int.tryParse(args[1]?.toString() ?? '') : null;
      List<dynamic>? attendanceLogs =
          args.length > 2 ? args[2] as List<dynamic>? : null;

      DateTime selectedDate = selectedDateRaw != null
          ? DateTime.fromMillisecondsSinceEpoch(selectedDateRaw)
          : DateTime.now();

      double status = AttendanceUtils.attendanceLogsStatus(
          individualId, selectedDate, attendanceLogs);
      return status; // 1.0 for present, 0.0 for absent, 0.5 for half day, -1.0 for unmarked
    });

    FunctionRegistry.register('showOpenRegisterButton', (args, stateData) {
      if (args.isEmpty || args.first == null) return false;

      var register = args.isNotEmpty ? args[0] : null;
      if (register == null) return false;

      var attendanceRegisters = args.length > 1 ? args[1] : null;

      if (attendanceRegisters == null ||
          (attendanceRegisters is List && attendanceRegisters.isEmpty)) {
        return false;
      }

      return register.startDate != null &&
          register.endDate != null &&
          register.startDate! <= DateTime.now().millisecondsSinceEpoch &&
          register.endDate! > DateTime.now().millisecondsSinceEpoch;
    });

    FunctionRegistry.register('setAttendanceDate', (args, stateData) {
      if (args.isEmpty || args.first == null) return null;

      final selectedDate = args.first as int?;
      final attendanceRegisterModel = args.length > 1 ? args[1] : null;
      final isMorning = args.length > 2 ? args[2] as String? ?? 'true' : 'true';

      if (selectedDate == null || attendanceRegisterModel == null) return null;

      DateTime? dateSession = DateTime.now().isAfter(
              DateTime.fromMillisecondsSinceEpoch(
                  attendanceRegisterModel.endDate!))
          ? DateTime.fromMillisecondsSinceEpoch(
              attendanceRegisterModel.endDate!)
          : DateTime.fromMillisecondsSinceEpoch(selectedDate);

      if (dateSession == null) return null;

      var entryTime = attendanceRegisterModel
                  .additionalDetails?[EnumValues.sessions.toValue()] ==
              2
          ? AttendanceDateTimeManagement.getMillisecondEpoch(
              dateSession,
              isMorning == 'true' ? 0 : 1,
              "entryTime",
            )
          : (DateTime(dateSession.year, dateSession.month, dateSession.day, 9)
              .millisecondsSinceEpoch);

      var exitTime = attendanceRegisterModel
                  .additionalDetails?[EnumValues.sessions.toValue()] ==
              2
          ? AttendanceDateTimeManagement.getMillisecondEpoch(
              dateSession,
              isMorning == 'true' ? 0 : 1,
              "exitTime",
            )
          : (DateTime(dateSession.year, dateSession.month, dateSession.day, 18)
              .millisecondsSinceEpoch);

      if (entryTime == null || exitTime == null) return null;

      return {
        'selectedAttendanceDate': {
          'date': dateSession.millisecondsSinceEpoch,
          'entryTime': entryTime,
          'exitTime': exitTime,
        }
      };
    });

    FunctionRegistry.register('getCurrentSignature', (args, stateData) {
      final widgetData = args.isNotEmpty ? args[0] : null;
      final individualId = args.length > 1 ? args[1] as String? : null;

      if (widgetData == null || individualId == null) return null;

      final signatureCollection = widgetData['signatureCollection'] as Map?;
      final signatureData =
          signatureCollection?[individualId]?['signatureData'] as String?;

      return signatureData;
    });

    FunctionRegistry.register('getExistingSignature', (args, stateData) {
      final individualId = args.isNotEmpty ? args[0]?.toString() : null;
      final attendanceLogs = args.length > 1 ? args[1] as List<dynamic>? : null;

      if (attendanceLogs == null || attendanceLogs.isEmpty) return null;
      List logs = attendanceLogs.where((log) {
        final additionalDetails = log.additionalDetails as Map?;
        final isFirstSignature =
            additionalDetails?['isFirstSignature'] == "true";
        return log.individualId == individualId && isFirstSignature;
      }).toList();
      return logs.isNotEmpty
          ? (logs.first.additionalDetails?['signatureData'])
          : null;
    });

    FunctionRegistry.register('createAttendanceLog', (args, stateData) {
      if (args.isEmpty || args.first == null) return null;

      final widgetData = args.first as Map;
      final attendanceRegisterModel = args.length > 1 ? args[1] : null;
      final uploadToServer = args.length > 2 ? args[2] as int? : 0;

      final registerId = attendanceRegisterModel?.id ?? '';
      List attendanceLogs = attendanceRegisterModel?.attendanceLog ?? [];

      final attendanceCollection = widgetData['attendanceCollection'] as Map?;
      final signatureCollection = widgetData['signatureCollection'] as Map?;
      final attendanceQRCollection =
          widgetData['attendanceQRCollection'] as Map?;

      final comment = widgetData['COMMENT'] as String?;
      final isMorning = widgetData['sessionToggle'] as bool? ?? true;

      final selectedDate = widgetData['selectedDate'] as int?;
      final attendanceManualData = widgetData['attendanceManualData'] as Map?;

      Map<String, dynamic>? attendanceTime = AttendanceUtils.attendanceTime(
          selectedDate, isMorning, attendanceRegisterModel);

      var entryTime = attendanceTime?['entryTime'];
      var exitTime = attendanceTime?['exitTime'];

      final isManualScan = attendanceManualData?['isManualScan'] as String?;
      final reason = attendanceManualData?['reason'] as String?;
      final reasonComment = attendanceManualData?['reasonComment'] as String?;

      final tenantId = FlowBuilderSingleton().selectedProject?.tenantId ?? '';
      final boundaryCode = AttendanceSingleton().boundary?.code ?? '';
      final userUuid = FlowBuilderSingleton().loggedInUser?.uuid ?? '';
      final now = DateTime.now().millisecondsSinceEpoch;

      List todayAttendanceLogs = attendanceLogs.where((log) {
        final logTime = log.time;
        return logTime == entryTime || logTime == exitTime;
      }).toList();

      //
      List notMarkedAttendanceLogs = todayAttendanceLogs.where((log) {
        bool isMarked = log.individualId != null &&
            attendanceCollection?.containsKey(log.individualId.toString()) ==
                true &&
            (attendanceCollection?[log.individualId.toString()] == 'present' ||
                attendanceCollection?[log.individualId.toString()] == 'absent');
        return !isMarked;
      }).toList(); // logs that are not marked

      notMarkedAttendanceLogs = notMarkedAttendanceLogs.map((e) {
        return e.copyWith(
          uploadToServer: uploadToServer == 1,
        );
      }).toList();

      final List<EntityModel> entities = [...notMarkedAttendanceLogs];

      for (final entry in (attendanceCollection ?? {}).entries) {
        final individualId = entry.key.toString();
        final data = entry.value;
        if (data == null) continue;

        double markStatus = -1.0;
        if (data == "present") {
          markStatus = 1.0;
        } else if (data == "absent") {
          markStatus = 0.0;
        }
        if (markStatus == -1.0) continue; // skip unmarked

        final isPresent = markStatus >= 1.0;
        final isFirstSignature =
            signatureCollection?[individualId]?['isFirstSignature'] as bool? ??
                false;
        final signatureData =
            signatureCollection?[individualId]?['signatureData'] as String?;
        final qrCreatedTime =
            attendanceQRCollection?[individualId]?['qrCreatedTime'] as int?;

        final logStatus = isPresent
            ? EnumValues.active.toValue()
            : EnumValues.inactive.toValue();

        // Build additionalDetails matching _onSaveAsDraft
        final additionalDetails = <String, dynamic>{
          if (boundaryCode.isNotEmpty)
            EnumValues.boundaryCode.toValue(): boundaryCode,
          'SESSION_TYPE': isMorning ? 'MORNING' : 'EVENING',
          if (qrCreatedTime != null) 'qrCreatedTime': qrCreatedTime,
          if (isFirstSignature)
            'isFirstSignature': isFirstSignature ? "true" : "false",
          if (signatureData != null) 'signatureData': signatureData,
          if (comment != null && comment.isNotEmpty) 'comment': comment,
          if (isManualScan != null) 'isMarkedManually': isManualScan,
          if (reason != null && reason.isNotEmpty)
            'manualMarkingReason': reason,
          if (reasonComment != null && reasonComment.isNotEmpty)
            'manualMarkingComment': reasonComment,
        };

        final clientAudit = ClientAuditDetails(
          createdBy: userUuid,
          createdTime: now,
          lastModifiedBy: userUuid,
          lastModifiedTime: now,
        );
        final audit = AuditDetails(
          createdBy: userUuid,
          createdTime: now,
          lastModifiedBy: userUuid,
          lastModifiedTime: now,
        );

        // Reuse clientReferenceId from existing log if present (dedup)
        // Mirrors submitAttendanceDetails: match on individualId + registerId + type + time
        final existingEntryLog = attendanceLogs
            .where((log) =>
                log.individualId == individualId &&
                log.registerId == registerId &&
                log.type == EnumValues.entry.toValue() &&
                log.time == entryTime &&
                log.clientReferenceId != null)
            .toList();

        final existingExitLog = attendanceLogs
            .where((log) =>
                log.individualId == individualId &&
                log.registerId == registerId &&
                log.type == EnumValues.exit.toValue() &&
                log.time == exitTime &&
                log.clientReferenceId != null)
            .toList();

        // ENTRY log
        entities.add(AttendanceLogModel(
          clientReferenceId: existingEntryLog.isNotEmpty
              ? existingEntryLog.last.clientReferenceId!
              : IdGen.i.identifier,
          individualId: individualId,
          registerId: registerId,
          tenantId: tenantId,
          type: EnumValues.entry.toValue(),
          status: logStatus,
          time: entryTime,
          uploadToServer: uploadToServer == 1,
          rowVersion: 1,
          additionalDetails: additionalDetails,
          clientAuditDetails: clientAudit,
          auditDetails: audit,
        ));

        // EXIT log
        entities.add(AttendanceLogModel(
          clientReferenceId: existingExitLog.isNotEmpty
              ? existingExitLog.last.clientReferenceId!
              : IdGen.i.identifier,
          individualId: individualId,
          registerId: registerId,
          tenantId: tenantId,
          type: EnumValues.exit.toValue(),
          status: logStatus,
          time: exitTime,
          uploadToServer: uploadToServer == 1,
          rowVersion: 1,
          additionalDetails: additionalDetails,
          clientAuditDetails: clientAudit,
          auditDetails: audit,
        ));
      }
      return entities;
    });

    FunctionRegistry.register("markAttendance", (args, stateData) {
      final individualId = args.isNotEmpty ? args.first?.toString() : null;
      final registerId = args.length > 1 ? args[1]?.toString() : null;
      final status = args.length > 2 ? (args[2] as double?)?.toDouble() : null;
      final signatureData = args.length > 3 ? args[3] as String? : null;
      final collection = args.length > 4 ? args[4] as Map? : null;

      if (individualId == null || individualId.isEmpty) return null;
      if (registerId == null || registerId.isEmpty) return null;
      if (status == null) return null;

      // Toggle logic matching _onIndividualAttendanceMark
      final existing = collection?[individualId];
      final currentStatus =
          existing is Map ? (existing['status'] as num?)?.toDouble() : null;

      final double finalStatus;
      if (currentStatus == null || currentStatus == -1) {
        finalStatus = status; // not marked, take new status
      } else if (currentStatus == 1.0 && status == 1.0) {
        finalStatus = 1.0; // already present, keep present
      } else {
        finalStatus =
            status; // otherwise, update to new status (could be marking absent or toggling)
      }
      collection?[individualId] = {
        'registerId': registerId,
        'individualId': individualId,
        'status': finalStatus,
        'signatureData': signatureData,
      };
      return collection;
    });

    /// Registers a function to check if attendance is single session mode.
    ///
    /// - **Function Name**: `'isSingleSession'`
    /// - **Arguments**: A list where the first element is the sessions value from
    ///   AttendanceRegisterModel.additionalDetails.sessions
    /// - **Returns**: `true` if single session (sessions != 2), `false` if double session (sessions == 2).
    ///
    /// This function is used in attendance marking to determine if the register
    /// operates in single session mode (one entry/exit per day) or double session mode
    /// (morning and evening sessions).
    FunctionRegistry.register("isNotSingleSession", (args, stateData) {
      // If no argument provided, default to single session
      if (args.isEmpty || args.first == null) {
        return true;
      }

      final registerModel = args.first;

      var isSingleSession = registerModel.additionalDetails?["sessions"] != 2;

      return !isSingleSession;
    });

    FunctionRegistry.register("attendeeFilterByTeam", (args, stateData) {
      // If no argument provided, default to single session
      if (args.isEmpty || args.first == null) return null;

      final attendees = args.first;
      final teamName = args.length > 1 ? args[1]?.toString() : null;
      List filteredAttendees = attendees;

      return filteredAttendees;
    });

    FunctionRegistry.register("getMissedDays", (args, stateData) {
      List attendanceLog =
          (args.isEmpty || args.first == null) ? [] : args.first;

      String missedDays = ""; // Initialize the missedDays string

      // Get current date
      DateTime nowTime = DateTime.now();
      DateTime currentDate = DateTime(nowTime.year, nowTime.month, nowTime.day);

      // Check if attendance log exists
      if (attendanceLog.isNotEmpty) {
        // Iterate through attendance log entries
        for (var entry in attendanceLog) {
          // Check each entry for missed attendance
          entry.forEach((key, value) {
            if (value == false && key.isBefore(currentDate)) {
              // Add missed day to missedDays string
              missedDays += "${key.day}/${key.month}/${key.year} \n";
            }
          });
        }
      }

      // Return missed attendance days with description
      return "MISSED_ATTENDANCE_DESCRIPTION\n$missedDays";
    });

    /// Builds AttendanceLogModel entities (ENTRY + EXIT per individual) from
    /// attendanceCollection, mirroring _onSaveAsDraft / submitAttendanceDetails.
    /// Reuses clientReferenceId from existing logs for dedup on re-submit.
    ///
    /// Args:
    ///  - args[0]: attendanceCollection (Map<individualId, {status, signatureData, ...}>)
    ///  - args[1]: selectedDate (Map with 'entryTime' and 'exitTime' as epoch millis)
    ///  - args[2]: registerId (String)
    ///  - args[3]: existingLogs (List<AttendanceLogModel>) - optional, for dedup
    ///
    /// Returns: List<AttendanceLogModel> entities ready for CREATE action.
    FunctionRegistry.register('attendanceLogEntities', (args, stateData) {
      if (args.isEmpty || args.first == null) return <EntityModel>[];

      final attendanceCollection = args[0] as Map?;
      if (attendanceCollection == null || attendanceCollection.isEmpty) {
        return <EntityModel>[];
      }

      final selectedDate = args.length > 1 ? args[1] as Map? : null;
      final entryTime = (selectedDate?['entryTime'] as num?)?.toInt() ?? 0;
      final exitTime = (selectedDate?['exitTime'] as num?)?.toInt() ?? 0;

      final registerId = args.length > 2 ? args[2]?.toString() ?? '' : '';
      final List<dynamic> existingLogs =
          args.length > 3 && args[3] is List ? args[3] as List : [];

      final tenantId = FlowBuilderSingleton().selectedProject?.tenantId ?? '';
      final boundaryCode = AttendanceSingleton().boundary?.code ?? '';
      final userUuid = FlowBuilderSingleton().loggedInUser?.uuid ?? '';
      final now = DateTime.now().millisecondsSinceEpoch;

      final List<EntityModel> entities = [];

      for (final entry in attendanceCollection.entries) {
        final individualId = entry.key.toString();
        final data = entry.value as Map?;
        if (data == null) continue;

        final markStatus = (data['status'] as num?)?.toDouble() ?? -1;
        if (markStatus == -1) continue; // skip unmarked

        final isPresent = markStatus >= 1.0;
        final signatureData = data['signatureData'] as String?;
        final logStatus = isPresent
            ? EnumValues.active.toValue()
            : EnumValues.inactive.toValue();

        final additionalDetails = <String, dynamic>{
          if (boundaryCode.isNotEmpty)
            EnumValues.boundaryCode.toValue(): boundaryCode,
          if (signatureData != null) 'signatureData': signatureData,
        };

        final clientAudit = ClientAuditDetails(
          createdBy: userUuid,
          createdTime: now,
          lastModifiedBy: userUuid,
          lastModifiedTime: now,
        );
        final audit = AuditDetails(
          createdBy: userUuid,
          createdTime: now,
          lastModifiedBy: userUuid,
          lastModifiedTime: now,
        );

        // Reuse clientReferenceId from existing log if present (dedup)
        final existingEntryLog = existingLogs
            .where((l) =>
                l.individualId == individualId &&
                l.registerId == registerId &&
                l.type == EnumValues.entry.toValue() &&
                l.time == entryTime &&
                l.clientReferenceId != null)
            .toList();

        final existingExitLog = existingLogs
            .where((l) =>
                l.individualId == individualId &&
                l.registerId == registerId &&
                l.type == EnumValues.exit.toValue() &&
                l.time == exitTime &&
                l.clientReferenceId != null)
            .toList();

        // ENTRY log
        entities.add(AttendanceLogModel(
          clientReferenceId: existingEntryLog.isNotEmpty
              ? existingEntryLog.last.clientReferenceId!
              : IdGen.i.identifier,
          individualId: individualId,
          registerId: registerId,
          tenantId: tenantId,
          type: EnumValues.entry.toValue(),
          status: logStatus,
          time: entryTime,
          uploadToServer: true,
          rowVersion: 1,
          additionalDetails: additionalDetails,
          clientAuditDetails: clientAudit,
          auditDetails: audit,
        ));

        // EXIT log
        entities.add(AttendanceLogModel(
          clientReferenceId: existingExitLog.isNotEmpty
              ? existingExitLog.last.clientReferenceId!
              : IdGen.i.identifier,
          individualId: individualId,
          registerId: registerId,
          tenantId: tenantId,
          type: EnumValues.exit.toValue(),
          status: logStatus,
          time: exitTime,
          uploadToServer: true,
          rowVersion: 1,
          additionalDetails: additionalDetails,
          clientAuditDetails: clientAudit,
          auditDetails: audit,
        ));
      }

      return entities;
    });
  }

  //  Be sure to cancel subscription after you are done
  @override
  dispose() {
    subscription.cancel();
    stockDownloadProgress.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = context.read<AuthBloc>().state;
    final localSecureStore = LocalSecureStore.instance;
    if (state is! AuthAuthenticatedState) {
      return Container();
    }
    final roles = state.userModel.roles.map((e) {
      return e.code;
    });

    if (!(roles.contains(RolesType.distributor.toValue()) ||
        roles.contains(RolesType.registrar.toValue()))) {
      skipProgressBar = true;
    }

    final mappedItems = _getItems(context);

    final homeItems = mappedItems?.homeItems ?? [];
    final showcaseKeys = <GlobalKey>[
      if (!skipProgressBar) homeShowcaseData.distributorProgressBar.showcaseKey,
      ...(mappedItems?.showcaseKeys ?? []),
    ];

    return BlocListener<StockDownSyncBloc, StockDownSyncState>(
      listener: (context, stockDownSyncState) {
        stockDownSyncState.maybeWhen(
          orElse: () {},
          loading: (isPop) {
            if (isPop) {
              Navigator.of(context, rootNavigator: true)
                  .popUntil((route) => route is! PopupRoute);
            }
            DigitSyncDialog.show(
              context,
              type: DialogType.inProgress,
              label: localizations.translate(
                i18.home.stockSyncDataLabel,
              ),
              barrierDismissible: false,
            );
          },
          getBatchSize: (batchSize, projectId) {
            context.read<StockDownSyncBloc>().add(
                  StockDownSyncCheckTotalCountEvent(
                    projectId: projectId,
                    batchSize: batchSize,
                  ),
                );
          },
          dataFound: (initialServerCount, batchSize, offset, lastSyncedTime) {
            showStockDownloadDialog(
              context,
              model: DownloadBeneficiary(
                title: localizations.translate(
                  initialServerCount > 0
                      ? i18.common.stockDataFound
                      : i18.common.stockNoDataFound,
                ),
                projectId: context.projectId,
                boundaries: [],
                batchSize: batchSize,
                totalCount: initialServerCount,
                content: localizations.translate(
                  initialServerCount > 0
                      ? i18.common.stockDataFoundContent
                      : i18.common.stockNoDataFoundContent,
                ),
                primaryButtonLabel: localizations.translate(
                  initialServerCount > 0
                      ? i18.common.coreCommonDownload
                      : i18.acknowledgementSuccess.goToHome,
                ),
                secondaryButtonLabel: initialServerCount > 0
                    ? localizations.translate(
                        i18.common.coreCommonGoback,
                      )
                    : null,
              ),
              dialogType: DigitProgressDialogType.dataFound,
              isPop: true,
            );
          },
          inProgress: (syncCount, totalCount) {
            stockDownloadProgress.add(
              totalCount > 0 ? syncCount / totalCount : 0,
            );
            if (syncCount < 1) {
              showStockDownloadDialog(
                context,
                model: DownloadBeneficiary(
                  title: localizations.translate(
                    i18.beneficiaryDetails.dataDownloadInProgress,
                  ),
                  projectId: context.projectId,
                  boundaries: [],
                  syncCount: syncCount,
                  totalCount: totalCount,
                  prefixLabel: syncCount.toString(),
                  suffixLabel: totalCount.toString(),
                ),
                dialogType: DigitProgressDialogType.inProgress,
                isPop: true,
                downloadProgressController: stockDownloadProgress,
              );
            }
          },
          success: (syncedCount, totalCount) {
            Navigator.of(context, rootNavigator: true)
                .popUntil((route) => route is! PopupRoute);
            DigitSyncDialog.show(
              context,
              type: DialogType.complete,
              label: localizations.translate(
                i18.home.stockSyncDataLabel,
              ),
              primaryAction: DigitDialogActions(
                label: localizations.translate(
                  i18.acknowledgementSuccess.goToHome,
                ),
                action: (ctx) {
                  Navigator.pop(ctx);
                  context.router.replaceAll([HomeRoute()]);
                },
              ),
              barrierDismissible: true,
            );
          },
          failed: () {
            context.read<AppInitializationBloc>().state.maybeWhen(
                  orElse: () {},
                  initialized: (appConfiguration, _, __) {
                    showStockDownloadDialog(
                      context,
                      model: DownloadBeneficiary(
                        title: localizations.translate(
                          i18.common.coreCommonDownloadFailed,
                        ),
                        appConfiguartion: appConfiguration,
                        projectId: context.projectId,
                        boundaries: [],
                        primaryButtonLabel: localizations.translate(
                          i18.syncDialog.retryButtonLabel,
                        ),
                        secondaryButtonLabel: localizations.translate(
                          i18.common.coreCommonGoback,
                        ),
                      ),
                      dialogType: DigitProgressDialogType.failed,
                      isPop: true,
                    );
                  },
                );
          },
          totalCountCheckFailed: () {
            context.read<AppInitializationBloc>().state.maybeWhen(
                  orElse: () {},
                  initialized: (appConfiguration, _, __) {
                    showStockDownloadDialog(
                      context,
                      model: DownloadBeneficiary(
                        title: localizations.translate(
                          i18.common.coreCommonDownloadFailed,
                        ),
                        appConfiguartion: appConfiguration,
                        projectId: context.projectId,
                        boundaries: [],
                        primaryButtonLabel: localizations.translate(
                          i18.syncDialog.retryButtonLabel,
                        ),
                        secondaryButtonLabel: localizations.translate(
                          i18.common.coreCommonGoback,
                        ),
                      ),
                      dialogType: DigitProgressDialogType.checkFailed,
                      isPop: true,
                    );
                  },
                );
          },
          insufficientStorage: () {
            showStockDownloadDialog(
              context,
              model: DownloadBeneficiary(
                title: localizations.translate(
                  i18.beneficiaryDetails.insufficientStorage,
                ),
                content: localizations.translate(
                  i18.beneficiaryDetails.insufficientStorageContent,
                ),
                projectId: context.projectId,
                boundaries: [],
                primaryButtonLabel: localizations.translate(
                  i18.common.coreCommonOk,
                ),
              ),
              dialogType: DigitProgressDialogType.insufficientStorage,
              isPop: true,
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: DigitTheme.instance.colorScheme.surface,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ScrollableContent(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return homeItems.elementAt(index);
                  },
                  childCount: homeItems.length,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 145,
                  childAspectRatio: 104 / 128,
                ),
              ),
            ],
            header: Column(
              children: [
                BackNavigationHelpHeaderWidget(
                  showBackNavigation: false,
                  showHelp: false,
                  showcaseButton: ShowcaseButton(
                    showcaseFor: showcaseKeys.toSet().toList(),
                  ),
                ),
                // Show stock balance card for users with stock management access
                if (state.actionsWrapper.actions
                    .map((e) => e.displayName)
                    .contains(i18.home.manageStockLabel))
                  const StockBalanceCard(),
                skipProgressBar
                    ? const SizedBox.shrink()
                    : homeShowcaseData.distributorProgressBar.buildWith(
                        child: BeneficiaryProgressBar(
                          label: localizations.translate(
                            i18.home.progressIndicatorTitle,
                          ),
                          prefixLabel: localizations.translate(
                            i18.home.progressIndicatorPrefixLabel,
                          ),
                        ),
                      ),
                /////   hfreferral progress matrics
                if (state.actionsWrapper.actions
                    .map((e) => e.displayName)
                    .contains(i18.home.beneficiaryReferralLabel))
                  HFReferralProgressBar(
                    label: localizations.translate(
                      i18.home.progressIndicatorTitle,
                    ),
                    prefixLabel: localizations.translate(
                      i18.common.progressIndicatorPrefixLabelHFReferral,
                    ),
                  ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.only(bottom: spacer2),
              child: PoweredByDigit(
                version: Constants().version,
              ),
            ),
            children: [
              const SizedBox(height: spacer2 * 2),
              // INFO : Need to add sync bloc of package Here
              BlocConsumer<SyncBloc, SyncState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () => null,
                    pendingSync: (count) {
                      _syncDebouncer.run(() async {
                        if (count != 0) {
                          await localSecureStore.setManualSyncTrigger(false);
                          if (context.mounted) {
                            await performBackgroundService(
                              isBackground: false,
                              stopService: false,
                              context: context,
                            );
                          }
                        } else {
                          await localSecureStore.setManualSyncTrigger(true);
                        }
                      });
                    },
                    syncInProgress: () async {
                      await localSecureStore.setManualSyncTrigger(false);
                      if (context.mounted) {
                        DigitSyncDialog.show(
                          context,
                          type: DialogType.inProgress,
                          label: localizations.translate(
                            i18.syncDialog.syncInProgressTitle,
                          ),
                          barrierDismissible: false,
                        );
                      }
                    },
                    nothingPending: () async {
                      if (context.mounted) {
                        DigitSyncDialog.show(context,
                            type: DialogType.complete,
                            label: localizations.translate(
                              i18.syncDialog.noDataToSyncTitle,
                            ),
                            primaryAction: DigitDialogActions(
                              label: localizations.translate(
                                i18.syncDialog.closeButtonLabel,
                              ),
                              action: (ctx) {
                                Navigator.pop(ctx);
                              },
                            ),
                            barrierDismissible: true);
                      }
                    },
                    completedSync: () async {
                      Navigator.of(context, rootNavigator: true).pop();
                      await localSecureStore.setManualSyncTrigger(true);
                      if (context.mounted) {
                        DigitSyncDialog.show(context,
                            type: DialogType.complete,
                            label: localizations.translate(
                              i18.syncDialog.dataSyncedTitle,
                            ),
                            primaryAction: DigitDialogActions(
                              label: localizations.translate(
                                i18.syncDialog.closeButtonLabel,
                              ),
                              action: (ctx) {
                                Navigator.pop(ctx);
                              },
                            ),
                            barrierDismissible: true);
                      }
                    },
                    failedSync: (message) async {
                      await localSecureStore.setManualSyncTrigger(true);
                      if (context.mounted) {
                        _showSyncFailedDialog(
                          context,
                          message: localizations.translate(
                            i18.syncDialog.syncFailedTitle,
                          ),
                          errorMessage: message.isNotEmpty
                              ? localizations.translate(message)
                              : null,
                        );
                      }
                    },
                    failedDownSync: (message) async {
                      await localSecureStore.setManualSyncTrigger(true);
                      if (context.mounted) {
                        _showSyncFailedDialog(
                          context,
                          message: localizations.translate(
                            i18.syncDialog.downSyncFailedTitle,
                          ),
                          errorMessage: message.isNotEmpty
                              ? localizations.translate(message)
                              : null,
                        );
                      }
                    },
                    failedUpSync: (message) async {
                      await localSecureStore.setManualSyncTrigger(true);
                      if (context.mounted) {
                        _showSyncFailedDialog(
                          context,
                          message: localizations.translate(
                            i18.syncDialog.upSyncFailedTitle,
                          ),
                          errorMessage: message.isNotEmpty
                              ? localizations.translate(message)
                              : null,
                        );
                      }
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const Offstage(),
                    pendingSync: (count) {
                      return count == 0
                          ? const Offstage()
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: spacer2,
                              ),
                              child: InfoCard(
                                type: InfoType.info,
                                description: localizations
                                    .translate(i18.home.dataSyncInfoContent)
                                    .replaceAll('{}', count.toString()),
                                title: localizations.translate(
                                  i18.home.dataSyncInfoLabel,
                                ),
                              ),
                            );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSyncFailedDialog(
    BuildContext context, {
    required String message,
    String? errorMessage,
  }) {
    Navigator.of(context, rootNavigator: true).pop();

    DigitSyncDialog.show(
      context,
      type: DialogType.failed,
      label: errorMessage != null ? '$message\n$errorMessage' : message,
      primaryAction: DigitDialogActions(
        label: localizations.translate(
          i18.syncDialog.retryButtonLabel,
        ),
        action: (ctx) {
          Navigator.pop(ctx);
          // Sync Failed Manual Sync is Enabled
          attemptSyncUp(context);
        },
      ),
      secondaryAction: DigitDialogActions(
        label: localizations.translate(
          i18.syncDialog.closeButtonLabel,
        ),
        action: (ctx) => Navigator.pop(ctx),
      ),
    );
  }

  _HomeItemDataModel? _getItems(BuildContext context) {
    final state = context.read<AuthBloc>().state;
    if (state is! AuthAuthenticatedState) {
      return null;
    }

    final Map<String, Widget> homeItemsMap = {
      // INFO : Need to add home items of package Here
      i18.home.fileComplaint:
          homeShowcaseData.distributorFileComplaint.buildWith(
        child: HomeItemCard(
          icon: Icons.announcement,
          label: i18.home.fileComplaint,
          onPressed: () async {
            context.router.push(CurrentBoundaryRoute(
              onBoundarySelected: (ctx) async {
                final moduleName =
                    'hcm-complaints-${context.selectedProject.referenceID}';
                triggerLocalization(module: moduleName);
                isTriggerLocalisation = false;

                await FlowNavigationUtils.navigateToFlowModule(
                  context: ctx,
                  config: FlowModuleConfig(
                    schemaKey: 'COMPLAINTS',
                    sampleFlows: sampleComplaintFlows,
                    relationshipMappings: const [
                      RelationshipMapping(
                          from: 'pgrComplainant',
                          to: 'pgrService',
                          localKey: 'complaintClientReferenceId',
                          foreignKey: 'clientReferenceId'),
                      RelationshipMapping(
                          from: 'address',
                          to: 'pgrService',
                          localKey: 'relatedClientReferenceId',
                          foreignKey: 'clientReferenceId'),
                    ],
                    nestedModelMappings: const [
                      NestedModelMapping(
                        rootModel: 'pgrService',
                        fields: {
                          'user': NestedFieldMapping(
                            table: 'pgrComplainant',
                            localKey: 'clientReferenceId',
                            foreignKey: 'complaintClientReferenceId',
                            type: NestedMappingType.one,
                          ),
                          'address': NestedFieldMapping(
                            table: 'address',
                            localKey: 'clientReferenceId',
                            foreignKey: 'relatedClientReferenceId',
                            type: NestedMappingType.one,
                          )
                        },
                      ),
                    ],
                  ),
                );
              },
            ));
          },
        ),
      ),

      i18.home.dashboard: homeShowcaseData.dashBoard.buildWith(
        child: HomeItemCard(
          icon: Icons.bar_chart_sharp,
          label: i18.home.dashboard,
          onPressed: () {
            if (isTriggerLocalisation) {
              const module = "hcm-dashboard";
              triggerLocalization(module: module);
              isTriggerLocalisation = false;
            }
            context.router.push(const UserDashboardRoute());
          },
        ),
      ),

      i18.home.beneficiaryLabel:
          homeShowcaseData.distributorBeneficiaries.buildWith(
        child: HomeItemCard(
          icon: Icons.all_inbox,
          label: i18.home.beneficiaryLabel,
          onPressed: () async {
            context.router.push(CurrentBoundaryRoute(
              onBoundarySelected: (ctx) async {
                final moduleName =
                    'hcm-registration-${context.selectedProject.referenceID},hcm-beneficiary';
                triggerLocalization(module: moduleName);
                isTriggerLocalisation = false;

                final prefs = await SharedPreferences.getInstance();
                final schemaJsonRaw = prefs.getString('app_config_schemas');

                FlowBuilderSingleton().setPersistenceConfiguration(
                    persistenceConfiguration:
                        PersistenceConfiguration.offlineFirst);
                WidgetRegistry.initialize();
                CrudBlocSingleton().setData(
                  crudService: DigitCrudService(
                    context: ctx,
                    relationshipMap: [
                      const RelationshipMapping(
                          from: 'name',
                          to: 'individual',
                          localKey: 'individualClientReferenceId',
                          foreignKey: 'clientReferenceId'),
                      const RelationshipMapping(
                          from: 'identifier',
                          to: 'individual',
                          localKey: 'individualClientReferenceId',
                          foreignKey: 'clientReferenceId'),
                      const RelationshipMapping(
                          from: 'householdMember',
                          to: 'individual',
                          localKey: 'individualClientReferenceId',
                          foreignKey: 'clientReferenceId'),
                      const RelationshipMapping(
                          from: 'address',
                          to: 'household',
                          localKey: 'relatedClientReferenceId',
                          foreignKey: 'clientReferenceId'),
                      const RelationshipMapping(
                          from: 'householdMember',
                          to: 'household',
                          localKey: 'householdClientReferenceId',
                          foreignKey: 'clientReferenceId'),
                      const RelationshipMapping(
                          from: 'projectBeneficiary',
                          to: 'task',
                          localKey: 'clientReferenceId',
                          foreignKey: 'projectBeneficiaryClientReferenceId'),
                      const RelationshipMapping(
                          from: 'identifier',
                          to: 'hFReferral',
                          localKey: 'identifierId',
                          foreignKey: 'beneficiaryId'),
                      // Conditional mapping
                      if (FlowBuilderSingleton().beneficiaryType ==
                          BeneficiaryType.household)
                        const RelationshipMapping(
                          from: 'projectBeneficiary',
                          to: 'household',
                          localKey: 'beneficiaryClientReferenceId',
                          foreignKey: 'clientReferenceId',
                        )
                      else
                        const RelationshipMapping(
                          from: 'projectBeneficiary',
                          to: 'individual',
                          localKey: 'beneficiaryClientReferenceId',
                          foreignKey: 'clientReferenceId',
                        ),
                    ],
                    nestedModelMappings: [
                      const NestedModelMapping(
                        rootModel: 'individual',
                        fields: {
                          'name': NestedFieldMapping(
                            table: 'name',
                            localKey: 'clientReferenceId',
                            foreignKey: 'individualClientReferenceId',
                            type: NestedMappingType.one,
                          ),
                          'address': NestedFieldMapping(
                            table: 'address',
                            localKey: 'clientReferenceId',
                            foreignKey: 'relatedClientReferenceId',
                            type: NestedMappingType.many,
                          ),
                          'identifiers': NestedFieldMapping(
                            table: 'identifier',
                            localKey: 'clientReferenceId',
                            foreignKey: 'individualClientReferenceId',
                            type: NestedMappingType.many,
                          ),
                        },
                      ),
                      const NestedModelMapping(
                        rootModel: 'household',
                        fields: {
                          'address': NestedFieldMapping(
                            table: 'address',
                            localKey: 'clientReferenceId',
                            foreignKey: 'relatedClientReferenceId',
                            type: NestedMappingType.one,
                          ),
                        },
                      ),
                      const NestedModelMapping(
                        rootModel: 'task',
                        fields: {
                          'resource': NestedFieldMapping(
                            table: 'resource',
                            localKey: 'taskclientReferenceId',
                            foreignKey: 'clientReferenceId',
                            type: NestedMappingType.many,
                          ),
                        },
                      ),
                    ],
                    searchEntityRepository: ctx.read<SearchEntityRepository>(),
                  ),
                  dynamicEntityModelListener: EntityModelMapMapper(),
                );
                try {
                  // if (false) {
                  //   final allSchemas =
                  //       json.decode(schemaJsonRaw!) as Map<String, dynamic>;
                  //   final data = allSchemas['REGISTRATION'];
                  //
                  //   final registrationDeliveryData = data?['data'];
                  //   final flowsData = (registrationDeliveryData['flows']
                  //               as List<dynamic>?)
                  //           ?.map((e) => Map<String, dynamic>.from(e as Map))
                  //           .toList() ??
                  //       [];
                  //   FlowRegistry.setConfig(flowsData);
                  //   NavigationRegistry.setupNavigation(ctx);
                  //
                  //   ctx.router.push(
                  //     FlowBuilderHomeRoute(
                  //         pageName: registrationDeliveryData["initialPage"]),
                  //   );
                  // } else {
                  FlowRegistry.setConfig(
                      sampleFlows["flows"] as List<Map<String, dynamic>>);
                  NavigationRegistry.setupNavigation(ctx);
                  ctx.router.push(
                    FlowBuilderHomeRoute(pageName: sampleFlows["initialPage"]),
                  );
                  // }
                } catch (e) {
                  debugPrint('error $e');
                }
              },
            ));
          },
        ),
      ),

      /// TODO: NEED TO UPDATE CLF

      // i18.home.clfLabel: homeShowcaseData.clf.buildWith(
      //   child: HomeItemCard(
      //     icon: Icons.account_balance,
      //     label: i18.home.clfLabel,
      //     onPressed: () async {
      //       RegistrationDeliverySingleton()
      //           .setHouseholdType(HouseholdType.community);
      //       if (isTriggerLocalisation) {
      //         triggerLocalization();
      //         isTriggerLocalisation = false;
      //       }
      //       await context.router.push(const RegistrationDeliveryWrapperRoute());
      //     },
      //   ),
      // ),

      i18.home.closedHouseHoldLabel: homeShowcaseData.closedHouseHold.buildWith(
        child: HomeItemCard(
          icon: Icons.home,
          enableCustomIcon: true,
          customIconSize: 40,
          customIcon: Constants.closedHouseholdSvg,
          label: i18.home.closedHouseHoldLabel,
          onPressed: () async {
            context.router.push(CurrentBoundaryRoute(
              onBoundarySelected: (ctx) async {
                final moduleName =
                    'hcm-closehousehold-${context.selectedProject.referenceID}';
                triggerLocalization(module: moduleName);
                isTriggerLocalisation = false;

                await FlowNavigationUtils.navigateToFlowModule(
                  context: ctx,
                  config: FlowModuleConfig(
                    schemaKey: 'CLOSEHOUSEHOLD',
                    sampleFlows: sampleCloseHouseholdFlows,
                  ),
                );
              },
            ));
          },
        ),
      ),
      i18.home.manageStockLabel:
          homeShowcaseData.warehouseManagerManageStock.buildWith(
        child: HomeItemCard(
          icon: Icons.store_mall_directory,
          label: i18.home.manageStockLabel,
          onPressed: () async {
            FlowBuilderSingleton().setBoundary(
                boundary: BoundaryModel(
                    code: LeastLevelBoundarySingleton().boundary?.first));

            final moduleName =
                'hcm-inventory-${context.selectedProject.referenceID}';
            triggerLocalization(module: moduleName);
            isTriggerLocalisation = false;

            await FlowNavigationUtils.navigateToFlowModule(
              context: context,
              config: FlowModuleConfig(
                schemaKey: 'INVENTORY',
                sampleFlows: sampleInventoryFlows,
                relationshipMappings: const [
                  RelationshipMapping(
                      from: 'facility',
                      to: 'projectFacility',
                      localKey: 'id',
                      foreignKey: 'facilityId'),
                  RelationshipMapping(
                      from: 'projectResource',
                      to: 'projectFacility',
                      localKey: 'projectId',
                      foreignKey: 'projectId'),
                  RelationshipMapping(
                      from: 'productVariant',
                      to: 'projectResource',
                      localKey: 'id',
                      foreignKey: 'resource'),
                ],
                nestedModelMappings: const [
                  NestedModelMapping(
                    rootModel: 'projectFacility',
                    fields: {
                      'facility': NestedFieldMapping(
                        table: 'facility',
                        localKey: 'facilityId',
                        foreignKey: 'id',
                        type: NestedMappingType.one,
                      ),
                      'projectResources': NestedFieldMapping(
                        table: 'projectResource',
                        localKey: 'projectId',
                        foreignKey: 'projectId',
                        type: NestedMappingType.many,
                      ),
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      i18.home.stockReconciliationLabel:
          homeShowcaseData.wareHouseManagerStockReconciliation.buildWith(
        child: HomeItemCard(
          icon: Icons.menu_book,
          label: i18.home.stockReconciliationLabel,
          onPressed: () async {
            FlowBuilderSingleton().setBoundary(
                boundary: BoundaryModel(
                    code: LeastLevelBoundarySingleton().boundary?.first));

            final moduleName =
                'hcm-stockreconciliation-${context.selectedProject.referenceID}';
            triggerLocalization(module: moduleName);
            isTriggerLocalisation = false;

            await FlowNavigationUtils.navigateToFlowModule(
              context: context,
              config: FlowModuleConfig(
                schemaKey: 'STOCKRECONCILIATION',
                sampleFlows: stockReconciliationFlows,
                relationshipMappings: const [
                  RelationshipMapping(
                      from: 'facility',
                      to: 'projectFacility',
                      localKey: 'id',
                      foreignKey: 'facilityId'),
                  RelationshipMapping(
                      from: 'projectResource',
                      to: 'projectFacility',
                      localKey: 'projectId',
                      foreignKey: 'projectId'),
                  RelationshipMapping(
                      from: 'productVariant',
                      to: 'projectResource',
                      localKey: 'id',
                      foreignKey: 'resource'),
                  RelationshipMapping(
                      from: 'stock',
                      to: 'facility',
                      localKey: 'facilityId',
                      foreignKey: 'id'),
                ],
                nestedModelMappings: const [
                  NestedModelMapping(
                    rootModel: 'projectFacility',
                    fields: {
                      'facility': NestedFieldMapping(
                        table: 'facility',
                        localKey: 'facilityId',
                        foreignKey: 'id',
                        type: NestedMappingType.one,
                      ),
                      'projectResources': NestedFieldMapping(
                        table: 'projectResource',
                        localKey: 'projectId',
                        foreignKey: 'projectId',
                        type: NestedMappingType.many,
                      ),
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      i18.home.mySurveyForm: homeShowcaseData.supervisorMySurveyForm.buildWith(
        child: HomeItemCard(
          enableCustomIcon: true,
          customIcon: mySurveyFormSvg,
          iconPadding: const EdgeInsets.all(spacer1),
          icon: Icons.checklist,
          customIconSize: spacer8,
          label: i18.home.mySurveyForm,
          onPressed: () {
            // if (isTriggerLocalisation) {
            final moduleName =
                'hcm-checklist-${context.selectedProject.referenceID}';
            triggerLocalization(module: moduleName);
            isTriggerLocalisation = false;
            // }
            context.router.push(SurveyFormWrapperRoute());
          },
        ),
      ),

      i18.home.syncDataLabel: homeShowcaseData.distributorSyncData.buildWith(
        child: StreamBuilder<Map<String, dynamic>?>(
          stream: FlutterBackgroundService().on('serviceRunning'),
          builder: (context, snapshot) {
            final syncError = snapshot.data?['syncError'] as String?;
            if (syncError != null && context.mounted) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) {
                  DigitSyncDialog.show(
                    context,
                    type: DialogType.failed,
                    label:
                        '${localizations.translate(i18.syncDialog.syncFailedTitle)}\n${localizations.translate(syncError)}',
                    primaryAction: DigitDialogActions(
                      label: localizations.translate(
                        i18.syncDialog.closeButtonLabel,
                      ),
                      action: (ctx) => Navigator.pop(ctx),
                    ),
                    barrierDismissible: true,
                  );
                }
              });
            }
            return HomeItemCard(
              icon: Icons.sync_alt,
              label: i18.home.syncDataLabel,
              onPressed: () async {
                if (envConfig.variables.envType == EnvType.qa ||
                    envConfig.variables.envType == EnvType.dev ||
                    envConfig.variables.envType == EnvType.uat) {
                  if (context.mounted) attemptSyncUp(context);
                } else {
                  if (snapshot.data?['enablesManualSync'] == true) {
                    if (context.mounted) attemptSyncUp(context);
                  } else {
                    if (context.mounted) {
                      Toast.showToast(
                        context,
                        message: localizations
                            .translate(i18.common.coreCommonSyncInProgress),
                        type: ToastType.success,
                      );
                    }
                  }
                }
              },
            );
          },
        ),
      ),
      i18.home.stockSyncDataLabel: homeShowcaseData.stockSyncData.buildWith(
          child: HomeItemCard(
        icon: Icons.sync_alt,
        label: i18.home.stockSyncDataLabel,
        onPressed: () {
          triggerStockDownSync(context);
        },
      )),
      i18.home.beneficiaryReferralLabel:
          homeShowcaseData.hfBeneficiaryReferral.buildWith(
        child: HomeItemCard(
          icon: Icons.supervised_user_circle_rounded,
          label: i18.home.beneficiaryReferralLabel,
          onPressed: () async {
            context.router.push(CurrentBoundaryRoute(
              onBoundarySelected: (ctx) async {
                final moduleName =
                    'hcm-hfreferral-${context.selectedProject.referenceID}';
                triggerLocalization(module: moduleName);
                isTriggerLocalisation = false;

                await FlowNavigationUtils.navigateToFlowModule(
                  context: ctx,
                  config: FlowModuleConfig(
                    schemaKey: 'HFREFERRAL',
                    sampleFlows: sampleReferralFlows,
                  ),
                );
              },
            ));
          },
        ),
      ),
      i18.home.viewReportsLabel: homeShowcaseData.inventoryReport.buildWith(
        child: HomeItemCard(
          icon: Icons.announcement,
          label: i18.home.viewReportsLabel,
          onPressed: () async {
            FlowBuilderSingleton().setBoundary(
                boundary: BoundaryModel(
                    code: LeastLevelBoundarySingleton().boundary?.first));

            final moduleName =
                'hcm-stockreports-${context.selectedProject.referenceID}';
            triggerLocalization(module: moduleName);
            isTriggerLocalisation = false;

            await FlowNavigationUtils.navigateToFlowModule(
              context: context,
              config: FlowModuleConfig(
                schemaKey: 'STOCKREPORTS',
                sampleFlows: inventoryReportFlows,
                relationshipMappings: const [
                  RelationshipMapping(
                      from: 'facility',
                      to: 'projectFacility',
                      localKey: 'id',
                      foreignKey: 'facilityId'),
                  RelationshipMapping(
                      from: 'projectResource',
                      to: 'projectFacility',
                      localKey: 'projectId',
                      foreignKey: 'projectId'),
                  RelationshipMapping(
                      from: 'productVariant',
                      to: 'projectResource',
                      localKey: 'id',
                      foreignKey: 'resource'),
                  RelationshipMapping(
                      from: 'stockReconciliation',
                      to: 'facility',
                      localKey: 'facilityId',
                      foreignKey: 'id'),
                  RelationshipMapping(
                      from: 'stockReconciliation',
                      to: 'productVariant',
                      localKey: 'productVariantId',
                      foreignKey: 'id'),
                ],
                nestedModelMappings: const [
                  NestedModelMapping(
                    rootModel: 'projectFacility',
                    fields: {
                      'facility': NestedFieldMapping(
                        table: 'facility',
                        localKey: 'facilityId',
                        foreignKey: 'id',
                        type: NestedMappingType.one,
                      ),
                      'projectResources': NestedFieldMapping(
                        table: 'projectResource',
                        localKey: 'projectId',
                        foreignKey: 'projectId',
                        type: NestedMappingType.many,
                      ),
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      i18.home.manageAttendanceLabel:
          homeShowcaseData.manageAttendance.buildWith(
        child: HomeItemCard(
          icon: Icons.fingerprint_outlined,
          label: i18.home.manageAttendanceLabel,
          onPressed: () async {
            // Set up CRUD service
            CrudBlocSingleton().setData(
              crudService: DigitCrudService(
                context: context,
                relationshipMap: const [
                  RelationshipMapping(
                    from: 'attendanceRegister',
                    to: 'attendee',
                    localKey: 'id',
                    foreignKey: 'registerId',
                  ),
                  RelationshipMapping(
                    from: 'attendanceRegister',
                    to: 'attendance',
                    localKey: 'id',
                    foreignKey: 'registerId',
                  ),
                  RelationshipMapping(
                    from: 'individual',
                    to: 'name',
                    localKey: 'clientReferenceId',
                    foreignKey: 'individualClientReferenceId',
                  ),
                  RelationshipMapping(
                    from: 'attendee',
                    to: 'individual',
                    localKey: 'individualId',
                    foreignKey: 'id',
                  ),
                ],
                nestedModelMappings: const [
                  NestedModelMapping(
                    rootModel: 'attendanceRegister',
                    fields: {
                      'attendees': NestedFieldMapping(
                        table: 'attendee',
                        localKey: 'id',
                        foreignKey: 'registerId',
                        type: NestedMappingType.many,
                      ),
                      'attendanceLog': NestedFieldMapping(
                        table: 'attendance',
                        localKey: 'id',
                        foreignKey: 'registerId',
                        type: NestedMappingType.many,
                      ),
                    },
                  ),
                  NestedModelMapping(
                    rootModel: 'individual',
                    fields: {
                      'name': NestedFieldMapping(
                        table: 'name',
                        localKey: 'clientReferenceId',
                        foreignKey: 'individualClientReferenceId',
                        type: NestedMappingType.one,
                      ),
                    },
                  ),
                ],
                searchEntityRepository: context.read<SearchEntityRepository>(),
              ),
              dynamicEntityModelListener: EntityModelMapMapper(),
            );

            final prefs = await SharedPreferences.getInstance();
            final schemaJsonRaw = prefs.getString('app_config_schemas');

            FlowBuilderSingleton().setPersistenceConfiguration(
                persistenceConfiguration:
                    PersistenceConfiguration.offlineFirst);
            WidgetRegistry.initialize();
            try {
              NavigationRegistry.setupNavigation(context);
              context.router
                  .push(CurrentBoundaryRoute(onBoundarySelected: (ctx) async {
                if (isTriggerLocalisation) {
                  final moduleName =
                      'hcm-complaints-${context.selectedProject.referenceID}';
                  const module = "hcm-attendance";
                  triggerLocalization(module: module);
                  isTriggerLocalisation = false;
                }
                // triggerLocalization(module: moduleName);
                Map<String, dynamic> attendanceData =
                    attendanceFlows; // Adding custom attendance flows as the flows are not coming from the server for attendance module
                List<Map<String, dynamic>> flowsData =
                    (attendanceData['flows'] as List<dynamic>?)
                            ?.map((e) => Map<String, dynamic>.from(e as Map))
                            .toList() ??
                        [];
                FlowRegistry.setConfig(flowsData);
                NavigationRegistry.setupNavigation(context);
                context.router.push(
                  FlowBuilderHomeRoute(pageName: attendanceData["initialPage"]),
                );
              }));
            } catch (e) {
              debugPrint('error $e');
            }
          },
        ),
      ),
      i18.home.db: homeShowcaseData.db.buildWith(
        child: HomeItemCard(
          icon: Icons.table_chart,
          label: i18.home.db,
          onPressed: () async {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DriftDbViewer(
                  context.read<LocalSqlDataStore>(),
                ),
              ),
            );
          },
        ),
      ),
      i18.home.dataShare: homeShowcaseData.dataShare.buildWith(
        child: HomeItemCard(
          icon: Icons.send,
          label: i18.home.dataShare,
          onPressed: () async {
            const module = "hcm-peer-to-peer";
            // if (isTriggerLocalisation) {
            triggerLocalization(module: module);
            isTriggerLocalisation = false;
            // }
            context.router.push(const DataShareHomeRoute());
          },
        ),
      ),
      i18.home.dashboard: homeShowcaseData.dashBoard.buildWith(
        child: HomeItemCard(
          icon: Icons.bar_chart_sharp,
          label: i18.home.dashboard,
          onPressed: () {
            const module = "hcm-dashboard";
            // if (isTriggerLocalisation) {
            triggerLocalization(module: module);
            isTriggerLocalisation = false;
            // };
            context.router.push(const UserDashboardRoute());
          },
        ),
      ),

      /// TODO: NEED TO PICK CHANGES RELATED TO BENEFICIARY DOWNSYNC
      i18.home.beneficiaryIdLabel: homeShowcaseData.beneficiaryId.buildWith(
        child: HomeItemCard(
          label: i18.home.beneficiaryIdLabel,
          onPressed: () {
            // if (isTriggerLocalisation) {
            const module = "hcm-beneficiary";
            triggerLocalization(module: module);
            isTriggerLocalisation = false;
            // }
            context.router.push(BeneficiaryIdDownSyncRoute());
          },
          icon: Icons.account_box,
          enableCustomIcon: true,
          customIconSize: spacer9,
          customIcon: Constants.beneficiaryIdDownload,
        ),
      ),

      i18.home.transitPostLabel: homeShowcaseData.transitPost.buildWith(
          child: HomeItemCard(
        icon: Icons.vaccines_outlined,
        label: i18.home.transitPostLabel,
        onPressed: () {
          const module = "hcm-transit-post";
          // if (isTriggerLocalisation) {
          triggerLocalization(module: module);
          context.router.push(const TransitPostWrapperRoute());
        },
      )),
    };

    final Map<String, GlobalKey> homeItemsShowcaseMap = {
      // INFO : Need to add showcase keys of package Here
      i18.home.beneficiaryLabel:
          homeShowcaseData.distributorBeneficiaries.showcaseKey,
      i18.home.manageStockLabel:
          homeShowcaseData.warehouseManagerManageStock.showcaseKey,
      i18.home.stockReconciliationLabel:
          homeShowcaseData.wareHouseManagerStockReconciliation.showcaseKey,
      i18.home.mySurveyForm:
          homeShowcaseData.supervisorMySurveyForm.showcaseKey,
      i18.home.fileComplaint:
          homeShowcaseData.distributorFileComplaint.showcaseKey,
      i18.home.syncDataLabel: homeShowcaseData.distributorSyncData.showcaseKey,
      i18.home.viewReportsLabel: homeShowcaseData.inventoryReport.showcaseKey,
      i18.home.beneficiaryReferralLabel:
          homeShowcaseData.hfBeneficiaryReferral.showcaseKey,
      i18.home.manageAttendanceLabel:
          homeShowcaseData.manageAttendance.showcaseKey,
      i18.home.db: homeShowcaseData.db.showcaseKey,
      i18.home.closedHouseHoldLabel:
          homeShowcaseData.closedHouseHold.showcaseKey,
      i18.home.dashboard: homeShowcaseData.dashBoard.showcaseKey,
      i18.home.transitPostLabel: homeShowcaseData.transitPost.showcaseKey,
      // i18.home.clfLabel: homeShowcaseData.clf.showcaseKey, // TODO: Uncomment when CLF is implemented
      i18.home.beneficiaryIdLabel: homeShowcaseData.beneficiaryId.showcaseKey, // TODO: Uncomment when beneficiary downsync is implemented
      i18.home.dataShare: homeShowcaseData.dataShare.showcaseKey,
      i18.home.db: homeShowcaseData.db.showcaseKey,
      i18.home.stockSyncDataLabel: homeShowcaseData.stockSyncData.showcaseKey,
    };

    final homeItemsLabel = <String>[
      // INFO: Need to add items label of package Here
      i18.home.beneficiaryLabel,
      // i18.home.clfLabel, // TODO: Uncomment when CLF is implemented
      i18.home.transitPostLabel,
      i18.home.closedHouseHoldLabel,
      i18.home.manageStockLabel,
      i18.home.stockReconciliationLabel,
      i18.home.mySurveyForm,
      i18.home.fileComplaint,
      i18.home.syncDataLabel,
      i18.home.viewReportsLabel,
      i18.home.beneficiaryReferralLabel,
      i18.home.manageAttendanceLabel,
      i18.home.dashboard,
      i18.home.beneficiaryIdLabel, // TODO: Uncomment when beneficiary downsync is implemented
      i18.home.faceRegistrationLabel,
      i18.home.dataShare,
      i18.home.stockSyncDataLabel,
      i18.home.db,
    ];

    final List<String> filteredLabels = homeItemsLabel
        .where((element) =>
            state.actionsWrapper.actions
                .map((e) => e.displayName)
                .toList()
                .contains(element) ||
            element == i18.home.db)
        .toList();

    final showcaseKeys = filteredLabels
        .where((f) => f != i18.home.db)
        .map((label) => homeItemsShowcaseMap[label]!)
        .toList();

    if (envConfig.variables.envType == EnvType.demo && kReleaseMode) {
      filteredLabels.remove(i18.home.db);
    }
    if (!filteredLabels.contains(i18.home.beneficiaryIdLabel)) {
      filteredLabels.add(i18.home.beneficiaryIdLabel);
    }
    final List<Widget> widgetList =
        filteredLabels.map((label) => homeItemsMap[label]!).toList();

    return _HomeItemDataModel(
      widgetList,
      showcaseKeys,
    );
  }

  void triggerLocalization({String? module, bool? loadOnline}) {
    context.read<AppInitializationBloc>().state.maybeWhen(
          orElse: () {},
          initialized: (
            AppConfiguration appConfiguration,
            _,
            __,
          ) {
            final appConfig = appConfiguration;
            final localizationModulesList = appConfiguration.backendInterface;
            final selectedLocale =
                "en_MZ" ?? AppSharedPreferences().getSelectedLocale;
            LocalizationParams()
                .setCode(LeastLevelBoundarySingleton().boundary);
            if (loadOnline == true) {
              context
                  .read<LocalizationBloc>()
                  .add(LocalizationEvent.onRemoteLoadLocalization(
                    module: module ??
                        "${localizationModulesList?.interfaces.where((element) => element.type == Modules.localizationModule).map((e) => e.name.toString()).join(',')}",
                    tenantId: envConfig.variables.tenantId,
                    locale: selectedLocale!,
                    path: Constants.localizationApiPath,
                  ));
            } else {
              context
                  .read<LocalizationBloc>()
                  .add(LocalizationEvent.onLoadLocalization(
                    module: module != null && module.isNotEmpty
                        ? "$module,hcm-common,hcm-login,hcm-scanner,hcm-checklist,hcm-beneficiary"
                        : localizationModulesList?.interfaces
                                .where(
                                    (e) => e.type == Modules.localizationModule)
                                .map((e) => e.name.toString())
                                .join(',') ??
                            "",
                    tenantId: envConfig.variables.tenantId,
                    locale: selectedLocale!,
                    path: Constants.localizationApiPath,
                  ));
            }
          },
        );
  }
}

// Function to set initial Data required for the packages to run
void setPackagesSingleton(BuildContext context) {
  context.read<AppInitializationBloc>().state.maybeWhen(
      orElse: () {},
      initialized: (
        AppConfiguration appConfiguration,
        List<ServiceRegistry> serviceRegistry,
        List<DashboardConfigSchema?>? dashboardConfigSchema,
      ) {
        final filteredDashboardConfig = filterDashboardConfig(
            dashboardConfigSchema ?? [], context.projectTypeCode ?? "");
        loadLocalization(context, appConfiguration);
        // INFO : Need to add singleton of package Here
        TransitPostSingleton().setInitialData(
          resources: context.selectedProjectType?.resources,
          transitPostType: appConfiguration.transitPostType != null
              ? appConfiguration.transitPostType!.map((e) => e.code).toList()
              : [],
          loggedInUserUuid: context.loggedInUserUuid,
          projectId: context.selectedProject.id,
          minAge: context.selectedProjectType?.validMinAge,
          maxAge: context.selectedProjectType?.validMaxAge,
        );
        FlowBuilderSingleton().setInitialData(
          beneficiaryIdMinCount: appConfiguration.beneficiaryIdConfig?.first.minCount.toInt(),
          loggedInUser: context.loggedInUserModel,
          loggedInUserUuid: context.loggedInUserUuid,
          maxRadius: appConfiguration.maxRadius!,
          projectId: context.projectId,
          selectedBeneficiaryType: context.beneficiaryType,
          projectType: context.selectedProjectType,
          selectedProject: context.selectedProject,
          userRoles: context.loggedInUserRoles
              .map((role) => {
                    'code': role.code,
                    'name': role.name,
                  })
              .toList(),
        );
        AttendanceSingleton().setInitialData(
          project: context.selectedProject,
          loggedInIndividualId: context.loggedInIndividualId ?? '',
          loggedInUserUuid: context.loggedInUserUuid,
          appVersion: Constants().version,
          manualAttendanceReasons: appConfiguration.manualAttendanceReasons
                  ?.where((e) => e.active)
                  .map((e) => DropdownItem(name: e.name, code: e.code))
                  .toList() ??
              [],
        );

        SurveyFormSingleton().setInitialData(
          projectId: context.projectId,
          projectName: context.selectedProject.name,
          loggedInIndividualId: context.loggedInIndividualId ?? '',
          loggedInUserUuid: context.loggedInUserUuid,
          appVersion: Constants().version,
          roles: context.read<AuthBloc>().state.maybeMap(
              orElse: () => const Offstage(),
              authenticated: (res) {
                return res.userModel.roles
                    .map((e) => e.code.snakeCase.toUpperCase())
                    .toList();
              }),
          checklistTypes: (appConfiguration.checklistTypes ?? [])
              .map((e) => e.code)
              .toList(),
        );

        DashboardSingleton().setInitialData(
            projectId: context.projectId,
            tenantId: envConfig.variables.tenantId,
            dashboardConfig: filteredDashboardConfig.firstOrNull,
            appVersion: Constants().version,
            selectedProject: context.selectedProject,
            actionPath: Constants.getEndPoint(
              serviceRegistry: serviceRegistry,
              service: DashboardResponseModel.schemaName.toUpperCase(),
              action: ApiOperation.search.toValue(),
              entityName: DashboardResponseModel.schemaName,
            ));
        LocationTrackerSingleton().setInitialData(
          projectId: context.projectId,
          loggedInUserUuid: context.loggedInUserUuid,
        );
      });
}

void loadLocalization(
    BuildContext context, AppConfiguration appConfiguration) async {
  context.read<LocalizationBloc>().add(
      LocalizationEvent.onUpdateLocalizationIndex(
          index: appConfiguration.languages!.indexWhere((element) =>
              element.value == AppSharedPreferences().getSelectedLocale),
          code: AppSharedPreferences().getSelectedLocale!));
}

class _HomeItemDataModel {
  final List<Widget> homeItems;
  final List<GlobalKey> showcaseKeys;

  const _HomeItemDataModel(this.homeItems, this.showcaseKeys);
}
