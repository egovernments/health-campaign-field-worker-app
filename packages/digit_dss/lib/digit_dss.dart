@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library digit_dss;

import 'package:dart_mappable/dart_mappable.dart';

export 'package:digit_dss/utils/utils.dart';

export 'data/local_store/no_sql/schema/dashboard_response.dart';
export 'data/remote/dashboard.dart';
export 'digit_dss.init.dart';
export 'pages/dashboard/dashboard.dart';
