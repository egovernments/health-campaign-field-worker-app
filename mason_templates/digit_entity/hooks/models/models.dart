import 'package:dart_mappable/dart_mappable.dart';

@MappableClass()
class ConfigModel {
  final String name;

  const ConfigModel({required this.name});
}

@MappableClass()
class AttributeModel {
  final String name;
  final String type;
  final bool nullable;

  const AttributeModel({
    required this.name,
    required this.type,
    required this.nullable
  });
}
