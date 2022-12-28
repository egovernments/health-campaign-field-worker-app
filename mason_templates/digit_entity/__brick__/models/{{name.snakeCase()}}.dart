import 'package:dart_mappable/dart_mappable.dart';

{{^isEnum}}{{#customAttributes}}import '{{type.snakeCase()}}.dart';
{{/customAttributes}}import 'data_model.dart';

@MappableClass()
class {{name.pascalCase()}}RequestModel extends DataModel {
  {{#attributes}}final {{#isList}}List<{{/isList}}{{type}}{{#isList}}>{{/isList}}? {{name.camelCase()}};
  {{/attributes}}{{#customAttributes}}final {{#isList}}List<{{/isList}}{{type.pascalCase()}}{{^isEnum}}RequestModel{{/isEnum}}{{#isList}}>{{/isList}}? {{name.camelCase()}};
  {{/customAttributes}}{{#dateTimeAttributes}}final {{type.pascalCase()}}? {{name.camelCase()}}Time;
  {{/dateTimeAttributes}}
  {{name.pascalCase()}}RequestModel({
    {{#attributes}}this.{{name.camelCase()}},
    {{/attributes}}{{#customAttributes}}this.{{name.camelCase()}},
    {{/customAttributes}}{{#dateTimeAttributes}}int? {{name.camelCase()}},
    {{/dateTimeAttributes}}super.auditDetails,
  }): {{#dateTimeAttributes}}{{name.camelCase()}}Time = {{name.camelCase()}} == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch({{name.camelCase()}}),
  {{/dateTimeAttributes}} super();{{#dateTimeAttributes}}

  int? get {{name}} => {{name}}Time?.millisecondsSinceEpoch;
  {{/dateTimeAttributes}}
}

@MappableClass()
class {{name.pascalCase()}}Model extends DataModel implements {{name.pascalCase()}}RequestModel {
  {{#attributes}}
  @override
  final {{#isList}}List<{{/isList}}{{type}}{{#isList}}>{{/isList}}{{#nullable}}?{{/nullable}} {{name.camelCase()}};
  {{/attributes}}{{#customAttributes}}
  @override
  final {{#isList}}List<{{/isList}}{{type.pascalCase()}}{{^isEnum}}RequestModel{{/isEnum}}{{#isList}}>{{/isList}}{{#nullable}}?{{/nullable}} {{name.camelCase()}};
  {{/customAttributes}}{{#dateTimeAttributes}}
  @override
  final {{type}}{{#nullable}}?{{/nullable}} {{name.camelCase()}}Time;
  {{/dateTimeAttributes}}

  {{name.pascalCase()}}Model({
    {{#attributes}}{{^nullable}}required{{/nullable}} this.{{name.camelCase()}},
    {{/attributes}}{{#customAttributes}}{{^nullable}}required{{/nullable}} this.{{name.camelCase()}},
    {{/customAttributes}}{{#dateTimeAttributes}}{{^nullable}}required{{/nullable}} int{{#nullable}}?{{/nullable}} {{name.camelCase()}},
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