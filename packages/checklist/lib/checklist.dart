@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library checklist;

import 'package:dart_mappable/dart_mappable.dart';

//exporting all the files from checklist package
export 'checklist.init.dart';
export 'models/entities/service.dart';
export 'models/entities/service_attributes.dart';
export 'models/entities/service_definition.dart';
export 'data/repositories/oplog/oplog.dart';
export 'data/repositories/local/service.dart';
export 'data/repositories/local/service_definition.dart';
export 'data/repositories/remote/service.dart';
export 'data/repositories/remote/service_definition.dart';
export 'data/repositories/remote/service_attributes.dart';
export 'utils/utils.dart';
export 'blocs/service.dart';
export 'blocs/service_definition.dart';
export 'blocs/app_localization.dart';
// export 'utils/typedefs.dart';


