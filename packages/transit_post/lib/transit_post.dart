@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library transit_post;

import 'package:dart_mappable/dart_mappable.dart';
export 'pages/transit_post_selection.dart';
export 'pages/transit_post_record_vaccination.dart';
export 'pages/transit_post_acknowledgment.dart';
export 'pages/transit_post_wrapper.dart';
export 'blocs/transit_post.dart';
export 'utils/utils.dart';
export 'data/repositories/local/user_action.dart';
export 'data/repositories/oplog/oplog.dart';
