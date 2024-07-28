@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library closed_household;

import 'package:dart_mappable/dart_mappable.dart';

export 'blocs/app_localization.dart';
export 'blocs/closed_household.dart';
export 'utils/utils.dart' show ClosedHouseholdSingleton;
export 'pages/closed_household_details.dart';
export 'pages/closed_household_summary.dart';
export 'pages/closed_household_acknowledgement.dart';
export 'router/closed_household_router.dart';