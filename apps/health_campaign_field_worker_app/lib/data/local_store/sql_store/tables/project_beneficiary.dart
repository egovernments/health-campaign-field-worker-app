// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ProjectBeneficiary extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get beneficiaryId => text().nullable()();
  TextColumn get beneficiaryClientReferenceId => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  IntColumn get rowVersion => integer()();
  DateTimeColumn get dateOfRegistration => dateTime().nullable()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}