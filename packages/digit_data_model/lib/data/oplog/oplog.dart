import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:isar/isar.dart';

class IndividualOpLogManager extends OpLogManager<IndividualModel> {
  IndividualOpLogManager(super.isar);

  @override
  IndividualModel applyServerGeneratedIdToEntity(
    IndividualModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(IndividualModel entity) =>
      entity.clientReferenceId;

  @override
  String? getServerGeneratedId(IndividualModel entity) => entity.id;

  @override
  int? getRowVersion(IndividualModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(IndividualModel entity) =>
      entity.nonRecoverableError;
}

class FacilityOpLogManager extends OpLogManager<FacilityModel> {
  FacilityOpLogManager(super.isar);

  @override
  FacilityModel applyServerGeneratedIdToEntity(
    FacilityModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(FacilityModel entity) => entity.id;

  @override
  String? getServerGeneratedId(FacilityModel entity) => entity.id;

  @override
  int? getRowVersion(FacilityModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(FacilityModel entity) =>
      entity.nonRecoverableError;
}

class ProjectFacilityOpLogManager extends OpLogManager<ProjectFacilityModel> {
  ProjectFacilityOpLogManager(super.isar);

  @override
  ProjectFacilityModel applyServerGeneratedIdToEntity(
    ProjectFacilityModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ProjectFacilityModel entity) => entity.id;

  @override
  String? getServerGeneratedId(ProjectFacilityModel entity) => entity.id;

  @override
  int? getRowVersion(ProjectFacilityModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ProjectFacilityModel entity) =>
      entity.nonRecoverableError;
}

class AddressOpLogManager extends OpLogManager<AddressModel> {
  AddressOpLogManager(super.isar);

  @override
  AddressModel applyServerGeneratedIdToEntity(
    AddressModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) {
    return entity;
  }

  @override
  String getClientReferenceId(
    AddressModel entity,
  ) {
    return entity.relatedClientReferenceId!;
  }

  @override
  int? getRowVersion(AddressModel entity) {
    return entity.rowVersion;
  }

  @override
  String? getServerGeneratedId(AddressModel entity) {
    return entity.relatedClientReferenceId;
  }

  @override
  bool? getNonRecoverableError(AddressModel entity) =>
      entity.nonRecoverableError;
}

class ProjectStaffOpLogManager extends OpLogManager<ProjectStaffModel> {
  ProjectStaffOpLogManager(super.isar);

  @override
  ProjectStaffModel applyServerGeneratedIdToEntity(
    ProjectStaffModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ProjectStaffModel entity) => entity.id;

  @override
  String? getServerGeneratedId(ProjectStaffModel entity) => entity.id;

  @override
  int? getRowVersion(ProjectStaffModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ProjectStaffModel entity) =>
      entity.nonRecoverableError;
}

class ProjectOpLogManager extends OpLogManager<ProjectModel> {
  ProjectOpLogManager(super.isar);

  @override
  ProjectModel applyServerGeneratedIdToEntity(
    ProjectModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ProjectModel entity) => entity.id;

  @override
  String? getServerGeneratedId(ProjectModel entity) => entity.id;

  @override
  int? getRowVersion(ProjectModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ProjectModel entity) =>
      entity.nonRecoverableError;
}

class ProjectResourceOpLogManager extends OpLogManager<ProjectResourceModel> {
  ProjectResourceOpLogManager(super.isar);

  @override
  ProjectResourceModel applyServerGeneratedIdToEntity(
    ProjectResourceModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ProjectResourceModel entity) =>
      throw UnimplementedError();

  @override
  String? getServerGeneratedId(ProjectResourceModel entity) => entity.id;

  @override
  int? getRowVersion(ProjectResourceModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ProjectResourceModel entity) =>
      entity.nonRecoverableError;
}

class ProductVariantOpLogManager extends OpLogManager<ProductVariantModel> {
  ProductVariantOpLogManager(super.isar);

  @override
  ProductVariantModel applyServerGeneratedIdToEntity(
    ProductVariantModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(id: serverGeneratedId, rowVersion: rowVersion);

  @override
  String getClientReferenceId(ProductVariantModel entity) => entity.id;

  @override
  String? getServerGeneratedId(ProductVariantModel entity) => entity.id;

  @override
  int? getRowVersion(ProductVariantModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(ProductVariantModel entity) =>
      entity.nonRecoverableError;
}

class BoundaryOpLogManager extends OpLogManager<BoundaryModel> {
  BoundaryOpLogManager(super.isar);

  @override
  BoundaryModel applyServerGeneratedIdToEntity(
    BoundaryModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      throw UnimplementedError();

  @override
  String getClientReferenceId(BoundaryModel entity) =>
      throw UnimplementedError();

  @override
  String? getServerGeneratedId(BoundaryModel entity) =>
      throw UnimplementedError();
  @override
  int? getRowVersion(BoundaryModel entity) => throw UnimplementedError();

  @override
  bool? getNonRecoverableError(BoundaryModel entity) =>
      throw UnimplementedError();
}
