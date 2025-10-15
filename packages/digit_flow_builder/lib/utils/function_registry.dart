import 'package:collection/collection.dart';
import 'package:digit_data_model/models/entities/project_type.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:intl/intl.dart';

import 'interpolation.dart';

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
        return DateFormat(format ?? "dd/MM/yyyy").format(date);

      case 'datetime':
        final date = parseDate(rawValue);
        if (date == null) return '--';
        return DateFormat(format ?? "dd/MM/yyyy HH:mm").format(date);

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
    final tasks = (stateData.modelMap['tasks'] as List?) ?? [];
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

// --- Eligibility logic ---
    bool recordedSideEffect = false;
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

      final isWithinAge = projectType.validMinAge != null &&
          projectType.validMaxAge != null &&
          totalAgeMonths >= projectType.validMinAge! &&
          totalAgeMonths <= projectType.validMaxAge!;

      if (!isWithinAge) return false;

      final checkStatusFn = FunctionRegistry.get('checkStatus');
      final statusOk = checkStatusFn?.call([], stateData) as bool? ?? false;

      return recordedSideEffect && !statusOk ? false : true;
    } else {
      if (projectType.validMaxAge != null && projectType.validMinAge != null) {
        return totalAgeMonths >= projectType.validMinAge! &&
            totalAgeMonths <= projectType.validMaxAge!;
      }
      return false;
    }
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
}
