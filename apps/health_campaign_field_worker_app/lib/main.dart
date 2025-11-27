import 'dart:ui';

import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
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
  "name": "REGISTRATION",
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
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        },
      ],
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
          "format": "qrScanner",
          "label": "Scan Beneficiary",
          "key": "selectedTag",
          "scanType": "qr",
          "updateFormData": true,
          "properties": {
            "type": "secondary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "prefixIcon": "qr_code_scanner",
          "onChange": [
            {
              "action": "SEARCH_EVENT",
              "actionType": "SEARCH_EVENT",
              "properties": {
                "name": "projectBeneficiary",
                "data": [
                  {
                    "key": "tag",
                    "value": "{{selectedTag}}",
                    "operation": "equals"
                  },
                  {
                    "key": "projectId",
                    "value": "{{singleton.selectedProject.id}}",
                    "operation": "equals"
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
          "format": "actionPopup",
          "label": "Filter search",
          "properties": {
            "type": "tertiary",
            "size": "medium",
            "mainAxisSize": "min",
            "mainAxisAlignment": "start",
            "popupConfig": {
              "type": "default",
              "title": "Filter Options",
              "titleIcon": "filter",
              "showCloseButton": true,
              "barrierDismissible": true,
              "body": [
                {
                  "format": "selectionCard",
                  "fieldName": "selectedStatus",
                  "data": [
                    {
                      "code": "ADMINISTRATION_SUCCESS",
                      "name": "Administration Success"
                    },
                    {
                      "code": "ADMINISTRATION_FAILED",
                      "name": "Administration Failed"
                    },
                  ],
                }
              ],
              "footerActions": [
                {
                  "format": "button",
                  "label": "Clear",
                  "properties": {
                    "type": "secondary",
                    "size": "large",
                    "mainAxisSize": "max"
                  },
                  "onAction": [
                    {"actionType": "CLEAR_STATE", "properties": {}},
                    {"actionType": "CLOSE_POPUP", "properties": {}}
                  ]
                },
                {
                  "format": "button",
                  "label": "Filter",
                  "properties": {
                    "type": "primary",
                    "size": "large",
                    "mainAxisSize": "max"
                  },
                  "onAction": [
                    {"actionType": "CLOSE_POPUP", "properties": {}},
                    {
                      "actionType": "SEARCH_EVENT",
                      "properties": {
                        "name": "task",
                        "data": [
                          {
                            "key": "status",
                            "value": "{{ widgetData.selectedStatus }}",
                            "operation": "in"
                          }
                        ]
                      }
                    }
                  ]
                }
              ]
            }
          },
          "suffixIcon": "filter"
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
                    "format": "textTemplate",
                    "value": "{{ headIndividual.0.name.givenName }}"
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
                "format": "textTemplate",
                "value": "{{ headOfHousehold.0.isHeadOfHousehold }}"
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
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"type": "TEMPLATE", "name": "searchBeneficiary"}
            }
          ]
        },
      ],
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
                        "format": "textTemplate",
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
                    "format": "textTemplate",
                    "value":
                        "{{individual.0.gender }} | {{fn:formatDate(individual.0.dateOfBirth, age)}}"
                  },
                  {
                    "format": "tag",
                    "type": "",
                    "label":
                        "{{fn:checkEligibilityForAgeAndSideEffect(individual.0.dateOfBirth)}}"
                  },
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
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"type": "TEMPLATE", "name": "householdOverview"}
            }
          ]
        },
      ],
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
            "default": 0
          }
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
          "deliveryLength": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "where": {
              "left": "{{id}}",
              "operator": "equals",
              "right": "{{currentRunningCycle}}"
            },
            "map": "{{deliveries.length}}",
            "default": 0
          },
          "nextDoseId": {
            "condition": {
              "if": {
                "left": "{{dose}}",
                "operator": "lt",
                "right": "{{deliveryLength}}"
              },
              "then": {"operation": "increment", "value": "{{dose}}"},
              "else": 1
            },
            "fallback": "{{dose}}"
          },
          "nextCycleId": {
            "condition": {
              "if": {
                "left": "{{dose}}",
                "operator": "lt",
                "right": "{{deliveryLength}}"
              },
              "then": "{{cycle}}",
              "else": {"operation": "increment", "value": "{{cycle}}"}
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
                  {"header": "Dose", "cellValue": "Dose {{item.id}}"},
                  {
                    "header": "Status",
                    "cellValue": {
                      "@condition": [
                        {
                          "when":
                              "{{currentItem.id}} < {{contextData.nextDoseId}}",
                          "value": "Administered"
                        },
                        {
                          "when":
                              "{{currentItem.id}} == {{contextData.nextDoseId}}",
                          "value": "To be administered"
                        },
                        {
                          "when":
                              "{{currentItem.id}} > {{contextData.nextDoseId}}",
                          "value": "Incomplete"
                        }
                      ],
                      "@default": "Unknown"
                    }
                  },
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
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"type": "TEMPLATE", "name": "householdOverview"}
            }
          ]
        },
      ],
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
final dynamic sampleReferralFlows = {
  "name": "HFREFERRAL",
  "initialPage": "referralInbox",
  "order": 9,
  "project": "LLIN-mz",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "referralInbox",
      "heading": "REFERRAL_INBOX_HEADING",
      "description": "REFERRAL_INBOX_DESCRIPTION",
      "initActions": [],
      "header": [
        {
          "format": "backLink",
          "type": "template",
          "label": "REFERRAL_INBOX_BACK_BUTTON_LABEL",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [
        {
          "format": "button",
          "type": "template",
          "fieldName": "createReferral",
          "label": "REFERRAL_INBOX_PRIMARY_ACTION_LABEL",
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
                "name": "REFERRAL_CREATE",
                "data": []
              }
            }
          ]
        },
        {
          "format": "qrScanner",
          "type": "template",
          "fieldName": "scanQr",
          "label": "REFERRAL_INBOX_SECONDARY_ACTION_LABEL",
          "properties": {
            "type": "secondary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "type": "FORM",
                "name": "COMPLAINT_CREATE",
                "data": []
              }
            }
          ]
        }
      ],
      "wrapperConfig": {
        "wrapperName": "hFReferral",
        "rootEntity": "HFReferralModel",
        "filters": [],
        "relations": [],
        "searchConfig": {
          "primary": "hFReferral",
          "select": ["hFReferral"]
        }
      },
      "body": [
        {
          "format": "searchBar",
          "type": "template",
          "label": "REFERRAL_INBOX_SEARCHBAR_LABEL",
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
          "type": "template",
          "format": "infoCard",
          "hidden": "{{ context.hFReferral.notEmpty }}",
          "label": "REFERRAL_INBOX_INFO_CARD_HEADING",
          "description": "REFERRAL_INBOX_INFO_CARD_DESCRIPTION"
        },
        {
          "type": "template",
          "format": "listView",
          "hidden": "{{ context.hFReferral.empty }}",
          "fieldName": "listView",
          "data": "hFReferral",
          "child": {
            "format": "card",
            "children": [
              {
                "type": "template",
                "format": "row",
                "properties": {
                  "mainAxisAlignment": "spaceBetween",
                  "mainAxisSize": "max"
                },
                "children": [
                  {
                    "type": "template",
                    "format": "textTemplate",
                    "value": "{{ headIndividual.0.name.givenName }}"
                  },
                  {
                    "type": "template",
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
                "format": "textTemplate",
                "value":
                    "Date of evaluation: {{ headOfHousehold.0.isHeadOfHousehold }}"
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "REFERRAL_CREATE",
      "project": "LLIN-mz",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "facilityDetails",
          "type": "object",
          "label": "HFREFERRAL_FACILITY_DETAILS_HEADING",
          "actionLabel": "HFREFERRAL_FACILITY_DETAILS_ACTION_LABEL",
          "description": "HFREFERRAL_FACILITY_DETAILS_DESCRIPTION",
          "order": 2,
          "navigateTo": {"name": "referralDetails", "type": "form"},
          "properties": [
            {
              "type": "string",
              "label": "HFREFERRAL_FACILITY_DETAILS_administrativeArea_LABEL",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "administrativeArea",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_FACILITY_DETAILS_administrativeArea_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_LABEL",
              "order": 2,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "dateOfEvaluation",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "dynamic",
              "enums": [],
              "label": "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_LABEL",
              "order": 3,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "evaluationFacility",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": false,
                  "message":
                      "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "HFREFERRAL_FACILITY_DETAILS_hfCoordinator_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "hfCoordinator",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ]
        },
        {
          "page": "referralDetails",
          "type": "object",
          "label": "HFREFERRAL_REFERRAL_DETAILS_HEADING",
          "actionLabel": "HFREFERRAL_REFERRAL_DETAILS_ACTION_LABEL",
          "description": "HFREFERRAL_REFERRAL_DETAILS_DESCRIPTION",
          "order": 3,
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "label": "HFREFERRAL_REFERRAL_DETAILS_referralCycle_LABEL",
              "order": 1,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "referralCycle",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": false,
                  "message":
                      "HFREFERRAL_REFERRAL_DETAILS_referralCycle_REQUIRED_ERROR"
                }
              ],
              // "enums": "{{project.cycle}}",
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "nameOfChild",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "HFREFERRAL_REFERRAL_DETAILS_beneficiaryId_LABEL",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "beneficiaryId",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "HFREFERRAL_REFERRAL_DETAILS_referralCode_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "referralCode",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_LABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "ageInMonths",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "OTHER", "name": "OTHER"},
                {"code": "FEMALE", "name": "FEMALE"},
                {"code": "MALE", "name": "MALE"}
              ],
              "label": "HFREFERRAL_REFERRAL_DETAILS_gender_LABEL",
              "order": 6,
              "value": "",
              "format": "dropdown",
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
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "HFREFERRAL_REFERRAL_DETAILS_gender_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "HFREFERRAL_REFERRAL_DETAILS_referralReason_LABEL",
              "order": 7,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "referralReason",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.REFERRAL_REASONS",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_REFERRAL_DETAILS_referralReason_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ],
          "conditionalNavigateTo": [
            {
              "condition": "referralDetails.referralReason==DRUG_SE_CC",
              "navigateTo": {
                "name": "sideEffectFromCurrentCycle",
                "type": "form"
              }
            },
            {
              "condition": "referralDetails.referralReason==DRUG_SE_PC",
              "navigateTo": {
                "name": "sideEffectFromPreviousCycle",
                "type": "form"
              }
            },
            {
              "condition": "referralDetails.referralReason==FEVER",
              "navigateTo": {"name": "sideEffectFever", "type": "form"}
            },
            {
              "condition": "referralDetails.referralReason==SICK",
              "navigateTo": {"name": "sideEffectSick", "type": "form"}
            }
          ]
        },
        {
          "page": "sideEffectFromCurrentCycle",
          "type": "object",
          "label": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_HEADING",
          "actionLabel": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_ACTION_LABEL",
          "description": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_DESCRIPTION",
          "order": 4.1,
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SIDE_EFFECTQ1_YES"},
                {"code": "NO", "name": "SIDE_EFFECTQ1_NO"}
              ],
              "label":
                  "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ1_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "sideEffectQ1",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ1_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SIDE_EFFECTQ2_YES"},
                {"code": "NO", "name": "SIDE_EFFECTQ2_NO"}
              ],
              "label":
                  "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ2_LABEL",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "sideEffectQ2",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ2_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SIDE_EFFECTQ3_YES"},
                {"code": "NO", "name": "SIDE_EFFECTQ3_NO"}
              ],
              "label":
                  "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ3_LABEL",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "sideEffectQ3",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ3_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ]
        },
        {
          "page": "sideEffectFromPreviousCycle",
          "type": "object",
          "label": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_HEADING",
          "actionLabel": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_ACTION_LABEL",
          "description": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_DESCRIPTION",
          "order": 4.2,
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SIDE_EFFECT_PREQ1_YES"},
                {"code": "NO", "name": "SIDE_EFFECT_PREQ1_NO"}
              ],
              "label":
                  "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ1_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "sideEffectPQ1",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ1_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SIDE_EFFECT_PREQ2_YES"},
                {"code": "NO", "name": "SIDE_EFFECT_PREQ2_NO"}
              ],
              "label":
                  "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ2_LABEL",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "sideEffectPQ2",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ2_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SIDE_EFFECT_PREQ3_YES"},
                {"code": "NO", "name": "SIDE_EFFECT_PREQ3_NO"}
              ],
              "label":
                  "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ3_LABEL",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "sideEffectPQ3",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ3_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ]
        },
        {
          "page": "sideEffectFever",
          "type": "object",
          "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_HEADING",
          "actionLabel": "HFREFERRAL_SIDEEFFECTFROMFEVER_ACTION_LABEL",
          "description": "HFREFERRAL_SIDEEFFECTFROMFEVER_DESCRIPTION",
          "order": 4.3,
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "FEVERQ1_YES"},
                {"code": "NO", "name": "FEVERQ1_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ1_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "feverQ1",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ1_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "POSITIVE", "name": "FEVERQ2_POSITIVE"},
                {"code": "NEGATIVE", "name": "FEVERQ2_NEGATIVE"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ2_LABEL",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "feverQ2",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ2_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectFever.feverQ1==YES"
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "FEVERQ3_YES"},
                {"code": "NO", "name": "FEVERQ2_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ3_LABEL",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "feverQ3",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ3_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectFever.feverQ2==NEGATIVE"
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "FEVERQ4_YES"},
                {"code": "NO", "name": "FEVERQ4_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ4_LABEL",
              "order": 4,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "feverQ4",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ4_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectFever.feverQ2==POSITIVE"
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "FEVERQ5_YES"},
                {"code": "NO", "name": "FEVERQ5_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ5_LABEL",
              "order": 5,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "feverQ5",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ5_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectFever.feverQ2==POSITIVE"
              }
            },
            {
              "type": "string",
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "feverQ6",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectFever.feverQ5==YES"
              }
            }
          ]
        },
        {
          "page": "sideEffectSick",
          "type": "object",
          "label": "HFREFERRAL_SIDEEFFECTFROMSICK_HEADING",
          "actionLabel": "HFREFERRAL_SIDEEFFECTFROMSICK_ACTION_LABEL",
          "description": "HFREFERRAL_SIDEEFFECTFROMSICK_DESCRIPTION",
          "order": 4.4,
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SICKQ1_YES"},
                {"code": "NO", "name": "SICKQ1_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ1_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "sickQ1",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ1_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "sickQ4",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectSick.sickQ1==YES"
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SICKQ2_YES"},
                {"code": "NO", "name": "SICKQ2_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ2_LABEL",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "sickQ2",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ2_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "sickQ5",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectSick.sickQ2==YES"
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SICKQ3_YES"},
                {"code": "NO", "name": "SICKQ3_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ3_LABEL",
              "order": 5,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "sickQ3",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ3_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ]
        }
      ],
      "wrapperConfig": {},
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "referralCreation",
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
            "entity": "",
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
            "name": "referralAcknowledgement",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "data": []
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "referralAcknowledgement",
      "heading": "",
      "description": "",
      "header": [],
      "body": [
        {
          "format": "panelCard",
          "type": "template",
          "fieldName": "referralSuccess",
          "label": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_LABEL",
          "description": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_DESCRIPTION",
          "properties": {"type": "success"},
          "secondaryAction": {
            "type": "template",
            "format": "button",
            "fieldName": "back",
            "label": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_ACTION_LABEL",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"type": "TEMPLATE", "name": "complaintInbox"}
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "referralOverview",
      "heading": "REFERRAL_OVERVIEW_HEADING",
      "description": "REFERRAL_OVERVIEW_DESCRIPTION",
      "initActions": [],
      "header": [
        {
          "format": "backLink",
          "type": "template",
          "label": "REFERRAL_INBOX_OVERVIEW_BACK_BUTTON_LABEL",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [
        {
          "format": "button",
          "type": "template",
          "fieldName": "createReferral",
          "label": "REFERRAL_INBOX_PRIMARY_ACTION_LABEL",
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
                "name": "REFERRAL_CREATE",
                "data": []
              }
            }
          ]
        },
        {
          "format": "qrScanner",
          "type": "template",
          "fieldName": "scanQr",
          "label": "REFERRAL_INBOX_SECONDARY_ACTION_LABEL",
          "properties": {
            "type": "secondary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "type": "FORM",
                "name": "COMPLAINT_CREATE",
                "data": []
              }
            }
          ]
        }
      ],
      "wrapperConfig": {
        "wrapperName": "hFReferral",
        "rootEntity": "HFReferralModel",
        "filters": [],
        "relations": [],
        "searchConfig": {
          "primary": "hFReferral",
          "select": ["hFReferral"]
        }
      },
      "body": [
        {
          "format": "searchBar",
          "type": "template",
          "label": "REFERRAL_INBOX_SEARCHBAR_LABEL",
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
          "type": "template",
          "format": "infoCard",
          "hidden": "{{ context.hFReferral.notEmpty }}",
          "label": "REFERRAL_INBOX_INFO_CARD_HEADING",
          "description": "REFERRAL_INBOX_INFO_CARD_DESCRIPTION"
        },
        {
          "type": "template",
          "format": "listView",
          "hidden": "{{ context.hFReferral.empty }}",
          "fieldName": "listView",
          "data": "hFReferral",
          "child": {
            "format": "card",
            "children": [
              {
                "type": "template",
                "format": "row",
                "properties": {
                  "mainAxisAlignment": "spaceBetween",
                  "mainAxisSize": "max"
                },
                "children": [
                  {
                    "type": "template",
                    "format": "textTemplate",
                    "value": "{{ headIndividual.0.name.givenName }}"
                  },
                  {
                    "type": "template",
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
                "format": "textTemplate",
                "value":
                    "Date of evaluation: {{ headOfHousehold.0.isHeadOfHousehold }}"
              }
            ]
          }
        }
      ]
    }
  ]
};
final dynamic sampleCloseHouseholdFlows = {
  "name": "CLOSEDHOUSEHOLD",
  "initialPage": "CLOSEHOUSEHOLD",
  "order": 7,
  "project": "LLIN-mz",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "FORM",
      "name": "CLOSEHOUSEHOLD",
      "project": "LLIN-mz",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "closeHouseholdDetails",
          "label": "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDDETAILS_HEADING",
          "order": 1,
          "type": "object",
          "description": "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDDETAILS_DESCRIPTION",
          "actionLabel": "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDDETAILS_ACTION_LABEL",
          "properties": [
            {
              "type": "string",
              "label":
                  "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDDETAILS_administrativeArea_LABEL",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDDETAILS_administrativeArea_HELP_TEXT",
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
                  "message":
                      "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDDETAILS_administrativeArea_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDDETAILS_latLng_LABEL",
              "order": 2,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
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
                  "message":
                      "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDDETAILS_latLng_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDDETAILS_headName_LABEL",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "headName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInForm": true,
              "validations": [
                {
                  "type": "min",
                  "value": 3,
                  "message":
                      "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDDETAILS_headName_MIN_LENGTH_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": []
            },
            {
              "type": "string",
              "label": "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDDETAILS_scanner_LABEL",
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
              "isMultiSelect": false
            }
          ],
          "value": null,
          "required": null,
          "hidden": null,
          "helpText": null,
          "innerLabel": null,
          "validations": null,
          "tooltip": null,
          "startDate": null,
          "endDate": null,
          "readOnly": null,
          "charCount": null,
          "systemDate": null,
          "isMultiSelect": null,
          "includeInForm": null,
          "includeInSummary": null,
          "autoEnable": null
        }
      ],
      "summary": true,
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "closeHouseholdRegistration",
            "data": [],
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
            "entity": "HOUSEHOLD, INDIVIDUAL, MEMBER, PROJECTBENEFICIARY",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to create stock."}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "closeHouseholdSuccess",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "data": []
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "closeHouseholdSuccess",
      "heading": "",
      "description": "",
      "header": [],
      "footer": [],
      "initActions": [],
      "body": [
        {
          "type": "template",
          "format": "panelCard",
          "label": "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDSUCCESS_HEADING",
          "description": "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDSUCCESS_DESCRIPTION",
          "properties": {"type": "success"},
          "primaryAction": {
            "label":
                "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDSUCCESS_PRIMARY_ACTION_LABEL",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"type": "HOME"}
              }
            ]
          }
        }
      ]
    }
  ]
};
final dynamic sampleComplaintFlows = {
  "name": "COMPLAINTS",
  "initialPage": "complaintInbox",
  "project": "CMP-2025-08-04-004846",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "complaintInbox",
      "heading": "COMPLAINT_INBOX_HEADING",
      "description": "COMPLAINT_INBOX_DESCRIPTION",
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "pgrService",
            "data": [
              {
                "key": "tenantId",
                "value": "{{singleton.selectedProject.tenantId}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "header": [
        {
          "format": "backLink",
          "type": "template",
          "label": "COMPLAINT_INBOX_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [
        {
          "format": "button",
          "type": "template",
          "fieldName": "fileComplaint",
          "label": "COMPLAINT_INBOX_PRIMARY_ACTION",
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
                "name": "COMPLAINT_CREATE",
                "data": []
              }
            }
          ]
        }
      ],
      "wrapperConfig": {
        "wrapperName": "ComplaintWrapper",
        "rootEntity": "PgrServiceModel",
        "filters": [],
        "relations": [],
        "searchConfig": {
          "primary": "pgrService",
          "select": ["pgrService"]
        }
      },
      "body": [
        {
          "format": "row",
          "properties": {
            "mainAxisAlignment": "spaceBetween",
            "mainAxisSize": "max"
          },
          "children": [
            {
              "type": "template",
              "format": "actionPopup",
              "label": "COMPLAINT_INBOX_SEARCH_LABEL",
              "properties": {
                "suffixIcon": "Search",
                "type": "tertiary",
                "size": "medium",
                "mainAxisSize": "min",
                "mainAxisAlignment": "start",
                "popupConfig": {
                  "type": "default",
                  "title": "COMPLAINT_INBOX_SEARCH_LABEL",
                  "titleIcon": "Search",
                  "showCloseButton": true,
                  "barrierDismissible": true,
                  "body": [
                    {
                      "type": "template",
                      "format": "textInput",
                      "label": "COMPLAINT_INBOX_SEARCH_COMPLAINT_NUMBER_LABEL",
                      "fieldName": "complaintNumber",
                    },
                    {
                      "type": "template",
                      "format": "textInput",
                      "label": "COMPLAINT_INBOX_SEARCH_MOBILE_NUMBER_LABEL",
                      "fieldName": "mobileNumber",
                    }
                  ],
                  "footerActions": [
                    {
                      "type": "template",
                      "format": "button",
                      "label": "COMPLAINT_INBOX_SEARCH_SECONDARY_ACTION_LABEL",
                      "properties": {
                        "type": "secondary",
                        "size": "large",
                        "mainAxisSize": "max"
                      },
                      "onAction": [
                        {"actionType": "CLEAR_STATE", "properties": {}},
                        {"actionType": "CLOSE_POPUP", "properties": {}}
                      ]
                    },
                    {
                      "type": "template",
                      "format": "button",
                      "label": "COMPLAINT_INBOX_SEARCH_PRIMARY_ACTION_LABEL",
                      "properties": {
                        "type": "primary",
                        "size": "large",
                        "mainAxisSize": "max"
                      },
                      "onAction": [
                        {"actionType": "CLOSE_POPUP", "properties": {}},
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "name": "PgrServiceModel",
                            "data": [
                              {
                                "key": "serviceRequestId",
                                "value": "{{ widgetData.complaintNumber }}",
                                "operation": "in"
                              },
                              {
                                "key": "serviceRequestId",
                                "value": "{{ widgetData.mobileNumber }}",
                                "operation": "in"
                              }
                            ]
                          }
                        }
                      ]
                    }
                  ]
                }
              },
            },
            {
              "type": "template",
              "format": "actionPopup",
              "label": "COMPLAINT_INBOX_FILTER_LABEL",
              "properties": {
                "type": "tertiary",
                "size": "medium",
                "mainAxisSize": "min",
                "mainAxisAlignment": "start",
                "popupConfig": {
                  "type": "default",
                  "title": "COMPLAINT_INBOX_FILTER_LABEL",
                  "titleIcon": "filter",
                  "showCloseButton": true,
                  "barrierDismissible": true,
                  "body": [
                    {
                      "type": "template",
                      "format": "radioList",
                      "fieldName": "assignTo",
                      "data": [
                        {"code": "ASSIGN_TO_ME", "name": "ASSIGN_TO_ME"},
                        {"code": "ASSIGN_TO_ALL", "name": "ASSIGN_TO_ALL"},
                      ],
                    },
                    {
                      "type": "template",
                      "format": "dropdown",
                      "label": "COMPLAINT_INBOX_FILTER_COMPLAINT_TYPE_LABEL",
                      "fieldName": "complaintType",
                      "enums": "{{fn:getUniqueComplaintTypes()}}",
                    },
                    {
                      "type": "template",
                      "format": "dropdown",
                      "label": "COMPLAINT_INBOX_FILTER_LOCALITY_TYPE_LABEL",
                      "fieldName": "locality",
                      "enums": "{{fn:getUniqueLocalities()}}",
                    }
                  ],
                  "footerActions": [
                    {
                      "type": "template",
                      "format": "button",
                      "label": "COMPLAINT_INBOX_FILTER_SECONDARY_ACTION_LABEL",
                      "properties": {
                        "type": "secondary",
                        "size": "large",
                        "mainAxisSize": "max"
                      },
                      "onAction": [
                        {"actionType": "CLEAR_STATE", "properties": {}},
                        {"actionType": "CLOSE_POPUP", "properties": {}}
                      ]
                    },
                    {
                      "type": "template",
                      "format": "button",
                      "label": "COMPLAINT_INBOX_FILTER_PRIMARY_ACTION_LABEL",
                      "properties": {
                        "type": "primary",
                        "size": "large",
                        "mainAxisSize": "max"
                      },
                      "onAction": [
                        {"actionType": "CLOSE_POPUP", "properties": {}},
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "defaultRoot": "pgrService",
                            "data": [
                              {
                                "root": "pgrComplainant",
                                "key": "name",
                                "value": "{{singleton.loggedInUserName}}",
                                "operation": "equals",
                                "applyIf":
                                    "{{ widgetData.assignTo == 'ASSIGN_TO_ME' }}"
                              },
                              {
                                "key": "serviceCode",
                                "value": "{{ widgetData.complaintType }}",
                                "operation": "equals",
                                "applyIf":
                                    "{{ widgetData.complaintType.isNotEmpty }}"
                              },
                              {
                                "root": "address",
                                "key": "locality.code",
                                "value": "{{ widgetData.locality }}",
                                "operation": "equals",
                                "applyIf":
                                    "{{ widgetData.locality.isNotEmpty }}"
                              }
                            ]
                          }
                        }
                      ]
                    }
                  ]
                }
              },
              "suffixIcon": "FilterAlt"
            },
            {
              "type": "template",
              "format": "actionPopup",
              "label": "COMPLAINT_INBOX_SORT_LABEL",
              "properties": {
                "type": "tertiary",
                "size": "medium",
                "mainAxisSize": "min",
                "mainAxisAlignment": "start",
                "popupConfig": {
                  "type": "default",
                  "title": "COMPLAINT_INBOX_SORT_POPUP_LABEL",
                  "titleIcon": "Sort",
                  "showCloseButton": true,
                  "barrierDismissible": true,
                  "body": [
                    {
                      "type": "template",
                      "format": "radioList",
                      "fieldName": "sotyBy",
                      "data": [
                        {
                          "code": "LATEST_FIRST",
                          "name": "COMPLAINT_INBOX_SORT_LATEST_FIRST"
                        },
                        {
                          "code": "LATEST_LAST",
                          "name": "COMPLAINT_INBOX_SORT_LATEST_LAST"
                        },
                      ],
                    },
                  ],
                  "footerActions": [
                    {
                      "type": "template",
                      "format": "button",
                      "label": "COMPLAINT_INBOX_SORT_SECONDARY_ACTION_LABEL",
                      "properties": {
                        "type": "secondary",
                        "size": "large",
                        "mainAxisSize": "max"
                      },
                      "onAction": [
                        {"actionType": "CLEAR_STATE", "properties": {}},
                        {"actionType": "CLOSE_POPUP", "properties": {}}
                      ]
                    },
                    {
                      "type": "template",
                      "format": "button",
                      "label": "COMPLAINT_INBOX_SORT_PRIMARY_ACTION_LABEL",
                      "properties": {
                        "type": "primary",
                        "size": "large",
                        "mainAxisSize": "max"
                      },
                      "onAction": [
                        {"actionType": "CLOSE_POPUP", "properties": {}},
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "name": "IndividualModel",
                            "data": [
                              {
                                "key": "status",
                                "value": "{{ widgetData.selectedStatus }}",
                                "operation": "in"
                              }
                            ]
                          }
                        }
                      ]
                    }
                  ]
                }
              },
              "suffixIcon": "SortSvg"
            }
          ]
        },
        {
          "format": "listView",
          "type": "template",
          "fieldName": "listView",
          "hidden": false,
          "data": "ComplaintWrapper",
          "properties": {
            "spacing": "spacer4",
          },
          "visibilityCondition": "{{ context.ComplaintWrapper.empty }}",
          "child": {
            "format": "card",
            "type": "template",
            "fieldName": "complaintCard",
            "children": [
              {
                "format": "labelPairList",
                "type": "template",
                "fieldName": "labelPairComplaint",
                "data": [
                  {
                    "key": "COMPLAINT_INBOX_COMPLAINT_NUMBER",
                    "value": "{{item.PgrServiceModel.serviceRequestId}}",
                    "defaultValue": "Sync data to generate complaint number"
                  },
                  {
                    "key": "COMPLAINT_INBOX_COMPLAINT_TYPE",
                    "value": "{{item.PgrServiceModel.serviceCode}}"
                  },
                  {
                    "key": "COMPLAINT_INBOX_COMPLAINT_DATE",
                    "value":
                        "{{fn:formatDate(item.PgrServiceModel.auditDetails.createdTime, dateTime, dd MMM yyyy)}}"
                  },
                  {
                    "key": "COMPLAINT_INBOX_COMPLAINT_AREA",
                    "value": "{{item.PgrServiceModel.address.locality.code}}"
                  },
                  {
                    "key": "COMPLAINT_INBOX_COMPLAINT_STATUS",
                    "value": "{{item.PgrServiceModel.applicationStatus}}"
                  }
                ]
              },
              {
                "format": "button",
                "type": "template",
                "fieldName": "viewDetails",
                "label": "COMPLAINT_DETAILS_VIEW_ACTION_LABEL",
                "properties": {
                  "type": "secondary",
                  "size": "large",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                },
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "type": "TEMPLATE",
                      "name": "complaintView",
                      "data": [
                        {
                          "key": "clientReferenceId",
                          "value":
                              "{{ item.PgrServiceModel.clientReferenceId }}"
                        }
                      ]
                    }
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "COMPLAINT_CREATE",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "complaintType",
          "type": "object",
          "label": "COMPLAINT_TYPE_HEADING",
          "order": 1,
          "actionLabel": "COMPLAINT_TYPE_DESCRIPTION",
          "description": "APPONE_COMPLAINTTYPE_DESCRIPTION",
          "properties": [
            {
              "type": "string",
              "label": "COMPLAINT_TYPE_complaintType_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "infoText": "",
              "readOnly": false,
              "fieldName": "complaintType",
              "deleteFlag": false,
              "innerLabel": "",
              "enums": [
                {"code": "SyncNotWorking", "name": "Sync Not Working"},
                {"code": "NotEnoughStock", "name": "Not Enough Stock"},
                {"code": "Other", "name": "Other"}
              ],
              "schemaCode": "RAINMAKER-PGR.ServiceDefs",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "COMPLAINT_TYPE_complaintType_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "COMPLAINT_TYPE_otherReason_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "otherReason",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "COMPLAINT_TYPE_otherReason_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "complaintType.complaintType==Other"
              }
            }
          ]
        },
        {
          "page": "locationDetails",
          "type": "object",
          "label": "LOCATION_DETAILS_HEADING",
          "order": 3,
          "actionLabel": "LOCATION_DETAILS_ACTION_LABEL",
          "description": "LOCATION_DETAILS_DESCRIPTION",
          "properties": [
            {
              "type": "string",
              "label": "LOCATION_DETAILS_addressLine1_LABEL",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
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
              "label": "LOCATION_DETAILS_addressLine2_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
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
              "label": "LOCATION_DETAILS_landmark_LABEL",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
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
              "label": "LOCATION_DETAILS_pincode_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
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
              "label": "LOCATION_DETAILS_typeOfAddress_LABEL",
              "order": 5,
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
          ]
        },
        {
          "page": "complaintDetails",
          "type": "object",
          "label": "COMPLAINT_DETAILS_HEADING",
          "order": 4,
          "navigateTo": {
            "name": "ComplaintsAcknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "label": "COMPLAINT_DETAILS_administrativeArea_LABEL",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
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
                  "message":
                      "COMPLAINT_DETAILS_administrativeArea_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {
                  "code": "COMPLAINTS_RAISED_FOR_MYSELF",
                  "name": "COMPLAINTFLOW_RAISED_FOR_MYSELF"
                },
                {
                  "code": "COMPLAINTS_RAISED_FOR_ANOTHER_USER",
                  "name": "COMPLAINTFLOW_RAISED_FOR_ANOTHER_USER"
                }
              ],
              "label": "COMPLAINT_DETAILS_complaintRaisedFor_LABEL",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "complaintRaisedFor",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "COMPLAINT_DETAILS_complaintRaisedFor_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "COMPLAINT_DETAILS_name_LABEL",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "name",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "COMPLAINT_DETAILS_name_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "autoFillCondition": [
                {
                  "value": "{{loggedInUserName}}",
                  "expression":
                      "complaintDetails.complaintRaisedFor==COMPLAINTS_RAISED_FOR_MYSELF"
                }
              ]
            },
            {
              "type": "string",
              "label": "COMPLAINT_DETAILS_contactNumber_LABEL",
              "order": 4,
              "value": "",
              "format": "mobileNumber",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "contactNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "prefixText": "+91",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "COMPLAINT_DETAILS_contactNumber_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "autoFillCondition": [
                {
                  "value": "{{loggedInUserMobileNumber}}",
                  "expression":
                      "complaintDetails.complaintRaisedFor==COMPLAINTS_RAISED_FOR_MYSELF"
                }
              ]
            },
            {
              "type": "string",
              "label": "COMPLAINT_DETAILS_supervisorName_LABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "supervisorName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "COMPLAINT_DETAILS_supervisorContactNumber_LABEL",
              "order": 6,
              "value": "",
              "format": "mobileNumber",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "supervisorContactNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "prefixText": "+91",
              "systemDate": false,
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "COMPLAINT_DETAILS_complaintDescription_LABEL",
              "order": 7,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "complaintDescription",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "COMPLAINT_DETAILS_complaintDescription_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ],
          "actionLabel": "COMPLAINT_DETAILS_ACTION_LABEL",
          "description": "COMPLAINT_DETAILS_DESCRIPTION"
        }
      ],
      "wrapperConfig": {
        "wrapperName": "ComplaintWrapper",
        "rootEntity": "PgrServiceModel",
        "filters": [],
        "relations": [],
        "searchConfig": {
          "primary": "pgrService",
          "select": ["pgrService"]
        }
      },
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "complaintRegistration",
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
            "entity": "",
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
            "name": "complaintAcknowledgement",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "data": [
              {
                "key": "complaintClientReferenceId",
                "value":
                    "{{contextData.entities.PgrServiceModel.clientReferenceId}}"
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "complaintAcknowledgement",
      "heading": "",
      "description": "",
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"type": "TEMPLATE", "name": "complaintInbox"}
            }
          ]
        }
      ],
      "body": [
        {
          "format": "panelCard",
          "type": "template",
          "fieldName": "complaintSuccess",
          "label": "COMPLAINT_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_LABEL",
          "description":
              "COMPLAINT_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_DESCRIPTION",
          "properties": {"type": "success"},
          "secondaryAction": {
            "type": "template",
            "format": "button",
            "fieldName": "backToComplaints",
            "label":
                "COMPLAINT_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_ACTION_LABEL",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"type": "TEMPLATE", "name": "complaintInbox"}
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "complaintView",
      "heading": "COMPLAINT_VIEW_HEADING",
      "description": "",
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [
        {
          "format": "button",
          "type": "template",
          "fieldName": "close",
          "label": "COMPLAINT_VIEW_ACTION_LABEL",
          "properties": {
            "type": "primary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {"type": "TEMPLATE", "name": "complaintInbox"}
            }
          ]
        }
      ],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "pgrService",
            "data": [
              {
                "key": "clientReferenceId",
                "value": "{{navigation.clientReferenceId}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "ComplaintWrapper",
        "rootEntity": "PgrServiceModel",
        "filters": [],
        "relations": [],
        "searchConfig": {
          "primary": "pgrService",
          "select": ["pgrService"]
        }
      },
      "body": [
        {
          "format": "card",
          "type": "template",
          "fieldName": "listOfComplaints",
          "children": [
            {
              "format": "labelPairList",
              "type": "template",
              "fieldName": "complaintsLabelPair",
              "data": [
                {
                  "key": "COMPLAINT_VIEW_COMPLAINTS_NUMBER",
                  "value": "{{0.PgrServiceModel.serviceRequestId}}",
                  "defaultValue": "Sync data to generate complaint number"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINTS_TYPE",
                  "value": "{{0.PgrServiceModel.serviceCode}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINTS_DATE",
                  "value":
                      "{{fn:formatDate(0.PgrServiceModel.auditDetails.createdTime, dateTime, dd MMM yyyy)}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINTS_AREA",
                  "value": "{{0.PgrServiceModel.address.locality.code}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINANT_CONTACT",
                  "value": "{{0.PgrServiceModel.user.mobileNumber}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINT_STATUS",
                  "value": "{{0.PgrServiceModel.applicationStatus}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINT_DESCRIPTION",
                  "value": "{{0.PgrServiceModel.description}}",
                  "defaultValue": "NA"
                }
              ]
            }
          ]
        }
      ]
    }
  ]
};

final dynamic sampleInventoryFlows = {
  "name": "INVENTORY",
  "initialPage": "manageStock",
  "project": "CMP-2025-08-04-004846",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "manageStock",
      "heading": "INVENTORY_MANAGE_STOCK_HEADING",
      "description": "INVENTORY_MANAGE_STOCK_DESCRIPTION",
      "header": [
        {
          "format": "backLink",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        },
      ],
      "footer": [
        {
          "format": "button",
          "label": "INVENTORY_VIEW_TRANSACTIONS_LABEL",
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
                "type": "TEMPLATE",
                "name": "viewTransaction",
                "data": []
              }
            }
          ]
        }
      ],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "projectFacility",
            "data": [
              {
                "key": "projectId",
                "value": "{{singleton.selectedProject.id}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "InventoryWrapper",
        "groupByType": true,
        "rootEntity": "ProjectFacilityModel",
        "filters": [],
        "relations": [
          {
            "name": "facility",
            "entity": "FacilityModel",
            "match": {"field": "id", "equalsFrom": "facilityId"}
          },
          {
            "name": "productVariant",
            "entity": "ProductVariantModel",
            "match": {"field": "id", "equalsFrom": "resource"}
          }
        ],
        "searchConfig": {
          "primary": "projectFacility",
          "select": ["projectFacility", "productVariant"]
        }
      },
      "body": [
        {
          "format": "menu_card",
          "heading": "INVENTORY_RECORD_STOCK_RECEIPT_HEADING",
          "description": "INVENTORY_RECORD_STOCK_RECEIPT_DESCRIPTION",
          "icon": 'FileUpload',
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "MANAGESTOCK",
                "data": [
                  {"key": "stockEntryType", "value": "RECEIPT"},
                  {"key": "transactionType", "value": "RECEIVED"},
                  {
                    "key": "mrnNumber",
                    "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
                  }
                ]
              }
            }
          ]
        },
        {
          "format": "menu_card",
          "heading": "INVENTORY_RECORD_STOCK_ISSUED_HEADING",
          "description": "INVENTORY_RECORD_STOCK_ISSUED_DESCRIPTION",
          "icon": 'FileDownload',
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "MANAGESTOCK",
                "data": [
                  {"key": "stockEntryType", "value": "ISSUED"},
                  {"key": "transactionType", "value": "DISPATCHED"},
                  {
                    "key": "mrnNumber",
                    "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
                  }
                ]
              }
            }
          ]
        },
        {
          "format": "menu_card",
          "heading": "INVENTORY_STOCK_RETURNED_HEADING",
          "description": "INVENTORY_STOCK_RETURNED_DESCRIPTION",
          "icon": 'Restore',
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "MANAGESTOCK",
                "data": [
                  {"key": "stockEntryType", "value": "RETURNED"},
                  {"key": "transactionType", "value": "RECEIVED"},
                  {
                    "key": "mrnNumber",
                    "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
                  }
                ]
              }
            }
          ]
        },
        {
          "format": "menu_card",
          "heading": "INVENTORY_STOCK_DAMAGED_HEADING",
          "visible": "{{fn:hasRole('WAREHOUSE_MANAGER')}} == false",
          "description": "INVENTORY_STOCK_DAMAGED_DESCRIPTION",
          "icon": 'Store',
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "MANAGESTOCK",
                "data": [
                  {"key": "stockEntryType", "value": "DAMAGED"},
                  {"key": "transactionType", "value": "DISPATCHED"},
                  {
                    "key": "mrnNumber",
                    "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
                  }
                ]
              }
            }
          ]
        },
        {
          "format": "menu_card",
          "heading": "INVENTORY_STOCK_LOSS_HEADING",
          "visible": "{{fn:hasRole('WAREHOUSE_MANAGER')}} == false",
          "description": "INVENTORY_STOCK_LOSS_DESCRIPTION",
          "icon": 'Store',
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "MANAGESTOCK",
                "data": [
                  {"key": "stockEntryType", "value": "LOSS"},
                  {"key": "transactionType", "value": "DISPATCHED"},
                  {
                    "key": "mrnNumber",
                    "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
                  }
                ]
              }
            }
          ]
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "MANAGESTOCK",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "warehouseDetails",
          "label": "APPONE_MANAGESTOCK_WAREHOUSE_SCREEN_HEADING",
          "order": 1,
          "type": "object",
          "description": "APPONE_MANAGESTOCK_WAREHOUSE_SCREEN_DESCRIPTION",
          "actionLabel": "APPONE_MANAGESTOCK_WAREHOUSE_ACTION_BUTTON_LABEL_1",
          "properties": [
            {
              "type": "integer",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_dateOfReceipt",
              "order": 1,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the date on which the stock was received",
              "infoText": "",
              "readOnly": true,
              "fieldName": "dateOfEntry",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "includeInForm": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_dateOfReceipt_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_administrativeArea",
              "order": 2,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select the administrative area of the warehouse",
              "infoText": "",
              "readOnly": false,
              "fieldName": "administrativeArea",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInForm": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_administrativeArea_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "dynamic",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityToWhich",
              "order": 3,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "Select the facility to which the stock is being sent",
              "infoText": "",
              "readOnly": false,
              "fieldName": "facilityToWhich",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityToWhich_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "includeInForm": true,
              "enums": [],
            },
            {
              "type": "string",
              "visibilityCondition": {
                "expression": "warehouseDetails.facilityToWhich==Delivery Team"
              },
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_teamCode",
              "order": 4,
              "value": "",
              "format": "scanner",
              "hidden": false,
              "tooltip": "",
              "helpText": "Scan Team Code",
              "infoText": "",
              "readOnly": false,
              "fieldName": "teamCode",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityToWhich_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [],
            },
          ],
          "navigateTo": {"name": "stockDetails", "type": "form"}
        },
        {
          "page": "stockDetails",
          "label": "APPONE_INVENTORY_STOCKDETAILS_SCREEN_HEADING",
          "order": 2,
          "type": "object",
          "format": null,
          "description": "APPONE_INVENTORY_STOCKDETAILS_SCREEN_DESCRIPTION",
          "actionLabel": "APPONE_INVENTORY_STOCKDETAILS_ACTION_BUTTON_LABEL",
          "properties": [
            {
              "type": "dynamic",
              "label": "APPONE_INVENTORY_PRODUCTDETAILS_LABEL",
              "order": 1,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select multiple products which are being recorded",
              "infoText": "",
              "readOnly": false,
              "fieldName": "productdetail",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.DELIVERY_COMMENT_OPTIONS_POPULATOR",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Product selection is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": true,
              "enums": []
            },
            {
              "type": "dynamic",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityFromWhich",
              "order": 2,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "Select the facility from which the stock is being received",
              "infoText": "",
              "readOnly": false,
              "fieldName": "facilityFromWhich",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityToWhich_mandatory_message"
                },
                {
                  "type": "notEqualTo",
                  "value": "warehouseDetails.facilityToWhich",
                  "message": "Facility from and to must be different"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "includeInForm": true,
              "schemaCode": "HCM.FACILITY_OPTIONS_POPULATOR"
            },
            {
              "type": "string",
              "visibilityCondition": {
                "expression": "stockDetails.facilityFromWhich==Delivery Team"
              },
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_deliveryTeamCode",
              "order": 4,
              "value": "",
              "format": "scanner",
              "hidden": false,
              "tooltip": "",
              "helpText": "Scan Team Code",
              "infoText": "",
              "readOnly": false,
              "fieldName": "deliveryTeam",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityFromWhich_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [],
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_TRANSPORT_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select the type of transport used",
              "infoText": "",
              "readOnly": false,
              "fieldName": "transportType",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Transport type is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "BUS", "name": "Bus"},
                {"code": "TRUCK", "name": "Truck"}
              ]
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_VEHICLE_NUMBER_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the vehicle number",
              "infoText": "",
              "readOnly": false,
              "fieldName": "vehicleNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Vehicle number is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
          ],
          "value": null,
          "required": null,
          "hidden": null,
          "helpText": null,
          "innerLabel": null,
          "validations": null,
          "tooltip": null,
          "startDate": null,
          "endDate": null,
          "readOnly": null,
          "charCount": null,
          "systemDate": null,
          "isMultiSelect": null,
          "includeInForm": null,
          "includeInSummary": null,
          "autoEnable": null,
          "navigateTo": {"name": "stockProductDetails", "type": "form"}
        },
        {
          "page": "stockProductDetails",
          "label": "APPONE_INVENTORY_PRODUCTDETAILS_SCREEN_HEADING",
          "order": 3,
          "type": "object",
          "format": null,
          "description": "APPONE_INVENTORY_PRODUCTDETAILS_SCREEN_DESCRIPTION",
          "actionLabel":
              "APPONE_INVENTORY_PRODUCTDETAILS_ACTION_BUTTON_LABEL_1",
          "multiEntityConfig": {
            "sourcePageKey": "stockDetails",
            "sourceFieldKey": "productdetail"
          },
          "properties": [
            {
              "type": "string",
              "label": "APPONE_INVENTORY_WAYBILL_LABEL",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the waybill number",
              "infoText": "",
              "readOnly": false,
              "fieldName": "wayBillNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": false,
                  "message": "Waybill number is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_BATCH_NUMBER_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the batch number",
              "infoText": "",
              "readOnly": false,
              "fieldName": "batchNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": false,
                  "message": "Batch number is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_EXPIRY_DATE_LABEL",
              "order": 3,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select the expiry date",
              "infoText": "",
              "readOnly": false,
              "fieldName": "expiryDate",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Expiry date is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_QUANTITY_SENT_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the quantity sent by the warehouse",
              "infoText": "",
              "readOnly": false,
              "fieldName": "quantitySent",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Quantity sent is required"
                },
                {
                  "type": "regex",
                  "value": r"^[0-9]+$",
                  "message": "Please enter a valid number"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_QUANTITY_RECEIVED_LABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the actual quantity received",
              "infoText": "",
              "readOnly": false,
              "fieldName": "quantityReceived",
              "deleteFlag": false,
              "innerLabel": "",
              "visibilityCondition": {
                "expression":
                    "{{navigation.transactionType}} == 'RECEIVED' && stockDetails.facilityFromWhich != 'National Warehouse'"
              },
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Quantity received is required"
                },
                {
                  "type": "regex",
                  "value": r"^[0-9]+$",
                  "message": "Please enter a valid number"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_COMMENT_LABEL",
              "order": 7,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText": "Add comments if quantities differ",
              "infoText": "",
              "readOnly": false,
              "fieldName": "comment",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "visibilityCondition": {
                "expression":
                    "stockProductDetails.quantitySent!=stockProductDetails.quantityReceived"
              },
              "validations": [
                {
                  "type": "required",
                  "value": false,
                  "message": "Comment is required when quantities differ"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_scanResource",
              "order": 8,
              "value": "",
              "format": "scanner",
              "validations": [
                {"type": "isGS1", "value": true, "message": ""}
              ],
              "hidden": false,
              "tooltip": "",
              "helpText": "Scan Resource",
              "infoText": "",
              "readOnly": false,
              "fieldName": "scanResource",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [],
            },
          ],
          "value": null,
          "required": null,
          "hidden": null,
          "helpText": null,
          "innerLabel": null,
          "validations": null,
          "tooltip": null,
          "startDate": null,
          "endDate": null,
          "readOnly": null,
          "charCount": null,
          "systemDate": null,
          "isMultiSelect": null,
          "includeInForm": null,
          "includeInSummary": null,
          "autoEnable": null,
          "navigateTo": {"name": "stock-acknowledgement", "type": "template"}
        },
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "stock",
            "data": [
              {
                "key": "stockEntryType",
                "value": "{{navigation.stockEntryType}}"
              },
              {
                "key": "transactionType",
                "value": "{{navigation.transactionType}}"
              },
              {"key": "mrnNumber", "value": "{{navigation.mrnNumber}}"}
            ],
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
            "entity": "STOCK",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to create stock."}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "stockSuccess",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "data": [
              {"key": "mrnNumber", "value": "{{navigation.mrnNumber}}"}
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "stockSuccess",
      "heading": "",
      "description": "",
      "body": [
        {
          "format": "panelCard",
          "label": "INVENTORY_STOCK_SUCCESS_LABEL",
          "description":
              "INVENTORY_STOCK_SUCCESS_MRN_DESCRIPTION {{navigation.mrnNumber}}",
          "additionalWidgets": [
            {
              "format": "qr_view",
              "data": "{{navigation.mrnNumber}}",
              "size": "medium",
              "errorCorrectionLevel": "M",
              "dataModuleColor": "black",
              "backgroundColor": "white",
              "padding": 16,
              "visible": "{{fn:hasRole('DISTRIBUTOR')}}",
            }
          ],
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "INVENTORY_VIEW_TRANSACTION_LABEL",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "TEMPLATE",
                  "name": "viewTransactionDetails",
                  "data": [
                    {
                      "key": "selectedStock",
                      "value": "{{navigation.mrnNumber}}"
                    }
                  ]
                }
              }
            ]
          },
          "secondaryAction": {
            "label": "INVENTORY_CREATE_NEW_TRANSACTION_LABEL",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "TEMPLATE",
                  "name": "manageStock",
                }
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "viewTransaction",
      "heading": "INVENTORY_VIEW_TRANSACTION_HEADING",
      "description": "INVENTORY_VIEW_TRANSACTION_DESCRIPTION",
      "header": [
        {
          "format": "backLink",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        },
      ],
      "footer": [],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "stock",
            "data": [
              {
                "key": "clientCreatedBy",
                "value": "{{singleton.loggedInUserUuid}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "ViewStockWrapper",
        "groupByType": true,
        "rootEntity": "StockModel",
        "groupBy": "additionalFields.fields.mrnNumber",
        "filters": [],
        "relations": [
          {
            "name": "stock",
            "entity": "StockModel",
            "match": {
              "field": "clientAuditDetails.createdBy",
              "equalsFrom": "{{singleton.loggedInUserUuid}}"
            }
          },
        ],
        "searchConfig": {
          "primary": "stock",
          "select": ["stock"],
          "orderBy": {"field": "clientCreatedTime", "order": "DESC"}
        }
      },
      "body": [
        {
          "format": "infoCard",
          "hidden": "{{ context.stock.isNotEmpty }}",
          "label": "INVENTORY_NO_TRANSACTIONS_LABEL",
          "description": "INVENTORY_NO_TRANSACTIONS_DESCRIPTION"
        },
        {
          "format": "listView",
          "hidden": "{{ context.stock.isEmpty }}",
          "fieldName": "listView",
          "dataSource": "StockModel",
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
                    "format": "tag",
                    "type": "",
                    "label": "INVENTORY_MRN_TAG_LABEL {{item.groupKey}}"
                  },
                  {
                    "format": "textTemplate",
                    "value":
                        "{{fn:formatDate(item.items[0].dateOfEntry, dateTime, dd MMMM yyyy)}}"
                  }
                ]
              },
              {
                "format": "row",
                "properties": {
                  "mainAxisAlignment": "spaceBetween",
                  "mainAxisSize": "max"
                },
                "children": [
                  {
                    "format": "column",
                    "properties": {
                      "mainAxisAlignment": "spaceBetween",
                      "mainAxisSize": "min"
                    },
                    "children": [
                      {
                        "format": "textTemplate",
                        "value": "INVENTORY_ISSUED_TO_LABEL"
                      },
                      {
                        "format": "textTemplate",
                        "value": "{{item.items[0].receiverId}}"
                      }
                    ]
                  },
                  {
                    "format": "actionPopup",
                    "label": "INVENTORY_VIEW_QR_LABEL",
                    "properties": {
                      "type": "tertiary",
                      "size": "medium",
                      "mainAxisSize": "min",
                      "mainAxisAlignment": "start",
                      "popupConfig": {
                        "type": "default",
                        "title": "INVENTORY_QR_CODE_TITLE",
                        "titleIcon": "qr",
                        "showCloseButton": true,
                        "barrierDismissible": true,
                        "body": [
                          {
                            "format": "qr_view",
                            "data":
                                "{{item.items[0].additionalFields.fields.mrnNumber}}",
                            "size": "medium",
                            "errorCorrectionLevel": "M",
                            "dataModuleColor": "black",
                            "backgroundColor": "white",
                            "padding": 16
                          }
                        ],
                        "footerActions": []
                      }
                    },
                    "suffixIcon": "qr"
                  }
                ]
              },
              {
                "format": "listView",
                "fieldName": "groupedItems",
                "dataSource": "item.items",
                "child": {
                  "format": "textTemplate",
                  "value":
                      "{{item.additionalFields.fields.sku}}: {{item.quantity}}"
                }
              },
              {
                "format": "button",
                "label": "INVENTORY_SELECT_TRANSACTION_LABEL",
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
                      "type": "TEMPLATE",
                      "name": "viewTransactionDetails",
                      "data": [
                        {"key": "selectedStock", "value": "{{item.groupKey}}"}
                      ]
                    }
                  }
                ]
              },
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "viewTransactionDetails",
      "heading": "INVENTORY_STOCK_RECEIPT_DETAILS_HEADING",
      "description": "",
      "header": [
        {
          "format": "backLink",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"type": "TEMPLATE", "name": "viewTransaction"}
            }
          ]
        }
      ],
      "footer": [],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "stock",
            "data": [
              {
                "key": "additionalFields",
                "value": "{{navigation.selectedStock}}",
                "operation": "contains"
              }
            ]
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "ViewStockDetailsWrapper",
        "groupByType": true,
        "rootEntity": "StockModel",
        "filters": [],
        "relations": [
          {
            "name": "stock",
            "entity": "StockModel",
          }
        ],
        "searchConfig": {
          "primary": "stock",
          "select": ["stock"],
        }
      },
      "body": [
        {
          "format": "listView",
          "fieldName": "stockItems",
          "dataSource": "StockModel",
          "child": {
            "format": "card",
            "children": [
              {
                "format": "labelPairList",
                "data": [
                  {
                    "key": "INVENTORY_RESOURCE_LABEL",
                    "value": "{{item.additionalFields.fields.sku}}"
                  },
                  {
                    "key": "INVENTORY_RECEIVED_FROM_LABEL",
                    "value": "{{item.receiverId}}"
                  },
                  {
                    "key": "INVENTORY_MRN_NUMBER_LABEL",
                    "value": "{{item.additionalFields.fields.mrnNumber}}"
                  },
                  {
                    "key": "INVENTORY_WAYBILL_NUMBER_LABEL",
                    "value": "{{item.wayBillNumber}}"
                  },
                  {
                    "key": "INVENTORY_BATCH_NUMBER_LABEL",
                    "value": "{{item.additionalFields.fields.batchNumber}}"
                  },
                  {
                    "key": "INVENTORY_EXPIRY_LABEL",
                    "value":
                        "{{fn:formatDate(item.additionalFields.fields.expiryDate, dateTime, dd MMMM yyyy)}}"
                  },
                  {
                    "key":
                        "{{fn:getQuantityLabel(item.additionalFields.fields.sku)}}",
                    "value": "{{item.quantity}}"
                  },
                  {
                    "key": "INVENTORY_COMMENTS_LABEL",
                    "value": "{{item.additionalFields.fields.comments}}"
                  }
                ]
              }
            ]
          }
        }
      ]
    }
  ]
};

final dynamic inventoryReportFlows = {
  "name": "STOCKREPORTS",
  "initialPage": "viewReports",
  "order": 5,
  "project": "LLIN-mz",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "viewReports",
      "heading": "STOCKREPORTS_VIEW_REPORTS_HEADING",
      "description": "STOCKREPORTS_VIEW_REPORTS_DESCRIPTION",
      "header": [
        {
          "type": "template",
          "format": "backLink",
          "label": "STOCKREPORTS_VIEW_REPORTS_BACK_BUTTON_LABEL",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "projectFacility",
            "data": [
              {
                "key": "projectId",
                "value": "{{singleton.selectedProject.id}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "InventoryWrapper",
        "groupByType": true,
        "rootEntity": "ProjectFacilityModel",
        "filters": [],
        "relations": [
          {
            "name": "facility",
            "entity": "FacilityModel",
            "match": {"field": "id", "equalsFrom": "facilityId"}
          },
          {
            "name": "productVariant",
            "entity": "ProductVariantModel",
            "match": {"field": "id", "equalsFrom": "resource"}
          }
        ],
        "searchConfig": {
          "primary": "projectFacility",
          "select": ["projectFacility", "facility", "productVariant"]
        }
      },
      "body": [
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_RECIEVE_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_RECIEVE_DESCRIPTION",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "receipt"},
                  {"key": "facilities", "value": "{{FacilityModel}}"},
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_ISSUED_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_ISSUED_DESCRIPTION",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "dispatch"},
                  {"key": "facilities", "value": "{{FacilityModel}}"},
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_RETURNED_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_RETURNED_DESCRIPTION",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "returned"},
                  {"key": "facilities", "value": "{{FacilityModel}}"},
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_DAMAGED_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_DAMAGED_DESCRIPTION",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "damage"},
                  {"key": "facilities", "value": "{{FacilityModel}}"},
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_LOSS_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_LOSS_DESCRIPTION",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "loss"},
                  {"key": "facilities", "value": "{{FacilityModel}}"},
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_RECON_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_RECON_DESCRIPTION",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "reconciliation"},
                  {"key": "facilities", "value": "{{FacilityModel}}"},
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "reportDetails",
      "heading": "STOCKREPORTS_REPORT_DETAILS_HEADING",
      "description": "STOCKREPORTS_REPORT_DETAILS_DESCRIPTION",
      "initActions": [],
      "wrapperConfig": {
        "wrapperName": "StockReportWrapper",
        "groupByType": true,
        "rootEntity": "Stock",
        "filters": [],
        "relations": [],
        "searchConfig": {
          "primary": "stock",
          "select": ["stock"]
        }
      },
      "header": [
        {
          "type": "template",
          "format": "backLink",
          "label": "STOCKREPORTS_REPORT_DETAILS_BACK_BUTTON_LABEL",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [
        {
          "type": "template",
          "format": "button",
          "label": "STOCKREPORTS_REPORT_DETAILS_SECONDARY_ACTION_LABEL",
          "properties": {
            "type": "secondary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "body": [
        {
          "type": "template",
          "format": "card",
          "children": [
            {
              "type": "template",
              "format": "dropdown",
              "label": "STOCKREPORTS_REPORT_DETAILS_SELECT_WAREHOUSE_LABEL",
              "required": true,
              "key": "selectedFacility",
              "source": "{{navigation.facilities}}",
              "displayKey": "id",
              "valueKey": "id",
              "visible": "{{fn:hasRole('WAREHOUSE_MANAGER')}}",
              "onChange": [
                {
                  "actionType": "SEARCH_EVENT",
                  "properties": {
                    "type": "SEARCH_EVENT",
                    "name": "stock",
                    "data": [
                      {
                        "key": "tenantId",
                        "value": "{{singleton.selectedProject.tenantId}}",
                        "operation": "equals"
                      },
                      {
                        "key": "productVariantId",
                        "value": "{{selectedProduct}}",
                        "operation": "equals"
                      },
                      {
                        "key": "transactionType",
                        "value":
                            "{{fn:getTransactionType(navigation.reportType)}}",
                        "operation": "in"
                      },
                      {
                        "key":
                            "{{fn:getSenderOrReceiver(navigation.reportType)}}",
                        "value": "{{selectedFacility}}",
                        "operation": "equals"
                      }
                    ]
                  }
                }
              ]
            },
            {
              "type": "template",
              "format": "dropdown",
              "label": "STOCKREPORTS_REPORT_DETAILS_SELECT_PRODUCT_LABEL",
              "required": true,
              "key": "selectedProduct",
              "source": "{{navigation.productVariants}}",
              "displayKey": "sku",
              "valueKey": "id",
              "onChange": [
                {
                  "actionType": "SEARCH_EVENT",
                  "properties": {
                    "type": "SEARCH_EVENT",
                    "name": "stock",
                    "data": [
                      {
                        "key": "tenantId",
                        "value": "{{singleton.selectedProject.tenantId}}",
                        "operation": "equals"
                      },
                      {
                        "key": "productVariantId",
                        "value": "{{selectedProduct}}",
                        "operation": "equals"
                      },
                      {
                        "key": "transactionType",
                        "value":
                            "{{fn:getTransactionType(navigation.reportType)}}",
                        "operation": "in"
                      },
                      {
                        "key":
                            "{{fn:getSenderOrReceiver(navigation.reportType)}}",
                        "value": "{{selectedFacility}}",
                        "operation": "equals"
                      }
                    ]
                  }
                }
              ]
            }
          ]
        },
        {
          "type": "template",
          "format": "infoCard",
          "message": "STOCKREPORTS_REPORT_DETAILS_INFO_CARD_LABEL",
          "properties": {"type": "info"},
          "visible":
              "{{selectedFacility}} == null || {{selectedProduct}} == null"
        },
        {
          "type": "template",
          "format": "infoCard",
          "message": "STOCKREPORTS_REPORT_DETAILS_NO_RECORD_FOUND_INFO",
          "properties": {"type": "info"},
          "visible":
              "{{stock.length}} == 0 && {{selectedFacility}} != null && {{selectedProduct}} != null && {{navigation.reportType}} != 'reconciliation'"
        },
        {
          "type": "template",
          "format": "table",
          "data": {
            "source": "StockModel",
            "columns": [
              {
                "header": "STOCKREPORTS_REPORT_DETAILS_TABLE_HEADER_1_LABEL",
                "cellValue":
                    "{{fn:formatDate(item.dateOfEntry, 'date', 'dd MMM yyyy')}}"
              },
              {
                "header": "STOCKREPORTS_REPORT_DETAILS_TABLE_HEADER_2_LABEL",
                "cellValue":
                    "{{fn:getAdditionalFieldValue(item.additionalFields.fields, 'mrnNumber')}}"
              },
              {
                "header": "STOCKREPORTS_REPORT_DETAILS_TABLE_HEADER_3_LABEL",
                "cellValue": "{{item.wayBillNumber}}"
              },
              {"header": "Quantity", "cellValue": "{{item.quantity}}"}
            ],
            "rows": "{{contextData.0.StockModel}}"
          }
        }
      ]
    }
  ]
};

final dynamic stockReconciliationFlows = {
  "name": "STOCKRECONCILIATION",
  "initialPage": "stockReconciliationDetails",
  "order": 6,
  "project": "LLIN-mz",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "FORM",
      "name": "stockReconciliationDetails",
      "project": "LLIN-mz",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "projectFacility",
            "data": [
              {
                "key": "projectId",
                "value": "{{singleton.selectedProject.id}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "InventoryWrapper",
        "groupByType": true,
        "rootEntity": "ProjectFacilityModel",
        "filters": [],
        "relations": [
          {
            "name": "facility",
            "entity": "FacilityModel",
            "match": {"field": "id", "equalsFrom": "facilityId"}
          },
          {
            "name": "productVariant",
            "entity": "ProductVariantModel",
            "match": {"field": "id", "equalsFrom": "resource"}
          }
        ],
        "searchConfig": {
          "primary": "projectFacility",
          "select": ["projectFacility", "facility", "productVariant", "stock"]
        }
      },
      "pages": [
        {
          "page": "stockRecon",
          "label": "STOCKRECONCILIATION_STOCKRECONCILIATION_HEADING",
          "order": 1,
          "type": "object",
          "description": "STOCKRECONCILIATION_STOCKRECONCILIATION_DESCRIPTION",
          "actionLabel": "STOCKRECONCILIATION_STOCKRECONCILIATION_ACTION_LABEL",
          "properties": [
            {
              "type": "dynamic",
              "label":
                  "STOCKRECONCILIATION_STOCKRECONCILIATION_stockReconciliationCard_LABEL",
              "order": 1,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "STOCKRECONCILIATION_STOCKRECONCILIATION_stockReconciliationCard_HELP_TEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "stockReconciliationCard",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInForm": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "STOCKRECONCILIATION_STOCKRECONCILIATION_stockReconciliationCard_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": []
            },
            {
              "type": "integer",
              "label":
                  "STOCKRECONCILIATION_STOCKRECONCILIATION_manualCount_LABEL",
              "order": 2,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "STOCKRECONCILIATION_STOCKRECONCILIATION_manualCount_HELP_TEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "manualCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInForm": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "STOCKRECONCILIATION_STOCKRECONCILIATION_manualCount_REQUIRED_ERROR"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message":
                      "STOCKRECONCILIATION_STOCKRECONCILIATION_manualCount_MIN_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "STOCKRECONCILIATION_STOCKRECONCILIATION_comments_LABEL",
              "order": 3,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "STOCKRECONCILIATION_STOCKRECONCILIATION_comments_HELP_TEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "comments",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInForm": true,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": []
            }
          ],
          "value": null,
          "required": null,
          "hidden": null,
          "helpText": null,
          "innerLabel": null,
          "validations": null,
          "tooltip": null,
          "startDate": null,
          "endDate": null,
          "readOnly": null,
          "charCount": null,
          "systemDate": null,
          "isMultiSelect": null,
          "includeInForm": null,
          "includeInSummary": null,
          "autoEnable": null,
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "stockReconciliation",
            "data": [],
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
            "entity": "STOCK_RECONCILIATION",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to create stock."}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "stockReconciliationSuccess",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "data": []
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "stockReconciliationSuccess",
      "heading": "",
      "description": "",
      "header": [],
      "footer": [],
      "initActions": [],
      "body": [
        {
          "type": "template",
          "format": "panelCard",
          "label": "STOCKRECONCILIATION_STOCKRECONCILIATIONSUCCESS_HEADING",
          "description":
              "STOCKRECONCILIATION_STOCKRECONCILIATIONSUCCESS_DESCRIPTION",
          "properties": {"type": "success"},
          "primaryAction": {
            "label":
                "STOCKRECONCILIATION_STOCKRECONCILIATIONSUCCESS_PRIMARY_ACTION_LABEL",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"type": "HOME"}
              }
            ]
          }
        }
      ]
    }
  ]
};
