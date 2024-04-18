import 'dart:io';

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

  // Define the import statement and delegate
  var importStatement =
      "import 'package:inventory_management/blocs/app_localization.dart'\n    as inventory_localization;";
  var delegate =
      "inventory_localization.InventoryLocalization.getDelegate(\n      getLocalizationString(\n        isar,\n        selectedLocale,\n      ),\n      appConfig.languages!,\n    ),";

  // Read the localization delegates file
  var localizationDelegatesFile = File(localizationDelegatesFilePath);
  var localizationDelegatesFileContent =
      localizationDelegatesFile.readAsStringSync();

  // Check if the import statement and delegate already exist in the file
  if (!localizationDelegatesFileContent.contains(importStatement)) {
    localizationDelegatesFileContent =
        '$importStatement\n$localizationDelegatesFileContent';
    print('The import statement was added.');
  }

  if (!localizationDelegatesFileContent.contains(delegate)) {
    localizationDelegatesFileContent =
        localizationDelegatesFileContent.replaceFirst('];', '  $delegate\n];');
    print('The delegate was added.');
  }

  // Write the updated content back to the file
  localizationDelegatesFile.writeAsStringSync(localizationDelegatesFileContent);
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

  // Define the import statements and repository providers
  var importStatements = [
    "import '../data/repositories/local/stock.dart';",
    "import '../data/repositories/local/stock_reconciliation.dart';",
    "import '../data/repositories/remote/stock.dart';",
    "import '../data/repositories/remote/stock_reconciliation.dart';"
  ];
  var localRepositories = [
    "RepositoryProvider<\n          LocalRepository<HcmStockModel,\n              HcmStockSearchModel>>(\n        create: (_) => StockLocalRepository(\n          sql,\n          StockOpLogManager(isar),\n        ),\n      ),",
    "RepositoryProvider<\n          LocalRepository<HcmStockReconciliationModel, HcmStockReconciliationSearchModel>>(\n        create: (_) => StockReconciliationLocalRepository(\n          sql,\n          StockReconciliationOpLogManager(isar),\n        ),\n      ),",
  ];

  // Define the remote repositories of attendance
  var remoteRepositoriesOfInventory = [
    "if (value == DataModelType.stock)\n"
        "  RepositoryProvider<\n"
        "      RemoteRepository<HcmStockModel,\n"
        "          HcmStockSearchModel>>(\n"
        "    create: (_) =>\n"
        "        StockRemoteRepository(dio, actionMap: actions),\n"
        "  )",
    "if (value == DataModelType.stockReconciliation)\n"
        "  RepositoryProvider<\n"
        "      RemoteRepository<HcmStockReconciliationModel,\n"
        "          HcmStockReconciliationSearchModel>>(\n"
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

  for (var repositoryProvider in localRepositories) {
    if (!networkManagerProviderWrapperFileContent
        .contains(repositoryProvider)) {
      networkManagerProviderWrapperFileContent =
          networkManagerProviderWrapperFileContent.replaceFirst(
              '];', '  $repositoryProvider\n];');
      print('The repository provider was added: $repositoryProvider');
    }
  }

  // Normalize the whitespace in the file content and the remote repository of attendance
  var normalizedFileContent =
      networkManagerProviderWrapperFileContent.replaceAll(RegExp(r'\s'), '');

  // Check if the remote repositories of attendance already exist in the file
  for (var remoteRepositoryOfInventory in remoteRepositoriesOfInventory) {
    var normalizedRemoteRepositoryOfAttendance =
        remoteRepositoryOfInventory.replaceAll(RegExp(r'\s'), '');

    if (!networkManagerProviderWrapperFileContent
        .contains(remoteRepositoryOfInventory)) {
      // Add the remote repository of attendance to the _getRemoteRepositories method
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

  // Run dart format on the oplog.dart file
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
}
