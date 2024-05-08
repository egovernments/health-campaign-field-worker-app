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
  var appRoot = '$appDir/apps/health_campaign_field_worker_app/lib';
  var localizationDelegatesFilePath =
      '$appRoot/utils/localization_delegates.dart';
  var blocDirectoryPath = '$appRoot/blocs/inventory';
  var blocFilePath = '$blocDirectoryPath/hcm_inventory_bloc.dart';
  var networkManagerProviderWrapperFilePath =
      '$appRoot/widgets/network_manager_provider_wrapper.dart';
  var opLogPath =
      '$appDir/apps/health_campaign_field_worker_app/lib/data/local_store/no_sql/schema/hcm_oplog.dart';
  var typeDefPath = '$appRoot/utils/typedefs.dart';

  _createLocalizationDelegatesFile(localizationDelegatesFilePath);

  _createStockBlocFile(
      blocDirectoryPath: blocDirectoryPath, blocFilePath: blocFilePath);

  _addRepoToNetworkManagerProviderWrapper(
    networkManagerProviderWrapperFilePath:
        networkManagerProviderWrapperFilePath,
  );

  _createOpLogCaseConditions(opLogPath: opLogPath);

  _createTypeDefFile(typeDefPath: typeDefPath);

  // Run dart format on the hcm_oplog.dart file
  Process.run('dart', ['format', localizationDelegatesFilePath])
      .then((ProcessResult results) {
    print(results.stdout);
  });

  Process.run('dart', ['format', blocFilePath]).then((ProcessResult results) {
    print(results.stdout);
  });

  Process.run('dart', ['format', networkManagerProviderWrapperFilePath])
      .then((ProcessResult results) {
    print(results.stdout);
  });

  Process.run('dart', ['format', opLogPath]).then((ProcessResult results) {
    print(results.stdout);
  });

  Process.run('dart', ['format', typeDefPath]).then((ProcessResult results) {
    print(results.stdout);
  });
}

void _createTypeDefFile({required String typeDefPath}) {
  var typeDef = [
    "typedef StockDataRepository = DataRepository<StockModel, StockSearchModel>;",
    "typedef StockReconciliationDataRepository = DataRepository<StockReconciliationModel, StockReconciliationSearchModel>;"
  ];

  // Read the typedefs file
  var typedefFile = File(typeDefPath);
  var typedefFileContent = typedefFile.readAsStringSync();

  // Normalize the whitespace in the file content and the typedefs
  var normalizedFileContent = typedefFileContent.replaceAll(RegExp(r'\s'), '');

  // Check if the typedefs already exist in the file
  for (var typedefStatement in typeDef) {
    var normalizedTypedef = typedefStatement.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent.contains(normalizedTypedef)) {
      // Add the typedef to the end of the file
      typedefFileContent = '$typedefFileContent\n$typedefStatement';
      print('The typedef was added: $typedefStatement');
    } else {
      print('The typedef already exists.');
    }
  }

  // Write the updated content back to the file
  typedefFile.writeAsStringSync(typedefFileContent);
}

void _createOpLogCaseConditions({required String opLogPath}) {
  Process.run('chmod', ['+r', opLogPath]);

  final filePath = opLogPath;

  final caseConditions = {
    'stock':
        'final entity = StockModelMapper.fromJson(entityString);\n    return entity;',
    'stockReconciliation':
        'final entity = StockReconciliationModelMapper.fromJson(entityString);\n    return entity;',
  };

  final file = File(filePath);
  final lines = file.readAsLinesSync();

  for (var entry in caseConditions.entries) {
    final caseCondition = createCaseCondition(entry.key, entry.value);
    insertCaseCondition(lines, caseCondition);
  }

  file.writeAsStringSync(lines.join('\n'));
}

void _addRepoToNetworkManagerProviderWrapper(
    {required String networkManagerProviderWrapperFilePath}) {
  // Define the import statements and repository providers
  var importStatements = [
    "import 'package:inventory_management/inventory_management.dart';",
    "import '../data/repositories/remote/stock.dart';",
    "import '../data/repositories/remote/stock_reconciliation.dart';"
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

void _createStockBlocFile(
    {required String blocDirectoryPath, required String blocFilePath}) {
// Check if the Bloc file already exists
  var blocFile = File(blocFilePath);
  if (!blocFile.existsSync()) {
    // Create the directory
    Directory(blocDirectoryPath).createSync(recursive: true);

    // Write the skeleton Bloc class to the file
    blocFile.writeAsStringSync('''
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/inventory_management.dart';

class HcmInventoryBloc extends InventoryListener {
  @override
  void callSyncMethod() {
    // TODO: implement callSyncMethod
  }

  @override
  Future<List<InventoryFacilityModel>> fetchFacilitiesForProjectId() {
    // TODO: implement fetchFacilitiesForProjectId
    throw UnimplementedError();
  }

  @override
  Future<Map<String, List<StockModel>>> fetchInventoryReports({required InventoryReportType reportType, required String facilityId, required String productVariantId}) {
    // TODO: implement fetchInventoryReports
    throw UnimplementedError();
  }

  @override
  Future<List<ProductVariantModel>> fetchProductVariants() {
    // TODO: implement fetchProductVariants
    throw UnimplementedError();
  }

  @override
  Future<List<List<StockModel>>> fetchStockReconciliationDetails({required String productVariantId, required String facilityId}) {
    // TODO: implement fetchStockReconciliationDetails
    throw UnimplementedError();
  }

  @override
  Future<StockReconciliationReport> handleStockReconciliationReport({required String facilityId, required String productVariantId}) {
    // TODO: implement handleStockReconciliationReport
    throw UnimplementedError();
  }

  @override
  Future<bool> saveStockDetails(SaveStockDetails saveStockDetails) {
    // TODO: implement saveStockDetails
    throw UnimplementedError();
  }

  @override
  Future<bool> saveStockReconciliationDetails(SaveStockReconciliationModel stockReconciliationModel) {
    // TODO: implement saveStockReconciliationDetails
    throw UnimplementedError();
  }
}
''');
    print('File $blocFilePath created.');
  } else {
    print('File $blocFilePath already exists. Not modifying the content.');
  }
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