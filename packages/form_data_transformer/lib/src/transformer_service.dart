import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'model_factory_registory.dart';

class FormEntityMapper {
  final Map<String, dynamic> config;

  FormEntityMapper({required this.config});

  // Used to store generated values like UUIDs for cross-reference
  final Map<String, Map<String, dynamic>> generatedValues = {};

  // Method to return a list of models based on the form data and dynamic config
  List<EntityModel> mapFormToEntities({
    required Map<String, dynamic> formValues,
    required Map<String, dynamic> modelsConfig, // Pass models config dynamically
  }) {
    final List<EntityModel> entities = [];

    // Iterate through each model configuration in the dynamic modelsConfig
    modelsConfig.forEach((modelName, modelConfig) {
      try {
        final model = mapFormToEntity(
          modelName: modelName,
          formValues: formValues,
          modelConfig: modelConfig,
        );
        entities.add(model);
      } catch (e) {
        print('Error mapping model $modelName: $e');
      }
    });

    return entities;
  }

  // Method to map form data to a single entity model
  EntityModel mapFormToEntity({
    required String modelName,
    required Map<String, dynamic> formValues,
    required Map<String, dynamic> modelConfig, // Pass model config dynamically
  }) {
    if (modelConfig == null) {
      throw Exception("Model config not found for: $modelName");
    }

    final Map<String, dynamic> mapped = {};

    // Handle scalar mappings
    final mappings = modelConfig['mappings'] as Map<String, dynamic>? ?? {};
    for (final entry in mappings.entries) {
      final targetKey = entry.key;
      final sourcePath = entry.value;

      // Handle additionalFields
      if (targetKey == 'additionalFields' &&
          sourcePath is Map<String, dynamic>) {
        final List<Map<String, dynamic>> fieldsList = [];
        sourcePath.forEach((customKey, path) {
          final value = getValueFromMapping(path, formValues, path);
          if (value != null) {
            fieldsList.add({'key': customKey, 'value': value});
          }
        });
        if (fieldsList.isNotEmpty) {
          mapped['additionalFields'] = {
            'schema': modelName.replaceAll('Model', ''),
            'version': 1,
            'fields': fieldsList,
          };
        }
        continue;
      }

      // Handle list:ModelType
      if (sourcePath is String && sourcePath.startsWith('list:')) {
        final listModelName = sourcePath.split(':').last;
        final listConfig = modelConfig['listMappings']?[listModelName];

        if (listConfig != null) {
          final mappings = listConfig['mappings'] as Map<String, dynamic>;

          // Initialize an empty list to hold the mapped objects
          final List<Map<String, dynamic>> mappedList = [];

          // Iterate through each of the mappings for this list (like 'id', 'identifierType', etc.)
          final Map<String, dynamic> newItem = {};

          mappings.forEach((targetKey, path) {
            final value = _getValueFromPath(formValues, path);

            // If the value is not null, add it as a key-value pair in the new item
            if (value != null) {
              newItem[targetKey] = value;
            }
          });

          // If we have any values in newItem, add it to the mappedList
          if (newItem.isNotEmpty) {
            mappedList.add(newItem);
          }

          // Assign the list to the target key in the final mapped object
          mapped[targetKey] = mappedList.isNotEmpty ? mappedList : null;
        }

        continue;
      }

      // Scalar & DateTime handling
      final value = getValueFromMapping(sourcePath, formValues, modelName);
      if (value is DateTime) {
        mapped[targetKey] = value.millisecondsSinceEpoch;
      } else {
        mapped[targetKey] = value;
      }
    }
    // Model factory
    final modelFactory = modelFactoryRegistry[modelName];
    if (modelFactory == null) {
      throw Exception("No model factory found for $modelName");
    }

    return modelFactory(mapped);
  }

  dynamic getValueFromMapping(String instruction, Map<String, dynamic> data, String currentModel) {

    if (instruction == '__generate:uuid') {
      final newUuid = IdGen.i.identifier;
      generatedValues.putIfAbsent(currentModel, () => {})['clientReferenceId'] = newUuid;
      return newUuid;
    }

    if (instruction.startsWith('__ref:')) {
      final parts = instruction.replaceFirst('__ref:', '').split('.');
      final modelName = parts[0];
      final field = parts[1];
      return generatedValues[modelName]?[field];
    }

    // Regular JSON path like 'members.householdClientRefId'
    List<String> keys = instruction.split('.');
    dynamic value = data;
    for (final key in keys) {
      value = value?[key];
    }
    return value;
  }

  dynamic _getValueFromPath(Map<String, dynamic> data, String path) {
    List<String> keys = path.split('.');
    dynamic value = data;
    for (final key in keys) {
      value = value?[key];
    }
    return value;
  }
}
