import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';


abstract class FacilityLocalBaseRepository
    extends LocalRepository<FacilityModel, FacilitySearchModel> {
  const FacilityLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.facility;

  TableInfo get table => sql.facility;
}