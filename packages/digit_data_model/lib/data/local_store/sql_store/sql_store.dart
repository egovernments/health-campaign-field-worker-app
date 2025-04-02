// Importing necessary packages and files.
import 'dart:io';

import 'package:digit_data_model/data/local_store/sql_store/tables/localization.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../models/entities/address_type.dart';
import '../../../models/entities/beneficiary_type.dart';
import '../../../models/entities/blood_group.dart';
import '../../../models/entities/gender.dart';
import '../../../models/entities/pgr_application_status.dart';
import '../../../models/entities/household_type.dart';
import 'tables/address.dart';
import 'tables/attributes.dart';
import 'tables/boundary.dart';
import 'tables/document.dart';
import 'tables/downsync.dart';
import 'tables/downsync_criteria.dart';
import 'tables/facility.dart';
import 'tables/identifier.dart';
import 'tables/individual.dart';
import 'tables/locality.dart';
import 'tables/name.dart';
import 'tables/package_tables/attendance.dart';
import 'tables/package_tables/attendance_register.dart';
import 'tables/package_tables/attendee.dart';
import 'tables/package_tables/hf_referral.dart';
import 'tables/package_tables/household.dart';
import 'tables/package_tables/household_member.dart';
import 'tables/package_tables/referral.dart';
import 'tables/package_tables/side_effect.dart';
import 'tables/package_tables/staff.dart';
import 'tables/package_tables/stock.dart';
import 'tables/package_tables/stock_reconciliation.dart';
import 'tables/package_tables/task.dart';
import 'tables/package_tables/task_resource.dart';
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
import 'tables/target.dart';
import 'tables/user.dart';
import 'tables/unique_id_pool.dart';

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
  Localization,
  UniqueIdPool
])
class LocalSqlDataStore extends _$LocalSqlDataStore {
  /// The constructor for `LocalSqlDataStore`.
  /// It calls the superclass constructor with `_openConnection()` as the argument.
  LocalSqlDataStore() : super(_openConnection());

  /// The `schemaVersion` getter returns the schema version of the database.
  @override
  int get schemaVersion => 6; // Increment schema version

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from < 5) {
            //Add column for projectType in Project Table
            try {
              await migrator.addColumn(project, project.projectType);
            } catch (e) {
              if (kDebugMode) {
                print("Failed to add column for projectType");
              }
            }
          }
          if (from < 5) {
            await customStatement('''
        CREATE TABLE attributes_temp (
          id TEXT,
          dataType TEXT,
          referenceId TEXT,
          tenantId TEXT,
          code TEXT,
          values TEXT,
          isActive BOOLEAN,
          required BOOLEAN,
          regex TEXT,
          "order" INTEGER,
          auditCreatedBy TEXT,
          nonRecoverableError BOOLEAN DEFAULT 0,
          auditCreatedTime INTEGER,
          clientCreatedTime INTEGER,
          clientModifiedBy TEXT,
          clientCreatedBy TEXT,
          clientModifiedTime INTEGER,
          auditModifiedBy TEXT,
          auditModifiedTime INTEGER,
          isDeleted BOOLEAN DEFAULT 0,
          rowVersion INTEGER,
          additionalFields TEXT,
          additionalDetails TEXT
        );
      ''');

            // Step 2: Copy data from the old table to the new table
            await customStatement('''
        INSERT INTO attributes_temp (
          id, dataType, referenceId, tenantId, code, values, isActive, required, regex, "order",
          auditCreatedBy, nonRecoverableError, auditCreatedTime, clientCreatedTime,
          clientModifiedBy, clientCreatedBy, clientModifiedTime, auditModifiedBy,
          auditModifiedTime, isDeleted, rowVersion, additionalFields, additionalDetails
        )
        SELECT 
          id, dataType, referenceId, tenantId, code, values,
          CASE isActive WHEN 'true' THEN 1 WHEN 'false' THEN 0 ELSE NULL END,
          required, regex, "order",
          auditCreatedBy, nonRecoverableError, auditCreatedTime, clientCreatedTime,
          clientModifiedBy, clientCreatedBy, clientModifiedTime, auditModifiedBy,
          auditModifiedTime, isDeleted, rowVersion, additionalFields, additionalDetails
        FROM attributes;
      ''');

            // Step 3: Drop the old table
            await migrator.deleteTable('attributes');

            // Step 4: Rename the new table to the old table's name
            await customStatement(
                'ALTER TABLE attributes_temp RENAME TO attributes;');
          }

          if (from < 6) {
            try {
              await migrator.addColumn(household, household.householdType);
              await migrator.addColumn(
                  attendanceRegister, attendanceRegister.localityCode);
              await migrator.addColumn(
                  service, service.relatedClientReferenceId);
            } catch (e) {
              if (kDebugMode) {
                print(
                    "Failed to add columns for householdType, attendance - localityCode, and service - relatedClientReferenceId");
              }
            }
          }
        },
      );

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
