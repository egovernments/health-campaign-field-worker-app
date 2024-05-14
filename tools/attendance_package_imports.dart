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
  var blocDirectoryPath = '$appRoot/blocs/attendance';
  var blocFilePath = '$blocDirectoryPath/hcm_attendance_bloc.dart';
  var networkManagerProviderWrapperFilePath =
      '$appRoot/widgets/network_manager_provider_wrapper.dart';
  var constantsFilePath = '$appRoot/utils/constants.dart';
  var utilsFilePath = '$appRoot/utils/utils.dart';

  _createLocalizationDelegatesFile(localizationDelegatesFilePath);

  _createSkeletonBlocFile(
      blocDirectoryPath: blocDirectoryPath, blocFilePath: blocFilePath);

  _addRepoToNetworkManagerProviderWrapper(
      networkManagerProviderWrapperFilePath:
          networkManagerProviderWrapperFilePath);

  _addAttendanceConstantsToConstantsFile(constantsFilePath: constantsFilePath);

  _addAttendanceMapperToUtilsFile(utilsFilePath: utilsFilePath);

  // Run dart format on the localization_delegates.dart file
  Process.run('dart', ['format', localizationDelegatesFilePath])
      .then((ProcessResult results) {
    print(results.stdout);
  });

  // Run dart format on the blocFilePath file
  Process.run('dart', ['format', blocFilePath]).then((ProcessResult results) {
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

void _addAttendanceMapperToUtilsFile({required String utilsFilePath}) {
  // Define the attendance related lines
  var attendanceImportStatement = [
    "import 'package:attendance_management/attendance_management.dart' as attendance_mappers;"
  ];
  var attendanceInitializationStatement =
      "attendance_mappers.initializeMappers();";

  // Check if the utils.dart file exists
  var utilsFile = File(utilsFilePath);

  // Read the utils.dart file
  var utilsFileContent = utilsFile.readAsStringSync();

  // Normalize the whitespace in the file content
  var normalizedFileContent = utilsFileContent.replaceAll(RegExp(r'\s'), '');

  // Check if the import statement and delegate already exist in the file
  // If not, add them to the file
  if (!normalizedFileContent.contains(
      attendanceInitializationStatement.replaceAll(RegExp(r'\s'), ''))) {
    utilsFileContent = '$attendanceInitializationStatement\n$utilsFileContent';
    print('The import statement was added.');
  } else {
    print('The import statement already exists.');
  }

  if (!utilsFileContent.contains(attendanceInitializationStatement)) {
    // Add the attendance related initialization statement to the file
    var initializeAllMappersIndex =
        utilsFileContent.indexOf('initializeAllMappers() {');
    if (initializeAllMappersIndex == -1) {
      print(
          'Error: Could not find a place to insert the attendance initialization statement.');
      return;
    }
    var endOfInitializeAllMappers = initializeAllMappersIndex +
        utilsFileContent.substring(initializeAllMappersIndex).indexOf('}') +
        1;
    utilsFileContent =
        utilsFileContent.substring(0, endOfInitializeAllMappers - 1) +
            '  ' +
            attendanceInitializationStatement +
            '\n' +
            utilsFileContent.substring(endOfInitializeAllMappers - 1);
    print('Attendance initialization statement added to utils.dart');
  }

  // Write the updated content back to the utils.dart file
  utilsFile.writeAsStringSync(utilsFileContent);
}

void _addAttendanceConstantsToConstantsFile(
    {required String constantsFilePath}) {
  // Define the import statements
  var importStatements = [
    "import 'package:attendance_management/attendance_management.dart';",
  ];

  // Define the attendance configuration
  var attendanceConfiguration = '''
// Attendance related configuration
AttendanceSingleton().setTenantId(envConfig.variables.tenantId);
  ''';

  // Define the attendance related lines
  var attendanceLocalRepositories = [
    'AttendanceLocalRepository(sql, AttendanceOpLogManager(isar)),',
    'AttendanceLogsLocalRepository(sql, AttendanceLogOpLogManager(isar)),',
  ];
  var attendanceRemoteRepositories = [
    'if (value == DataModelType.attendanceRegister) AttendanceRemoteRepository(dio, actionMap: actions),',
    'if (value == DataModelType.attendance) AttendanceLogRemoteRepository(dio, actionMap: actions),',
  ];

  // Read the constants.dart file
  var constantsFile = File(constantsFilePath);
  var constantsFileContent = constantsFile.readAsStringSync();

  // Normalize the whitespace in the file content and the attendance configuration
  var normalizedFileContent =
      constantsFileContent.replaceAll(RegExp(r'\s'), '');
  var normalizedAttendanceConfiguration =
      attendanceConfiguration.replaceAll(RegExp(r'\s'), '');

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

  // Check if the attendance configuration already exists in the file
  // If not, add it to the file
  if (!normalizedFileContent.contains(normalizedAttendanceConfiguration)) {
    constantsFileContent = '$attendanceConfiguration\n$constantsFileContent';
    print('The attendance configuration was added.');
  }

  // Check if the attendance local repositories already exist in the file
  for (var attendanceLocalRepository in attendanceLocalRepositories) {
    var normalizedAttendanceLocalRepository =
        attendanceLocalRepository.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent.contains(normalizedAttendanceLocalRepository)) {
      // Add the attendance local repository to the file
      constantsFileContent = constantsFileContent.replaceFirst(
          '];', '  $attendanceLocalRepository\n];');
      print(
          'The attendance local repository was added: $attendanceLocalRepository');
    } else {
      print('The attendance local repository already exists.');
    }
  }

  // Check if the attendance remote repositories already exist in the file
  for (var attendanceRemoteRepository in attendanceRemoteRepositories) {
    var normalizedAttendanceRemoteRepository =
        attendanceRemoteRepository.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent.contains(normalizedAttendanceRemoteRepository)) {
      // Add the attendance remote repository to the _getRemoteRepositories method
      var replacementString = constantsFileContent.contains(']);')
          ? '  $attendanceRemoteRepository,\n]);'
          : '  $attendanceRemoteRepository\n]);';
      constantsFileContent =
          constantsFileContent.replaceFirst(']);', replacementString);
      print(
          'The attendance remote repository was added: $attendanceRemoteRepository');
    } else {
      print('The attendance remote repository already exists.');
    }
  }
}

void _addRepoToNetworkManagerProviderWrapper(
    {required String networkManagerProviderWrapperFilePath}) {
  // Define the import statements and repository providers
  var importStatements = [
    "import 'package:attendance_management/attendance_management.dart';",
  ];
  var localRepositories = [
    "RepositoryProvider<\n          LocalRepository<AttendanceRegisterModel,\n              AttendanceRegisterSearchModel>>(\n        create: (_) => AttendanceLocalRepository(\n          sql,\n          AttendanceOpLogManager(isar),\n        ),\n      ),",
    "RepositoryProvider<\n          LocalRepository<AttendanceLogModel, AttendanceLogSearchModel>>(\n        create: (_) => AttendanceLogsLocalRepository(\n          sql,\n          AttendanceLogOpLogManager(isar),\n        ),\n      ),",
  ];

// Define the remote repositories of attendance
  var remoteRepositoriesOfRegistrationDelivery = [
    "if (value == DataModelType.attendanceRegister)\n"
        "  RepositoryProvider<\n"
        "      RemoteRepository<AttendanceRegisterModel,\n"
        "          AttendanceRegisterSearchModel>>(\n"
        "    create: (_) =>\n"
        "        AttendanceRemoteRepository(dio, actionMap: actions),\n"
        "  )",
    "if (value == DataModelType.attendance)\n"
        "  RepositoryProvider<\n"
        "      RemoteRepository<AttendanceLogModel,\n"
        "          AttendanceLogSearchModel>>(\n"
        "    create: (_) =>\n"
        "        AttendanceLogRemoteRepository(dio, actionMap: actions),\n"
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

  // Normalize the whitespace in the file content and the remote repository of attendance
  var normalizedFileContent =
      networkManagerProviderWrapperFileContent.replaceAll(RegExp(r'\s'), '');

// Check if the local repository providers already exist in the file
  for (var repositoryProvider in localRepositories) {
    var normalizedLocalRepositoryOfAttendance =
        repositoryProvider.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent
        .contains(normalizedLocalRepositoryOfAttendance)) {
      // Add the local repository provider to the file
      networkManagerProviderWrapperFileContent =
          networkManagerProviderWrapperFileContent.replaceFirst(
              '];', '  $repositoryProvider\n];');
      print('The local repository provider was added: $repositoryProvider');
    } else {
      print('The local repository provider already exists.');
    }
  }

// Check if the remote repository of attendance already exists in the file
  for (var remoteRepositoryOfRegistrationDelivery
      in remoteRepositoriesOfRegistrationDelivery) {
    var normalizedRemoteRepositoryOfRegistrationDelivery =
        remoteRepositoryOfRegistrationDelivery.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent
        .contains(normalizedRemoteRepositoryOfRegistrationDelivery)) {
      // Add the remote repository of attendance to the _getRemoteRepositories method
      var replacementString =
          networkManagerProviderWrapperFileContent.contains(']);')
              ? '  $remoteRepositoryOfRegistrationDelivery,\n]);'
              : '  $remoteRepositoryOfRegistrationDelivery\n]);';
      networkManagerProviderWrapperFileContent =
          networkManagerProviderWrapperFileContent.replaceFirst(
              ']);', replacementString);
      print(
          'The remote repository of attendance was added: $remoteRepositoryOfRegistrationDelivery');
    } else {
      print('The remote repository of attendance already exists.');
    }
  }

  // Write the updated content back to the file
  networkManagerProviderWrapperFile
      .writeAsStringSync(networkManagerProviderWrapperFileContent);
}

void _createSkeletonBlocFile(
    {required String blocFilePath, required String blocDirectoryPath}) {
  // Check if the Bloc file already exists
  // If not, create the directory and write the skeleton Bloc class to the file
  var blocFile = File(blocFilePath);
  if (!blocFile.existsSync()) {
    Directory(blocDirectoryPath).createSync(recursive: true);

    blocFile.writeAsStringSync('''
import 'package:attendance_management/blocs/attendance_listeners.dart';
import 'package:attendance_management/models/attendance_log.dart';
import 'package:attendance_management/models/attendance_register.dart';

class HcmAttendanceBloc extends AttendanceListeners {
  @override
  void callSyncMethod() {
    // TODO: implement callSyncMethod
  }

  @override
  Future<List<AttendanceRegisterModel>> getAttendanceRegisters() {
    // TODO: implement getAttendanceRegisters
    throw UnimplementedError();
  }

  @override
  Future<List<AttendanceLogModel>> searchAttendanceLog({required String registerId, required String tenantId, required int entryTime, required int exitTime, required int currentDate}) {
    // TODO: implement searchAttendanceLog
    throw UnimplementedError();
  }

  @override
  void submitAttendanceDetails(SubmitAttendanceDetails attendanceLogs) {
    // TODO: implement submitAttendanceDetails
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
      "import 'package:attendance_management/blocs/app_localization.dart' as attendance_localization;";
  var delegate =
      "attendance_localization.AttendanceLocalization.getDelegate(getLocalizationString(isar,selectedLocale,),appConfig.languages!,),";

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
