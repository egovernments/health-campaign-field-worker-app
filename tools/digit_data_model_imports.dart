// Import the required Dart I/O package
import 'dart:io';

import 'attendance_package_imports.dart';

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
  var networkManagerProviderWrapperFilePath =
      appRoot + '/widgets/network_manager_provider_wrapper.dart';
  var constantsFilePath = appRoot + '/utils/constants.dart';
  var utilsFilePath = appRoot + '/utils/utils.dart';

  _addRepoToNetworkManagerProviderWrapper(
      networkManagerProviderWrapperFilePath:
          networkManagerProviderWrapperFilePath);

  _addDataModelConstantsToConstantsFile(constantsFilePath: constantsFilePath);

  _addDataModelMapperToUtilsFile(utilsFilePath: utilsFilePath);

  _formatFiles([
    networkManagerProviderWrapperFilePath,
    constantsFilePath,
    utilsFilePath,
  ]);
}

void _formatFiles(List<String> filePaths) {
  for (var filePath in filePaths) {
    Process.runSync('dart', ['format', filePath]);
    print('Formatted $filePath');
  }
}

void _addDataModelMapperToUtilsFile({required String utilsFilePath}) {
  // Define the data_model related lines
  var dataModelImportStatement = [
    "import 'package:digit_data_model/data_model.init.dart' as data_model_mappers;"
  ];
  var dataModelInitializationStatement =
      "Future(() => data_model_mappers.initializeMappers()),";

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

  if (!normalizedFileContent.contains(
      dataModelInitializationStatement.replaceAll(RegExp(r'\s'), ''))) {
    if (!utilsFileContent.contains(dataModelInitializationStatement)) {
      // Add the DataModel related initialization statement to the file
      var initializeAllMappersIndex =
          utilsFileContent.indexOf('initializeAllMappers() async {');
      if (initializeAllMappersIndex == -1) {
        print(
            'Error: Could not find a place to insert the DataModel initialization statement.');
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
      print('DataModel initialization statement added to utils.dart');
    }

    // Write the updated content back to the utils.dart file
    utilsFile.writeAsStringSync(utilsFileContent);
  } else {
    print('The DataModel initialization statement already exists.');
  }
}

void _addDataModelConstantsToConstantsFile(
    {required String constantsFilePath}) {
  // Define the import statements
  var importStatements = [
    "import 'package:digit_data_model/digit_data_model.dart';",
  ];

  // Define the DataModel configuration
  var dataModelConfiguration = '''
    DigitDataModelSingleton().setData(
        syncDownRetryCount: envConfig.variables.syncDownRetryCount,
        retryTimeInterval: envConfig.variables.retryTimeInterval,
        tenantId: envConfig.variables.tenantId,
        entityMapper: EntityMapper(),
        errorDumpApiPath: envConfig.variables.dumpErrorApiPath);
  ''';

  // Read the constants.dart file
  var constantsFile = File(constantsFilePath);
  var constantsFileContent = constantsFile.readAsStringSync();

// // Read the constants.dart file
//   var constantsFile = File(constantsFilePath);
//   var constantsFileContent = constantsFile.readAsStringSync();

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
    } else {
      print('The import statement already exists.');
    }
  }

  // Check if the DataModel configuration already exists in the file
  // If not, add it to the file
  if (!normalizedFileContent.contains(normalizedDataModelConfiguration)) {
    constantsFileContent = '$dataModelConfiguration\n$constantsFileContent';
    print('The DataModel configuration was added.');
  } else {
    print('The DataModel configuration already exists.');
  }
}

void _addRepoToNetworkManagerProviderWrapper(
    {required String networkManagerProviderWrapperFilePath}) {
  // Define the import statements and repository providers
  var importStatements = [
    "import 'package:digit_data_model/data_model.dart';",
  ];
  var localRepositories = [
    "RepositoryProvider<LocalRepository<IndividualModel, IndividualSearchModel>>(create: (_) => IndividualLocalRepository(sql,IndividualOpLogManager(isar),),)",
    "RepositoryProvider<LocalRepository<FacilityModel, FacilitySearchModel>>(create: (_) => FacilityLocalRepository(sql,FacilityOpLogManager(isar),),)",
    "RepositoryProvider<LocalRepository<ProjectModel, ProjectSearchModel>>(create: (_) => ProjectLocalRepository(sql,ProjectOpLogManager(isar),),)",
    "RepositoryProvider<LocalRepository<ProjectStaffModel, ProjectStaffSearchModel>>(create: (_) => ProjectStaffLocalRepository(sql,ProjectStaffOpLogManager(isar),),)",
    "RepositoryProvider<LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>>(create: (_) => ProjectFacilityLocalRepository(sql,ProjectFacilityOpLogManager(isar),),)",
    "RepositoryProvider<LocalRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel>>(create: (_) => ServiceDefinitionLocalRepository(sql, ServiceDefinitionOpLogManager(isar),),)",
    "RepositoryProvider<LocalRepository<ServiceModel, ServiceSearchModel>>(create: (_) => ServiceLocalRepository(sql, ServiceOpLogManager(isar),),)",
    "RepositoryProvider<LocalRepository<ProjectResourceModel, ProjectResourceSearchModel>>(create: (_) => ProjectResourceLocalRepository(sql, ProjectResourceOpLogManager(isar),),)",
    "RepositoryProvider<LocalRepository<ProductVariantModel, ProductVariantSearchModel>>(create: (_) => ProductVariantLocalRepository(sql, ProductVariantOpLogManager(isar),),)",
    "RepositoryProvider<LocalRepository<BoundaryModel, BoundarySearchModel>>(create: (_) => BoundaryLocalRepository(sql, BoundaryOpLogManager(isar),),)",
    "RepositoryProvider<LocalRepository<PgrServiceModel, PgrServiceSearchModel>>(create: (_) => PgrServiceLocalRepository(sql, PgrServiceOpLogManager(isar),),)",
  ];

// Define the remote repositories of DataModel
  var remoteRepositoriesOfRegistrationDelivery = [
    "if (value == DataModelType.service) RepositoryProvider<RemoteRepository<ServiceModel, ServiceSearchModel>>(create: (_) => ServiceRemoteRepository(dio, actionMap: actions,),)",
    "if (value == DataModelType.serviceDefinition) RepositoryProvider<RemoteRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel>>(create: (_) => ServiceDefinitionRemoteRepository(dio, actionMap: actions,),)",
    "if (value == DataModelType.boundary) RepositoryProvider<RemoteRepository<BoundaryModel, BoundarySearchModel>>(create: (_) => BoundaryRemoteRepository(dio, actionMap: actions,),)",
    "if (value == DataModelType.productVariant) RepositoryProvider<RemoteRepository<ProductVariantModel, ProductVariantSearchModel>>(create: (_) => ProductVariantRemoteRepository(dio, actionMap: actions,),)",
    "if (value == DataModelType.complaints) RepositoryProvider<RemoteRepository<PgrServiceModel, PgrServiceSearchModel>>(create: (_) => PgrServiceRemoteRepository(dio, actionMap: actions,),)",
    "if (value == DataModelType.user) RepositoryProvider<RemoteRepository<UserModel, UserSearchModel>>(create: (_) => UserRemoteRepository(dio, actionMap: actions,),)",
    "if (value == DataModelType.facility) RepositoryProvider<RemoteRepository<FacilityModel, FacilitySearchModel>>(create: (_) => FacilityRemoteRepository(dio, actionMap: actions,),)",
    "if (value == DataModelType.individual) RepositoryProvider<RemoteRepository<IndividualModel, IndividualSearchModel>>(create: (_) => IndividualRemoteRepository(dio, actionMap: actions,),)",
    "if (value == DataModelType.product) RepositoryProvider<RemoteRepository<ProductModel, ProductSearchModel>>(create: (_) => ProductRemoteRepository(dio, actionMap: actions,),)",
    "if (value == DataModelType.project) RepositoryProvider<RemoteRepository<ProjectModel, ProjectSearchModel>>(create: (_) => ProjectRemoteRepository(dio, actionMap: actions,),)",
    "if (value == DataModelType.projectFacility) RepositoryProvider<RemoteRepository<ProjectFacilityModel, ProjectFacilitySearchModel>>(create: (_) => ProjectFacilityRemoteRepository(dio, actionMap: actions,),)",
    "if (value == DataModelType.projectStaff) RepositoryProvider<RemoteRepository<ProjectStaffModel, ProjectStaffSearchModel>>(create: (_) => ProjectStaffRemoteRepository(dio, actionMap: actions,),)",
    "if (value == DataModelType.projectResource) RepositoryProvider<RemoteRepository<ProjectResourceModel, ProjectResourceSearchModel>>(create: (_) => ProjectResourceRemoteRepository(dio, actionMap: actions,),)",
  ];

// Read the network_manager_provider_wrapper.dart file
  var networkManagerProviderWrapperFile =
      File(networkManagerProviderWrapperFilePath);
  var networkManagerProviderWrapperFileContent =
      networkManagerProviderWrapperFile.readAsStringSync();
  // Normalize the whitespace in the file content and the remote repository of DataModel
  var normalizedFileContent =
      networkManagerProviderWrapperFileContent.replaceAll(RegExp(r'\s'), '');

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
      if (!normalizedFileContent
          .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
        // Add the import statement after the last import
        networkManagerProviderWrapperFileContent =
            networkManagerProviderWrapperFileContent.substring(0,
                    networkManagerProviderWrapperFileContent.indexOf(';') + 1) +
                '\n' +
                importStatement +
                networkManagerProviderWrapperFileContent.substring(
                    networkManagerProviderWrapperFileContent.indexOf(';') + 1);
        print('The import statement was added: $importStatement');
      } else {
        print('The import statement already exists.');
      }
    }
  }

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
