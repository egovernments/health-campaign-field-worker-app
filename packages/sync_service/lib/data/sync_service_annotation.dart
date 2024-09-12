import 'package:recase/recase.dart';
import 'package:super_annotations/super_annotations.dart';

/// This class uses the [SyncServiceAnnotation] to define entities that require synchronization.
///
/// The `SyncServiceAnnotation` is applied with a list of entity types that define which
/// entities should be synchronized down from a remote repository.
///
/// ### Example Usage
///
/// To add a new entity type to the synchronization list, modify the annotation as shown below:
///
/// ```dart
/// @SyncServiceAnnotation([
///   'newEntityType',  // Add your entity type here
///   'individual.address_.identifier_s',
///   'household.address',
///   'projectBeneficiary',
///   // Other existing types...
/// ])
/// class SyncModule {
///   // Your sync module implementation
/// }
/// ```
///
/// Additionally, ensure that the entity type follows the expected naming conventions:
///
/// - Entity types can include nested entities separated by dots (`.`).
/// - If the entity type ends with a pluralized suffix (`_s` or `_`), the synchronization logic will treat it accordingly.
///
/// For further details, see the [SyncServiceAnnotation] class and its documentation.
/// [@SyncServiceAnnotation([
///  'individual.address_.identifier_s',
///  'household.address',
///  'task.resource_s',
/// ])]
/// class Example {
      // Class implementation
/// }

class SyncServiceAnnotation extends ClassAnnotation {
  final List<String> types;

  const SyncServiceAnnotation(this.types);

  @override
  void apply(Class target, LibraryBuilder output) {
    final StringBuffer methodBuffer = StringBuffer()
      ..writeln('class SyncDownEntity {')
      ..writeln('syncEntities(')
      ..writeln(
          '  MapEntry<DataModelType, List<OpLogEntry<EntityModel>>> typeGroupedEntity,')
      ..writeln(
          '  MapEntry<DataOperation, List<OpLogEntry<EntityModel>>> operationGroupedEntity,')
      ..writeln('  List<EntityModel> entities,')
      ..writeln('  List<EntityModel> responseEntities,')
      ..writeln('  RemoteRepository<EntityModel, EntitySearchModel> remote,')
      ..writeln(
          '  LocalRepository<EntityModel, EntitySearchModel> local) async {')
      ..writeln('  switch (typeGroupedEntity.key.name) {');

    for (var entity in types) {
      final entityPascalCase = entity.contains('.')
          ? entity.split('.')[0].pascalCase
          : entity.pascalCase;

      methodBuffer
        ..writeln(
            '    case "${entity.contains('.') ? entity.split('.')[0] : entity}":')
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
        ..writeln('        final rowVersion = responseEntity?.rowVersion;');

      methodBuffer
        ..writeln('        if (serverGeneratedId != null) {')
        ..writeln('          final additionalIds = <AdditionalId>[];');

      // Check each part after the first dot
      if (entity.contains('.')) {
        final parts = entity.split('.');
        parts.removeAt(0); // Remove the first part
        for (var part in parts) {
          if (isPlural(part)) {
            methodBuffer
              ..writeln(
                  '          final ${removePluralSuffix(part)}AdditionalIds = responseEntity?.${removePluralSuffix(part)}?.map((e) {')
              ..writeln('            final id = e.id;')
              ..writeln('            if (id == null) return null;')
              ..writeln('            return AdditionalId(')
              ..writeln(
                  '              idType: "${entity.contains('.') ? entity.split('.')[0] : entity}${isPlural(part.pascalCase) ? removePluralSuffix(part) : part.pascalCase}Id",')
              ..writeln('              id: id,')
              ..writeln('            );')
              ..writeln('          }).whereNotNull().toList();')
              ..writeln(
                  '          additionalIds.addAll(${removePluralSuffix(part)}AdditionalIds ?? []);');
          } else {
            methodBuffer
              ..writeln(
                  '          final ${part}AdditionalIds = responseEntity?.${part} != null')
              ..writeln('            ? null')
              ..writeln('            : AdditionalId(')
              ..writeln(
                  '              idType: "${entity.contains('.') ? entity.split('.')[0] : entity}${part.pascalCase}Id",')
              ..writeln('              id: responseEntity!.${part}!.id!,')
              ..writeln('            );')
              ..writeln(
                  '          additionalIds.addAll([${part}AdditionalIds!] ?? []);');
          }
        }
      }

      methodBuffer
        ..writeln(
            '          await local.opLogManager.updateServerGeneratedIds(')
        ..writeln('            model: UpdateServerGeneratedIdModel(')
        ..writeln('              clientReferenceId: entity.clientReferenceId,')
        ..writeln('              serverGeneratedId: serverGeneratedId,')
        ..writeln(
            '              nonRecoverableError: entity.nonRecoverableError,')
        ..writeln('              additionalIds: additionalIds,')
        ..writeln('              dataOperation: element.operation,')
        ..writeln('              rowVersion: rowVersion,')
        ..writeln('            ),')
        ..writeln('          );')
        ..writeln('        } else {');

      methodBuffer
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

    methodBuffer
      ..writeln('  }')
      ..writeln('  return responseEntities;}')
      ..writeln('}');

    output.body.add(Code(methodBuffer.toString()));
  }

  bool isPlural(String word) {
    var result = word.contains('_') ? true : false;
    return result;
  }

  String removePluralSuffix(String word) {
    const pluralSuffixes = ['_'];

    for (var suffix in pluralSuffixes) {
      if (word.contains(suffix)) {
        return word.replaceAll('_', '');
      }
    }
    return word;
  }
}
