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
  var appRoot = '$appDir/apps/health_campaign_field_worker_app/lib';
  var localizationDelegatesFilePath =
      '$appRoot/utils/localization_delegates.dart';
  var networkManagerProviderWrapperFilePath =
      '$appRoot/widgets/network_manager_provider_wrapper.dart';
  var constantsFilePath = '$appRoot/utils/constants.dart';
  var utilsFilePath = '$appRoot/utils/utils.dart';

  _createLocalizationDelegatesFile(localizationDelegatesFilePath);

  _addRepoToNetworkManagerProviderWrapper(
      networkManagerProviderWrapperFilePath:
          networkManagerProviderWrapperFilePath);

  _addReferralReconConstantsToConstantsFile(
      constantsFilePath: constantsFilePath);

  _addReferralReconMapperToUtilsFile(utilsFilePath: utilsFilePath);

  // Run dart format on the localization_delegates.dart file
  Process.run('dart', ['format', localizationDelegatesFilePath])
      .then((ProcessResult results) {
    print(results.stdout);
  });

  // Run dart format on the network_manager_provider_wrapper.dart file
  Process.run('dart', ['format', networkManagerProviderWrapperFilePath])
      .then((ProcessResult results) {
    print(results.stdout);
  });

  // Run dart format on the constants.dart file
  Process.run('dart', ['format', constantsFilePath])
      .then((ProcessResult results) {
    print(results.stdout);
  });

  // Run dart format on the utils.dart file
  Process.run('dart', ['format', utilsFilePath]).then((ProcessResult results) {
    print(results.stdout);
  });
}

void _addReferralReconMapperToUtilsFile({required String utilsFilePath}) {
  // Define the referral Reconciliation related lines
  var referralReconciliationImportStatement = [
    "import 'package:referral_reconciliation/referral_reconciliation.dart' as referral_reconciliation_mappers;"
  ];
  var referralReconciliationInitializationStatement =
      "referral_reconciliation_mappers.initializeMappers();";

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
            referralReconciliationInitializationStatement +
            utilsFileContent.substring(endOfInitializeAllMappers - 1);
    print('Inventory initialization statement added to utils.dart');
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
// Referral Reconciliation related configuration
ReferralReconSingleton().setTenantId(envConfig.variables.tenantId);
  ''';

  // Define the referral_reconciliation related lines
  var referralReconciliationLocalRepositories = [
    'HFReferralLocalRepository(sql, HFReferralOpLogManager(isar)),',
  ];
  var referralReconciliationRemoteRepositories = [
    'if (value == DataModelType.hFReferral) HFReferralRemoteRepository(dio, actionMap: actions),',
  ];

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
      // Add the import statement after the last import
      constantsFileContent = constantsFileContent.substring(
              0, constantsFileContent.indexOf(';') + 1) +
          '\n' +
          importStatement +
          constantsFileContent.substring(constantsFileContent.indexOf(';') + 1);
      print('The import statement was added: $importStatement');
    }
  }

  // Check if the referral reconciliation configuration already exists in the file
  // If not, add it to the file
  if (!normalizedFileContent
      .contains(normalizedReferralReconciliationConfiguration)) {
    constantsFileContent =
        '$referralReconciliationConfiguration\n$constantsFileContent';
    print('The referral reconciliation configuration was added.');
  }

  // Check if the referral reconciliation local repositories already exist in the file
  for (var referralReconciliationLocalRepository
      in referralReconciliationLocalRepositories) {
    var normalizedReferralReconciliationLocalRepository =
        referralReconciliationLocalRepository.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent
        .contains(normalizedReferralReconciliationLocalRepository)) {
      // Add the referral reconciliation local repository to the file
      constantsFileContent = constantsFileContent.replaceFirst(
          '];', '  $referralReconciliationLocalRepository\n];');
      print(
          'The referral reconciliation local repository was added: $referralReconciliationLocalRepository');
    } else {
      print('The referral reconciliation local repository already exists.');
    }
  }

  // Check if the referral reconciliation remote repositories already exist in the file
  for (var referralReconciliationRemoteRepository
      in referralReconciliationRemoteRepositories) {
    var normalizedReferralReconciliationRemoteRepository =
        referralReconciliationRemoteRepository.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent
        .contains(normalizedReferralReconciliationRemoteRepository)) {
      // Add the referral reconciliation remote repository to the _getRemoteRepositories method
      var replacementString = constantsFileContent.contains(']);')
          ? '  $referralReconciliationRemoteRepository,\n]);'
          : '  $referralReconciliationRemoteRepository\n]);';
      constantsFileContent =
          constantsFileContent.replaceFirst(']);', replacementString);
      print(
          'The referral reconciliation remote repository was added: $referralReconciliationRemoteRepository');
    } else {
      print('The referral reconciliation remote repository already exists.');
    }
  }
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
