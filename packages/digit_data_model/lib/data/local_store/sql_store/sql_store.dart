// Importing necessary packages and files.
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../models/entities/beneficiary_type.dart';
import '../../../models/entities/address_type.dart';
import '../../../models/entities/blood_group.dart';
import '../../../models/entities/gender.dart';
import '../../../models/pgr_complaints/pgr_complaints.dart';
import 'tables/address.dart';
import 'tables/boundary.dart';
import 'tables/locality.dart';
import 'tables/attributes.dart';
import 'tables/document.dart';
import 'tables/downsync.dart';
import 'tables/downsync_criteria.dart';
import 'tables/facility.dart';
import 'tables/package_tables.dart';
import 'tables/pgr_service.dart';
import 'tables/product.dart';
import 'tables/product_variant.dart';
import 'tables/project.dart';
import 'tables/project_beneficiary.dart';
import 'tables/project_facility.dart';
import 'tables/project_product_variant.dart';
import 'tables/project_resource.dart';
import 'tables/project_staff.dart';
import 'tables/project_type.dart';
import 'tables/service.dart';
import 'tables/service_attributes.dart';
import 'tables/service_definition.dart';
import 'tables/user.dart';
import 'tables/individual.dart';
import 'tables/identifier.dart';
import 'tables/name.dart';
import 'tables/target.dart';

// Part directive for the generated code.
part 'sql_store.g.dart';

/// The `LocalSqlDataStore` class represents the local SQL data store.
/// It is annotated with `@DriftDatabase` to indicate that it is a Drift database.
/// The `tables` parameter of the `@DriftDatabase` annotation lists all the tables in the database.
@DriftDatabase(tables: [
  AttendanceRegister,
  Attendance,
  Attendee,
  Address,
  Name,
  Boundary,
  Document,
  Facility,
  Product,
  ProductVariant,
  Project,
  ProjectBeneficiary,
  ProjectFacility,
  ProjectProductVariant,
  ProjectResource,
  ProjectStaff,
  ProjectType,
  Individual,
  Identifier,
  Stock,
  StockReconciliation,
  Target,
  Service,
  ServiceAttributes,
  ServiceDefinition,
  Locality,
  Staff,
  Attributes,
  PgrService,
  PgrComplainant,
  User,
  Downsync,
  DownsyncCriteria,
  HFReferral,
  Household,
  HouseholdMember,
  Task,
  TaskResource,
  SideEffect,
  Referral,
])
class LocalSqlDataStore extends _$LocalSqlDataStore {
  /// The constructor for `LocalSqlDataStore`.
  /// It calls the superclass constructor with `_openConnection()` as the argument.
  LocalSqlDataStore() : super(_openConnection());

  /// The `schemaVersion` getter returns the schema version of the database.
  @override
  int get schemaVersion => 4;

  /// The `_openConnection` method opens a connection to the database.
  /// It returns a `LazyDatabase` that opens the database when it is first accessed.
  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      // Get the application documents directory.
      final dbFolder = await getApplicationDocumentsDirectory();
      // Create a file in the documents directory for the database.
      final file = File(p.join(dbFolder.path, 'db.sqlite'));

      // Return a `NativeDatabase` that uses the file for storage.
      return NativeDatabase(file, logStatements: true, setup: (data) {});
    });
  }
}