import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';
import 'blocs/app_bloc_observer.dart';
import 'data/local_store/app_shared_preferences.dart';
import 'data/local_store/secure_store/secure_store.dart';
import 'data/remote_client.dart';
import 'pages/error_boundary.dart';
import 'router/app_router.dart';
import 'utils/background_service.dart';
import 'utils/environment_config.dart';
import 'utils/utils.dart';

final LocalSqlDataStore _sql = LocalSqlDataStore();
late Dio _dio;
late Isar _isar;
int i = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeAllMappers();
  final info = await PackageInfo.fromPlatform();
  setupErrorWidget();

  Bloc.observer = AppBlocObserver();
  await AppSharedPreferences().init();
  if (AppSharedPreferences().isFirstLaunch) {
    AppLogger.instance.info('App Launched First Time', title: 'main');
    await AppSharedPreferences().appLaunchedFirstTime();
    await LocalSecureStore.instance.deleteAll();
  }

  await envConfig.initialize();
  WidgetsBinding.instance.addObserver(AppLifecycleObserver());
  _dio = DioClient().dio;

  DigitUi.instance.initThemeComponents();
  await Constants().initialize(info.version);
  _isar = await Constants().isar;
  await initializeService(_dio, _isar);
  FlowRegistry.setConfig(sampleFlows);

  runApp(MainApplication(
    appRouter: AppRouter(),
    isar: _isar,
    client: _dio,
    sql: _sql,
  ));
}

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    final localSecureStore = LocalSecureStore.instance;
    if (state == AppLifecycleState.paused) {
      setBgRunning(true);
      // Stop the background service when the app is terminated
    } else if (state == AppLifecycleState.resumed) {
      // Stop the background service when the app is terminated
      setBgRunning(false);
      final isRunning = await FlutterBackgroundService().isRunning();
      final localSecureStore = LocalSecureStore.instance,
          isBgRunning = await localSecureStore.isBackgroundSerivceRunning;
      if (!isRunning && isBgRunning) {}
    }
  }
}

final List<Map<String, dynamic>> sampleFlows = [
  {
    "screenType": "TEMPLATE",
    "name": "searchBeneficiary",
    "heading": "Search Beneficiary",
    "description": "search beneficiary description",
    "actions": [
      {
        "format": "button",
        "label": "register beneficiary",
        "onAction": {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "FORM",
            "name": "HOUSEHOLD",
            "data": [
              {"key": "nameOfIndividual", "value": "searchBar.value"}
            ]
          }
        }
      },
      {
        "format": "button",
        "label": "scan beneficiary",
        "onAction": {
          "actionType": "EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "ENTITY // PROJECTBENEFICIARY",
            "data": [
              {"key": "tag", "value": "field.value", "operation": "contains"}
            ]
          }
        }
      }
    ],
    "body": [
      //// everything inside the body will come
      {
        "format": "switch",
        "label": "Proximity Search",
        "fieldName": "proximitySearch",
        "onAction": {
          "actionType": "EVENT",
          "properties": {
            "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT",
            "name": "ENTITY // ADDRESS",
            "data": [
              {
                "key": "lat & long   //// NOT SURE ABOUT THIS SEARCH",
                "value": "field.value",
                "operation": "within"
              }
            ]
          }
        }
      },
      {
        "format": "searchBar",
        "label": "Enter the name of individual",
        "fieldName": "searchBar",
        "onAction": {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT",
            "name": "ENTITY // NAME",
            "data": [
              {"key": "name", "value": "field.value", "operation": "contains"}
            ]
          }
        }
      },
      {
        "format": "filter",
        "label": "Filter Search",
        "fieldName": "searchByFilter",
        "onAction": {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT",
            "name": "ENTITY // TASK",
            "data": [
              {"key": "STATUS", "value": "field.value", "operation": "equals"}
            ]
          }
        }
      },
      {
        "format": "infoCard",
        "hidden": "!stateWrapper.empty",
        "label": "Filter Search",
        "fieldName": "searchByFilter",
        "onAction": {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT",
            "name": "ENTITY // TASK",
            "data": [
              {"key": "STATUS", "value": "field.value", "operation": "equals"}
            ]
          }
        }
      },
      // {
      //   "format": "listView",
      //   "hidden": "stateWrapper.empty",
      //   "fieldName": "listRender",
      //   "child": {
      //     "format": "card",
      //     "child": {
      //       "format": "column",
      //       "children": [
      //         {
      //           "format": "row",
      //           "children": [
      //             {
      //               "format": "text",
      //               "value":
      //                   "stateWrapper.headOfName /// THINK LATER TO MAP EXACT VALUES"
      //             },
      //             {
      //               "format": "button",
      //               "label": "Open",
      //               "onAction": {
      //                 "actionType": "NAVIGATION",
      //                 "properties": {
      //                   "type": "TEMPLATE",
      //                   "name": "householdOverview"
      //                 }
      //               }
      //             }
      //           ]
      //         },
      //         {
      //           "format": "column",
      //           "children": [
      //             {"format": "text", "value": "{{item.address}}"},
      //             {
      //               "format": "button",
      //               "label": "View",
      //               "onAction": {
      //                 "actionType": "NAVIGATION",
      //                 "properties": {
      //                   "type": "FORM",
      //                   "name": "INDIVIDUAL",
      //                   "data": [
      //                     {"key": "id", "value": "{{item.id}}"}
      //                   ]
      //                 }
      //               }
      //             },
      //             {
      //               "format": "table",
      //               "columns": [
      //                 {"label": "Task", "key": "taskName"},
      //                 {"label": "Status", "key": "taskStatus"}
      //               ],
      //               "data":
      //                   "{{stateWrapper.household /// NEED TO DO EXACT MAPPING}}"
      //             },
      //             {
      //               "format": "tag",
      //               "type": "item.status",
      //               "label": "{{item.status}}"
      //             }
      //           ]
      //         }
      //       ]
      //     }
      //   }
      // }
    ],
  },
  {
    "screenType": "FORM",
    "name": "HOUSEHOLD",
    "pages": [
      {
        "page": "beneficiaryLocation",
        "type": "object",
        "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_HEADING",
        "order": 2,
        "navigateTo": {"name": "householdDetails", "type": "form"},
        "properties": [
          {
            "type": "string",
            "label":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_administrativeArea",
            "order": 1,
            "value": "",
            "format": "locality",
            "hidden": false,
            "tooltip": "",
            "helpText":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_administrativeArea_helpText",
            "infoText": "",
            "readOnly": false,
            "fieldName": "administrativeArea",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [
              {
                "type": "required",
                "value": true,
                "message": "Required field cannot be empty"
              }
            ],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "string",
            "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_latlong",
            "order": 2,
            "value": "",
            "format": "latLng",
            "hidden": false,
            "tooltip": "",
            "helpText":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_latlong_helpText",
            "infoText": "",
            "readOnly": false,
            "fieldName": "latLng",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [
              {
                "type": "required",
                "value": true,
                "message": "Required field cannot be empty"
              }
            ],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "string",
            "label":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_addressLine1",
            "order": 3,
            "value": "",
            "format": "text",
            "hidden": true,
            "tooltip": "",
            "helpText":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_addressLine1_helpText",
            "infoText": "",
            "readOnly": false,
            "fieldName": "addressLine1",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "string",
            "label":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_addressLine2",
            "order": 4,
            "value": "",
            "format": "text",
            "hidden": true,
            "tooltip": "",
            "helpText":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_addressLine2_helpText",
            "infoText": "",
            "readOnly": false,
            "fieldName": "addressLine2",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "string",
            "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_landmark",
            "order": 5,
            "value": "",
            "format": "text",
            "hidden": true,
            "tooltip": "",
            "helpText":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_landmark_helpText",
            "infoText": "",
            "readOnly": false,
            "fieldName": "landmark",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "integer",
            "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_pincode",
            "order": 6,
            "value": "",
            "format": "text",
            "hidden": true,
            "tooltip": "",
            "helpText":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_pincode_helpText",
            "infoText": "",
            "readOnly": false,
            "fieldName": "pincode",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "string",
            "enums": [
              {"code": "PERMANENT", "name": "PERMANENT"},
              {"code": "CORRESPONDENCE", "name": "CORRESPONDENCE"},
              {"code": "OTHER", "name": "OTHER"}
            ],
            "label":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_typeOfAddress",
            "order": 7,
            "value": "PERMANENT",
            "format": "dropdown",
            "hidden": true,
            "tooltip": "",
            "helpText": "",
            "infoText": "",
            "readOnly": false,
            "fieldName": "typeOfAddress",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [],
            "errorMessage": "",
            "includeInForm": true,
            "isMultiSelect": false,
            "includeInSummary": false
          }
        ],
        "actionLabel":
            "APPONE_REGISTRATION_BENEFICIARY_LOCATION_ACTION_BUTTON_LABEL_1",
        "description":
            "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_DESCRIPTION"
      },
      {
        "page": "householdDetails",
        "type": "object",
        "label": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_HEADING",
        "order": 3,
        "navigateTo": {"name": "beneficiaryDetails", "type": "form"},
        "properties": [
          {
            "type": "integer",
            "label":
                "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_dateOfRegistration",
            "order": 1,
            "value": "",
            "format": "date",
            "hidden": false,
            "tooltip": "",
            "helpText": "",
            "infoText": "",
            "readOnly": true,
            "fieldName": "dateOfRegistration",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": true,
            "validations": [
              {
                "type": "required",
                "value": true,
                "message": "Required field cannot be empty"
              }
            ],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "integer",
            "label": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_childrenCount",
            "order": 2,
            "value": "0",
            "format": "numeric",
            "hidden": false,
            "tooltip": "",
            "helpText": "",
            "infoText": "",
            "readOnly": false,
            "fieldName": "childrenCount",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "integer",
            "label":
                "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_pregnantWomenCount",
            "order": 3,
            "value": "0",
            "format": "numeric",
            "hidden": false,
            "tooltip": "",
            "helpText": "",
            "infoText": "",
            "readOnly": false,
            "fieldName": "pregnantWomenCount",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "integer",
            "label": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount",
            "order": 4,
            "value": "1",
            "format": "numeric",
            "hidden": false,
            "tooltip": "",
            "helpText": "",
            "infoText": "",
            "readOnly": false,
            "fieldName": "memberCount",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [
              {"type": "required", "value": true, "message": ""},
              {
                "type": "min",
                "value": "1",
                "message": "Total household members cannot be less than 1"
              },
              {
                "type": "max",
                "value": "10",
                "message": "Total household members cannot be more than 10"
              }
            ],
            "errorMessage": "",
            "isMultiSelect": false
          }
        ],
        "actionLabel":
            "APPONE_REGISTRATION_HOUSEHOLDDETAILS_ACTION_BUTTON_LABEL_1",
        "description": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_DESCRIPTION"
      },
      {
        "page": "beneficiaryDetails",
        "type": "object",
        "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING",
        "order": 4,
        "navigateTo": {"name": "beneficiary-details", "type": "template"},
        "properties": [
          {
            "type": "string",
            "label":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual",
            "order": 1,
            "value": "",
            "format": "text",
            "hidden": false,
            "tooltip":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_tooltip",
            "helpText":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText",
            "infoText": "",
            "readOnly": false,
            "fieldName": "nameOfIndividual",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [
              {
                "type": "required",
                "value": true,
                "message": "Required field cannot be empty"
              },
              {
                "type": "minLength",
                "value": "2",
                "message": "Size must be 2 to 200 characters"
              },
              {
                "type": "maxLength",
                "value": "200",
                "message": "Size must be 2 to 200 characters"
              }
            ],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "boolean",
            "label":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_isHeadOfFamily",
            "order": 2,
            "value": "",
            "format": "checkbox",
            "hidden": false,
            "tooltip": "",
            "helpText": "",
            "infoText": "",
            "readOnly": false,
            "fieldName": "isHeadOfFamily",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [
              {
                "type": "required",
                "value": true,
                "message": "Required field cannot be empty"
              }
            ],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "string",
            "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers",
            "order": 3,
            "value": "",
            "format": "idPopulator",
            "hidden": false,
            "tooltip": "",
            "helpText": "",
            "infoText": "",
            "readOnly": false,
            "fieldName": "identifiers",
            "deleteFlag": false,
            "innerLabel": "",
            "schemaCode": "HCM.ID_TYPE_OPTIONS_POPULATOR",
            "systemDate": false,
            "validations": [
              {
                "type": "required",
                "value": true,
                "message": "Required field cannot be empty"
              }
            ],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "string",
            "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker",
            "order": 4,
            "value": "",
            "format": "dob",
            "hidden": false,
            "tooltip":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_tooltip",
            "helpText":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_helpText",
            "infoText": "",
            "readOnly": false,
            "fieldName": "dobPicker",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "string",
            "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_gender",
            "order": 5,
            "value": "",
            "format": "select",
            "hidden": false,
            "tooltip": "",
            "helpText": "",
            "infoText": "",
            "readOnly": false,
            "fieldName": "gender",
            "deleteFlag": false,
            "innerLabel": "",
            "schemaCode": "common-masters.GenderType",
            "systemDate": false,
            "validations": [],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "integer",
            "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone",
            "order": 6,
            "value": "",
            "format": "text",
            "hidden": false,
            "tooltip":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_tooltip",
            "helpText":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_helpText",
            "infoText": "",
            "readOnly": false,
            "fieldName": "phone",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [],
            "errorMessage": "",
            "isMultiSelect": false
          },
          {
            "type": "string",
            "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_scanner",
            "order": 7,
            "value": "",
            "format": "scanner",
            "hidden": false,
            "tooltip": "",
            "helpText": "",
            "infoText": "",
            "readOnly": false,
            "fieldName": "scanner",
            "deleteFlag": false,
            "innerLabel": "",
            "systemDate": false,
            "validations": [],
            "errorMessage": "",
            "isMultiSelect": false
          }
        ],
        "actionLabel":
            "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_1",
        "description":
            "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_DESCRIPTION"
      }
    ],
    "onSubmit": [
      {
        "actionType": "FETCH_TRANSFORMER_CONFIG",
        "properties": {
          "configName": "beneficiaryCreate",
          "onError": [
            {
              "actionType": "SHOW_TOAST",
              "properties": {"message": "Failed to fetch config."}
            }
          ]
        }
      },
      {
        "actionType": "CREATE_EVENT",
        "properties": {
          "entity": "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
          "onError": [
            {
              "actionType": "SHOW_TOAST",
              "properties": {"message": "Failed to create household."}
            }
          ]
        }
      },
      {
        "actionType": "NAVIGATION",
        "properties": {
          "type": "TEMPLATE",
          "name": "householdOverview",
          "onError": [
            {
              "actionType": "SHOW_TOAST",
              "properties": {"message": "Navigation failed."}
            }
          ]
        }
      }
    ]
  },
  {
    "screenType": "TEMPLATE",
    "name": "beneficiaryOverview",
    "heading": "Beneficiary Details",
    "description": "Overview of selected beneficiary",
    "body": [
      {
        "format": "card",
        "child": {
          "format": "column",
          "children": [
            {"format": "text", "value": "Name: {{item.name}}"},
            {"format": "text", "value": "Address: {{item.address}}"},
            {
              "format": "button",
              "label": "Edit",
              "onAction": {
                "action": "ONTAP",
                "actionType": "NAVIGATION",
                "properties": {"type": "TEMPLATE", "name": "editBeneficiary"}
              }
            }
          ]
        }
      }
    ]
  },
  {
    "screenType": "TEMPLATE",
    "name": "editBeneficiary",
    "heading": "Edit Beneficiary",
    "description": "Modify details",
    "body": [
      {
        "format": "switch",
        "label": "Is Head of Household?",
        "fieldName": "isHead",
        "onAction": {
          "action": "ONTAP",
          "actionType": "UPDATE_EVENT",
          "properties": {
            "entity": "INDIVIDUAL",
            "data": [
              {"key": "isHead", "value": "field.value"}
            ]
          }
        }
      },
      {
        "format": "button",
        "label": "Save & Go to Home",
        "onAction": {
          "action": "ONTAP",
          "actionType": "NAVIGATION",
          "properties": {"type": "TEMPLATE", "name": "searchBeneficiary"}
        }
      }
    ]
  }
];
