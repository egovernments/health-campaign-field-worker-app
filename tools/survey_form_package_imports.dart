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
  var appDir = Directory.current.parent.path;

  // Define the paths for the application root and the files to be modified
  var appRoot = appDir + '/apps/health_campaign_field_worker_app/lib';
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
  var projectFilePath = appRoot + '/blocs/project/project.dart';
  var authenticatedFilePath = appRoot + '/pages/authenticated.dart';
  var contextUtilityFilePath = appRoot + '/utils/extensions/context_utility.dart';
  var appFilePath = appRoot + '/app.dart';
  var extensionFilePath = appRoot + '/utils/extensions/extensions.dart';

  _updateExtensionFilePath(extensionFilePath);

  _updateAppFile(appFilePath);

  // Initialise Boundarycode in surveyFormSingleton class
  _updateContextUtilityFile(contextUtilityFilePath);

  // Add Imports and service definition repo
  _addprojectFilePath(projectFilePath);

  _addauthenticatedFilePath(authenticatedFilePath);


  // Add surveyForm to home file
  _updateHome(homeFilePath);

  // Add surveyForm routes and import to the router file
  _addSurveyFormRoutesAndImportToRouterFile(routerFilePath);

  // Add new case statements to the entity_mapper.dart file
  _updateEntityMapperFile(entityMapperFilePath);

  _createLocalizationDelegatesFile(localizationDelegatesFilePath);

  _addRepoToNetworkManagerProviderWrapper(
      networkManagerProviderWrapperFilePath:
      networkManagerProviderWrapperFilePath);

  _addSurveyFormConstantsToConstantsFile(constantsFilePath: constantsFilePath);

  _addSurveyFormMapperToUtilsFile(utilsFilePath: utilsFilePath);

  _formatFiles([
    homeFilePath,
    syncDownFilePath,
    entityMapperFilePath,
    routerFilePath,
    constantsFilePath,
    utilsFilePath,
    networkManagerProviderWrapperFilePath,
    localizationDelegatesFilePath,
    projectFilePath,
    authenticatedFilePath,
    contextUtilityFilePath,
    appFilePath,
    extensionFilePath
  ]);
}

void _formatFiles(List<String> filePaths) {
  for (var filePath in filePaths) {
    Process.runSync('dart', ['format', filePath]);
    print('Formatted $filePath');
  }
}

void _updateExtensionFilePath(extensionFilePath){
  var importStatement = '''
      import 'package:survey_form/utils/utils.dart';''';

  // Check if the extension.dart file exists
  var extensionFile = File(extensionFilePath);
  if (!extensionFile.existsSync()) {
    print('Error: project file does not exist at path: $extensionFilePath');
    return;
  }

  // Read the authenticated.dart file
  var extensionFileContent = extensionFile.readAsStringSync();

  // Check if the import statement already exists and add it if not
  if (!extensionFileContent
      .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
    extensionFileContent = importStatement + '\n' + extensionFileContent;
    print('The import statement was added.');
  } else {
    print('The import statement already exists.');
  }

  extensionFile.writeAsStringSync(extensionFileContent);
}

void _updateAppFile(appFilePath) {
  var importStatement = '''
      import 'package:survey_form/survey_form.dart';''';

  var ServiceDefinitionRepository = '''serviceDefinitionRemoteRepository: ctx.read<
                                RemoteRepository<ServiceDefinitionModel,
                                    ServiceDefinitionSearchModel>>(),
                            serviceDefinitionLocalRepository: ctx.read<
                                LocalRepository<ServiceDefinitionModel,
                                    ServiceDefinitionSearchModel>>(),''';

  // Check if the app.dart file exists
  var appFile = File(appFilePath);
  if (!appFile.existsSync()) {
    print('Error: project file does not exist at path: $appFilePath');
    return;
  }

  // Read the app.dart file
  var appFileContent = appFile.readAsStringSync();

  // Check if the import statement already exists and add it if not
  if (!appFileContent
      .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
    appFileContent = importStatement + '\n' + appFileContent;
    print('The import statement was added.');
  } else {
    print('The import statement already exists.');
  }

  // Check if the new cases already exist in the file
  if (!appFileContent
      .contains(ServiceDefinitionRepository.replaceAll(RegExp(r'\s'), ''))) {
    // Find the position to insert the new cases (before the default case)
    var caseInsertionIndex = appFileContent.indexOf('ProjectBloc(');
    caseInsertionIndex += 'ProjectBloc('.length;
    if (caseInsertionIndex != -1) {
      appFileContent =
          appFileContent.substring(0, caseInsertionIndex) +
              ServiceDefinitionRepository +
              '\n' +
              appFileContent.substring(caseInsertionIndex);
      print('The new cases were added.');

    } else {
      print('Error: Could not find the insertion point.');
      return;
    }
  } else {
    print('The new cases already exist.');
  }

  appFile.writeAsStringSync(appFileContent);
}

void _updateContextUtilityFile(String contextUtilityFilepath) {
  var surveyFormBoundary = '''SurveyFormSingleton().setBoundary(boundary: selectedBoundary);''';

  // Check if the context_utility.dart file exists
  var contextUtilityFile = File(contextUtilityFilepath);
  if (!contextUtilityFile.existsSync()) {
    print('Error: Context Utility file does not exist at path: $contextUtilityFilepath');
    return;
  }

  // Read the context_utility.dart file
  var contextUtilityFileContent = contextUtilityFile.readAsStringSync();

  // Insert the data to be added
  contextUtilityFileContent = insertData(contextUtilityFileContent,
      '// INFO: Set Boundary for packages', surveyFormBoundary);

  // Write the updated content back to the context_utility.dart file
  contextUtilityFile.writeAsStringSync(contextUtilityFileContent);
}

void _addauthenticatedFilePath(String authenticatedFilePath) {
  var importStatement = '''
      import 'package:survey_form/survey_form.dart';''';

  var providers = '''BlocProvider(
                        create: (_) => ServiceBloc(
                          const ServiceEmptyState(),
                          serviceDataRepository: context
                              .repository<ServiceModel, ServiceSearchModel>(),
                        ),
                      ),''';

  // Check if the authenticated.dart file exists
  var authenticatedFile = File(authenticatedFilePath);
  if (!authenticatedFile.existsSync()) {
    print('Error: project file does not exist at path: $authenticatedFilePath');
    return;
  }

  // Read the authenticated.dart file
  var authenticatedFileContent = authenticatedFile.readAsStringSync();

  // Check if the import statement already exists and add it if not
  if (!authenticatedFileContent
      .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
    authenticatedFileContent = importStatement + '\n' + authenticatedFileContent;
    print('The import statement was added.');
  } else {
    print('The import statement already exists.');
  }

  // Check if the new cases already exist in the file
  if (!authenticatedFileContent
      .contains(providers.replaceAll(RegExp(r'\s'), ''))) {
    // Find the position to insert the new cases (before the default case)
    var caseInsertionIndex = authenticatedFileContent.indexOf('providers: [');
    caseInsertionIndex += 'providers: ['.length;
    if (caseInsertionIndex != -1) {
      authenticatedFileContent =
          authenticatedFileContent.substring(0, caseInsertionIndex) +
              providers +
              '\n' +
              authenticatedFileContent.substring(caseInsertionIndex);
      print('The new cases were added.');

    } else {
      print('Error: Could not find the insertion point.');
      return;
    }
  } else {
    print('The new cases already exist.');
  }

  authenticatedFile.writeAsStringSync(authenticatedFileContent);
}

void _addprojectFilePath(String projectFilePath) {
  var importStatement = '''
      import 'package:survey_form/survey_form.dart';''';

  var ServicedefinitionRepo = '''/// Service Definition Repositories
  final RemoteRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel>
      serviceDefinitionRemoteRepository;
  final LocalRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel>
      serviceDefinitionLocalRepository;''';

  var projectBloc = '''required this.serviceDefinitionRemoteRepository,
  required this.serviceDefinitionLocalRepository,''';

  var loadServicedefinition = '''FutureOr<void> _loadServiceDefinition(List<ProjectModel> projects) async {
    final configs = await isar.appConfigurations.where().findAll();
    final userObject = await localSecureStore.userRequestModel;
    List<String> codes = [];
    for (UserRoleModel elements in userObject!.roles) {
      configs.first.checklistTypes?.map((e) => e.code).forEach((element) {
        for (final project in projects) {
          codes.add(
          '\${project.name}.\$element.\${elements.code.snakeCase.toUpperCase()}',
        );
        }
      });
    }

    final serviceDefinition = await serviceDefinitionRemoteRepository
        .search(ServiceDefinitionSearchModel(
      tenantId: envConfig.variables.tenantId,
      code: codes,
    ));

    for (var element in serviceDefinition) {
      await serviceDefinitionLocalRepository.create(
        element,
        createOpLog: false,
      );
    }
  }''';

  var loadfunctions = '''try {
        await _loadServiceDefinition(projects);
      } catch (_) {
        emit(
          state.copyWith(
            loading: false,
            syncError: ProjectSyncErrorType.serviceDefinitions,
          ),
        );
      }
      try {
        await _loadServiceDefinition(projects);
      } catch (_) {
        emit(
          state.copyWith(
            loading: false,
            syncError: ProjectSyncErrorType.serviceDefinitions,
          ),
        );
      }''';

  // Check if the project.dart file exists
  var projectFile = File(projectFilePath);
  if (!projectFile.existsSync()) {
    print('Error: project file does not exist at path: $projectFilePath');
    return;
  }

  // Read the project.dart file
  var projectFileContent = projectFile.readAsStringSync();

  // Check if the import statement already exists and add it if not
  if (!projectFileContent
      .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
    projectFileContent = importStatement + '\n' + projectFileContent;
    print('The import statement was added.');
  } else {
    print('The import statement already exists.');
  }

  // Check if the Service Definition repo already exist in the file
  if (!projectFileContent
      .contains(ServicedefinitionRepo.replaceAll(RegExp(r'\s'), ''))) {
    // Find the position to insert the Service Definition Repo
    var caseInsertionIndex = projectFileContent.indexOf('class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {');
    caseInsertionIndex += 'class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {'.length;
    if (caseInsertionIndex != -1) {
      projectFileContent =
          projectFileContent.substring(0, caseInsertionIndex) + '\n' +
              ServicedefinitionRepo +
              '\n' +
              projectFileContent.substring(caseInsertionIndex);
      print('The Service Definition repo were added.');
    } else {
      print('Error: Could not find the insertion point.');
      return;
    }
  } else {
    print('The Service Definition Repo already exist.');
  }

  // Check if the Project Bloc already exist in the file
  if (!projectFileContent
      .contains(projectBloc.replaceAll(RegExp(r'\s'), ''))) {
    // Find the position to insert the Project Bloc
    var caseInsertionIndex = projectFileContent.indexOf('ProjectBloc({');
    caseInsertionIndex += 'ProjectBloc({'.length;
    if (caseInsertionIndex != -1) {
      projectFileContent =
          projectFileContent.substring(0, caseInsertionIndex) + '\n' +
              projectBloc +
              '\n' +
              projectFileContent.substring(caseInsertionIndex);
      print('The Project Bloc were added.');
    } else {
      print('Error: Could not find the insertion point.');
      return;
    }
  } else {
    print('The Project Bloc already exist.');
  }

  // Check if the load service definition function already exist in the file
  if (!projectFileContent
      .contains(loadServicedefinition.replaceAll(RegExp(r'\s'), ''))) {
    // Find the position to insert the load service definition function
    var caseInsertionIndex = projectFileContent.indexOf('class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {');
    caseInsertionIndex += 'class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {'.length;
    if (caseInsertionIndex != -1) {
      projectFileContent =
          projectFileContent.substring(0, caseInsertionIndex) + '\n' +
              loadServicedefinition +
              '\n' +
              projectFileContent.substring(caseInsertionIndex);
      print('The load service definition function were added.');
    } else {
      print('Error: Could not find the insertion point.');
      return;
    }
  } else {
    print('The load service definition function already exist.');
  }

  // Check if the load functions calling already exist in the file
  if (!projectFileContent
      .contains(loadfunctions.replaceAll(RegExp(r'\s'), ''))) {
    // Find the position to insert the load function calling
    var caseInsertionIndex = projectFileContent.indexOf('// INFO : Need to add project load functions');
    caseInsertionIndex += '// INFO : Need to add project load functions'.length;
    if (caseInsertionIndex != -1) {
      projectFileContent =
          projectFileContent.substring(0, caseInsertionIndex) + '\n' +
              loadfunctions +
              '\n' +
              projectFileContent.substring(caseInsertionIndex);
      print('The load function calling were added.');
    } else {
      print('Error: Could not find the insertion point.');
      return;
    }
  } else {
    print('The load function calling already exist.');
  }

  // Write the updated content back to the project.dart file
  projectFile.writeAsStringSync(projectFileContent);
}

void _updateHome(String homeFilePath) {
  var importStatement = '''
      import 'package:survey_form/survey_form.dart';
      import 'package:survey_form/router/survey_form_router.gm.dart';
      ''';

  var homeItemsData = '''
      i18.home.mySurveyForm: homeShowcaseData.supervisorMySurveyForm.buildWith(
        child: HomeItemCard(
          enableCustomIcon: true,
          customIcon: mySurveyFormSvg,
          icon: Icons.checklist,
          label: i18.home.mySurveyForm,
          onPressed: () => context.router.push(SurveyFormWrapperRoute()),
        ),
      ),
  ''';

  var showCaseData = '''
       i18.home.mySurveyForm: homeShowcaseData.supervisorMySurveyForm.showcaseKey,
  ''';

  var itemsLabel = '''
        i18.home.mySurveyForm,
  ''';

  // Define the data to be added
  var singletonData = '''
    SurveyFormSingleton().setInitialData(
          projectId: context.projectId,
          projectName: context.selectedProject.name,
          loggedInIndividualId: context.loggedInIndividualId ?? '',
          loggedInUserUuid: context.loggedInUserUuid,
          appVersion: Constants().version,
          isHealthFacilityWorker: context.loggedInUserRoles.where((role) => role.code == RolesType.healthFacilityWorker.toValue()).toList().isNotEmpty,
          roles: context.read<AuthBloc>().state.maybeMap(
            orElse: () => const Offstage(),
            authenticated: (res) {
              return res.userModel.roles
                  .map((e) => e.code.snakeCase.toUpperCase())
                  .toList();
            }),
        );
  ''';

  var localRepoData = '''
    context.read<LocalRepository<ServiceModel, ServiceSearchModel>>(),
  ''';

  var remoteRepoData = '''
    context.read<RemoteRepository<ServiceModel, ServiceSearchModel>>(),
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

void _updateEntityMapperFile(String entityMapperFilePath) {
  // Define the import statement and new case statements
  var importStatement =
      "import 'package:survey_form/survey_form.dart';";
  var newCases = '''
      case "service":
        final entity = ServiceModelMapper.fromJson(entityString);
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
  if (!entityMapperFileContent
      .contains('case "service":'.replaceAll(RegExp(r'\s'), ''))) {
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

void _addSurveyFormRoutesAndImportToRouterFile(String routerFilePath) {
  // Define the SurveyForm route lines
  var surveyFormRoutes = '''
    // SurveyForm Route
        AutoRoute(
            page: SurveyFormWrapperRoute.page,
            path: 'surveyForm',
            children: [
              AutoRoute(
                page: SurveyformRoute.page,
                path: '',
              ),
              AutoRoute(
                  page: SurveyFormBoundaryViewRoute.page, path: 'view-boundary'),
              AutoRoute(page: SurveyFormViewRoute.page, path: 'view'),
              AutoRoute(page: SurveyFormPreviewRoute.page, path: 'preview'),
              AutoRoute(page: SurveyFormAcknowledgementRoute.page, path: 'surveyForm-acknowledgement'),
            ]),
  ''';

  // Define the import statement
  var importStatement1 =
      "import 'package:survey_form/router/survey_form_router.dart';";
  // Define the import statement
  var importStatement2 =
      "import 'package:survey_form/router/survey_form_router.gm.dart';";

  // Check if the router file exists
  var routerFile = File(routerFilePath);

  if (!routerFile.existsSync()) {
    print('Error: Router file does not exist at path: $routerFilePath');
    return;
  }

  // Read the router file
  var routerFileContent = routerFile.readAsStringSync();

  // Check if the import statement already exists
  if (!routerFileContent
      .contains(importStatement1.replaceAll(RegExp(r'\s'), ''))) {
    // Add the import statement at the beginning of the file
    routerFileContent = importStatement1 + '\n' + routerFileContent;
    print('The import statement was added.');
  } else {
    print('The import statement already exists.');
  }

  // Check if the import statement already exists
  if (!routerFileContent
      .contains(importStatement2.replaceAll(RegExp(r'\s'), ''))) {
    // Add the import statement at the beginning of the file
    routerFileContent = importStatement2 + '\n' + routerFileContent;
    print('The import statement was added.');
  } else {
    print('The import statement already exists.');
  }
  // Check if the surveyFormRoute module already exists
  if (!routerFileContent
      .contains('SurveyFormRoute'.replaceAll(RegExp(r'\s'), ''))) {
    // Find the position to insert the module
    var moduleInsertionIndex = routerFileContent.indexOf('@AutoRouterConfig(');
    if (moduleInsertionIndex != -1) {
      var endOfModulesIndex =
      routerFileContent.indexOf(']', moduleInsertionIndex);
      if (endOfModulesIndex != -1) {
        var modulesEndIndex =
        routerFileContent.lastIndexOf(']', endOfModulesIndex);
        routerFileContent = routerFileContent.substring(0, modulesEndIndex) +
            'SurveyFormRoute,' +
            routerFileContent.substring(modulesEndIndex);

        // Write the updated content back to the project.dart file
        routerFile.writeAsStringSync(routerFileContent);
        print('The SurveyFormRoute module was added.');
      } else {
        print('Error: Could not find the end of the modules list.');
        return;
      }
    } else {
      print('Error: Could not find @AutoRouterConfig annotation.');
      return;
    }
  } else {
    print('The SurveyFormRoute module already exists.');
  }

  // Check if the SurveyForm routes already exist in the file
  if (!routerFileContent
      .contains(surveyFormRoutes.replaceAll(RegExp(r'\s'), ''))) {
    // Find the position to insert the routes
    var insertionIndex = routerFileContent
        .indexOf('// INFO : Need to add Router of package Here');
    if (insertionIndex != -1) {
      routerFileContent = routerFileContent.substring(0, insertionIndex) +
          '// INFO : Need to add Router of package Here\n' +
          surveyFormRoutes +
          routerFileContent.substring(insertionIndex +
              '// INFO : Need to add Router of package Here'.length);
      print('The surveyForm routes were added.');

    } else {
      print('Error: Could not find the insertion point.');
      return;
    }
  } else {
    print('The surveyForm routes already exist.');
  }
  // Write the updated content back to the file
  routerFile.writeAsStringSync(routerFileContent);
}

void _addSurveyFormMapperToUtilsFile({required String utilsFilePath}) {
  // Define the surveyForm related lines
  var surveyFormImportStatement = [
    '''import 'package:survey_form/survey_form.init.dart'
    as surveyForm_mappers;'''
  ];
  var surveyFormInitializationStatement =
      "Future(() => surveyForm_mappers.initializeMappers()),";

  // Check if the utils.dart file exists
  var utilsFile = File(utilsFilePath);

  // Read the utils.dart file
  var utilsFileContent = utilsFile.readAsStringSync();

  // Normalize the whitespace in the file content
  var normalizedFileContent = utilsFileContent.replaceAll(RegExp(r'\s'), '');

  // Check if the import statement and delegate already exist in the file
  // If not, add them to the file
  if (!normalizedFileContent
      .contains(surveyFormImportStatement[0].replaceAll(RegExp(r'\s'), ''))) {
    var libraryIndex = utilsFileContent.indexOf('library app_utils;');
    if (libraryIndex != -1) {
      var endOfLibrary = libraryIndex +
          utilsFileContent.substring(libraryIndex).indexOf(';') +
          1;
      utilsFileContent = utilsFileContent.substring(0, endOfLibrary + 1) +
          '\n' +
          surveyFormImportStatement[0] +
          utilsFileContent.substring(endOfLibrary + 1);
      print('The import statement was added.');
    }
  } else {
    print('The import statement already exists.');
  }

  if (!utilsFileContent.contains(surveyFormInitializationStatement)) {
    // Add the surveyForm related initialization statement to the file
    var initializeAllMappersIndex =
    utilsFileContent.indexOf('initializeAllMappers() async {');
    if (initializeAllMappersIndex == -1) {
      print(
          'Error: Could not find a place to insert the survey form initialization statement.');
      return;
    }
    var endOfInitializeAllMappers = initializeAllMappersIndex +
        utilsFileContent.substring(initializeAllMappersIndex).indexOf(']') +
        1;
    utilsFileContent =
        utilsFileContent.substring(0, endOfInitializeAllMappers - 1) +
            '\n    ' +
            surveyFormInitializationStatement +
            utilsFileContent.substring(endOfInitializeAllMappers - 1);

    print('Survey Form initialization statement added to utils.dart');
  } else {
    print('The Survey Form initialization statement already exists.');
  }

  // Write the updated content back to the utils.dart file
  utilsFile.writeAsStringSync(utilsFileContent);
}

void _addSurveyFormConstantsToConstantsFile(
    {required String constantsFilePath}) {
  // Define the import statements
  var importStatements = [
    "import 'package:survey_form/survey_form.dart';",
  ];

  // Define the Survey Form configuration
  var SurveyFormConfiguration = '''
SurveyFormSingleton().setTenantId(envConfig.variables.tenantId);
  ''';

  // Define the local and remote repositories
  var localRepository = [
    '''
ServiceDefinitionLocalRepository(
        sql,
        ServiceDefinitionOpLogManager(isar),
      ),
      ServiceLocalRepository(
        sql,
        ServiceOpLogManager(isar),
      ),
  '''
  ];

  var remoteRepository = [
    '''
if (value == DataModelType.serviceDefinition)
          ServiceDefinitionRemoteRepository(dio, actionMap: actions),
if (value == DataModelType.service)
          ServiceRemoteRepository(dio, actionMap: actions),
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

  // Normalize the whitespace in the file content and the Survey Form configuration
  var normalizedFileContent =
  constantsFileContent.replaceAll(RegExp(r'\s'), '');
  var normalizedSurveyFormConfiguration =
  SurveyFormConfiguration.replaceAll(RegExp(r'\s'), '');

  // Check if the import statements already exist in the file
  for (var importStatement in importStatements) {
    if (!normalizedFileContent
        .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
      // Add the import statement at the top of the file
      constantsFileContent = importStatement + '\n' + constantsFileContent;
      print('The import statement was added: $importStatement');
    }
  }

  // Check if the Survey Form configuration already exists in the file
  // If not, add it to the file
  if (!normalizedFileContent.contains(normalizedSurveyFormConfiguration)) {
    // Find the setInitialDataOfPackages method and add the Survey Form configuration inside it
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
              '\n  $SurveyFormConfiguration' +
              constantsFileContent.substring(endOfSetInitialDataOfPackages - 1);
      print('The Survey Form configuration was added.');
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
            localRepository.join('\n') +
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
        remoteRepository.join('\n') +
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
    "import 'package:survey_form/survey_form.dart';",
  ];
  var localRepositories = [
    '''RepositoryProvider<
        LocalRepository<ServiceDefinitionModel,
            ServiceDefinitionSearchModel>>(
      create: (_) => ServiceDefinitionLocalRepository(
        sql,
        ServiceDefinitionOpLogManager(
          isar,
        ),
      ),
    ),
    RepositoryProvider<LocalRepository<ServiceModel, ServiceSearchModel>>(
      create: (_) => ServiceLocalRepository(
        sql,
        ServiceOpLogManager(isar),
      ),
    )'''
  ];

// Define the remote repositories of Survey Form
  var remoteRepositoriesOfSurveyForm = [
    '''if (value == DataModelType.service)
    RepositoryProvider<
        RemoteRepository<ServiceModel, ServiceSearchModel>>(
      create: (_) => ServiceRemoteRepository(
        dio,
        actionMap: actions,
      ),
    ),
    if (value == DataModelType.serviceDefinition)
      RepositoryProvider<
          RemoteRepository<ServiceDefinitionModel,
              ServiceDefinitionSearchModel>>(
        create: (_) => ServiceDefinitionRemoteRepository(
          dio,
          actionMap: actions,
        ),
      )'''
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

    // Normalize the whitespace in the file content and the remote repository of Survey Form
    var normalizedFileContent =
    networkManagerProviderWrapperFileContent.replaceAll(RegExp(r'\s'), '');

// Check if the local repository providers already exist in the file
    for (var repositoryProvider in localRepositories) {
      var normalizedLocalRepositoryOfSurveyForm =
      repositoryProvider.replaceAll(RegExp(r'\s'), '');

      if (!normalizedFileContent
          .contains(normalizedLocalRepositoryOfSurveyForm)) {
        // Add the local repository provider to the file
        networkManagerProviderWrapperFileContent =
            networkManagerProviderWrapperFileContent.replaceFirst(
                '];', '  $repositoryProvider\n];');
        print('The local repository provider was added: $repositoryProvider');
      } else {
        print('The local repository provider already exists.');
      }
    }

// Check if the remote repository of Survey Form already exists in the file
    for (var remoteRepositoryOfSurveyForm
    in remoteRepositoriesOfSurveyForm) {
      var normalizedRemoteRepositoryOfSurveyForm =
      remoteRepositoryOfSurveyForm.replaceAll(RegExp(r'\s'), '');

      if (!normalizedFileContent
          .contains(normalizedRemoteRepositoryOfSurveyForm)) {
        // Add the remote repository of Survey Form to the _getRemoteRepositories method
        var replacementString =
        networkManagerProviderWrapperFileContent.contains(']);')
            ? '  $remoteRepositoryOfSurveyForm,\n]);'
            : '  $remoteRepositoryOfSurveyForm\n]);';
        networkManagerProviderWrapperFileContent =
            networkManagerProviderWrapperFileContent.replaceFirst(
                ']);', replacementString);
        print(
            'The remote repository of Survey Form was added: $remoteRepositoryOfSurveyForm');
      } else {
        print('The remote repository of Survey Form already exists.');
      }
    }

    // Write the updated content back to the file
    networkManagerProviderWrapperFile
        .writeAsStringSync(networkManagerProviderWrapperFileContent);
  }
}

void _createLocalizationDelegatesFile(String localizationDelegatesFilePath) {
  // Define the import statement and delegate for localization
  var importStatement =
      "import 'package:survey_form/blocs/app_localization.dart' as surveyForm_localization;";
  var delegate =
  '''surveyForm_localization.SurveyFormLocalization.getDelegate(
  LocalizationLocalRepository().returnLocalizationFromSQL(sql) as Future,
  appConfig.languages!,
  ),''';

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
