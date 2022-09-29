import 'dart:io';

import 'package:health_campaigns_flutter/data/local_store/tables/household_registration_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part 'sql_store.g.dart';

@DriftDatabase(tables: [HouseholdRegistrationTable])
class LocalSqlDataStore extends _$LocalSqlDataStore {
  LocalSqlDataStore(): super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));

      return NativeDatabase(file);
    });
  }
}