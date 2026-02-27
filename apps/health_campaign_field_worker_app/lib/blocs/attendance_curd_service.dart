import 'package:attendance_management/attendance_management.dart';
import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/utils/context_utility.dart';
import 'package:flutter/material.dart';

class AttendanceCurdService extends CrudService {
  final BuildContext context;

  AttendanceCurdService(
      {required super.relationshipMap,
      required super.nestedModelMappings,
      required super.searchEntityRepository,
      required this.context});

  @override
  DataRepository<EntityModel, EntitySearchModel> getRepositoryForEntity(
      EntityModel entity) {
    return context.repository<AttendanceRegisterModel,
        AttendanceRegisterSearchModel>(context);
  }
}

class AttendanceEntityModelMapMapper extends DynamicEntityModelListener {
  @override
  EntityModel? dynamicEntityModelFromMap(
      String modelName, Map<String, dynamic> map) {
    return AttendanceRegisterModelMapper.fromMap(map);
  }
}
