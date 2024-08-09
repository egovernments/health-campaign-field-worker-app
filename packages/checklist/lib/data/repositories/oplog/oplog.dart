import 'package:checklist/checklist.dart' as chck;
import 'package:digit_data_model/data_model.dart';


//oplog1
class ServiceDefinitionOpLogManager
    extends OpLogManager<chck.ServiceDefinitionModel> {
  ServiceDefinitionOpLogManager(super.isar);

  @override
  chck.ServiceDefinitionModel applyServerGeneratedIdToEntity(
      chck.ServiceDefinitionModel entity,
      String serverGeneratedId,
      int rowVersion,
      ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(chck.ServiceDefinitionModel entity) {
    throw UnimplementedError();
  }

  @override
  String? getServerGeneratedId(chck.ServiceDefinitionModel entity) => entity.id;

  @override
  int? getRowVersion(chck.ServiceDefinitionModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(chck.ServiceDefinitionModel entity) =>
      entity.nonRecoverableError;
}

//oplog2
class ServiceOpLogManager extends OpLogManager<chck.ServiceModel> {
  ServiceOpLogManager(super.isar);

  @override
  chck.ServiceModel applyServerGeneratedIdToEntity(
      chck.ServiceModel entity,
      String serverGeneratedId,
      int rowVersion,
      ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(chck.ServiceModel entity) => entity.clientId;

  @override
  String? getServerGeneratedId(chck.ServiceModel entity) => entity.id;

  @override
  int? getRowVersion(chck.ServiceModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(chck.ServiceModel entity) =>
      entity.nonRecoverableError;
}