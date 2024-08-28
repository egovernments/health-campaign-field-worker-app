import 'package:drift/drift.dart';

@TableIndex(name: 'localization_module', columns: {
  #module,
})
class Localization extends Table {
  TextColumn get locale => text().withLength(min: 1, max: 255)();
  TextColumn get code => text().withLength(min: 1, max: 255)();
  TextColumn get message => text().withLength(min: 1, max: 500)();
  TextColumn get module => text().withLength(min: 1, max: 255)();
}