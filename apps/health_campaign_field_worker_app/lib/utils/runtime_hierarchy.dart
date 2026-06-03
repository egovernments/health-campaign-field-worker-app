import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';

import 'environment_config.dart';

/// Returns the active project's `hierarchyType` in its canonical
/// schema-prefix form (already stripped of any `_<COUNTRY>` suffix —
/// normalization happens once in [DigitDataModelSingleton.setHierarchyType]).
///
/// Resolution order:
///   1. [DigitDataModelSingleton.hierarchyType] (populated on project selection)
///   2. [Variables.hierarchyType] from `.env`, routed through the singleton's
///      setter so it lands in the same canonical form
///
/// The env fallback is a missing-field safety net for projects whose
/// `additionalDetails.hierarchyType` is absent — it is not a pre-selection
/// bridge. In debug builds we assert that a project has been selected so any
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

  // Route the env fallback through the setter so the singleton applies the
  // same country-suffix stripping, then re-read.
  DigitDataModelSingleton()
      .setHierarchyType(envConfig.variables.hierarchyType);
  return DigitDataModelSingleton().hierarchyType ?? '';
}
