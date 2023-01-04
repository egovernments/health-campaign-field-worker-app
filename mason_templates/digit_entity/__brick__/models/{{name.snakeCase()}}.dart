// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

{{^isEnum}}import 'data_model.dart';

@MappableClass()
class {{name.pascalCase()}}RequestModel extends DataModel {
  {{#attributes}}{{#includeForQuery}}final {{#isList}}List<{{/isList}}{{type}}{{#isList}}>{{/isList}}? {{name.camelCase()}};
  {{/includeForQuery}}{{/attributes}}{{#customAttributes}}{{#includeForQuery}}final {{#isList}}List<{{/isList}}{{type.pascalCase()}}{{^isEnum}}RequestModel{{/isEnum}}{{#isList}}>{{/isList}}? {{name.camelCase()}};
  {{/includeForQuery}}{{/customAttributes}}{{#dateTimeAttributes}}{{#includeForQuery}}final {{type.pascalCase()}}? {{name.camelCase()}}Time;
  {{/includeForQuery}}{{/dateTimeAttributes}}
  {{name.pascalCase()}}RequestModel({
    {{#attributes}}{{#includeForQuery}}this.{{name.camelCase()}},
    {{/includeForQuery}}{{/attributes}}{{#customAttributes}}{{#includeForQuery}}this.{{name.camelCase()}},
    {{/includeForQuery}}{{/customAttributes}}{{#dateTimeAttributes}}{{#includeForQuery}}int? {{name.camelCase()}},
    {{/includeForQuery}}{{/dateTimeAttributes}}super.auditDetails,
  }): {{#dateTimeAttributes}}{{#includeForQuery}}{{name.camelCase()}}Time = {{name.camelCase()}} == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch({{name.camelCase()}}),
  {{/includeForQuery}}{{/dateTimeAttributes}} super();{{#dateTimeAttributes}}{{#includeForQuery}}

  int? get {{name}} => {{name}}Time?.millisecondsSinceEpoch;
  {{/includeForQuery}}{{/dateTimeAttributes}}
}

@MappableClass()
class {{name.pascalCase()}}Model extends DataModel implements {{name.pascalCase()}}RequestModel {
  {{#attributes}}{{#includeForQuery}}
  @override
  {{/includeForQuery}}final {{#isList}}List<{{/isList}}{{type}}{{#isList}}>{{/isList}}{{#nullable}}?{{/nullable}} {{name.camelCase()}};
  {{/attributes}}{{#customAttributes}}{{#includeForQuery}}
  @override
  {{/includeForQuery}}final {{#isList}}List<{{/isList}}{{type.pascalCase()}}{{^isEnum}}RequestModel{{/isEnum}}{{#isList}}>{{/isList}}{{#nullable}}?{{/nullable}} {{name.camelCase()}};
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
  int{{#nullable}}?{{/nullable}}  get {{name}} => {{name}}Time{{#nullable}}?{{/nullable}} .millisecondsSinceEpoch;
  {{/dateTimeAttributes}}
}
{{/isEnum}}{{#isEnum}}
@MappableEnum(caseStyle: CaseStyle.upperCase)
enum {{name.pascalCase()}} {
  {{#enumValues}}@MappableValue("{{value}}") {{name.camelCase()}},
  {{/enumValues}};
}{{/isEnum}}