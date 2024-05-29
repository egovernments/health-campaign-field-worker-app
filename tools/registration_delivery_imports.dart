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
  var networkManagerProviderWrapperFilePath =
      '$appRoot/widgets/network_manager_provider_wrapper.dart';
  var constantsFilePath = '$appRoot/utils/constants.dart';
  var utilsFilePath = '$appRoot/utils/utils.dart';

  _addRepoToNetworkManagerProviderWrapper(
      networkManagerProviderWrapperFilePath:
          networkManagerProviderWrapperFilePath);

  _addRegNDeliveryConstantsToConstantsFile(
      constantsFilePath: constantsFilePath);

  _addRegNDeliveryMapperToUtilsFile(utilsFilePath: utilsFilePath);

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
  var dataModelConfiguration =
      "RegistrationDeliverySingleton().setTenantId(envConfig.variables.tenantId);";

  // Read the constants.dart file
  var constantsFile = File(constantsFilePath);
  var constantsFileContent = constantsFile.readAsStringSync();

  // Normalize the whitespace in the file content and the DataModel configuration
  var normalizedFileContent =
      constantsFileContent.replaceAll(RegExp(r'\s'), '');
  var normalizedDataModelConfiguration =
      dataModelConfiguration.replaceAll(RegExp(r'\s'), '');

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

  // Find the setInitialDataOfPackages method in the file
  var setInitialDataOfPackagesIndex =
      constantsFileContent.indexOf('setInitialDataOfPackages()');
  if (setInitialDataOfPackagesIndex == -1) {
    print('Error: Could not find the setInitialDataOfPackages method.');
    return;
  }

  // Find the end of the setInitialDataOfPackages method
  var endOfSetInitialDataOfPackages = setInitialDataOfPackagesIndex +
      constantsFileContent
          .substring(setInitialDataOfPackagesIndex)
          .indexOf('}') +
      1;

  // Check if the additional line already exists in the method
  if (!constantsFileContent.contains(normalizedDataModelConfiguration)) {
    // Add the additional line to the setInitialDataOfPackages method
    constantsFileContent =
        constantsFileContent.substring(0, endOfSetInitialDataOfPackages - 1) +
            '\n    ' +
            normalizedDataModelConfiguration +
            '\n  ' +
            constantsFileContent.substring(endOfSetInitialDataOfPackages - 1);
    print(
        'The additional line was added to the setInitialDataOfPackages method.');
  } else {
    print(
        'The additional line already exists in the setInitialDataOfPackages method.');
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
    "RepositoryProvider<LocalRepository<DownloadModel, DownloadSearchModel>>(create: (_) => DownloadLocalRepository(sql,DownloadOpLogManager(isar),),),",
  ];

// Define the remote repositories of DataModel
  var remoteRepositoriesOfRegistrationDelivery = [
    "if (value == DataModelType.household) RepositoryProvider<RemoteRepository<HouseholdModel, HouseholdSearchModel>>(create: (_) => HouseholdRemoteRepository(dio, actionMap: actions,),),",
    "if (value == DataModelType.householdMember) RepositoryProvider<RemoteRepository<HouseholdMemberModel, HouseholdMemberSearchModel>>(create: (_) => HouseholdMemberRemoteRepository(dio, actionMap: actions,),),",
    "if (value == DataModelType.projectBeneficiary) RepositoryProvider<RemoteRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>>(create: (_) => ProjectBeneficiaryRemoteRepository(dio, actionMap: actions,),),",
    "if (value == DataModelType.task) RepositoryProvider<RemoteRepository<TaskModel, TaskSearchModel>>(create: (_) => TaskRemoteRepository(dio, actionMap: actions,),),",
    "if (value == DataModelType.referral) RepositoryProvider<RemoteRepository<ReferralModel, ReferralSearchModel>>(create: (_) => ReferralRemoteRepository(dio, actionMap: actions,),),",
    "if (value == DataModelType.sideEffect) RepositoryProvider<RemoteRepository<SideEffectModel, SideEffectSearchModel>>(create: (_) => SideEffectRemoteRepository(dio, actionMap: actions,),),",
    "if (value == DataModelType.downsync) RepositoryProvider<RemoteRepository<DownsyncModel, DownsyncSearchModel>>(create: (_) => DownsyncRemoteRepository(dio, actionMap: actions,),),",
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
              ? '  $remoteRepositoryOfRegistrationDelivery,\n]);'
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
