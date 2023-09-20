import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class FacilityLocalBaseRepository
    extends LocalRepository<FacilityModel, FacilitySearchModel> {
  const FacilityLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.facility;

  @override
  TableInfo get table => sql.facility;
}