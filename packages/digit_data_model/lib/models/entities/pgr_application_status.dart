import 'package:dart_mappable/dart_mappable.dart';

part 'pgr_application_status.mapper.dart';

@MappableEnum()
enum PgrServiceApplicationStatus {
  @MappableValue('CREATED')
  created,
  @MappableValue('PENDING_ASSIGNMENT')
  pendingAssignment,
  @MappableValue('RESOLVED')
  resolved,
  @MappableValue('REJECTED')
  rejected,
  @MappableValue('CANCELLED')
  cancelled,
}