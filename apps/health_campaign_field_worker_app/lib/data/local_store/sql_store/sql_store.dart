import 'dart:isolate';

import 'package:drift/isolate.dart';

import 'tables/address.dart';
import 'dart:io';

import 'package:digit_components/digit_components.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../models/entities/address_type.dart';
import '../../../models/entities/beneficiary_type.dart';
import '../../../models/entities/blood_group.dart';
import '../../../models/entities/gender.dart';
import '../../../models/entities/transaction_reason.dart';
import '../../../models/entities/transaction_type.dart';
import '../../../models/pgr_complaints/pgr_complaints.dart';
import 'tables/address.dart' as at;
import 'tables/attendance_logs.dart';
import 'tables/attendance_register.dart';
import 'tables/attendee.dart';
import 'tables/attributes.dart';
import 'tables/boundary.dart';
import 'tables/document.dart';
import 'tables/downsync.dart';
import 'tables/downsync_criteria.dart';
import 'tables/facility.dart';
import 'tables/h_f_referral.dart';
import 'tables/household.dart';
import 'tables/household_member.dart';
import 'tables/identifier.dart';
import 'tables/individual.dart';
import 'tables/locality.dart';
import 'tables/name.dart';
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
import 'tables/staff.dart';
import 'tables/stock.dart';
import 'tables/stock_reconciliation.dart';
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
class _IsolateStartRequest {
  final SendPort sendDriftIsolate;
  final String targetPath;

  _IsolateStartRequest(this.sendDriftIsolate, this.targetPath);
}

/* Singleton class : 
Same instance be used by Background service and Main method */
class LocalSqlDataStore extends _$LocalSqlDataStore {
  static LocalSqlDataStore? _instance;

  // Private constructor
  LocalSqlDataStore._([
    QueryExecutor? executor,
  ]) : super(executor ?? _openConnection());

  // Factory constructor to return the singleton instance
  factory LocalSqlDataStore([
    QueryExecutor? executor,
  ]) {
    // Create a new instance only if it hasn't been created yet
    _instance ??= LocalSqlDataStore._(executor);

    return _instance!;
  }

  static LocalSqlDataStore get instance => _instance!;

  @override
  int get schemaVersion => 4;
  // Replace this method with your actual method to open the connection
  static DatabaseConnection _openConnection() {
    // Your logic to open the connection
    // For example:
    return DatabaseConnection.delayed(Future.sync(() async {
      final isolate = await _createDriftIsolate();

      return await isolate.connect(singleClientMode: true);
    }));
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

Future<DriftIsolate> _createDriftIsolate() async {
  // this method is called from the main isolate. Since we can't use
  // getApplicationDocumentsDirectory on a background isolate, we calculate
  // the database path in the foreground isolate and then inform the
  // background isolate about the path.
  final dir = await getApplicationDocumentsDirectory();
  final path = p.join(dir.path, 'db.sqlite');
  final receivePort = ReceivePort();

  await Isolate.spawn(
    _startBackground,
    _IsolateStartRequest(receivePort.sendPort, path),
  );

  // _startBackground will send the DriftIsolate to this ReceivePort
  return await receivePort.first as DriftIsolate;
}

void _startBackground(_IsolateStartRequest request) {
  // this is the entry point from the background isolate! Let's create
  // the database from the path we received
  final executor = NativeDatabase(File(request.targetPath));
  // we're using DriftIsolate.inCurrent here as this method already runs on a
  // background isolate. If we used DriftIsolate.spawn, a third isolate would be
  // started which is not what we want!
  final driftIsolate = DriftIsolate.inCurrent(
    () => DatabaseConnection(executor),
  );
  // inform the starting isolate about this, so that it can call .connect()
  request.sendDriftIsolate.send(driftIsolate);
}

// used to bundle the SendPort and the target path, since isolate entry point
// functions can only take one parameter.
