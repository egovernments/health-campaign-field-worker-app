import 'package:digit_data_model/data_model.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';

/// Writes NEW_SETTLEMENT records to the user-action table, so the boundary
/// dropdown can list them, but queues them to sync through the userLocation
/// endpoint instead of the userAction one.
///
/// Not registered for sync: the location tracker's userLocation repository
/// uploads the queued entries.
class NewSettlementLocalRepository extends UserActionLocalRepository {
  NewSettlementLocalRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.userLocation;
}
