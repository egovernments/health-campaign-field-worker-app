import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';

import 'environment_config.dart';

/// Returns the active project's `hierarchyType`, falling back to the
/// build-time `.env` value only when no project has set one.
///
/// Resolution order:
///   1. [DigitDataModelSingleton.hierarchyType] (populated on project selection)
///   2. [Variables.hierarchyType] from `.env`
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

  return envConfig.variables.hierarchyType;
}

/// Strips the trailing `_<COUNTRY>` suffix from a hierarchy value, used for
/// API endpoints and localization module keys keyed by the schema prefix
/// (e.g. `CONSOLEHCM_NI` → `CONSOLEHCM`, `ADMIN` → `ADMIN`).
String stripCountrySuffix(String raw) {
  if (raw.isEmpty) return raw;
  final idx = raw.indexOf('_');
  return idx == -1 ? raw : raw.substring(0, idx);
}
