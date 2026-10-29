import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';

import '../blocs/localization/app_localization.dart';

/// User-action `action` value for a worker-added settlement.
const String newSettlementAction = 'NEW_SETTLEMENT';

/// Schema key of the form-builder version in `app_config_schemas`.
const String newSettlementSchemaKey = 'MISSEDPLACE';

/// `additionalFields` key holding the typed name (set by the `newSettlement`
/// transformer).
const String settlementNameKey = 'settlementName';

/// Token in missed-place messages replaced with the lowest level's name.
const String levelPlaceholder = '{LEVEL}';

String? settlementNameOf(UserActionModel action) =>
    action.additionalFields?.fields
        .where((f) => f.key == settlementNameKey)
        .firstOrNull
        ?.value
        ?.toString();

/// Builds the in-memory last-level entry for a NEW_SETTLEMENT user action.
/// It keeps the [parent]'s code, path and level so everything sent to the
/// server stays on an existing boundary; only [BoundaryModel.name] differs.
BoundaryModel newSettlementBoundary({
  required UserActionModel action,
  required BoundaryModel parent,
  required String label,
}) {
  return BoundaryModel(
    code: parent.code,
    name: settlementNameOf(action),
    label: label,
    boundaryType: newSettlementBoundaryType,
    boundaryNum: parent.boundaryNum,
    materializedPath: parent.materializedPath,
    tenantId: parent.tenantId,
    latitude: action.latitude.toString(),
    longitude: action.longitude.toString(),
  );
}

/// Display text for a boundary: a new settlement shows its own name, every
/// other boundary its localized code.
String boundaryDisplayName(
  BoundaryModel boundary,
  AppLocalizations localizations,
) =>
    boundary.displayName(localizations.translate);
