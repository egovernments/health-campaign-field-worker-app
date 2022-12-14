import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'tables/address.dart';
import 'tables/boundary.dart';
import 'tables/document.dart';
import 'tables/facility.dart';
import 'tables/household.dart';
import 'tables/household_member.dart';
import 'tables/identifier.dart';
import 'tables/individual.dart';
import 'tables/name.dart';
import 'tables/product.dart';
import 'tables/product_variant.dart';
import 'tables/project.dart';
import 'tables/project_beneficiary.dart';
import 'tables/project_facility.dart';
import 'tables/project_product_variant.dart';
import 'tables/project_resource.dart';
import 'tables/project_staff.dart';
import 'tables/project_type.dart';
import 'tables/target.dart';
import 'tables/task.dart';
import 'tables/task_resource.dart';

part 'sql_store.g.dart';

@DriftDatabase(tables: [
  AddressTable,
  NameTable,
  BoundaryTable,
  DocumentTable,
  FacilityTable,
  HouseholdTable,
  HouseholdMemberTable,
  IdentifierTable,
  IndividualTable,
  ProductTable,
  ProductVariantTable,
  ProjectTable,
  ProjectBeneficiaryTable,
  ProjectFacilityTable,
  ProjectProductVariantTable,
  ProjectResourceTable,
  ProjectStaffTable,
  ProjectTypeTable,
  TargetTable,
  TaskTable,
  TaskResourceTable,
])
class LocalSqlDataStore extends _$LocalSqlDataStore {
  LocalSqlDataStore() : super(_openConnection());

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
