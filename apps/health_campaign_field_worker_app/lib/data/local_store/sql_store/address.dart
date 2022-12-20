import 'package:drift/drift.dart';

class AddressTable extends Table {
  TextColumn get id => text()();
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
  

  @override
  Set<Column>? get primaryKey => {  };
}