import 'package:isar/isar.dart';

part 'row_versions.g.dart';

@Collection()
class RowVersionList {
  Id id = Isar.autoIncrement;

  late String module;

  late String version;
}
