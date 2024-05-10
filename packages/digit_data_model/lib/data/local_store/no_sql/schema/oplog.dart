import 'package:attendance_management/models/entities/attendance_log.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:isar/isar.dart';
import '../../../../models/oplog/oplog_entry.dart';

part 'oplog.g.dart';

@Collection()
class OpLog {
  Id id = Isar.autoIncrement;
  late String entityString;

  @ignore
  getEntity<T extends EntityModel>() {
    switch (entityType.name) {
      case "individual":
        final entity = IndividualModelMapper.fromJson(entityString);
        return entity;

      case "service":
        final entity = ServiceModelMapper.fromJson(entityString);
        return entity;

      case "attendance":
        final entity = AttendanceLogModelMapper.fromJson(entityString);
        return entity;

      default:
        final entity = EntityModelMapper.fromJson(entityString);
        return entity;
    }
  }

  void entity<T extends EntityModel>(T entity) {
    entityString = entity.toJson();
  }

  @Enumerated(EnumType.name)
  late DataModelType entityType;

  @Enumerated(EnumType.name)
  late DataOperation operation;

  String? serverGeneratedId;

  String? clientReferenceId;

  DateTime? syncedUpOn;

  DateTime? syncedDownOn;

  late String createdBy;

  late DateTime createdAt;

  late bool syncedUp;

  late bool syncedDown;

  late List<AdditionalId> additionalIds;

  late int rowVersion;

  late int syncDownRetryCount;

  late bool nonRecoverableError;
}

@embedded
class AdditionalId {
  late String idType;
  late String id;
}
