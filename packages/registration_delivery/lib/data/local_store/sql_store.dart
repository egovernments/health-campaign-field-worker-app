import 'dart:io';

import 'package:digit_components/digit_components.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:registration_delivery/data/local_store/tables/household.dart';
import 'package:registration_delivery/data/local_store/tables/household_member.dart';
import 'package:registration_delivery/data/local_store/tables/identifier.dart';
import 'package:registration_delivery/data/local_store/tables/individual.dart';
import 'package:registration_delivery/data/local_store/tables/name.dart';
import 'package:registration_delivery/data/local_store/tables/product_variant.dart';
import 'package:registration_delivery/data/local_store/tables/project_beneficiary.dart';
import 'package:registration_delivery/data/local_store/tables/project_product_variant.dart';
import 'package:registration_delivery/data/local_store/tables/project_resource.dart';
import 'package:registration_delivery/data/local_store/tables/referral.dart';
import 'package:registration_delivery/data/local_store/tables/side_effect.dart';
import 'package:registration_delivery/data/local_store/tables/task.dart';
import 'package:registration_delivery/data/local_store/tables/task_resource.dart';
import 'package:registration_delivery/data/local_store/tables/project_type.dart';

import '../../models/entities/blood_group.dart';
import '../../models/entities/gender.dart';


part 'sql_store.g.dart';

@DriftDatabase(tables: [
  Household,
  HouseholdMember,
  Identifier,
  Name,
  Task,
  TaskResource,
  SideEffect,
  ProductVariant,
  ProjectBeneficiary,
  ProjectProductVariant,
  ProjectResource,
  ProjectType,
  Referral
])
class RegistrationLocalSqlDataStore extends _$RegistrationLocalSqlDataStore {
  RegistrationLocalSqlDataStore() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));

      return NativeDatabase(file, logStatements: true, setup: (data) {});
    });
  }
}
