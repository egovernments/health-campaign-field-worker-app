import 'dart:ui';

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

  DartPluginRegistrant.ensureInitialized();

  await initializeAllMappers();
  final info = await PackageInfo.fromPlatform();
  setupErrorWidget();

  Bloc.observer = AppBlocObserver();
  await AppSharedPreferences().init();
  if (AppSharedPreferences().isFirstLaunch) {
    AppLogger.instance.info('App Launched First Time', title: 'm  ain');
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
  FlowRegistry.setConfig(sampleFlows["flows"] as List<Map<String, dynamic>>);

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

final dynamic sampleFlows = {
  "name": "REGISTRATION-DELIVERY",
  "initialPage": "searchBeneficiary",
  "project": "CMP-2025-08-04-004846",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "searchBeneficiary",
      "heading": "Search Beneficiary",
      "description": "search beneficiary description",
      "footer": [
        {
          "format": "button",
          "label": "register beneficiary",
          "properties": {
            "type": "primary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "HOUSEHOLD",
                "data": [
                  {"key": "nameOfIndividual", "value": "searchBar.value"}
                ]
              }
            }
          ]
        },
        {
          "format": "button",
          "label": "scan beneficiary",
          "properties": {
            "type": "secondary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "EVENT",
              "properties": {
                "type": "SEARCH_EVENT",
                "name": "ENTITY // PROJECTBENEFICIARY",
                "data": [
                  {
                    "key": "tag",
                    "value": "field.value",
                    "operation": "contains"
                  }
                ]
              }
            }
          ]
        }
      ],
      "wrapperConfig": {
        "wrapperName": "HouseholdWrapper",
        "rootEntity": "HouseholdModel",
        "filters": [],
        "relations": [
          {
            "name": "members",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "clientReferenceId"
            }
          },
          {
            "name": "headOfHousehold",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "filters": [
              {"field": "isHeadOfHousehold", "equals": true}
            ]
          },
          {
            "name": "headIndividual",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "headOfHousehold.individualClientReferenceId"
            }
          },
          {
            "name": "individuals",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "inFrom": "members.individualClientReferenceId"
            }
          },
          {
            "name": "projectBeneficiaries",
            "entity": "ProjectBeneficiaryModel",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "individuals.clientReferenceId"
            }
          },
          {
            "name": "tasks",
            "entity": "TaskModel",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "inFrom": "projectBeneficiaries.clientReferenceId"
            }
          },
          {
            "name": "sideEffects",
            "entity": "SideEffectModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            }
          },
          {
            "name": "referrals",
            "entity": "ReferralModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            }
          }
        ],
        "searchConfig": {
          "primary": "household",
          "select": [
            "household",
            "individual",
            "householdMember",
            "projectBeneficiary",
            "task"
          ]
        }
      },
      "body": [
        {
          "format": "switch",
          "label": "Proximity Search",
          "fieldName": "proximitySearch",
          "onAction": [
            {
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
          ]
        },
        {
          "format": "searchBar",
          "label": "Enter the name of individual",
          "fieldName": "searchBar",
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT",
                "name": "name",
                "data": [
                  {
                    "key": "givenName",
                    "value": "field.value",
                    "operation": "contains"
                  }
                ]
              }
            }
          ]
        },
        {
          "format": "filter",
          "label": "Filter Search",
          "fieldName": "searchByFilter",
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT",
                "name": "ENTITY // TASK",
                "data": [
                  {
                    "key": "STATUS",
                    "value": "field.value",
                    "operation": "equals"
                  }
                ]
              }
            }
          ]
        },
        {
          "format": "infoCard",
          "hidden": "{{ context.household.notEmpty }}",
          "label": "No households found",
          "description":
              "Use the search above to find households or register a new one"
        },
        {
          "format": "listView",
          "hidden": "{{ context.household.empty }}",
          "fieldName": "listView",
          "data": "members",
          "child": {
            "format": "card",
            "children": [
              {
                "format": "row",
                "properties": {
                  "mainAxisAlignment": "spaceBetween",
                  "mainAxisSize": "max"
                },
                "children": [
                  {
                    "format": "text",
                    "value": "{{ context.headIndividual.name.givenName }}"
                  },
                  {
                    "format": "button",
                    "label": "Open",
                    "properties": {"type": "secondary", "size": "medium"},
                    "onAction": [
                      {
                        "actionType": "NAVIGATION",
                        "properties": {
                          "type": "TEMPLATE",
                          "name": "householdOverview",
                          "data": [
                            {
                              "key": "HouseholdClientReferenceId",
                              "value": "{{ HouseholdModel.clientReferenceId }}"
                            }
                          ]
                        }
                      }
                    ]
                  }
                ]
              },
              {
                "format": "text",
                "value": "{{ context.headOfHousehold.isHeadOfHousehold }}"
              },
              {
                "format": "table",
                "data": {
                  "source": "individuals",
                  "columns": [
                    {
                      "header": "Beneficiary",
                      "cellValue": "{{item.name.givenName}}"
                    },
                    {
                      "header": "Age",
                      "cellValue": "{{fn:formatDate(item.dateOfBirth, age)}}"
                    },
                    {"header": "Gender", "cellValue": "{{item.gender}}"}
                  ],
                  "rows": "{{contextData.0.individuals}}"
                }
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "HOUSEHOLD",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
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
              "label":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_landmark",
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
              "label":
                  "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_childrenCount",
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
          "description":
              "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_DESCRIPTION"
        },
        {
          "page": "beneficiaryDetails",
          "type": "object",
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING",
          "order": 4,
          "navigateTo": {
            "name": "beneficiary-details",
            "type": "template",
            "data": [
              {
                "key": "householdId",
                "value": "{{formData.household.clientReferenceId}}"
              }
            ]
          },
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
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers",
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
              "enums": [
                {"code": "DEFAULT", "name": "DEFAULT"},
                {
                  "code": "UNIQUE_BENEFICIARY_ID",
                  "name": "UNIQUE_BENEFICIARY_ID"
                },
                {"code": "OTHER", "name": "OTHER"}
              ],
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
              "enums": [
                {"code": "MALE", "name": "MALE"},
                {"code": "FEMALE", "name": "FEMALE"},
                {"code": "OTHER", "name": "OTHER"}
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone",
              "order": 6,
              "value": "",
              "format": "mobileNumber",
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
      "wrapperConfig": {
        "wrapperName": "HouseholdWrapper",
        "rootEntity": "HouseholdMemberModel",
        "filters": [
          {"field": "isHeadOfHousehold", "equals": true}
        ],
        "relations": [
          {
            "name": "household",
            "entity": "HouseholdModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "householdClientReferenceId"
            }
          },
          {
            "name": "members",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          },
          {
            "name": "headOfHousehold",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "HouseholdMemberModel.individualClientReferenceId"
            }
          },
          {
            "name": "individuals",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "inFrom": "members.individualClientReferenceId"
            }
          },
          {
            "name": "projectBeneficiaries",
            "entity": "ProjectBeneficiaryModel",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          },
          {
            "name": "tasks",
            "entity": "TaskModel",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "inFrom": "projectBeneficiaries.clientReferenceId"
            }
          },
          {
            "name": "sideEffects",
            "entity": "SideEffectModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          },
          {
            "name": "referrals",
            "entity": "ReferralModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          }
        ],
        "searchConfig": {
          "primary": "household",
          "select": [
            "individual",
            "household",
            "householdMember",
            "projectBeneficiary",
            "task"
          ]
        }
      },
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "beneficiaryRegistration",
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
            ],
            "data": [
              {
                "key": "HouseholdClientReferenceId",
                "value":
                    "{{contextData.entities.HouseholdModel.clientReferenceId}}"
              }
            ]
          }
        }
      ]
    },
    {
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "household",
            "data": [
              {
                "key": "clientReferenceId",
                "value": "{{navigation.HouseholdClientReferenceId}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "screenType": "TEMPLATE",
      "name": "householdOverview",
      "heading": "Household Overview",
      "description": "Overview of beneficiary",
      "wrapperConfig": {
        "wrapperName": "HouseholdWrapper",
        "rootEntity": "HouseholdModel",
        "filters": [
          {
            "field": "clientReferenceId",
            "equalsFrom": "{{context.household.clientReferenceId}}"
          }
        ],
        "relations": [
          {
            "name": "household",
            "entity": "HouseholdModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            }
          },
          {
            "name": "headOfHousehold",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "filters": [
              {"field": "isHeadOfHousehold", "equals": true}
            ]
          },
          {
            "name": "headIndividual",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "headOfHousehold.individualClientReferenceId"
            }
          },
          {
            "name": "members",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "relations": [
              {
                "name": "individual",
                "entity": "IndividualModel",
                "match": {
                  "field": "clientReferenceId",
                  "equalsFrom": "individualClientReferenceId"
                }
              },
              {
                "name": "projectBeneficiary",
                "entity": "ProjectBeneficiaryModel",
                "match": {
                  "field": "beneficiaryClientReferenceId",
                  "equalsFrom": "individual.clientReferenceId"
                }
              },
              {
                "name": "task",
                "entity": "TaskModel",
                "match": {
                  "field": "projectBeneficiaryClientReferenceId",
                  "equalsFrom": "projectBeneficiary.clientReferenceId"
                }
              },
              {
                "name": "referral",
                "entity": "ReferralModel",
                "match": {
                  "field": "projectBeneficiaryClientReferenceId",
                  "equalsFrom": "projectBeneficiary.clientReferenceId"
                }
              }
            ]
          }
        ],
        "searchConfig": {
          "primary": "household",
          "select": [
            "household",
            "individual",
            "householdMember",
            "projectBeneficiary",
            "task"
          ]
        }
      },
      "body": [
        {
          "format": "card",
          "type": "primary",
          "children": [
            {
              "format": "row",
              "properties": {"mainAxisAlignment": "end"},
              "children": [
                {
                  "format": "button",
                  "label": "Edit",
                  "properties": {
                    "type": "tertiary",
                    "size": "large",
                    "mainAxisSize": "min",
                    "mainAxisAlignment": "center"
                  },
                  "onAction": [
                    {
                      "actionType": "NAVIGATION",
                      "properties": {
                        "type": "FORM",
                        "name": "HOUSEHOLD",
                        "data": [
                          {"key": "id", "value": "{{item.id}}"}
                        ]
                      }
                    }
                  ]
                }
              ]
            },
            {
              "format": "labelPairList",
              "data": [
                {
                  "key": "Household head name",
                  "value":
                      "{{contextData.0.headIndividual.IndividualModel.name.givenName}}"
                },
                {
                  "key": "Village",
                  "value":
                      "{{contextData.0.household.HouseholdModel.address.locality.code}}"
                },
                {
                  "key": "Member Count",
                  "value":
                      "{{contextData.0.household.HouseholdModel.memberCount}}"
                }
              ]
            },
            {
              "format": "listView",
              "hidden": "{{ context.household.empty }}",
              "fieldName": "listView",
              "dataSource": "members",
              "child": {
                "format": "card",
                "type": "secondary",
                "children": [
                  {
                    "format": "row",
                    "properties": {
                      "mainAxisAlignment": "spaceBetween",
                      "mainAxisSize": "max"
                    },
                    "children": [
                      {
                        "format": "text",
                        "value": "{{ individual.0.name.givenName }}"
                      },
                      {
                        "format": "button",
                        "label": "Edit",
                        "properties": {
                          "type": "tertiary",
                          "size": "large",
                          "mainAxisSize": "min",
                          "mainAxisAlignment": "center"
                        },
                        "onAction": [
                          {
                            "actionType": "NAVIGATION",
                            "properties": {
                              "type": "TEMPLATE",
                              "name": "editBeneficiary",
                              "data": [
                                {"key": "id", "value": "{{item.id}}"}
                              ]
                            }
                          }
                        ]
                      }
                    ]
                  },
                  {
                    "format": "text",
                    "value":
                        "{{individual.0.gender }} | {{fn:formatDate(individual.0.dateOfBirth, age)}}"
                  },
                  {"format": "tag", "type": "", "label": "Not visited"},
                  {
                    "format": "row",
                    "children": [
                      {
                        "format": "button",
                        "properties": {
                          "type": "tertiary",
                          "size": "medium",
                          "mainAxisSize": "min",
                          "mainAxisAlignment": "center"
                        },
                        "label": "Add Child",
                        "icon": "add"
                      }
                    ]
                  },
                  {
                    "format": "button",
                    "properties": {
                      "type": "primary",
                      "size": "medium",
                      "mainAxisSize": "max",
                      "mainAxisAlignment": "center"
                    },
                    "label": "Delivery",
                    "icon": "add",
                    "onAction": [
                      {
                        "actionType": "NAVIGATION",
                        "properties": {
                          "type": "FORM",
                          "name": "CHECKLIST",
                          "data": [
                            {
                              "key": "selectedIndividualClientReferenceId",
                              "value": "{{individual.0.clientReferenceId}}"
                            }
                          ]
                        }
                      }
                    ]
                  }
                ]
              }
            },
            {
              "format": "button",
              "label": "Add Member",
              "properties": {
                "type": "tertiary",
                "size": "large",
                "mainAxisSize": "min",
                "mainAxisAlignment": "center"
              },
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "type": "FORM",
                    "name": "ADD_MEMBER",
                    "data": [
                      {
                        "key": "HouseholdClientReferenceId",
                        "value":
                            "{{household.HouseholdModel.clientReferenceId}}"
                      }
                    ]
                  }
                }
              ]
            }
          ]
        }
      ],
      "footer": []
    },
    {
      "screenType": "FORM",
      "name": "ADD_MEMBER",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "beneficiaryDetails",
          "type": "object",
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING",
          "order": 4,
          "navigateTo": {
            "name": "beneficiary-details",
            "type": "template",
            "data": [
              {
                "key": "householdId",
                "value": "{{formData.household.clientReferenceId}}"
              }
            ]
          },
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
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers",
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
              "enums": [
                {"code": "DEFAULT", "name": "DEFAULT"},
                {
                  "code": "UNIQUE_BENEFICIARY_ID",
                  "name": "UNIQUE_BENEFICIARY_ID"
                },
                {"code": "OTHER", "name": "OTHER"}
              ],
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
              "enums": [
                {"code": "MALE", "name": "MALE"},
                {"code": "FEMALE", "name": "FEMALE"},
                {"code": "OTHER", "name": "OTHER"}
              ],
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
      "wrapperConfig": {
        "wrapperName": "HouseholdWrapper",
        "rootEntity": "HouseholdMemberModel",
        "filters": [
          {"field": "isHeadOfHousehold", "equals": true}
        ],
        "relations": [
          {
            "name": "household",
            "entity": "HouseholdModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "householdClientReferenceId"
            }
          },
          {
            "name": "members",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          },
          {
            "name": "headOfHousehold",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "HouseholdMemberModel.individualClientReferenceId"
            }
          },
          {
            "name": "individuals",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "inFrom": "members.individualClientReferenceId"
            }
          },
          {
            "name": "projectBeneficiaries",
            "entity": "ProjectBeneficiaryModel",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          },
          {
            "name": "tasks",
            "entity": "TaskModel",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "inFrom": "projectBeneficiaries.clientReferenceId"
            }
          },
          {
            "name": "sideEffects",
            "entity": "SideEffectModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          },
          {
            "name": "referrals",
            "entity": "ReferralModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          }
        ],
        "searchConfig": {
          "primary": "household",
          "select": [
            "individual",
            "household",
            "householdMember",
            "projectBeneficiary",
            "task"
          ]
        }
      },
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "individualRegistration",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to fetch config."}
              }
            ],
            "data": [
              {
                "key": "HouseholdClientReferenceId",
                "value": "{{contextData.navigation.HouseholdClientReferenceId}}"
              }
            ]
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
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
            ],
            "data": [
              {
                "key": "HouseholdClientReferenceId",
                "value": "{{contextData.navigation.HouseholdClientReferenceId}}"
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "CHECKLIST",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "eligibilityChecklist",
          "type": "object",
          "label": "Eligibility Checklist",
          "order": 1,
          "navigateTo": {
            "name": "household-acknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "label": "Is the child sick?",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "enums": [
                {"code": "YES", "name": "YES"},
                {"code": "NO", "name": "NO"}
              ],
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "ec1",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            {
              "type": "string",
              "label": "Is the child having fever?",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "enums": [
                {"code": "YES", "name": "YES"},
                {"code": "NO", "name": "NO"}
              ],
              "visibilityCondition": {
                "expression": "eligibilityChecklist.ec1==YES"
              },
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "ec2",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            {
              "type": "string",
              "label":
                  "Is there any side effect to SPAQ which was administered last cycle?",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "enums": [
                {"code": "YES", "name": "YES"},
                {"code": "NO", "name": "NO"}
              ],
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "ec3",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            {
              "type": "string",
              "label":
                  "Child has taken SP or CTX containing drugs in the past 28 days?",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "enums": [
                {"code": "YES", "name": "YES"},
                {"code": "NO", "name": "NO"}
              ],
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "ec4",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            }
          ],
          "showAlertPopUp": {
            "title": "Ready to submit?",
            "description":
                "Based on responses you are going to '{value}'. Are you sure you want to proceed?",
            "primaryActionLabel": "Submit",
            "secondaryActionLabel": "Cancel",
            "conditions": [
              {
                "expression":
                    "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==NO",
                "value": "To Administer"
              },
              {
                "expression":
                    "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==YES",
                "value": "Ineligible flow"
              },
              {"expression": "DEFAULT", "value": "referral flow"}
            ]
          },
          "actionLabel":
              "APPONE_REGISTRATION_DELIVERYDETAILS_ACTION_BUTTON_LABEL_1",
          "description":
              "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_DESCRIPTION"
        }
      ],
      "onAction": [
        {
          "condition": {
            "expression":
                "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==NO"
          },
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "beneficiaryDetails",
                "data": [
                  {
                    "key": "selectedIndividualClientReferenceId",
                    "value":
                        "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                  }
                ],
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
          "condition": {
            "expression":
                "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==YES"
          },
          "actions": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "configName": "ineligibleConfig",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {
                      "message": "Failed to fetch ineligible config."
                    }
                  }
                ]
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "TASK",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to create task records."}
                  }
                ]
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "householdOverview",
                "data": [
                  {"key": "reason", "value": "SP_CTX_TAKEN_RECENTLY"}
                ],
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Navigation to flow failed."}
                  }
                ]
              }
            }
          ]
        },
        {
          "condition": {"expression": "DEFAULT"},
          "actions": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "configName": "referralConfig",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {
                      "message": "Failed to fetch referral config."
                    }
                  }
                ]
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "TASK",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {
                      "message": "Failed to create referral records."
                    }
                  }
                ]
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "REFERRAL",
                "data": [
                  {"key": "referralReason", "value": "HEALTH_COMPLICATIONS"}
                ],
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {
                      "message": "Navigation to referral flow failed."
                    }
                  }
                ]
              }
            }
          ]
        }
      ]
    },
    {
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "individual",
            "data": [
              {
                "key": "clientReferenceId",
                "value": "{{navigation.selectedIndividualClientReferenceId}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "screenType": "TEMPLATE",
      "name": "beneficiaryDetails",
      "heading": "Beneficiary Details",
      "description": "Details of beneficiary",
      "wrapperConfig": {
        "wrapperName": "DeliveryWrapper",
        "rootEntity": "IndividualModel",
        "filters": [],
        "relations": [
          {
            "name": "members",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "individualClientReferenceId",
              "equalsFrom": "IndividualModel.clientReferenceId"
            }
          },
          {
            "name": "household",
            "entity": "HouseholdModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "members.householdClientReferenceId"
            }
          },
          {
            "name": "individuals",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "inFrom": "members.individualClientReferenceId"
            }
          },
          {
            "name": "projectBeneficiaries",
            "entity": "ProjectBeneficiaryModel",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "individuals.clientReferenceId"
            }
          },
          {
            "name": "tasks",
            "entity": "TaskModel",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "inFrom": "projectBeneficiaries.clientReferenceId"
            }
          },
          {
            "name": "sideEffects",
            "entity": "SideEffectModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "projectBeneficiaries.clientReferenceId"
            }
          },
          {
            "name": "referrals",
            "entity": "ReferralModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "projectBeneficiaries.clientReferenceId"
            }
          }
        ],
        "fields": {
          "cycle": {
            "from": "{{tasks.additionalFields.fields}}",
            "where": {
              "left": "{{key}}",
              "operator": "eq",
              "right": "cycleIndex"
            },
            "select": "{{value}}",
            "takeLast": true,
            "default": 1
          },
          "dose": {
            "from": "{{tasks.additionalFields.fields}}",
            "where": {
              "left": "{{key}}",
              "operator": "eq",
              "right": "doseIndex"
            },
            "select": "{{value}}",
            "takeLast": true,
            "default": 1
          },
        },
        "computed": {
          "currentRunningCycle": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "where": [
              {"left": "{{startDate}}", "operator": "lt", "right": "{{now}}"},
              {"left": "{{endDate}}", "operator": "gt", "right": "{{now}}"}
            ],
            "select": "{{id}}",
            "takeFirst": true,
            "default": -1
          },
          "hasCycleArrived": {
            "condition": {
              "left": "{{cycle}}",
              "operator": "equals",
              "right": "{{currentRunningCycle}}"
            },
            "fallback": false
          },
          "isLastDoseOfCycle": {
            "condition": {
              "left": "{{dose}}",
              "operator": "lt",
              "right": "{{deliveryLength}}"
            },
            "fallback": true
          },
          "nextDoseId": {
            "condition": {
              "if": "{{isLastDoseOfCycle}}",
              "then": 1,
              "else": {"operation": "increment", "value": "{{dose}}"}
            },
            "fallback": "{{dose}}"
          },
          "nextCycleId": {
            "condition": {
              "if": "{{isLastDoseOfCycle}}",
              "then": {"operation": "increment", "value": "{{cycle}}"},
              "else": "{{cycle}}"
            },
            "fallback": "{{cycle}}"
          }
        },
        "computedList": {
          "targetCycle": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "where": {
              "left": "{{id}}",
              "operator": "equals",
              "right": "{{currentRunningCycle}}"
            },
            "takeLast": true,
            "fallback": null
          },
          "futureTasks": {
            "from": "{{tasks}}",
            "where": {
              "left": "{{item.additionalFields.deliveryStrategy}}",
              "operator": "equals",
              "right": "INDIRECT"
            }
          },
          "futureDeliveries": {
            "from":
                "singleton.selectedProject.additionalDetails.projectType.cycles",
            "map": "{{item.deliveries}}",
            "skip": {"from": "{{dose}}"},
            "takeWhile": {
              "left": "{{item.deliveryStrategy}}",
              "operator": "equals",
              "right": "INDIRECT"
            }
          },
          "currentDelivery": {
            "from": "{{targetCycle.0.deliveries}}",
            "where": {
              "left": "{{id}}",
              "operator": "equals",
              "right": "{{nextDoseId}}"
            },
            "takeLast": true,
            "fallback": null
          },
          "eligibleProductVariants": {
            "from": "{{currentDelivery.0.doseCriteria}}",
            "evaluateCondition": {
              "condition": "{{item.condition}}",
              "context": ["{{individuals.0}}", "{{household.0}}"],
              "transformations": {
                "age": {"type": "ageInMonths", "source": "dateOfBirth"}
              }
            },
            "takeLast": false,
            "fallback": []
          },
          "pastCycles": {
            "from":
                "singleton.selectedProject.additionalDetails.projectType.cycles",
            "where": {
              "left": "{{item.id}}",
              "operator": "lt",
              "right": "{{cycle}}"
            },
            "includeCurrentIf": {
              "condition": {
                "left": "{{dose}}",
                "operator": "eq",
                "right": "{{deliveryLength}}"
              }
            }
          }
        },
        "searchConfig": {
          "primary": "individual",
          "select": [
            "individual",
            "household",
            "householdMember",
            "projectBeneficiary",
            "task"
          ]
        }
      },
      "body": [
        {
          "format": "card",
          "type": "primary",
          "children": [
            {
              "format": "labelPairList",
              "data": [
                {
                  "key": "Name",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.name.givenName}}"
                },
                {
                  "key": "ID Type",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.identifiers.0.identifierType}}"
                },
                {
                  "key": "ID Number",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.identifiers.0.identifierId}}"
                },
                {
                  "key": "Age",
                  "value":
                      "{{fn:formatDate(contextData.0.individuals.IndividualModel.dateOfBirth, age)}}"
                },
                {
                  "key": "Gender",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.gender}}"
                },
                {
                  "key": "Mobile Number",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.mobileNumber}}"
                },
                {
                  "key": "Date of Registration",
                  "value":
                      "{{fn:formatDate(contextData.0.projectBeneficiaries.ProjectBeneficiaryModel.dateOfRegistration, date, dd MMMM yyyy)}}"
                }
              ]
            }
          ]
        },
        {
          "format": "card",
          "type": "primary",
          "children": [
            {
              "format": "table",
              "data": {
                "source": "contextData.targetCycle.deliveries",
                "columns": [
                  {"header": "Dose", "cellValue": "Dose {{item.doseNumber}}"},
                  {"header": "Status", "cellValue": ""},
                  {"header": "Completed On", "cellValue": ""}
                ],
                "rows": "{{contextData.0.targetCycle.0.deliveries}}"
              }
            }
          ]
        }
      ],
      "footer": [
        {
          "format": "button",
          "label": "Record Cycle {{nextCycleId}} Dose {{nextDoseId}}",
          "properties": {
            "type": "primary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "DELIVERY",
                "data": [
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{projectBeneficiaries.ProjectBeneficiaryModel.clientReferenceId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{household.HouseholdModel.clientReferenceId}}"
                  },
                  {"key": "cycleIndex", "value": "{{nextCycleId}}"},
                  {"key": "doseIndex", "value": "{{nextDoseId}}"}
                ]
              }
            }
          ]
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "DELIVERY",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "DeliveryDetails",
          "type": "object",
          "label": "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_HEADING",
          "order": 1,
          "navigateTo": {
            "name": "household-acknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "integer",
              "label":
                  "APPONE_REGISTRATION_DELIVERYDETAILS_label_dateOfDelivery",
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
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            {
              "type": "dynamic",
              "enums": [
                {"code": "SP1", "name": "SP1"},
                {"code": "SP2", "name": "SP2"},
                {"code": "AQ1", "name": "AQ1"},
                {"code": "AQ2", "name": "AQ2"}
              ],
              "label": "APPONE_REGISTRATION_DELIVERYDETAILS_label_resource",
              "order": 2,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "resourceCard",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_deliveryComments",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "deliveryComment",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.DELIVERY_COMMENT_OPTIONS_POPULATOR",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_DELIVERYDETAILS_label_scanner",
              "order": 4,
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            }
          ],
          "actionLabel":
              "APPONE_REGISTRATION_DELIVERYDETAILS_ACTION_BUTTON_LABEL_1",
          "description":
              "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_DESCRIPTION"
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "delivery",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to fetch config."}
              }
            ],
            "data": [
              {
                "key": "ProjectBeneficiaryClientReferenceId",
                "value":
                    "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
              },
              {"key": "cycleIndex", "value": "{{navigation.cycleIndex}}"},
              {"key": "doseIndex", "value": "{{navigation.doseIndex}}"}
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
            "name": "deliverySuccess",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "data": [
              {
                "key": "ProjectBeneficiaryClientReferenceId",
                "value":
                    "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
              },
              {
                "key": "HouseholdClientReferenceId",
                "value": "{{contextData.navigation.HouseholdClientReferenceId}}"
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "REFERRAL",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "DeliveryDetails",
          "type": "object",
          "label": "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_HEADING",
          "order": 1,
          "navigateTo": {
            "name": "household-acknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "integer",
              "label":
                  "APPONE_REGISTRATION_DELIVERYDETAILS_label_dateOfDelivery",
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
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            {
              "type": "dynamic",
              "label": "APPONE_REGISTRATION_DELIVERYDETAILS_label_resource",
              "order": 2,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "resourceCard",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_deliveryComments",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "deliveryComment",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.DELIVERY_COMMENT_OPTIONS_POPULATOR",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_DELIVERYDETAILS_label_scanner",
              "order": 4,
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            }
          ],
          "actionLabel":
              "APPONE_REGISTRATION_DELIVERYDETAILS_ACTION_BUTTON_LABEL_1",
          "description":
              "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_DESCRIPTION"
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "delivery",
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
            "name": "deliverySuccess",
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
      "name": "deliverySuccess",
      "heading": "Successful Delivery",
      "description": "The delivery is successful",
      "body": [
        {
          "format": "panelCard",
          "label": "Delivery Successful",
          "description": "The resource is successfully delivered",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "View Household Details",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "TEMPLATE",
                  "name": "householdOverview",
                  "data": [
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{contextData.navigation.HouseholdClientReferenceId}}"
                    }
                  ]
                }
              }
            ]
          },
          "secondaryAction": {
            "label": "Go back to home",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "TEMPLATE",
                  "name": "searchBeneficiary",
                }
              }
            ]
          }
        }
      ]
    }
  ]
};
