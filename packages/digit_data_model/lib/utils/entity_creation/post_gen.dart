import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

import 'models.dart';

class Postgen {
  void run(ConfigModel model) async {
    try {
      ConfigModelMapper.ensureInitialized();
      AttributeModelMapper.ensureInitialized();
      EnumValuesMapper.ensureInitialized();
      TableReferenceModelMapper.ensureInitialized();

      if (!model.createRepository) {
        final path = p.join(
          'data',
          'repositories',
          'remote',
          '${model.name.snakeCase}.dart',
        );
        await _deleteFile(path);
      }

      if (model.isEnum) {
        await _generateEnumMapperDartFile(
            model.name.snakeCase, model.enumValues);
      } else {
        await _generateMapperDartFile(model);
      }

      if (model.isEnum) {
        final path = p.join(
          'data',
          'local_store',
          'sql_store',
          'tables',
          '${model.name.snakeCase}.dart',
        );
        await _deleteFile(path);
      } else {
        print('Generating table for: ' + model.name);

        print('📌 Postgen started for: ${model.name}');
        print('✅ sqlAttributes before processing: ${model.sqlAttributes}');

        if (model.sqlAttributes.isEmpty) {
          print(
              "⚠️ Warning: No sqlAttributes found. Table might not have attributes.");
          return;
        }

        await _addImportStatement(model.name);
        await _addSqlTablesInGDartFile(model);

        final file = File(
            '../lib/data/local_store/sql_store/tables/${model.name.toString().snakeCase}.dart');

        print(file.readAsStringSync());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _deleteFile(String path) async {
    final file = File(path);
    if (file.existsSync()) {
      try {
        await file.delete();
      } catch (e) {
        print("Error: $e");
      }
    } else {
      print("File does not exist");
    }
  }

  Future<void> _addSqlTablesInGDartFile(ConfigModel model) async {
    final name = model.name;

    // Generate the tables and data classes
    String classCode = generateTableClassCode(model);
    await appendToFile(classCode);
    print(
        "${name.toString().pascalCase}Table class is added in sql_store.g.dart");

    // Generate the data class
    classCode = generateDataClassCode(model);
    await appendToFile(classCode);
    print(
        "${name.toString().pascalCase}Data class is added in sql_store.g.dart");

    // Generate the data class
    classCode = generateCompanionClassCode(model);
    await appendToFile(classCode);
    print(
        "${name.toString().pascalCase}Companion class is added in sql_store.g.dart");

    // Check if the sql_store.g.dart file exists
    var sqlStoreFile = File("data/local_store/sql_store/sql_store.g.dart");

    // Read the sql_store.g.dart file
    var sqlStoreFileContent = sqlStoreFile.readAsStringSync();

    var localSqlDataStore =
        '''late final \$${name.toString().pascalCase}Table ${name.toString().camelCase} = \$${name.toString().pascalCase}Table(this);''';
    var schemaEntity = '${name.toString().camelCase},';

    var libraryIndex = sqlStoreFileContent.indexOf("super(e);");
    if (libraryIndex != -1) {
      var endOfLibrary = libraryIndex + "super(e);".length;
      sqlStoreFileContent =
          '${sqlStoreFileContent.substring(0, (endOfLibrary + 1) as int?)}$localSqlDataStore\n${sqlStoreFileContent.substring((endOfLibrary + 1) as int)}';

      // Write the updated content back to the utils.dart file
      sqlStoreFile.writeAsStringSync(sqlStoreFileContent);
    } else {
      print(
          'Could not find the target string, check if attributes are missing in sqlAttributes.');
    }

    // The target substring we want to search after
    String targetString = 'List<DatabaseSchemaEntity>';

    // Find the index of the target substring
    int targetIndex = sqlStoreFileContent.indexOf(targetString);

    if (targetIndex != -1) {
      // Find the index of '[' after the target substring
      int libraryIndex = sqlStoreFileContent.indexOf('[', targetIndex);

      if (libraryIndex != -1) {
        var endOfLibrary = libraryIndex + 1;
        sqlStoreFileContent =
            '${sqlStoreFileContent.substring(0, (endOfLibrary + 1) as int?)}$schemaEntity\n${sqlStoreFileContent.substring((endOfLibrary + 1) as int)}';

        // Write the updated content back to the utils.dart file
        sqlStoreFile.writeAsStringSync(sqlStoreFileContent);
      } else {
        print('Could not find "[" after "$targetString".');
      }
    } else {
      print('Could not find the target string "$targetString".');
    }
  }

  String generateDataClassCode(ConfigModel model) {
    String className = model.name;
    StringBuffer classCode = StringBuffer();

    classCode.writeln(
        '''class ${className.pascalCase}Data extends DataClass implements Insertable<${className.pascalCase}Data> {''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln(
          '''final ${attribute.type}${attribute.nullable == true ? '?' : ''} ${attribute.name};''');
    }

    classCode.writeln('''const ${className.pascalCase}Data(
      {''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln(
          '''${attribute.nullable == true ? '' : "required"} this.${attribute.name},''');
    }

    classCode.writeln('''});
    @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln('''if (!nullToAbsent || ${attribute.name} != null) {
      map['${attribute.name.toString().snakeCase}'] = Variable<${attribute.type}>(${attribute.name});
    }''');
    }

    classCode.writeln('''return map;
  }

  ${className.pascalCase}Companion toCompanion(bool nullToAbsent) {
    return ${className.pascalCase}Companion(''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln(
          '''${attribute.name}: ${attribute.name} == null && nullToAbsent
          ? const Value.absent()
          : Value(${attribute.name}),''');
    }

    classCode.writeln(''');
  }

  factory ${className.pascalCase}Data.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ${className.pascalCase}Data(''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln(
          '''${attribute.name}: serializer.fromJson<${attribute.type}${attribute.nullable == true ? '?' : ''}>(json['${attribute.name}']),''');
    }

    classCode.writeln(''');
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln(
          ''''${attribute.name}': serializer.toJson<${attribute.type}${attribute.nullable == true ? '?' : ''}>(${attribute.name}),''');
    }

    classCode.writeln('''};
  }

  ${className.pascalCase}Data copyWith({''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      if (attribute.nullable == true) {
        classCode.writeln(
            '''Value<${attribute.type}${attribute.nullable == true ? '?' : ''}> ${attribute.name} = const Value.absent(),''');
      } else {
        classCode.writeln('''${attribute.type}? ${attribute.name},''');
      }
    }

    classCode.writeln('''}) =>
      ${className.pascalCase}Data(''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      if (attribute.nullable == true) {
        classCode.writeln('''${attribute.name}:
        ${attribute.name}.present ? ${attribute.name}.value : this.${attribute.name},''');
      } else {
        classCode.writeln(
            '''${attribute.name}: ${attribute.name} ?? this.${attribute.name},''');
      }
    }

    classCode.writeln(''');
  @override
  String toString() {
    return (StringBuffer('${className.pascalCase}Data(')''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode
          .writeln('''..write('${attribute.name}: \$${attribute.name}, ')''');
    }

    classCode.writeln('''..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln('''${attribute.name},''');
    }

    classCode.writeln(''']);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ${className.pascalCase}Data && ''');

    int i = 0;
    for (var attribute in model.attributes) {
      if (attribute.includeForTable == true) {
        classCode.writeln(
            '''other.${attribute.name} == this.${attribute.name} ${i < model.attributes.length - 1 ? '&&' : ''} ''');
      }
      i++;
    }

    classCode.writeln(''');
}
''');

    return classCode.toString();
  }

  String generateTableClassCode(ConfigModel model) {
    String className = model.name;
    StringBuffer classCode = StringBuffer();

    classCode.writeln(
        '''class \$${className.pascalCase}Table extends ${className.pascalCase} with TableInfo<\$${className.pascalCase}Table, ${className.pascalCase}Data> {
        @override
        final GeneratedDatabase attachedDatabase;
        final String? _alias;
        \$${className.pascalCase}Table(this.attachedDatabase, [this._alias]);
''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln('''
      static const VerificationMeta _${attribute.name}Meta = const VerificationMeta('${attribute.name}');
      @override
        late final GeneratedColumn<${attribute.type}> ${attribute.name} = GeneratedColumn<${attribute.type}> (
          '${attribute.name.toString().snakeCase}', aliasedName, true,
          type: DriftSqlType.${attribute.type.toString().toLowerCase()}, requiredDuringInsert: false);
          
          ''');
    }

    classCode.writeln('''
      static const VerificationMeta _additionalFieldsMeta =
      const VerificationMeta('additionalFields');
  @override
  late final GeneratedColumn<String> additionalFields = GeneratedColumn<String>(
      'additional_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);''');

    classCode.writeln('''@override
        List<GeneratedColumn> get \$columns => [''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln('''${attribute.name},''');
    }

    classCode.writeln("];");

    classCode.writeln('''
    @override
        String get aliasedName => _alias ?? actualTableName;
        @override
        String get actualTableName => \$name;
        static const String \$name = '${className.snakeCase}';

        @override
        VerificationContext validateIntegrity(Insertable<${className.pascalCase}Data> instance, {bool isInserting = false}) {
          final context = VerificationContext();
          final data = instance.toColumns(true);
        ''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln(
          '''if (data.containsKey('${attribute.name.toString().snakeCase}')) {
            context.handle(_${attribute.name}Meta, ${attribute.name}.isAcceptableOrUnknown(data['${attribute.name.toString().snakeCase}']!, _${attribute.name}Meta));
          }
          ''');
      if (attribute.nullable == false) {
        classCode.writeln('''else if (isInserting) {
      context.missing(_${attribute.name}Meta);
    }
          ''');
      }
    }
    classCode.writeln('''return context;}
    @override
  Set<GeneratedColumn> get \$primaryKey => {
    ''');

    for (var sql_attribute in model.sqlAttributes) {
      if (sql_attribute.includeForTable == false) continue;
      if (sql_attribute.isPk) {
        classCode.writeln('${sql_attribute.name},');
      }
    }

    classCode.writeln('''};
  @override
  ${className.pascalCase}Data map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '\$tablePrefix.' : '';
    return ${className.pascalCase}Data(''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln('''${attribute.name}: attachedDatabase.typeMapping
          .read(DriftSqlType.${attribute.type.toString().toLowerCase()}, data['\${effectivePrefix}${attribute.name.toString().snakeCase}'])${attribute.nullable == false ? '!' : ''},''');
    }

    classCode.writeln(''' );
  }

  @override
  \$${className.pascalCase}Table createAlias(String alias) {
    return \$${className.pascalCase}Table(attachedDatabase, alias);
  }}''');

    var table = classCode.toString();

    return table;
  }

  String generateCompanionClassCode(ConfigModel model) {
    String className = model.name;
    StringBuffer classCode = StringBuffer();

    classCode.writeln(
        '''class ${className.pascalCase}Companion extends UpdateCompanion<${className.pascalCase}Data> {''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln(
          '''final Value<${attribute.type}${attribute.nullable == true ? '?' : ''}> ${attribute.name};''');
    }

    classCode.writeln('''const ${className.pascalCase}Companion({''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln('''this.${attribute.name} = const Value.absent(),''');
    }

    classCode.writeln('''});
  ${className.pascalCase}Companion.insert({''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      if (attribute.nullable == false) {
        classCode.writeln('''required ${attribute.type} ${attribute.name},''');
      } else {
        classCode.writeln('''this.${attribute.name} = const Value.absent(),''');
      }
    }

    classCode.writeln('''}) : clientReferenceId = Value(clientReferenceId);
  static Insertable<${className.pascalCase}Data> custom({''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode
          .writeln('''Expression<${attribute.type}>? ${attribute.name},''');
    }

    classCode.writeln('''}) {
    return RawValuesInsertable({''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln(
          '''if (${attribute.name} != null) '${attribute.name}': ${attribute.name},''');
    }

    classCode.writeln(''' });
  }

  ${className.pascalCase}Companion copyWith({''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln(
          '''Value<${attribute.type}${attribute.nullable == true ? '?' : ''}>? ${attribute.name},''');
    }

    classCode.writeln('''}) {
    return ${className.pascalCase}Companion(''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln(
          '''${attribute.name}: ${attribute.name} ?? this.${attribute.name},''');
    }

    classCode.writeln(''');
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode.writeln('''if (${attribute.name}.present) {
      map['${attribute.name.toString().snakeCase}'] = Variable<${attribute.type}>(${attribute.name}.value);
    }''');
    }

    classCode.writeln('''return map;
  }

  @override
  String toString() {
    return (StringBuffer('${className.pascalCase}Companion(')''');

    for (var attribute in model.attributes) {
      if (attribute.includeForTable == false) continue;
      classCode
          .writeln('''..write('${attribute.name}: \$${attribute.name}, ')''');
    }

    classCode.writeln(''' ..write(')'))
        .toString();
  }}''');

    return classCode.toString();
  }

  Future<void> appendToFile(String classCode) async {
    final file = File(
        'data/local_store/sql_store/sql_store.g.dart'); // Specify your file path
    await file.writeAsString(classCode, mode: FileMode.append);
  }

  Future<void> _addImportStatement(String tableName) async {
    final path = p.join(
      'data',
      'local_store',
      'sql_store',
      'sql_store.dart',
    );
    final file = File(path);

    print('Adding import statement to $path');

    if (await file.exists()) {
      var content = await file.readAsString();
      final importStatement = "import 'tables/${tableName.snakeCase}.dart';";
      final tableStatement = '${tableName.pascalCase},';

      if (!content.contains(importStatement)) {
        // Add the import statement after the last import.
        final lastImportEnd = content.lastIndexOf(';') + 1;
        content = '$importStatement\n$content';
      }

      if (!content.contains(tableStatement)) {
        // Add the table to the tables list.
        final tablesListStart = content.indexOf('@DriftDatabase(tables: [') +
            '@DriftDatabase(tables: ['.length;
        content =
            '${content.substring(0, tablesListStart)}\n  $tableStatement${content.substring(tablesListStart)}';
      }

      await file.writeAsString(content);
    }
  }

  _generateEnumMapperDartFile(String name, List<EnumValues> attributes) {
    String generatedCode =
        generateEnumMapper(name, attributes.map((e) => e.name).toList());

    File file = File('models/entities/$name.mapper.dart');

    file.create();

    file.writeAsString(generatedCode);

    // add the generated mapper to initialized file
    _updateInitializeMappersFile(name);
  }

  void _updateInitializeMappersFile(String name) {
    File initFile = File('data_model.init.dart');

    if (!initFile.existsSync()) {
      initFile.createSync(recursive: true);
    }

    String content = initFile.readAsStringSync();

    // Extract existing aliases (pX)
    RegExp aliasPattern =
        RegExp(r"import 'models/entities/.*\.dart' as p(\d+);");
    Iterable<Match> matches = aliasPattern.allMatches(content);

    int nextAlias = matches
            .map((m) => int.parse(m.group(1)!))
            .fold(0, (max, num) => num > max ? num : max) +
        1;

    String importStatement =
        "import 'models/entities/$name.mapper.dart' as p$nextAlias;";
    String ensureInitCall =
        "  p$nextAlias.${name.pascalCase}Mapper.ensureInitialized();";

    // Check if import already exists
    bool importExists = content.contains(RegExp(
        r"import 'models/entities/" + name + r"\.mapper\.dart' as p\d+;"));

    // Check if ensureInitialized() already exists
    bool initCallExists = content
        .contains(RegExp(r"p\d+\." + name + r"Mapper\.ensureInitialized\(\);"));

    // Add import if it doesn’t exist
    if (!importExists) {
      content = importStatement + '\n' + content;
    }

    // Add ensureInitialized() call inside initializeMappers() if it doesn’t exist
    if (!initCallExists) {
      content = content.replaceFirst('void initializeMappers() {',
          'void initializeMappers() {\n$ensureInitCall');
    }

    initFile.writeAsStringSync(content);
  }

  Future<void> _generateMapperDartFile(ConfigModel model) async {
    final fileName = '${model.name.snakeCase}.mapper.dart';
    final filePath = 'models/entities/$fileName';
    final file = File(filePath);

    if (!file.existsSync()) {
      await file.create(recursive: true);
    }

    final buffer = StringBuffer();

    buffer.writeln("""
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member

part of '${model.name.snakeCase}.dart';
""");

    buffer.writeln(_generateSearchModelMapper(model));
    buffer.writeln(_generateModelMapper(model));
    buffer.writeln(_generateAdditionalFieldsMapper(model));

    await file.writeAsString(buffer.toString());
    print("✅ Mapper file generated: $filePath");
  }

  String _generateSearchModelMapper(ConfigModel model) {
    final className = '${model.name.pascalCase}SearchModel';
    final buffer = StringBuffer();

    buffer.writeln("""
class ${className}Mapper extends SubClassMapperBase<$className> {
  ${className}Mapper._();

  static ${className}Mapper? _instance;
  static ${className}Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ${className}Mapper._());
    }
    return _instance!;
  }

  @override
  final String id = '$className';
""");

    for (var attr in model.attributes) {
      final fieldType = attr.isList ? 'List<${attr.type}>' : attr.type;
      buffer.writeln("""
  static $fieldType? _\$${attr.name}($className v) => v.${attr.name};
  static const Field<$className, $fieldType> _f\$${attr.name} =
      Field('${attr.name}', _\$${attr.name}, opt: ${attr.nullable ? 'true' : 'false'});
  """);
    }

    buffer.writeln("""
  static AdditionalFields? _\$additionalFields($className v) => v.additionalFields;
  static const Field<$className, AdditionalFields> _f\$additionalFields =
      Field('additionalFields', _\$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<$className> fields = const {
""");

    for (var attr in model.attributes) {
      buffer.writeln("""    #${attr.name}: _f\$${attr.name},""");
    }

    buffer.writeln("""
    #additionalFields: _f\$additionalFields,
  };

  static $className _instantiate(DecodingData data) {
    return $className.ignoreDeleted(
      ${model.attributes.map((attr) => "${attr.name}: data.dec(_f\$${attr.name}),").join('\n      ')}
      additionalFields: data.dec(_f\$additionalFields),
    );
  }

  @override
  final Function instantiate = _instantiate;

  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;

  @override
  late final ClassMapperBase superMapper = EntitySearchModelMapper.ensureInitialized();

  static $className fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<$className>(map);
  }

  static $className fromJson(String json) {
    return ensureInitialized().decodeJson<$className>(json);
  }
}

/// Mixin for $className
mixin ${className}Mappable {
  String toJson() => ${className}Mapper.ensureInitialized().encodeJson<$className>(this as $className);
  Map<String, dynamic> toMap() => ${className}Mapper.ensureInitialized().encodeMap<$className>(this as $className);

  \$classNameCopyWith<$className, $className, $className> get copyWith =>
      _${className}CopyWithImpl(this as $className, \$identity, \$identity);

  @override
  String toString() {
    return ${className}Mapper.ensureInitialized().stringifyValue(this as $className);
  }

  @override
  bool operator ==(Object other) {
    return ${className}Mapper.ensureInitialized().equalsValue(this as $className, other);
  }

  @override
  int get hashCode {
    return ${className}Mapper.ensureInitialized().hashValue(this as $className);
  }
}

/// Abstract CopyWith class
abstract class ${className}CopyWith<\$R, \$In extends $className, \$Out> implements EntitySearchModelCopyWith<\$R, \$In, \$Out>{
  ${model.attributes.map((attr) => """
  ListCopyWith<\$R, String, ObjectCopyWith<\$R, String, String>>? get ${attr.name};
  """).join('\n  ')}

  \$R call({${model.attributes.map((attr) => "${attr.type}${attr.nullable ? '?' : ''} ${attr.name}").join(', ')}});
  ${className}CopyWith<\$R2, \$In, \$Out2> \$chain<\$R2, \$Out2>(Then<\$Out2, \$R2> t);
}

/// Extension for $className copyWith
extension ${className}ValueCopy<\$R, \$Out> on ObjectCopyWith<\$R, $className, \$Out> {
  ${className}CopyWith<\$R, $className, \$Out> get \$as$className =>
      \$base.as((v, t, t2) => _${className}CopyWithImpl(v, t, t2));
}

/// CopyWith implementation for $className
class _${className}CopyWithImpl<\$R, \$Out>
    extends ClassCopyWithBase<\$R, $className, \$Out>
    implements ${className}CopyWith<\$R, $className, \$Out> {
  _${className}CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<$className> \$mapper = ${className}Mapper.ensureInitialized();

  ${model.attributes.map((attr) => """
  @override
  ListCopyWith<\$R, String, ObjectCopyWith<\$R, String, String>>? get ${attr.name} =>
      \$value.${attr.name} == null || \$value.${attr.name}!.isEmpty
          ? null
          : ListCopyWith(
              \$value.${attr.name}!,
              (v, t) => ObjectCopyWith(v, \$identity, t),
              (v) => call(${attr.name}: v));
  """).join('\n  ')}

  @override
  \$R call({Object? ${model.attributes.map((attr) => "${attr.name} = \$none").join(', ')}}) =>
      \$apply(FieldCopyWithData({
        ${model.attributes.map((attr) => "if (${attr.name} != \$none) #${attr.name}: ${attr.name},").join('\n        ')}
      }));

  @override
  $className \$make(CopyWithData data) =>
      $className.ignoreDeleted(
        ${model.attributes.map((attr) => "${attr.name}: data.get(#${attr.name}, or: \$value.${attr.name}),").join('\n        ')}
      );

  @override
  ${className}CopyWith<\$R2, $className, \$Out2> \$chain<\$R2, \$Out2>(Then<\$Out2, \$R2> t) =>
      _${className}CopyWithImpl(\$value, \$cast, t);
}
""");

    return buffer.toString();
  }

  String _generateModelMapper(ConfigModel model) {
    final className = '${model.name.pascalCase}Model';
    final buffer = StringBuffer();

    buffer.writeln("""
class ${className}Mapper extends SubClassMapperBase<$className> {
  ${className}Mapper._();

  static ${className}Mapper? _instance;
  static ${className}Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ${className}Mapper._());
    }
    return _instance!;
  }

  @override
  final String id = '$className';

  static $className fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<$className>(map);
  }

  static $className fromJson(String json) {
    return ensureInitialized().decodeJson<$className>(json);
  }
}

/// Mixin for $className
mixin ${className}Mappable {
  String toJson() => ${className}Mapper.ensureInitialized().encodeJson<$className>(this as $className);
  Map<String, dynamic> toMap() => ${className}Mapper.ensureInitialized().encodeMap<$className>(this as $className);

  \$classNameCopyWith<$className, $className, $className> get copyWith =>
      _${className}CopyWithImpl(this as $className, \$identity, \$identity);
}

/// Abstract CopyWith class
abstract class ${className}CopyWith<\$R, \$In extends $className, \$Out> {
  ${model.name.pascalCase}AdditionalFieldsCopyWith<\$R, ${model.name.pascalCase}AdditionalFields,
      ${model.name.pascalCase}AdditionalFields>? get additionalFields;
  AuditDetailsCopyWith<\$R, AuditDetails, AuditDetails>? get auditDetails;
  ClientAuditDetailsCopyWith<\$R, ClientAuditDetails, ClientAuditDetails>? get clientAuditDetails;

  \$R call({${model.attributes.map((attr) => "${attr.type}? ${attr.name}").join(', ')}});
  ${className}CopyWith<\$R2, \$In, \$Out2> \$chain<\$R2, \$Out2>(Then<\$Out2, \$R2> t);
}

/// Extension for $className copyWith
extension ${className}ValueCopy<\$R, \$Out> on ObjectCopyWith<\$R, $className, \$Out> {
  ${className}CopyWith<\$R, $className, \$Out> get \$as$className =>
      \$base.as((v, t, t2) => _${className}CopyWithImpl(v, t, t2));
}

/// CopyWith implementation for $className
class _${className}CopyWithImpl<\$R, \$Out>
    extends ClassCopyWithBase<\$R, $className, \$Out>
    implements ${className}CopyWith<\$R, $className, \$Out> {
  _${className}CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<$className> \$mapper = ${className}Mapper.ensureInitialized();

  @override
  ${model.name.pascalCase}AdditionalFieldsCopyWith<\$R, ${model.name.pascalCase}AdditionalFields,
          ${model.name.pascalCase}AdditionalFields>?
      get additionalFields => \$value.additionalFields?.copyWith
          .\$chain((v) => call(additionalFields: v));

  @override
  AuditDetailsCopyWith<\$R, AuditDetails, AuditDetails>? get auditDetails =>
      \$value.auditDetails?.copyWith.\$chain((v) => call(auditDetails: v));

  @override
  ClientAuditDetailsCopyWith<\$R, ClientAuditDetails, ClientAuditDetails>? get clientAuditDetails =>
      \$value.clientAuditDetails?.copyWith.\$chain((v) => call(clientAuditDetails: v));

  @override
  \$R call({Object? additionalFields = \$none, ${model.attributes.map((attr) => "Object? ${attr.name} = \$none").join(', ')}}) =>
      \$apply(FieldCopyWithData({
        if (additionalFields != \$none) #additionalFields: additionalFields,
        ${model.attributes.map((attr) => "if (${attr.name} != \$none) #${attr.name}: ${attr.name},").join('\n        ')}
      }));

  @override
  $className \$make(CopyWithData data) => $className(
      additionalFields: data.get(#additionalFields, or: \$value.additionalFields),
      ${model.attributes.map((attr) => "${attr.name}: data.get(#${attr.name}, or: \$value.${attr.name}),").join('\n      ')}
  );

  @override
  ${className}CopyWith<\$R2, $className, \$Out2> \$chain<\$R2, \$Out2>(Then<\$Out2, \$R2> t) =>
      _${className}CopyWithImpl(\$value, \$cast, t);
}
""");

    return buffer.toString();
  }

  String _generateAdditionalFieldsMapper(ConfigModel model) {
    final className = '${model.name.pascalCase}AdditionalFields';
    final buffer = StringBuffer();

    buffer.writeln("""
class ${className}Mapper extends SubClassMapperBase<$className> {
  ${className}Mapper._();

  static ${className}Mapper? _instance;
  static ${className}Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ${className}Mapper._());
    }
    return _instance!;
  }

  @override
  final String id = '$className';

  static $className fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<$className>(map);
  }

  static $className fromJson(String json) {
    return ensureInitialized().decodeJson<$className>(json);
  }
}

/// Mixin for $className
mixin ${className}Mappable {
  String toJson() => ${className}Mapper.ensureInitialized().encodeJson<$className>(this as $className);
  Map<String, dynamic> toMap() => ${className}Mapper.ensureInitialized().encodeMap<$className>(this as $className);

  \$classNameCopyWith<$className, $className, $className> get copyWith =>
      _${className}CopyWithImpl(this as $className, \$identity, \$identity);
}

/// Abstract CopyWith class
abstract class ${className}CopyWith<\$R, \$In extends $className, \$Out> {
  ListCopyWith<\$R, AdditionalField, AdditionalFieldCopyWith<\$R, AdditionalField, AdditionalField>>? get fields;
  \$R call({String? schema, int? version, List<AdditionalField>? fields});
  ${className}CopyWith<\$R2, \$In, \$Out2> \$chain<\$R2, \$Out2>(Then<\$Out2, \$R2> t);
}

/// Extension for $className copyWith
extension ${className}ValueCopy<\$R, \$Out> on ObjectCopyWith<\$R, $className, \$Out> {
  ${className}CopyWith<\$R, $className, \$Out> get \$as$className =>
      \$base.as((v, t, t2) => _${className}CopyWithImpl(v, t, t2));
}

/// CopyWith implementation for $className
class _${className}CopyWithImpl<\$R, \$Out>
    extends ClassCopyWithBase<\$R, $className, \$Out>
    implements ${className}CopyWith<\$R, $className, \$Out> {
  _${className}CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<$className> \$mapper = ${className}Mapper.ensureInitialized();

  @override
  ListCopyWith<\$R, AdditionalField, AdditionalFieldCopyWith<\$R, AdditionalField, AdditionalField>>?
      get fields => \$value.fields != null
          ? ListCopyWith(
              \$value.fields!,
              (v, t) => v.copyWith.\$chain(t),
              (v) => call(fields: v),
            )
          : null;

  @override
  \$R call({String? schema, int? version, List<AdditionalField>? fields}) =>
      \$apply(FieldCopyWithData({
        if (schema != null) #schema: schema,
        if (version != null) #version: version,
        if (fields != null) #fields: fields
      }));

  @override
  $className \$make(CopyWithData data) =>
      $className(
        schema: data.get(#schema, or: \$value.schema),
        version: data.get(#version, or: \$value.version),
        fields: data.get(#fields, or: \$value.fields),
      );

  @override
  ${className}CopyWith<\$R2, $className, \$Out2> \$chain<\$R2, \$Out2>(Then<\$Out2, \$R2> t) =>
      _${className}CopyWithImpl(\$value, \$cast, t);
}
""");

    return buffer.toString();
  }
}

String generateEnumMapper(String enumName, List<String> values) {
  StringBuffer classCode = StringBuffer();

  classCode.writeln("""
    // coverage:ignore-file
    // GENERATED CODE - DO NOT MODIFY BY HAND
    // ignore_for_file: type=lint
    // ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
    // ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

    part of '${enumName.snakeCase}.dart';

    class ${enumName.pascalCase}Mapper extends EnumMapper<${enumName.pascalCase}> {
      ${enumName.pascalCase}Mapper._();

      static ${enumName.pascalCase}Mapper? _instance;
      static ${enumName.pascalCase}Mapper ensureInitialized() {
        if (_instance == null) {
          MapperContainer.globals.use(_instance = ${enumName.pascalCase}Mapper._());
        }
        return _instance!;
      }

      static ${enumName.pascalCase} fromValue(dynamic value) {
        ensureInitialized();
        return MapperContainer.globals.fromValue(value);
      }

      @override
      ${enumName.pascalCase} decode(dynamic value) {
        switch (value) {
  """);

  for (var val in values) {
    classCode.writeln("""
          case "$val":
            return ${enumName.pascalCase}.${val.camelCase};""");
  }

  classCode.writeln("""
          default:
            throw MapperException.unknownEnumValue(value);
        }
      }

      @override
      dynamic encode(${enumName.pascalCase} self) {
        switch (self) {
  """);

  for (var val in values) {
    classCode.writeln("""
          case ${enumName.pascalCase}.${val.camelCase}:
            return "$val";""");
  }

  // Properly closing the switch and class
  classCode.writeln("""
          default:
            throw MapperException.unknownEnumValue(self);
        }
      }
    }

    extension ${enumName.pascalCase}MapperExtension on ${enumName.pascalCase} {
      dynamic toValue() {
        ${enumName.pascalCase}Mapper.ensureInitialized();
        return MapperContainer.globals.toValue<${enumName.pascalCase}>(this);
      }
    }
  """);

  return classCode.toString();
}
