// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
{{^isEnum}}import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part '{{name.snakeCase()}}.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class {{name.pascalCase()}}SearchModel extends EntitySearchModel with {{name.pascalCase()}}SearchModelMappable {
  {{#attributes}}{{#includeForQuery}}final {{#isList}}List<{{/isList}}{{type}}{{#isList}}>{{/isList}}? {{name.camelCase()}};
  {{/includeForQuery}}{{/attributes}}{{#customAttributes}}{{#includeForQuery}}final {{#isList}}List<{{/isList}}{{type.pascalCase()}}{{^isEnum}}SearchModel{{/isEnum}}{{#isList}}>{{/isList}}? {{name.camelCase()}};
  {{/includeForQuery}}{{/customAttributes}}{{#dateTimeAttributes}}{{#includeForQuery}}final {{type.pascalCase()}}? {{name.camelCase()}}Time;
  {{/includeForQuery}}{{/dateTimeAttributes}}
  {{name.pascalCase()}}SearchModel({
    {{#attributes}}{{#includeForQuery}}this.{{name.camelCase()}}{{#defaultValue}} = {{defaultValue}}{{/defaultValue}},
    {{/includeForQuery}}{{/attributes}}{{#customAttributes}}{{#includeForQuery}}this.{{name.camelCase()}},
    {{/includeForQuery}}{{/customAttributes}}{{#dateTimeAttributes}}{{#includeForQuery}}int? {{name.camelCase()}},
    {{/includeForQuery}}{{/dateTimeAttributes}}super.boundaryCode,
    super.isDeleted,
  }): {{#dateTimeAttributes}}{{#includeForQuery}}{{name.camelCase()}}Time = {{name.camelCase()}} == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch({{name.camelCase()}}),
  {{/includeForQuery}}{{/dateTimeAttributes}} super();

  @MappableConstructor()
  {{name.pascalCase()}}SearchModel.ignoreDeleted({
    {{#attributes}}{{#includeForQuery}}this.{{name.camelCase()}}{{#defaultValue}} = {{defaultValue}}{{/defaultValue}},
    {{/includeForQuery}}{{/attributes}}{{#customAttributes}}{{#includeForQuery}}this.{{name.camelCase()}},
    {{/includeForQuery}}{{/customAttributes}}{{#dateTimeAttributes}}{{#includeForQuery}}int? {{name.camelCase()}},
    {{/includeForQuery}}{{/dateTimeAttributes}}super.boundaryCode,
  }): {{#dateTimeAttributes}}{{#includeForQuery}}{{name.camelCase()}}Time = {{name.camelCase()}} == null
  ? null
      : DateTime.fromMillisecondsSinceEpoch({{name.camelCase()}}),
  {{/includeForQuery}}{{/dateTimeAttributes}} super(isDeleted: false);{{#dateTimeAttributes}}{{#includeForQuery}}

  int? get {{name}} => {{name}}Time?.millisecondsSinceEpoch;
  {{/includeForQuery}}{{/dateTimeAttributes}}
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class {{name.pascalCase()}}Model extends EntityModel with {{name.pascalCase()}}ModelMappable {

  static const schemaName = '{{name.pascalCase()}}';

  {{#attributes}}{{#includeForEntity}}final {{#isList}}List<{{/isList}}{{type}}{{#isList}}>{{/isList}}{{#nullable}}?{{/nullable}} {{name.camelCase()}};
  {{/includeForEntity}}{{/attributes}}{{#customAttributes}}{{#includeForEntity}}final {{#isList}}List<{{/isList}}{{type.pascalCase()}}{{^isEnum}}Model{{/isEnum}}{{#isList}}>{{/isList}}{{#nullable}}?{{/nullable}} {{name.camelCase()}};
  {{/includeForEntity}}{{/customAttributes}}{{#dateTimeAttributes}}final {{type}}{{#nullable}}?{{/nullable}} {{name.camelCase()}}Time;
  {{/dateTimeAttributes}}final {{name.pascalCase()}}AdditionalFields? additionalFields;

  {{name.pascalCase()}}Model({
    this.additionalFields,
    {{#attributes}}{{#includeForEntity}}{{^nullable}}required {{/nullable}}this.{{name.camelCase()}}{{#defaultValue}} = {{defaultValue}}{{/defaultValue}},
    {{/includeForEntity}}{{/attributes}}{{#customAttributes}}{{#includeForEntity}}{{^nullable}}required {{/nullable}}this.{{name.camelCase()}},
    {{/includeForEntity}}{{/customAttributes}}{{#dateTimeAttributes}}{{^nullable}}required {{/nullable}}int{{#nullable}}?{{/nullable}} {{name.camelCase()}},
    {{/dateTimeAttributes}}super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): {{#dateTimeAttributes}}{{name.camelCase()}}Time = {{#nullable}}{{name.camelCase()}} == null
          ? null
          : {{/nullable}}DateTime.fromMillisecondsSinceEpoch({{name.camelCase()}}),
      {{/dateTimeAttributes}}super();{{#dateTimeAttributes}}

  int{{#nullable}}?{{/nullable}}  get {{name}} => {{name}}Time{{#nullable}}?{{/nullable}}.millisecondsSinceEpoch;
  {{/dateTimeAttributes}}

  {{name.pascalCase()}}Companion get companion {
    return {{name.pascalCase()}}Companion({{#persistBoundaryParameters}}
      localityBoundaryCode: Value(locality?.code),
      localityBoundaryName: Value(locality?.name),{{/persistBoundaryParameters}}
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      {{#sqlAttributes}}{{#includeForEntity}}{{#includeForTable}}{{name.camelCase()}}: Value({{name.camelCase()}}{{#isList}}{{#nullable}}?{{/nullable}}.toString(){{/isList}}),
      {{/includeForTable}}{{/includeForEntity}}{{/sqlAttributes}}{{#referenceAttributes}}{{#references}}{{name}}: Value({{name}}{{#nullable}}?{{/nullable}}.{{pkName}}),
    {{/references}}{{/referenceAttributes}});
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class {{name.pascalCase()}}AdditionalFields extends AdditionalFields with {{name.pascalCase()}}AdditionalFieldsMappable {
  {{name.pascalCase()}}AdditionalFields({
    super.schema = '{{name.pascalCase()}}',
    required super.version,
    super.fields,
  });
}

{{/isEnum}}{{#isEnum}}
part '{{name.snakeCase()}}.mapper.dart';
@MappableEnum(caseStyle: CaseStyle.upperCase)
enum {{name.pascalCase()}} {
  {{#enumValues}}@MappableValue("{{value}}") {{name.camelCase()}},
  {{/enumValues}};
}{{/isEnum}}