// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import '../../../models/entities/attributes.dart';
import '../../data_repository.dart';

class AttributesRemoteRepository extends RemoteRepository<AttributesModel, AttributesSearchModel> {
  AttributesRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Attributes',
  });

  @override
  DataModelType get type => DataModelType.attributes;
}
