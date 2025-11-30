import 'package:digit_flow_builder/utils/function_registry.dart';
import 'package:intl/intl.dart';

/// Registers task-related functions to the FunctionRegistry.
/// Call this during app initialization.
void registerTaskFunctions() {
  /// Gets the task completion date for a specific dose and cycle index.
  ///
  /// - **Arguments**:
  ///   - First argument: The dose index to find (e.g., 0, 1, 2)
  ///   - Second argument: The cycle index to find (e.g., 1, 2)
  ///   - Third argument (optional): Date format (default: 'dd MMM yyyy')
  /// - **Returns**: Formatted completion date if task exists, empty string otherwise.
  ///
  /// Example usage: {{fn:getTaskCompletionDate(currentItem.id, contextData.0.cycle)}}
  FunctionRegistry.register('getTaskCompletionDate', (args, stateData) {
    if (args.isEmpty) return '';

    final doseIndex = int.tryParse(args[0]?.toString() ?? '') ?? -1;
    if (doseIndex < 0) return '';

    // Get cycleIndex from second argument (optional for backward compatibility)
    final cycleIndex =
        args.length > 1 ? int.tryParse(args[1]?.toString() ?? '') ?? -1 : -1;

    final dateFormat =
        args.length > 2 ? args[2]?.toString() ?? 'dd MMM yyyy' : 'dd MMM yyyy';

    // Get tasks from modelMap
    final tasks = stateData.modelMap['tasks'] as List? ?? [];

    // Find task with matching doseIndex and cycleIndex in additionalFields
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

      // Check if dose matches, and cycle matches (if provided)
      final doseMatches = taskDoseIndex == doseIndex;
      final cycleMatches = cycleIndex < 0 || taskCycleIndex == cycleIndex;

      if (doseMatches && cycleMatches) {
        // Found matching task, get createdTime
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
}
