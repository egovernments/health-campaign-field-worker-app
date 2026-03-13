import 'dart:async';
import 'dart:convert';
import 'package:attendance_management/router/attendance_router.gm.dart';
import 'package:collection/collection.dart';

import 'package:attendance_management/utils/utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto/crypto.dart';
import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_dss/data/local_store/no_sql/schema/dashboard_config_schema.dart';
import 'package:digit_dss/models/entities/dashboard_response_model.dart';
import 'package:digit_dss/router/dashboard_router.gm.dart';
import 'package:digit_dss/utils/utils.dart';
import 'package:digit_flow_builder/data/digit_crud_service.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_flow_builder/router/flow_builder_routes.gm.dart';
import 'package:digit_flow_builder/utils/function_registry.dart';
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
import 'package:transit_post/router/transit_post_router.gm.dart';
import 'package:transit_post/utils/utils.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/localization/localization.dart';
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
import '../utils/debound.dart';
import '../utils/environment_config.dart';
import '../utils/flow_navigation_utils.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/least_level_boundary_singleton.dart';
import '../utils/mark_attendance_executor.dart';
import '../utils/utils.dart';
import '../widgets/h_f_referral/evaluation_facility.dart';
import '../widgets/h_f_referral/project_cycles.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/home/home_item_card.dart';
import '../widgets/inventory/custom_facility_widgets.dart';
import '../widgets/inventory/custom_product_selection_card.dart';
import '../widgets/localized.dart';
import '../widgets/progress_bar/beneficiary_progress.dart';
import '../widgets/resource_card/custom_resource_card.dart';
import '../widgets/showcase/config/showcase_constants.dart';
import '../widgets/showcase/showcase_button.dart';
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

  @override
  initState() {
    super.initState();

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

  // Helper function matching hasLogWithType logic
  bool _hasLogWithType(attendanceLog, DateTime date, String type) {
    final logTime = type == 'ENTRY'
        ? DateTime(date.year, date.month, date.day, 9).millisecondsSinceEpoch
        : DateTime(date.year, date.month, date.day, 18).millisecondsSinceEpoch;

    if (attendanceLog == null) return false;

    return attendanceLog.any((element) {
      final elementTime = element.time;
      final elementType = element.type?.toString();
      return elementTime == logTime && elementType == type;
    });
  }

  bool _hasLogActiveStatus(attendanceLog, DateTime date, String type) {
    final logTime = type == 'ENTRY'
        ? DateTime(date.year, date.month, date.day, 9).millisecondsSinceEpoch
        : DateTime(date.year, date.month, date.day, 18).millisecondsSinceEpoch;

    if (attendanceLog == null) return false;

    return attendanceLog.any((element) {
      final elementTime = element.time;
      final elementType = element.type?.toString();
      final elementStatus = element.status;
      if (elementStatus == null) return false;
      if (elementTime == logTime && elementType == type) {
        return elementStatus == 'ACTIVE';
      }
      return false;
    });
  }

  double _attendanceStatus(List<dynamic>? attendanceLogs, String? individualId,
      DateTime selectedDate, Map? attendanceCollection) {
    // Check in-memory collection first — gives instant UI feedback after mark click
    if (attendanceCollection != null && individualId != null) {
      final entry = attendanceCollection[individualId];
      if (entry is Map) {
        return (entry['status'] as num?)?.toDouble() ?? -1.0;
      }
    }

    if (attendanceLogs == null || individualId == null) return -1.0;

    // Fall back to stored attendanceLog from DB
    final filteredAttendanceLogs = attendanceLogs
        .where((attendanceLog) =>
            attendanceLog.individualId?.toString() == individualId)
        .toList();

    if (filteredAttendanceLogs.isEmpty) return -1.0;

    // Process attendanceLog if it exists and is a List

    final hasMorningLog =
        _hasLogWithType(filteredAttendanceLogs, selectedDate, 'ENTRY');
    final hasEveningLog =
        _hasLogWithType(filteredAttendanceLogs, selectedDate, 'EXIT');
    if (hasMorningLog && hasEveningLog) {
      final morningLogActive =
          _hasLogActiveStatus(filteredAttendanceLogs, selectedDate, 'ENTRY');
      final eveningActive =
          _hasLogActiveStatus(filteredAttendanceLogs, selectedDate, 'EXIT');

      if (morningLogActive && eveningActive) {
        return 1.0; // present
      } else if (!morningLogActive && !eveningActive) {
        return 0.0; // absent
      } else {
        return 0.5; // half day
      }
    }
    return -1.0;
  }

  /// Register custom components for forms engine
  void _registerCustomComponents() {
// Register attendance executors
    ActionHandler.registry
        .register('MARK_ATTENDANCE', MarkAttendanceExecutor());
    ActionHandler.registry
        .register('SUBMIT_ATTENDANCE', SubmitAttendanceExecutor());

    // Example 1: Register a dynamic resource card with multi-page state access
    CustomComponentRegistry().registerBuilder(
      'resourceCard',
      (context, stateAccessor) {
        // Access data from any page in the flow
        final beneficiaryDetails =
            stateAccessor.getPageData('beneficiaryDetails');

        // Build your component with access to all this data
        return ResourceCard(
          stateData: beneficiaryDetails,
          pageSchema: 'DELIVERY',
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
        // Access data from RECORDSTOCK form (where formData is stored by NAVIGATION executor)
        final stockData = stateAccessor.getPageData('manageStock');

        // Build your component with access to all this data
        return FacilityCard(
          stateData: stockData,
          schemaName: 'RECORDSTOCK',
          formKey: 'facilityToWhich',
          dependantFormKey: 'teamCode',
        );
      },
    );
    CustomComponentRegistry().registerBuilder(
      'facilityFromWhich',
      (context, stateAccessor) {
        // Access data from RECORDSTOCK form (where formData is stored by NAVIGATION executor)
        final stockData = stateAccessor.getPageData('manageStock');

        // Build your component with access to all this data
        return FacilityCard(
          stateData: stockData,
          schemaName: 'RECORDSTOCK',
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
    FunctionRegistry.register('generateUniqueMaterialNoteNumber',
        (args, stateData) {
      // Generate a synchronous unique ID without async operations
      int timestamp = DateTime.now().millisecondsSinceEpoch;
      String userUuid = context.loggedInUserUuid;

      // Create a combined string with timestamp and user UUID
      String combinedId = '$userUuid$timestamp';

      // Generate SHA-256 hash
      List<int> bytes = utf8.encode(combinedId);
      Digest sha256Hash = sha256.convert(bytes);

      // Convert the hash to a 12-character string and make it uppercase
      String hashString = sha256Hash.toString();
      String uniqueId = hashString.substring(0, 12).toUpperCase();

      // Add a hyphen every 4 characters
      String formattedUniqueId = uniqueId.replaceAllMapped(
        RegExp(r'.{1,4}'),
        (match) => '${match.group(0)}-',
      );

      // Remove the last hyphen
      formattedUniqueId =
          formattedUniqueId.substring(0, formattedUniqueId.length - 1);

      if (kDebugMode) {
        print('uniqueId : $formattedUniqueId');
      }

      return formattedUniqueId;
    });
    registerTaskFunctions();
    FunctionRegistry.register('getQuantityLabel', (args, stateData) {
      if (args.isEmpty) return 'APPONE_INVENTORY_QUANTITY_RECEIVED_LABEL';

      final sku = args.first?.toString() ?? '';

      // Check if the resource is SPAQ-250 mg
      if (sku.trim().toString() == 'SPAQ - 250 mg' ||
          sku.trim().toString() == 'SPAQ - 500 mg') {
        return 'APPONE_INVENTORY_QUANTITY_RECEIVED_LABEL';
      }

      return 'APPONE_INVENTORY_QUANTITY_RECEIVED_LABEL';
    });

    // Stock Transaction Quantity Label Function
    FunctionRegistry.register('getStockQuantityLabel', (args, stateData) {
      if (args.isEmpty) return 'APPONE_INVENTORY_QUANTITY_LABEL';
      final stockEntryType = args.first?.toString().toUpperCase() ?? '';

      const labels = {
        'RECEIPT': 'APPONE_INVENTORY_QUANTITY_RECEIVED_LABEL',
        'RETURNED': 'APPONE_INVENTORY_QUANTITY_RETURNED_LABEL',
        'ISSUED': 'APPONE_INVENTORY_QUANTITY_SENT_LABEL',
        'DISPATCH': 'APPONE_INVENTORY_QUANTITY_SENT_LABEL',
        'LOSS': 'APPONE_INVENTORY_QUANTITY_LOST_LABEL',
        'DAMAGED': 'APPONE_INVENTORY_QUANTITY_DAMAGED_LABEL'
      };
      return labels[stockEntryType] ?? 'APPONE_INVENTORY_QUANTITY_LABEL';
    });

    // Inventory Report Functions
    FunctionRegistry.register('getReportTitle', (args, stateData) {
      if (args.isEmpty) return '';
      final reportType = args.first?.toString() ?? '';

      const titles = {
        'receipt': 'INVENTORY_REPORT_DETAILS_RECEIPT_REPORT_TITLE',
        'dispatch': 'INVENTORY_REPORT_DETAILS_DISPATCH_REPORT_TITLE',
        'returned': 'INVENTORY_REPORT_DETAILS_RETURNED_REPORT_TITLE',
        'damage': 'INVENTORY_REPORT_DETAILS_DAMAGE_REPORT_TITLE',
        'loss': 'INVENTORY_REPORT_DETAILS_LOSS_REPORT_TITLE',
        'reconciliation': 'INVENTORY_REPORT_DETAILS_RECONCILIATION_REPORT_TITLE'
      };
      return titles[reportType] ?? '';
    });

    FunctionRegistry.register('getTransactingPartyLabel', (args, stateData) {
      if (args.isEmpty) return '';
      final reportType = args.first?.toString() ?? '';

      const labels = {
        'receipt': 'INVENTORY_REPORT_DETAILS_RECEIPT_TRANSACTING_PARTY_LABEL',
        'dispatch': 'INVENTORY_REPORT_DETAILS_DISPATCH_TRANSACTING_PARTY_LABEL',
        'returned': 'INVENTORY_REPORT_DETAILS_RETURNED_TRANSACTING_PARTY_LABEL',
        'damage': 'INVENTORY_REPORT_DETAILS_DAMAGED_TRANSACTING_PARTY_LABEL',
        'loss': 'INVENTORY_REPORT_DETAILS_LOSS_TRANSACTING_PARTY_LABEL'
      };
      return labels[reportType] ?? '';
    });

    FunctionRegistry.register('getTransactingParty', (args, stateData) {
      if (args.length < 2) return '';
      final reportType = args[0]?.toString() ?? '';
      final item = args[1];

      if (item == null) return '';

      // For dispatch, show receiver; for others, show sender
      if (reportType == 'dispatch') {
        return item['receiverId']?.toString() ??
            item['receiverType']?.toString() ??
            '';
      }
      return item['senderId']?.toString() ??
          item['senderType']?.toString() ??
          '';
    });

    FunctionRegistry.register('getTransactionType', (args, stateData) {
      if (args.isEmpty) return [];
      final reportType = args.first?.toString() ?? '';

      const types = {
        'receipt': ['RECEIVED'],
        'dispatch': ['DISPATCHED'],
        'returned': ['RECEIVED'],
        'damage': ['DISPATCHED'],
        'loss': ['DISPATCHED']
      };
      return types[reportType] ?? [];
    });

    FunctionRegistry.register('getTransactionReason', (args, stateData) {
      if (args.isEmpty) return [];
      final reportType = args.first?.toString() ?? '';

      const reasons = {
        'receipt': ['RECEIVED'],
        'dispatch': [],
        'returned': ['RETURNED'],
        'damage': ['DAMAGED_IN_STORAGE', 'DAMAGED_IN_TRANSIT'],
        'loss': ['LOST_IN_STORAGE', 'LOST_IN_TRANSIT']
      };
      return reasons[reportType] ?? [];
    });

    FunctionRegistry.register('getStockEntryType', (args, stateData) {
      if (args.isEmpty) return '';
      final reportType = args.first?.toString() ?? '';

      const entryTypes = {
        'receipt': 'RECEIPT',
        'dispatch': 'ISSUED',
        'returned': 'RETURNED',
        'damage': 'DAMAGED',
        'loss': 'LOSS',
      };
      return entryTypes[reportType] ?? '';
    });

    FunctionRegistry.register('getSenderOrReceiver', (args, stateData) {
      if (args.isEmpty) return 'receiverId';
      final reportType = args.first?.toString() ?? '';
      // For dispatch/damage/loss the warehouse is the sender
      const senderTypes = {'dispatch', 'damage', 'loss'};
      return senderTypes.contains(reportType) ? 'senderId' : 'receiverId';
    });

    // Get secondary party type based on facility selection
    // Returns 'STAFF' if Delivery Team is selected, otherwise 'WAREHOUSE'
    FunctionRegistry.register('getSecondaryType', (args, stateData) {
      if (args.isEmpty) return 'WAREHOUSE';
      final facilityFromWhich = args.first?.toString() ?? '';
      return facilityFromWhich == 'Delivery Team' ? 'STAFF' : 'WAREHOUSE';
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

      // Check for attendance logs passed as second argument (from wrapper relations)
      dynamic attendanceLog;
      if (args.length > 1 && args[1] != null) {
        attendanceLog = args[1];
      } else {
        // Fallback: try to get from model's attendanceLog field
        try {
          attendanceLog = attendanceRegister.attendanceLog;
        } catch (_) {
          attendanceLog = null;
        }
      }

      // Get startDate and endDate from register
      int? startDate;
      int? endDate;
      try {
        startDate = attendanceRegister is Map
            ? attendanceRegister['startDate'] as int?
            : attendanceRegister.startDate as int?;
        endDate = attendanceRegister is Map
            ? attendanceRegister['endDate'] as int?
            : attendanceRegister.endDate as int?;
      } catch (_) {
        startDate = null;
        endDate = null;
      }

      // Process attendanceLog if it exists and is a List
      if (attendanceLog != null) {
        // Check if this is raw AttendanceLogModel data (has 'time' and 'type' fields)
        // final isRawLogData = attendanceLog.isNotEmpty;

        if (startDate != null && endDate != null) {
          // Calculate completed days using hasLogWithType logic
          final startDateTime = DateTime.fromMillisecondsSinceEpoch(startDate);
          final endDateTime = DateTime.fromMillisecondsSinceEpoch(endDate);
          final daysDifference = endDateTime.difference(startDateTime).inDays;
          final totalDays = daysDifference + 1;

          var completedDays = 0;

          // Check each day for completed attendance (both ENTRY and EXIT)
          for (int i = 0; i <= daysDifference; i++) {
            final currentDate = startDateTime.add(Duration(days: i));
            final hasMorningLog =
                _hasLogWithType(attendanceLog, currentDate, 'ENTRY');
            final hasEveningLog =
                _hasLogWithType(attendanceLog, currentDate, 'EXIT');
            if (hasMorningLog && hasEveningLog) {
              completedDays++;
            }
          }

          return '$completedDays/$totalDays';
        } else {
          // Legacy format: List<Map<DateTime, bool>>
          var completedDays = 0;
          final totalDays = attendanceLog.length;

          for (final element in attendanceLog) {
            if (element is Map && element.containsValue(true)) {
              completedDays++;
            }
          }

          return '$completedDays/$totalDays';
        }
      }

      return '0/0';
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

    FunctionRegistry.register('isAbsentMarked', (args, stateData) {
      List<dynamic>? attendanceLogs = args.isNotEmpty ? args[0] : null;
      String? individualId = args.length > 1 ? args[1]?.toString() : null;
      int? selectedDateRaw =
          args.length > 2 ? int.tryParse(args[2]?.toString() ?? '') : null;
      Map? attendanceCollection = args.length > 3 ? args[3] as Map? : null;

      DateTime selectedDate = selectedDateRaw != null
          ? DateTime.fromMillisecondsSinceEpoch(selectedDateRaw)
          : DateTime.now();

      double status = _attendanceStatus(
          attendanceLogs, individualId, selectedDate, attendanceCollection);
      if (status == -1.0) {
        return false;
      } else if (status == 1.0) {
        return false;
      } else if (status == 0.0) {
        return true;
      }
    });

    // Update attendanceStatus to also check in-memory collection (4th arg)
    FunctionRegistry.register('attendanceStatus', (args, stateData) {
      List<dynamic>? attendanceLogs = args.isNotEmpty ? args[0] : null;
      String? individualId = args.length > 1 ? args[1]?.toString() : null;
      int? selectedDateRaw =
          args.length > 2 ? int.tryParse(args[2]?.toString() ?? '') : null;
      Map? attendanceCollection = args.length > 3 ? args[3] as Map? : null;

      DateTime selectedDate = selectedDateRaw != null
          ? DateTime.fromMillisecondsSinceEpoch(selectedDateRaw)
          : DateTime.now();

      String attendanceUnmarked = 'ATTENDANCE_UNMARKED';
      String markAsPresent = 'MARK_AS_PRESENT';
      String markedAsAbsent = 'MARK_AS_ABSENT';
      double status = _attendanceStatus(
          attendanceLogs, individualId, selectedDate, attendanceCollection);
      if (status == -1.0) {
        return attendanceUnmarked;
      } else if (status == 1.0) {
        return markAsPresent;
      } else if (status == 0.0) {
        return markedAsAbsent;
      }
    });

    FunctionRegistry.register('isSameDay', (args, stateData) {
      if (args.isEmpty || args.first == null) return false;

      final date = args.first;
      if (date is! String) return false;

      final now = DateTime.now();
      final dateTime = DateTime.parse(date);
      bool isSameDay = dateTime.year == now.year &&
          dateTime.month == now.month &&
          dateTime.day == now.day;
      return isSameDay;
    });

    FunctionRegistry.register('isNotSameDay', (args, stateData) {
      if (args.isEmpty || args.first == null) return false;

      final date = args.first;
      if (date is! String) return false;

      final now = DateTime.now();
      final dateTime = DateTime.parse(date);
      bool isSameDay = dateTime.year == now.year &&
          dateTime.month == now.month &&
          dateTime.day == now.day;
      return !isSameDay;
    });

    // Helper to extract stockEntryType from additionalFields array
    String getStockEntryTypeFromFields(dynamic fields) {
      if (fields == null) return '';
      if (fields is List) {
        for (var field in fields) {
          if (field is Map && field['key'] == 'stockEntryType') {
            return field['value']?.toString().toUpperCase() ?? '';
          }
        }
      }
      return '';
    }

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
          register.endDate! > DateTime.now().millisecondsSinceEpoch;
    });

    // First page (viewTransaction) - shows sender for RECEIPT/RETURNED, receiver for ISSUED/DAMAGED/LOSS
    FunctionRegistry.register('getFirstPagePartyLabel', (args, stateData) {
      if (args.isEmpty) return 'INVENTORY_TRANSACTING_PARTY_LABEL';
      final stockEntryType = getStockEntryTypeFromFields(args.first);

      switch (stockEntryType) {
        case 'RECEIPT':
        case 'RETURNED':
          return 'INVENTORY_SENDER_LABEL';
        case 'ISSUED':
        case 'DAMAGED':
        case 'LOSS':
          return 'INVENTORY_RECEIVER_LABEL';
        default:
          return 'INVENTORY_TRANSACTING_PARTY_LABEL';
      }
    });

    FunctionRegistry.register('getFirstPageParty', (args, stateData) {
      if (args.length < 3) return '';
      final stockEntryType = getStockEntryTypeFromFields(args[0]);
      final senderId = args[1]?.toString() ?? '';
      final receiverId = args[2]?.toString() ?? '';

      switch (stockEntryType) {
        case 'RECEIPT':
        case 'RETURNED':
          return senderId;
        case 'ISSUED':
        case 'DAMAGED':
        case 'LOSS':
          return receiverId;
        default:
          return senderId;
      }
    });

    // Second page (viewTransactionDetails) - shows receiver for RECEIPT/RETURNED, sender for ISSUED/DAMAGED/LOSS
    FunctionRegistry.register('getSecondPagePartyLabel', (args, stateData) {
      if (args.isEmpty) return 'INVENTORY_TRANSACTING_PARTY_LABEL';
      final stockEntryType = getStockEntryTypeFromFields(args.first);

      switch (stockEntryType) {
        case 'RECEIPT':
        case 'RETURNED':
          return 'INVENTORY_RECEIVER_LABEL';
        case 'ISSUED':
        case 'DAMAGED':
        case 'LOSS':
          return 'INVENTORY_SENDER_LABEL';
        default:
          return 'INVENTORY_TRANSACTING_PARTY_LABEL';
      }
    });

    FunctionRegistry.register('getSecondPageParty', (args, stateData) {
      if (args.length < 3) return '';
      final stockEntryType = getStockEntryTypeFromFields(args[0]);
      final senderId = args[1]?.toString() ?? '';
      final receiverId = args[2]?.toString() ?? '';

      switch (stockEntryType) {
        case 'RECEIPT':
        case 'RETURNED':
          return receiverId;
        case 'ISSUED':
        case 'DAMAGED':
        case 'LOSS':
          return senderId;
        default:
          return receiverId;
      }
    });

    // Get user's assigned facility ID based on their role and boundary level
    // For distributors: returns the logged-in user UUID
    // For warehouse managers: returns the facility ID based on boundary type
    FunctionRegistry.register('getUserFacilityId', (args, stateData) {
      final isDistributor = context.loggedInUserRoles
          .where(
            (role) => role.code == RolesType.distributor.toValue(),
          )
          .toList()
          .isNotEmpty;
      final isWareHouseMgr = context.loggedInUserRoles
          .where((role) => role.code == RolesType.warehouseManager.toValue())
          .toList()
          .isNotEmpty;

      // For distributors who are not warehouse managers, return their user UUID
      if (isDistributor && !isWareHouseMgr) {
        return context.loggedInUserUuid ?? '';
      }

      // For warehouse managers and other roles, get facility from wrapper data
      if (stateData == null) return '';

      try {
        // Get facility list from stateData - CrudStateData has modelMap property
        List<Map<String, dynamic>>? projectFacilities;

        // stateData is CrudStateData which has modelMap: Map<String, List<Map<String, dynamic>>>
        if (stateData.modelMap != null) {
          projectFacilities = stateData.modelMap['ProjectFacilityModel'];
        }

        if (projectFacilities == null || projectFacilities.isEmpty) {
          return '';
        }

        // Return first facility ID (user's assigned facility)
        // Note: Could be enhanced to filter by boundary type if needed
        for (var facility in projectFacilities) {
          final facilityId = facility['facilityId']?.toString() ?? '';
          if (facilityId.isNotEmpty) {
            return facilityId;
          }
        }

        return '';
      } catch (e) {
        debugPrint('getUserFacilityId error: $e');
        return '';
      }
    });

    // Get facility name from facility ID
    FunctionRegistry.register('getFacilityName', (args, stateData) {
      if (args.isEmpty) return '';
      final facilityId = args.first?.toString() ?? '';
      if (facilityId.isEmpty) return '';

      // Return a localization key that can be translated
      return 'FAC_$facilityId';
    });

    // Get transaction status type for tag styling
    FunctionRegistry.register('getTransactionStatusType', (args, stateData) {
      if (args.isEmpty) return 'default';
      final transactionType = args.first?.toString().toUpperCase() ?? '';

      switch (transactionType) {
        case 'DISPATCHED':
          return 'warning'; // Orange/Yellow - pending action
        case 'RECEIVED':
          return 'success'; // Green - completed
        case 'RETURNED':
          return 'info'; // Blue - returned
        case 'DAMAGED':
        case 'LOSS':
          return 'error'; // Red - issue
        default:
          return 'default';
      }
    });
  }

  //  Be sure to cancel subscription after you are done
  @override
  dispose() {
    subscription.cancel();
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

    return Scaffold(
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
                    final debouncer = Debouncer(seconds: 5);
                    debouncer.run(() async {
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
                  failedSync: () async {
                    await localSecureStore.setManualSyncTrigger(true);
                    if (context.mounted) {
                      _showSyncFailedDialog(
                        context,
                        message: localizations.translate(
                          i18.syncDialog.syncFailedTitle,
                        ),
                      );
                    }
                  },
                  failedDownSync: () async {
                    await localSecureStore.setManualSyncTrigger(true);
                    if (context.mounted) {
                      _showSyncFailedDialog(
                        context,
                        message: localizations.translate(
                          i18.syncDialog.downSyncFailedTitle,
                        ),
                      );
                    }
                  },
                  failedUpSync: () async {
                    await localSecureStore.setManualSyncTrigger(true);
                    if (context.mounted) {
                      _showSyncFailedDialog(
                        context,
                        message: localizations.translate(
                          i18.syncDialog.upSyncFailedTitle,
                        ),
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
    );
  }

  void _showSyncFailedDialog(
    BuildContext context, {
    required String message,
  }) {
    Navigator.of(context, rootNavigator: true).pop();

    DigitSyncDialog.show(
      context,
      type: DialogType.failed,
      label: message,
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
            final moduleName =
                'hcm-complaints-${context.selectedProject.referenceID}';
            triggerLocalization(module: moduleName);
            isTriggerLocalisation = false;

            await FlowNavigationUtils.navigateToFlowModule(
              context: context,
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
            // if (isTriggerLocalisation) {
            final moduleName =
                'hcm-registration-${context.selectedProject.referenceID}';
            triggerLocalization(module: moduleName);
            isTriggerLocalisation = false;
            // }

            final prefs = await SharedPreferences.getInstance();
            final schemaJsonRaw = prefs.getString('app_config_schemas');

            FlowBuilderSingleton().setPersistenceConfiguration(
                persistenceConfiguration:
                    PersistenceConfiguration.offlineFirst);
            WidgetRegistry.initialize();
            CrudBlocSingleton().setData(
              crudService: DigitCrudService(
                context: context,
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
                      from: 'projectBeneficiary',
                      to: 'referral',
                      localKey: 'clientReferenceId',
                      foreignKey: 'projectBeneficiaryClientReferenceId'),
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
                searchEntityRepository: context.read<SearchEntityRepository>(),
              ),
              dynamicEntityModelListener: EntityModelMapMapper(),
            );
            try {
              if (schemaJsonRaw != null) {
                final allSchemas =
                    json.decode(schemaJsonRaw) as Map<String, dynamic>;
                final data = allSchemas['REGISTRATION'];

                final registrationDeliveryData = data?['data'];
                final flowsData =
                    (registrationDeliveryData['flows'] as List<dynamic>?)
                            ?.map((e) => Map<String, dynamic>.from(e as Map))
                            .toList() ??
                        [];
                FlowRegistry.setConfig(flowsData);
                NavigationRegistry.setupNavigation(context);

                context.router.push(
                  FlowBuilderHomeRoute(
                      pageName: registrationDeliveryData["initialPage"]),
                );
              } else {
                FlowRegistry.setConfig(
                    sampleFlows["flows"] as List<Map<String, dynamic>>);
                NavigationRegistry.setupNavigation(context);
                context.router.push(
                  FlowBuilderHomeRoute(pageName: sampleFlows["initialPage"]),
                );
              }
            } catch (e) {
              debugPrint('error $e');
            }
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
            final moduleName =
                'hcm-closehousehold-${context.selectedProject.referenceID}';
            triggerLocalization(module: moduleName);
            isTriggerLocalisation = false;

            await FlowNavigationUtils.navigateToFlowModule(
              context: context,
              config: FlowModuleConfig(
                schemaKey: 'CLOSEHOUSEHOLD',
                sampleFlows: sampleCloseHouseholdFlows,
              ),
            );
          },
        ),
      ),
      i18.home.manageStockLabel:
          homeShowcaseData.warehouseManagerManageStock.buildWith(
        child: HomeItemCard(
          icon: Icons.store_mall_directory,
          label: i18.home.manageStockLabel,
          onPressed: () async {
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
      i18.home.beneficiaryReferralLabel:
          homeShowcaseData.hfBeneficiaryReferral.buildWith(
        child: HomeItemCard(
          icon: Icons.supervised_user_circle_rounded,
          label: i18.home.beneficiaryReferralLabel,
          onPressed: () async {
            final moduleName =
                'hcm-hfreferral-${context.selectedProject.referenceID}';
            triggerLocalization(module: moduleName);
            isTriggerLocalisation = false;

            await FlowNavigationUtils.navigateToFlowModule(
              context: context,
              config: FlowModuleConfig(
                schemaKey: 'HFREFERRAL',
                sampleFlows: sampleReferralFlows,
              ),
            );
          },
        ),
      ),
      i18.home.viewReportsLabel: homeShowcaseData.inventoryReport.buildWith(
        child: HomeItemCard(
          icon: Icons.announcement,
          label: i18.home.viewReportsLabel,
          onPressed: () async {
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
            // if (isTriggerLocalisation) {
            const module = "hcm-attendance";
            triggerLocalization(module: module);
            isTriggerLocalisation = false;
            // };
            // context.router.push(const ManageAttendanceRoute());

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
                    from: 'attendee',
                    to: 'individual',
                    localKey: 'individualId',
                    foreignKey: 'id',
                  ),
                  RelationshipMapping(
                    from: 'individual',
                    to: 'name',
                    localKey: 'clientReferenceId',
                    foreignKey: 'individualClientReferenceId',
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
              if (schemaJsonRaw != null) {
                final allSchemas =
                    json.decode(schemaJsonRaw) as Map<String, dynamic>;
                Map<String, dynamic> data = allSchemas['ATTENDANCE'];

                // final attendanceData = data?['data'];
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
              } else {
                FlowRegistry.setConfig(
                    sampleFlows["flows"] as List<Map<String, dynamic>>);
                NavigationRegistry.setupNavigation(context);
                context.router.push(
                  FlowBuilderHomeRoute(
                      pageName: attendanceFlows["initialPage"]),
                );
              }
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
      // i18.home.beneficiaryIdLabel: homeShowcaseData.beneficiaryId.buildWith(
      //   child: HomeItemCard(
      //     label: i18.home.beneficiaryIdLabel,
      //     onPressed: () {
      //       // if (isTriggerLocalisation) {
      //       triggerLocalization();
      //       isTriggerLocalisation = false;
      //       // }
      //       context.router.push(BeneficiaryIdDownSyncRoute());
      //     },
      //     icon: Icons.account_box,
      //     enableCustomIcon: true,
      //     customIconSize: spacer9,
      //     customIcon: Constants.beneficiaryIdDownload,
      //   ),
      // ),
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
      // i18.home.beneficiaryIdLabel: homeShowcaseData.beneficiaryId.showcaseKey, // TODO: Uncomment when beneficiary downsync is implemented
      i18.home.dataShare: homeShowcaseData.dataShare.showcaseKey,
      i18.home.db: homeShowcaseData.db.showcaseKey,
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
      // i18.home.beneficiaryIdLabel, // TODO: Uncomment when beneficiary downsync is implemented
      i18.home.dataShare,
      i18.home.db,
    ];

    final List<String> filteredLabels = homeItemsLabel
        .where((element) =>
            state.actionsWrapper.actions
                .map((e) => e.displayName)
                .toList()
                .contains(element) ||
            element == i18.home.db ||
            element == i18.home.manageAttendanceLabel)
        .toList();

    final showcaseKeys = filteredLabels
        .where((f) => f != i18.home.db)
        .map((label) => homeItemsShowcaseMap[label]!)
        .toList();

    if (envConfig.variables.envType == EnvType.demo && kReleaseMode) {
      filteredLabels.remove(i18.home.db);
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
            final selectedLocale = AppSharedPreferences().getSelectedLocale;
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
                        ? "$module,hcm-common,hcm-login,hcm-scanner,hcm-checklist"
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
