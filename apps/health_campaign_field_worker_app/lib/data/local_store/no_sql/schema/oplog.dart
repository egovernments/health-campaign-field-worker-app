import 'package:isar/isar.dart';

import '../../../../models/data_model.dart';

part 'oplog.g.dart';

@Collection()
class OpLog {
  Id id = Isar.autoIncrement;
  late String entityString;

  @ignore
  getEntity<T extends EntityModel>() {
    switch (entityType.name) {
      case "household":
        final entity = HouseholdModelMapper.fromJson(entityString);
        return entity;

      case "householdMember":
        final entity = HouseholdMemberModelMapper.fromJson(entityString);

        return entity;

      case "individual":
        final entity = IndividualModelMapper.fromJson(entityString);
        return entity;
      case "projectBeneficiary":
        final entity = ProjectBeneficiaryModelMapper.fromJson(entityString);
        return entity;

      case "task":
        final entity = TaskModelMapper.fromJson(entityString);
        return entity;

      case "sideEffect":
        final entity = SideEffectModelMapper.fromJson(entityString);
        return entity;

      case "referral":
        final entity = ReferralModelMapper.fromJson(entityString);

        return entity;
      case "attendance":
        final entity = HCMAttendanceLogModelMapper.fromJson(entityString);

        return entity;
      case "stock":
        final entity = StockModelMapper.fromJson(entityString);

        return entity;
      case "hFReferral":
        final entity = HFReferralModelMapper.fromJson(entityString);

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
