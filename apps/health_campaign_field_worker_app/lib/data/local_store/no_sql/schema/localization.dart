import 'package:isar/isar.dart';

part 'localization.g.dart';

@Collection()
class Localization {
  Id id = Isar.autoIncrement;

  late String code;

  late String message;

  late String module;

  late String locale;
}
