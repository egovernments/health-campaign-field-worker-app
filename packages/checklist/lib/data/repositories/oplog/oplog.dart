
import 'package:digit_data_model/data_model.dart';


//oplog1
class ServiceDefinitionOpLogManager
    extends OpLogManager<ServiceDefinitionModel> {
  ServiceDefinitionOpLogManager(super.isar);

  @override
  ServiceDefinitionModel applyServerGeneratedIdToEntity(
      ServiceDefinitionModel entity,
      String serverGeneratedId,
      int rowVersion,
      ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ServiceDefinitionModel entity) {
    throw UnimplementedError();
  }

  @override
  String? getServerGeneratedId(ServiceDefinitionModel entity) => entity.id;

  @override
  int? getRowVersion(ServiceDefinitionModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ServiceDefinitionModel entity) =>
      entity.nonRecoverableError;
}

//oplog2
class ServiceOpLogManager extends OpLogManager<ServiceModel> {
  ServiceOpLogManager(super.isar);

  @override
  ServiceModel applyServerGeneratedIdToEntity(
      ServiceModel entity,
      String serverGeneratedId,
      int rowVersion,
      ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ServiceModel entity) => entity.clientId;

  @override
  String? getServerGeneratedId(ServiceModel entity) => entity.id;

  @override
  int? getRowVersion(ServiceModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ServiceModel entity) =>
      entity.nonRecoverableError;
}