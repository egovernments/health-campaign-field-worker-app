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
class {{name.pascalCase()}}Model extends EntityModel implements {{name.pascalCase()}}SearchModel {
  {{#attributes}}{{#includeForQuery}}
  @override
  {{/includeForQuery}}final {{#isList}}List<{{/isList}}{{type}}{{#isList}}>{{/isList}}{{#nullable}}?{{/nullable}} {{name.camelCase()}};
  {{/attributes}}{{#customAttributes}}{{#includeForQuery}}
  @override
  {{/includeForQuery}}final {{#isList}}List<{{/isList}}{{type.pascalCase()}}{{^isEnum}}Model{{/isEnum}}{{#isList}}>{{/isList}}{{#nullable}}?{{/nullable}} {{name.camelCase()}};
  {{/customAttributes}}{{#dateTimeAttributes}}{{#includeForQuery}}
  @override
  {{/includeForQuery}}final {{type}}{{#nullable}}?{{/nullable}} {{name.camelCase()}}Time;
  {{/dateTimeAttributes}}

  {{name.pascalCase()}}Model({
    {{#attributes}}{{^nullable}}required {{/nullable}}this.{{name.camelCase()}},
    {{/attributes}}{{#customAttributes}}{{^nullable}}required {{/nullable}}this.{{name.camelCase()}},
    {{/customAttributes}}{{#dateTimeAttributes}}{{^nullable}}required {{/nullable}}int{{#nullable}}?{{/nullable}} {{name.camelCase()}},
    {{/dateTimeAttributes}}super.auditDetails,
  }): {{#dateTimeAttributes}}{{name.camelCase()}}Time = {{#nullable}}{{name.camelCase()}} == null
          ? null
          : {{/nullable}}DateTime.fromMillisecondsSinceEpoch({{name.camelCase()}}),
      {{/dateTimeAttributes}} super();{{#dateTimeAttributes}}

  @override
  int{{#nullable}}?{{/nullable}}  get {{name}} => {{name}}Time{{#nullable}}?{{/nullable}}.millisecondsSinceEpoch;
  {{/dateTimeAttributes}}

  {{name.pascalCase()}}Companion get companion {
    return {{name.pascalCase()}}Companion(
      {{#sqlAttributes}}{{name.camelCase()}}: Value({{name.camelCase()}}{{#isList}}{{#nullable}}?{{/nullable}}.toString(){{/isList}}),
      {{/sqlAttributes}}{{#referenceAttributes}}{{#references}}{{name}}: Value({{name}}{{#nullable}}?{{/nullable}}.clientReferenceId),
    {{/references}}{{/referenceAttributes}});
  }
}
{{/isEnum}}{{#isEnum}}
@MappableEnum(caseStyle: CaseStyle.upperCase)
enum {{name.pascalCase()}} {
  {{#enumValues}}@MappableValue("{{value}}") {{name.camelCase()}},
  {{/enumValues}};
}{{/isEnum}}