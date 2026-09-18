import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';

import 'environment_config.dart';

/// Returns the active project's `hierarchyType` verbatim — whatever the
/// project payload's `additionalDetails.hierarchyType` carries is what the
/// boundary service expects (e.g. `TEST_7500`, `CONSOLEHCM`). Country lives on
/// boundary *codes* (`TEST_7500_IN`), not on the hierarchy type.
///
/// Resolution order:
///   1. [DigitDataModelSingleton.hierarchyType] (populated on project selection)
///   2. [Variables.hierarchyType] from `.env` as a missing-field fallback
///
/// In debug builds we assert that a project has been selected so any
/// pre-selection reads surface as bugs.
String runtimeHierarchyType() {
  final fromProject = DigitDataModelSingleton().hierarchyType;
  if (fromProject != null && fromProject.isNotEmpty) return fromProject;

  assert(
    () {
      debugPrint(
        'runtimeHierarchyType(): no project hierarchy set; falling back to '
        'env. If this is pre-project-selection, the call site should be '
        'moved to after project selection.',
      );
      return true;
    }(),
  );

  return envConfig.variables.hierarchyType;
}
