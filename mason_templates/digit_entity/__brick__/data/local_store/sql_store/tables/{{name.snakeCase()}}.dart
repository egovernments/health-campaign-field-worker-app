{{^isEnum}}import 'package:drift/drift.dart';

{{#sqlAttributes}}{{#isEnum}}import '../../../../models/{{type.snakeCase()}}.dart';
{{/isEnum}}{{/sqlAttributes}}{{#referenceAttributes}}{{#references}}import '{{table.snakeCase()}}.dart';
{{/references}}{{/referenceAttributes}}
class {{name.pascalCase()}} extends Table {
  {{#sqlAttributes}}{{^isEnum}}{{columnType.pascalCase()}}Column get {{name.camelCase()}} => {{type.camelCase()}}(){{#nullable}}.nullable(){{/nullable}}();{{/isEnum}}{{#isEnum}}IntColumn get {{name.camelCase()}} => intEnum<{{type.pascalCase()}}>()();{{/isEnum}}
  {{/sqlAttributes}}{{#referenceAttributes}}
  {{#references}}TextColumn get {{name}} => text().references({{table.pascalCase()}}, #clientReferenceId)();{{/references}}{{/referenceAttributes}}

  @override
  Set<Column>? get primaryKey => { {{#sqlAttributes}}{{#isPk}}{{name}}, {{/isPk}}{{/sqlAttributes}} };
}{{/isEnum}}{{#isEnum}}// No table generated for Enum{{/isEnum}}