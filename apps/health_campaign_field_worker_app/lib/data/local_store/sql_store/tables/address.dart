import 'package:drift/drift.dart';

import '../../../../models/address_type.dart';
import 'boundary.dart';

class AddressTable extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get doorNo => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  RealColumn get locationAccuracy => real()();
  TextColumn get addressLine1 => text()();
  TextColumn get addressLine2 => text()();
  TextColumn get landmark => text().nullable()();
  TextColumn get city => text()();
  TextColumn get pincode => text()();
  TextColumn get buildingName => text().nullable()();
  TextColumn get street => text().nullable()();
  TextColumn get clientReferenceId => text()();
  IntColumn get type => intEnum<AddressType>()();
  
  TextColumn get locality => text().references(BoundaryTable, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}