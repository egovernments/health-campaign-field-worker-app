import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';

import '../action_config.dart';
import 'action_executor.dart';

/// Executor for DEDUP_INDEX action type.
///
/// Runs after CREATE_EVENT to index the newly created record for future
/// dedup checks. This is a placeholder that logs the indexing intent —
/// the actual index population happens during sync-down when the full
/// dataset is available.
///
/// In a future iteration, this will call DedupEngine.indexRecord() to
/// maintain an in-memory or SQLite-based phonetic index.
class DedupIndexExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'DEDUP_INDEX';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    debugPrint('DEDUP_INDEX: ========== STARTING ==========');

    // Check applyIf condition.
    final applyIf = action.properties['applyIf'] as String?;
    if (applyIf != null && applyIf.contains('!=')) {
      final parts = applyIf.split('!=');
      if (parts.length == 2) {
        final key = parts[0].trim();
        final value = parts[1].trim();
        final actual = contextData[key]?.toString() ?? '';
        if (actual.toLowerCase() == value.toLowerCase()) {
          debugPrint('DEDUP_INDEX: Skipping - condition not met: $applyIf '
              '(actual: $actual)');
          return contextData;
        }
      }
    }

    final rawEntities = contextData['entities'];
    if (rawEntities == null || (rawEntities is List && rawEntities.isEmpty)) {
      debugPrint('DEDUP_INDEX: No entities to index');
      return contextData;
    }

    final entities = rawEntities is List
        ? rawEntities.whereType<EntityModel>().toList()
        : [rawEntities as EntityModel];

    // Find the individual that was just created.
    EntityModel? individual;
    for (final e in entities) {
      if (e.runtimeType.toString().contains('Individual')) {
        individual = e;
        break;
      }
    }

    if (individual != null) {
      final map = individual.toMap();
      debugPrint('DEDUP_INDEX: Indexed new record: '
          '${map['clientReferenceId'] ?? map['client_reference_id']}');
    }

    return contextData;
  }
}
