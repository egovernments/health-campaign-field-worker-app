import 'package:recase/recase.dart';
import 'package:super_annotations/super_annotations.dart';

class SyncServiceAnnotation extends ClassAnnotation {
  const SyncServiceAnnotation();

  @override
  void apply(Class element, LibraryBuilder output) {
    output.body.add(Code(
        '//case DataModelType.${element.fields.map((f) => f.type!.symbol)}: \n var responseEntities = await remote.search(${element.name}(clientReferenceId:entities.whereType<${element.name}>().map((e)=>e.clientReferenceId).whereNotNull().toList(),),);'));
  }
}

class SyncEnumAnnotation extends EnumAnnotation {
  const SyncEnumAnnotation();

  @override
  void apply(Enum target, LibraryBuilder output) {
    // Define the method that will contain the generated cases
    final StringBuffer methodBuffer = StringBuffer()
      ..writeln('class syncDownEntity {')
      ..writeln('void syncEntities(')
      ..writeln(
          '  MapEntry<DataModelType, List<OpLogEntry<EntityModel>>> typeGroupedEntity,')
      ..writeln(
          '  MapEntry<DataOperation, List<OpLogEntry<EntityModel>>> operationGroupedEntity,')
      ..writeln('  List<EntityModel> entities,')
      ..writeln('  List<EntityModel> responseEntities,')
      ..writeln('  RemoteRepository<EntityModel, EntitySearchModel> remote,')
      ..writeln(
          '  LocalRepository<EntityModel, EntitySearchModel> local) async {')
      ..writeln('  const taskResourceIdKey = "taskResourceId";')
      ..writeln('  const individualIdentifierIdKey = "individualIdentifierId";')
      ..writeln('  const householdAddressIdKey = "householdAddressId";')
      ..writeln('  const individualAddressIdKey = "individualAddressId";')
      ..writeln('  switch (typeGroupedEntity.key) {');

    // Generate case statements for each enum value
    for (var entity in target.values.map((v) => v.name)) {
      final entityPascalCase = entity.pascalCase; // Convert to PascalCase
      final entityCamelCase = entity.camelCase; // Convert to camelCase

      methodBuffer
        ..writeln('    case DataModelType.${entity}:')
        ..writeln(
            '      responseEntities = await remote.search(${entityPascalCase}SearchModel(')
        ..writeln(
            '        clientReferenceId: entities.whereType<${entityPascalCase}Model>()')
        ..writeln('            .map((e) => e.clientReferenceId)')
        ..writeln('            .whereNotNull()')
        ..writeln('            .toList(),')
        ..writeln('        isDeleted: true,')
        ..writeln('      ));')
        ..writeln('      for (var element in operationGroupedEntity.value) {')
        ..writeln('        if (element.id == null) continue;')
        ..writeln(
            '        final entity = element.entity as ${entityPascalCase}Model;')
        ..writeln(
            '        final responseEntity = responseEntities.whereType<${entityPascalCase}Model>()')
        ..writeln(
            '            .firstWhereOrNull((e) => e.clientReferenceId == entity.clientReferenceId);')
        ..writeln('        final serverGeneratedId = responseEntity?.id;')
        ..writeln('        final rowVersion = responseEntity?.rowVersion;')
        ..writeln('        if (serverGeneratedId != null) {')
        ..writeln(
            '          await local.opLogManager.updateServerGeneratedIds(')
        ..writeln('            model: UpdateServerGeneratedIdModel(')
        ..writeln('              clientReferenceId: entity.clientReferenceId,')
        ..writeln('              serverGeneratedId: serverGeneratedId,')
        ..writeln('              dataOperation: element.operation,')
        ..writeln('              rowVersion: rowVersion,')
        ..writeln('            ),')
        ..writeln('          );')
        ..writeln('        } else {')
        ..writeln(
            '          final bool markAsNonRecoverable = await local.opLogManager.updateSyncDownRetry(entity.clientReferenceId);')
        ..writeln('          if (markAsNonRecoverable) {')
        ..writeln(
            '            await local.update(entity.copyWith(nonRecoverableError: true), createOpLog: false);')
        ..writeln('          }')
        ..writeln('        }')
        ..writeln('      }')
        ..writeln('      break;');
    }

    // Close the switch and method
    methodBuffer
      ..writeln('  }')
      ..writeln('  }')
      ..writeln('}');

    // Add the generated method to the output
    output.body.add(Code(methodBuffer.toString()));
  }
}

//  case DataModelType.stock:
//           responseEntities = await remote.search(
//             StockSearchModel(
//               clientReferenceId: entities
//                   .whereType<StockModel>()
//                   .map((e) => e.clientReferenceId)
//                   .whereNotNull()
//                   .toList(),
//             ),
//           );

//           for (var element in operationGroupedEntity.value) {
//             if (element.id == null) return;
//             final entity = element.entity as StockModel;
//             final responseEntity =
//                 responseEntities.whereType<StockModel>().firstWhereOrNull(
//                       (e) => e.clientReferenceId == entity.clientReferenceId,
//                     );

//             final serverGeneratedId = responseEntity?.id;
//             final rowVersion = responseEntity?.rowVersion;

//             if (serverGeneratedId != null) {
//               await local.opLogManager.updateServerGeneratedIds(
//                 model: UpdateServerGeneratedIdModel(
//                   clientReferenceId: entity.clientReferenceId!,
//                   serverGeneratedId: serverGeneratedId,
//                   dataOperation: element.operation,
//                   rowVersion: rowVersion,
//                 ),
//               );
//             } else {
//               final bool markAsNonRecoverable = await local.opLogManager
//                   .updateSyncDownRetry(entity.clientReferenceId);

//               if (markAsNonRecoverable) {
//                 await local.update(
//                   entity.copyWith(
//                     nonRecoverableError: true,
//                   ),
//                   createOpLog: false,
//                 );
//               }
//             }
//           }

// break;
