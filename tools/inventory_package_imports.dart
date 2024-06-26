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

void main() {
  var appDir = Directory.current.path;

  // Define the paths
  var appRoot = appDir + '/apps/health_campaign_field_worker_app/lib';
  var appFile = '$appRoot/app.dart';
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

  // Add the inventory repositories to the network manager provider wrapper
  _addRepoToNetworkManagerProviderWrapper(
    networkManagerProviderWrapperFilePath:
        networkManagerProviderWrapperFilePath,
  );

  // Add the inventory constants to the constants file
  _addInventoryConstantsToConstantsFile(constantsFilePath: constantsFilePath);

  // Add the inventory mappers to the utils file
  _addInventoryMapperToUtilsFile(utilsFilePath: utilsFilePath);

  // Add inventory routes and import to the router file
  _addInventoryRoutesAndImportToRouterFile(routerFilePath);

  // Add new case statements to the entity_mapper.dart file
  _updateEntityMapperFile(entityMapperFilePath);

  // Update the sync_down.dart file
  _updateSyncDownFile(syncDownFilePath);

  // Add inventory to home file
  _updateHome(homeFilePath);

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

void _setBoundaryInContextUtilityFile(
    String extensionsFilePath, String contextUtilityFilePath) {
  // Define the lines to be added
  var importStatement =
      "import 'package:inventory_management/inventory_management.dart';";
  var boundaryStatement =
      'InventorySingleton().setBoundaryName(boundaryName: selectedBoundary.name!);';

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
      import 'package:inventory_management/inventory_management.dart';
      import 'package:inventory_management/router/inventory_router.gm.dart';
      ''';

  var homeItemsData = '''
    i18.home.manageStockLabel:
        homeShowcaseData.warehouseManagerManageStock.buildWith(
      child: HomeItemCard(
        icon: Icons.store_mall_directory,
        label: i18.home.manageStockLabel,
        onPressed: () {
          context.read<AppInitializationBloc>().state.maybeWhen(
                orElse: () {},
                initialized: (AppConfiguration appConfiguration, _) {
                  context.router.push(ManageStocksRoute());
                },
              );
        },
      ),
    ),
    i18.home.stockReconciliationLabel:
        homeShowcaseData.wareHouseManagerStockReconciliation.buildWith(
      child: HomeItemCard(
        icon: Icons.menu_book,
        label: i18.home.stockReconciliationLabel,
        onPressed: () {
          context.router.push(StockReconciliationRoute());
        },
      ),
    ),
    i18.home.viewReportsLabel: homeShowcaseData.inventoryReport.buildWith(
      child: HomeItemCard(
        icon: Icons.announcement,
        label: i18.home.viewReportsLabel,
        onPressed: () {
          context.router.push(InventoryReportSelectionRoute());
        },
      ),
    ),
  ''';

  var showCaseData = '''
  i18.home.manageStockLabel:
     homeShowcaseData.warehouseManagerManageStock.showcaseKey,
  i18.home.stockReconciliationLabel:
     homeShowcaseData.wareHouseManagerStockReconciliation.showcaseKey,
  i18.home.viewReportsLabel: homeShowcaseData.inventoryReport.showcaseKey,
  ''';

  var itemsLabel = '''
  i18.home.manageStockLabel,
  i18.home.stockReconciliationLabel,
  i18.home.viewReportsLabel,
  ''';

  // Define the data to be added
  var singletonData = '''
    InventorySingleton().setInitialData(
      isWareHouseMgr: context.loggedInUserRoles
          .where(
              (role) => role.code == RolesType.warehouseManager.toValue())
          .toList()
          .isNotEmpty,
      isDistributor: context.loggedInUserRoles
          .where(
            (role) => role.code == RolesType.distributor.toValue(),
          )
          .toList()
          .isNotEmpty,
      projectId: context.projectId,
      loggedInUserUuid: context.loggedInUserUuid,
      transportTypes: appConfiguration.transportTypes
          ?.map((e) => InventoryTransportTypes()
            ..name = e.code
            ..code = e.code)
          .toList(),
    );
  ''';

  var localRepoData = '''
    context.read<LocalRepository<StockModel, StockSearchModel>>(),
    context.read<
        LocalRepository<StockReconciliationModel,
            StockReconciliationSearchModel>>(),
  ''';

  var remoteRepoData = '''
    context.read<RemoteRepository<StockModel, StockSearchModel>>(),
    context.read<
        RemoteRepository<StockReconciliationModel,
            StockReconciliationSearchModel>>(),
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

void _updateSyncDownFile(String syncDownFilePath) {
  // Define the import statement and the new case statements
  var importStatement =
      "import 'package:inventory_management/inventory_management.dart';";
  var newCases = '''
          case DataModelType.stock:
            responseEntities = await remote.search(
              StockSearchModel(
                clientReferenceId: entities
                    .whereType<StockModel>()
                    .map((e) => e.clientReferenceId)
                    .whereNotNull()
                    .toList(),
              ),
            );

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as StockModel;
              final responseEntity =
                  responseEntities.whereType<StockModel>().firstWhereOrNull(
                        (e) => e.clientReferenceId == entity.clientReferenceId,
                      );

              final serverGeneratedId = responseEntity?.id;
              final rowVersion = responseEntity?.rowVersion;

              if (serverGeneratedId != null) {
                await local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId!,
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

          case DataModelType.stockReconciliation:
            responseEntities =
                await remote.search(StockReconciliationSearchModel(
              clientReferenceId: entities
                  .whereType<StockReconciliationModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
            ));

            for (var element in operationGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as StockReconciliationModel;
              final responseEntity = responseEntities
                  .whereType<StockReconciliationModel>()
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
  if (!syncDownFileContent.contains(importStatement)) {
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
      "import 'package:inventory_management/inventory_management.dart';";
  var newCases = '''
      case "stock":
        final entity = StockModelMapper.fromJson(entityString);
        return entity;

      case "stockReconciliation":
        final entity = StockReconciliationModelMapper.fromJson(entityString);
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
  if (!entityMapperFileContent.contains('case "stock":') &&
      !entityMapperFileContent.contains('case "stockReconciliation":')) {
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

void _addInventoryRoutesAndImportToRouterFile(String routerFilePath) {
  // Define the inventory route lines
  var inventoryRoutes = '''
    // Inventory Route
    AutoRoute(
      page: ManageStocksRoute.page,
      path: 'manage-stocks',
    ),
    AutoRoute(
      page: RecordStockWrapperRoute.page,
      path: 'record-stock',
      children: [
        AutoRoute(
          page: WarehouseDetailsRoute.page,
          path: 'warehouse-details',
          initial: true,
        ),
        AutoRoute(page: StockDetailsRoute.page, path: 'details'),
      ],
    ),
    AutoRoute(
      page: InventoryFacilitySelectionRoute.page,
      path: 'inventory-select-facilities',
    ),
    AutoRoute(
      page: StockReconciliationRoute.page, path: 'stock-reconciliation',
    ),
    AutoRoute(
      page: InventoryReportSelectionRoute.page,
      path: 'inventory-report-selection',
    ),
    AutoRoute(
      page: InventoryReportDetailsRoute.page,
      path: 'inventory-report-details',
    ),
    AutoRoute(
      page: InventoryAcknowledgementRoute.page,
      path: 'inventory-acknowledgement',
    ),
  ''';

  // Define the import statement
  var importStatement1 =
      "import 'package:inventory_management/router/inventory_router.gm.dart';";
  // Define the import statement
  var importStatement2 =
      "import 'package:inventory_management/router/inventory_router.dart';";

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
  // Check if the InventoryRoute module already exists
  if (!routerFileContent.contains('InventoryRoute')) {
    // Find the position to insert the module
    var moduleInsertionIndex = routerFileContent.indexOf('@AutoRouterConfig(');
    if (moduleInsertionIndex != -1) {
      var endOfModulesIndex =
          routerFileContent.indexOf(']', moduleInsertionIndex);
      if (endOfModulesIndex != -1) {
        var modulesEndIndex =
            routerFileContent.lastIndexOf(']', endOfModulesIndex);
        routerFileContent = routerFileContent.substring(0, modulesEndIndex) +
            ' InventoryRoute,' +
            routerFileContent.substring(modulesEndIndex);
        print('The InventoryRoute module was added.');
      } else {
        print('Error: Could not find the end of the modules list.');
        return;
      }
    } else {
      print('Error: Could not find @AutoRouterConfig annotation.');
      return;
    }
  } else {
    print('The InventoryRoute module already exists.');
  }

  // Check if the inventory routes already exist in the file
  if (!normalizedFileContent
      .contains(inventoryRoutes.replaceAll(RegExp(r'\s'), ''))) {
    // Find the position to insert the routes
    var insertionIndex = routerFileContent
        .indexOf('// INFO : Need to add Router of package Here');
    if (insertionIndex != -1) {
      routerFileContent = routerFileContent.substring(0, insertionIndex) +
          '// INFO : Need to add Router of package Here\n' +
          inventoryRoutes +
          routerFileContent.substring(insertionIndex +
              '// INFO : Need to add Router of package Here'.length);
      print('The inventory routes were added.');

      // Write the updated content back to the file
      routerFile.writeAsStringSync(routerFileContent);
    } else {
      print('Error: Could not find the insertion point.');
      return;
    }
  } else {
    print('The inventory routes already exist.');
  }
}

void _addInventoryMapperToUtilsFile({required String utilsFilePath}) {
  // Define the inventory related lines
  var inventoryImportStatement = [
    "import 'package:inventory_management/inventory_management.init.dart' as inventory_mappers;"
  ];
  var inventoryInitializationStatement =
      "Future(() => inventory_mappers.initializeMappers()),";

  // Check if the utils.dart file exists
  var utilsFile = File(utilsFilePath);

  // Read the utils.dart file
  var utilsFileContent = utilsFile.readAsStringSync();

  // Normalize the whitespace in the file content
  var normalizedFileContent = utilsFileContent.replaceAll(RegExp(r'\s'), '');

  // Check if the import statement and delegate already exist in the file
  // If not, add them to the file
  if (!normalizedFileContent
      .contains(inventoryImportStatement[0].replaceAll(RegExp(r'\s'), ''))) {
    var libraryIndex = utilsFileContent.indexOf('library app_utils;');
    if (libraryIndex != -1) {
      var endOfLibrary = libraryIndex +
          utilsFileContent.substring(libraryIndex).indexOf(';') +
          1;
      utilsFileContent = utilsFileContent.substring(0, endOfLibrary + 1) +
          '\n' +
          inventoryImportStatement[0] +
          utilsFileContent.substring(endOfLibrary + 1);
      print('The import statement was added.');
    }
  } else {
    print('The import statement already exists.');
  }

  if (!utilsFileContent.contains(inventoryInitializationStatement)) {
    // Add the inventory related initialization statement to the file
    var initializeAllMappersIndex =
        utilsFileContent.indexOf('initializeAllMappers() async {');
    if (initializeAllMappersIndex == -1) {
      print(
          'Error: Could not find a place to insert the inventory initialization statement.');
      return;
    }
    var endOfInitializeAllMappers = initializeAllMappersIndex +
        utilsFileContent.substring(initializeAllMappersIndex).indexOf(']') +
        1;
    utilsFileContent =
        utilsFileContent.substring(0, endOfInitializeAllMappers - 1) +
            '\n    ' +
            inventoryInitializationStatement +
            utilsFileContent.substring(endOfInitializeAllMappers - 1);
    print('Inventory initialization statement added to utils.dart');
  }

  // Write the updated content back to the utils.dart file
  utilsFile.writeAsStringSync(utilsFileContent);
}

void _addInventoryConstantsToConstantsFile(
    {required String constantsFilePath}) {
  // Define the import statements
  var importStatements = [
    "import 'package:inventory_management/inventory_management.dart';",
  ];

  // Define the inventory configuration
  var inventoryConfiguration = '''
      InventorySingleton().setTenantId(tenantId: envConfig.variables.tenantId);
  ''';

  var localRepositories = [
    "StockLocalRepository(sql, StockOpLogManager(isar)),",
    "StockReconciliationLocalRepository(sql,StockReconciliationOpLogManager(isar),),",
  ];

  // Define the remote repositories of inventory
  var remoteRepositoriesOfInventory = [
    '''
    if (value == DataModelType.stock)
       StockRemoteRepository(dio, actionMap: actions),
    if (value == DataModelType.stockReconciliation)
       StockReconciliationRemoteRepository(dio, actionMap: actions),
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

  // Normalize the whitespace in the file content and the inventory configuration
  var normalizedFileContent =
      constantsFileContent.replaceAll(RegExp(r'\s'), '');
  var normalizedInventoryConfiguration =
      inventoryConfiguration.replaceAll(RegExp(r'\s'), '');

  // Check if the import statements already exist in the file
  for (var importStatement in importStatements) {
    if (!normalizedFileContent
        .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
      // Add the import statement at the top of the file
      constantsFileContent = importStatement + '\n' + constantsFileContent;
      print('The import statement was added: $importStatement');
    }
  }

  // Check if the inventory configuration already exists in the file
  // If not, add it to the file
  if (!normalizedFileContent.contains(normalizedInventoryConfiguration)) {
    // Find the setInitialDataOfPackages method and add the inventory configuration inside it
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
              '\n  $inventoryConfiguration' +
              constantsFileContent.substring(endOfSetInitialDataOfPackages - 1);
      print('The inventory configuration was added.');
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
        remoteRepositoriesOfInventory.join('\n') +
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
    "import 'package:inventory_management/inventory_management.dart';",
  ];
  var localRepositories = [
    "RepositoryProvider<\n          LocalRepository<StockModel,\n              StockSearchModel>>(\n        create: (_) => StockLocalRepository(\n          sql,\n          StockOpLogManager(isar),\n        ),\n      ),",
    "RepositoryProvider<\n          LocalRepository<StockReconciliationModel, StockReconciliationSearchModel>>(\n        create: (_) => StockReconciliationLocalRepository(\n          sql,\n          StockReconciliationOpLogManager(isar),\n        ),\n      ),",
  ];

  // Define the remote repositories of inventory
  var remoteRepositoriesOfInventory = [
    "if (value == DataModelType.stock)\n"
        "  RepositoryProvider<\n"
        "      RemoteRepository<StockModel,\n"
        "          StockSearchModel>>(\n"
        "    create: (_) =>\n"
        "        StockRemoteRepository(dio, actionMap: actions),\n"
        "  )",
    "if (value == DataModelType.stockReconciliation)\n"
        "  RepositoryProvider<\n"
        "      RemoteRepository<StockReconciliationModel,\n"
        "          StockReconciliationSearchModel>>(\n"
        "    create: (_) =>\n"
        "        StockReconciliationRemoteRepository(dio, actionMap: actions),\n"
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

  // Normalize the whitespace in the file content and the remote repository of inventory
  var normalizedFileContent =
      networkManagerProviderWrapperFileContent.replaceAll(RegExp(r'\s'), '');

// Check if the local repository providers already exist in the file
  for (var repositoryProvider in localRepositories) {
    var normalizedLocalRepositoryOfInventory =
        repositoryProvider.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent.contains(normalizedLocalRepositoryOfInventory)) {
      // Add the local repository provider to the file
      networkManagerProviderWrapperFileContent =
          networkManagerProviderWrapperFileContent.replaceFirst(
              '];', '  $repositoryProvider\n];');
      print('The local repository provider was added: $repositoryProvider');
    } else {
      print('The local repository provider already exists.');
    }
  }

  // Check if the remote repositories of inventory already exist in the file
  for (var remoteRepositoryOfInventory in remoteRepositoriesOfInventory) {
    var normalizedRemoteRepositoryOfInventory =
        remoteRepositoryOfInventory.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent
        .contains(normalizedRemoteRepositoryOfInventory)) {
      // Add the remote repository of inventory to the _getRemoteRepositories method
      var replacementString =
          networkManagerProviderWrapperFileContent.contains(']);')
              ? '  $remoteRepositoryOfInventory,\n]);'
              : '  $remoteRepositoryOfInventory\n]);';
      networkManagerProviderWrapperFileContent =
          networkManagerProviderWrapperFileContent.replaceFirst(
              ']);', replacementString);
      print(
          'The remote repository of inventory was added: $remoteRepositoryOfInventory');
    }
  }

  // Write the updated content back to the file
  networkManagerProviderWrapperFile
      .writeAsStringSync(networkManagerProviderWrapperFileContent);
}

void _createLocalizationDelegatesFile(String localizationDelegatesFilePath) {
  // Define the import statement and delegate for localization
  var importStatement =
      "import 'package:inventory_management/blocs/app_localization.dart'\n    as inventory_localization;";
  var delegate =
      "inventory_localization.InventoryLocalization.getDelegate(\n      getLocalizationString(\n        isar,\n        selectedLocale,\n      ),\n      appConfig.languages!,\n    ),";

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
