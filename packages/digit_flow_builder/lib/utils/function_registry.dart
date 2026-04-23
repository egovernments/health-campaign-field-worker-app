import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/attendance_log.dart';
import 'package:digit_data_model/models/entities/project_type.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:digit_flow_builder/widget_registry.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'interpolation.dart';

class TaskStatus {
  static const String administrationSuccess = 'ADMINISTRATION_SUCCESS';
  static const String delivered = 'DELIVERED';
  static const String ineligible = 'INELIGIBLE';
  static const String notDelivered = 'NOT_DELIVERED';
  static const String beneficiaryDied = 'BENEFICIARY_DIED';
  static const String beneficiaryMigrated = 'BENEFICIARY_MIGRATED';
  static const String beneficiaryAbsent = 'BENEFICIARY_ABSENT';
  static const String beneficiaryRefused = 'BENEFICIARY_REFUSED';
  static const String visited = 'VISITED';
}

/// The signature for a function that can be registered in the [FunctionRegistry].
///
/// - `args`: A list of dynamic arguments passed to the function.
/// - `stateData`: The state data from the form, used to access other data models.
typedef RegistryFunction = dynamic Function(
    List<dynamic> args, CrudStateData stateData);

/// A registry for storing and retrieving functions by a given name.
///
/// This class provides a centralized way to register and invoke functions
/// that can be called from within the application's forms or business logic.
/// It supports direct invocation and type-safe helpers for common return types.
class FunctionRegistry {
  static final Map<String, RegistryFunction> _registry = {};
  static BuildContext? _context;

  static void setContext(BuildContext context) => _context = context;
  static void clearContext() => _context = null;
  static BuildContext? get context => _context;

  /// Registers a function with a given name.
  ///
  /// - `name`: The unique name for the function.
  /// - `fn`: The [RegistryFunction] to be registered.
  static void register(String name, RegistryFunction fn) {
    _registry[name] = fn;
  }

  /// Retrieves a registered function by its name.
  ///
  /// - `name`: The name of the function to retrieve.
  ///
  /// Returns the [RegistryFunction] if found, otherwise `null`.
  static RegistryFunction? get(String name) => _registry[name];

  /// Invokes a registered function by name.
  ///
  /// This is the primary method for calling a function. It's kept for
  /// backward compatibility.
  ///
  /// - `name`: The name of the function to call.
  /// - `args`: A list of arguments to pass to the function.
  /// - `stateData`: The form's state data.
  ///
  /// Returns the result of the function call, which can be of any type.
  static dynamic call(
      String name, List<dynamic> args, CrudStateData stateData) {
    final fn = get(name);
    return fn?.call(args, stateData);
  }

  /// Invokes a registered function and returns a `bool`.
  ///
  /// If the function's return type is not a `bool`, it returns `false`.
  static bool invokeBool(
      String name, List<dynamic> args, CrudStateData stateData) {
    final result = call(name, args, stateData);
    return result is bool ? result : false;
  }

  /// Invokes a registered function and returns a `String`.
  ///
  /// If the function's return type is not a `String`, it returns an empty string.
  static String invokeString(
      String name, List<dynamic> args, CrudStateData stateData) {
    final result = call(name, args, stateData);
    return result?.toString() ?? '';
  }

  /// Invokes a registered function and returns a `num`.
  ///
  /// If the function's return type is not a `num`, it returns `0`.
  static num invokeNum(
      String name, List<dynamic> args, CrudStateData stateData) {
    final result = call(name, args, stateData);
    return result is num ? result : 0;
  }
}

/// Checks the status of a list of tasks based on the last task and the current project cycle.
///
/// The function determines if a new task can be created. It checks if:
/// 1. The last task has a "delivered" status.
/// 2. 24 hours have passed since the last task was created, even if it wasn't delivered.
///
/// - `tasks`: A list of maps representing the tasks.
/// - `currentCycle`: The current active project cycle.
///
/// Returns `true` if a new task can be created, otherwise `false`.
bool checkStatusInternal(
  List<Map<String, dynamic>>? tasks,
  ProjectCycle? currentCycle,
) {
  if (currentCycle == null) return false;
  if (tasks == null || tasks.isEmpty) return true;

  final lastTask = tasks.last;
  final lastTaskCreatedTime =
      lastTask['clientAuditDetails']?['createdTime'] as int?;

  if (lastTaskCreatedTime == null) return false;

  final date = DateTime.fromMillisecondsSinceEpoch(lastTaskCreatedTime);
  final diff = DateTime.now().difference(date);

  final startDate = currentCycle.startDate as int? ?? 0;
  final endDate = currentCycle.endDate as int? ?? 0;

  final isLastCycleRunning =
      lastTaskCreatedTime >= startDate && lastTaskCreatedTime <= endDate;

  if (isLastCycleRunning) {
    if (lastTask['status'] == 'delivered') {
      return true;
    }
    return diff.inHours >= 24; // TODO: Move gap to config
  }

  return true;
}

/// Checks if a side effect was recorded for the last task within the current cycle.
///
/// - `selectedCycle`: The current active project cycle.
/// - `lastTask`: The last task as a Map<String, dynamic>.
/// - `sideEffects`: List of side effects as List<Map<String, dynamic>>.
///
/// Returns `true` if a side effect was recorded for the last task within the cycle's date range.
bool _recordedSideEffectInternal(
  ProjectCycle? selectedCycle,
  Map<String, dynamic>? lastTask,
  List<Map<String, dynamic>>? sideEffects,
) {
  if (selectedCycle != null &&
      selectedCycle.startDate != null &&
      selectedCycle.endDate != null) {
    if (lastTask != null && (sideEffects ?? []).isNotEmpty) {
      final lastSideEffect = sideEffects!.last;
      final taskClientRefId = lastTask['clientReferenceId']?.toString();
      final sideEffectTaskClientRefId =
          lastSideEffect['taskClientReferenceId']?.toString();

      // Get the task's created time if the side effect references this task
      int? lastTaskCreatedTime;
      if (taskClientRefId == sideEffectTaskClientRefId) {
        lastTaskCreatedTime =
            lastTask['clientAuditDetails']?['createdTime'] as int?;
      }

      return lastTaskCreatedTime != null &&
          lastTaskCreatedTime >= (selectedCycle.startDate ?? 0) &&
          lastTaskCreatedTime <= (selectedCycle.endDate ?? 0);
    }
  }

  return false;
}

// Helper function matching hasLogWithType logic
bool _hasLogWithType(attendanceLog, DateTime date, String type) {
  final logTime = type == 'ENTRY'
      ? DateTime(date.year, date.month, date.day, 9).millisecondsSinceEpoch
      : DateTime(date.year, date.month, date.day, 18).millisecondsSinceEpoch;

  return attendanceLog.any((element) {
    if (element is! AttendanceLogModel) return false;
    final elementTime = element.time;
    final elementType = element.type?.toString();
    return elementTime == logTime && elementType == type;
  });
}

/// Initializes the [FunctionRegistry] with application-specific functions.
///
/// This function should be called at application startup to populate the
/// registry with all necessary business logic functions.
void initializeFunctionRegistry() {
  /// Registers a function to calculate age from a date of birth.
  ///
  /// - **Function Name**: `'calculateAge'`
  /// - **Arguments**: A list where the first element is the date of birth string.
  /// - **Returns**: A formatted string like `"1y 2m"` or `"--"` if the input is invalid.
  FunctionRegistry.register('formatDate', (args, stateData) {
    if (args.isEmpty) return '--';

    final rawValue = args.first;
    if (rawValue == null) return '--';

    String? rawType = args.length > 1 ? args[1]?.toString() : null;

    if (rawType != null) {
      rawType = rawType.replaceAll(RegExp(r'^\{\{\s*|\s*\}\}$'), '');
    }

    // now safely remove quotes and lowercase
    final type =
        rawType?.replaceAll(RegExp("^['\"]|['\"]\$"), '').toLowerCase() ?? '';

    final format = args.length > 2
        ? args[2]?.replaceAll(RegExp(r'^\{\{\s*|\s*\}\}$'), '').toString()
        : null;

    // handle timestamps passed as int
    DateTime? parseDate(dynamic value) {
      if (value is int) {
        return DateTime.fromMillisecondsSinceEpoch(value);
      }
      if (value is String) {
        // Try parsing as int timestamp first
        final timestamp = int.tryParse(value);
        if (timestamp != null) {
          return DateTime.fromMillisecondsSinceEpoch(timestamp);
        }

        // Otherwise, parse as formatted date string
        return DigitDateUtils.getFormattedDateToDateTime(value);
      }
      if (value is DateTime) {
        return DigitDateUtils.getFormattedDateToDateTime(rawType!);
      }
      return null;
    }

    switch (type) {
      case 'age':
        final dob = parseDate(rawValue);
        if (dob == null) return '--';
        final age = DigitDateUtils.calculateAge(dob);
        return "${age.years}y ${age.months}m";

      case 'date':
        final date = parseDate(rawValue);
        if (date == null) return '--';
        return DateFormat(format ?? "dd MMM yyyy").format(date);

      case 'datetime':
        final date = parseDate(rawValue);
        if (date == null) return '--';
        return DateFormat(format ?? "dd MMM yyyy HH:mm").format(date);

      case 'ageinmonths':
        DateTime? birthDate;

        if (rawValue is int) {
          birthDate = DateTime.fromMillisecondsSinceEpoch(rawValue);
        } else if (rawValue is String) {
          // Try parsing as timestamp first
          final timestamp = int.tryParse(rawValue);
          if (timestamp != null) {
            birthDate = DateTime.fromMillisecondsSinceEpoch(timestamp);
          } else if (rawValue.contains('/')) {
            // Handle dd/MM/yyyy format
            try {
              final parts = rawValue.split('/');
              if (parts.length == 3) {
                final day = int.parse(parts[0]);
                final month = int.parse(parts[1]);
                final year = int.parse(parts[2]);
                birthDate = DateTime(year, month, day);
              }
            } catch (_) {
              // Fall through to DateTime.tryParse
            }
          }
          // Try parsing as ISO date string
          birthDate ??= DateTime.tryParse(rawValue);
        } else if (rawValue is DateTime) {
          birthDate = rawValue;
        }

        if (birthDate == null) return 0;

        final now = DateTime.now();
        final months =
            (now.year - birthDate.year) * 12 + (now.month - birthDate.month);

        // Adjust if the day hasn't occurred yet this month
        if (now.day < birthDate.day) {
          return months - 1;
        }

        return months;

      default:
        return rawValue.toString();
    }
  });

  /// Registers a function to check eligibility for a task based on age and
  /// recorded side effects.
  ///
  /// - **Function Name**: `'checkEligibilityForAgeAndSideEffect'`
  /// - **Arguments**: A list where the first element is the date of birth string.
  /// - **Returns**: `true` if the beneficiary is eligible, otherwise `false`.
  ///
  /// The function checks:
  /// 1. If the beneficiary's age falls within the project's valid age range.
  /// 2. If a side effect was recorded for the last completed task within the current cycle.
  /// 3. If the `checkStatus` function allows for a new task to be created.
  FunctionRegistry.register('checkEligibilityForAgeAndSideEffect',
      (args, stateData) {
    if (args.isEmpty) return false;

// --- Resolve DOB ---
    final dobString = args.first?.toString() ?? '';
    if (dobString.isEmpty) return false;

    final dob = DigitDateUtils.getFormattedDateToDateTime(dobString);
    if (dob == null) return false;

    final age = DigitDateUtils.calculateAge(dob);
    final totalAgeMonths = age.years * 12 + age.months;

// --- ProjectType comes from FlowBuilderSingleton ---
    final projectType = FlowBuilderSingleton().projectType;
    if (projectType == null) return false;

// --- Tasks & SideEffects come from stateData ---
    final tasks = args.length > 1 ? args[1] : [];
    final sideEffects = (stateData.modelMap['sideEffects'] as List?) ?? [];

// --- Current active cycle ---
    Map<String, dynamic>? currentCycle;
    for (final e in projectType.cycles ?? []) {
      if ((e.startDate ?? 0) < DateTime.now().millisecondsSinceEpoch &&
          (e.endDate ?? 0) > DateTime.now().millisecondsSinceEpoch) {
        currentCycle = {
          "startDate": e.startDate,
          "endDate": e.endDate,
        };
        break;
      }
    }
    if (currentCycle == null) return false;

// --- Check age eligibility ---
    int validMinAge = projectType.validMinAge ?? 3;
    int validMaxAge = projectType.validMaxAge ?? 59;

    final isWithinAge =
        totalAgeMonths >= validMinAge && totalAgeMonths <= validMaxAge;
    totalAgeMonths <= validMaxAge;

    if (!isWithinAge) return false;

// --- Eligibility logic ---
    bool recordedSideEffect = false;

    if (tasks.isNotEmpty) {
      // Get currentRunningCycle from third argument if provided
      final currentRunningCycle =
          args.length > 2 ? int.tryParse(args[2]?.toString() ?? '') : null;

      for (final item in tasks) {
        Map<String, dynamic> task;

        if (item is Map<String, dynamic>) {
          task = item;
        } else {
          try {
            task = (item as dynamic).toMap() as Map<String, dynamic>;
          } catch (_) {
            try {
              task = (item as dynamic).toJson() as Map<String, dynamic>;
            } catch (_) {
              continue;
            }
          }
        }

        // BENEFICIARY_DIED returns false immediately regardless of cycle
        if (task['status'] == TaskStatus.beneficiaryDied) return false;

        // INELIGIBLE status returns false immediately if no cycle filtering is needed
        if (task['status'] == TaskStatus.ineligible) return false;

        // For other ineligible statuses, only check tasks matching the current cycle
        if (currentRunningCycle != null) {
          final additionalFields = task['additionalFields'];
          final fields = additionalFields is Map
              ? additionalFields['fields'] as List?
              : null;
          int? taskCycleIndex;
          if (fields != null) {
            for (final field in fields) {
              if (field is Map && field['key'] == 'cycleIndex') {
                taskCycleIndex = int.tryParse(field['value']?.toString() ?? '');
                break;
              }
            }
          }
          if (taskCycleIndex != currentRunningCycle) continue;
        }

        if (task['status'] == TaskStatus.ineligible ||
            task['status'] == TaskStatus.beneficiaryMigrated ||
            task['status'] == TaskStatus.beneficiaryAbsent ||
            task['status'] == TaskStatus.beneficiaryRefused) return false;
      }
    }

    if (tasks.isNotEmpty && sideEffects.isNotEmpty) {
      final lastTask = tasks.last as Map<String, dynamic>;
      final lastSideEffect = sideEffects.last as Map<String, dynamic>;

      final lastTaskTime = (lastTask['clientReferenceId'] ==
              lastSideEffect['taskClientReferenceId'])
          ? (lastTask['clientAuditDetails']?['createdTime'] as int?)
          : null;

      recordedSideEffect = lastTaskTime != null &&
          (lastTaskTime >= (currentCycle['startDate'] ?? 0) &&
              lastTaskTime <= (currentCycle['endDate'] ?? 0));

      final isWithinAge =
          totalAgeMonths >= validMinAge && totalAgeMonths <= validMaxAge;
      totalAgeMonths <= validMaxAge;

      if (!isWithinAge) return false;

      final checkStatusFn = FunctionRegistry.get('checkStatus');
      final statusOk = checkStatusFn?.call([], stateData) as bool? ?? false;

      return recordedSideEffect && !statusOk ? false : true;
    } else {
      if (projectType.validMaxAge != null && projectType.validMinAge != null) {
        return totalAgeMonths >= projectType.validMinAge! &&
            totalAgeMonths <= projectType.validMaxAge!;
      }
      return true;
    }
  });

  FunctionRegistry.register("getInEligibleStatus", (args, stateData) {
    // No arguments passed
    if (args.isEmpty) return TaskStatus.ineligible;

    // --- ProjectType comes from FlowBuilderSingleton ---
    final projectType = FlowBuilderSingleton().projectType;
    if (projectType == null) return TaskStatus.ineligible;

    // --- Current active cycle ---
    Map<String, dynamic>? currentCycle;
    for (final e in projectType.cycles ?? []) {
      if ((e.startDate ?? 0) < DateTime.now().millisecondsSinceEpoch &&
          (e.endDate ?? 0) > DateTime.now().millisecondsSinceEpoch) {
        currentCycle = {
          "startDate": e.startDate,
          "endDate": e.endDate,
        };
        break;
      }
    }
    if (currentCycle == null) return TaskStatus.ineligible;

    final tasks = args.first;

    // Must be a non-empty list of tasks
    if (tasks is! List || tasks.isEmpty) return TaskStatus.ineligible;

    // Get the last task and convert to Map if needed
    final item = tasks.last;
    Map<String, dynamic>? lastTask;
    if (item is Map<String, dynamic>) {
      lastTask = item;
    } else if (item is Map) {
      lastTask = Map<String, dynamic>.from(item);
    } else {
      try {
        lastTask = (item as dynamic).toMap() as Map<String, dynamic>;
      } catch (_) {
        try {
          lastTask = (item as dynamic).toJson() as Map<String, dynamic>;
        } catch (_) {
          return '';
        }
      }
    }

    if (lastTask == null) return TaskStatus.ineligible.toString();

    // Get and normalize the status
    final status = lastTask['status']?.toString().trim().toUpperCase() ?? '';

    if (status.isEmpty) return TaskStatus.ineligible.toString();

    // Return the status string for ineligible/non-delivered statuses
    if (status == TaskStatus.ineligible ||
        status == TaskStatus.beneficiaryDied ||
        status == TaskStatus.beneficiaryMigrated ||
        status == TaskStatus.beneficiaryAbsent ||
        status == TaskStatus.beneficiaryRefused ||
        status == TaskStatus.notDelivered) {
      return status;
    }

    // Default to ineligible
    return TaskStatus.ineligible;
  });

  FunctionRegistry.register("isDelivered", (args, stateData) {
    // No arguments passed
    if (args.isEmpty) return false;

    final value = args.first;

    // Must be a string
    if (value is! String) return false;

    // Normalize (uppercase + trim)
    final status = value.trim().toUpperCase();

    // Match valid delivered statuses
    if (status == TaskStatus.administrationSuccess ||
        status == TaskStatus.delivered) {
      return true;
    }

    return false;
  });

  /// Registers a function to check if all doses have been delivered for a member.
  ///
  /// - **Function Name**: `'checkAllDoseDelivered'`
  /// - **Arguments**: A list where the first element is the tasks list for the member.
  /// - **Returns**: `true` if all doses have been delivered for the current cycle, `false` otherwise.
  ///
  /// This function checks:
  /// 1. If no valid cycle exists or cycle has no deliveries -> returns true (nothing to deliver)
  /// 2. If tasks exist:
  ///    - Checks if last dose was delivered for the current cycle
  ///    - Handles side effects if present
  /// 3. If no tasks exist -> returns false (doses pending)
  FunctionRegistry.register("checkAllDoseDelivered", (args, stateData) {
    // Get tasks from args (passed as first argument from the wrapper config)
    List<Map<String, dynamic>>? tasks;
    if (args.isNotEmpty && args.first != null) {
      if (args.first is List) {
        final rawList = args.first as List;
        // Convert each item to Map<String, dynamic> - handles both Map and Model objects
        tasks = rawList.map((item) {
          if (item is Map<String, dynamic>) {
            return item;
          } else if (item is Map) {
            return Map<String, dynamic>.from(item);
          } else {
            // Try to convert model objects (e.g., TaskModel) to Map
            try {
              return (item as dynamic).toMap() as Map<String, dynamic>;
            } catch (_) {
              try {
                return (item as dynamic).toJson() as Map<String, dynamic>;
              } catch (_) {
                return <String, dynamic>{};
              }
            }
          }
        }).toList();
      }
    }

    // Get current active cycle from FlowBuilderSingleton
    final projectType = FlowBuilderSingleton().projectType;
    final selectedCycle = projectType?.cycles?.firstWhereOrNull(
      (e) =>
          (e.startDate ?? 0) < DateTime.now().millisecondsSinceEpoch &&
          (e.endDate ?? 0) > DateTime.now().millisecondsSinceEpoch,
    );

    // Get sideEffects from stateData - convert model objects to Map if needed
    final rawSideEffects = stateData.modelMap['sideEffects'] as List?;
    final sideEffects = rawSideEffects?.map((item) {
          if (item is Map<String, dynamic>) return item;
          if (item is Map) return Map<String, dynamic>.from(item);
          try {
            return (item as dynamic).toMap() as Map<String, dynamic>;
          } catch (_) {
            try {
              return (item as dynamic).toJson() as Map<String, dynamic>;
            } catch (_) {
              return <String, dynamic>{};
            }
          }
        }).toList() ??
        [];

    // If no valid cycle or cycle has no deliveries, return true (nothing to deliver)
    if (selectedCycle == null ||
        selectedCycle.id == 0 ||
        (selectedCycle.deliveries ?? []).isEmpty) {
      return true;
    }

    // Check if tasks exist
    if ((tasks ?? []).isNotEmpty) {
      // Filter out REDOSE tasks to evaluate based on delivery tasks only
      final deliveryTasks = tasks!.where((t) {
        final af = t['additionalFields'];
        final fields = af?['fields'] as List?;
        if (fields != null) {
          for (final f in fields) {
            if (f is Map &&
                f['key'] == 'taskType' &&
                f['value']?.toString().toUpperCase() == 'REDOSE') {
              return false;
            }
          }
        }
        return true;
      }).toList();

      if (deliveryTasks.isEmpty) return false;
      final lastTask = deliveryTasks.last;

      // Extract cycleIndex from additionalFields
      final additionalFields = lastTask['additionalFields'];
      final fields = additionalFields?['fields'] as List?;

      int? lastCycle;
      int? lastDose;

      if (fields != null) {
        for (final field in fields) {
          if (field is Map) {
            if (field['key'] == 'cycleIndex') {
              lastCycle = int.tryParse(field['value']?.toString() ?? '');
            }
            if (field['key'] == 'doseIndex') {
              lastDose = int.tryParse(field['value']?.toString() ?? '');
            }
          }
        }
      }

      final lastTaskStatus = lastTask['status']?.toString().toUpperCase();
      final isDelivered = lastTaskStatus == 'DELIVERED';

      // If last dose equals total deliveries in cycle AND cycle matches AND status is NOT delivered
      // -> return true (last dose attempted but not delivered)
      if (lastDose != null &&
          lastDose == selectedCycle.deliveries?.length &&
          lastCycle != null &&
          lastCycle == selectedCycle.id &&
          (lastTaskStatus == 'ADMINISTRATION_SUCCESS' ||
              lastTaskStatus == 'DELIVERED')) {
        return true;
      }

      // If cycle matches AND status IS delivered -> return false (dose delivered, may have more)
      if (selectedCycle.id == lastCycle && isDelivered) {
        return false;
      }

      // Check side effects if present
      if (sideEffects.isNotEmpty) {
        return _recordedSideEffectInternal(
            selectedCycle, lastTask, sideEffects);
      }

      return false;
    }

    // No tasks exist -> return false (doses pending)
    return false;
  });

  /// Registers a function to check the status of tasks.
  ///
  /// - **Function Name**: `'checkStatus'`
  /// - **Arguments**: None.
  /// - **Returns**: `true` if a new task can be created, otherwise `false`.
  ///
  /// This function uses the `checkStatusInternal` helper to determine the status.
  FunctionRegistry.register("checkStatus", (args, stateData) {
    final tasks = stateData.modelMap['tasks'];

// Resolve current cycle dynamically from FlowBuilderSingleton
    final projectType = FlowBuilderSingleton().projectType;

    final currentCycle = projectType?.cycles?.firstWhereOrNull(
      (e) =>
          (e.startDate ?? 0) < DateTime.now().millisecondsSinceEpoch &&
          (e.endDate ?? 0) > DateTime.now().millisecondsSinceEpoch,
    );

    return checkStatusInternal(tasks, currentCycle);
  });

  /// Registers a function to check if a user has a specific role.
  ///
  /// - **Function Name**: `'hasRole'`
  /// - **Arguments**: A list where the first element is the role code string (e.g., 'WAREHOUSE_MANAGER').
  /// - **Returns**: `true` if the user has the specified role, otherwise `false`.
  ///
  /// This function checks the user's roles from FlowBuilderSingleton.
  FunctionRegistry.register("hasRole", (args, stateData) {
    if (args.isEmpty) return false;

    final roleCode = args.first?.toString() ?? '';
    if (roleCode.isEmpty) return false;

    final userRoles = FlowBuilderSingleton().userRoles;
    if (userRoles == null || userRoles.isEmpty) return false;

    // Check if any role in the list has the matching code
    return userRoles.any((role) => role['code'] == roleCode);
  });

  /// Registers a function to get the length of a list/array.
  ///
  /// - **Function Name**: `'length'`
  /// - **Arguments**: A list where the first element is a list or array, or a string key to look up in stateData.
  /// - **Returns**: The length of the list as an integer, or 0 if not a list.
  ///
  /// This function handles getting the length of arrays in templates since
  /// the template resolver doesn't support property access like `.length`.
  FunctionRegistry.register("length", (args, stateData) {
    // If args has a valid List, use it
    if (args != null && args.isNotEmpty && args.first != null) {
      final value = args.first;

      // If value is already a List, return its length
      if (value is List) {
        return value.length;
      }

      // If value is a string key, try to look it up in stateData.modelMap
      if (value is String && value.isNotEmpty) {
        // Try exact match first
        if (stateData.modelMap.containsKey(value)) {
          final modelList = stateData.modelMap[value];
          if (modelList is List) {
            return modelList?.length;
          }
        }

        // Try case-insensitive match (e.g., "stock" -> "StockModel")
        final lowerKey = value.toLowerCase();
        for (final key in stateData.modelMap.keys) {
          if (key.toLowerCase() == lowerKey ||
              key.toLowerCase() == '${lowerKey}model' ||
              key.toLowerCase().startsWith(lowerKey)) {
            final modelList = stateData.modelMap[key];
            if (modelList is List) {
              return modelList?.length;
            }
          }
        }
      }
    }

    // Return 0 if nothing found (no data loaded yet)
    return 0;
  });

  /// Registers a function to check if a value is null or empty.
  ///
  /// - **Function Name**: `'isEmpty'`
  /// - **Arguments**: A list where the first element is the value to check.
  /// - **Returns**: `true` if the value is null, empty string, or empty list, otherwise `false`.
  ///
  /// This function helps with null/empty checks since template resolution
  /// converts null values to empty strings.
  FunctionRegistry.register("isEmpty", (args, stateData) {
    // Handle null args
    if (args == null || args.isEmpty) {
      return true;
    }

    final value = args.first;

    // Check for null
    if (value == null) {
      return true;
    }

    // Check for empty string (missing values resolve to "")
    if (value is String && value.isEmpty) {
      return true;
    }

    // Check for empty list
    if (value is List && value.isEmpty) {
      return true;
    }

    return false;
  });

  /// Registers a function to check if a value is not null or empty.
  ///
  /// - **Function Name**: `'isNotEmpty'`
  /// - **Arguments**: A list where the first element is the value to check.
  /// - **Returns**: `true` if the value is not null and not empty, otherwise `false`.
  FunctionRegistry.register("isNotEmpty", (args, stateData) {
    // Handle null args
    if (args == null || args.isEmpty) {
      return false;
    }

    final value = args.first;

    if (value == null) {
      return false;
    }
    if (value is String && value.isEmpty) {
      return false;
    }
    if (value is List && value.isEmpty) {
      return false;
    }

    return true;
  });

  /// Registers a function to get a value from an additional fields list.
  ///
  /// - **Function Name**: `'getAdditionalFieldValue'`
  /// - **Arguments**:
  ///   - First argument: List of additional fields (List<Map> with 'key' and 'value' properties)
  ///   - Second argument: The key name to search for
  /// - **Returns**: The value of the matching field, or empty string if not found.
  ///
  /// This function searches through a list of additional fields (typically in format
  /// [{"key": "fieldName", "value": "fieldValue"}]) and returns the value for the specified key.
  FunctionRegistry.register("getAdditionalFieldValue", (args, stateData) {
    // Handle null args
    if (args == null || args.length < 2) return '';

    final additionalFields = args[0];
    final searchKey = args[1]?.toString() ?? '';

    if (searchKey.isEmpty) return '';

    // Handle List of Maps (additionalFields format)
    if (additionalFields is List) {
      for (final field in additionalFields) {
        if (field is Map && field['key'] == searchKey) {
          return field['value']?.toString() ?? '';
        }
      }
    }
    return '';
  });

  /// Registers a function to check if delivery can be recorded.
  ///
  /// - **Function Name**: `'canRecordDelivery'`
  /// - **Arguments**:
  ///   - First argument: nextCycleId - the next cycle to record
  ///   - Second argument: nextDoseId - the next dose to record
  /// - **Returns**: `true` if delivery can be recorded, `false` if all cycles/doses are completed.
  ///
  /// This function checks if the next cycle is within the valid range of cycles
  /// and if delivery recording is allowed based on the current project configuration.
  /// Registers a function to get unique complaint types from ComplaintWrapper.
  ///
  /// - **Function Name**: `'getUniqueComplaintTypes'`
  /// - **Arguments**: A list where the first element is the ComplaintWrapper list.
  /// - **Returns**: A list of unique complaint types as [{name: "...", code: "..."}].
  FunctionRegistry.register("getUniqueComplaintTypes", (args, stateData) {
    if (args.isEmpty || args.first == null) return <Map<String, dynamic>>[];

    final wrapperList = args.first;
    if (wrapperList is! List) return <Map<String, dynamic>>[];

    final uniqueTypes = <String>{};

    for (final item in wrapperList) {
      // Convert item to Map if it's a model object
      Map<String, dynamic>? itemMap;
      if (item is Map<String, dynamic>) {
        itemMap = item;
      } else if (item is Map) {
        itemMap = Map<String, dynamic>.from(item);
      } else {
        // Try to convert model object to Map
        try {
          itemMap = (item as dynamic).toMap() as Map<String, dynamic>;
        } catch (_) {
          try {
            itemMap = (item as dynamic).toJson() as Map<String, dynamic>;
          } catch (_) {
            continue; // Skip this item if conversion fails
          }
        }
      }

      if (itemMap != null) {
        // Access PgrServiceModel and convert to Map if needed
        dynamic pgrService = itemMap['PgrServiceModel'];
        if (pgrService != null && pgrService is! Map) {
          try {
            pgrService =
                (pgrService as dynamic).toMap() as Map<String, dynamic>;
          } catch (_) {
            try {
              pgrService =
                  (pgrService as dynamic).toJson() as Map<String, dynamic>;
            } catch (_) {
              pgrService = null;
            }
          }
        }
        if (pgrService is Map && pgrService['serviceCode'] != null) {
          final serviceCode = pgrService['serviceCode'].toString();
          if (serviceCode.isNotEmpty) {
            uniqueTypes.add(serviceCode);
          }
        }
      }
    }

    // Return as dropdown format [{name: code, code: code}]
    return uniqueTypes.map((code) => {'name': code, 'code': code}).toList();
  });

  /// Registers a function to get unique localities from ComplaintWrapper.
  ///
  /// - **Function Name**: `'getUniqueLocalities'`
  /// - **Arguments**: A list where the first element is the ComplaintWrapper list.
  /// - **Returns**: A list of unique localities as [{name: "...", code: "..."}].
  FunctionRegistry.register("getUniqueLocalities", (args, stateData) {
    if (args.isEmpty || args.first == null) return <Map<String, dynamic>>[];

    final wrapperList = args.first;
    if (wrapperList is! List) return <Map<String, dynamic>>[];

    final uniqueLocalities = <String>{};

    for (final item in wrapperList) {
      // Convert item to Map if it's a model object
      Map<String, dynamic>? itemMap;
      if (item is Map<String, dynamic>) {
        itemMap = item;
      } else if (item is Map) {
        itemMap = Map<String, dynamic>.from(item);
      } else {
        // Try to convert model object to Map
        try {
          itemMap = (item as dynamic).toMap() as Map<String, dynamic>;
        } catch (_) {
          try {
            itemMap = (item as dynamic).toJson() as Map<String, dynamic>;
          } catch (_) {
            continue; // Skip this item if conversion fails
          }
        }
      }

      if (itemMap != null) {
        // Access PgrServiceModel and convert to Map if needed
        dynamic pgrService = itemMap['PgrServiceModel'];
        if (pgrService != null && pgrService is! Map) {
          try {
            pgrService =
                (pgrService as dynamic).toMap() as Map<String, dynamic>;
          } catch (_) {
            try {
              pgrService =
                  (pgrService as dynamic).toJson() as Map<String, dynamic>;
            } catch (_) {
              pgrService = null;
            }
          }
        }

        if (pgrService is Map) {
          // Access address from PgrServiceModel
          dynamic address = pgrService['address'];
          if (address != null && address is! Map) {
            try {
              address = (address as dynamic).toMap() as Map<String, dynamic>;
            } catch (_) {
              try {
                address = (address as dynamic).toJson() as Map<String, dynamic>;
              } catch (_) {
                address = null;
              }
            }
          }

          if (address is Map) {
            // Access locality from address
            dynamic locality = address['locality'];
            if (locality != null && locality is! Map) {
              try {
                locality =
                    (locality as dynamic).toMap() as Map<String, dynamic>;
              } catch (_) {
                try {
                  locality =
                      (locality as dynamic).toJson() as Map<String, dynamic>;
                } catch (_) {
                  locality = null;
                }
              }
            }

            if (locality is Map && locality['code'] != null) {
              final code = locality['code'].toString();
              if (code.isNotEmpty) {
                uniqueLocalities.add(code);
              }
            }
          }
        }
      }
    }

    // Return as dropdown format [{name: code, code: code}]
    return uniqueLocalities
        .map((code) => {'name': code, 'code': code})
        .toList();
  });

  /// Registers a function to check if a specific dose in a specific cycle has been completed.
  ///
  /// - **Function Name**: `'isDoseCompleted'`
  /// - **Arguments**:
  ///   - First argument: doseIndex (1-based dose ID)
  ///   - Second argument: cycleIndex (1-based cycle ID)
  /// - **Returns**: `true` if a task exists with matching doseIndex AND cycleIndex, `false` otherwise.
  ///
  /// This function checks the tasks in stateData.modelMap['tasks'] and looks for a task
  /// where additionalFields.fields contains both the matching doseIndex and cycleIndex.
  FunctionRegistry.register("isDoseCompleted", (args, stateData) {
    if (args.isEmpty) return false;

    final doseIndex = int.tryParse(args[0]?.toString() ?? '') ?? -1;
    if (doseIndex < 0) return false;

    // Get cycleIndex from second argument (required for accurate check)
    final cycleIndex =
        args.length > 1 ? int.tryParse(args[1]?.toString() ?? '') ?? -1 : -1;
    if (cycleIndex < 0) return false;

    // Get tasks from modelMap
    final tasks = stateData.modelMap['tasks'] as List? ?? [];

    // Find task with matching doseIndex AND cycleIndex in additionalFields
    for (final task in tasks) {
      if (task is! Map) continue;

      // Get additionalFields.fields
      final additionalFields = task['additionalFields'];
      if (additionalFields == null) continue;

      List? fields;
      if (additionalFields is Map) {
        fields = additionalFields['fields'] as List?;
      } else if (additionalFields is List) {
        fields = additionalFields;
      }

      if (fields == null) continue;

      // Find doseIndex and cycleIndex in fields
      int? taskDoseIndex;
      int? taskCycleIndex;

      for (final field in fields) {
        if (field is Map) {
          if (field['key'] == 'doseIndex') {
            taskDoseIndex = int.tryParse(field['value']?.toString() ?? '');
          }
          if (field['key'] == 'cycleIndex') {
            taskCycleIndex = int.tryParse(field['value']?.toString() ?? '');
          }
        }
      }

      // Check if BOTH dose AND cycle match
      if (taskDoseIndex == doseIndex && taskCycleIndex == cycleIndex) {
        return true;
      }
    }

    return false;
  });

  /// Registers a function to get the completion date for a specific dose in a specific cycle.
  ///
  /// - **Function Name**: `'getTaskCompletionDate'`
  /// - **Arguments**:
  ///   - First argument: doseIndex (1-based dose ID)
  ///   - Second argument: cycleIndex (1-based cycle ID)
  ///   - Third argument (optional): date format (default: 'dd MMM yyyy')
  /// - **Returns**: Formatted date string if task exists, empty string otherwise.
  ///
  /// This function checks the tasks in stateData.modelMap['tasks'] and looks for a task
  /// where additionalFields.fields contains both the matching doseIndex and cycleIndex,
  /// then returns the createdTime from clientAuditDetails formatted as a date.
  FunctionRegistry.register('getTaskCompletionDate', (args, stateData) {
    if (args.isEmpty) return '';

    final doseIndex = int.tryParse(args[0]?.toString() ?? '') ?? -1;
    if (doseIndex < 0) return '';

    // Get cycleIndex from second argument (required for accurate check)
    final cycleIndex =
        args.length > 1 ? int.tryParse(args[1]?.toString() ?? '') ?? -1 : -1;
    if (cycleIndex < 0) return '';

    // Get date format from third argument (optional)
    final dateFormat =
        args.length > 2 ? args[2]?.toString() ?? 'dd MMM yyyy' : 'dd MMM yyyy';

    // Get tasks from modelMap
    final tasks = stateData.modelMap['tasks'] as List? ?? [];

    // Find task with matching doseIndex AND cycleIndex in additionalFields
    for (final task in tasks) {
      if (task is! Map) continue;

      // Get additionalFields.fields
      final additionalFields = task['additionalFields'];
      if (additionalFields == null) continue;

      List? fields;
      if (additionalFields is Map) {
        fields = additionalFields['fields'] as List?;
      } else if (additionalFields is List) {
        fields = additionalFields;
      }

      if (fields == null) continue;

      // Find doseIndex and cycleIndex in fields
      int? taskDoseIndex;
      int? taskCycleIndex;

      for (final field in fields) {
        if (field is Map) {
          if (field['key'] == 'doseIndex') {
            taskDoseIndex = int.tryParse(field['value']?.toString() ?? '');
          }
          if (field['key'] == 'cycleIndex') {
            taskCycleIndex = int.tryParse(field['value']?.toString() ?? '');
          }
        }
      }

      // Check if BOTH dose AND cycle match
      if (taskDoseIndex == doseIndex && taskCycleIndex == cycleIndex) {
        // Found matching task, get createdTime from clientAuditDetails
        final clientAuditDetails = task['clientAuditDetails'];
        if (clientAuditDetails is Map) {
          final createdTime = clientAuditDetails['createdTime'];
          if (createdTime != null) {
            try {
              final timestamp = createdTime is int
                  ? createdTime
                  : int.tryParse(createdTime.toString()) ?? 0;
              if (timestamp > 0) {
                final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
                return DateFormat(dateFormat).format(date);
              }
            } catch (_) {
              return '';
            }
          }
        }
      }
    }

    return '';
  });

  /// Registers a function to check if the edit button should be disabled.
  ///
  /// - **Function Name**: `'disableEdit'`
  /// - **Arguments**:
  ///   - First argument: task - the task list for the beneficiary
  ///   - Second argument (optional): referral - the referral data
  /// - **Returns**: `true` if editing should be disabled, `false` otherwise.
  ///
  /// Editing is disabled when:
  /// 1. Any task has a success status (ADMINISTRATION_SUCCESS or DELIVERED)
  /// 2. Any task is not eligible (INELIGIBLE status)
  /// 3. A referral exists (not null/empty)
  FunctionRegistry.register("disableEdit", (args, stateData) {
    // Check task statuses - if ANY task is delivered or ineligible, disable
    if (args.isNotEmpty && args.first != null) {
      final tasks = args.first;

      if (tasks is List && tasks.isNotEmpty) {
        for (final item in tasks) {
          Map<String, dynamic>? taskMap;
          if (item is Map<String, dynamic>) {
            taskMap = item;
          } else if (item is Map) {
            taskMap = Map<String, dynamic>.from(item);
          } else {
            try {
              taskMap = (item as dynamic).toMap() as Map<String, dynamic>;
            } catch (_) {
              try {
                taskMap = (item as dynamic).toJson() as Map<String, dynamic>;
              } catch (_) {
                taskMap = null;
              }
            }
          }

          if (taskMap != null) {
            final status = taskMap['status']?.toString().toUpperCase().trim();

            // Disable if any task status is success
            if (status == TaskStatus.administrationSuccess ||
                status == TaskStatus.delivered) {
              return true;
            }

            // Disable if any task is not eligible
            if (status == TaskStatus.ineligible ||
                status == TaskStatus.beneficiaryDied ||
                status == TaskStatus.beneficiaryMigrated ||
                status == TaskStatus.beneficiaryAbsent ||
                status == TaskStatus.beneficiaryRefused) {
              return true;
            }
          }
        }
      }
    }

    // Disable if referral exists for the current cycle
    if (args.length > 1 && args[1] != null) {
      final referral = args[1];

      if (referral is List && referral.isNotEmpty) {
        // Check if any referral matches the current running cycle
        final projectType = FlowBuilderSingleton().projectType;
        final selectedCycle = projectType?.cycles?.firstWhereOrNull(
          (e) =>
              e.startDate < DateTime.now().millisecondsSinceEpoch &&
              e.endDate > DateTime.now().millisecondsSinceEpoch,
        );

        if (selectedCycle != null) {
          for (final item in referral) {
            Map<String, dynamic>? refMap;
            if (item is Map<String, dynamic>) {
              refMap = item;
            } else if (item is Map) {
              refMap = Map<String, dynamic>.from(item);
            } else {
              try {
                refMap = (item as dynamic).toMap() as Map<String, dynamic>;
              } catch (_) {
                continue;
              }
            }

            final additionalFields = refMap['additionalFields'];
            final fields = additionalFields?['fields'] as List?;
            if (fields != null) {
              for (final field in fields) {
                if (field is Map && field['key'] == 'referralCycle') {
                  final referralCycle =
                      int.tryParse(field['value']?.toString() ?? '');
                  if (referralCycle == selectedCycle.id) return true;
                }
              }
            }
          }
        }
      }
      if (referral is Map && referral.isNotEmpty) {
        return true;
      }
    }

    return false;
  });

  /// Returns the current running cycle's id from the project configuration.
  /// Reuses the same cycle lookup logic as hasReferralForCurrentCycle.
  FunctionRegistry.register("getCurrentCycleIndex", (args, stateData) {
    final projectType = FlowBuilderSingleton().projectType;
    final now = DateTime.now().millisecondsSinceEpoch;
    return projectType?.cycles
        ?.firstWhereOrNull(
          (e) => e.startDate < now && e.endDate > now,
        )
        ?.id;
  });

  /// Checks if the current member is the head of household.
  ///
  /// - **Function Name**: `'isHead'`
  /// - **Arguments**: First argument is the member/household data.
  /// - **Returns**: `true` if the member is the head of household, `false` otherwise.
  ///
  /// This function checks for an `isHeadOfHousehold` indicator which can be:
  /// 1. A direct boolean field in the member data
  /// 2. A field in additionalFields with key 'isHeadOfHousehold'
  FunctionRegistry.register("isHead", (args, stateData) {
    if (args.isEmpty || args.first == null) return false;

    // Get member(s) list - try 'member' first, then 'members'
    final membersList = args.first as List?;
    if (membersList == null || membersList.isEmpty) return false;

    // Check if any member is head of household
    return membersList.any((member) {
      if (member == null) return false;

      final isHead = member.isHeadOfHousehold;
      return isHead is bool
          ? isHead
          : isHead is String &&
              (isHead.toLowerCase() == 'true' || isHead == '1');
    });
  });

  /// Checks if a referral exists for the current running cycle.
  ///
  /// - **Function Name**: `'hasReferralForCurrentCycle'`
  /// - **Arguments**: First argument is the hFReferral list.
  /// - **Returns**: `true` if a referral exists for the current cycle, `false` otherwise.
  FunctionRegistry.register("hasReferralForCurrentCycle", (args, stateData) {
    if (args.isEmpty || args.first == null) return false;

    final referrals = args.first;
    if (referrals is! List || referrals.isEmpty) return false;

    // Get current active cycle from FlowBuilderSingleton
    final projectType = FlowBuilderSingleton().projectType;
    final selectedCycle = projectType?.cycles?.firstWhereOrNull(
      (e) =>
          e.startDate < DateTime.now().millisecondsSinceEpoch &&
          e.endDate > DateTime.now().millisecondsSinceEpoch,
    );

    if (selectedCycle == null) return false;

    for (final item in referrals) {
      Map<String, dynamic>? refMap;
      if (item is Map<String, dynamic>) {
        refMap = item;
      } else if (item is Map) {
        refMap = Map<String, dynamic>.from(item);
      } else {
        try {
          refMap = (item as dynamic).toMap() as Map<String, dynamic>;
        } catch (_) {
          continue;
        }
      }

      final additionalFields = refMap['additionalFields'];
      final fields = additionalFields?['fields'] as List?;
      if (fields != null) {
        for (final field in fields) {
          if (field is Map && field['key'] == 'referralCycle') {
            final referralCycle =
                int.tryParse(field['value']?.toString() ?? '');
            if (referralCycle == selectedCycle.id) return true;
          }
        }
      }
    }

    return false;
  });

  // GET symptoms for referral - this is a placeholder function to demonstrate how to register a function that processes data and returns a result based on certain conditions. In a real implementation, the symptom values would likely come from the stateData or arguments rather than being hardcoded.

  FunctionRegistry.register("getSymptomsReferral", (args, stateData) {
    Map? navigationData = args.isNotEmpty ? args.first : null;

    if (navigationData == null) return null;

    String? ec1 = navigationData['ec1'];
    String? ec2 = navigationData['ec2'];

    if (ec1 == null && ec2 == null) return null;

    final List<String> symptoms = [];

    if (ec1 == 'YES') symptoms.add('SICK');
    if (ec2 == 'YES') {
      symptoms.add('FEVER');
    } else {
      symptoms.add('DRUG_SE_PC');
    }

    return symptoms.join(',');
  });

  FunctionRegistry.register("hasBeneficiaryId", (args, stateData) {
    final identifier = args.isNotEmpty ? args.first : null;

    if (identifier == null) return false;

    if (identifier["identifierType"] == 'UNIQUE_BENEFICIARY_ID') {
      return true;
    }

    return false;
  });

  FunctionRegistry.register("canRecordDelivery", (args, stateData) {
    final projectType = FlowBuilderSingleton().projectType;
    if (projectType == null || projectType.cycles == null) {
      return true; // Default to true if no project config
    }

    final cycles = projectType.cycles!;
    final totalCycles = cycles.length;
    if (totalCycles == 0) {
      return true;
    }

    // Get nextCycleId from args
    final nextCycleIdArg = args.isNotEmpty ? args[0] : null;
    final nextCycleId = nextCycleIdArg is int
        ? nextCycleIdArg
        : int.tryParse(nextCycleIdArg?.toString() ?? '');

    if (nextCycleId == null) {
      return true; // Default to true if can't parse
    }

    // Check if nextCycleId exceeds total cycles (all cycles completed)
    if (nextCycleId > totalCycles) {
      return false;
    }

    // Check if the next cycle has started (date validation)
    // Cycle IDs are 1-indexed, so subtract 1 to get array index
    final cycleIndex = nextCycleId - 1;
    if (cycleIndex >= 0 && cycleIndex < cycles.length) {
      final nextCycle = cycles[cycleIndex];
      final now = DateTime.now().millisecondsSinceEpoch;
      final cycleStartDate = nextCycle.startDate ?? 0;
      final cycleEndDate = nextCycle.endDate ?? 0;

      // Check if current time is within the cycle's date range
      if (now < cycleStartDate) {
        // Cycle hasn't started yet
        return false;
      }
      if (now > cycleEndDate) {
        // Cycle has ended
        return false;
      }
    }

    return true;
  });

  /// Registers a function to calculate age in months from a date of birth.
  ///
  /// - **Function Name**: `'calculateAgeInMonths'`
  /// - **Arguments**: A list where the first element is the date of birth string.
  /// - **Returns**: The total age in months as an integer, or 0 if the input is invalid.
  FunctionRegistry.register('calculateAgeInMonths', (args, stateData) {
    if (args.isEmpty) return 0;

    final rawValue = args.first;
    if (rawValue == null) return 0;

    DateTime? dob;
    if (rawValue is int) {
      dob = DateTime.fromMillisecondsSinceEpoch(rawValue);
    } else if (rawValue is String) {
      // Try parsing as int timestamp first
      final timestamp = int.tryParse(rawValue);
      if (timestamp != null) {
        dob = DateTime.fromMillisecondsSinceEpoch(timestamp);
      } else {
        // Otherwise, parse as formatted date string
        dob = DigitDateUtils.getFormattedDateToDateTime(rawValue);
      }
    }

    if (dob == null) return 0;

    final age = DigitDateUtils.calculateAge(dob);
    return age.years * 12 + age.months;
  });

  /// Registers a function to compute the referral button label based on symptom and checklist data.
  ///
  /// - **Function Name**: `'computeReferralButtonLabel'`
  /// - **Arguments**:
  ///   - First argument: symptom (e.g., 'FEVER', 'SICK', 'DRUG_SE_CC', 'DRUG_SE_PC')
  ///   - Second argument: additionalFields.fields (List of {key, value} maps)
  /// - **Returns**: 'CORE_COMMON_GO_BACK' if checklist exists, 'CORE_COMMON_CONTINUE' if not.
  ///
  /// This function checks if the related checklist key exists for the given symptom:
  /// - FEVER → feverQ1
  /// - SICK → sickQ1
  /// - DRUG_SE_CC → sideEffectQ1
  /// - DRUG_SE_PC → sideEffectPQ1
  /// hf-referral impel
  FunctionRegistry.register('computeReferralButtonLabel', (args, stateData) {
    if (args.isEmpty) return 'HF_REFERRAL_CONTINUE';

    final symptom = args[0]?.toString().toUpperCase() ?? '';
    final fields = args.length > 1 ? args[1] : null;

    // Map symptom to its corresponding checklist key
    final symptomToChecklistKey = {
      'FEVER': 'feverQ1',
      'SICK': 'sickQ1',
      'DRUG_SE_CC': 'sideEffectQ1',
      'DRUG_SE_PC': 'sideEffectPQ1',
    };

    final checklistKey = symptomToChecklistKey[symptom];
    if (checklistKey == null) {
      // Unknown symptom, default to continue
      return 'HF_REFERRAL_CONTINUE';
    }

    // Check if the checklist key exists in additionalFields.fields
    bool checklistExists = false;

    if (fields is List) {
      for (final field in fields) {
        if (field is Map && field['key'] == checklistKey) {
          final value = field['value'];
          if (value != null && value.toString().trim().isNotEmpty) {
            checklistExists = true;
            break;
          }
        }
      }
    }

    // If checklist exists → Go Back, otherwise → Continue
    return checklistExists ? 'HF_REFERRAL_GO_BACK' : 'HF_REFERRAL_CONTINUE';
  });

  /// Registers a function to compute the referral status  based on symptom and checklist data.
  ///
  /// - **Function Name**: `'computeReferralstatus'`
  /// - **Arguments**:
  ///   - First argument: symptom (e.g., 'FEVER', 'SICK', 'DRUG_SE_CC', 'DRUG_SE_PC')
  ///   - Second argument: additionalFields.fields (List of {key, value} maps)
  /// - **Returns**: 'CORE_COMMON_GO_BACK' if checklist exists, 'CORE_COMMON_CONTINUE' if not.
  ///
  /// This function checks if the related checklist key exists for the given symptom:
  /// - FEVER → feverQ1
  /// - SICK → sickQ1
  /// - DRUG_SE_CC → sideEffectQ1
  /// - DRUG_SE_PC → sideEffectPQ1
  /// hf-referral impel
  FunctionRegistry.register('computeReferralStatus', (args, stateData) {
    if (args.isEmpty) return 'CORE_COMMON_NOT_VISITED';

    final symptom = args[0]?.toString().toUpperCase() ?? '';
    final fields = args.length > 1 ? args[1] : null;

    // Map symptom to its corresponding checklist key
    final symptomToChecklistKey = {
      'FEVER': 'feverQ1',
      'SICK': 'sickQ1',
      'DRUG_SE_CC': 'sideEffectQ1',
      'DRUG_SE_PC': 'sideEffectPQ1',
    };

    final checklistKey = symptomToChecklistKey[symptom];
    if (checklistKey == null) {
      // Unknown symptom, default to continue
      return 'HF_REFERRAL_NOT_VISITED';
    }

    // Check if the checklist key exists in additionalFields.fields
    bool checklistExists = false;

    if (fields is List) {
      for (final field in fields) {
        if (field is Map && field['key'] == checklistKey) {
          final value = field['value'];
          if (value != null && value.toString().trim().isNotEmpty) {
            checklistExists = true;
            break;
          }
        }
      }
    }

    // If checklist exists → Visited, otherwise → Not Visited
    return checklistExists ? 'VISITED' : 'HF_REFERRAL_NOT_VISITED';
  });

  /// Checks if the individual was registered before the current running cycle.
  ///
  /// - **Function Name**: `'isRegisteredBeforeCurrentCycle'`
  /// - **Arguments**:
  ///   - First argument: dateOfRegistration (timestamp in milliseconds)
  ///   - Second argument: currentRunningCycle (cycle id/index)
  /// - **Returns**: `true` if registered before the current cycle, `false` if registered in the current cycle.
  ///
  /// This is used to conditionally show buttons only for individuals registered
  /// in a previous cycle (not the current one).
  FunctionRegistry.register('isRegisteredBeforeCurrentCycle',
      (args, stateData) {
    if (args.isEmpty) return false;

    // Parse dateOfRegistration timestamp
    final rawDate = args.first;
    int? registrationTime;
    if (rawDate is int) {
      registrationTime = rawDate;
    } else if (rawDate is String) {
      registrationTime = int.tryParse(rawDate);
    }
    if (registrationTime == null) return false;

    // Get current running cycle from project config
    final projectType = FlowBuilderSingleton().projectType;
    if (projectType == null || projectType.cycles == null) return false;

    // Find the current active cycle
    final now = DateTime.now().millisecondsSinceEpoch;
    final currentCycle = projectType.cycles!.firstWhereOrNull(
      (e) => (e.startDate ?? 0) < now && (e.endDate ?? 0) > now,
    );
    if (currentCycle == null) return false;

    // If registered before the current cycle's start date, return true
    return registrationTime < (currentCycle.startDate ?? 0);
  });

  /// Registers a function to check if the 30-minute redose window has expired.
  ///
  /// - **Function Name**: `'isRedoseWindowExpired'`
  /// - **Arguments**: A list where the first element is the tasks list.
  /// - **Returns**: `true` if 30 minutes have passed since the last delivery
  ///   task was completed (redose window closed), `false` otherwise (window still open).
  ///
  /// The redose window opens immediately after delivery completion and stays
  /// open for 30 minutes. After that, the redose button becomes disabled.
  FunctionRegistry.register("isRedoseWindowExpired", (args, stateData) {
    if (args.isEmpty || args.first == null) return true;

    List<Map<String, dynamic>>? tasks;
    if (args.first is List) {
      final rawList = args.first as List;
      tasks = rawList.map((item) {
        if (item is Map<String, dynamic>) return item;
        if (item is Map) return Map<String, dynamic>.from(item);
        try {
          return (item as dynamic).toMap() as Map<String, dynamic>;
        } catch (_) {
          try {
            return (item as dynamic).toJson() as Map<String, dynamic>;
          } catch (_) {
            return <String, dynamic>{};
          }
        }
      }).toList();
    }

    if (tasks == null || tasks.isEmpty) return true;

    // Find the last delivery task (status ADMINISTRATION_SUCCESS or DELIVERED)
    // Iterate in reverse to find the most recent delivery task
    Map<String, dynamic>? lastDeliveryTask;
    for (int i = tasks.length - 1; i >= 0; i--) {
      final status = tasks[i]['status']?.toString().toUpperCase() ?? '';
      if (status == TaskStatus.administrationSuccess ||
          status == TaskStatus.delivered) {
        lastDeliveryTask = tasks[i];
        break;
      }
    }

    if (lastDeliveryTask == null) return true;

    // Get the creation time of the last delivery task from clientAuditDetails
    int? deliveryCompletionTime;

    // Try clientAuditDetails.createdTime first
    final clientAuditDetails = lastDeliveryTask['clientAuditDetails'];
    if (clientAuditDetails is Map) {
      deliveryCompletionTime =
          int.tryParse(clientAuditDetails['createdTime']?.toString() ?? '');
    }

    // Fallback to auditDetails.createdTime
    if (deliveryCompletionTime == null) {
      final auditDetails = lastDeliveryTask['auditDetails'];
      if (auditDetails is Map) {
        deliveryCompletionTime =
            int.tryParse(auditDetails['createdTime']?.toString() ?? '');
      }
    }

    if (deliveryCompletionTime == null) return true;

    // Check if 30 minutes (1800000 ms) have passed since delivery
    final now = DateTime.now().millisecondsSinceEpoch;
    const redoseWindowMs = 30 * 60 * 1000; // 30 minutes in milliseconds

    return (now - deliveryCompletionTime) > redoseWindowMs;
  });

  /// Registers a function to check if a redose has already been completed.
  ///
  /// - **Function Name**: `'isRedoseCompleted'`
  /// - **Arguments**: A list where the first element is the tasks list.
  /// - **Returns**: `true` if a task with status `VISITED` exists for the
  ///   current cycle, indicating redose was already administered.
  FunctionRegistry.register("isRedoseCompleted", (args, stateData) {
    if (args.isEmpty || args.first == null) return false;

    List<Map<String, dynamic>>? tasks;
    if (args.first is List) {
      final rawList = args.first as List;
      tasks = rawList.map((item) {
        if (item is Map<String, dynamic>) return item;
        if (item is Map) return Map<String, dynamic>.from(item);
        try {
          return (item as dynamic).toMap() as Map<String, dynamic>;
        } catch (_) {
          try {
            return (item as dynamic).toJson() as Map<String, dynamic>;
          } catch (_) {
            return <String, dynamic>{};
          }
        }
      }).toList();
    }

    if (tasks == null || tasks.isEmpty) return false;

    // Get current running cycle
    final projectType = FlowBuilderSingleton().projectType;
    final now = DateTime.now().millisecondsSinceEpoch;
    final selectedCycle = projectType?.cycles?.firstWhereOrNull(
      (e) => (e.startDate ?? 0) < now && (e.endDate ?? 0) > now,
    );

    if (selectedCycle == null) return false;

    // Check if any task has status VISITED for the current cycle
    for (final task in tasks) {
      final status = task['status']?.toString().toUpperCase() ?? '';
      if (status == TaskStatus.visited) {
        // Verify it belongs to the current cycle
        final additionalFields = task['additionalFields'];
        final fields = additionalFields?['fields'] as List?;
        if (fields != null) {
          for (final field in fields) {
            if (field is Map && field['key'] == 'cycleIndex') {
              final cycleIndex = int.tryParse(field['value']?.toString() ?? '');
              if (cycleIndex == selectedCycle.id) {
                return true;
              }
            }
          }
        }
      }
    }

    return false;
  });

  /// Counts members whose age (in months) falls within [3, 59] inclusive.
  ///
  /// - **Function Name**: `'countMembersInAgeRange'`
  /// - **Arguments**: First argument is the list of member wrapper objects.
  ///   Each wrapper is a Map containing an `individual` key that holds a List
  ///   with the IndividualModel (Map or EntityModel) at index 0.
  /// - **Returns**: Integer count of eligible members.
  FunctionRegistry.register('countMembersInAgeRange', (args, stateData) {
    if (args.isEmpty || args.first == null) return 0;

    final members = args.first;
    if (members is! List) return 0;

    int count = 0;
    final now = DateTime.now();

    for (final memberItem in members) {
      if (memberItem is! Map) continue;

      final individualList = memberItem['individual'];
      if (individualList is! List || individualList.isEmpty) continue;

      final individual = individualList.first;

      dynamic dob;
      if (individual is Map) {
        dob = individual['dateOfBirth'];
      } else if (individual is EntityModel) {
        dob = individual.toMap()['dateOfBirth'];
      } else {
        try {
          dob = (individual as dynamic).dateOfBirth;
        } catch (_) {
          continue;
        }
      }

      if (dob == null) continue;

      DateTime? birthDate;
      if (dob is int) {
        birthDate = DateTime.fromMillisecondsSinceEpoch(dob);
      } else if (dob is String) {
        final timestamp = int.tryParse(dob);
        if (timestamp != null) {
          birthDate = DateTime.fromMillisecondsSinceEpoch(timestamp);
        } else {
          birthDate = DigitDateUtils.getFormattedDateToDateTime(dob);
        }
      }

      if (birthDate == null) continue;

      int ageInMonths =
          (now.year - birthDate.year) * 12 + (now.month - birthDate.month);
      if (now.day < birthDate.day) ageInMonths--;

      if (ageInMonths >= 3 && ageInMonths <= 59) count++;
    }

    return count;
  });

  FunctionRegistry.register('hasMinimumBeneficiaryId', (args, stateData) {
    final minCountArg = args.isNotEmpty ? args.first : null;
    final minCount = minCountArg is int
        ? minCountArg
        : int.tryParse(minCountArg?.toString() ?? '');

    if (minCount == null) return false;

    final currentCountArg = args.length > 1 ? args[1] : null;
    final currentCount = currentCountArg is int
        ? currentCountArg
        : int.tryParse(currentCountArg?.toString() ?? '');

    return (currentCount ?? 0) >= minCount;
  });

  FunctionRegistry.register('getLatestBeneficiaryId', (args, stateData) {
    final context = FunctionRegistry.context;
    if (context == null) return null;

    final crudCtx = CrudItemContext.of(context);
    if (crudCtx == null || crudCtx.compositeKey == null) return null;

    final flowState = FlowCrudStateRegistry().get(crudCtx.compositeKey!);
    final widgetData = Map<String, dynamic>.from(flowState?.widgetData ?? {});

    return widgetData['latestBeneficiaryId'] as String?;
  });

  FunctionRegistry.register('getLatestBeneficiaryId', (args, stateData) {
    final context = FunctionRegistry.context;
    if (context == null) return null;

    final crudCtx = CrudItemContext.of(context);
    if (crudCtx == null || crudCtx.compositeKey == null) return null;

    final flowState = FlowCrudStateRegistry().get(crudCtx.compositeKey!);
    final stateWrapper = flowState?.stateWrapper;
    final wrapperData = stateWrapper is List && stateWrapper.isNotEmpty
        ? Map<String, dynamic>.from(
            stateWrapper.first as Map<String, dynamic>? ?? {})
        : <String, dynamic>{};

    return wrapperData['latestBeneficiaryId'] as String?;
  });
}
