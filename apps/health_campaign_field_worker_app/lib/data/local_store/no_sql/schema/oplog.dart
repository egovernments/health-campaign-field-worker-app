import 'package:isar/isar.dart';

import '../../../../models/data_model.dart';

part 'oplog.g.dart';

@Collection()
class OpLog {
  Id id = Isar.autoIncrement;
  late String entityString;

  @ignore
  T getEntity<T extends EntityModel>() => Mapper.fromJson<T>(entityString);
  void entity<T extends EntityModel>(T entity) {
    entityString = entity.toJson();
  }

  @Enumerated(EnumType.name)
  late DataModelType entityType;

  @Enumerated(EnumType.name)
  late DataOperation operation;

  late DateTime createdOn;

  DateTime? syncedOn;

  String? createdBy;

  late bool isSynced;
}
