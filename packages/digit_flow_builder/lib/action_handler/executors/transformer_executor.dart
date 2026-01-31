import 'package:digit_data_converter/src/transformer_service.dart';
import 'package:digit_data_converter/utils/utils.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:flutter/material.dart';

import '../../data/transformer_config.dart';
import '../../flow_builder.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import 'action_executor.dart';

class TransformerExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'FETCH_TRANSFORMER_CONFIG';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final configName = action.properties['configName'];
    final formDataConfig = action.properties['formDataConfig'];

    debugPrint('TRANSFORMER: Starting with configName=$configName');
    debugPrint('TRANSFORMER: contextData keys = ${contextData.keys.toList()}');
    debugPrint(
        'TRANSFORMER: contextData[formData] = ${contextData['formData']}');
    debugPrint(
        'TRANSFORMER: contextData[formData] keys = ${(contextData['formData'] as Map?)?.keys.toList()}');
    debugPrint(
        'TRANSFORMER: contextData[navigation] = ${contextData['navigation']}');

    final configData = jsonConfig[configName];
    if (configData == null) {
      debugPrint('TRANSFORMER: Config not found for $configName');
      return contextData;
    }

    final transformerConfig = configData['models'] as Map<String, dynamic>?;
    if (transformerConfig == null) {
      debugPrint('TRANSFORMER: Models config not found for $configName');
      return contextData;
    }

    final formEntityMapper = FormEntityMapper(config: jsonConfig);

    final fallBackModel = jsonConfig[configName]?['fallbackModel'] as String?;
    final multiEntityField =
        jsonConfig[configName]?['multiEntityField'] as String?;

    // Determine which form data to use
    Map<String, dynamic>? formValuesToUse = contextData['formData'];

    // 🔹 Collect extra key-values from action.properties['data']
    final Map<String, dynamic> extraContext = {};
    final List<dynamic>? extraData = action.properties['data'];
    if (extraData != null) {
      for (final entry in extraData) {
        final key = entry['key'] as String;
        final valuePath = entry['value'];
        if (valuePath != null) {
          // If valuePath is a string (template), resolve it; otherwise use directly
          dynamic resolvedValue;
          if (valuePath is String) {
            resolvedValue = resolveValue(valuePath, contextData);
          } else {
            // Direct value (list, map, etc.)
            resolvedValue = valuePath;
          }
          debugPrint(
              'TRANSFORMER: extraContext key=$key, valuePath=$valuePath, resolvedType=${resolvedValue?.runtimeType}, resolved=$resolvedValue');
          if (resolvedValue != null) {
            extraContext[key] = resolvedValue;
          }
        }
      }
    }
    debugPrint('TRANSFORMER: Final extraContext=$extraContext');

    if (formDataConfig != null) {
      final collectedFormData =
          FlowCrudStateRegistry().get(formDataConfig)?.formData;
      if (collectedFormData != null) {
        // Merge collected data with current form data
        formValuesToUse = {...collectedFormData, ...contextData['formData']};
      }
    }

    final flowState = const FlowCrudState().copyWith(formData: formValuesToUse);

    final config = FlowRegistry.getByName(getScreenKeyFromArgs(context) ?? '');

    FlowCrudStateRegistry().update(config?["name"], flowState);

    // Check if this is edit mode (supports both isEdit and isUpdate flags)
    final navigationParams = contextData['navigation'] is Map
        ? Map<String, dynamic>.from(contextData['navigation'] as Map)
        : null;
    final isEdit = navigationParams?['isEdit'] == true ||
        navigationParams?['isEdit'] == 'true' ||
        navigationParams?['isUpdate'] == true ||
        navigationParams?['isUpdate'] == 'true';

    // Add navigation params to formValuesToUse so that __switch:navigation.* directives can resolve
    if (navigationParams != null && navigationParams.isNotEmpty) {
      formValuesToUse = {
        ...formValuesToUse ?? {},
        'navigation': navigationParams,
      };
      debugPrint(
          'TRANSFORMER: Added navigation params to formValues: $navigationParams');
    }

    // Check if we should force create new entities even in edit mode
    // This is useful for inventory where edit prefills form but submits as new entities
    final forceCreate = action.properties['forceCreate'] == true ||
        navigationParams?['forceCreate'] == true ||
        navigationParams?['forceCreate'] == 'true';

    // Get existing models - try multiple sources:
    // 1. From contextData (passed through action chain from REVERSE_TRANSFORM)
    // 2. From navigation params in registry (stored by NAVIGATION executor)
    List<EntityModel>? existingModels;

    // First try contextData['existingModels'] (from REVERSE_TRANSFORM in same action chain)
    if (contextData['existingModels'] != null) {
      final contextModels = contextData['existingModels'];
      if (contextModels is List) {
        existingModels = contextModels.whereType<EntityModel>().toList();
        debugPrint(
            'TRANSFORMER: Found existingModels in contextData: ${existingModels.length}');
      }
    }

    // If no existingModels, try contextData['entities'] (from SEARCH_EVENT with awaitResults)
    // This is useful when a search is done before the transformer to fetch the entity for update
    if ((existingModels == null || existingModels.isEmpty) &&
        isEdit &&
        contextData['entities'] != null) {
      final searchedEntities = contextData['entities'];
      if (searchedEntities is List) {
        existingModels = searchedEntities.whereType<EntityModel>().toList();
        debugPrint(
            'TRANSFORMER: Found entities from SEARCH_EVENT for update: ${existingModels.length}');
      }
    }

    // If not in contextData, try registry navigation params
    if (existingModels == null || existingModels.isEmpty) {
      final screenKey = getScreenKeyFromArgs(context);
      debugPrint('TRANSFORMER: screenKey from args: $screenKey');

      // Try multiple key formats - the navigation executor stores with FORM:: prefix
      final keysToTry = <String?>[
        screenKey,
        if (screenKey != null) 'FORM::$screenKey',
        if (screenKey != null) 'TEMPLATE::$screenKey',
      ];

      for (final key in keysToTry) {
        if (key == null) continue;
        final storedNavParams =
            FlowCrudStateRegistry().getNavigationParams(key);
        debugPrint(
            'TRANSFORMER: trying key=$key, storedNavParams=$storedNavParams');
        if (storedNavParams != null &&
            storedNavParams['existingModels'] != null) {
          existingModels =
              storedNavParams['existingModels'] as List<EntityModel>?;
          if (existingModels != null && existingModels.isNotEmpty) {
            debugPrint(
                'TRANSFORMER: Found existingModels with key=$key: ${existingModels.length}');
            break;
          }
        }
      }
    }

    debugPrint(
        'TRANSFORMER: isEdit=$isEdit, forceCreate=$forceCreate, existingModels=${existingModels?.length ?? 0}');

    final contextMap = {
      "projectId": FlowBuilderSingleton().selectedProject?.id,
      "user": FlowBuilderSingleton().loggedInUser,
      "tenantId": FlowBuilderSingleton().selectedProject?.tenantId,
      "selectedBoundaryCode": FlowBuilderSingleton().boundary?.code,
      // converting in json format to match nested object value as passing model will cause issue
      'userUUID': FlowBuilderSingleton().loggedInUser?.uuid,
      'householdType': HouseholdType.family.toValue(),
      ...extraContext,
      "beneficiaryType": FlowBuilderSingleton().beneficiaryType?.toValue(),
    };

    // Auto-fetch individual data if selectedIndividualClientReferenceId is in navigation
    // This allows transformer config to use __context:selectedIndividualGender, etc.
    final selectedIndividualId =
        navigationParams?['selectedIndividualClientReferenceId'];
    if (selectedIndividualId != null) {
      // Add selectedIndividualClientReferenceId to context for use in mappings
      contextMap['selectedIndividualClientReferenceId'] = selectedIndividualId;

      final individualData =
          _fetchIndividualDataFromRegistry(selectedIndividualId);
      if (individualData != null) {
        contextMap['selectedIndividualName'] = individualData['name'];
        contextMap['selectedIndividualGender'] = individualData['gender'];
        contextMap['selectedIndividualAgeInMonths'] =
            individualData['ageInMonths'];
        contextMap['selectedIndividualDateOfBirth'] =
            individualData['dateOfBirth'];
        debugPrint(
            'TRANSFORMER: Added individual data to context - name=${individualData['name']}, gender=${individualData['gender']}, ageInMonths=${individualData['ageInMonths']}');
      }

      // Fetch ProjectBeneficiaryClientReferenceId from household state
      final projectBeneficiaryId =
          _fetchProjectBeneficiaryClientReferenceId(selectedIndividualId);
      if (projectBeneficiaryId != null) {
        contextMap['ProjectBeneficiaryClientReferenceId'] =
            projectBeneficiaryId;
        debugPrint(
            'TRANSFORMER: Added ProjectBeneficiaryClientReferenceId to context: $projectBeneficiaryId');
      }
    }

    // Auto-calculate current cycle index if not already in context
    // This allows transformer config to use __context:cycleIndex
    if (!contextMap.containsKey('cycleIndex') ||
        contextMap['cycleIndex'] == null) {
      final currentCycleIndex = _getCurrentCycleIndex();
      if (currentCycleIndex != null) {
        // Format as zero-padded string (e.g., 1 -> "01", 10 -> "10")
        final formattedCycleIndex =
            currentCycleIndex.toString().padLeft(2, '0');
        contextMap['cycleIndex'] = formattedCycleIndex;
        debugPrint(
            'TRANSFORMER: Added cycleIndex to context: $formattedCycleIndex');
      }
    }

    // Add transient form values to context
    // These are values stored by custom widgets that need to be accessible via __context:
    final transientValues = TransientFormValueRegistry().all;
    if (transientValues.isNotEmpty) {
      contextMap.addAll(transientValues);
      debugPrint(
          'TRANSFORMER: Added transient form values to context: ${transientValues.keys.toList()}');
    }

    List<EntityModel> entities = [];

    // Use updateEntitiesFromForm for edit mode with existing models
    // Skip if forceCreate is true (e.g., inventory flow where edit prefills but creates new)
    if (isEdit &&
        !forceCreate &&
        existingModels != null &&
        existingModels.isNotEmpty) {
      debugPrint('TRANSFORMER: Edit mode - using updateEntitiesFromForm');
      debugPrint(
          'TRANSFORMER: existingModels count before dedup: ${existingModels.length}');

      // Deduplicate existingModels by type first (keep first occurrence)
      final seenExistingTypes = <String>{};
      final dedupedExistingModels = existingModels.where((model) {
        final type = getEntityTypeName(model);
        if (seenExistingTypes.contains(type)) {
          debugPrint('TRANSFORMER: Removing duplicate existingModel $type');
          return false;
        }
        seenExistingTypes.add(type);
        return true;
      }).toList();
      debugPrint(
          'TRANSFORMER: existingModels count after dedup: ${dedupedExistingModels.length}');

      // Filter modelsConfig to only include models that exist in existingModels
      // This prevents trying to create missing models that reference non-existent entities
      final existingModelTypes =
          dedupedExistingModels.map((m) => getEntityTypeName(m)).toSet();
      debugPrint('TRANSFORMER: existingModelTypes=$existingModelTypes');

      final filteredConfig = Map<String, dynamic>.from(transformerConfig)
        ..removeWhere((key, value) => !existingModelTypes.contains(key));
      debugPrint('TRANSFORMER: filteredConfig keys=${filteredConfig.keys}');

      try {
        entities = formEntityMapper.updateEntitiesFromForm(
          existingModels: dedupedExistingModels,
          formValues: formValuesToUse ?? {},
          modelsConfig: filteredConfig,
          context: contextMap,
          fallbackFormDataString: fallBackModel,
        );
      } catch (e) {
        debugPrint(e.toString());
      }

      debugPrint(
          'TRANSFORMER: updateEntitiesFromForm returned ${entities.length} entities');

      // Pass existingModels to contextData for UpdateExecutor to compare and filter unchanged entities
      contextData['existingModels'] = dedupedExistingModels;
      debugPrint(
          'TRANSFORMER: Passing ${dedupedExistingModels.length} existingModels to contextData for change detection in UpdateExecutor');
    } else if (multiEntityField != null) {
      // Check if multiEntityField is configured
      // Manually traverse the nested path to get the multi-select array
      final multiEntityValue =
          _getNestedValue(formValuesToUse ?? {}, multiEntityField);

      if (multiEntityValue is List && multiEntityValue.isNotEmpty) {
        // Create multiple entities, one for each item in the multi-select field
        for (int i = 0; i < multiEntityValue.length; i++) {
          final item = multiEntityValue[i];
          var modifiedFormValues =
              Map<String, dynamic>.from(formValuesToUse ?? {});

          // Replace the multi-select array with the single item
          _setNestedValue(modifiedFormValues, multiEntityField, item);

          // Map entity-specific fields (with _item_N suffix) to base field names
          modifiedFormValues = _mapEntityFieldsToBase(modifiedFormValues, i);

          final itemEntities = formEntityMapper.mapFormToEntities(
            formValues: modifiedFormValues,
            modelsConfig: transformerConfig,
            context: contextMap,
            fallbackFormDataString: fallBackModel,
          );
          entities.addAll(itemEntities);
        }
      } else {
        // No items selected, create entities normally
        entities = formEntityMapper.mapFormToEntities(
          formValues: formValuesToUse ?? {},
          modelsConfig: transformerConfig,
          context: contextMap,
          fallbackFormDataString: fallBackModel,
        );
      }
    } else {
      // No multiEntityField configured, create entities normally
      entities = formEntityMapper.mapFormToEntities(
        formValues: formValuesToUse ?? {},
        modelsConfig: transformerConfig,
        context: contextMap,
        fallbackFormDataString: fallBackModel,
      );
    }

    contextData['entities'] = entities;
    return contextData;
  }

  /// Helper method to get a nested value from a map using dot notation
  dynamic _getNestedValue(Map<String, dynamic> map, String path) {
    final keys = path.split('.');
    dynamic current = map;

    for (final key in keys) {
      if (current is Map<String, dynamic> && current.containsKey(key)) {
        current = current[key];
      } else {
        return null;
      }
    }

    return current;
  }

  /// Helper method to set a nested value in a map using dot notation
  void _setNestedValue(Map<String, dynamic> map, String path, dynamic value) {
    final keys = path.split('.');
    Map<String, dynamic> current = map;

    for (int i = 0; i < keys.length - 1; i++) {
      if (!current.containsKey(keys[i])) {
        current[keys[i]] = <String, dynamic>{};
      }
      current = current[keys[i]] as Map<String, dynamic>;
    }

    current[keys.last] = value;
  }

  /// Maps entity-specific fields (with _item_N suffix) to base field names.
  ///
  /// Example: wayBillNumber_item_0 -> wayBillNumber (for entity index 0)
  Map<String, dynamic> _mapEntityFieldsToBase(
    Map<String, dynamic> formData,
    int entityIndex,
  ) {
    final result = Map<String, dynamic>.from(formData);
    final suffix = '_item_$entityIndex';

    // Process each page in the form data
    for (final pageEntry in formData.entries) {
      if (pageEntry.value is Map<String, dynamic>) {
        final pageData =
            Map<String, dynamic>.from(pageEntry.value as Map<String, dynamic>);

        // Find fields with the current entity index suffix
        final keysToRemove = <String>[];
        for (final fieldEntry
            in (pageEntry.value as Map<String, dynamic>).entries) {
          if (fieldEntry.key.endsWith(suffix)) {
            // Extract base field name
            final baseFieldName = fieldEntry.key.substring(
              0,
              fieldEntry.key.length - suffix.length,
            );

            // Map the entity-specific value to the base field name
            pageData[baseFieldName] = fieldEntry.value;

            // Mark the suffixed field for removal to prevent it from appearing in additionalFields
            keysToRemove.add(fieldEntry.key);
          }
        }

        // Remove all suffixed fields
        for (final key in keysToRemove) {
          pageData.remove(key);
        }

        result[pageEntry.key] = pageData;
      }
    }

    return result;
  }

  /// Compares two entities to check if actual data has changed.
  /// Excludes audit fields and rowVersion from comparison.
  bool _hasEntityChanged(EntityModel original, EntityModel updated) {
    final originalMap = original.toMap();
    final updatedMap = updated.toMap();

    // Fields to exclude from comparison (metadata that changes on every update)
    const excludeFields = {
      'clientAuditDetails',
      'auditDetails',
      'rowVersion',
      'lastModifiedBy',
      'lastModifiedTime',
      'createdBy',
      'createdTime',
    };

    // Compare all fields except excluded ones
    final allKeys = <String>{
      ...originalMap.keys,
      ...updatedMap.keys,
    }..removeAll(excludeFields);

    for (final key in allKeys) {
      final originalValue = originalMap[key];
      final updatedValue = updatedMap[key];

      if (!_deepEquals(originalValue, updatedValue)) {
        debugPrint(
            'TRANSFORMER: Field "$key" changed: $originalValue -> $updatedValue');
        return true;
      }
    }

    return false;
  }

  /// Deep equality check for nested maps and lists
  bool _deepEquals(dynamic a, dynamic b) {
    if (a == b) return true;
    if (a == null || b == null) return false;
    if (a.runtimeType != b.runtimeType) return false;

    if (a is Map && b is Map) {
      if (a.length != b.length) return false;
      for (final key in a.keys) {
        if (!b.containsKey(key)) return false;
        if (!_deepEquals(a[key], b[key])) return false;
      }
      return true;
    }

    if (a is List && b is List) {
      if (a.length != b.length) return false;
      for (int i = 0; i < a.length; i++) {
        if (!_deepEquals(a[i], b[i])) return false;
      }
      return true;
    }

    return a == b;
  }

  /// Fetch individual data from the state registry using clientReferenceId
  /// Returns a map with 'gender', 'ageInMonths', and 'dateOfBirth'
  Map<String, dynamic>? _fetchIndividualDataFromRegistry(
      String clientReferenceId) {
    try {
      // Try to find the individual from the householdOverview state
      final householdState = FlowCrudStateRegistry().get('householdOverview');
      final stateWrapper = householdState?.stateWrapper;

      if (stateWrapper == null || stateWrapper.isEmpty) {
        debugPrint('TRANSFORMER: No stateWrapper found in householdOverview');
        return null;
      }

      // Search for the individual in the state wrapper
      // Structure: stateWrapper -> wrapper -> members[] -> individual[]
      for (final wrapper in stateWrapper) {
        if (wrapper is! Map) continue;

        // Get the members list from wrapper
        final members = wrapper['members'];
        if (members == null) continue;

        // Handle both List and single object
        final memberList = members is List ? members : [members];

        for (final member in memberList) {
          if (member == null || member is! Map) continue;

          // Get the individual list from member
          final individuals = member['individual'];
          if (individuals == null) continue;

          final individualList =
              individuals is List ? individuals : [individuals];

          for (final individual in individualList) {
            if (individual == null) continue;

            // Get clientReferenceId from the individual
            String? individualClientRefId;
            dynamic gender;
            dynamic dateOfBirth;

            dynamic individualName;

            if (individual is Map) {
              individualClientRefId =
                  individual['clientReferenceId']?.toString();
              gender = individual['gender'];
              dateOfBirth = individual['dateOfBirth'];
              // Extract name from individual
              final name = individual['name'];
              if (name is Map) {
                final givenName = name['givenName'] ?? '';
                final familyName = name['familyName'] ?? '';
                individualName = '$givenName'.trim();
              } else if (name is String) {
                individualName = name;
              }
            } else {
              // Try to access it as an EntityModel
              try {
                final map = (individual as dynamic).toMap();
                individualClientRefId = map['clientReferenceId']?.toString();
                gender = map['gender'];
                dateOfBirth = map['dateOfBirth'];
                // Extract name from individual
                final name = map['name'];
                if (name is Map) {
                  final givenName = name['givenName'] ?? '';
                  final familyName = name['familyName'] ?? '';
                  individualName = '$givenName'.trim();
                } else if (name is String) {
                  individualName = name;
                }
              } catch (_) {
                continue;
              }
            }

            if (individualClientRefId == clientReferenceId) {
              // Found the individual, extract data
              // Handle Gender enum - convert to string value
              String? genderStr;
              if (gender != null) {
                final genderString = gender.toString();
                // Handle "Gender.male" -> "MALE"
                if (genderString.contains('.')) {
                  genderStr = genderString.split('.').last.toUpperCase();
                } else {
                  genderStr = genderString.toUpperCase();
                }
              }

              // Calculate age in months
              int? ageInMonths;
              if (dateOfBirth != null) {
                ageInMonths = _calculateAgeInMonths(dateOfBirth);
              }

              debugPrint(
                  'TRANSFORMER: Found individual - name=$individualName, gender=$genderStr, ageInMonths=$ageInMonths, dateOfBirth=$dateOfBirth');
              return {
                'name': individualName,
                'gender': genderStr,
                'ageInMonths': ageInMonths,
                'dateOfBirth': dateOfBirth,
              };
            }
          }
        }
      }

      debugPrint(
          'TRANSFORMER: Individual not found with clientReferenceId=$clientReferenceId');
      return null;
    } catch (e, st) {
      debugPrint('TRANSFORMER: Error fetching individual data: $e\n$st');
      return null;
    }
  }

  /// Fetch ProjectBeneficiaryClientReferenceId from the state registry
  /// for the given individual clientReferenceId
  String? _fetchProjectBeneficiaryClientReferenceId(
      String individualClientReferenceId) {
    try {
      final householdState = FlowCrudStateRegistry().get('householdOverview');
      final stateWrapper = householdState?.stateWrapper;

      if (stateWrapper == null || stateWrapper.isEmpty) {
        debugPrint(
            'TRANSFORMER: No stateWrapper found for ProjectBeneficiary lookup');
        return null;
      }

      // Search for the project beneficiary in the state wrapper
      // Structure: stateWrapper -> wrapper -> members[] -> projectBeneficiaries[]
      for (final wrapper in stateWrapper) {
        if (wrapper is! Map) continue;

        // Get the members list from wrapper
        final members = wrapper['members'];
        if (members == null) continue;

        final memberList = members is List ? members : [members];

        for (final member in memberList) {
          if (member == null || member is! Map) continue;

          // Check if this member's individual matches our target
          final individuals = member['individual'];
          if (individuals == null) continue;

          final individualList =
              individuals is List ? individuals : [individuals];

          bool isMatchingMember = false;
          for (final individual in individualList) {
            if (individual == null) continue;

            String? individualClientRefId;
            if (individual is Map) {
              individualClientRefId =
                  individual['clientReferenceId']?.toString();
            } else {
              try {
                final map = (individual as dynamic).toMap();
                individualClientRefId = map['clientReferenceId']?.toString();
              } catch (_) {
                continue;
              }
            }

            if (individualClientRefId == individualClientReferenceId) {
              isMatchingMember = true;
              break;
            }
          }

          if (isMatchingMember) {
            // Found the matching member, now get the projectBeneficiary
            final projectBeneficiaries = member['projectBeneficiaries'];
            if (projectBeneficiaries == null) continue;

            final beneficiaryList = projectBeneficiaries is List
                ? projectBeneficiaries
                : [projectBeneficiaries];

            if (beneficiaryList.isNotEmpty) {
              final beneficiary = beneficiaryList.first;
              String? clientRefId;

              if (beneficiary is Map) {
                clientRefId = beneficiary['clientReferenceId']?.toString();
              } else {
                try {
                  final map = (beneficiary as dynamic).toMap();
                  clientRefId = map['clientReferenceId']?.toString();
                } catch (_) {
                  // Ignore
                }
              }

              if (clientRefId != null) {
                debugPrint(
                    'TRANSFORMER: Found ProjectBeneficiaryClientReferenceId: $clientRefId');
                return clientRefId;
              }
            }
          }
        }
      }

      debugPrint(
          'TRANSFORMER: ProjectBeneficiary not found for individual=$individualClientReferenceId');
      return null;
    } catch (e, st) {
      debugPrint(
          'TRANSFORMER: Error fetching ProjectBeneficiaryClientReferenceId: $e\n$st');
      return null;
    }
  }

  /// Calculate age in months from date of birth
  int _calculateAgeInMonths(dynamic dateValue) {
    DateTime? birthDate;

    if (dateValue is int) {
      birthDate = DateTime.fromMillisecondsSinceEpoch(dateValue);
    } else if (dateValue is String) {
      // Try parsing as timestamp first
      final timestamp = int.tryParse(dateValue);
      if (timestamp != null) {
        birthDate = DateTime.fromMillisecondsSinceEpoch(timestamp);
      } else if (dateValue.contains('/')) {
        // Handle dd/MM/yyyy format
        try {
          final parts = dateValue.split('/');
          if (parts.length == 3) {
            final day = int.parse(parts[0]);
            final month = int.parse(parts[1]);
            final year = int.parse(parts[2]);
            birthDate = DateTime(year, month, day);
          }
        } catch (_) {
          // Fall through to DateTime.tryParse
        }
      }
      // Try parsing as ISO date string
      birthDate ??= DateTime.tryParse(dateValue);
    } else if (dateValue is DateTime) {
      birthDate = dateValue;
    }

    if (birthDate == null) return 0;

    final now = DateTime.now();
    final months =
        (now.year - birthDate.year) * 12 + (now.month - birthDate.month);

    // Adjust if the day hasn't occurred yet this month
    if (now.day < birthDate.day) {
      return months - 1;
    }

    return months;
  }

  /// Get the current running cycle index from project type
  /// Returns the cycle id where startDate < now < endDate
  int? _getCurrentCycleIndex() {
    try {
      final projectType = FlowBuilderSingleton().projectType;
      if (projectType == null) {
        debugPrint('TRANSFORMER: No projectType found in FlowBuilderSingleton');
        return null;
      }

      final cycles = projectType.cycles;
      if (cycles == null || cycles.isEmpty) {
        debugPrint('TRANSFORMER: No cycles found in projectType');
        return null;
      }

      final now = DateTime.now().millisecondsSinceEpoch;

      // Find the current running cycle (where startDate < now < endDate)
      for (final cycle in cycles) {
        final startDate = cycle.startDate;
        final endDate = cycle.endDate;

        if (startDate < now && now < endDate) {
          debugPrint(
              'TRANSFORMER: Found current cycle - id=${cycle.id}, startDate=$startDate, endDate=$endDate');
          return cycle.id;
        }
      }

      debugPrint('TRANSFORMER: No active cycle found');
      return null;
    } catch (e) {
      debugPrint('TRANSFORMER: Error getting current cycle index: $e');
      return null;
    }
  }
}
