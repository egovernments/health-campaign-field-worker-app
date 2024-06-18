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
  var syncServiceMapperFilePath =
      appRoot + '/data/repositories/sync_service_mapper.dart';
  var homeFilePath = appRoot + '/pages/home.dart';
  var extensionsFilePath = appRoot + '/utils/extensions/extensions.dart';
  var contextUtilityFilePath =
      appRoot + '/utils/extensions/context_utility.dart';

  // Set boundary in the context utility file
  _setBoundaryInContextUtilityFile(extensionsFilePath, contextUtilityFilePath);

  // Add the scanner bloc to the app file
  _addScannerBlocToAppFile(appFile);

  // Add hf_referral to home file
  _updateHome(homeFilePath);

  // Add referral_recon routes and import to the router file
  _addReferralReconRoutesAndImportToRouterFile(routerFilePath);

  // Add new case statements to the entity_mapper.dart file
  _updateEntityMapperFile(entityMapperFilePath);

  // update the localization_delegates.dart file
  _createLocalizationDelegatesFile(localizationDelegatesFilePath);

  // Add referral_recon related import and initialization to the network_manager_provider_wrapper.dart file
  _addRepoToNetworkManagerProviderWrapper(
      networkManagerProviderWrapperFilePath:
          networkManagerProviderWrapperFilePath);

  // Add referral_recon related import and initialization to the constants.dart file
  _addReferralReconConstantsToConstantsFile(
      constantsFilePath: constantsFilePath);

  // Add referral_recon related import and initialization to the utils.dart file
  _addReferralReconMapperToUtilsFile(utilsFilePath: utilsFilePath);

  // Update the sync_service_mapper.dart file
  _updateSyncServiceMapperFile(syncServiceMapperFilePath);

  _formatFiles([
    localizationDelegatesFilePath,
    networkManagerProviderWrapperFilePath,
    constantsFilePath,
    utilsFilePath,
    routerFilePath,
    entityMapperFilePath,
    syncServiceMapperFilePath,
    homeFilePath,
    extensionsFilePath,
    contextUtilityFilePath,
    appFile,
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

void _setBoundaryInContextUtilityFile(
    String extensionsFilePath, String contextUtilityFilePath) {
  // Define the lines to be added
  var importStatement =
      "import 'package:referral_reconciliation/referral_reconciliation.dart';";
  var boundaryStatement =
      'ReferralReconSingleton().setBoundary(boundary: selectedBoundary);';

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

void _updateHome(String homeFilePath) {
  var importStatement = '''
      import 'package:referral_reconciliation/referral_reconciliation.dart';
      import 'package:referral_reconciliation/router/referral_reconciliation_router.gm.dart';
      ''';

  var homeItemsData = '''
    i18.home.beneficiaryReferralLabel:
          homeShowcaseData.hfBeneficiaryReferral.buildWith(
        child: HomeItemCard(
          icon: Icons.supervised_user_circle_rounded,
          label: i18.home.beneficiaryReferralLabel,
          onPressed: () async {
            context.read<AppInitializationBloc>().state.maybeWhen(
                  orElse: () {},
                  initialized: (AppConfiguration appConfiguration, _) {
                    context.router.push(SearchReferralReconciliationsRoute());
                  },
                );
          },
        ),
      ),
  ''';

  var showCaseData = '''
  i18.home.beneficiaryReferralLabel:
          homeShowcaseData.hfBeneficiaryReferral.showcaseKey,
  ''';

  var itemsLabel = '''
  i18.home.beneficiaryReferralLabel,
  ''';

  // Define the data to be added
  var singletonData = '''
    ReferralReconSingleton().setInitialData(
          userName: context.loggedInUser.name ?? '',
          userUUid: context.loggedInUserUuid,
          projectId: context.selectedProject.id,
          projectName: context.selectedProject.name,
          roleCode: RolesType.healthFacilityWorker.toValue(),
          appVersion: Constants().version,
          tenantId: envConfig.variables.tenantId,
          validIndividualAgeForCampaign: ValidIndividualAgeForCampaign(
            validMinAge: context.selectedProjectType?.validMinAge ?? 3,
            validMaxAge: context.selectedProjectType?.validMaxAge ?? 64,
          ),
          genderOptions:
              appConfiguration.genderOptions?.map((e) => e.code).toList() ?? [],
          cycles: context.cycles,
          referralReasons:
              appConfiguration.referralReasons?.map((e) => e.code).toList() ??
                  [],
          checklistTypes:
              appConfiguration.checklistTypes?.map((e) => e.code).toList() ??
                  [],
        );
  ''';

  var localRepoData = '''
    context.read<LocalRepository<HFReferralModel, HFReferralSearchModel>>(),
  ''';

  var remoteRepoData = '''
    context.read<RemoteRepository<HFReferralModel, HFReferralSearchModel>>(),
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

void _updateSyncServiceMapperFile(String syncServiceMapperFilePath) {
  // Define the import statement and the new case statements
  var importStatement =
      "import 'package:referral_reconciliation/referral_reconciliation.dart';";
  var newCases = '''
         case DataModelType.hFReferral:
            responseEntities = await remote.search(
              HFReferralSearchModel(
                clientReferenceId: entities
                    .whereType<HFReferralModel>()
                    .map((e) => e.clientReferenceId)
                    .whereNotNull()
                    .toList(),
              ),
            );

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as HFReferralModel;
              final responseEntity = responseEntities
                  .whereType<HFReferralModel>()
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
                    nonRecoverableError: entity.nonRecoverableError,
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
  ''';

  // Check if the sync_service_mapper file exists
  var syncServiceMapperFile = File(syncServiceMapperFilePath);

  if (!syncServiceMapperFile.existsSync()) {
    print(
        'Error: Sync Service Mapper file does not exist at path: $syncServiceMapperFilePath');
    return;
  }

  // Read the sync_service_mapper file
  var syncServiceMapperFileContent = syncServiceMapperFile.readAsStringSync();

  // Check if the import statement already exists and add it if not
  if (!syncServiceMapperFileContent.contains(importStatement)) {
    syncServiceMapperFileContent =
        importStatement + '\n' + syncServiceMapperFileContent;
    print('The import statement was added to sync_service_mapper.dart.');
  } else {
    print('The import statement already exists in sync_service_mapper.dart.');
  }

  // Insert the new case statements
  if (!syncServiceMapperFileContent.contains('DataModelType.stock') &&
      !syncServiceMapperFileContent
          .contains('DataModelType.stockReconciliation')) {
    // Find the position to insert the new cases within the switch statement
    var switchIndex = syncServiceMapperFileContent
        .indexOf('switch (typeGroupedEntity.key) {');
    if (switchIndex != -1) {
      var caseInsertionIndex =
          syncServiceMapperFileContent.indexOf('default:', switchIndex);
      if (caseInsertionIndex != -1) {
        syncServiceMapperFileContent =
            syncServiceMapperFileContent.substring(0, caseInsertionIndex) +
                newCases +
                '\n' +
                syncServiceMapperFileContent.substring(caseInsertionIndex);
        print('The new cases were added to sync_service_mapper.dart.');

        // Write the updated content back to the file
        syncServiceMapperFile.writeAsStringSync(syncServiceMapperFileContent);
      } else {
        print(
            'Error: Could not find the default case in the switch statement in sync_service_mapper.dart.');
        return;
      }
    } else {
      print('Error: Could not find the switch statement in sync_service_mapper.dart.');
      return;
    }
  } else {
    print('The new cases already exist in sync_service_mapper.dart.');
  }
}

void _updateEntityMapperFile(String entityMapperFilePath) {
  // Define the import statement and new case statements
  var importStatement =
      "import 'package:referral_reconciliation/models/entities/hf_referral.dart';";
  var newCases = '''
      case "hFReferral":
        final entity = HFReferralModelMapper.fromJson(entityString);
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
  if (!entityMapperFileContent.contains('case "hFReferral":')) {
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

void _addReferralReconRoutesAndImportToRouterFile(String routerFilePath) {
  // Define the referral_recon route lines
  var referralReconRoutes = '''
        // Referral Reconciliation Route
        AutoRoute(
            page: HFCreateReferralWrapperRoute.page,
            path: 'hf-referral',
            children: [
              AutoRoute(
                  page: ReferralFacilityRoute.page,
                  path: 'facility-details',
                  initial: true),
              AutoRoute(
                  page: RecordReferralDetailsRoute.page,
                  path: 'referral-details'),
              AutoRoute(
                page: ReferralReasonChecklistRoute.page,
                path: 'referral-checklist-create',
              ),
              AutoRoute(
                page: ReferralReasonChecklistPreviewRoute.page,
                path: 'referral-checklist-view',
              ),
            ]),
        AutoRoute(
          page: ReferralReconAcknowledgementRoute.page,
          path: 'referral-acknowledgement',
        ),
        AutoRoute(
          page: ReferralReconProjectFacilitySelectionRoute.page,
          path: 'referral-project-facility',
        ),
        AutoRoute(
          page: SearchReferralReconciliationsRoute.page,
          path: 'search-referrals',
        ),
  ''';

  // Define the import statement
  var importStatement1 =
      "import 'package:referral_reconciliation/router/referral_reconciliation_router.dart';";
  // Define the import statement
  var importStatement2 =
      "import 'package:referral_reconciliation/router/referral_reconciliation_router.gm.dart';";

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
  // Check if the referral_reconRoute module already exists
  if (!routerFileContent.contains('ReferralReconciliationRoute')) {
    // Find the position to insert the module
    var moduleInsertionIndex = routerFileContent.indexOf('@AutoRouterConfig(');
    if (moduleInsertionIndex != -1) {
      var endOfModulesIndex =
          routerFileContent.indexOf(']', moduleInsertionIndex);
      if (endOfModulesIndex != -1) {
        var modulesEndIndex =
            routerFileContent.lastIndexOf(']', endOfModulesIndex);
        routerFileContent = routerFileContent.substring(0, modulesEndIndex) +
            ' ReferralReconciliationRoute,' +
            routerFileContent.substring(modulesEndIndex);
        print('The referral_reconRoute module was added.');
      } else {
        print('Error: Could not find the end of the modules list.');
        return;
      }
    } else {
      print('Error: Could not find @AutoRouterConfig annotation.');
      return;
    }
  } else {
    print('The ReferralReconciliationRoute module already exists.');
  }

  // Check if the referral_recon routes already exist in the file
  if (!normalizedFileContent
      .contains(referralReconRoutes.replaceAll(RegExp(r'\s'), ''))) {
    // Find the position to insert the routes
    var insertionIndex = routerFileContent
        .indexOf('// INFO : Need to add Router of package Here');
    if (insertionIndex != -1) {
      routerFileContent = routerFileContent.substring(0, insertionIndex) +
          '// INFO : Need to add Router of package Here\n' +
          referralReconRoutes +
          routerFileContent.substring(insertionIndex +
              '// INFO : Need to add Router of package Here'.length);
      print('The referral_recon routes were added.');

      // Write the updated content back to the file
      routerFile.writeAsStringSync(routerFileContent);
    } else {
      print('Error: Could not find the insertion point.');
      return;
    }
  } else {
    print('The referral_recon routes already exist.');
  }
}

void _addReferralReconMapperToUtilsFile({required String utilsFilePath}) {
  // Define the referral Reconciliation related lines
  var referralReconciliationImportStatement = [
    "import 'package:referral_reconciliation/referral_reconciliation.dart' as referral_reconciliation_mappers;"
  ];
  var referralReconciliationInitializationStatement =
      "Future(() => referral_reconciliation_mappers.initializeMappers()),";

  // Check if the utils.dart file exists
  var utilsFile = File(utilsFilePath);

  // Read the utils.dart file
  var utilsFileContent = utilsFile.readAsStringSync();

  // Normalize the whitespace in the file content
  var normalizedFileContent = utilsFileContent.replaceAll(RegExp(r'\s'), '');

  // Check if the import statement and delegate already exist in the file
  // If not, add them to the file
  if (!normalizedFileContent.contains(
      referralReconciliationImportStatement[0].replaceAll(RegExp(r'\s'), ''))) {
    var libraryIndex = utilsFileContent.indexOf('library app_utils;');
    if (libraryIndex != -1) {
      var endOfLibrary = libraryIndex +
          utilsFileContent.substring(libraryIndex).indexOf(';') +
          1;
      utilsFileContent = utilsFileContent.substring(0, endOfLibrary + 1) +
          '\n' +
          referralReconciliationImportStatement[0] +
          utilsFileContent.substring(endOfLibrary + 1);
      print('The import statement was added.');
    }
  } else {
    print('The import statement already exists.');
  }

  if (!utilsFileContent
      .contains(referralReconciliationInitializationStatement)) {
    // Add the referral_recon related initialization statement to the file
    var initializeAllMappersIndex =
        utilsFileContent.indexOf('initializeAllMappers() async {');
    if (initializeAllMappersIndex == -1) {
      print(
          'Error: Could not find a place to insert the referral_recon initialization statement.');
      return;
    }
    var endOfInitializeAllMappers = initializeAllMappersIndex +
        utilsFileContent.substring(initializeAllMappersIndex).indexOf(']') +
        1;
    utilsFileContent =
        utilsFileContent.substring(0, endOfInitializeAllMappers - 1) +
            '\n    ' +
            referralReconciliationInitializationStatement +
            utilsFileContent.substring(endOfInitializeAllMappers - 1);
    print('referral_recon initialization statement added to utils.dart');
  }

  // Write the updated content back to the utils.dart file
  utilsFile.writeAsStringSync(utilsFileContent);
}

void _addReferralReconConstantsToConstantsFile(
    {required String constantsFilePath}) {
  // Define the import statements
  var importStatements = [
    "import 'package:referral_reconciliation/referral_reconciliation.dart';",
  ];

  // Define the referralReconciliation configuration
  var referralReconciliationConfiguration = '''
      ReferralReconSingleton().setTenantId(envConfig.variables.tenantId);
  ''';

  // Define the referral_reconciliation related lines
  var referralReconciliationLocalRepositories = '''
    HFReferralLocalRepository(sql, HFReferralOpLogManager(isar)),
  ''';
  var referralReconciliationRemoteRepositories = '''
    if (value == DataModelType.hFReferral)
    HFReferralRemoteRepository(dio, actionMap: actions),
  ''';

  // Read the constants.dart file
  var constantsFile = File(constantsFilePath);
  var constantsFileContent = constantsFile.readAsStringSync();

  // Normalize the whitespace in the file content and the referral reconciliation configuration
  var normalizedFileContent =
      constantsFileContent.replaceAll(RegExp(r'\s'), '');
  var normalizedReferralReconciliationConfiguration =
      referralReconciliationConfiguration.replaceAll(RegExp(r'\s'), '');

  // Check if the import statements already exist in the file
  for (var importStatement in importStatements) {
    if (!normalizedFileContent
        .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
      // Add the import statement at the top of the file
      constantsFileContent = importStatement + '\n' + constantsFileContent;
      print('The import statement was added: $importStatement');
    }
  }

  // Check if the attendance configuration already exists in the file
  // If not, add it to the file
  if (!normalizedFileContent
      .contains(normalizedReferralReconciliationConfiguration)) {
    // Find the setInitialDataOfPackages method and add the attendance configuration inside it
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
              '\n  $normalizedReferralReconciliationConfiguration' +
              constantsFileContent.substring(endOfSetInitialDataOfPackages - 1);
      print('The attendance configuration was added.');
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
            referralReconciliationLocalRepositories +
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
        referralReconciliationRemoteRepositories +
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
    "import 'package:referral_reconciliation/referral_reconciliation.dart';",
  ];
  var localRepositories = [
    "RepositoryProvider<\n          LocalRepository<HFReferralModel,\n              HFReferralSearchModel>>(\n        create: (_) => HFReferralLocalRepository(\n          sql,\n          HFReferralOpLogManager(isar),\n        ),\n      ),",
  ];

// Define the remote repositories of referral reconciliation
  var remoteRepositoriesOfReferralReconciliation = [
    "if (value == DataModelType.hFReferral)\n"
        "  RepositoryProvider<\n"
        "      RemoteRepository<HFReferralModel,\n"
        "          HFReferralSearchModel>>(\n"
        "    create: (_) =>\n"
        "        HFReferralRemoteRepository(dio, actionMap: actions),\n"
        "  )"
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
      if (!networkManagerProviderWrapperFileContent.contains(importStatement)) {
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
      }
    }
  }

  // Normalize the whitespace in the file content and the remote repository of referral reconciliation
  var normalizedFileContent =
      networkManagerProviderWrapperFileContent.replaceAll(RegExp(r'\s'), '');

// Check if the local repository providers already exist in the file
  for (var repositoryProvider in localRepositories) {
    var normalizedLocalRepositoryOfReferralReconciliation =
        repositoryProvider.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent
        .contains(normalizedLocalRepositoryOfReferralReconciliation)) {
      // Add the local repository provider to the file
      networkManagerProviderWrapperFileContent =
          networkManagerProviderWrapperFileContent.replaceFirst(
              '];', '  $repositoryProvider\n];');
      print('The local repository provider was added: $repositoryProvider');
    } else {
      print('The local repository provider already exists.');
    }
  }

// Check if the remote repository of referral reconciliation already exists in the file
  for (var remoteRepositoryOfReferralReconciliation
      in remoteRepositoriesOfReferralReconciliation) {
    var normalizedRemoteRepositoryOfReferralReconciliation =
        remoteRepositoryOfReferralReconciliation.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent
        .contains(normalizedRemoteRepositoryOfReferralReconciliation)) {
      // Add the remote repository of referral reconciliation to the _getRemoteRepositories method
      var replacementString =
          networkManagerProviderWrapperFileContent.contains(']);')
              ? '  $remoteRepositoryOfReferralReconciliation,\n]);'
              : '  $remoteRepositoryOfReferralReconciliation\n]);';
      networkManagerProviderWrapperFileContent =
          networkManagerProviderWrapperFileContent.replaceFirst(
              ']);', replacementString);
      print(
          'The remote repository of referral reconciliation was added: $remoteRepositoryOfReferralReconciliation');
    } else {
      print(
          'The remote repository of referral reconciliation  already exists.');
    }
  }

  // Write the updated content back to the file
  networkManagerProviderWrapperFile
      .writeAsStringSync(networkManagerProviderWrapperFileContent);
}

void _createLocalizationDelegatesFile(String localizationDelegatesFilePath) {
  // Define the import statement and delegate for localization
  var importStatement =
      "import 'package:referral_reconciliation/blocs/app_localization.dart' as referral_reconciliation_localization;";
  var delegate =
      "referral_reconciliation_localization.ReferralReconLocalization.getDelegate(getLocalizationString(isar,selectedLocale,),appConfig.languages!,),";

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
