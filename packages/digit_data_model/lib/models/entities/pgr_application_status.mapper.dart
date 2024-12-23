// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pgr_application_status.dart';

class PgrServiceApplicationStatusMapper
    extends EnumMapper<PgrServiceApplicationStatus> {
  PgrServiceApplicationStatusMapper._();

  static PgrServiceApplicationStatusMapper? _instance;
  static PgrServiceApplicationStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = PgrServiceApplicationStatusMapper._());
    }
    return _instance!;
  }

  static PgrServiceApplicationStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PgrServiceApplicationStatus decode(dynamic value) {
    switch (value) {
      case 'CREATED':
        return PgrServiceApplicationStatus.created;
      case 'PENDING_ASSIGNMENT':
        return PgrServiceApplicationStatus.pendingAssignment;
      case 'RESOLVED':
        return PgrServiceApplicationStatus.resolved;
      case 'REJECTED':
        return PgrServiceApplicationStatus.rejected;
      case 'CANCELLED':
        return PgrServiceApplicationStatus.cancelled;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PgrServiceApplicationStatus self) {
    switch (self) {
      case PgrServiceApplicationStatus.created:
        return 'CREATED';
      case PgrServiceApplicationStatus.pendingAssignment:
        return 'PENDING_ASSIGNMENT';
      case PgrServiceApplicationStatus.resolved:
        return 'RESOLVED';
      case PgrServiceApplicationStatus.rejected:
        return 'REJECTED';
      case PgrServiceApplicationStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension PgrServiceApplicationStatusMapperExtension
    on PgrServiceApplicationStatus {
  dynamic toValue() {
    PgrServiceApplicationStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PgrServiceApplicationStatus>(this);
  }
}
