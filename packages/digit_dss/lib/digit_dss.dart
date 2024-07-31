@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library digit_dss;

import 'package:dart_mappable/dart_mappable.dart';

export 'package:digit_dss/utils/utils.dart';

export 'data/local_store/no_sql/schema/dashboard_response.dart';
export 'data/remote/dashboard.dart';
export 'digit_dss.init.dart';
export 'models/entities/chart_data.dart';
export 'models/entities/dashboard_request.dart';
export 'models/entities/dashboard_response_model.dart';
export 'models/entities/insight.dart';
export 'models/entities/plots.dart';
export 'pages/dashboard/dashboard.dart';
