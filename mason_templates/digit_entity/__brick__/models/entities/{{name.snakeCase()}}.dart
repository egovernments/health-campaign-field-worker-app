// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
{{^isEnum}}import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class {{name.pascalCase()}}SearchModel extends EntitySearchModel {
  {{#attributes}}{{#includeForQuery}}final {{#isList}}List<{{/isList}}{{type}}{{#isList}}>{{/isList}}? {{name.camelCase()}};
  {{/includeForQuery}}{{/attributes}}{{#customAttributes}}{{#includeForQuery}}final {{#isList}}List<{{/isList}}{{type.pascalCase()}}{{^isEnum}}SearchModel{{/isEnum}}{{#isList}}>{{/isList}}? {{name.camelCase()}};
  {{/includeForQuery}}{{/customAttributes}}{{#dateTimeAttributes}}{{#includeForQuery}}final {{type.pascalCase()}}? {{name.camelCase()}}Time;
  {{/includeForQuery}}{{/dateTimeAttributes}}
  {{name.pascalCase()}}SearchModel({
    {{#attributes}}{{#includeForQuery}}this.{{name.camelCase()}},
    {{/includeForQuery}}{{/attributes}}{{#customAttributes}}{{#includeForQuery}}this.{{name.camelCase()}},
    {{/includeForQuery}}{{/customAttributes}}{{#dateTimeAttributes}}{{#includeForQuery}}int? {{name.camelCase()}},
    {{/includeForQuery}}{{/dateTimeAttributes}}super.boundaryCode,
  }): {{#dateTimeAttributes}}{{#includeForQuery}}{{name.camelCase()}}Time = {{name.camelCase()}} == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch({{name.camelCase()}}),
  {{/includeForQuery}}{{/dateTimeAttributes}} super();{{#dateTimeAttributes}}{{#includeForQuery}}

  int? get {{name}} => {{name}}Time?.millisecondsSinceEpoch;
  {{/includeForQuery}}{{/dateTimeAttributes}}
}

@MappableClass(ignoreNull: true)
class {{name.pascalCase()}}Model extends EntityModel {

  static const schemaName = '{{name.pascalCase()}}';

  {{#attributes}}{{#includeForEntity}}final {{#isList}}List<{{/isList}}{{type}}{{#isList}}>{{/isList}}{{#nullable}}?{{/nullable}} {{name.camelCase()}};
  {{/includeForEntity}}{{/attributes}}{{#customAttributes}}final {{#isList}}List<{{/isList}}{{type.pascalCase()}}{{^isEnum}}Model{{/isEnum}}{{#isList}}>{{/isList}}{{#nullable}}?{{/nullable}} {{name.camelCase()}};
  {{/customAttributes}}{{#dateTimeAttributes}}final {{type}}{{#nullable}}?{{/nullable}} {{name.camelCase()}}Time;
  {{/dateTimeAttributes}}

  {{name.pascalCase()}}Model({
    {{#attributes}}{{#includeForEntity}}{{^nullable}}required {{/nullable}}this.{{name.camelCase()}},
    {{/includeForEntity}}{{/attributes}}{{#customAttributes}}{{^nullable}}required {{/nullable}}this.{{name.camelCase()}},
    {{/customAttributes}}{{#dateTimeAttributes}}{{^nullable}}required {{/nullable}}int{{#nullable}}?{{/nullable}} {{name.camelCase()}},
    {{/dateTimeAttributes}}super.auditDetails,
    {{name.pascalCase()}}AdditionalFields? additionalFields,
  }): {{#dateTimeAttributes}}{{name.camelCase()}}Time = {{#nullable}}{{name.camelCase()}} == null
          ? null
          : {{/nullable}}DateTime.fromMillisecondsSinceEpoch({{name.camelCase()}}),
      {{/dateTimeAttributes}} super(additionalFields: additionalFields);{{#dateTimeAttributes}}

  int{{#nullable}}?{{/nullable}}  get {{name}} => {{name}}Time{{#nullable}}?{{/nullable}}.millisecondsSinceEpoch;
  {{/dateTimeAttributes}}

  {{name.pascalCase()}}Companion get companion {
    return {{name.pascalCase()}}Companion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toString()),
      {{#sqlAttributes}}{{#includeForEntity}}{{#includeForTable}}{{name.camelCase()}}: Value({{name.camelCase()}}{{#isList}}{{#nullable}}?{{/nullable}}.toString(){{/isList}}),
      {{/includeForTable}}{{/includeForEntity}}{{/sqlAttributes}}{{#referenceAttributes}}{{#references}}{{name}}: Value({{name}}{{#nullable}}?{{/nullable}}.{{pkName}}),
    {{/references}}{{/referenceAttributes}});
  }
}

class {{name.pascalCase()}}AdditionalFields extends AdditionalFields {
  {{name.pascalCase()}}AdditionalFields({
    super.schema = '{{name.pascalCase()}}',
    required super.version,
    super.fields,
  });
}
{{/isEnum}}{{#isEnum}}
@MappableEnum(caseStyle: CaseStyle.upperCase)
enum {{name.pascalCase()}} {
  {{#enumValues}}@MappableValue("{{value}}") {{name.camelCase()}},
  {{/enumValues}};
}{{/isEnum}}