// Import the required Dart I/O package
import 'dart:io';

// Define the main function
void main() {
  // Get the current directory path
  var appDir = Directory.current.path;

  // Define the paths for the application root and the files to be modified
  var appRoot = appDir + '/apps/health_campaign_field_worker_app/lib';
  var appFile = appRoot + '/app.dart';
  var localizationDelegatesFilePath =
      appRoot + '/utils/localization_delegates.dart';
  var constantsFilePath = appRoot + '/utils/constants.dart';
  var utilsFilePath = appRoot + '/utils/utils.dart';
  var routerFilePath = appRoot + '/router/app_router.dart';
  var entityMapperFilePath =
      appRoot + '/data/local_store/no_sql/schema/entity_mapper.dart';
  var syncDownFilePath = appRoot + '/data/repositories/sync/sync_down.dart';
  var homeFilePath = appRoot + '/pages/home.dart';
  var extensionsFilePath = appRoot + '/utils/extensions/extensions.dart';

  // Add the scanner bloc to the app file
  _addDSSDashboardBlocToAppFile(appFile);

  //  Create the localization delegates file
  _createLocalizationDelegatesFile(localizationDelegatesFilePath);

  // Add dss to home file
  _updateHome(homeFilePath);

  // Add dss routes and import to the router file
  _addDigitDSSRoutesAndImportToRouterFile(routerFilePath);

  // Add the dss related constants to the constants file
  _addRegNDeliveryConstantsToConstantsFile(
      constantsFilePath: constantsFilePath);

  // Add the dss related mappers to the utils file
  _addDSSMapperToUtilsFile(utilsFilePath: utilsFilePath);

  _formatFiles([
    appFile,
    localizationDelegatesFilePath,
    constantsFilePath,
    utilsFilePath,
    routerFilePath,
    entityMapperFilePath,
    syncDownFilePath,
    homeFilePath,
    extensionsFilePath,
  ]);
}

void _formatFiles(List<String> filePaths) {
  for (var filePath in filePaths) {
    Process.runSync('dart', ['format', filePath]);
    print('Formatted $filePath');
  }
}

void _addDSSDashboardBlocToAppFile(String appFilePath) {
  var importStatement = "import 'package:digit_dss/digit_dss.dart';";

  var dssBlocData = '''
    BlocProvider(
      create: (ctx) => DashboardBloc(
        const DashboardState.initialState(),
        isar: widget.isar,
        dashboardRemoteRepo: DashboardRemoteRepository(widget.client),
      )),
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

  if (!appFileContent.contains('DashboardBloc(')) {
    // Insert the data to be added
    appFileContent = insertData(appFileContent,
        '// INFO : Need to add bloc of package Here', dssBlocData);
  }

  // Write the updated content back to the app.dart file
  appFile.writeAsStringSync(appFileContent);
}

void _updateHome(String homeFilePath) {
  var importStatement = '''
      import 'package:digit_dss/router/dashboard_router.gm.dart';
      ''';

  var homeItemsData = '''
     i18.home.dashboard: homeShowcaseData.dashBoard.buildWith(
        child: HomeItemCard(
          icon: Icons.bar_chart_sharp,
          label: i18.home.dashboard,
          onPressed: () {
            context.router.push(const UserDashboardRoute());
          },
        ),
      ),
  ''';

  var showCaseData = '''
        i18.home.dashboard:
          homeShowcaseData.dashBoard.showcaseKey,
  ''';

  var itemsLabel = '''
  i18.home.dashboard,
  ''';

  // Define the data to be added
  var singletonData = '''
    DashboardSingleton().setInitialData(
            projectId: context.projectId,
            tenantId: envConfig.variables.tenantId,
            dashboardConfig: appConfiguration.dashboardConfig,
            appVersion: Constants().version,
            selectedProject: context.selectedProject,
            actionPath: Constants.getEndPoint(
              serviceRegistry: serviceRegistry,
              service: DashboardResponseModel.schemaName.toUpperCase(),
              action: ApiOperation.search.toValue(),
              entityName: DashboardResponseModel.schemaName,
            ));
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

void _createLocalizationDelegatesFile(String localizationDelegatesFilePath) {
  // Define the import statement and delegate for localization
  var importStatement =
      "import 'package:digit_dss/blocs/app_localization.dart' as digit_dss_localization;";
  var delegate = ''' 
      digit_dss_localization.DashboardLocalization.getDelegate(
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

void _addDigitDSSRoutesAndImportToRouterFile(String routerFilePath) {
  // Define the dss route lines
  var dssRoutes = '''
    // DSS Dashboard Routes
    AutoRoute(
          page: UserDashboardRoute.page,
          path: 'dashboard',
        ),
  ''';

  // Define the import statement
  var importStatement1 =
      "import 'package:digit_dss/router/dashboard_router.dart';";
  // Define the import statement
  var importStatement2 =
      "import 'package:digit_dss/router/dashboard_router.gm.dart';";

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
  // Check if the DSSRoute module already exists
  if (!routerFileContent.contains('DashboardRoute')) {
    // Find the position to insert the module
    var moduleInsertionIndex = routerFileContent.indexOf('@AutoRouterConfig(');
    if (moduleInsertionIndex != -1) {
      var endOfModulesIndex =
          routerFileContent.indexOf(']', moduleInsertionIndex);
      if (endOfModulesIndex != -1) {
        var modulesEndIndex =
            routerFileContent.lastIndexOf(']', endOfModulesIndex);
        routerFileContent = routerFileContent.substring(0, modulesEndIndex) +
            ' DashboardRoute,' +
            routerFileContent.substring(modulesEndIndex);
        print('The DashboardRoute module was added.');
      } else {
        print('Error: Could not find the end of the modules list.');
        return;
      }
    } else {
      print('Error: Could not find @AutoRouterConfig annotation.');
      return;
    }
  } else {
    print('The DashboardRoute module already exists.');
  }

  // Check if the dss routes already exist in the file
  if (!normalizedFileContent
      .contains(dssRoutes.replaceAll(RegExp(r'\s'), ''))) {
    // Find the position to insert the routes
    var insertionIndex = routerFileContent
        .indexOf('// INFO : Need to add Router of package Here');
    if (insertionIndex != -1) {
      routerFileContent = routerFileContent.substring(0, insertionIndex) +
          '// INFO : Need to add Router of package Here\n' +
          dssRoutes +
          routerFileContent.substring(insertionIndex +
              '// INFO : Need to add Router of package Here'.length);
      print('The dss routes were added.');

      // Write the updated content back to the file
      routerFile.writeAsStringSync(routerFileContent);
    } else {
      print('Error: Could not find the insertion point.');
      return;
    }
  } else {
    print('The dss routes already exist.');
  }
}

void _addDSSMapperToUtilsFile({required String utilsFilePath}) {
  // Define the dss related lines
  var dataModelImportStatement = [
    "import 'package:digit_dss/digit_dss.dart' as dss_mappers;"
  ];
  var dataModelInitializationStatement =
      "Future(() => dss_mappers.initializeMappers()),";

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
    // Add the dss related initialization statement to the file
    var initializeAllMappersIndex =
        utilsFileContent.indexOf('initializeAllMappers() async {');
    if (initializeAllMappersIndex == -1) {
      print(
          'Error: Could not find a place to insert the DigitDSS initialization statement.');
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
    print('DigitDSS initialization statement added to utils.dart');
  }

  // Write the updated content back to the utils.dart file
  utilsFile.writeAsStringSync(utilsFileContent);
}

void _addRegNDeliveryConstantsToConstantsFile(
    {required String constantsFilePath}) {
  // Define the import statements
  var importStatements = [
    "import 'package:digit_dss/digit_dss.dart';",
  ];

  // Define the additional line to be added
  var dashboardResponseSchema = '''
  DashboardResponseSchema
  ''';
  // Check if the constants.dart file exists
  var constantsFile = File(constantsFilePath);
  if (!constantsFile.existsSync()) {
    print('Error: The constants.dart file does not exist.');
    return;
  }

  // Read the constants.dart file
  var constantsFileContent = constantsFile.readAsStringSync();

  // Normalize the whitespace in the file content and the dss configuration
  var normalizedFileContent =
      constantsFileContent.replaceAll(RegExp(r'\s'), '');
  var normalizedDashboardSchemaConfiguration =
      dashboardResponseSchema.replaceAll(RegExp(r'\s'), '');

  // Check if the import statements already exist in the file
  for (var importStatement in importStatements) {
    if (!normalizedFileContent
        .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
      // Add the import statement at the top of the file
      constantsFileContent = importStatement + '\n' + constantsFileContent;
      print('The import statement was added: $importStatement');
    }
  }

  // Check if the dss configuration already exists in the file
  // If not, add it to the file
  if (!normalizedFileContent.contains(normalizedDashboardSchemaConfiguration)) {
    // Find the setInitialDataOfPackages method and add the dss configuration inside it
    var openIsarFunctionIndex =
        constantsFileContent.indexOf('await Isar.open(');

    if (openIsarFunctionIndex != -1) {
      int schemaListStartIndex =
          constantsFileContent.indexOf('[', openIsarFunctionIndex);
      int schemaListEndIndex =
          constantsFileContent.indexOf(']', schemaListStartIndex);

      if (schemaListStartIndex != -1 && schemaListEndIndex != -1) {
        String schemaList = constantsFileContent
            .substring(schemaListStartIndex + 1, schemaListEndIndex)
            .trim();

        // Ensure no extra comma is added
        if (schemaList.isNotEmpty && !schemaList.endsWith(',')) {
          schemaList += ',';
        }
        schemaList += ' $dashboardResponseSchema,';

        constantsFileContent = constantsFileContent.replaceRange(
            schemaListStartIndex + 1, schemaListEndIndex, schemaList);
        print('The DashboardSchema was added.');
      }
    }
  }

  // Write the updated content back to the constants.dart file
  constantsFile.writeAsStringSync(constantsFileContent);
}
