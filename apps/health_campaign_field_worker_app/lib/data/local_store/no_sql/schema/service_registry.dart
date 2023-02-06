import 'package:isar/isar.dart';

part 'service_registry.g.dart';

@Collection()
class ServiceRegistry {
  Id id = Isar.autoIncrement;

  late String service;
  late List<Actions> actions;
}

@embedded
class Actions {
  late String path;
  late String entityName;
  late String action;
}
