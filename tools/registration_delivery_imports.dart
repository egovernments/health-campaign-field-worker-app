// Import the required Dart I/O package
import 'dart:io';

String createCaseCondition(String key, String value) {
  return 'case "$key":\n    $value';
}

void insertCaseCondition(List<String> lines, String caseCondition) {
  final defaultIndex = lines.indexWhere((line) => line.contains('default:'));
  if (defaultIndex != -1 &&
      !lines.any((line) => line.contains(caseCondition.split('\n')[0]))) {
    lines.insert(defaultIndex, caseCondition);
  }
}

// Define the main function
void main() {
  // Get the current directory path
  var appDir = Directory.current.path;

  // Define the paths for the application root and the files to be modified
  var appRoot = appDir + '/apps/health_campaign_field_worker_app/lib';
  var appFile = appRoot + '/app.dart';
  var localizationDelegatesFilePath =
      appRoot + '/utils/localization_delegates.dart';
  var networkManagerProviderWrapperFilePath =
      appRoot + '/widgets/network_manager_provider_wrapper.dart';
  var constantsFilePath = appRoot + '/utils/constants.dart';
  var utilsFilePath = appRoot + '/utils/utils.dart';
  var routerFilePath = appRoot + '/router/app_router.dart';
  var entityMapperFilePath =
      appRoot + '/data/local_store/no_sql/schema/entity_mapper.dart';
  var syncDownFilePath = appRoot + '/data/repositories/sync/sync_down.dart';
  var homeFilePath = appRoot + '/pages/home.dart';
  var extensionsFilePath = appRoot + '/utils/extensions/extensions.dart';
  var contextUtilityFilePath =
      appRoot + '/utils/extensions/context_utility.dart';

  // Set boundary in the context utility file
  _setBoundaryInContextUtilityFile(extensionsFilePath, contextUtilityFilePath);

  // Add the scanner bloc to the app file
  _addScannerBlocToAppFile(appFile);

  //  Create the localization delegates file
  _createLocalizationDelegatesFile(localizationDelegatesFilePath);

  // Add registration to home file
  _updateHome(homeFilePath);

  // Update the sync_down.dart file
  _updateSyncDownFile(syncDownFilePath);

  // Add registration routes and import to the router file
  _addRegistrationRoutesAndImportToRouterFile(routerFilePath);

  // Add new case statements to the entity_mapper.dart file
  _updateEntityMapperFile(entityMapperFilePath);

  // Add the repositories to the network manager provider wrapper
  _addRepoToNetworkManagerProviderWrapper(
      networkManagerProviderWrapperFilePath:
          networkManagerProviderWrapperFilePath);

  // Add the registration_delivery related constants to the constants file
  _addRegNDeliveryConstantsToConstantsFile(
      constantsFilePath: constantsFilePath);

  // Add the registration_delivery related mappers to the utils file
  _addRegNDeliveryMapperToUtilsFile(utilsFilePath: utilsFilePath);

  _formatFiles([
    appFile,
    localizationDelegatesFilePath,
    networkManagerProviderWrapperFilePath,
    constantsFilePath,
    utilsFilePath,
    routerFilePath,
    entityMapperFilePath,
    syncDownFilePath,
    homeFilePath,
    extensionsFilePath,
    contextUtilityFilePath,
  ]);
}

void _formatFiles(List<String> filePaths) {
  for (var filePath in filePaths) {
    Process.runSync('dart', ['format', filePath]);
    print('Formatted $filePath');
  }
}

void _addScannerBlocToAppFile(String appFilePath) {
  var importStatement = "import 'package:digit_scanner/blocs/scanner.dart';";

  var scannerBlocData = '''
    BlocProvider(
       create: (_) {
          return DigitScannerBloc(
              const DigitScannerState(),
            );
          },
          lazy: false,
       ),
  ''';

  // Check if the app.dart file exists
  var appFile = File(appFilePath);
  if (!appFile.existsSync()) {
    print('Error: App file does not exist at path: $appFile');
    return;
  }

  // Read the app.dart file
  var appFileContent = appFile.readAsStringSync();

  // Check if the import statement already exists and add it if not
  if (!appFileContent.contains(importStatement)) {
    appFileContent = importStatement + '\n' + appFileContent;
    print('The import statement was added.');
  } else {
    print('The import statement already exists.');
  }

  // Insert the data to be added
  appFileContent = insertData(appFileContent,
      '// INFO : Need to add bloc of package Here', scannerBlocData);

  // Write the updated content back to the app.dart file
  appFile.writeAsStringSync(appFileContent);
}

void _updateHome(String homeFilePath) {
  var importStatement = '''
      import 'package:registration_delivery/registration_delivery.dart';
      import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
      ''';

  var homeItemsData = '''
    i18.home.beneficiaryLabel:
          homeShowcaseData.distributorBeneficiaries.buildWith(
        child: HomeItemCard(
          icon: Icons.all_inbox,
          label: i18.home.beneficiaryLabel,
          onPressed: () async {
            await context.router.push(const RegistrationDeliveryWrapperRoute());
          },
        ),
      ),
  ''';

  var showCaseData = '''
        i18.home.beneficiaryLabel:
          homeShowcaseData.distributorBeneficiaries.showcaseKey,
  ''';

  var itemsLabel = '''
  i18.home.beneficiaryLabel,
  ''';

  // Define the data to be added
  var singletonData = '''
    RegistrationDeliverySingleton().setInitialData(
          loggedInUserUuid: context.loggedInUserUuid,
          maxRadius: appConfiguration.maxRadius!,
          projectId: context.projectId,
          selectedBeneficiaryType: context.beneficiaryType,
          projectType: context.selectedProjectType,
          selectedProject: context.selectedProject,
          genderOptions:
              appConfiguration.genderOptions!.map((e) => e.code).toList(),
          idTypeOptions:
              appConfiguration.idTypeOptions!.map((e) => e.code).toList(),
          householdDeletionReasonOptions: appConfiguration
              .householdDeletionReasonOptions!
              .map((e) => e.code)
              .toList(),
          householdMemberDeletionReasonOptions: appConfiguration
              .householdMemberDeletionReasonOptions!
              .map((e) => e.code)
              .toList(),
          deliveryCommentOptions: appConfiguration.deliveryCommentOptions!
              .map((e) => e.code)
              .toList(),
          symptomsTypes:
              appConfiguration.symptomsTypes!.map((e) => e.code).toList(),
          referralReasons:
              appConfiguration.referralReasons!.map((e) => e.code).toList(),
        );
  ''';

  var localRepoData = '''
    context.read<LocalRepository<HouseholdModel, HouseholdSearchModel>>(),
    context.read<LocalRepository<ProjectBeneficiaryModel,ProjectBeneficiarySearchModel>>(),
    context.read<LocalRepository<HouseholdMemberModel,HouseholdMemberSearchModel>>(),
    context.read<LocalRepository<TaskModel, TaskSearchModel>>(),
    context.read<LocalRepository<SideEffectModel, SideEffectSearchModel>>(),
    context.read<LocalRepository<ReferralModel, ReferralSearchModel>>(),
  ''';

  var remoteRepoData = '''
     context.read<RemoteRepository<HouseholdModel, HouseholdSearchModel>>(),
     context.read<RemoteRepository<ProjectBeneficiaryModel,ProjectBeneficiarySearchModel>>(),
     context.read<RemoteRepository<HouseholdMemberModel,HouseholdMemberSearchModel>>(),
     context.read<RemoteRepository<TaskModel, TaskSearchModel>>(),
     context.read<RemoteRepository<SideEffectModel, SideEffectSearchModel>>(),
     context.read<RemoteRepository<ReferralModel, ReferralSearchModel>>(),
  ''';

  // Check if the home.dart file exists
  var homeFile = File(homeFilePath);
  if (!homeFile.existsSync()) {
    print('Error: Home file does not exist at path: $homeFilePath');
    return;
  }

  // Read the home.dart file
  var homeFileContent = homeFile.readAsStringSync();

  // Check if the import statement already exists and add it if not
  if (!homeFileContent
      .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
    homeFileContent = importStatement + '\n' + homeFileContent;
    print('The import statement was added.');
  } else {
    print('The import statement already exists.');
  }

  // Insert the data to be added
  homeFileContent = insertData(homeFileContent,
      '// INFO : Need to add singleton of package Here', singletonData);
  homeFileContent = insertData(homeFileContent,
      '// INFO : Need to add local repo of package Here', localRepoData);
  homeFileContent = insertData(homeFileContent,
      '// INFO : Need to add repo repo of package Here', remoteRepoData);
  homeFileContent = insertData(homeFileContent,
      '// INFO : Need to add home items of package Here', homeItemsData);
  homeFileContent = insertData(homeFileContent,
      '// INFO : Need to add showcase keys of package Here', showCaseData);
  homeFileContent = insertData(homeFileContent,
      '// INFO: Need to add items label of package Here', itemsLabel);

  // Write the updated content back to the home.dart file
  homeFile.writeAsStringSync(homeFileContent);
}

String insertData(String fileContent, String marker, String data) {
  var markerIndex = fileContent.indexOf(marker);
  if (markerIndex != -1) {
    var endOfMarker = markerIndex + marker.length;
    if (!fileContent.substring(endOfMarker).contains(data.trim())) {
      fileContent = fileContent.substring(0, endOfMarker) +
          '\n' +
          data +
          fileContent.substring(endOfMarker);
      print('Data was added after marker: $marker');
    } else {
      print('Data already exists after marker: $marker');
    }
  } else {
    print('Error: Could not find the marker: $marker');
  }
  return fileContent;
}

void _setBoundaryInContextUtilityFile(
    String extensionsFilePath, String contextUtilityFilePath) {
  // Define the lines to be added
  var importStatement =
      "import 'package:registration_delivery/registration_delivery.dart';";
  var boundaryStatement =
      'RegistrationDeliverySingleton().setBoundary(boundary: selectedBoundary);';

  // Update the extensions.dart file
  var extensionsFile = File(extensionsFilePath);
  var extensionsFileContent = extensionsFile.readAsStringSync();
  if (!extensionsFileContent.contains(importStatement)) {
    extensionsFileContent = importStatement + '\n' + extensionsFileContent;
    extensionsFile.writeAsStringSync(extensionsFileContent);
    print('Updated the extensions.dart file.');
  }

  // Update the context_utility.dart file
  var contextUtilityFile = File(contextUtilityFilePath);
  var contextUtilityFileContent = contextUtilityFile.readAsStringSync();

  // Use the insertData method to insert the boundaryStatement
  contextUtilityFileContent = insertData(contextUtilityFileContent,
      '// INFO: Set Boundary for packages', boundaryStatement);

  // Write the updated content back to the context_utility.dart file
  contextUtilityFile.writeAsStringSync(contextUtilityFileContent);
  print('Updated the context_utility.dart file.');
}

void _createLocalizationDelegatesFile(String localizationDelegatesFilePath) {
  // Define the import statement and delegate for localization
  var importStatement =
      "import 'package:registration_delivery/blocs/app_localization.dart' as registration_delivery_localization;";
  var delegate = '''
      registration_delivery_localization.RegistrationDeliveryLocalization
        .getDelegate(
      getLocalizationString(
        isar,
        selectedLocale,
      ),
      appConfig.languages!,
    ),
    ''';

  // Read the localization delegates file
  var localizationDelegatesFile = File(localizationDelegatesFilePath);
  var localizationDelegatesFileContent =
      localizationDelegatesFile.readAsStringSync();

  var normalizedFileContent =
      localizationDelegatesFileContent.replaceAll(RegExp(r'\s'), '');

  // Check if the import statement and delegate already exist in the file
  // If not, add them to the file
  if (!normalizedFileContent
      .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
    localizationDelegatesFileContent =
        '$importStatement\n$localizationDelegatesFileContent';
    print('The import statement was added.');
  }

  if (!normalizedFileContent.contains(delegate.replaceAll(RegExp(r'\s'), ''))) {
    var lastDelegateIndex =
        localizationDelegatesFileContent.lastIndexOf(RegExp(r','));
    if (lastDelegateIndex != -1) {
      localizationDelegatesFileContent =
          localizationDelegatesFileContent.substring(0, lastDelegateIndex + 1) +
              '\n  $delegate' +
              localizationDelegatesFileContent.substring(lastDelegateIndex + 1);
      print('The delegate was added.');
    }
  }

  // Write the updated content back to the file
  localizationDelegatesFile.writeAsStringSync(localizationDelegatesFileContent);
}

void _updateSyncDownFile(String syncDownFilePath) {
  // Define the import statement and the new case statements
  var importStatement =
      "import 'package:registration_delivery/registration_delivery.dart';";
  var newCases = '''
      case DataModelType.household:
            responseEntities = await remote.search(HouseholdSearchModel(
              clientReferenceId: entities
                  .whereType<HouseholdModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as HouseholdModel;
              final responseEntity =
                  responseEntities.whereType<HouseholdModel>().firstWhereOrNull(
                        (e) => e.clientReferenceId == entity.clientReferenceId,
                      );

              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;
              if (serverGeneratedId != null) {
                final addressAdditionalId = responseEntity?.address?.id == null
                    ? null
                    : AdditionalId(
                        idType: 'householdAddressId',
                        id: responseEntity!.address!.id!,
                      );

                await local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    additionalIds: [
                      if (addressAdditionalId != null) addressAdditionalId,
                    ],
                    dataOperation: element.operation,
                    rowVersion: rowVersion,
                    nonRecoverableError: element.nonRecoverableError,
                  ),
                );
              } else {
                final bool markAsNonRecoverable = await local.opLogManager
                    .updateSyncDownRetry(entity.clientReferenceId);

                if (markAsNonRecoverable) {
                  await local.update(
                    entity.copyWith(
                      nonRecoverableError: true,
                    ),
                    createOpLog: false,
                  );
                }
              }
            }

            break;

          case DataModelType.householdMember:
            responseEntities = await remote.search(HouseholdMemberSearchModel(
              clientReferenceId: entities
                  .whereType<HouseholdMemberModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as HouseholdMemberModel;
              final responseEntity = responseEntities
                  .whereType<HouseholdMemberModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );
              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;
              if (serverGeneratedId != null) {
                await local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    dataOperation: element.operation,
                    rowVersion: rowVersion,
                  ),
                );
              } else {
                final bool markAsNonRecoverable = await local.opLogManager
                    .updateSyncDownRetry(entity.clientReferenceId);

                if (markAsNonRecoverable) {
                  await local.update(
                    entity.copyWith(
                      nonRecoverableError: true,
                    ),
                    createOpLog: false,
                  );
                }
              }
            }

            break;

          case DataModelType.sideEffect:
            responseEntities = await remote.search(SideEffectSearchModel(
              clientReferenceId: entities
                  .whereType<SideEffectModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in typeGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as SideEffectModel;
              var responseEntity = responseEntities
                  .whereType<SideEffectModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;
              if (serverGeneratedId != null) {
                local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    dataOperation: element.operation,
                    rowVersion: rowVersion,
                  ),
                );
              } else {
                final bool markAsNonRecoverable = await local.opLogManager
                    .updateSyncDownRetry(entity.clientReferenceId);

                if (markAsNonRecoverable) {
                  await local.update(
                    entity.copyWith(
                      nonRecoverableError: true,
                    ),
                    createOpLog: false,
                  );
                }
              }
            }

          case DataModelType.referral:
            responseEntities = await remote.search(ReferralSearchModel(
              clientReferenceId: entities
                  .whereType<ReferralModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in typeGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as ReferralModel;
              var responseEntity =
                  responseEntities.whereType<ReferralModel>().firstWhereOrNull(
                        (e) => e.clientReferenceId == entity.clientReferenceId,
                      );

              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;
              if (serverGeneratedId != null) {
                local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    dataOperation: element.operation,
                    rowVersion: rowVersion,
                  ),
                );
              } else {
                final bool markAsNonRecoverable = await local.opLogManager
                    .updateSyncDownRetry(entity.clientReferenceId);

                if (markAsNonRecoverable) {
                  await local.update(
                    entity.copyWith(
                      nonRecoverableError: true,
                    ),
                    createOpLog: false,
                  );
                }
              }
            }

          case DataModelType.projectBeneficiary:
            responseEntities =
                await remote.search(ProjectBeneficiarySearchModel(
              clientReferenceId: entities
                  .whereType<ProjectBeneficiaryModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as ProjectBeneficiaryModel;
              final responseEntity = responseEntities
                  .whereType<ProjectBeneficiaryModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );
              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;
              if (serverGeneratedId != null) {
                await local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    dataOperation: element.operation,
                    rowVersion: rowVersion,
                  ),
                );
              } else {
                final bool markAsNonRecoverable = await local.opLogManager
                    .updateSyncDownRetry(entity.clientReferenceId);

                if (markAsNonRecoverable) {
                  await local.update(
                    entity.copyWith(
                      nonRecoverableError: true,
                    ),
                    createOpLog: false,
                  );
                }
              }
            }

            break;
          case DataModelType.task:
            responseEntities = await remote.search(TaskSearchModel(
              clientReferenceId: entities
                  .whereType<TaskModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
              isDeleted: true,
            ));

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final taskModel = element.entity as TaskModel;
              var responseEntity =
                  responseEntities.whereType<TaskModel>().firstWhereOrNull(
                        (e) =>
                            e.clientReferenceId == taskModel.clientReferenceId,
                      );

              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;

              if (serverGeneratedId != null) {
                await local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: taskModel.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    additionalIds: responseEntity?.resources
                        ?.map((e) {
                          final id = e.id;
                          if (id == null) return null;

                          return AdditionalId(
                            idType: 'taskResourceId',
                            id: id,
                          );
                        })
                        .whereNotNull()
                        .toList(),
                    dataOperation: element.operation,
                    rowVersion: rowVersion,
                  ),
                );
              } else {
                final bool markAsNonRecoverable = await local.opLogManager
                    .updateSyncDownRetry(taskModel.clientReferenceId);

                if (markAsNonRecoverable) {
                  await local.update(
                    taskModel.copyWith(
                      nonRecoverableError: true,
                    ),
                    createOpLog: false,
                  );
                }
              }
            }

            break;
''';

  // Check if the sync_down file exists
  var syncDownFile = File(syncDownFilePath);

  if (!syncDownFile.existsSync()) {
    print('Error: Sync Down file does not exist at path: $syncDownFilePath');
    return;
  }

  // Read the sync_down file
  var syncDownFileContent = syncDownFile.readAsStringSync();

  // Check if the import statement already exists and add it if not
  if (!syncDownFileContent
      .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
    syncDownFileContent = importStatement + '\n' + syncDownFileContent;
    print('The import statement was added to sync_down.dart.');
  } else {
    print('The import statement already exists in sync_down.dart.');
  }

  // Insert the new case statements
  if (!syncDownFileContent.contains('DataModelType.stock') &&
      !syncDownFileContent.contains('DataModelType.stockReconciliation')) {
    // Find the position to insert the new cases within the switch statement
    var switchIndex =
        syncDownFileContent.indexOf('switch (typeGroupedEntity.key) {');
    if (switchIndex != -1) {
      var caseInsertionIndex =
          syncDownFileContent.indexOf('default:', switchIndex);
      if (caseInsertionIndex != -1) {
        syncDownFileContent =
            syncDownFileContent.substring(0, caseInsertionIndex) +
                newCases +
                '\n' +
                syncDownFileContent.substring(caseInsertionIndex);
        print('The new cases were added to sync_down.dart.');

        // Write the updated content back to the file
        syncDownFile.writeAsStringSync(syncDownFileContent);
      } else {
        print(
            'Error: Could not find the default case in the switch statement in sync_down.dart.');
        return;
      }
    } else {
      print('Error: Could not find the switch statement in sync_down.dart.');
      return;
    }
  } else {
    print('The new cases already exist in sync_down.dart.');
  }
}

void _updateEntityMapperFile(String entityMapperFilePath) {
  // Define the import statement and new case statements
  var importStatement =
      "import 'package:registration_delivery/registration_delivery.dart';";
  var newCases = '''
      case "household":
        final entity = HouseholdModelMapper.fromJson(entityString);
        return entity;

      case "householdMember":
        final entity = HouseholdMemberModelMapper.fromJson(entityString);
        return entity;

      case "projectBeneficiary":
        final entity = ProjectBeneficiaryModelMapper.fromJson(entityString);
        return entity;

      case "task":
        final entity = TaskModelMapper.fromJson(entityString);
        return entity;

      case "sideEffect":
        final entity = SideEffectModelMapper.fromJson(entityString);
        return entity;

      case "referral":
        final entity = ReferralModelMapper.fromJson(entityString);
        return entity;
''';

  // Check if the entity_mapper file exists
  var entityMapperFile = File(entityMapperFilePath);

  if (!entityMapperFile.existsSync()) {
    print(
        'Error: Entity Mapper file does not exist at path: $entityMapperFilePath');
    return;
  }

  // Read the entity_mapper file
  var entityMapperFileContent = entityMapperFile.readAsStringSync();

  // Check if the import statement already exists and add it if not
  if (!entityMapperFileContent
      .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
    entityMapperFileContent = importStatement + '\n' + entityMapperFileContent;
    print('The import statement was added.');
  } else {
    print('The import statement already exists.');
  }

  // Check if the new cases already exist in the file
  if (!entityMapperFileContent.contains('case "household":') &&
      !entityMapperFileContent.contains('case "householdMember":') &&
      !entityMapperFileContent.contains('case "projectBeneficiary":') &&
      !entityMapperFileContent.contains('case "task":') &&
      !entityMapperFileContent.contains('case "sideEffect":') &&
      !entityMapperFileContent.contains('case "referral":')) {
    // Find the position to insert the new cases (before the default case)
    var caseInsertionIndex = entityMapperFileContent.indexOf('default:');
    if (caseInsertionIndex != -1) {
      entityMapperFileContent =
          entityMapperFileContent.substring(0, caseInsertionIndex) +
              newCases +
              '\n' +
              entityMapperFileContent.substring(caseInsertionIndex);
      print('The new cases were added.');

      // Write the updated content back to the file
      entityMapperFile.writeAsStringSync(entityMapperFileContent);
    } else {
      print('Error: Could not find the insertion point.');
      return;
    }
  } else {
    print('The new cases already exist.');
  }
}

void _addRegistrationRoutesAndImportToRouterFile(String routerFilePath) {
  // Define the registration route lines
  var registrationRoutes = '''
    AutoRoute(
            page: RegistrationDeliveryWrapperRoute.page,
            path: 'registration-delivery-wrapper',
            children: [
              AutoRoute(
                  initial: true,
                  page: SearchBeneficiaryRoute.page,
                  path: 'search-beneficiary'),

              AutoRoute(
                page: FacilitySelectionRoute.page,
                 path: 'select-facilities',
              ),

              /// Beneficiary Registration
              AutoRoute(
                page: BeneficiaryRegistrationWrapperRoute.page,
                path: 'beneficiary-registration',
                children: [
                  AutoRoute(
                      page: IndividualDetailsRoute.page,
                      path: 'individual-details'),
                  AutoRoute(
                      page: HouseHoldDetailsRoute.page,
                      path: 'household-details'),
                  AutoRoute(
                      page: HouseDetailsRoute.page,
                      path: 'house-details'),   
                  AutoRoute(
                    page: HouseholdLocationRoute.page,
                    path: 'household-location',
                    initial: true,
                  ),
                  AutoRoute(
                    page: BeneficiaryAcknowledgementRoute.page,
                    path: 'beneficiary-acknowledgement',
                  ),
                  AutoRoute(
                    page: SummaryRoute.page,
                    path: 'beneficiary-summary',
                  ),
                ],
              ),
              AutoRoute(
                page: BeneficiaryWrapperRoute.page,
                path: 'beneficiary',
                children: [
                  AutoRoute(
                    page: HouseholdOverviewRoute.page,
                    path: 'overview',
                    initial: true,
                  ),
                  AutoRoute(
                    page: BeneficiaryDetailsRoute.page,
                    path: 'beneficiary-details',
                  ),
                  AutoRoute(
                    page: DeliverInterventionRoute.page,
                    path: 'deliver-intervention',
                  ),
                  AutoRoute(
                    page: SideEffectsRoute.page,
                    path: 'side-effects',
                  ),
                  AutoRoute(
                    page: ReferBeneficiaryRoute.page,
                    path: 'refer-beneficiary',
                  ),
                  AutoRoute(
                    page: DoseAdministeredRoute.page,
                    path: 'dose-administered',
                  ),
                  AutoRoute(
                    page: SplashAcknowledgementRoute.page,
                    path: 'splash-acknowledgement',
                  ),
                  AutoRoute(
                    page: ReasonForDeletionRoute.page,
                    path: 'reason-for-deletion',
                  ),
                  AutoRoute(
                    page: RecordPastDeliveryDetailsRoute.page,
                    path: 'record-past-delivery-details',
                  ),
                  AutoRoute(
                    page: HouseholdAcknowledgementRoute.page,
                    path: 'household-acknowledgement',
                  ),
                  AutoRoute(
                    page: DeliverySummaryRoute.page,
                    path: 'delivery-summary',
                  ),
                ],
              ),
            ]),
  ''';

  // Define the import statement
  var importStatement1 =
      "import 'package:registration_delivery/router/registration_delivery_router.gm.dart';";
  // Define the import statement
  var importStatement2 =
      "import 'package:registration_delivery/router/registration_delivery_router.dart';";

  // Check if the router file exists
  var routerFile = File(routerFilePath);

  if (!routerFile.existsSync()) {
    print('Error: Router file does not exist at path: $routerFilePath');
    return;
  }

  // Read the router file
  var routerFileContent = routerFile.readAsStringSync();

  // Normalize the whitespace in the file content
  var normalizedFileContent = routerFileContent.replaceAll(RegExp(r'\s'), '');

  // Check if the import statement already exists
  if (!normalizedFileContent
      .contains(importStatement1.replaceAll(RegExp(r'\s'), ''))) {
    // Add the import statement at the beginning of the file
    routerFileContent = importStatement1 + '\n' + routerFileContent;
    print('The import statement was added.');
  } else {
    print('The import statement already exists.');
  }

  // Check if the import statement already exists
  if (!normalizedFileContent
      .contains(importStatement2.replaceAll(RegExp(r'\s'), ''))) {
    // Add the import statement at the beginning of the file
    routerFileContent = importStatement2 + '\n' + routerFileContent;
    print('The import statement was added.');
  } else {
    print('The import statement already exists.');
  }
  // Check if the RegistrationDeliveryRoute module already exists
  if (!routerFileContent.contains('RegistrationDeliveryRoute')) {
    // Find the position to insert the module
    var moduleInsertionIndex = routerFileContent.indexOf('@AutoRouterConfig(');
    if (moduleInsertionIndex != -1) {
      var endOfModulesIndex =
          routerFileContent.indexOf(']', moduleInsertionIndex);
      if (endOfModulesIndex != -1) {
        var modulesEndIndex =
            routerFileContent.lastIndexOf(']', endOfModulesIndex);
        routerFileContent = routerFileContent.substring(0, modulesEndIndex) +
            ' RegistrationDeliveryRoute,' +
            routerFileContent.substring(modulesEndIndex);
        print('The RegistrationDeliveryRoute module was added.');
      } else {
        print('Error: Could not find the end of the modules list.');
        return;
      }
    } else {
      print('Error: Could not find @AutoRouterConfig annotation.');
      return;
    }
  } else {
    print('The RegistrationDeliveryRoute module already exists.');
  }

  // Check if the registration routes already exist in the file
  if (!normalizedFileContent
      .contains(registrationRoutes.replaceAll(RegExp(r'\s'), ''))) {
    // Find the position to insert the routes
    var insertionIndex = routerFileContent
        .indexOf('// INFO : Need to add Router of package Here');
    if (insertionIndex != -1) {
      routerFileContent = routerFileContent.substring(0, insertionIndex) +
          '// INFO : Need to add Router of package Here\n' +
          registrationRoutes +
          routerFileContent.substring(insertionIndex +
              '// INFO : Need to add Router of package Here'.length);
      print('The registration routes were added.');

      // Write the updated content back to the file
      routerFile.writeAsStringSync(routerFileContent);
    } else {
      print('Error: Could not find the insertion point.');
      return;
    }
  } else {
    print('The registration routes already exist.');
  }
}

void _addRegNDeliveryMapperToUtilsFile({required String utilsFilePath}) {
  // Define the registration_delivery related lines
  var dataModelImportStatement = [
    "import 'package:registration_delivery/registration_delivery.init.dart' as registration_delivery_mappers;"
  ];
  var dataModelInitializationStatement =
      "Future(() => registration_delivery_mappers.initializeMappers()),";

  // Check if the utils.dart file exists
  var utilsFile = File(utilsFilePath);

  // Read the utils.dart file
  var utilsFileContent = utilsFile.readAsStringSync();

  // Normalize the whitespace in the file content
  var normalizedFileContent = utilsFileContent.replaceAll(RegExp(r'\s'), '');

  // Check if the import statement and delegate already exist in the file
  // If not, add them to the file
  if (!normalizedFileContent
      .contains(dataModelImportStatement[0].replaceAll(RegExp(r'\s'), ''))) {
    var libraryIndex = utilsFileContent.indexOf('library app_utils;');
    if (libraryIndex != -1) {
      var endOfLibrary = libraryIndex +
          utilsFileContent.substring(libraryIndex).indexOf(';') +
          1;
      utilsFileContent = utilsFileContent.substring(0, endOfLibrary + 1) +
          '\n' +
          dataModelImportStatement[0] +
          utilsFileContent.substring(endOfLibrary + 1);
      print('The import statement was added.');
    }
  } else {
    print('The import statement already exists.');
  }

  if (!utilsFileContent.contains(dataModelInitializationStatement)) {
    // Add the RegistrationDelivery related initialization statement to the file
    var initializeAllMappersIndex =
        utilsFileContent.indexOf('initializeAllMappers() async {');
    if (initializeAllMappersIndex == -1) {
      print(
          'Error: Could not find a place to insert the RegistrationDelivery initialization statement.');
      return;
    }
    var endOfInitializeAllMappers = initializeAllMappersIndex +
        utilsFileContent.substring(initializeAllMappersIndex).indexOf(']') +
        1;
    utilsFileContent =
        utilsFileContent.substring(0, endOfInitializeAllMappers - 1) +
            '\n    ' +
            dataModelInitializationStatement +
            utilsFileContent.substring(endOfInitializeAllMappers - 1);
    print('RegistrationDelivery initialization statement added to utils.dart');
  }

  // Write the updated content back to the utils.dart file
  utilsFile.writeAsStringSync(utilsFileContent);
}

void _addRegNDeliveryConstantsToConstantsFile(
    {required String constantsFilePath}) {
  // Define the import statements
  var importStatements = [
    "import 'package:registration_delivery/registration_delivery.dart';",
  ];

  // Define the additional line to be added
  var registrationDeliveryConfiguration = '''
  RegistrationDeliverySingleton().setTenantId(envConfig.variables.tenantId);
  ''';

  var localRepositories = [
    '''
      HouseholdMemberLocalRepository(sql, HouseholdMemberOpLogManager(isar)),
      HouseholdLocalRepository(sql, HouseholdOpLogManager(isar)),
      ProjectBeneficiaryLocalRepository(
        sql,
        ProjectBeneficiaryOpLogManager(
          isar,
        ),
      ),
      TaskLocalRepository(sql, TaskOpLogManager(isar)),
      SideEffectLocalRepository(sql, SideEffectOpLogManager(isar)),
      ReferralLocalRepository(sql, ReferralOpLogManager(isar)),
    '''
  ];

  // Define the remote repositories of registration_delivery
  var remoteRepositoriesOfRegistration = [
    '''
    if (value == DataModelType.household)
      HouseholdRemoteRepository(dio, actionMap: actions),
    if (value == DataModelType.projectBeneficiary)
      ProjectBeneficiaryRemoteRepository(dio, actionMap: actions),
    if (value == DataModelType.task)
      TaskRemoteRepository(dio, actionMap: actions),
    if (value == DataModelType.householdMember)
      HouseholdMemberRemoteRepository(dio, actionMap: actions),
    if (value == DataModelType.sideEffect)
      SideEffectRemoteRepository(dio, actionMap: actions),
    if (value == DataModelType.referral)
      ReferralRemoteRepository(dio, actionMap: actions),
    '''
  ];

  // Check if the constants.dart file exists
  var constantsFile = File(constantsFilePath);
  if (!constantsFile.existsSync()) {
    print('Error: The constants.dart file does not exist.');
    return;
  }

  // Read the constants.dart file
  var constantsFileContent = constantsFile.readAsStringSync();

  // Normalize the whitespace in the file content and the registration_delivery configuration
  var normalizedFileContent =
      constantsFileContent.replaceAll(RegExp(r'\s'), '');
  var normalizedRegistrationConfiguration =
      registrationDeliveryConfiguration.replaceAll(RegExp(r'\s'), '');

  // Check if the import statements already exist in the file
  for (var importStatement in importStatements) {
    if (!normalizedFileContent
        .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
      // Add the import statement at the top of the file
      constantsFileContent = importStatement + '\n' + constantsFileContent;
      print('The import statement was added: $importStatement');
    }
  }

  // Check if the registration_delivery configuration already exists in the file
  // If not, add it to the file
  if (!normalizedFileContent.contains(normalizedRegistrationConfiguration)) {
    // Find the setInitialDataOfPackages method and add the registration_delivery configuration inside it
    var setInitialDataOfPackagesIndex =
        constantsFileContent.indexOf('void setInitialDataOfPackages() {');
    if (setInitialDataOfPackagesIndex != -1) {
      var endOfSetInitialDataOfPackages = setInitialDataOfPackagesIndex +
          constantsFileContent
              .substring(setInitialDataOfPackagesIndex)
              .indexOf('}') +
          1;
      constantsFileContent =
          constantsFileContent.substring(0, endOfSetInitialDataOfPackages - 1) +
              '\n  $registrationDeliveryConfiguration' +
              constantsFileContent.substring(endOfSetInitialDataOfPackages - 1);
      print('The registration_delivery configuration was added.');
    }
  }

  // Add the local and remote repositories to the getLocalRepositories and getRemoteRepositories methods
  var getLocalRepositoriesIndex =
      constantsFileContent.indexOf('getLocalRepositories(');
  if (getLocalRepositoriesIndex != -1) {
    var endOfGetLocalRepositories = getLocalRepositoriesIndex +
        constantsFileContent.substring(getLocalRepositoriesIndex).indexOf(']') +
        1;
    constantsFileContent =
        constantsFileContent.substring(0, endOfGetLocalRepositories - 1) +
            '\n' +
            localRepositories.join('\n') +
            constantsFileContent.substring(endOfGetLocalRepositories - 1);
    print('The local repositories were added.');
  }

  var getRemoteRepositoriesIndex =
      constantsFileContent.indexOf('getRemoteRepositories(');
  if (getRemoteRepositoriesIndex != -1) {
    var endOfGetRemoteRepositories = getRemoteRepositoriesIndex +
        constantsFileContent
            .substring(getRemoteRepositoriesIndex)
            .indexOf('addAll(') +
        'addAll('.length;
    var endOfAddAll = constantsFileContent
            .substring(endOfGetRemoteRepositories)
            .indexOf(']') +
        endOfGetRemoteRepositories;
    constantsFileContent = constantsFileContent.substring(0, endOfAddAll) +
        remoteRepositoriesOfRegistration.join('\n') +
        constantsFileContent.substring(endOfAddAll);
    print('The remote repositories were added.');
  }

  // Write the updated content back to the constants.dart file
  constantsFile.writeAsStringSync(constantsFileContent);
}

void _addRepoToNetworkManagerProviderWrapper(
    {required String networkManagerProviderWrapperFilePath}) {
  // Define the import statements and repository providers
  var importStatements = [
    "import 'package:registration_delivery/registration_delivery.dart';",
  ];
  var localRepositories = [
    "RepositoryProvider<LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel>>(create: (_) => HouseholdMemberLocalRepository(sql,HouseholdMemberOpLogManager(isar),),),",
    "RepositoryProvider<LocalRepository<HouseholdModel, HouseholdSearchModel>>(create: (_) => HouseholdLocalRepository(sql,HouseholdOpLogManager(isar),),),",
    "RepositoryProvider<LocalRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>>(create: (_) => ProjectBeneficiaryLocalRepository(sql,ProjectBeneficiaryOpLogManager(isar),),),",
    "RepositoryProvider<LocalRepository<TaskModel, TaskSearchModel>>(create: (_) => TaskLocalRepository(sql,TaskOpLogManager(isar),),),",
    "RepositoryProvider<LocalRepository<ReferralModel, ReferralSearchModel>>(create: (_) => ReferralLocalRepository(sql,ReferralOpLogManager(isar),),),",
    "RepositoryProvider<LocalRepository<SideEffectModel, SideEffectSearchModel>>(create: (_) => SideEffectLocalRepository(sql,SideEffectOpLogManager(isar),),),",
    "RepositoryProvider<RegistrationDeliveryAddressRepo>(create: (_) => RegistrationDeliveryAddressRepo(sql,AddressOpLogManager(isar),),),",
  ];

// Define the remote repositories of DataModel
  var remoteRepositoriesOfRegistrationDelivery = [
    "if (value == DataModelType.household) RepositoryProvider<RemoteRepository<HouseholdModel, HouseholdSearchModel>>(create: (_) => HouseholdRemoteRepository(dio, actionMap: actions,),),",
    "if (value == DataModelType.householdMember) RepositoryProvider<RemoteRepository<HouseholdMemberModel, HouseholdMemberSearchModel>>(create: (_) => HouseholdMemberRemoteRepository(dio, actionMap: actions,),),",
    "if (value == DataModelType.projectBeneficiary) RepositoryProvider<RemoteRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>>(create: (_) => ProjectBeneficiaryRemoteRepository(dio, actionMap: actions,),),",
    "if (value == DataModelType.task) RepositoryProvider<RemoteRepository<TaskModel, TaskSearchModel>>(create: (_) => TaskRemoteRepository(dio, actionMap: actions,),),",
    "if (value == DataModelType.referral) RepositoryProvider<RemoteRepository<ReferralModel, ReferralSearchModel>>(create: (_) => ReferralRemoteRepository(dio, actionMap: actions,),),",
    "if (value == DataModelType.sideEffect) RepositoryProvider<RemoteRepository<SideEffectModel, SideEffectSearchModel>>(create: (_) => SideEffectRemoteRepository(dio, actionMap: actions,),),",
  ];

// Read the network_manager_provider_wrapper.dart file
  var networkManagerProviderWrapperFile =
      File(networkManagerProviderWrapperFilePath);
  var networkManagerProviderWrapperFileContent =
      networkManagerProviderWrapperFile.readAsStringSync();

// Find the last import statement in the file
  var lastImportIndex = networkManagerProviderWrapperFileContent
      .lastIndexOf(RegExp(r'import .+;'));

  if (lastImportIndex != -1) {
    var endOfLastImport = lastImportIndex +
        networkManagerProviderWrapperFileContent
            .substring(lastImportIndex)
            .indexOf(';') +
        1;

    // Check if the import statements already exist in the file
    for (var importStatement in importStatements) {
      if (!networkManagerProviderWrapperFileContent
          .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
        // Add the import statement after the last import
        networkManagerProviderWrapperFileContent =
            networkManagerProviderWrapperFileContent.substring(
                    0, endOfLastImport) +
                '\n' +
                importStatement +
                networkManagerProviderWrapperFileContent
                    .substring(endOfLastImport);
        endOfLastImport += importStatement.length + 1;
        print('The import statement was added: $importStatement');
      } else {
        print('The import statement already exists.');
      }
    }
  }

  // Normalize the whitespace in the file content and the remote repository of DataModel
  var normalizedFileContent =
      networkManagerProviderWrapperFileContent.replaceAll(RegExp(r'\s'), '');

// Check if the local repository providers already exist in the file
  for (var repositoryProvider in localRepositories) {
    var normalizedLocalRepositoryOfDataModel =
        repositoryProvider.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent.contains(normalizedLocalRepositoryOfDataModel)) {
      // Add the local repository provider to the file
      networkManagerProviderWrapperFileContent =
          networkManagerProviderWrapperFileContent.replaceFirst(
              '];', '  $repositoryProvider\n];');
      print('The local repository provider was added: $repositoryProvider');
    } else {
      print('The local repository provider already exists.');
    }
  }

// Check if the remote repository of DataModel already exists in the file
  for (var remoteRepositoryOfRegistrationDelivery
      in remoteRepositoriesOfRegistrationDelivery) {
    var normalizedRemoteRepositoryOfRegistrationDelivery =
        remoteRepositoryOfRegistrationDelivery.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent
        .contains(normalizedRemoteRepositoryOfRegistrationDelivery)) {
      // Add the remote repository of DataModel to the _getRemoteRepositories method
      var replacementString =
          networkManagerProviderWrapperFileContent.contains(']);')
              ? '  $remoteRepositoryOfRegistrationDelivery\n]);'
              : '  $remoteRepositoryOfRegistrationDelivery\n]);';
      networkManagerProviderWrapperFileContent =
          networkManagerProviderWrapperFileContent.replaceFirst(
              ']);', replacementString);
      print(
          'The remote repository of DataModel was added: $remoteRepositoryOfRegistrationDelivery');
    } else {
      print('The remote repository of DataModel already exists.');
    }
  }

  // Write the updated content back to the file
  networkManagerProviderWrapperFile
      .writeAsStringSync(networkManagerProviderWrapperFileContent);
}
