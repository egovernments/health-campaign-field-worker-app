// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:inventory_management/models/entities/project_product_variant.dart';

part 'project_resource.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectResourceSearchModel with ProjectResourceSearchModelMappable {
  final List<String>? id;
  final String? projectId;
  final String? tenantId;

  ProjectResourceSearchModel({
    this.id,
    this.projectId,
    this.tenantId,
  }) : super();

  @MappableConstructor()
  ProjectResourceSearchModel.ignoreDeleted({
    this.id,
    this.projectId,
    this.tenantId,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectResourceModel with ProjectResourceModelMappable {
  static const schemaName = 'ProjectResource';

  final String? id;
  final String? projectId;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final ProjectProductVariantModel resource;
  final ProjectResourceAdditionalFields? additionalFields;

  ProjectResourceModel({
    this.additionalFields,
    this.id,
    this.projectId,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    required this.resource,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectResourceAdditionalFields
    with ProjectResourceAdditionalFieldsMappable {
  ProjectResourceAdditionalFields();
}
