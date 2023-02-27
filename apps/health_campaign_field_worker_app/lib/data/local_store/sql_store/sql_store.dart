import 'dart:io';

import 'tables/stock.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import '../../../models/address_type.dart';
import '../../../models/gender.dart';
import '../../../models/blood_group.dart';
import 'tables/address.dart';
import 'tables/boundary.dart';
import 'tables/document.dart';
import 'tables/facility.dart';
import 'tables/household.dart';
import 'tables/household_address.dart';
import 'tables/household_member.dart';
import 'tables/identifier.dart';
import 'tables/individual.dart';
import 'tables/individual_address.dart';
import 'tables/individual_identifier.dart';
import 'tables/individual_name.dart';
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
  Address,
  Name,
  Boundary,
  Document,
  Facility,
  Household,
  HouseholdAddress,
  HouseholdMember,
  Identifier,
  Individual,
  IndividualAddress,
  IndividualIdentifier,
  IndividualName,
  Product,
  ProductVariant,
  Project,
  ProjectBeneficiary,
  ProjectFacility,
  ProjectProductVariant,
  ProjectResource,
  ProjectStaff,
  ProjectType,
  Stock,
  Target,
  Task,
  TaskResource,
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
