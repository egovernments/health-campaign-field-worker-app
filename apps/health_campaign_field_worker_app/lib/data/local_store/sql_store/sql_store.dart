import 'tables/address.dart';
import 'dart:io';

import 'package:digit_components/digit_components.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../models/entities/address_type.dart';
import '../../../models/entities/beneficiary_type.dart';
import '../../../models/entities/blood_group.dart';
import '../../../models/entities/gender.dart';
import '../../../models/pgr_complaints/pgr_complaints.dart';
import 'tables/address.dart' as at;
import 'tables/attributes.dart';
import 'tables/boundary.dart';
import 'tables/document.dart';
import 'tables/downsync.dart';
import 'tables/downsync_criteria.dart';
import 'tables/household.dart';
import 'tables/household_member.dart';
import 'tables/identifier.dart';
import 'tables/individual.dart';
import 'tables/locality.dart';
import 'tables/name.dart';
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
import 'tables/referral.dart';
import 'tables/service.dart';
import 'tables/service_attributes.dart';
import 'tables/service_definition.dart';
import 'tables/side_effect.dart';
import 'tables/package_tables.dart';
import 'tables/target.dart';
import 'tables/task.dart';
import 'tables/task_resource.dart';
import 'tables/user.dart';

part 'sql_store.g.dart';

@DriftDatabase(tables: [
  AttendanceRegister,
  Attendance,
  Attendee,
  at.Address, // TODO: address same in sql_store.g.dart and rename the address class created in the same file to avoid conflict
  Name,
  Boundary,
  Document,
  Facility,
  Household,
  HouseholdMember,
  Identifier,
  Individual,
  Product,
  ProductVariant,
  Project,
  ProjectBeneficiary,
  ProjectFacility,
  ProjectProductVariant,
  ProjectResource,
  ProjectStaff,
  ProjectType,
  Referral,
  Stock,
  StockReconciliation,
  Target,
  Task,
  TaskResource,
  SideEffect,
  Service,
  ServiceAttributes,
  ServiceDefinition,
  Staff,
  Attributes,
  Locality,
  PgrService,
  PgrComplainant,
  User,
  Downsync,
  DownsyncCriteria,
  HFReferral,
])
class LocalSqlDataStore extends _$LocalSqlDataStore {
  LocalSqlDataStore() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));

      return NativeDatabase(file, logStatements: true, setup: (data) {});
    });
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Create table for PgrService
          try {
            AppLogger.instance.info('Applying migration $from to $to');
            await m.createTable($PgrServiceTable(attachedDatabase));
          } catch (e) {
            AppLogger.instance.error(
              title: 'migration',
              message: e.toString(),
            );
          }
        }

        if (from < 3) {
          // Create table for PgrService
          try {
            AppLogger.instance.info('Applying migration $from to $to');
            await m.addColumn(address, address.localityBoundaryName);
            await m.addColumn(address, address.localityBoundaryCode);
          } catch (e) {
            AppLogger.instance.error(
              title: 'migration',
              message: e.toString(),
            );
          }
        }
        if (from < 4) {
          // Create table for PgrService
          try {
            allTables.forEach((e) async {
              late final GeneratedColumn<int> clientModifiedTime =
                  GeneratedColumn<int>(
                'client_modified_time',
                e.aliasedName,
                true,
                type: DriftSqlType.int,
                requiredDuringInsert: false,
              );

              late final GeneratedColumn<int> clientCreatedTime =
                  GeneratedColumn<int>(
                'client_created_time',
                e.aliasedName,
                true,
                type: DriftSqlType.int,
                requiredDuringInsert: false,
              );
              AppLogger.instance.info('Applying migration $from to $to');
              await m.addColumn(e, clientCreatedTime);
              await m.addColumn(e, clientModifiedTime);
            });
          } catch (e) {
            AppLogger.instance.error(
              title: 'migration',
              message: e.toString(),
            );
          }
        }
      },
    );
  }
}
