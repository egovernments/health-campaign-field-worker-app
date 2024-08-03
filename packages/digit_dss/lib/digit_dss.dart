@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library digit_dss;

import 'package:dart_mappable/dart_mappable.dart';

export 'package:digit_dss/utils/utils.dart';

export 'blocs/app_localization.dart';
export 'blocs/dashboard.dart';
export 'blocs/dashboard_localization_delegate.dart';
export 'data/local_store/no_sql/schema/dashboard_response.dart';
export 'data/local_store/no_sql/schema/dashboard_config_schema.dart';
export 'data/remote/dashboard.dart';
export 'digit_dss.init.dart';
export 'models/entities/chart_data.dart';
export 'models/entities/dashboard_request.dart';
export 'models/entities/dashboard_response_model.dart';
export 'models/entities/dss_enums.dart';
export 'models/entities/insight.dart';
export 'models/entities/plots.dart';
export 'models/entities/dashboard_config.dart';
export 'pages/dashboard/dashboard.dart';
