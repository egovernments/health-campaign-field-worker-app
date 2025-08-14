@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)

library complaints;

import 'package:dart_mappable/dart_mappable.dart';

export 'blocs/complaints_inbox/complaints_inbox.dart';
export 'blocs/complaints_registration/complaints_registration.dart';
export 'data/repositories/local/pgr_service.dart';
export 'data/repositories/oplog/oplog.dart';
export 'data/repositories/remote/pgr_service.dart';
export 'models/complaints.dart';
export 'models/pgr_address.dart';
export 'models/pgr_complaints.dart';
export 'models/pgr_complaints_response.dart';
export 'pages/complaints_acknowledgement.dart';
export 'pages/inbox/complaints_details_view.dart';
export 'pages/inbox/complaints_inbox.dart';
export 'pages/inbox/complaints_inbox_filter.dart';
export 'pages/inbox/complaints_inbox_search.dart';
export 'pages/inbox/complaints_inbox_sort.dart';
export 'pages/inbox/complaints_inbox_wrapper.dart';
export 'utils/utils.dart';
