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
import 'widgets/db_error_handler.dart';

late LocalSqlDataStore _sql;
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

  // Initialize encrypted database
  final encryptionKey =
      await LocalSecureStore.instance.getOrCreateDbEncryptionKey();

  // Migrate existing unencrypted database to encrypted (if needed)
  final migrationResult =
      await LocalSqlDataStore.migrateToEncrypted(encryptionKey);

  // Handle key mismatch - show error and delete database
  if (migrationResult == DatabaseMigrationResult.keyMismatch) {
    runApp(DatabaseErrorApp(
      onRetry: () async {
        // Delete the inaccessible database
        await LocalSqlDataStore.deleteDatabase();
        // Clear secure storage to reset encryption key
        await LocalSecureStore.instance.deleteAll();
        // Restart the app - user needs to manually restart
      },
    ));
    return;
  }

  // Create the encrypted database instance
  _sql = LocalSqlDataStore(encryptionKey: encryptionKey);

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
      "preventScreenCapture": true,
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
      "scrollListener": {
        "triggerMode": "bidirectional",
        "debounceMs": 0,
        "showLoadingIndicator": true,
        "onScrollDown": [
          {
            "actionType": "REFRESH_SEARCH",
            "properties": {
              "pagination": {"limit": 5, "maxItems": 15}
            }
          }
        ],
        "onScrollUp": [
          {
            "actionType": "REFRESH_SEARCH",
            "properties": {
              "pagination": {"limit": 5, "maxItems": 15}
            }
          }
        ]
      },
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
            "name": "headProjectBeneficiary",
            "entity": "ProjectBeneficiaryModel",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "headOfHousehold.individualClientReferenceId"
            }
          },
          {
            "name": "headTasks",
            "entity": "TaskModel",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "equalsFrom": "headProjectBeneficiary.clientReferenceId"
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
          ],
          "pagination": {"limit": 5, "maxItems": 15}
        }
      },
      "body": [
        {
          "type": "template",
          "label": "PROXIMITY_SEARCH_REGISTRATION",
          "format": "proximitySearch",
          "onAction": [
            {
              "actionType": "field.value==true ? SEARCH_EVENT : CLEAR_STATE",
              "properties": {
                "data": [
                  {"key": "", "value": 5, "operation": "within"}
                ],
                "name": "address",
                "type": "field.value==true ? SEARCH_EVENT : CLEAR_STATE"
              }
            }
          ],
          "fieldName": "proximitySearch",
          "mandatory": true,
          "validations": [
            {
              "key": "proximityRadius",
              "value": 5,
              "errorMessage": "PROXIMITY_RADIUS_ERROR_MESSAGE"
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
                  "enums": [
                    {
                      "code": "ADMINISTRATION_SUCCESS",
                      "name": "Administration Success"
                    },
                    {
                      "code": "ADMINISTRATION_FAILED",
                      "name": "Administration Failed"
                    },
                    {"code": "CLOSED_HOUSEHOLD", "name": "Closed Household"},
                    {"code": "NOT_REGISTERED", "name": "Not Registered"},
                    {"code": "NOT_ADMINISTERED", "name": "Not Administered"}
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
                    {
                      "actionType": "CLOSE_POPUP",
                      "properties": {"parentScreenKey": "searchBeneficiary"}
                    },
                    {
                      "actions": [
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "name": "task",
                            "data": [
                              {
                                "key": "status",
                                "value": "{{selectedStatus}}",
                                "operation": "in"
                              }
                            ]
                          }
                        }
                      ],
                      "condition": {
                        "expression":
                            "selectedStatus == ADMINISTRATION_SUCCESS || selectedStatus == CLOSED_HOUSEHOLD || selectedStatus == ADMINISTRATION_FAILED"
                      }
                    },
                    {
                      "actions": [
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "name": "projectBeneficiary",
                            "data": [
                              {
                                "key": "projectId",
                                "value": "{{singleton.selectedProject.id}}",
                                "operation": "notEqual"
                              }
                            ]
                          }
                        }
                      ],
                      "condition": {
                        "expression": "selectedStatus == NOT_REGISTERED"
                      }
                    },
                    {
                      "actions": [
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "filterLogic": "and",
                            "data": [
                              {
                                "root": "projectBeneficiary",
                                "key": "projectId",
                                "value": "{{singleton.selectedProject.id}}",
                                "operation": "equals"
                              },
                              {
                                "root": "task",
                                "key": "status",
                                "value": [
                                  "ADMINISTRATION_SUCCESS",
                                  "ADMINISTRATION_FAILED",
                                  "CLOSED_HOUSEHOLD"
                                ],
                                "operation": "notIn"
                              }
                            ]
                          }
                        }
                      ],
                      "condition": {
                        "expression": "selectedStatus == NOT_ADMINISTERED"
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
          "properties": {"spacing": "spacer4"},
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
                        "actions": [
                          {
                            "actionType": "NAVIGATION",
                            "properties": {
                              "type": "FORM",
                              "name": "HOUSEHOLD",
                              "data": [
                                {
                                  "key": "HouseholdClientReferenceId",
                                  "value":
                                      "{{ context.household.clientReferenceId }}"
                                },
                                {"key": "isEdit", "value": "true"}
                              ]
                            }
                          }
                        ],
                        "condition": {
                          "expression":
                              "context.headProjectBeneficiary.0!=null && "
                        }
                      },
                      {
                        "actions": [
                          {
                            "actionType": "NAVIGATION",
                            "properties": {
                              "type": "TEMPLATE",
                              "name": "householdOverview",
                              "data": [
                                {
                                  "key": "HouseholdClientReferenceId",
                                  "value":
                                      "{{ HouseholdModel.clientReferenceId }}"
                                }
                              ]
                            }
                          }
                        ],
                        "condition": {
                          "expression":
                              ".ec1==YES && eligibilityChecklist.ec3==YES && eligibilityChecklist.ec4==YES"
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
                  "source": "{{individuals}}",
                  "columns": [
                    {
                      "header": "Beneficiary",
                      "cellValue": "{{item.name.givenName}}"
                    },
                    {
                      "header": "Age",
                      "cellValue": "{{fn:formatDate(item.dateOfBirth, 'age')}}"
                    },
                    {"header": "Gender", "cellValue": "{{item.gender}}"}
                  ],
                  "rows": "{{individuals}}"
                }
              }
            ]
          }
        }
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
              "properties": {"type": "FORM", "name": "HOUSEHOLD"}
            }
          ]
        },
        {
          "type": "template",
          "label": "SCAN_BENEFICIARY",
          "format": "qrScanner",
          "onAction": [
            {
              "actionType": "OPEN_SCANNER",
              "properties": {
                "scanType": "qr",
                "fieldName": "beneficiaryTag",
                "singleValue": true,
                "scanLimit": 1,
                "isGS1": false,
                "onSuccess": [
                  {
                    "actionType": "SEARCH_EVENT",
                    "properties": {
                      "type": "SEARCH_EVENT",
                      "name": "projectBeneficiary",
                      "awaitResults": true,
                      "data": [
                        {
                          "key": "tag",
                          "value": "{{beneficiaryTag}}",
                          "operation": "equals"
                        }
                      ]
                    }
                  }
                ]
              }
            }
          ],
          "fieldName": "qrScanner",
          "showLabel": false,
          "properties": {
            "icon": "QrCodeScanner",
            "size": "large",
            "type": "secondary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "validations": [
            {
              "type": "scanLimit",
              "value": 1,
              "message": "SCANLIMIT_ERROR_MESSAGE"
            },
            {"type": "isGS1", "value": false}
          ]
        }
      ],
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
          "preventScreenCapture": true,
          "type": "object",
          "label": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_HEADING",
          "order": 3,
          "submitCondition": {
            "expression": [
              {"condition": "isEdit == true"}
            ]
          },
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
              "isMultiSelect": false,
              "includeInSummary": true
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
          "condition": {"expression": "isEdit == true"},
          "actions": [
            {
              "actionType": "UPDATE_EVENT",
              "properties": {"entity": "HouseholdModel"}
            }
          ]
        },
        {
          "condition": {"expression": "DEFAULT"},
          "actions": [
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
            }
          ]
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
                "name": "member",
                "entity": "HouseholdMemberModel",
                "match": {
                  "field": "clientReferenceId",
                  "equalsFrom": "clientReferenceId"
                }
              },
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
            "task",
            "referral"
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
                      "actionType": "REVERSE_TRANSFORM",
                      "properties": {
                        "configName": "beneficiaryRegistration",
                        "entityTypes": ["HouseholdModel"]
                      }
                    },
                    {
                      "actionType": "NAVIGATION",
                      "properties": {
                        "type": "FORM",
                        "name": "HOUSEHOLD",
                        "data": [
                          {
                            "key": "HouseholdClientReferenceId",
                            "value": "{{ context.household.clientReferenceId }}"
                          },
                          {"key": "isEdit", "value": "true"}
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
                            "actionType": "REVERSE_TRANSFORM",
                            "properties": {
                              "configName": "individualRegistration",
                              "entityTypes": ["IndividualModel"]
                            }
                          },
                          {
                            "actionType": "NAVIGATION",
                            "properties": {
                              "type": "FORM",
                              "name": "ADD_MEMBER",
                              "data": [
                                {
                                  "key": "HouseholdClientReferenceId",
                                  "value":
                                      "{{member.0.householdClientReferenceId}}"
                                },
                                {"key": "isEdit", "value": "true"}
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
                    "type": "template",
                    "format": "tag",
                    "fieldName": "statusTag",
                    "visible":
                        "{{fn:checkEligibilityForAgeAndSideEffect(individual.0.dateOfBirth)}}==false",
                    "label": "NOT_ELIGIBLE",
                    "properties": {"tagType": "error"}
                  },
                  {
                    "type": "template",
                    "format": "tag",
                    "fieldName": "statusTag",
                    "visible": "{{fn:isDelivered(task.0.status)}}==true",
                    "label": "ADMINISTERED_SUCCESS",
                    "properties": {"tagType": "success"}
                  },
                  {
                    "type": "template",
                    "format": "tag",
                    "fieldName": "statusTag",
                    "visible":
                        "{{fn:checkEligibilityForAgeAndSideEffect(individual.0.dateOfBirth)}}==true && {{fn:isDelivered(task.0.status)}}==false",
                    "label": "NOT_VISITED",
                    "properties": {"tagType": "info"}
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
                    // "visible":
                    //     "{{fn:checkEligibilityForAgeAndSideEffect(individual.0.dateOfBirth)}} == true",
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
                            },
                            {
                              "key": "selectedIndividualName",
                              "value": "{{individual.0.name.givenName}}"
                            },
                            {
                              "key": "HouseholdClientReferenceId",
                              "value":
                                  "{{member.0.householdClientReferenceId}}",
                            },
                            {
                              "key": "ProjectBeneficiaryClientReferenceId",
                              "value":
                                  "{{projectBeneficiary.0.clientReferenceId}}",
                            },
                          ]
                        }
                      }
                    ]
                  },
                  {
                    "format": "button",
                    "visible": "{{fn:checkAllDoseDelivered(task)}} == true",
                    "properties": {
                      "type": "primary",
                      "size": "medium",
                      "mainAxisSize": "max",
                      "mainAxisAlignment": "center"
                    },
                    "label": "View Details",
                    "icon": "add",
                    "onAction": [
                      {
                        "actionType": "NAVIGATION",
                        "properties": {
                          "type": "TEMPLATE",
                          "name": "beneficiaryDetails",
                          "data": [
                            {
                              "key": "selectedIndividualClientReferenceId",
                              "value": "{{individual.0.clientReferenceId}}"
                            },
                            {
                              "key": "HouseholdClientReferenceId",
                              "value":
                                  "{{member.0.householdClientReferenceId}}",
                            },
                            {
                              "key": "ProjectBeneficiaryClientReferenceId",
                              "value":
                                  "{{projectBeneficiary.0.clientReferenceId}}",
                            },
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
              "isMultiSelect": false,
              "includeInSummary": true
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
                "value": "{{navigation.HouseholdClientReferenceId}}"
              }
            ]
          }
        },
        {
          "condition": {"expression": "isEdit == true"},
          "actions": [
            {
              "actionType": "UPDATE_EVENT",
              "properties": {"entity": "INDIVIDUAL"}
            }
          ]
        },
        {
          "condition": {"expression": "DEFAULT"},
          "actions": [
            {
              "actionType": "CREATE_EVENT",
              "properties": {"entity": "INDIVIDUAL, PROJECTBENEFICIARY, MEMBER"}
            }
          ]
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
                "value": "{{navigation.HouseholdClientReferenceId}}"
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
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value":
                        "{{ contextData.navigation.HouseholdClientReferenceId }}"
                  },
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}",
                  },
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
                "eligibilityChecklist.ec1==YES && eligibilityChecklist.ec3==YES && eligibilityChecklist.ec4==YES"
          },
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "REFER_BENEFICIARY",
                "data": [
                  {
                    "key": "selectedIndividualClientReferenceId",
                    "value":
                        "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value":
                        "{{ contextData.navigation.HouseholdClientReferenceId }}"
                  },
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}",
                  },
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
      "screenType": "FORM",
      "name": "REFER_BENEFICIARY",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "referBeneficiary",
          "type": "object",
          "label": "REFER_BENEFICIARY_SCREEN_HEADING",
          "order": 1,
          "navigateTo": {"name": "acknowledgement", "type": "screen"},
          "properties": [
            {
              "type": "string",
              "label": "REFER_BENEFICIARY_LABEL_ADMINISTRATIVE_UNIT",
              "order": 2,
              "value": "",
              "format": "locality",
              "hidden": false,
              "readOnly": true,
              "required": true,
              "fieldName": "administrativeArea",
              "mandatory": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "REFER_BENEFICIARY_ADMINISTRATIVE_UNIT_REQUIRED"
                }
              ],
              "errorMessage": ""
            },
            {
              "type": "dynamic",
              "label": "REFER_BENEFICIARY_LABEL_REFERRED_TO",
              "order": 4,
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
              "systemDate": false,
              "errorMessage": "",
              "includeInForm": true,
              "schemaCode": "HCM.FACILITY_OPTIONS_POPULATOR",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "REFER_BENEFICIARY_LABEL_REFERRED_BY",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "readOnly": true,
              "required": true,
              "fieldName": "referredBy",
              "mandatory": true,
              "autoFillCondition": [
                {"value": "{{loggedInUserUuid}}", "expression": "true==true"},
              ],
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "REFER_BENEFICIARY_REFERRED_BY_REQUIRED"
                }
              ],
              "errorMessage": ""
            },
            {
              "type": "string",
              "label": "HFREFERRAL_REFERRAL_DETAILS_referralReason_LABEL",
              "order": 5,
              "value": "",
              "format": "radio",
              "required": false,
              "hidden": false,
              "enums": [
                {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                {"code": "FEVER", "name": "FEVER"},
                {"code": "SICK", "name": "SICK"}
              ],
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "referralReason",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.REFERRAL_REASONS",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "REFER_BENEFICIARY_LABEL_REASON_FOR_REFERRAL",
              "order": 6,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "readOnly": false,
              "required": false,
              "fieldName": "referralComments",
              "validations": [],
              "errorMessage": ""
            }
          ],
          "actionLabel": "REFER_BENEFICIARY_SUBMIT_BUTTON",
          "description": "REFER_BENEFICIARY_SCREEN_DESCRIPTION"
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "referralBeneficaryCreate",
            "data": [
              {
                "key": "selectedIndividualClientReferenceId",
                "value":
                    "{{contextData.navigation.selectedIndividualClientReferenceId}}"
              },
              {
                "key": "HouseholdClientReferenceId",
                "value":
                    "{{ contextData.navigation.HouseholdClientReferenceId }}"
              },
              {
                "key": "ProjectBeneficiaryClientReferenceId",
                "value":
                    "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}",
              },
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
            "entity": "REFERRAL",
            "data": [
              {
                "key": "selectedIndividualClientReferenceId",
                "value":
                    "{{contextData.navigation.selectedIndividualClientReferenceId}}"
              },
              {
                "key": "HouseholdClientReferenceId",
                "value":
                    "{{ contextData.navigation.HouseholdClientReferenceId }}"
              },
            ],
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
            "name": "referralSuccess",
            "data": [
              {
                "key": "selectedIndividualClientReferenceId",
                "value":
                    "{{contextData.navigation.selectedIndividualClientReferenceId}}"
              },
              {
                "key": "HouseholdClientReferenceId",
                "value":
                    "{{ contextData.navigation.HouseholdClientReferenceId }}"
              },
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
      "body": [
        {
          "type": "template",
          "label": "REFERRAL_SUCCESSFUL_PANEL_CARD_HEADING",
          "format": "panelCard",
          "heading": "REFERRAL_SUCCESSFUL_PANEL_CARD_HEADING",
          "fieldName": "successCard",
          "mandatory": true,
          "properties": {"type": "success"},
          "description": "REFERRAL_SUCCESSFUL_PANEL_CARD_DESC",
          "primaryAction": {
            "type": "template",
            "label": "REFERRAL_VIEW_HOUSEHOLD_DETAILS",
            "format": "button",
            "hidden": false,
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "selectedIndividualClientReferenceId",
                      "value":
                          "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                    },
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{ contextData.navigation.HouseholdClientReferenceId }}"
                    }
                  ],
                  "name": "householdOverview",
                  "type": "TEMPLATE"
                }
              }
            ],
            "fieldName": "viewHouseholdButton",
            "mandatory": true,
            "properties": {"type": "primary"}
          },
          "secondaryAction": {
            "type": "template",
            "label": "GO_BACK",
            "format": "button",
            "hidden": false,
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"name": "searchBeneficiary", "type": "TEMPLATE"}
              }
            ],
            "fieldName": "goBack",
            "mandatory": true,
            "properties": {"type": "secondary"}
          }
        }
      ],
      "name": "referralSuccess",
      "order": 7,
      "header": [
        {
          "type": "template",
          "label": "REFERRAL_BACK",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.clientReferenceId}}"
                  }
                ],
                "name": "householdOverview",
                "type": "TEMPLATE"
              }
            }
          ],
          "fieldName": "referralBack",
          "mandatory": true
        }
      ],
      "heading": "",
      "screenType": "TEMPLATE",
      "description": ""
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
        "fields": {
          "dose": {
            "from": "{{tasks.additionalFields.fields}}",
            "where": {
              "left": "{{key}}",
              "right": "doseIndex",
              "operator": "eq"
            },
            "select": "{{value}}",
            "default": 0,
            "takeLast": true
          },
          "cycle": {
            "from": "{{tasks.additionalFields.fields}}",
            "where": {
              "left": "{{key}}",
              "right": "cycleIndex",
              "operator": "eq"
            },
            "select": "{{value}}",
            "default": 1,
            "takeLast": true
          }
        },
        "filters": [
          {
            "field": "clientReferenceId",
            "equalsFrom": "{{navigation.selectedIndividualClientReferenceId}}"
          }
        ],
        "computed": {
          "nextDoseId": {
            "order": 4,
            "fallback": 1,
            "condition": {
              "if": {
                "left": {"value": "{{dose}}", "operation": "increment"},
                "right": "{{deliveryLength}}",
                "operator": "lte"
              },
              "else": 1,
              "then": {"value": "{{dose}}", "operation": "increment"}
            }
          },
          "nextCycleId": {
            "order": 5,
            "fallback": "{{cycle}}",
            "condition": {
              "if": {
                "left": {"value": "{{dose}}", "operation": "increment"},
                "right": "{{deliveryLength}}",
                "operator": "lte"
              },
              "else": {"value": "{{cycle}}", "operation": "increment"},
              "then": "{{cycle}}"
            }
          },
          "deliveryLength": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "order": 3,
            "where": {
              "left": "{{id}}",
              "right": "{{currentRunningCycle}}",
              "operator": "equals"
            },
            "select": "{{deliveries.length}}",
            "default": 0,
            "takeFirst": true
          },
          "hasCycleArrived": {
            "order": 2,
            "fallback": false,
            "condition": {
              "left": "{{cycle}}",
              "right": "{{currentRunningCycle}}",
              "operator": "equals"
            }
          },
          "currentRunningCycle": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "order": 1,
            "where": [
              {"left": "{{startDate}}", "right": "{{now}}", "operator": "lt"},
              {"left": "{{endDate}}", "right": "{{now}}", "operator": "gt"}
            ],
            "select": "{{id}}",
            "default": -1,
            "takeFirst": true
          }
        },
        "relations": [
          {
            "name": "members",
            "match": {
              "field": "individualClientReferenceId",
              "equalsFrom": "IndividualModel.clientReferenceId"
            },
            "entity": "HouseholdMemberModel"
          },
          {
            "name": "household",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "members.householdClientReferenceId"
            },
            "entity": "HouseholdModel"
          },
          {
            "name": "individuals",
            "match": {
              "field": "clientReferenceId",
              "inFrom": "members.individualClientReferenceId"
            },
            "entity": "IndividualModel"
          },
          {
            "name": "projectBeneficiaries",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "individuals.clientReferenceId"
            },
            "entity": "ProjectBeneficiaryModel"
          },
          {
            "name": "tasks",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "inFrom": "projectBeneficiaries.clientReferenceId"
            },
            "entity": "TaskModel"
          },
          {
            "name": "sideEffects",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "projectBeneficiaries.clientReferenceId"
            },
            "entity": "SideEffectModel"
          },
          {
            "name": "referrals",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "projectBeneficiaries.clientReferenceId"
            },
            "entity": "ReferralModel"
          }
        ],
        "rootEntity": "IndividualModel",
        "wrapperName": "DeliveryWrapper",
        "computedList": {
          "pastCycles": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "order": 6,
            "where": {
              "left": "{{item.id}}",
              "right": "{{cycle}}",
              "operator": "lt"
            },
            "includeCurrentIf": {
              "condition": {
                "left": "{{dose}}",
                "right": "{{deliveryLength}}",
                "operator": "eq"
              }
            }
          },
          "futureTasks": {
            "from": "{{tasks}}",
            "order": 2,
            "where": {
              "left": "{{item.additionalFields.deliveryStrategy}}",
              "right": "INDIRECT",
              "operator": "equals"
            }
          },
          "targetCycle": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "order": 1,
            "where": {
              "left": "{{id}}",
              "right": "{{currentRunningCycle}}",
              "operator": "equals"
            },
            "fallback": null,
            "takeLast": true
          },
          "currentDelivery": {
            "from": "{{targetCycle.0.deliveries}}",
            "order": 4,
            "where": {
              "left": "{{id}}",
              "right": "{{nextDoseId}}",
              "operator": "equals"
            },
            "fallback": null,
            "takeLast": true
          },
          "futureDeliveries": {
            "map": "{{item.deliveries}}",
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "skip": {"from": "{{dose}}"},
            "order": 3,
            "takeWhile": {
              "left": "{{item.deliveryStrategy}}",
              "right": "INDIRECT",
              "operator": "equals"
            }
          },
          "eligibleProductVariants": {
            "from": "{{currentDelivery.0.doseCriteria}}",
            "order": 5,
            "fallback": [],
            "takeLast": false,
            "evaluateCondition": {
              "context": ["{{individuals.0}}", "{{household.0}}"],
              "condition": "{{item.condition}}",
              "transformations": {
                "age": {"type": "ageInMonths", "source": "dateOfBirth"}
              }
            }
          }
        },
        "searchConfig": {
          "select": [
            "individual",
            "household",
            "householdMember",
            "projectBeneficiary",
            "task"
          ],
          "primary": "individual"
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
                      "{{fn:formatDate(contextData.0.individuals.IndividualModel.dateOfBirth, 'age')}}"
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
                      "{{fn:formatDate(contextData.0.projectBeneficiaries.ProjectBeneficiaryModel.dateOfRegistration, 'date', dd MMM yyyy)}}"
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
                "source": "{{contextData.0.targetCycle.0.deliveries}}",
                "columns": [
                  {"header": "Dose", "cellValue": "Dose {{item.id}}"},
                  {
                    "header": "DELIVERY_STATUS",
                    "hidden": false,
                    "cellValue": {
                      "@default": "Pending",
                      "@condition": [
                        {
                          "when":
                              "{{fn:isDoseCompleted(currentItem.id, contextData.0.currentRunningCycle)}} == true",
                          "value": "Administered"
                        },
                        {
                          "when":
                              "{{currentItem.id}} == {{contextData.0.nextDoseId}}",
                          "value": "To be administered"
                        }
                      ]
                    }
                  },
                  {
                    "header": "Completed On",
                    "cellValue":
                        "{{fn:getTaskCompletionDate(currentItem.id, contextData.0.cycle)}}"
                  }
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
          "label":
              "Record Cycle {{contextData.0.nextCycleId}} Dose {{contextData.0.nextDoseId}}",
          "visible":
              "{{fn:canRecordDelivery(contextData.0.nextCycleId)}}==true",
          "disabled": "{{eligibleProductVariants}} == null",
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
                  {
                    "key": "cycleIndex",
                    "value": "{{contextData.0.nextCycleId}}"
                  },
                  {"key": "doseIndex", "value": "{{contextData.0.nextDoseId}}"}
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
  // "flows": [
  //   {
  //     "screenType": "TEMPLATE",
  //     "name": "referralInbox",
  //     "heading": "REFERRAL_INBOX_HEADING",
  //     "description": "REFERRAL_INBOX_DESCRIPTION",
  //     "initActions": [],
  //     "header": [
  //       {
  //         "format": "backLink",
  //         "type": "template",
  //         "label": "REFERRAL_INBOX_BACK_BUTTON_LABEL",
  //         "onAction": [
  //           {"actionType": "BACK_NAVIGATION", "properties": {}}
  //         ]
  //       }
  //     ],
  //     "footer": [
  //       {
  //         "format": "button",
  //         "type": "template",
  //         "fieldName": "createReferral",
  //         "label": "REFERRAL_INBOX_PRIMARY_ACTION_LABEL",
  //         "properties": {
  //           "type": "primary",
  //           "size": "large",
  //           "mainAxisSize": "max",
  //           "mainAxisAlignment": "center"
  //         },
  //         "onAction": [
  //           {
  //             "actionType": "NAVIGATION",
  //             "properties": {
  //               "type": "FORM",
  //               "name": "REFERRAL_CREATE",
  //               "data": []
  //             }
  //           }
  //         ]
  //       },
  //       {
  //         "format": "qrScanner",
  //         "type": "template",
  //         "fieldName": "scanQr",
  //         "label": "REFERRAL_INBOX_SECONDARY_ACTION_LABEL",
  //         "properties": {
  //           "type": "secondary",
  //           "size": "large",
  //           "mainAxisSize": "max",
  //           "mainAxisAlignment": "center"
  //         },
  //         "onAction": [
  //           {
  //             "actionType": "SEARCH_EVENT",
  //             "properties": {
  //               "type": "FORM",
  //               "name": "COMPLAINT_CREATE",
  //               "data": []
  //             }
  //           }
  //         ]
  //       }
  //     ],
  //     "wrapperConfig": {
  //       "wrapperName": "hFReferral",
  //       "rootEntity": "HFReferralModel",
  //       "filters": [],
  //       "relations": [],
  //       "searchConfig": {
  //         "primary": "hFReferral",
  //         "select": ["hFReferral"]
  //       }
  //     },
  //     "body": [
  //       {
  //         "format": "searchBar",
  //         "type": "template",
  //         "label": "REFERRAL_INBOX_SEARCHBAR_LABEL",
  //         "fieldName": "searchBar",
  //         "onAction": [
  //           {
  //             "actionType": "SEARCH_EVENT",
  //             "properties": {
  //               "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT",
  //               "name": "name",
  //               "data": [
  //                 {
  //                   "key": "givenName",
  //                   "value": "field.value",
  //                   "operation": "contains"
  //                 }
  //               ]
  //             }
  //           }
  //         ]
  //       },
  //       {
  //         "type": "template",
  //         "format": "infoCard",
  //         "hidden": "{{ context.hFReferral.notEmpty }}",
  //         "label": "REFERRAL_INBOX_INFO_CARD_HEADING",
  //         "description": "REFERRAL_INBOX_INFO_CARD_DESCRIPTION"
  //       },
  //       {
  //         "type": "template",
  //         "format": "listView",
  //         "hidden": "{{ context.hFReferral.empty }}",
  //         "fieldName": "listView",
  //         "data": "hFReferral",
  //         "child": {
  //           "format": "card",
  //           "children": [
  //             {
  //               "type": "template",
  //               "format": "row",
  //               "properties": {
  //                 "mainAxisAlignment": "spaceBetween",
  //                 "mainAxisSize": "max"
  //               },
  //               "children": [
  //                 {
  //                   "type": "template",
  //                   "format": "textTemplate",
  //                   "value": "{{ headIndividual.0.name.givenName }}"
  //                 },
  //                 {
  //                   "type": "template",
  //                   "format": "button",
  //                   "label": "Open",
  //                   "properties": {"type": "secondary", "size": "medium"},
  //                   "onAction": [
  //                     {
  //                       "actionType": "NAVIGATION",
  //                       "properties": {
  //                         "type": "TEMPLATE",
  //                         "name": "householdOverview",
  //                         "data": [
  //                           {
  //                             "key": "HouseholdClientReferenceId",
  //                             "value": "{{ HouseholdModel.clientReferenceId }}"
  //                           }
  //                         ]
  //                       }
  //                     }
  //                   ]
  //                 }
  //               ]
  //             },
  //             {
  //               "format": "textTemplate",
  //               "value":
  //                   "Date of evaluation: {{ headOfHousehold.0.isHeadOfHousehold }}"
  //             }
  //           ]
  //         }
  //       }
  //     ]
  //   },
  //   {
  //     "screenType": "FORM",
  //     "name": "REFERRAL_CREATE",
  //     "project": "LLIN-mz",
  //     "version": 1,
  //     "disabled": false,
  //     "isSelected": true,
  //     "pages": [
  //       {
  //         "page": "facilityDetails",
  //         "type": "object",
  //         "label": "HFREFERRAL_FACILITY_DETAILS_HEADING",
  //         "actionLabel": "HFREFERRAL_FACILITY_DETAILS_ACTION_LABEL",
  //         "description": "HFREFERRAL_FACILITY_DETAILS_DESCRIPTION",
  //         "order": 2,
  //         "navigateTo": {"name": "referralDetails", "type": "form"},
  //         "properties": [
  //           {
  //             "type": "string",
  //             "label": "HFREFERRAL_FACILITY_DETAILS_administrativeArea_LABEL",
  //             "order": 1,
  //             "value": "",
  //             "format": "locality",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "administrativeArea",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_FACILITY_DETAILS_administrativeArea_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "integer",
  //             "label": "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_LABEL",
  //             "order": 2,
  //             "value": "",
  //             "format": "date",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "dateOfEvaluation",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": true,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "dynamic",
  //             "enums": [],
  //             "label": "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_LABEL",
  //             "order": 3,
  //             "value": "",
  //             "format": "custom",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "evaluationFacility",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": false,
  //                 "message":
  //                     "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "label": "HFREFERRAL_FACILITY_DETAILS_hfCoordinator_LABEL",
  //             "order": 4,
  //             "value": "",
  //             "format": "text",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "hfCoordinator",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           }
  //         ]
  //       },
  //       {
  //         "page": "referralDetails",
  //         "type": "object",
  //         "label": "HFREFERRAL_REFERRAL_DETAILS_HEADING",
  //         "actionLabel": "HFREFERRAL_REFERRAL_DETAILS_ACTION_LABEL",
  //         "description": "HFREFERRAL_REFERRAL_DETAILS_DESCRIPTION",
  //         "order": 3,
  //         "navigateTo": {
  //           "name": "ReferralReconAcknowledgement",
  //           "type": "template"
  //         },
  //         "properties": [
  //           {
  //             "type": "string",
  //             "label": "HFREFERRAL_REFERRAL_DETAILS_referralCycle_LABEL",
  //             "order": 1,
  //             "value": "",
  //             "format": "custom",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "referralCycle",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": false,
  //                 "message":
  //                     "HFREFERRAL_REFERRAL_DETAILS_referralCycle_REQUIRED_ERROR"
  //               }
  //             ],
  //             // "enums": "{{project.cycle}}",
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "label": "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_LABEL",
  //             "order": 2,
  //             "value": "",
  //             "format": "text",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "nameOfChild",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "label": "HFREFERRAL_REFERRAL_DETAILS_beneficiaryId_LABEL",
  //             "order": 3,
  //             "value": "",
  //             "format": "text",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "beneficiaryId",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "systemDate": false,
  //             "validations": [],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "label": "HFREFERRAL_REFERRAL_DETAILS_referralCode_LABEL",
  //             "order": 4,
  //             "value": "",
  //             "format": "text",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "referralCode",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "systemDate": false,
  //             "validations": [],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "integer",
  //             "label": "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_LABEL",
  //             "order": 5,
  //             "value": "",
  //             "format": "text",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "ageInMonths",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "OTHER", "name": "OTHER"},
  //               {"code": "FEMALE", "name": "FEMALE"},
  //               {"code": "MALE", "name": "MALE"}
  //             ],
  //             "label": "HFREFERRAL_REFERRAL_DETAILS_gender_LABEL",
  //             "order": 6,
  //             "value": "",
  //             "format": "dropdown",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "gender",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "common-masters.GenderType",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message": "HFREFERRAL_REFERRAL_DETAILS_gender_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "label": "HFREFERRAL_REFERRAL_DETAILS_referralReason_LABEL",
  //             "order": 7,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "referralReason",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "HCM.REFERRAL_REASONS",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_REFERRAL_DETAILS_referralReason_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           }
  //         ],
  //         "conditionalNavigateTo": [
  //           {
  //             "condition": "referralDetails.referralReason==DRUG_SE_CC",
  //             "navigateTo": {
  //               "name": "sideEffectFromCurrentCycle",
  //               "type": "form"
  //             }
  //           },
  //           {
  //             "condition": "referralDetails.referralReason==DRUG_SE_PC",
  //             "navigateTo": {
  //               "name": "sideEffectFromPreviousCycle",
  //               "type": "form"
  //             }
  //           },
  //           {
  //             "condition": "referralDetails.referralReason==FEVER",
  //             "navigateTo": {"name": "sideEffectFever", "type": "form"}
  //           },
  //           {
  //             "condition": "referralDetails.referralReason==SICK",
  //             "navigateTo": {"name": "sideEffectSick", "type": "form"}
  //           }
  //         ]
  //       },
  //       {
  //         "page": "sideEffectFromCurrentCycle",
  //         "type": "object",
  //         "label": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_HEADING",
  //         "actionLabel": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_ACTION_LABEL",
  //         "description": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_DESCRIPTION",
  //         "order": 4.1,
  //         "navigateTo": {
  //           "name": "ReferralReconAcknowledgement",
  //           "type": "template"
  //         },
  //         "properties": [
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "SIDE_EFFECTQ1_YES"},
  //               {"code": "NO", "name": "SIDE_EFFECTQ1_NO"}
  //             ],
  //             "label":
  //                 "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ1_LABEL",
  //             "order": 1,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "sideEffectQ1",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ1_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "SIDE_EFFECTQ2_YES"},
  //               {"code": "NO", "name": "SIDE_EFFECTQ2_NO"}
  //             ],
  //             "label":
  //                 "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ2_LABEL",
  //             "order": 2,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "sideEffectQ2",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ2_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "SIDE_EFFECTQ3_YES"},
  //               {"code": "NO", "name": "SIDE_EFFECTQ3_NO"}
  //             ],
  //             "label":
  //                 "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ3_LABEL",
  //             "order": 3,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "sideEffectQ3",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ3_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           }
  //         ]
  //       },
  //       {
  //         "page": "sideEffectFromPreviousCycle",
  //         "type": "object",
  //         "label": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_HEADING",
  //         "actionLabel": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_ACTION_LABEL",
  //         "description": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_DESCRIPTION",
  //         "order": 4.2,
  //         "navigateTo": {
  //           "name": "ReferralReconAcknowledgement",
  //           "type": "template"
  //         },
  //         "properties": [
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "SIDE_EFFECT_PREQ1_YES"},
  //               {"code": "NO", "name": "SIDE_EFFECT_PREQ1_NO"}
  //             ],
  //             "label":
  //                 "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ1_LABEL",
  //             "order": 1,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "sideEffectPQ1",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ1_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "SIDE_EFFECT_PREQ2_YES"},
  //               {"code": "NO", "name": "SIDE_EFFECT_PREQ2_NO"}
  //             ],
  //             "label":
  //                 "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ2_LABEL",
  //             "order": 2,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "sideEffectPQ2",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ2_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "SIDE_EFFECT_PREQ3_YES"},
  //               {"code": "NO", "name": "SIDE_EFFECT_PREQ3_NO"}
  //             ],
  //             "label":
  //                 "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ3_LABEL",
  //             "order": 3,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "sideEffectPQ3",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ3_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           }
  //         ]
  //       },
  //       {
  //         "page": "sideEffectFever",
  //         "type": "object",
  //         "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_HEADING",
  //         "actionLabel": "HFREFERRAL_SIDEEFFECTFROMFEVER_ACTION_LABEL",
  //         "description": "HFREFERRAL_SIDEEFFECTFROMFEVER_DESCRIPTION",
  //         "order": 4.3,
  //         "navigateTo": {
  //           "name": "ReferralReconAcknowledgement",
  //           "type": "template"
  //         },
  //         "properties": [
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "FEVERQ1_YES"},
  //               {"code": "NO", "name": "FEVERQ1_NO"}
  //             ],
  //             "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ1_LABEL",
  //             "order": 1,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "feverQ1",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ1_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "POSITIVE", "name": "FEVERQ2_POSITIVE"},
  //               {"code": "NEGATIVE", "name": "FEVERQ2_NEGATIVE"}
  //             ],
  //             "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ2_LABEL",
  //             "order": 2,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "feverQ2",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ2_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false,
  //             "visibilityCondition": {
  //               "expression": "sideEffectFever.feverQ1==YES"
  //             }
  //           },
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "FEVERQ3_YES"},
  //               {"code": "NO", "name": "FEVERQ2_NO"}
  //             ],
  //             "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ3_LABEL",
  //             "order": 3,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "feverQ3",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ3_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false,
  //             "visibilityCondition": {
  //               "expression": "sideEffectFever.feverQ2==NEGATIVE"
  //             }
  //           },
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "FEVERQ4_YES"},
  //               {"code": "NO", "name": "FEVERQ4_NO"}
  //             ],
  //             "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ4_LABEL",
  //             "order": 4,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "feverQ4",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ4_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false,
  //             "visibilityCondition": {
  //               "expression": "sideEffectFever.feverQ2==POSITIVE"
  //             }
  //           },
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "FEVERQ5_YES"},
  //               {"code": "NO", "name": "FEVERQ5_NO"}
  //             ],
  //             "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ5_LABEL",
  //             "order": 5,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "feverQ5",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ5_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false,
  //             "visibilityCondition": {
  //               "expression": "sideEffectFever.feverQ2==POSITIVE"
  //             }
  //           },
  //           {
  //             "type": "string",
  //             "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_LABEL",
  //             "order": 6,
  //             "value": "",
  //             "format": "text",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "feverQ6",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false,
  //             "visibilityCondition": {
  //               "expression": "sideEffectFever.feverQ5==YES"
  //             }
  //           }
  //         ]
  //       },
  //       {
  //         "page": "sideEffectSick",
  //         "type": "object",
  //         "label": "HFREFERRAL_SIDEEFFECTFROMSICK_HEADING",
  //         "actionLabel": "HFREFERRAL_SIDEEFFECTFROMSICK_ACTION_LABEL",
  //         "description": "HFREFERRAL_SIDEEFFECTFROMSICK_DESCRIPTION",
  //         "order": 4.4,
  //         "navigateTo": {
  //           "name": "ReferralReconAcknowledgement",
  //           "type": "template"
  //         },
  //         "properties": [
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "SICKQ1_YES"},
  //               {"code": "NO", "name": "SICKQ1_NO"}
  //             ],
  //             "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ1_LABEL",
  //             "order": 1,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "sickQ1",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ1_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_LABEL",
  //             "order": 2,
  //             "value": "",
  //             "format": "text",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "sickQ4",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false,
  //             "visibilityCondition": {
  //               "expression": "sideEffectSick.sickQ1==YES"
  //             }
  //           },
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "SICKQ2_YES"},
  //               {"code": "NO", "name": "SICKQ2_NO"}
  //             ],
  //             "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ2_LABEL",
  //             "order": 3,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "sickQ2",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ2_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           },
  //           {
  //             "type": "string",
  //             "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_LABEL",
  //             "order": 4,
  //             "value": "",
  //             "format": "text",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "sickQ5",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false,
  //             "visibilityCondition": {
  //               "expression": "sideEffectSick.sickQ2==YES"
  //             }
  //           },
  //           {
  //             "type": "string",
  //             "enums": [
  //               {"code": "YES", "name": "SICKQ3_YES"},
  //               {"code": "NO", "name": "SICKQ3_NO"}
  //             ],
  //             "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ3_LABEL",
  //             "order": 5,
  //             "value": "",
  //             "format": "radio",
  //             "hidden": false,
  //             "tooltip": "",
  //             "helpText": "",
  //             "infoText": "",
  //             "readOnly": false,
  //             "fieldName": "sickQ3",
  //             "deleteFlag": false,
  //             "innerLabel": "",
  //             "schemaCode": "",
  //             "systemDate": false,
  //             "validations": [
  //               {
  //                 "type": "required",
  //                 "value": true,
  //                 "message":
  //                     "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ3_REQUIRED_ERROR"
  //               }
  //             ],
  //             "errorMessage": "",
  //             "isMultiSelect": false
  //           }
  //         ]
  //       }
  //     ],
  //     "wrapperConfig": {},
  //     "onAction": [
  //       {
  //         "actionType": "FETCH_TRANSFORMER_CONFIG",
  //         "properties": {
  //           "configName": "referralCreation",
  //           "onError": [
  //             {
  //               "actionType": "SHOW_TOAST",
  //               "properties": {"message": "Failed to fetch config."}
  //             }
  //           ]
  //         }
  //       },
  //       {
  //         "actionType": "CREATE_EVENT",
  //         "properties": {
  //           "entity": "",
  //           "onError": [
  //             {
  //               "actionType": "SHOW_TOAST",
  //               "properties": {"message": "Failed to create household."}
  //             }
  //           ]
  //         }
  //       },
  //       {
  //         "actionType": "NAVIGATION",
  //         "properties": {
  //           "type": "TEMPLATE",
  //           "name": "referralAcknowledgement",
  //           "onError": [
  //             {
  //               "actionType": "SHOW_TOAST",
  //               "properties": {"message": "Navigation failed."}
  //             }
  //           ],
  //           "data": []
  //         }
  //       }
  //     ]
  //   },
  //   {
  //     "screenType": "TEMPLATE",
  //     "name": "referralAcknowledgement",
  //     "heading": "",
  //     "description": "",
  //     "header": [],
  //     "body": [
  //       {
  //         "format": "panelCard",
  //         "type": "template",
  //         "fieldName": "referralSuccess",
  //         "label": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_LABEL",
  //         "description": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_DESCRIPTION",
  //         "properties": {"type": "success"},
  //         "secondaryAction": {
  //           "type": "template",
  //           "format": "button",
  //           "fieldName": "back",
  //           "label": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_ACTION_LABEL",
  //           "onAction": [
  //             {
  //               "actionType": "NAVIGATION",
  //               "properties": {"type": "TEMPLATE", "name": "complaintInbox"}
  //             }
  //           ]
  //         }
  //       }
  //     ]
  //   },
  //   {
  //     "screenType": "TEMPLATE",
  //     "name": "referralOverview",
  //     "heading": "REFERRAL_OVERVIEW_HEADING",
  //     "description": "REFERRAL_OVERVIEW_DESCRIPTION",
  //     "initActions": [],
  //     "header": [
  //       {
  //         "format": "backLink",
  //         "type": "template",
  //         "label": "REFERRAL_INBOX_OVERVIEW_BACK_BUTTON_LABEL",
  //         "onAction": [
  //           {"actionType": "BACK_NAVIGATION", "properties": {}}
  //         ]
  //       }
  //     ],
  //     "footer": [
  //       {
  //         "format": "button",
  //         "type": "template",
  //         "fieldName": "createReferral",
  //         "label": "REFERRAL_INBOX_PRIMARY_ACTION_LABEL",
  //         "properties": {
  //           "type": "primary",
  //           "size": "large",
  //           "mainAxisSize": "max",
  //           "mainAxisAlignment": "center"
  //         },
  //         "onAction": [
  //           {
  //             "actionType": "NAVIGATION",
  //             "properties": {
  //               "type": "FORM",
  //               "name": "REFERRAL_CREATE",
  //               "data": []
  //             }
  //           }
  //         ]
  //       },
  //       {
  //         "format": "qrScanner",
  //         "type": "template",
  //         "fieldName": "scanQr",
  //         "label": "REFERRAL_INBOX_SECONDARY_ACTION_LABEL",
  //         "properties": {
  //           "type": "secondary",
  //           "size": "large",
  //           "mainAxisSize": "max",
  //           "mainAxisAlignment": "center"
  //         },
  //         "onAction": [
  //           {
  //             "actionType": "SEARCH_EVENT",
  //             "properties": {
  //               "type": "FORM",
  //               "name": "COMPLAINT_CREATE",
  //               "data": []
  //             }
  //           }
  //         ]
  //       }
  //     ],
  //     "wrapperConfig": {
  //       "wrapperName": "hFReferral",
  //       "rootEntity": "HFReferralModel",
  //       "filters": [],
  //       "relations": [],
  //       "searchConfig": {
  //         "primary": "hFReferral",
  //         "select": ["hFReferral"]
  //       }
  //     },
  //     "body": [
  //       {
  //         "format": "searchBar",
  //         "type": "template",
  //         "label": "REFERRAL_INBOX_SEARCHBAR_LABEL",
  //         "fieldName": "searchBar",
  //         "onAction": [
  //           {
  //             "actionType": "SEARCH_EVENT",
  //             "properties": {
  //               "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT",
  //               "name": "name",
  //               "data": [
  //                 {
  //                   "key": "givenName",
  //                   "value": "field.value",
  //                   "operation": "contains"
  //                 }
  //               ]
  //             }
  //           }
  //         ]
  //       },
  //       {
  //         "type": "template",
  //         "format": "infoCard",
  //         "hidden": "{{ context.hFReferral.notEmpty }}",
  //         "label": "REFERRAL_INBOX_INFO_CARD_HEADING",
  //         "description": "REFERRAL_INBOX_INFO_CARD_DESCRIPTION"
  //       },
  //       {
  //         "type": "template",
  //         "format": "listView",
  //         "hidden": "{{ context.hFReferral.empty }}",
  //         "fieldName": "listView",
  //         "data": "hFReferral",
  //         "child": {
  //           "format": "card",
  //           "children": [
  //             {
  //               "type": "template",
  //               "format": "row",
  //               "properties": {
  //                 "mainAxisAlignment": "spaceBetween",
  //                 "mainAxisSize": "max"
  //               },
  //               "children": [
  //                 {
  //                   "type": "template",
  //                   "format": "textTemplate",
  //                   "value": "{{ headIndividual.0.name.givenName }}"
  //                 },
  //                 {
  //                   "type": "template",
  //                   "format": "button",
  //                   "label": "Open",
  //                   "properties": {"type": "secondary", "size": "medium"},
  //                   "onAction": [
  //                     {
  //                       "actionType": "NAVIGATION",
  //                       "properties": {
  //                         "type": "TEMPLATE",
  //                         "name": "householdOverview",
  //                         "data": [
  //                           {
  //                             "key": "HouseholdClientReferenceId",
  //                             "value": "{{ HouseholdModel.clientReferenceId }}"
  //                           }
  //                         ]
  //                       }
  //                     }
  //                   ]
  //                 }
  //               ]
  //             },
  //             {
  //               "format": "textTemplate",
  //               "value":
  //                   "Date of evaluation: {{ headOfHousehold.0.isHeadOfHousehold }}"
  //             }
  //           ]
  //         }
  //       }
  //     ]
  //   }
  // ]
  "flows": [
    {
      "body": [
        {
          "type": "template",
          "label": "REFERRAL_INBOX_SEARCHBAR_LABEL",
          "format": "searchBar",
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "data": [
                  {
                    "key": "name",
                    "value": "field.value",
                    "operation": "contains"
                  }
                ],
                "name": "hFReferral",
                "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT"
              }
            }
          ],
          "fieldName": "searchBar"
        },
        {
          "type": "template",
          "label": "REFERRAL_INBOX_INFO_CARD_HEADING",
          "format": "infoCard",
          "hidden": "{{ context.hFReferral.notEmpty }}",
          "description": "REFERRAL_INBOX_INFO_CARD_DESCRIPTION"
        },
        {
          "data": "hFReferral",
          "type": "template",
          "child": {
            "format": "card",
            "children": [
              {
                "type": "template",
                "format": "row",
                "children": [
                  {
                    "type": "template",
                    "value": "{{ HFReferralModel.name }}",
                    "format": "textTemplate"
                  },
                  {
                    "type": "template",
                    "label": "Open",
                    "format": "button",
                    "onAction": [
                      {
                        "actionType": "NAVIGATION",
                        "properties": {
                          "data": [
                            {
                              "key": "clientReferenceId",
                              "value": "{{ HFReferralModel.clientReferenceId }}"
                            }
                          ],
                          "name": "referralOverview",
                          "type": "TEMPLATE"
                        }
                      }
                    ],
                    "properties": {"size": "medium", "type": "secondary"}
                  }
                ],
                "properties": {
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "spaceBetween"
                }
              },
              {
                "value":
                    "HF_REFERRAL_INBOX_DATE_OF_EVALUATION {{ fn:formatDate(HFReferralModel.additionalFields.fields.dateOfEvaluation) }}",
                "format": "textTemplate"
              }
            ]
          },
          "format": "listView",
          "hidden": "{{ context.hFReferral.empty }}",
          "fieldName": "listView"
        }
      ],
      "name": "referralInbox",
      "footer": [
        {
          "type": "template",
          "label": "REFERRAL_INBOX_PRIMARY_ACTION_LABEL",
          "format": "button",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [],
                "name": "REFERRAL_CREATE",
                "type": "FORM"
              }
            }
          ],
          "fieldName": "createReferral",
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        },
        {
          "type": "template",
          "label": "REFERRAL_INBOX_SECONDARY_ACTION_LABEL",
          "format": "qrScanner",
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "data": [
                  {
                    "key": "beneficiaryId",
                    "value": "field.value",
                    "operation": "contains"
                  }
                ],
                "name": "hFReferral",
                "type": "SEARCH_EVENT"
              }
            }
          ],
          "fieldName": "scanQr",
          "properties": {
            "size": "large",
            "type": "secondary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        }
      ],
      "header": [
        {
          "type": "template",
          "label": "REFERRAL_INBOX_BACK_BUTTON_LABEL",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "HOME", "type": "HOME"}
            }
          ]
        }
      ],
      "heading": "REFERRAL_INBOX_HEADING",
      "screenType": "TEMPLATE",
      "description": "REFERRAL_INBOX_DESCRIPTION",
      "initActions": [],
      "wrapperConfig": {
        "filters": [],
        "relations": [],
        "rootEntity": "HFReferralModel",
        "wrapperName": "hFReferral",
        "searchConfig": {
          "select": ["hFReferral"],
          "primary": "hFReferral"
        }
      }
    },
    {
      "name": "REFERRAL_CREATE",
      "pages": [
        {
          "page": "facilityDetails",
          "type": "object",
          "label": "HFREFERRAL_FACILITY_DETAILS_HEADING",
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
          ],
          "actionLabel": "HFREFERRAL_FACILITY_DETAILS_ACTION_LABEL",
          "description": "HFREFERRAL_FACILITY_DETAILS_DESCRIPTION"
        },
        {
          "page": "referralDetails",
          "type": "object",
          "label": "HFREFERRAL_REFERRAL_DETAILS_HEADING",
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
              "enums": [
                {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                {"code": "FEVER", "name": "FEVER"},
                {"code": "SICK", "name": "SICK"}
              ],
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
          "actionLabel": "HFREFERRAL_REFERRAL_DETAILS_ACTION_LABEL",
          "description": "HFREFERRAL_REFERRAL_DETAILS_DESCRIPTION",
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
          ],
          "actionLabel": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_ACTION_LABEL",
          "description": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_DESCRIPTION"
        },
        {
          "page": "sideEffectFromPreviousCycle",
          "type": "object",
          "label": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_HEADING",
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
          ],
          "actionLabel": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_ACTION_LABEL",
          "description": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_DESCRIPTION"
        },
        {
          "page": "sideEffectFever",
          "type": "object",
          "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_HEADING",
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
          ],
          "actionLabel": "HFREFERRAL_SIDEEFFECTFROMFEVER_ACTION_LABEL",
          "description": "HFREFERRAL_SIDEEFFECTFROMFEVER_DESCRIPTION"
        },
        {
          "page": "sideEffectSick",
          "type": "object",
          "label": "HFREFERRAL_SIDEEFFECTFROMSICK_HEADING",
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
          ],
          "actionLabel": "HFREFERRAL_SIDEEFFECTFROMSICK_ACTION_LABEL",
          "description": "HFREFERRAL_SIDEEFFECTFROMSICK_DESCRIPTION"
        }
      ],
      "project": "Bednets",
      "version": 1,
      "disabled": false,
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to fetch config."}
              }
            ],
            "configName": "referralCreation"
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
            "data": [],
            "name": "referralAcknowledgement",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ]
          }
        }
      ],
      "isSelected": true,
      "screenType": "FORM",
      "wrapperConfig": {}
    },
    {
      "body": [
        {
          "type": "template",
          "label": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_LABEL",
          "format": "panelCard",
          "fieldName": "referralSuccess",
          "properties": {"type": "success"},
          "description": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_DESCRIPTION",
          "secondaryAction": {
            "type": "template",
            "label": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_ACTION_LABEL",
            "format": "button",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"name": "referralInbox", "type": "TEMPLATE"}
              }
            ],
            "fieldName": "back"
          }
        }
      ],
      "name": "referralAcknowledgement",
      "header": [],
      "heading": "",
      "screenType": "TEMPLATE",
      "description": ""
    },
    {
      "body": [
        {
          "type": "primary",
          "format": "card",
          "children": [
            {
              "data": [
                {
                  "key": "REFERRAL_INBOX_NAME",
                  "value": "{{0.HFReferralModel.name}}"
                },
                {
                  "key": "REFERRAL_INBOX_REFERRAL_SYMPTOM",
                  "value": "{{0.HFReferralModel.symptom}}"
                },
                {
                  "iterate": "{{0.HFReferralModel.additionalFields.fields}}",
                  "hideIfNull": true,
                  "excludeKeys": ["name"]
                }
              ],
              "format": "labelPairList"
            }
          ]
        }
      ],
      "name": "referralOverview",
      "footer": [
        {
          "type": "template",
          "label": "REFERRAL_OVERVIEW_PRIMARY_ACTION_LABEL",
          "format": "button",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {
                "data": [],
                "name": "referralInbox",
                "type": "TEMPLATE"
              }
            }
          ],
          "fieldName": "backButton",
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        }
      ],
      "header": [
        {
          "type": "template",
          "label": "REFERRAL_OVERVIEW_BACK_BUTTON_LABEL",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "referralInbox", "type": "TEMPLATE"}
            }
          ]
        }
      ],
      "heading": "REFERRAL_OVERVIEW_HEADING",
      "screenType": "TEMPLATE",
      "description": "REFERRAL_OVERVIEW_DESCRIPTION",
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "clientReferenceId",
                "value": "{{navigation.clientReferenceId}}",
                "operation": "equals"
              }
            ],
            "name": "hFReferral",
            "type": "SEARCH_EVENT"
          }
        }
      ],
      "wrapperConfig": {
        "filters": [],
        "relations": [],
        "rootEntity": "HFReferralModel",
        "wrapperName": "hFReferral",
        "searchConfig": {
          "select": ["hFReferral"],
          "primary": "hFReferral"
        }
      }
    }
  ],
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
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "viewTransaction",
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
          "select": ["projectFacility", "productVariant", "stock"]
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
                "name": "RECORDSTOCK",
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
                "name": "RECORDSTOCK",
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
                "name": "RECORDSTOCK",
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
                "name": "RECORDSTOCK",
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
          "description": "INVENTORY_STOCK_LOSS_DESCRIPTION",
          "icon": 'Store',
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "RECORDSTOCK",
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
      "name": "RECORDSTOCK",
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
              "enums": [],
              "label": "APP_CONFIG_INVENTORY_warehouseDetails_teamCode_LABEL",
              "order": 4,
              "value": "",
              "format": "scanner",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "teamCode",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInSummary": true,
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
              "dropDownOptions": []
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
                "expression": [
                  {"condition": "stockDetails.facilityFromWhich==Delivery Team"}
                ]
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
              // "validations": [
              //   {
              //     "type": "required",
              //     "value": true,
              //     "message": "Transport type is required"
              //   }
              // ],
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
              // "validations": [
              //   {
              //     "type": "required",
              //     "value": true,
              //     "message": "Vehicle number is required"
              //   }
              // ],
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
              "visibilityCondition": {
                "expression": [
                  {
                    "condition":
                        "contains(stockDetails.productdetail, 'PVAR-2024-11-20-000437')"
                  }
                ]
              },
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
              "enums": null,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "navigation.stockEntryType == 'ISSUED'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_QUANTITY__LOSTLABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the quantity lost by the warehouse",
              "infoText": "",
              "readOnly": false,
              "fieldName": "quantityLost",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Quantity lost is required"
                },
                {
                  "type": "regex",
                  "value": r"^[0-9]+$",
                  "message": "Please enter a valid number"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "navigation.stockEntryType == 'LOSS'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_QUANTITY__DAMAGEDLABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the quantity damaged by the warehouse",
              "infoText": "",
              "readOnly": false,
              "fieldName": "quantityDamaged",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Quantity Damaged is required"
                },
                {
                  "type": "regex",
                  "value": r"^[0-9]+$",
                  "message": "Please enter a valid number"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "navigation.stockEntryType == 'DAMAGED'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_QUANTITY_RETURNED_LABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the actual quantity returned",
              "infoText": "",
              "readOnly": false,
              "fieldName": "quantityReturned",
              "deleteFlag": false,
              "innerLabel": "",
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "navigation.stockEntryType == 'RETURNED'",
                    "type": "custom"
                  }
                ]
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
                "expression": [
                  {
                    "condition": "navigation.stockEntryType == 'RECEIPT'",
                    "type": "custom"
                  }
                ]
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
                "expression": [
                  {
                    "condition":
                        "stockProductDetails.quantitySent!=stockProductDetails.quantityReceived"
                  }
                ]
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
            "navigationMode": "popUntilAndPush",
            "popUntilPageName": "manageStock",
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
                  "navigationMode": "popUntil",
                  "popUntilPageName": "manageStock",
                }
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "scanStockReceipt",
      "heading": "INVENTORY_SCAN_STOCK_RECEIPT_HEADING",
      "description": "INVENTORY_SCAN_STOCK_RECEIPT_DESCRIPTION",
      "header": [
        {
          "format": "backLink",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "initActions": [
        {
          "actionType": "OPEN_SCANNER",
          "properties": {
            "scanType": "qr",
            "fieldName": "scannedMrn",
            "singleValue": true,
            "quantity": 1,
            "isGS1code": false,
            "onSuccess": [
              {
                "actionType": "SEARCH_EVENT",
                "properties": {
                  "type": "SEARCH_EVENT",
                  "name": "stock",
                  "awaitResults": true,
                  "data": [
                    {
                      "key": "additionalFields",
                      "value": "{{scannedMrn}}",
                      "operation": "contains"
                    }
                  ]
                }
              },
              {
                "actionType": "REVERSE_TRANSFORM",
                "properties": {
                  "configName": "stock",
                  "entityTypes": ["StockModel"]
                }
              },
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "FORM",
                  "name": "RECORDSTOCK",
                  "data": [
                    {"key": "stockEntryType", "value": "RECEIPT"},
                    {"key": "transactionType", "value": "RECEIVED"},
                    {"key": "scannedMrn", "value": "577E-52D8-B4F8"},
                    {"key": "isEdit", "value": "true"},
                    {"key": "forceCreate", "value": "true"}
                  ]
                }
              }
            ]
          }
        },
      ],
      "wrapperConfig": {
        "wrapperName": "ScanStockWrapper",
        "groupByType": true,
        "rootEntity": "StockModel",
        "filters": [],
        "relations": [
          {"name": "stock", "entity": "StockModel"}
        ],
        "searchConfig": {
          "primary": "stock",
          "select": ["stock"]
        }
      },
      "body": [
        {
          "format": "qrScanner",
          "label": "INVENTORY_SCAN_MRN_LABEL",
          "scanType": "qr",
          "fieldName": "scanPage.scannedMrn",
          "properties": {
            "type": "primary",
            "size": "large",
            "mainAxisSize": "max"
          },
          "onChange": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "type": "SEARCH_EVENT",
                "name": "stock",
                "data": [
                  {
                    "key": "additionalFields",
                    "value": "680C-E975-B27F",
                    "operation": "contains"
                  }
                ]
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "RECORDSTOCK",
                "data": [
                  {"key": "stockEntryType", "value": "RECEIPT"},
                  {"key": "transactionType", "value": "RECEIVED"},
                  {
                    "key": "mrnNumber",
                    "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
                  },
                  {"key": "scannedMrn", "value": "{{scanPage.scannedMrn}}"},
                  {"key": "prefillFromScan", "value": "true"}
                ]
              }
            }
          ]
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
                        "{{fn:formatDate(item.items[0].dateOfEntry, 'date', dd MMM yyyy)}}"
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
                      "navigationMode": "popUntilAndPush",
                      "popUntilPageName": "manageStock",
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
                        "{{fn:formatDate(item.additionalFields.fields.expiryDate, 'date', dd MMM yyyy)}}"
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
              "format": "dropdownTemplate",
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
              "format": "dropdownTemplate",
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
            "entity": "REFERRAL",
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

final dynamic permission_handler_config = {
  "name": "PERMISSIONHANDLER",
  "initialPage": "permissionHandler",
  "order": 6,
  "project": "LLIN-mz",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "permissionHandler",
      "heading": "CORE_COMMON_ALLOW_PERMISSIONS",
      "description": "CORE_COMMON_ALLOW_PERMISSIONS",
      "header": [
        {
          "format": "backLink",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [],
      "initActions": [],
      "wrapperConfig": {
        "wrapperName": "PermissionWrapper",
        "rootEntity": "PermissionModel"
      },
      "body": [
        {
          "format": "column",
          "properties": {"mainAxisAlignment": "start", "mainAxisSize": "min"},
          "children": [
            {
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
                      "format": "row",
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "NotificationsActive"},
                        {
                          "format": "column",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_NOTIFICATION",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": false,
                      "visible": "{{ !context.notificationPermissionGranted }}",
                      "properties": {
                        "type": "primary",
                        "size": "small",
                        "mainAxisSize": "min",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "REQUEST_PERMISSION",
                          "properties": {"permission": "notification"}
                        }
                      ]
                    }
                  ]
                },
                {
                  "format": "tag",
                  "label": "{{context.notificationPermissionStatus}}"
                }
              ]
            },
            {
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
                      "format": "row",
                      "expanded": true,
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "SettingsCell"},
                        {
                          "format": "column",
                          "expanded": true,
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value":
                                  "CORE_COMMON_PERMISSION_IGNOREBATTERYOPTIMIZATIONS",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": false,
                      "visible":
                          "{{ !context.ignoreBatteryOptimizationsPermissionGranted }}",
                      "properties": {
                        "type": "primary",
                        "size": "small",
                        "mainAxisSize": "min",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "REQUEST_PERMISSION",
                          "properties": {
                            "permission": "ignoreBatteryOptimizations"
                          }
                        }
                      ]
                    }
                  ]
                },
                {
                  "format": "tag",
                  "label":
                      "{{context.ignoreBatteryOptimizationsPermissionStatus}}"
                }
              ]
            },
            {
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
                      "format": "row",
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "LocationOn"},
                        {
                          "format": "column",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_LOCATION",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": false,
                      "visible": "{{ !context.locationPermissionGranted }}",
                      "properties": {
                        "type": "primary",
                        "size": "small",
                        "mainAxisSize": "min",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "REQUEST_PERMISSION",
                          "properties": {"permission": "location"}
                        }
                      ]
                    }
                  ]
                },
                {
                  "format": "tag",
                  "label": "{{context.locationPermissionStatus}}"
                }
              ]
            },
            {
              "format": "card",
              "visible": "{{ context.showNearbyWifiDevices }}",
              "children": [
                {
                  "format": "row",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "format": "row",
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "PermScanWifi"},
                        {
                          "format": "column",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value":
                                  "CORE_COMMON_PERMISSION_NEARBYWIFIDEVICES",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": false,
                      "visible":
                          "{{ !context.nearbyWifiDevicesPermissionGranted }}",
                      "properties": {
                        "type": "primary",
                        "size": "small",
                        "mainAxisSize": "min",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "REQUEST_PERMISSION",
                          "properties": {"permission": "nearbyWifiDevices"}
                        }
                      ]
                    }
                  ]
                },
                {
                  "format": "tag",
                  "label": "{{context.nearbyWifiDevicesPermissionStatus}}"
                }
              ]
            },
            {
              "format": "card",
              "visible": "{{ context.showBluetoothScan }}",
              "children": [
                {
                  "format": "row",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "format": "row",
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "PermScanWifi"},
                        {
                          "format": "column",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_BLUETOOTHSCAN",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": false,
                      "visible":
                          "{{ !context.bluetoothScanPermissionGranted }}",
                      "properties": {
                        "type": "primary",
                        "size": "small",
                        "mainAxisSize": "min",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "REQUEST_PERMISSION",
                          "properties": {"permission": "bluetoothScan"}
                        }
                      ]
                    }
                  ]
                },
                {
                  "format": "tag",
                  "label": "{{context.bluetoothScanPermissionStatus}}"
                }
              ]
            },
            {
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
                      "format": "row",
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "PermCameraMic"},
                        {
                          "format": "column",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_CAMERA"
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": false,
                      "visible": "{{ !context.cameraPermissionGranted }}",
                      "properties": {
                        "type": "primary",
                        "size": "small",
                        "mainAxisSize": "min",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "REQUEST_PERMISSION",
                          "properties": {"permission": "camera"}
                        }
                      ]
                    }
                  ]
                },
                {"format": "tag", "label": "{{context.cameraPermissionStatus}}"}
              ]
            }
          ]
        }
      ]
    }
  ]
};

final dynamic dd = {
  'data': {
    "name": "REGISTRATION",
    "flows": [
      {
        "body": [
          {
            "type": "template",
            "label": "REFERRAL_SUCCESSFUL_PANEL_CARD_HEADING",
            "format": "panelCard",
            "heading": "REFERRAL_SUCCESSFUL_PANEL_CARD_HEADING",
            "fieldName": "successCard",
            "mandatory": true,
            "properties": {"type": "success"},
            "description": "REFERRAL_SUCCESSFUL_PANEL_CARD_DESC",
            "primaryAction": {
              "type": "template",
              "label": "REFERRAL_VIEW_HOUSEHOLD_DETAILS",
              "format": "button",
              "hidden": false,
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "data": [
                      {
                        "key": "selectedIndividualClientReferenceId",
                        "value":
                            "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                      },
                      {
                        "key": "HouseholdClientReferenceId",
                        "value":
                            "{{ contextData.navigation.HouseholdClientReferenceId }}"
                      }
                    ],
                    "name": "householdOverview",
                    "type": "TEMPLATE"
                  }
                }
              ],
              "fieldName": "viewHouseholdButton",
              "mandatory": true,
              "properties": {"type": "primary"}
            },
            "secondaryAction": {
              "type": "template",
              "label": "GO_BACK",
              "format": "button",
              "hidden": false,
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "name": "searchBeneficiary",
                    "type": "TEMPLATE"
                  }
                }
              ],
              "fieldName": "goBack",
              "mandatory": true,
              "properties": {"type": "secondary"}
            },
            "primaryActionLabel": "REFERRAL_VIEW_HOUSEHOLD_DETAILS",
            "secondaryActionLabel": "GO_BACK"
          }
        ],
        "name": "referralSuccess",
        "order": 7,
        "footer": [],
        "header": [
          {
            "type": "template",
            "label": "REFERRAL_BACK",
            "format": "backLink",
            "onAction": [
              {
                "actionType": "BACK_NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "HouseholdClientReferenceId",
                      "value": "{{navigation.clientReferenceId}}"
                    }
                  ],
                  "name": "householdOverview",
                  "type": "TEMPLATE"
                }
              }
            ],
            "fieldName": "referralBack",
            "mandatory": true
          }
        ],
        "navigateTo": null,
        "screenType": "TEMPLATE",
        "submitCondition": null,
        "preventScreenCapture": false
      },
      {
        "body": [
          {
            "type": "template",
            "label": "DELIVERY_SUCCESSFUL_PANEL_CARD_HEADING",
            "format": "panelCard",
            "heading": "DELIVERY_SUCCESSFUL_PANEL_CARD_HEADING",
            "fieldName": "successCard",
            "mandatory": true,
            "properties": {"type": "success"},
            "description": "DELIVERY_SUCCESSFUL_PANEL_CARD_DESC",
            "primaryAction": {
              "type": "template",
              "label": "VIEW_HOUSEHOLD_DETAILS",
              "format": "button",
              "hidden": false,
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "data": [
                      {
                        "key": "HouseholdClientReferenceId",
                        "value":
                            "{{contextData.navigation.HouseholdClientReferenceId}}"
                      }
                    ],
                    "name": "householdOverview",
                    "type": "TEMPLATE"
                  }
                }
              ],
              "fieldName": "viewHouseholdButton",
              "mandatory": true,
              "properties": {"type": "primary"}
            },
            "secondaryAction": {
              "type": "template",
              "label": "GO_BACK",
              "format": "button",
              "hidden": false,
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "name": "searchBeneficiary",
                    "type": "TEMPLATE"
                  }
                }
              ],
              "fieldName": "goBack",
              "mandatory": true,
              "properties": {"type": "secondary"}
            },
            "primaryActionLabel": "VIEW_HOUSEHOLD_DETAILS",
            "secondaryActionLabel": "GO_BACK"
          }
        ],
        "name": "deliverySuccess",
        "order": 10,
        "footer": [],
        "header": [
          {
            "type": "template",
            "label": "DELIVERY_BACK",
            "format": "backLink",
            "onAction": [
              {
                "actionType": "BACK_NAVIGATION",
                "properties": {"name": "householdOverview", "type": "TEMPLATE"}
              }
            ],
            "fieldName": "deliveryBack",
            "mandatory": true
          }
        ],
        "navigateTo": null,
        "screenType": "TEMPLATE",
        "submitCondition": null,
        "preventScreenCapture": false
      },
      {
        "body": [
          {
            "type": "template",
            "format": "card",
            "children": [
              {
                "data": [
                  {
                    "key": "NAME_OF_INDIVIDUAL",
                    "value":
                        "{{contextData.0.individuals.IndividualModel.name.givenName}}"
                  },
                  {
                    "key": "ID_TYPE",
                    "value":
                        "{{contextData.0.individuals.IndividualModel.identifiers.0.identifierType}}"
                  },
                  {
                    "key": "ID_NUMBER",
                    "value":
                        "{{contextData.0.individuals.IndividualModel.identifiers.0.identifierId}}"
                  },
                  {
                    "key": "AGE",
                    "value":
                        "{{fn:formatDate(contextData.0.individuals.IndividualModel.dateOfBirth, 'age')}}"
                  },
                  {
                    "key": "GENDER",
                    "value":
                        "{{contextData.0.individuals.IndividualModel.gender}}"
                  },
                  {
                    "key": "MOBILE_NUMBER",
                    "value":
                        "{{contextData.0.individuals.IndividualModel.mobileNumber}}"
                  },
                  {
                    "key": "DATE_OF_REGISTRATION",
                    "value":
                        "{{fn:formatDate(contextData.0.projectBeneficiaries.ProjectBeneficiaryModel.dateOfRegistration, 'date', dd MMM yyyy)}}"
                  }
                ],
                "type": "template",
                "format": "labelPairList",
                "fieldName": "meberDetails"
              }
            ],
            "fieldName": "detailsCard",
            "properties": {"type": "primary"}
          },
          {
            "type": "template",
            "format": "card",
            "children": [
              {
                "data": {
                  "rows": "{{contextData.0.targetCycle.0.deliveries}}",
                  "source": "contextData.targetCycle.deliveries",
                  "columns": [
                    {
                      "header": "DOSE",
                      "isActive": true,
                      "cellValue": "REGISTRATION_CURRENT_DOSE {{item.id}}"
                    },
                    {
                      "header": "DELIVERY_STATUS",
                      "isActive": true,
                      "cellValue": {
                        "@default": "REGISTRATION_CURRENT_DOSE_STATUS_PENDING",
                        "@condition": [
                          {
                            "when":
                                "{{fn:isDoseCompleted(item.id, contextData.0.currentRunningCycle)}} == true",
                            "value":
                                "REGISTRATION_CURRENT_DOSE_STATUS_ADMINISTERED"
                          },
                          {
                            "when":
                                "{{item.id}} == {{contextData.0.nextDoseId}}",
                            "value":
                                "REGISTRATION_CURRENT_DOSE_STATUS_TOBE_ADMINISTERED"
                          }
                        ]
                      }
                    },
                    {
                      "header": "COMPLETED_ON",
                      "isActive": true,
                      "cellValue":
                          "{{fn:getTaskCompletionDate(item.id, contextData.0.nextCycleIndex)}}"
                    }
                  ]
                },
                "type": "template",
                "format": "table",
                "fieldName": "deliveryTable"
              },
              {
                "type": "template",
                "format": "expandable",
                "visible": "{{fn:length(contextData.0.pastCycles)}} > 0",
                "children": [
                  {
                    "type": "template",
                    "child": {
                      "type": "template",
                      "format": "card",
                      "children": [
                        {
                          "type": "template",
                          "value": "REGISTRATION_PAST_CYCLE {{item.id}}",
                          "format": "textTemplate",
                          "fieldName": "cycleNumber",
                          "properties": {"style": "headingS"}
                        },
                        {
                          "data": {
                            "rows": "{{deliveries}}",
                            "columns": [
                              {
                                "header": "DOSE",
                                "isActive": true,
                                "cellValue":
                                    "REGISTRATION_PAST_DOSE {{item.id}}"
                              },
                              {
                                "header": "DELIVERY_STATUS",
                                "isActive": true,
                                "cellValue": {
                                  "@default":
                                      "REGISTRATION_PAST_DOSE_STATUS_PENDING",
                                  "@condition": [
                                    {
                                      "when":
                                          "{{fn:isDoseCompleted(item.id, currentItem.id)}} == true",
                                      "value":
                                          "REGISTRATION_PAST_DOSE_STATUS_ADMINISTERED"
                                    },
                                    {
                                      "when":
                                          "{{item.id}} == {{contextData.0.nextDoseId}}",
                                      "value":
                                          "REGISTRATION_PAST_DOSE_STATUS_TOBE_ADMINISTERED"
                                    }
                                  ]
                                }
                              },
                              {
                                "header": "COMPLETED_ON",
                                "isActive": true,
                                "cellValue":
                                    "{{fn:getTaskCompletionDate(item.id, currentItem.id)}}"
                              }
                            ]
                          },
                          "type": "template",
                          "format": "table",
                          "fieldName": "pastCycleTable"
                        }
                      ],
                      "properties": {"type": "secondary"}
                    },
                    "format": "listView",
                    "visible": "{{fn:length(contextData.0.pastCycles)}} > 0",
                    "fieldName": "pastCyclesList",
                    "dataSource": "pastCycles",
                    "properties": {"spacing": "spacer4"}
                  }
                ],
                "expandLabel": "REGISTRATION_VIEW_PAST_CYCLES",
                "collapseLabel": "REGISTRATION_HIDE_PAST_CYCLES",
                "controlsField": "pastCycles"
              }
            ],
            "properties": {"type": "primary"}
          }
        ],
        "name": "beneficiaryDetails",
        "order": 8,
        "footer": [
          {
            "type": "template",
            "label": "RECORD_CYCLE_DOSE",
            "format": "button",
            "visible":
                "{{fn:canRecordDelivery(contextData.0.nextCycleId)}}==true",
            "disabled": "{{eligibleProductVariants}} == null",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
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
                    {
                      "key": "cycleIndex",
                      "value": "{{contextData.nextCycleId}}"
                    },
                    {"key": "doseIndex", "value": "{{contextData.nextDoseId}}"}
                  ],
                  "name": "DELIVERY",
                  "type": "FORM"
                }
              }
            ],
            "fieldName": "recordCycle",
            "mandatory": true,
            "properties": {
              "size": "large",
              "type": "primary",
              "mainAxisSize": "max",
              "mainAxisAlignment": "center"
            }
          }
        ],
        "header": [
          {
            "label": "BENEFICIARY_BACK",
            "format": "backLink",
            "onAction": [
              {
                "actionType": "BACK_NAVIGATION",
                "properties": {"name": "householdOverview", "type": "TEMPLATE"}
              }
            ]
          }
        ],
        "heading": "BENEFICIARY_DETAILS_HEADING",
        "navigateTo": null,
        "screenType": "TEMPLATE",
        "description": "BENEFICIARY_DETAILS_DESC",
        "initActions": [
          {
            "actionType": "SEARCH_EVENT",
            "properties": {
              "data": [
                {
                  "key": "clientReferenceId",
                  "value": "{{navigation.selectedIndividualClientReferenceId}}",
                  "operation": "equals"
                }
              ],
              "name": "individual",
              "type": "SEARCH_EVENT"
            }
          }
        ],
        "wrapperConfig": {
          "fields": {
            "dose": {
              "from": "{{tasks.additionalFields.fields}}",
              "where": {
                "left": "{{key}}",
                "right": "doseIndex",
                "operator": "eq"
              },
              "select": "{{value}}",
              "default": 0,
              "takeLast": true
            },
            "cycle": {
              "from": "{{tasks.additionalFields.fields}}",
              "where": {
                "left": "{{key}}",
                "right": "cycleIndex",
                "operator": "eq"
              },
              "select": "{{value}}",
              "default": 1,
              "takeLast": true
            }
          },
          "filters": [
            {
              "field": "clientReferenceId",
              "equalsFrom": "{{navigation.selectedIndividualClientReferenceId}}"
            }
          ],
          "computed": {
            "nextDoseId": {
              "order": 4,
              "fallback": 1,
              "condition": {
                "if": {
                  "left": {"value": "{{dose}}", "operation": "increment"},
                  "right": "{{deliveryLength}}",
                  "operator": "lte"
                },
                "else": 1,
                "then": {"value": "{{dose}}", "operation": "increment"}
              }
            },
            "nextCycleId": {
              "order": 5,
              "fallback": "{{cycle}}",
              "condition": {
                "if": {
                  "left": {"value": "{{dose}}", "operation": "increment"},
                  "right": "{{deliveryLength}}",
                  "operator": "lte"
                },
                "else": {"value": "{{cycle}}", "operation": "increment"},
                "then": "{{cycle}}"
              }
            },
            "deliveryLength": {
              "from":
                  "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
              "order": 3,
              "where": {
                "left": "{{id}}",
                "right": "{{currentRunningCycle}}",
                "operator": "equals"
              },
              "select": "{{deliveries.length}}",
              "default": 0,
              "takeFirst": true
            },
            "hasCycleArrived": {
              "order": 2,
              "fallback": false,
              "condition": {
                "left": "{{cycle}}",
                "right": "{{currentRunningCycle}}",
                "operator": "equals"
              }
            },
            "currentRunningCycle": {
              "from":
                  "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
              "order": 1,
              "where": [
                {"left": "{{startDate}}", "right": "{{now}}", "operator": "lt"},
                {"left": "{{endDate}}", "right": "{{now}}", "operator": "gt"}
              ],
              "select": "{{id}}",
              "default": -1,
              "takeFirst": true
            }
          },
          "relations": [
            {
              "name": "members",
              "match": {
                "field": "individualClientReferenceId",
                "equalsFrom": "IndividualModel.clientReferenceId"
              },
              "entity": "HouseholdMemberModel"
            },
            {
              "name": "household",
              "match": {
                "field": "clientReferenceId",
                "equalsFrom": "members.householdClientReferenceId"
              },
              "entity": "HouseholdModel"
            },
            {
              "name": "individuals",
              "match": {
                "field": "clientReferenceId",
                "inFrom": "members.individualClientReferenceId"
              },
              "entity": "IndividualModel"
            },
            {
              "name": "projectBeneficiaries",
              "match": {
                "field": "beneficiaryClientReferenceId",
                "equalsFrom": "individuals.clientReferenceId"
              },
              "entity": "ProjectBeneficiaryModel"
            },
            {
              "name": "tasks",
              "match": {
                "field": "projectBeneficiaryClientReferenceId",
                "inFrom": "projectBeneficiaries.clientReferenceId"
              },
              "entity": "TaskModel"
            },
            {
              "name": "sideEffects",
              "match": {
                "field": "clientReferenceId",
                "equalsFrom": "projectBeneficiaries.clientReferenceId"
              },
              "entity": "SideEffectModel"
            },
            {
              "name": "referrals",
              "match": {
                "field": "clientReferenceId",
                "equalsFrom": "projectBeneficiaries.clientReferenceId"
              },
              "entity": "ReferralModel"
            }
          ],
          "rootEntity": "IndividualModel",
          "wrapperName": "DeliveryWrapper",
          "computedList": {
            "pastCycles": {
              "from":
                  "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
              "order": 6,
              "where": {
                "left": "{{item.id}}",
                "right": "{{nextCycleId}}",
                "operator": "lt"
              },
              "includeCurrentIf": {
                "condition": {
                  "left": "{{dose}}",
                  "right": "{{deliveryLength}}",
                  "operator": "eq"
                }
              }
            },
            "futureTasks": {
              "from": "{{tasks}}",
              "order": 2,
              "where": {
                "left": "{{item.additionalFields.deliveryStrategy}}",
                "right": "INDIRECT",
                "operator": "equals"
              }
            },
            "targetCycle": {
              "from":
                  "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
              "order": 1,
              "where": {
                "left": "{{id}}",
                "right": "{{currentRunningCycle}}",
                "operator": "equals"
              },
              "fallback": null,
              "takeLast": true
            },
            "currentDelivery": {
              "from": "{{targetCycle.0.deliveries}}",
              "order": 4,
              "where": {
                "left": "{{id}}",
                "right": "{{nextDoseId}}",
                "operator": "equals"
              },
              "fallback": null,
              "takeLast": true
            },
            "futureDeliveries": {
              "map": "{{item.deliveries}}",
              "from":
                  "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
              "skip": {"from": "{{dose}}"},
              "order": 3,
              "takeWhile": {
                "left": "{{item.deliveryStrategy}}",
                "right": "INDIRECT",
                "operator": "equals"
              }
            },
            "eligibleProductVariants": {
              "from": "{{currentDelivery.0.doseCriteria}}",
              "order": 5,
              "fallback": [],
              "takeLast": false,
              "evaluateCondition": {
                "context": ["{{individuals.0}}", "{{household.0}}"],
                "condition": "{{item.condition}}",
                "transformations": {
                  "age": {"type": "ageInMonths", "source": "dateOfBirth"}
                }
              }
            }
          },
          "searchConfig": {
            "select": [
              "individual",
              "household",
              "householdMember",
              "projectBeneficiary",
              "task"
            ],
            "primary": "individual"
          }
        },
        "submitCondition": null,
        "preventScreenCapture": false
      },
      {
        "body": [
          {
            "type": "template",
            "format": "card",
            "children": [
              {
                "format": "row",
                "children": [
                  {
                    "label": "REGISTRATION_EDIT_HOUSEHOLD_BUTTON_LABEL",
                    "format": "button",
                    "onAction": [
                      {
                        "actionType": "REVERSE_TRANSFORM",
                        "properties": {
                          "configName": "beneficiaryRegistration",
                          "entityTypes": ["HouseholdModel"]
                        }
                      },
                      {
                        "actionType": "NAVIGATION",
                        "properties": {
                          "data": [
                            {
                              "key": "HouseholdClientReferenceId",
                              "value":
                                  "{{ context.household.clientReferenceId }}"
                            },
                            {"key": "isEdit", "value": "true"}
                          ],
                          "name": "HOUSEHOLD",
                          "type": "FORM"
                        }
                      }
                    ],
                    "properties": {
                      "size": "large",
                      "type": "tertiary",
                      "mainAxisSize": "min",
                      "mainAxisAlignment": "center"
                    }
                  }
                ],
                "properties": {"mainAxisAlignment": "end"}
              },
              {
                "data": [
                  {
                    "key": "HOUSEHOLD_HEAD_NAME",
                    "value":
                        "{{contextData.0.headIndividual.IndividualModel.name.givenName}}"
                  },
                  {
                    "key": "HOUSEHOLD_LOCALITY",
                    "value":
                        "{{contextData.0.household.HouseholdModel.address.locality.code}}"
                  },
                  {
                    "key": "MEMBER_COUNT",
                    "value":
                        "{{contextData.0.household.HouseholdModel.memberCount}}"
                  }
                ],
                "type": "template",
                "format": "labelPairList",
                "fieldName": "householdDetails"
              },
              {
                "type": "template",
                "child": {
                  "type": "template",
                  "format": "card",
                  "children": [
                    {
                      "type": "template",
                      "format": "row",
                      "children": [
                        {
                          "type": "template",
                          "value": "{{ individual.0.name.givenName }}",
                          "format": "textTemplate",
                          "fieldName": "individualName"
                        },
                        {
                          "label": "REGISTRATION_EDIT_INDIVIDUAL_BUTTON_LABEL",
                          "format": "button",
                          "onAction": [
                            {
                              "actionType": "REVERSE_TRANSFORM",
                              "properties": {
                                "data": [
                                  {"key": "entities", "value": "{{individual}}"}
                                ],
                                "configName": "individualRegistration",
                                "entityTypes": ["IndividualModel"]
                              }
                            },
                            {
                              "actionType": "NAVIGATION",
                              "properties": {
                                "data": [
                                  {
                                    "key": "HouseholdClientReferenceId",
                                    "value":
                                        "{{member.0.householdClientReferenceId}}"
                                  },
                                  {"key": "isEdit", "value": "true"}
                                ],
                                "name": "ADD_MEMBER",
                                "type": "FORM"
                              }
                            }
                          ],
                          "properties": {
                            "size": "large",
                            "type": "tertiary",
                            "mainAxisSize": "min",
                            "mainAxisAlignment": "center"
                          }
                        }
                      ],
                      "properties": {
                        "mainAxisSize": "max",
                        "mainAxisAlignment": "spaceBetween"
                      }
                    },
                    {
                      "type": "template",
                      "value":
                          "{{individual.0.gender }} | {{fn:formatDate(individual.0.dateOfBirth, 'age')}}",
                      "format": "textTemplate",
                      "fieldName": "genderAge"
                    },
                    {
                      "type": "template",
                      "label": "NOT_ELIGIBLE",
                      "format": "tag",
                      "visible":
                          "{{fn:checkEligibilityForAgeAndSideEffect(individual.0.dateOfBirth)}}==false",
                      "fieldName": "notEligible",
                      "properties": {"tagType": "error"}
                    },
                    {
                      "type": "template",
                      "label": "ADMINISTERED_SUCCESS",
                      "format": "tag",
                      "visible": "{{fn:isDelivered(task.0.status)}}==true",
                      "fieldName": "administrationSuccess",
                      "properties": {"tagType": "success"}
                    },
                    {
                      "type": "template",
                      "label": "NOT_VISITED",
                      "format": "tag",
                      "visible":
                          "{{fn:checkEligibilityForAgeAndSideEffect(individual.0.dateOfBirth)}}==true && {{fn:isDelivered(task.0.status)}}==false",
                      "fieldName": "notVisited",
                      "properties": {"tagType": "info"}
                    },
                    {
                      "type": "template",
                      "label": "DELIVERY",
                      "format": "button",
                      "visible":
                          "{{fn:checkEligibilityForAgeAndSideEffect(individual.0.dateOfBirth)}} == true  && {{fn:checkAllDoseDelivered(task)}} == false",
                      "onAction": [
                        {
                          "actionType": "NAVIGATION",
                          "properties": {
                            "data": [
                              {
                                "key": "selectedIndividualClientReferenceId",
                                "value": "{{individual.0.clientReferenceId}}"
                              },
                              {
                                "key": "selectedIndividualName",
                                "value": "{{individual.0.name.givenName}}"
                              },
                              {
                                "key": "HouseholdClientReferenceId",
                                "value":
                                    "{{member.0.householdClientReferenceId}}"
                              },
                              {
                                "key": "ProjectBeneficiaryClientReferenceId",
                                "value":
                                    "{{projectBeneficiary.0.clientReferenceId}}"
                              }
                            ],
                            "name": "CHECKLIST",
                            "type": "FORM"
                          }
                        }
                      ],
                      "fieldName": "deliveryButton",
                      "mandatory": true,
                      "properties": {
                        "size": "medium",
                        "type": "primary",
                        "mainAxisSize": "max",
                        "mainAxisAlignment": "center"
                      }
                    },
                    {
                      "icon": "add",
                      "type": "template",
                      "label": "REGISTRATION_VIEW_DETAILS",
                      "format": "button",
                      "visible":
                          "{{fn:checkEligibilityForAgeAndSideEffect(individual.0.dateOfBirth)}} == true &&  {{fn:checkAllDoseDelivered(task)}} == true",
                      "onAction": [
                        {
                          "actionType": "NAVIGATION",
                          "properties": {
                            "data": [
                              {
                                "key": "selectedIndividualClientReferenceId",
                                "value": "{{individual.0.clientReferenceId}}"
                              },
                              {
                                "key": "selectedIndividualName",
                                "value": "{{individual.0.name.givenName}}"
                              },
                              {
                                "key": "HouseholdClientReferenceId",
                                "value":
                                    "{{member.0.householdClientReferenceId}}"
                              },
                              {
                                "key": "ProjectBeneficiaryClientReferenceId",
                                "value":
                                    "{{projectBeneficiary.0.clientReferenceId}}"
                              }
                            ],
                            "name": "beneficiaryDetails",
                            "type": "TEMPLATE"
                          }
                        }
                      ],
                      "fieldName": "viewDetails",
                      "properties": {
                        "size": "medium",
                        "type": "secondary",
                        "mainAxisSize": "max",
                        "mainAxisAlignment": "center"
                      }
                    }
                  ],
                  "fieldName": "memberCard",
                  "properties": {"type": "secondary", "cardType": "secondary"}
                },
                "format": "listView",
                "hidden": false,
                "fieldName": "listViewMembers",
                "dataSource": "members",
                "properties": {"spacing": "spacer4"}
              },
              {
                "type": "template",
                "label": "ADD_MEMBER",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{household.HouseholdModel.clientReferenceId}}"
                        }
                      ],
                      "name": "ADD_MEMBER",
                      "type": "FORM"
                    }
                  }
                ],
                "fieldName": "addMember",
                "properties": {
                  "icon": "AddIcon",
                  "size": "medium",
                  "type": "tertiary",
                  "mainAxisSize": "min",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "properties": {"type": "primary", "cardType": "primary"}
          }
        ],
        "name": "householdOverview",
        "order": 3,
        "footer": [],
        "header": [
          {
            "label": "HOUSEHOLD_BACK",
            "format": "backLink",
            "onAction": [
              {
                "actionType": "BACK_NAVIGATION",
                "properties": {"name": "searchBeneficiary", "type": "TEMPLATE"}
              }
            ]
          }
        ],
        "heading": "REGISTRATION_HOUSEHOLD_OVERVIEW_HEADING",
        "navigateTo": null,
        "screenType": "TEMPLATE",
        "description": "REGISTRATION_HOUSEHOLD_OVERVIEW_DESC",
        "initActions": [
          {
            "actionType": "SEARCH_EVENT",
            "properties": {
              "data": [
                {
                  "key": "clientReferenceId",
                  "value": "{{navigation.HouseholdClientReferenceId}}",
                  "operation": "equals"
                }
              ],
              "name": "household",
              "type": "SEARCH_EVENT"
            }
          }
        ],
        "wrapperConfig": {
          "filters": [
            {
              "field": "clientReferenceId",
              "equalsFrom": "{{context.household.clientReferenceId}}"
            }
          ],
          "relations": [
            {
              "name": "household",
              "match": {
                "field": "clientReferenceId",
                "equalsFrom": "clientReferenceId"
              },
              "entity": "HouseholdModel"
            },
            {
              "name": "headOfHousehold",
              "match": {
                "field": "householdClientReferenceId",
                "equalsFrom": "clientReferenceId"
              },
              "entity": "HouseholdMemberModel",
              "filters": [
                {"field": "isHeadOfHousehold", "equals": true}
              ]
            },
            {
              "name": "headIndividual",
              "match": {
                "field": "clientReferenceId",
                "equalsFrom": "headOfHousehold.individualClientReferenceId"
              },
              "entity": "IndividualModel"
            },
            {
              "name": "members",
              "match": {
                "field": "householdClientReferenceId",
                "equalsFrom": "clientReferenceId"
              },
              "entity": "HouseholdMemberModel",
              "relations": [
                {
                  "name": "member",
                  "match": {
                    "field": "clientReferenceId",
                    "equalsFrom": "clientReferenceId"
                  },
                  "entity": "HouseholdMemberModel"
                },
                {
                  "name": "individual",
                  "match": {
                    "field": "clientReferenceId",
                    "equalsFrom": "individualClientReferenceId"
                  },
                  "entity": "IndividualModel",
                  "relations": [
                    {
                      "name": "name",
                      "match": {
                        "field": "individualClientReferenceId",
                        "equalsFrom": "clientReferenceId"
                      },
                      "entity": "NameModel"
                    }
                  ]
                },
                {
                  "name": "projectBeneficiary",
                  "match": {
                    "field": "beneficiaryClientReferenceId",
                    "equalsFrom": "individual.clientReferenceId"
                  },
                  "entity": "ProjectBeneficiaryModel"
                },
                {
                  "name": "task",
                  "match": {
                    "field": "projectBeneficiaryClientReferenceId",
                    "equalsFrom": "projectBeneficiary.clientReferenceId"
                  },
                  "entity": "TaskModel"
                },
                {
                  "name": "referral",
                  "match": {
                    "field": "projectBeneficiaryClientReferenceId",
                    "equalsFrom": "projectBeneficiary.clientReferenceId"
                  },
                  "entity": "ReferralModel"
                }
              ]
            }
          ],
          "rootEntity": "HouseholdModel",
          "wrapperName": "HouseholdWrapper",
          "searchConfig": {
            "select": [
              "household",
              "individual",
              "name",
              "householdMember",
              "projectBeneficiary",
              "task",
              "referral"
            ],
            "primary": "household"
          }
        },
        "submitCondition": null,
        "preventScreenCapture": false
      },
      {
        "body": [
          {
            "type": "template",
            "label": "PROXIMITY_SEARCH_REGISTRATION",
            "format": "proximitySearch",
            "onAction": [
              {
                "actionType": "field.value==true ? SEARCH_EVENT : CLEAR_STATE",
                "properties": {
                  "data": [
                    {"key": "", "value": 5, "operation": "within"}
                  ],
                  "name": "address",
                  "type": "field.value==true ? SEARCH_EVENT : CLEAR_STATE"
                }
              }
            ],
            "fieldName": "proximitySearch",
            "mandatory": true,
            "validations": [
              {
                "key": "proximityRadius",
                "value": 5,
                "errorMessage": "PROXIMITY_RADIUS_ERROR_MESSAGE"
              }
            ]
          },
          {
            "type": "template",
            "label": "NAME_OF_INDIVIDUAL",
            "format": "searchBar",
            "onAction": [
              {
                "actionType": "SEARCH_EVENT",
                "properties": {
                  "data": [
                    {
                      "key": "givenName",
                      "value": "field.value",
                      "operation": "contains"
                    }
                  ],
                  "name": "name",
                  "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT"
                }
              }
            ],
            "fieldName": "searchBar",
            "mandatory": true,
            "validation": [
              {"key": "minSearchChars", "error": "", "value": 3}
            ]
          },
          {
            "icon": "FilterAlt",
            "type": "template",
            "label": "REGISTRATION_SEARCH_BENEFICIARY_FILTER_LABEL",
            "format": "actionPopup",
            "fieldName": "filterPopUp",
            "properties": {
              "icon": "FilterAlt",
              "size": "medium",
              "type": "tertiary",
              "popupConfig": {
                "body": [
                  {
                    "type": "template",
                    "enums": [
                      {
                        "code": "ADMINISTRATION_SUCCESS",
                        "name": "REGISTRATION_ADMINISTRATION_SUCCESS"
                      },
                      {
                        "code": "ADMINISTRATION_FAILED",
                        "name": "REGISTRATION_ADMINISTRATION_FAILED"
                      },
                      {
                        "code": "CLOSED_HOUSEHOLD",
                        "name": "REGISTRATION_CLOSED_HOUSEHOLD"
                      },
                      {
                        "code": "NOT_REGISTERED",
                        "name": "REGISTRATION_NOT_REGISTERD"
                      },
                      {
                        "code": "NOT_ADMINISTERED",
                        "name": "REGISTRATION_NOT_ADMINISTERED"
                      }
                    ],
                    "format": "selectionCard",
                    "fieldName": "selectedStatus"
                  }
                ],
                "type": "default",
                "title": "REGISTRATION_SEARCH_BENEFICIARY_FILTER_TITLE_LABEL",
                "titleIcon": "filter",
                "footerActions": [
                  {
                    "type": "template",
                    "label":
                        "REGISTRATION_SEARCH_BENEFICIARY_FILTER_CLEAR_LABEL",
                    "format": "button",
                    "onAction": [
                      {
                        "actionType": "CLEAR_STATE",
                        "properties": {
                          "name": "pgrService",
                          "filterKeys": [
                            "status",
                            "projectBeneficiary",
                            "projectId"
                          ],
                          "widgetKeys": ["selectedStatus"],
                          "triggerSearch": true
                        }
                      },
                      {"actionType": "CLOSE_POPUP", "properties": {}}
                    ],
                    "properties": {
                      "size": "large",
                      "type": "secondary",
                      "mainAxisSize": "max"
                    }
                  },
                  {
                    "type": "template",
                    "label":
                        "REGISTRATION_SEARCH_BENEFICIARY_FILTER_FILTER_LABEL",
                    "format": "button",
                    "onAction": [
                      {
                        "actionType": "CLOSE_POPUP",
                        "properties": {"parentScreenKey": "searchBeneficiary"}
                      },
                      {
                        "actions": [
                          {
                            "actionType": "SEARCH_EVENT",
                            "properties": {
                              "data": [
                                {
                                  "key": "status",
                                  "value": "{{selectedStatus}}",
                                  "operation": "in"
                                }
                              ],
                              "name": "task"
                            }
                          }
                        ],
                        "condition": {
                          "expression":
                              "selectedStatus == ADMINISTRATION_SUCCESS || selectedStatus == CLOSED_HOUSEHOLD || selectedStatus == ADMINISTRATION_FAILED"
                        }
                      },
                      {
                        "actions": [
                          {
                            "actionType": "SEARCH_EVENT",
                            "properties": {
                              "data": [
                                {
                                  "key": "projectId",
                                  "value": "{{singleton.selectedProject.id}}",
                                  "operation": "notEqual"
                                }
                              ],
                              "name": "projectBeneficiary"
                            }
                          }
                        ],
                        "condition": {
                          "expression": "selectedStatus == NOT_REGISTERED"
                        }
                      },
                      {
                        "actions": [
                          {
                            "actionType": "SEARCH_EVENT",
                            "properties": {
                              "data": [
                                {
                                  "key": "projectId",
                                  "root": "projectBeneficiary",
                                  "value": "{{singleton.selectedProject.id}}",
                                  "operation": "equals"
                                },
                                {
                                  "key": "status",
                                  "root": "task",
                                  "value": [
                                    "ADMINISTRATION_SUCCESS",
                                    "ADMINISTRATION_FAILED",
                                    "CLOSED_HOUSEHOLD"
                                  ],
                                  "operation": "notIn"
                                }
                              ],
                              "filterLogic": "and"
                            }
                          }
                        ],
                        "condition": {
                          "expression": "selectedStatus == NOT_ADMINISTERED"
                        }
                      }
                    ],
                    "properties": {
                      "size": "large",
                      "type": "primary",
                      "mainAxisSize": "max"
                    }
                  }
                ],
                "showCloseButton": true,
                "barrierDismissible": true
              },
              "mainAxisSize": "min",
              "mainAxisAlignment": "start"
            },
            "suffixIcon": "FilterAlt"
          },
          {
            "data": "members",
            "type": "template",
            "child": {
              "type": "template",
              "format": "card",
              "children": [
                {
                  "type": "template",
                  "format": "row",
                  "children": [
                    {
                      "type": "template",
                      "value": "{{ headIndividual.0.name.givenName }}",
                      "format": "textTemplate",
                      "fieldName": "headOfHousehold"
                    },
                    {
                      "type": "template",
                      "label": "OPEN",
                      "format": "button",
                      "onAction": [
                        {
                          "actions": [
                            {
                              "actionType": "NAVIGATION",
                              "properties": {
                                "data": [
                                  {
                                    "key": "HouseholdClientReferenceId",
                                    "value":
                                        "{{ contextData.HouseholdModel.clientReferenceId }}"
                                  }
                                ],
                                "name": "householdOverview",
                                "type": "TEMPLATE"
                              }
                            }
                          ],
                          "condition": {
                            "expression":
                                "{{0.tasks.0.status}} != CLOSED_HOUSEHOLD"
                          }
                        },
                        {
                          "actions": [
                            {
                              "actionType": "REVERSE_TRANSFORM",
                              "properties": {
                                "configName": "beneficiaryRegistration",
                                "entityTypes": ["HouseholdModel", "TaskModel"]
                              }
                            },
                            {
                              "actionType": "NAVIGATION",
                              "properties": {
                                "data": [
                                  {
                                    "key": "HouseholdClientReferenceId",
                                    "value":
                                        "{{ contextData.HouseholdModel.clientReferenceId }}"
                                  },
                                  {"key": "isEdit", "value": "true"},
                                  {"key": "isClosedHousehold", "value": "true"}
                                ],
                                "name": "HOUSEHOLD",
                                "type": "FORM"
                              }
                            }
                          ],
                          "condition": {
                            "expression":
                                "{{0.tasks.0.status}} == CLOSED_HOUSEHOLD"
                          }
                        }
                      ],
                      "fieldName": "openMemberCard",
                      "properties": {"size": "medium", "type": "secondary"}
                    }
                  ],
                  "fieldName": "detailsRow",
                  "properties": {
                    "mainAxisSize": "max",
                    "mainAxisAlignment": "spaceBetween"
                  }
                },
                {
                  "data": {
                    "rows": "{{contextData.0.individuals}}",
                    "source": "individuals",
                    "columns": [
                      {
                        "header": "BENEFICIARY",
                        "hidden": false,
                        "cellValue": "{{item.name.givenName}}"
                      },
                      {
                        "header": "AGE_OF_BENEFICIARY",
                        "hidden": false,
                        "cellValue":
                            "{{fn:formatDate(item.dateOfBirth, 'age')}}"
                      },
                      {
                        "header": "GENDER",
                        "hidden": false,
                        "cellValue": "{{item.gender}}"
                      }
                    ]
                  },
                  "type": "template",
                  "format": "table",
                  "fieldName": "memberTable"
                }
              ],
              "fieldName": "memberCard"
            },
            "format": "listView",
            "hidden": false,
            "fieldName": "listView",
            "properties": {"spacing": "spacer4"}
          }
        ],
        "name": "searchBeneficiary",
        "order": 1,
        "footer": [
          {
            "type": "template",
            "label": "REGISTER_BENEFICIARY",
            "format": "button",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {"key": "nameOfIndividual", "value": "{{searchBar.value}}"}
                  ],
                  "name": "HOUSEHOLD",
                  "type": "FORM"
                }
              }
            ],
            "fieldName": "registerBeneficiary",
            "mandatory": true,
            "properties": {
              "size": "large",
              "type": "primary",
              "mainAxisSize": "max",
              "mainAxisAlignment": "center"
            }
          },
          {
            "type": "template",
            "isGS1": false,
            "label": "SCAN_BENEFICIARY",
            "format": "qrScanner",
            "onAction": [
              {
                "actionType": "OPEN_SCANNER",
                "properties": {
                  "isGS1": false,
                  "scanType": "qr",
                  "fieldName": "beneficiaryTag",
                  "onSuccess": [
                    {
                      "actionType": "SEARCH_EVENT",
                      "properties": {
                        "data": [
                          {
                            "key": "tag",
                            "value": "{{beneficiaryTag}}",
                            "operation": "equals"
                          }
                        ],
                        "name": "projectBeneficiary",
                        "type": "SEARCH_EVENT",
                        "awaitResults": true
                      }
                    }
                  ],
                  "scanLimit": 1,
                  "singleValue": true
                }
              }
            ],
            "fieldName": "qrScanner",
            "scanLimit": 1,
            "showLabel": false,
            "properties": {
              "icon": "QrCodeScanner",
              "size": "large",
              "type": "secondary",
              "mainAxisSize": "max",
              "mainAxisAlignment": "center"
            },
            "validations": [
              {
                "type": "scanLimit",
                "value": 1,
                "message": "SCANLIMIT_ERROR_MESSAGE"
              },
              {"type": "isGS1", "value": false}
            ],
            "scanLimit.message": "SCANLIMIT_ERROR_MESSAGE"
          }
        ],
        "header": [
          {
            "label": "BACK",
            "format": "backLink",
            "onAction": [
              {"actionType": "BACK_NAVIGATION", "properties": {}}
            ]
          }
        ],
        "heading": "REGISTRATION_SEARCH_BENEFICIARY_HEADING",
        "navigateTo": null,
        "screenType": "TEMPLATE",
        "description": "REGISTRATION_SEARCH_BENEFICIARY_DESC",
        "wrapperConfig": {
          "filters": [],
          "relations": [
            {
              "name": "members",
              "match": {
                "field": "householdClientReferenceId",
                "equalsFrom": "clientReferenceId"
              },
              "entity": "HouseholdMemberModel"
            },
            {
              "name": "headOfHousehold",
              "match": {
                "field": "householdClientReferenceId",
                "equalsFrom": "clientReferenceId"
              },
              "entity": "HouseholdMemberModel",
              "filters": [
                {"field": "isHeadOfHousehold", "equals": true}
              ]
            },
            {
              "name": "headIndividual",
              "match": {
                "field": "clientReferenceId",
                "equalsFrom": "headOfHousehold.individualClientReferenceId"
              },
              "entity": "IndividualModel"
            },
            {
              "name": "individuals",
              "match": {
                "field": "clientReferenceId",
                "inFrom": "members.individualClientReferenceId"
              },
              "entity": "IndividualModel"
            },
            {
              "name": "projectBeneficiaries",
              "match": {
                "field": "beneficiaryClientReferenceId",
                "equalsFrom": "individuals.clientReferenceId"
              },
              "entity": "ProjectBeneficiaryModel"
            },
            {
              "name": "tasks",
              "match": {
                "field": "projectBeneficiaryClientReferenceId",
                "inFrom": "projectBeneficiaries.clientReferenceId"
              },
              "entity": "TaskModel"
            },
            {
              "name": "sideEffects",
              "match": {
                "field": "clientReferenceId",
                "equalsFrom": "clientReferenceId"
              },
              "entity": "SideEffectModel"
            },
            {
              "name": "referrals",
              "match": {
                "field": "clientReferenceId",
                "equalsFrom": "clientReferenceId"
              },
              "entity": "ReferralModel"
            }
          ],
          "rootEntity": "HouseholdModel",
          "wrapperName": "HouseholdWrapper",
          "searchConfig": {
            "select": [
              "household",
              "individual",
              "householdMember",
              "projectBeneficiary",
              "task"
            ],
            "primary": "household",
            "pagination": {"limit": 5, "maxItems": 15}
          }
        },
        "submitCondition": null,
        "preventScreenCapture": false
      },
      {
        "name": "DELIVERY",
        "pages": [
          {
            "body": [
              {
                "fields": [
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_DELIVERYDETAILS_label_dateOfDelivery",
                    "order": 1,
                    "value": "",
                    "format": "date",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": true,
                    "fieldName": "dateOfRegistration",
                    "mandatory": true,
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
                    "label":
                        "APPONE_REGISTRATION_DELIVERYDETAILS_label_resource",
                    "order": 2,
                    "value": "",
                    "format": "custom",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "resourceCard",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "REGISTRATION_RESOURCE_CARD_SELECTION_REQUIRED"
                      }
                    ],
                    "errorMessage": "",
                    "includeInForm": true,
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "SP1", "name": "SP1"},
                      {"code": "SP2", "name": "SP2"},
                      {"code": "AQ1", "name": "AQ1"},
                      {"code": "AQ2", "name": "AQ2"}
                    ],
                    "includeInSummary": true,
                    "required.message":
                        "REGISTRATION_RESOURCE_CARD_SELECTION_REQUIRED"
                  },
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_deliveryComments",
                    "order": 3,
                    "value": "",
                    "format": "dropdown",
                    "hidden": false,
                    "isMdms": true,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "deliveryComment",
                    "mandatory": false,
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
                    "label":
                        "APPONE_REGISTRATION_DELIVERYDETAILS_label_scanner",
                    "order": 4,
                    "value": "",
                    "format": "scanner",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "scanner",
                    "mandatory": false,
                    "showLabel": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [],
                    "errorMessage": "",
                    "includeInForm": true,
                    "isMultiSelect": false,
                    "includeInSummary": true
                  }
                ]
              }
            ],
            "flow": "DELIVERY",
            "page": "DeliveryDetails",
            "type": "object",
            "label": "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_HEADING",
            "order": 1,
            "footer": [
              {
                "label":
                    "APPONE_REGISTRATION_DELIVERYDETAILS_ACTION_BUTTON_LABEL_1",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "name": "DeliveryChecklist",
                      "type": "template"
                    }
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "REGISTRATION",
            "heading": "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "data": [
                    {
                      "key": "ProjectBeneficiaryClientReferenceId",
                      "value":
                          "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                    },
                    {
                      "key": "cycleIndex",
                      "value": "{{contextData.navigation.cycleIndex}}"
                    },
                    {
                      "key": "doseIndex",
                      "value": "{{contextData.navigation.doseIndex}}"
                    }
                  ],
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "delivery"
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
                  "data": [
                    {
                      "key": "ProjectBeneficiaryClientReferenceId",
                      "value":
                          "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                    },
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{contextData.navigation.HouseholdClientReferenceId}}"
                    }
                  ],
                  "name": "deliverySuccess",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
            "navigateTo": {"name": "DeliveryChecklist", "type": "template"},
            "properties": [
              {
                "type": "string",
                "label":
                    "APPONE_REGISTRATION_DELIVERYDETAILS_label_dateOfDelivery",
                "order": 1,
                "value": "",
                "format": "date",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": true,
                "fieldName": "dateOfRegistration",
                "mandatory": true,
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "resourceCard",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message": "REGISTRATION_RESOURCE_CARD_SELECTION_REQUIRED"
                  }
                ],
                "errorMessage": "",
                "includeInForm": true,
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "SP1", "name": "SP1"},
                  {"code": "SP2", "name": "SP2"},
                  {"code": "AQ1", "name": "AQ1"},
                  {"code": "AQ2", "name": "AQ2"}
                ],
                "includeInSummary": true,
                "required.message":
                    "REGISTRATION_RESOURCE_CARD_SELECTION_REQUIRED"
              },
              {
                "type": "string",
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_deliveryComments",
                "order": 3,
                "value": "",
                "format": "dropdown",
                "hidden": false,
                "isMdms": true,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "deliveryComment",
                "mandatory": false,
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "scanner",
                "mandatory": false,
                "showLabel": false,
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
                "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_DESCRIPTION",
            "showTabView": false,
            "submitCondition": null,
            "preventScreenCapture": false
          },
          {
            "body": [
              {
                "fields": [
                  {
                    "type": "boolean",
                    "label":
                        "APPONE_DELIVERYFLOW_DELIVERYDETAIL_ACTIONS_GIVE_TABLET",
                    "order": 1,
                    "value": "",
                    "format": "checkbox",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "ACTION1",
                    "mandatory": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": true,
                    "validations": [],
                    "errorMessage": ""
                  },
                  {
                    "type": "boolean",
                    "label":
                        "APPONE_DELIVERYFLOW_DELIVERYDETAIL_ACTIONS_WRITE_CODE",
                    "order": 1,
                    "value": "",
                    "format": "checkbox",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "ACTION2",
                    "mandatory": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": true,
                    "validations": [],
                    "errorMessage": ""
                  },
                  {
                    "type": "boolean",
                    "label": "APPONE_DELIVERYFLOW_DELIVERYDETAIL_ACTIONS_SPAQ",
                    "order": 1,
                    "value": "",
                    "format": "checkbox",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "ACTION3",
                    "mandatory": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": true,
                    "validations": [],
                    "errorMessage": ""
                  }
                ]
              }
            ],
            "flow": "DELIVERY",
            "page": "DeliveryChecklist",
            "type": "object",
            "label":
                "APPONE_DELIVERYFLOW_DELIVERYDETAILS_ACTIONS_SCREEN_HEADING",
            "order": 2,
            "footer": [
              {
                "label":
                    "APPONE_DELIVERYFLOW_DELIVERYDETAILS_ACTIONS_SUBMIT_LABEL",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "name": "household-acknowledgement",
                      "type": "template"
                    }
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "REGISTRATION",
            "heading":
                "APPONE_DELIVERYFLOW_DELIVERYDETAILS_ACTIONS_SCREEN_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "data": [
                    {
                      "key": "ProjectBeneficiaryClientReferenceId",
                      "value":
                          "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                    },
                    {
                      "key": "cycleIndex",
                      "value": "{{contextData.navigation.cycleIndex}}"
                    },
                    {
                      "key": "doseIndex",
                      "value": "{{contextData.navigation.doseIndex}}"
                    }
                  ],
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "delivery"
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
                  "data": [
                    {
                      "key": "ProjectBeneficiaryClientReferenceId",
                      "value":
                          "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                    },
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{contextData.navigation.HouseholdClientReferenceId}}"
                    }
                  ],
                  "name": "deliverySuccess",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
            "navigateTo": {
              "name": "household-acknowledgement",
              "type": "template"
            },
            "properties": [
              {
                "type": "boolean",
                "label":
                    "APPONE_DELIVERYFLOW_DELIVERYDETAIL_ACTIONS_GIVE_TABLET",
                "order": 1,
                "value": "",
                "format": "checkbox",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "ACTION1",
                "mandatory": false,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": true,
                "validations": [],
                "errorMessage": ""
              },
              {
                "type": "boolean",
                "label":
                    "APPONE_DELIVERYFLOW_DELIVERYDETAIL_ACTIONS_WRITE_CODE",
                "order": 1,
                "value": "",
                "format": "checkbox",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "ACTION2",
                "mandatory": false,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": true,
                "validations": [],
                "errorMessage": ""
              },
              {
                "type": "boolean",
                "label": "APPONE_DELIVERYFLOW_DELIVERYDETAIL_ACTIONS_SPAQ",
                "order": 1,
                "value": "",
                "format": "checkbox",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "ACTION3",
                "mandatory": false,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": true,
                "validations": [],
                "errorMessage": ""
              }
            ],
            "actionLabel":
                "APPONE_DELIVERYFLOW_DELIVERYDETAILS_ACTIONS_SUBMIT_LABEL",
            "description":
                "APPONE_DELIVERYFLOW_DELIVERYDETAILS_ACTIONS_SCREEN_DESCRIPTION",
            "showTabView": false,
            "submitCondition": null,
            "preventScreenCapture": false,
            "conditionalNavigateTo": null
          }
        ],
        "project": "CMP-2026-01-14-010690",
        "summary": false,
        "version": 2,
        "disabled": false,
        "onAction": [
          {
            "actionType": "FETCH_TRANSFORMER_CONFIG",
            "properties": {
              "data": [
                {
                  "key": "ProjectBeneficiaryClientReferenceId",
                  "value":
                      "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                },
                {
                  "key": "cycleIndex",
                  "value": "{{contextData.navigation.cycleIndex}}"
                },
                {
                  "key": "doseIndex",
                  "value": "{{contextData.navigation.doseIndex}}"
                }
              ],
              "onError": [
                {
                  "actionType": "SHOW_TOAST",
                  "properties": {"message": "Failed to fetch config."}
                }
              ],
              "configName": "delivery"
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
              "data": [
                {
                  "key": "ProjectBeneficiaryClientReferenceId",
                  "value":
                      "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                },
                {
                  "key": "HouseholdClientReferenceId",
                  "value":
                      "{{contextData.navigation.HouseholdClientReferenceId}}"
                }
              ],
              "name": "deliverySuccess",
              "type": "TEMPLATE",
              "onError": [
                {
                  "actionType": "SHOW_TOAST",
                  "properties": {"message": "Navigation failed."}
                }
              ]
            }
          }
        ],
        "isSelected": true,
        "screenType": "FORM"
      },
      {
        "name": "CHECKLIST",
        "pages": [
          {
            "body": [
              {
                "fields": [
                  {
                    "type": "string",
                    "enums": [
                      {"code": "YES", "name": "QUESTION_1_YES"},
                      {"code": "NO", "name": "QUESTION_1_NO"}
                    ],
                    "label": "APPONE_ELIGIBILITYCHECKLIST_QUESTION_1_LABEL",
                    "order": 1,
                    "value": "",
                    "format": "radio",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "ec1",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": true,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_ELIGIBILITYCHECKLIST_QUESTION_1_LABEL_REQUIRED_MESSAGE"
                      }
                    ],
                    "errorMessage": "",
                    "includeInForm": true,
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "QUESTION_1_YES"},
                      {"code": "NO", "name": "QUESTION_1_NO"}
                    ],
                    "includeInSummary": true,
                    "required.message":
                        "APPONE_ELIGIBILITYCHECKLIST_QUESTION_1_LABEL_REQUIRED_MESSAGE"
                  },
                  {
                    "type": "string",
                    "enums": [
                      {"code": "YES", "name": "QUESTION_2_YES"},
                      {"code": "NO", "name": "QUESTION_2_NO"}
                    ],
                    "label": "APPONE_ELIGIBILITYCHECKLIST_QUESTION_2_LABEL",
                    "order": 2,
                    "value": "",
                    "format": "radio",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "ec2",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": true,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_ELIGIBILITYCHECKLIST_QUESTION_2_LABEL_REQUIRED_MESSAGE"
                      }
                    ],
                    "errorMessage": "",
                    "includeInForm": true,
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "QUESTION_2_YES"},
                      {"code": "NO", "name": "QUESTION_2_NO"}
                    ],
                    "includeInSummary": true,
                    "required.message":
                        "APPONE_ELIGIBILITYCHECKLIST_QUESTION_2_LABEL_REQUIRED_MESSAGE",
                    "visibilityCondition": {
                      "expression": [
                        {"condition": "eligibilityChecklist.ec1==YES"}
                      ]
                    }
                  },
                  {
                    "type": "string",
                    "enums": [
                      {"code": "YES", "name": "QUESTION_3_YES"},
                      {"code": "NO", "name": "QUESTION_3_NO"}
                    ],
                    "label": "APPONE_ELIGIBILITYCHECKLIST_QUESTION_3_LABEL",
                    "order": 3,
                    "value": "",
                    "format": "radio",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "ec3",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": true,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_ELIGIBILITYCHECKLIST_QUESTION_3_LABEL_REQUIRED_MESSAGE"
                      }
                    ],
                    "errorMessage": "",
                    "includeInForm": true,
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "QUESTION_3_YES"},
                      {"code": "NO", "name": "QUESTION_3_NO"}
                    ],
                    "includeInSummary": true,
                    "required.message":
                        "APPONE_ELIGIBILITYCHECKLIST_QUESTION_3_LABEL_REQUIRED_MESSAGE"
                  },
                  {
                    "type": "string",
                    "enums": [
                      {"code": "YES", "name": "QUESTION_4_YES"},
                      {"code": "NO", "name": "QUESTION_4_NO"}
                    ],
                    "label": "APPONE_ELIGIBILITYCHECKLIST_QUESTION_4_LABEL",
                    "order": 3,
                    "value": "",
                    "format": "radio",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "ec4",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": true,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_ELIGIBILITYCHECKLIST_QUESTION_4_LABEL_REQUIRED_MESSAGE"
                      }
                    ],
                    "errorMessage": "",
                    "includeInForm": true,
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "QUESTION_4_YES"},
                      {"code": "NO", "name": "QUESTION_4_NO"}
                    ],
                    "includeInSummary": true,
                    "required.message":
                        "APPONE_ELIGIBILITYCHECKLIST_QUESTION_4_LABEL_REQUIRED_MESSAGE"
                  }
                ]
              }
            ],
            "flow": "CHECKLIST",
            "page": "eligibilityChecklist",
            "type": "object",
            "label": "APPONE_ELIGIBILITY_CHECKLIST_SCREEN_HEADING",
            "order": 1,
            "footer": [
              {
                "label":
                    "APPONE_REGISTRATION_DELIVERYDETAILS_ACTION_BUTTON_LABEL_1",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "name": "household-acknowledgement",
                      "type": "template",
                    }
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "REGISTRATION",
            "heading": "APPONE_ELIGIBILITY_CHECKLIST_SCREEN_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actions": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "selectedIndividualClientReferenceId",
                          "value":
                              "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                        },
                        {
                          "key": "selectedIndividualName",
                          "value":
                              "{{contextData.navigation.selectedIndividualName}}"
                        },
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{ contextData.navigation.HouseholdClientReferenceId }}"
                        },
                        {
                          "key": "ProjectBeneficiaryClientReferenceId",
                          "value":
                              "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                        }
                      ],
                      "name": "beneficiaryDetails",
                      "type": "TEMPLATE",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Navigation failed."}
                        }
                      ]
                    }
                  }
                ],
                "condition": {
                  "expression":
                      "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==NO"
                }
              },
              {
                "actions": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "selectedIndividualClientReferenceId",
                          "value":
                              "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                        },
                        {
                          "key": "selectedIndividualName",
                          "value":
                              "{{contextData.navigation.selectedIndividualName}}"
                        },
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{ contextData.navigation.HouseholdClientReferenceId }}"
                        },
                        {
                          "key": "ProjectBeneficiaryClientReferenceId",
                          "value":
                              "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                        }
                      ],
                      "name": "REFER_BENEFICIARY",
                      "type": "FORM",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Navigation failed."}
                        }
                      ]
                    }
                  }
                ],
                "condition": {
                  "expression":
                      "eligibilityChecklist.ec1==YES && eligibilityChecklist.ec3==YES && eligibilityChecklist.ec4==YES"
                }
              },
              {
                "actions": [
                  {
                    "actionType": "FETCH_TRANSFORMER_CONFIG",
                    "properties": {
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {
                            "message": "Failed to fetch ineligible config."
                          }
                        }
                      ],
                      "configName": "ineligibleConfig"
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
                            "message": "Failed to create task records."
                          }
                        }
                      ]
                    }
                  },
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {"key": "reason", "value": "SP_CTX_TAKEN_RECENTLY"}
                      ],
                      "name": "householdOverview",
                      "type": "TEMPLATE",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {
                            "message": "Navigation to flow failed."
                          }
                        }
                      ]
                    }
                  }
                ],
                "condition": {
                  "expression":
                      "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==YES"
                }
              },
              {
                "actions": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "selectedIndividualClientReferenceId",
                          "value":
                              "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                        },
                        {
                          "key": "selectedIndividualName",
                          "value":
                              "{{contextData.navigation.selectedIndividualName}}"
                        },
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{ contextData.navigation.HouseholdClientReferenceId }}"
                        },
                        {
                          "key": "ProjectBeneficiaryClientReferenceId",
                          "value":
                              "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                        }
                      ],
                      "name": "REFER_BENEFICIARY",
                      "type": "FORM",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Navigation failed."}
                        }
                      ]
                    }
                  }
                ],
                "condition": {"expression": "DEFAULT"}
              }
            ],
            "navigateTo": {
              "name": "household-acknowledgement",
              "type": "template"
            },
            "properties": [
              {
                "type": "string",
                "enums": [
                  {"code": "YES", "name": "QUESTION_1_YES"},
                  {"code": "NO", "name": "QUESTION_1_NO"}
                ],
                "label": "APPONE_ELIGIBILITYCHECKLIST_QUESTION_1_LABEL",
                "order": 1,
                "value": "",
                "format": "radio",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "ec1",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": true,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_ELIGIBILITYCHECKLIST_QUESTION_1_LABEL_REQUIRED_MESSAGE"
                  }
                ],
                "errorMessage": "",
                "includeInForm": true,
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "QUESTION_1_YES"},
                  {"code": "NO", "name": "QUESTION_1_NO"}
                ],
                "includeInSummary": true,
                "required.message":
                    "APPONE_ELIGIBILITYCHECKLIST_QUESTION_1_LABEL_REQUIRED_MESSAGE"
              },
              {
                "type": "string",
                "enums": [
                  {"code": "YES", "name": "QUESTION_2_YES"},
                  {"code": "NO", "name": "QUESTION_2_NO"}
                ],
                "label": "APPONE_ELIGIBILITYCHECKLIST_QUESTION_2_LABEL",
                "order": 2,
                "value": "",
                "format": "radio",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "ec2",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": true,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_ELIGIBILITYCHECKLIST_QUESTION_2_LABEL_REQUIRED_MESSAGE"
                  }
                ],
                "errorMessage": "",
                "includeInForm": true,
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "QUESTION_2_YES"},
                  {"code": "NO", "name": "QUESTION_2_NO"}
                ],
                "includeInSummary": true,
                "required.message":
                    "APPONE_ELIGIBILITYCHECKLIST_QUESTION_2_LABEL_REQUIRED_MESSAGE",
                "visibilityCondition": {
                  "expression": [
                    {"condition": "eligibilityChecklist.ec1==YES"}
                  ]
                }
              },
              {
                "type": "string",
                "enums": [
                  {"code": "YES", "name": "QUESTION_3_YES"},
                  {"code": "NO", "name": "QUESTION_3_NO"}
                ],
                "label": "APPONE_ELIGIBILITYCHECKLIST_QUESTION_3_LABEL",
                "order": 3,
                "value": "",
                "format": "radio",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "ec3",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": true,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_ELIGIBILITYCHECKLIST_QUESTION_3_LABEL_REQUIRED_MESSAGE"
                  }
                ],
                "errorMessage": "",
                "includeInForm": true,
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "QUESTION_3_YES"},
                  {"code": "NO", "name": "QUESTION_3_NO"}
                ],
                "includeInSummary": true,
                "required.message":
                    "APPONE_ELIGIBILITYCHECKLIST_QUESTION_3_LABEL_REQUIRED_MESSAGE"
              },
              {
                "type": "string",
                "enums": [
                  {"code": "YES", "name": "QUESTION_4_YES"},
                  {"code": "NO", "name": "QUESTION_4_NO"}
                ],
                "label": "APPONE_ELIGIBILITYCHECKLIST_QUESTION_4_LABEL",
                "order": 3,
                "value": "",
                "format": "radio",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "ec4",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": true,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_ELIGIBILITYCHECKLIST_QUESTION_4_LABEL_REQUIRED_MESSAGE"
                  }
                ],
                "errorMessage": "",
                "includeInForm": true,
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "QUESTION_4_YES"},
                  {"code": "NO", "name": "QUESTION_4_NO"}
                ],
                "includeInSummary": true,
                "required.message":
                    "APPONE_ELIGIBILITYCHECKLIST_QUESTION_4_LABEL_REQUIRED_MESSAGE"
              }
            ],
            "actionLabel":
                "APPONE_REGISTRATION_DELIVERYDETAILS_ACTION_BUTTON_LABEL_1",
            "description": "APPONE_ELIGIBILITY_CHECKLIST_SCREEN_DESCRIPTION",
            "showTabView": false,
            "showAlertPopUp": {
              "title": "APPONE_ELIGIBILITYCHECKLIST_ALERT_TITLE",
              "conditions": [
                {
                  "value": "To Administer",
                  "expression":
                      "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==NO"
                },
                {
                  "value": "Ineligible flow",
                  "expression":
                      "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==YES"
                },
                {"value": "referral flow", "expression": "DEFAULT"}
              ],
              "description": "APPONE_ELIGIBILITYCHECKLIST_ALERT_DESCRIPTION",
              "primaryActionLabel": "ACTION_SUBMIT",
              "secondaryActionLabel": "ACTION_CANCEL"
            },
            "submitCondition": null,
            "preventScreenCapture": false
          }
        ],
        "project": "CMP-2026-01-14-010690",
        "summary": false,
        "version": 2,
        "disabled": false,
        "onAction": [
          {
            "actions": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "selectedIndividualClientReferenceId",
                      "value":
                          "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                    },
                    {
                      "key": "selectedIndividualName",
                      "value":
                          "{{contextData.navigation.selectedIndividualName}}"
                    },
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{ contextData.navigation.HouseholdClientReferenceId }}"
                    },
                    {
                      "key": "ProjectBeneficiaryClientReferenceId",
                      "value":
                          "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                    }
                  ],
                  "name": "beneficiaryDetails",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
            "condition": {
              "expression":
                  "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==NO"
            }
          },
          {
            "actions": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "selectedIndividualClientReferenceId",
                      "value":
                          "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                    },
                    {
                      "key": "selectedIndividualName",
                      "value":
                          "{{contextData.navigation.selectedIndividualName}}"
                    },
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{ contextData.navigation.HouseholdClientReferenceId }}"
                    },
                    {
                      "key": "ProjectBeneficiaryClientReferenceId",
                      "value":
                          "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                    }
                  ],
                  "name": "REFER_BENEFICIARY",
                  "type": "FORM",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
            "condition": {
              "expression":
                  "eligibilityChecklist.ec1==YES && eligibilityChecklist.ec3==YES && eligibilityChecklist.ec4==YES"
            }
          },
          {
            "actions": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {
                        "message": "Failed to fetch ineligible config."
                      }
                    }
                  ],
                  "configName": "ineligibleConfig"
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
                        "message": "Failed to create task records."
                      }
                    }
                  ]
                }
              },
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {"key": "reason", "value": "SP_CTX_TAKEN_RECENTLY"}
                  ],
                  "name": "householdOverview",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation to flow failed."}
                    }
                  ]
                }
              }
            ],
            "condition": {
              "expression":
                  "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==YES"
            }
          },
          {
            "actions": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "selectedIndividualClientReferenceId",
                      "value":
                          "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                    },
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{ contextData.navigation.HouseholdClientReferenceId }}"
                    },
                    {
                      "key": "ProjectBeneficiaryClientReferenceId",
                      "value":
                          "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                    },
                    //TODO ::

                    {
                      "key": "selectedIndividualName",
                      "value":
                          "{{contextData.navigation.selectedIndividualName}}"
                    },
                  ],
                  "name": "REFER_BENEFICIARY",
                  "type": "FORM",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
            "condition": {"expression": "DEFAULT"}
          }
        ],
        "isSelected": true,
        "screenType": "FORM"
      },
      {
        "name": "ADD_MEMBER",
        "pages": [
          {
            "body": [
              {
                "fields": [
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_addmember",
                    "order": 1,
                    "value": "",
                    "format": "text",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText_addmember",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "nameOfIndividual",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "lengthRange": {
                      "maxLength": "200",
                      "minLength": "2",
                      "errorMessage":
                          "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message_addmember"
                    },
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_mandatory_message_addmember"
                      },
                      {
                        "type": "minLength",
                        "value": "2",
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_min_message_addmember"
                      },
                      {
                        "type": "maxLength",
                        "value": "200",
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message_addmember"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "required.message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_mandatory_message_addmember"
                  },
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname",
                    "order": 1,
                    "value": "",
                    "format": "text",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "familyname",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname_mandatory_message_addmember"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "required.message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname_mandatory_message_addmember"
                  },
                  {
                    "type": "string",
                    "enums": [
                      {"code": "DEFAULT", "name": "DEFAULT"},
                      {
                        "code": "UNIQUE_BENEFICIARY_ID",
                        "name": "UNIQUE_BENEFICIARY_ID"
                      },
                      {"code": "OTHER", "name": "OTHER"}
                    ],
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers_addmember",
                    "order": 3,
                    "value": "",
                    "format": "idPopulator",
                    "hidden": false,
                    "isMdms": true,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "identifiers",
                    "mandatory": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "schemaCode": "HCM.ID_TYPE_OPTIONS_POPULATOR",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_idpopulator_mandatory_message_addmember"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "DEFAULT", "name": "DEFAULT"},
                      {
                        "code": "UNIQUE_BENEFICIARY_ID",
                        "name": "UNIQUE_BENEFICIARY_ID"
                      },
                      {"code": "OTHER", "name": "OTHER"}
                    ],
                    "required.message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_idpopulator_mandatory_message_addmember"
                  },
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_addmember",
                    "order": 4,
                    "value": "",
                    "format": "dob",
                    "hidden": false,
                    "isMdms": false,
                    "maxAge": 1800,
                    "minAge": 3,
                    "tooltip":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_tooltip_addmember",
                    "helpText":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_helpText_addmember",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "dobPicker",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_mandatory_message_addmember"
                      },
                      {
                        "type": "minAge",
                        "value": 3,
                        "message": "AGE_VALIDATION_ADDMEMBER"
                      },
                      {
                        "type": "maxAge",
                        "value": 1800,
                        "message": "AGE_VALIDATION_ADDMEMBER"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "maxAge.message": "AGE_VALIDATION_ADDMEMBER",
                    "minAge.message": "AGE_VALIDATION_ADDMEMBER",
                    "required.message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_mandatory_message_addmember"
                  },
                  {
                    "type": "string",
                    "enums": [
                      {"code": "MALE", "name": "MALE"},
                      {"code": "FEMALE", "name": "FEMALE"},
                      {"code": "OTHER", "name": "OTHER"}
                    ],
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_gender_addmember",
                    "order": 5,
                    "value": "",
                    "format": "select",
                    "hidden": false,
                    "isMdms": true,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "gender",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "schemaCode": "common-masters.GenderType",
                    "systemDate": false,
                    "validations": [],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "MALE", "name": "MALE"},
                      {"code": "FEMALE", "name": "FEMALE"},
                      {"code": "OTHER", "name": "OTHER"}
                    ]
                  },
                  {
                    "type": "integer",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_height_addmember",
                    "order": 6,
                    "value": "",
                    "format": "text",
                    "hidden": true,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "height",
                    "mandatory": false,
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
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_weight_addmember",
                    "order": 7,
                    "value": "",
                    "format": "text",
                    "hidden": true,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "weight",
                    "mandatory": false,
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
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_addmember",
                    "order": 8,
                    "value": "",
                    "format": "mobileNumber",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_tooltip_addmember",
                    "helpText":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_helpText_addmember",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "phone",
                    "mandatory": false,
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
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_scanner_addmember",
                    "order": 9,
                    "value": "",
                    "format": "scanner",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "scanner",
                    "mandatory": false,
                    "showLabel": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "includeInSummary": true
                  }
                ]
              }
            ],
            "flow": "ADD_MEMBER",
            "page": "beneficiaryDetails",
            "type": "object",
            "label":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING_addmember",
            "order": 4,
            "footer": [
              {
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_addmember",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "householdId",
                          "value": "{{formData.household.clientReferenceId}}"
                        }
                      ],
                      "name": "beneficiary-details",
                      "type": "template"
                    }
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "REGISTRATION",
            "heading":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING_addmember",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "data": [
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{contextData.navigation.HouseholdClientReferenceId}}"
                    }
                  ],
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "individualRegistration"
                }
              },
              {
                "actions": [
                  {
                    "actionType": "UPDATE_EVENT",
                    "properties": {"entity": "IndividualModel"}
                  }
                ],
                "condition": {"expression": "isEdit == true"}
              },
              {
                "actions": [
                  {
                    "actionType": "CREATE_EVENT",
                    "properties": {
                      "entity": "INDIVIDUAL, PROJECTBENEFICIARY, MEMBER"
                    }
                  }
                ],
                "condition": {"expression": "DEFAULT"}
              },
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "HouseholdClientReferenceId",
                      "value": "{{navigation.HouseholdClientReferenceId}}"
                    }
                  ],
                  "name": "householdOverview",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
            "navigateTo": {
              "data": [
                {
                  "key": "householdId",
                  "value": "{{formData.household.clientReferenceId}}"
                }
              ],
              "name": "beneficiary-details",
              "type": "template"
            },
            "properties": [
              {
                "type": "string",
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_addmember",
                "order": 1,
                "value": "",
                "format": "text",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText_addmember",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "nameOfIndividual",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "lengthRange": {
                  "maxLength": "200",
                  "minLength": "2",
                  "errorMessage":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message_addmember"
                },
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_mandatory_message_addmember"
                  },
                  {
                    "type": "minLength",
                    "value": "2",
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message_addmember"
                  },
                  {
                    "type": "maxLength",
                    "value": "200",
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message_addmember"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "required.message":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_mandatory_message_addmember"
              },
              {
                "type": "string",
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname",
                "order": 1,
                "value": "",
                "format": "text",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "familyname",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname_mandatory_message_addmember"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "required.message":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname_mandatory_message_addmember"
              },
              {
                "type": "string",
                "enums": [
                  {"code": "DEFAULT", "name": "DEFAULT"},
                  {
                    "code": "UNIQUE_BENEFICIARY_ID",
                    "name": "UNIQUE_BENEFICIARY_ID"
                  },
                  {"code": "OTHER", "name": "OTHER"}
                ],
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers_addmember",
                "order": 3,
                "value": "",
                "format": "idPopulator",
                "hidden": false,
                "isMdms": true,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "identifiers",
                "mandatory": false,
                "deleteFlag": false,
                "innerLabel": "",
                "schemaCode": "HCM.ID_TYPE_OPTIONS_POPULATOR",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_idpopulator_mandatory_message_addmember"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "DEFAULT", "name": "DEFAULT"},
                  {
                    "code": "UNIQUE_BENEFICIARY_ID",
                    "name": "UNIQUE_BENEFICIARY_ID"
                  },
                  {"code": "OTHER", "name": "OTHER"}
                ],
                "required.message":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_idpopulator_mandatory_message_addmember"
              },
              {
                "type": "string",
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_addmember",
                "order": 4,
                "value": "",
                "format": "dob",
                "hidden": false,
                "isMdms": false,
                "maxAge": 1800,
                "minAge": 3,
                "tooltip":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_tooltip_addmember",
                "helpText":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_helpText_addmember",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "dobPicker",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_mandatory_message_addmember"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "maxAge.message": "AGE_VALIDATION_ADDMEMBER",
                "minAge.message": "AGE_VALIDATION_ADDMEMBER",
                "required.message":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_mandatory_message_addmember"
              },
              {
                "type": "string",
                "enums": [
                  {"code": "MALE", "name": "MALE"},
                  {"code": "FEMALE", "name": "FEMALE"},
                  {"code": "OTHER", "name": "OTHER"}
                ],
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_gender_addmember",
                "order": 5,
                "value": "",
                "format": "select",
                "hidden": false,
                "isMdms": true,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "gender",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "schemaCode": "common-masters.GenderType",
                "systemDate": false,
                "validations": [],
                "errorMessage": "",
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "MALE", "name": "MALE"},
                  {"code": "FEMALE", "name": "FEMALE"},
                  {"code": "OTHER", "name": "OTHER"}
                ]
              },
              {
                "type": "integer",
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_height_addmember",
                "order": 6,
                "value": "",
                "format": "text",
                "hidden": true,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "height",
                "mandatory": false,
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
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_weight_addmember",
                "order": 7,
                "value": "",
                "format": "text",
                "hidden": true,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "weight",
                "mandatory": false,
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
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_addmember",
                "order": 8,
                "value": "",
                "format": "mobileNumber",
                "hidden": false,
                "isMdms": false,
                "tooltip":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_tooltip_addmember",
                "helpText":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_helpText_addmember",
                "infoText": "",
                "readOnly": false,
                "fieldName": "phone",
                "mandatory": false,
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
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_scanner_addmember",
                "order": 9,
                "value": "",
                "format": "scanner",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "scanner",
                "mandatory": false,
                "showLabel": false,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [],
                "errorMessage": "",
                "isMultiSelect": false,
                "includeInSummary": true
              }
            ],
            "actionLabel":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_addmember",
            "description":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_DESCRIPTION_addmember",
            "showTabView": false,
            "submitCondition": null,
            "preventScreenCapture": false,
            "conditionalNavigateTo": null
          }
        ],
        "project": "CMP-2026-01-14-010690",
        "summary": false,
        "version": 2,
        "disabled": false,
        "onAction": [
          {
            "actionType": "FETCH_TRANSFORMER_CONFIG",
            "properties": {
              "data": [
                {
                  "key": "HouseholdClientReferenceId",
                  "value":
                      "{{contextData.navigation.HouseholdClientReferenceId}}"
                }
              ],
              "onError": [
                {
                  "actionType": "SHOW_TOAST",
                  "properties": {"message": "Failed to fetch config."}
                }
              ],
              "configName": "individualRegistration"
            }
          },
          {
            "actions": [
              {
                "actionType": "UPDATE_EVENT",
                "properties": {"entity": "IndividualModel"}
              }
            ],
            "condition": {"expression": "isEdit == true"}
          },
          {
            "actions": [
              {
                "actionType": "CREATE_EVENT",
                "properties": {
                  "entity": "INDIVIDUAL, PROJECTBENEFICIARY, MEMBER"
                }
              }
            ],
            "condition": {"expression": "DEFAULT"}
          },
          {
            "actionType": "NAVIGATION",
            "properties": {
              "data": [
                {
                  "key": "HouseholdClientReferenceId",
                  "value": "{{navigation.HouseholdClientReferenceId}}"
                }
              ],
              "name": "householdOverview",
              "type": "TEMPLATE",
              "onError": [
                {
                  "actionType": "SHOW_TOAST",
                  "properties": {"message": "Navigation failed."}
                }
              ]
            }
          }
        ],
        "isSelected": true,
        "screenType": "FORM"
      },
      {
        "name": "REFER_BENEFICIARY",
        "pages": [
          {
            "body": [
              {
                "fields": [
                  {
                    "type": "string",
                    "label": "REFER_BENEFICIARY_LABEL_ADMINISTRATIVE_UNIT",
                    "order": 2,
                    "value": "",
                    "format": "locality",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": true,
                    "required": true,
                    "fieldName": "administrativeArea",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "REFER_BENEFICIARY_ADMINISTRATIVE_UNIT_REQUIRED"
                      }
                    ],
                    "errorMessage": "",
                    "required.message":
                        "REFER_BENEFICIARY_ADMINISTRATIVE_UNIT_REQUIRED"
                  },
                  {
                    "type": "dynamic",
                    "label": "REFER_BENEFICIARY_LABEL_REFERRED_TO",
                    "order": 4,
                    "value": "",
                    "format": "custom",
                    "hidden": false,
                    "isMdms": true,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "evaluationFacility",
                    "mandatory": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "schemaCode": "HCM.FACILITY_OPTIONS_POPULATOR",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "REFER_BENEFICIARY_ADMINISTRATIVE_UNIT_REQUIRED"
                      }
                    ],
                    "errorMessage": "",
                    "includeInForm": true,
                    "isMultiSelect": false,
                    "required.message":
                        "REFER_BENEFICIARY_ADMINISTRATIVE_UNIT_REQUIRED"
                  },
                  {
                    "type": "string",
                    "label": "REFER_BENEFICIARY_LABEL_REFERRED_BY",
                    "order": 3,
                    "value": "",
                    "format": "text",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": true,
                    "required": true,
                    "fieldName": "referredBy",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message": "REFER_BENEFICIARY_REFERRED_BY_REQUIRED"
                      }
                    ],
                    "errorMessage": "",
                    "required.message":
                        "REFER_BENEFICIARY_REFERRED_BY_REQUIRED",
                    "autoFillCondition": [
                      {
                        "value": "{{loggedInUserUuid}}",
                        "expression": "true==true"
                      }
                    ]
                  },
                  {
                    "enums": [
                      {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                      {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                      {"code": "FEVER", "name": "FEVER"},
                      {"code": "SICK", "name": "SICK"}
                    ],
                    "type": "string",
                    "label": "HFREFERRAL_REFERRAL_DETAILS_referralReason_LABEL",
                    "order": 5,
                    "value": "",
                    "format": "radio",
                    "hidden": false,
                    "isMdms": true,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "referralReason",
                    "mandatory": false,
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
                    "isMultiSelect": false,
                    "required.message":
                        "HFREFERRAL_REFERRAL_DETAILS_referralReason_REQUIRED_ERROR"
                  }
                ]
              }
            ],
            "flow": "REFER_BENEFICIARY",
            "page": "referBeneficiary",
            "type": "object",
            "label": "REFER_BENEFICIARY_SCREEN_HEADING",
            "order": 1,
            "footer": [
              {
                "label": "REFER_BENEFICIARY_SUBMIT_BUTTON",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {"name": "acknowledgement", "type": "screen"}
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "REGISTRATION",
            "heading": "REFER_BENEFICIARY_SCREEN_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "data": [
                    {
                      "key": "selectedIndividualClientReferenceId",
                      "value":
                          "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                    },
                    {
                      "key": "selectedIndividualName",
                      "value":
                          "{{contextData.navigation.selectedIndividualName}}"
                    },
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{ contextData.navigation.HouseholdClientReferenceId }}"
                    },
                    {
                      "key": "ProjectBeneficiaryClientReferenceId",
                      "value":
                          "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                    }
                  ],
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "referralBeneficaryCreate"
                }
              },
              {
                "actionType": "CREATE_EVENT",
                "properties": {
                  "data": [
                    {
                      "key": "selectedIndividualClientReferenceId",
                      "value":
                          "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                    },
                    {
                      "key": "selectedIndividualName",
                      "value":
                          "{{contextData.navigation.selectedIndividualName}}"
                    },
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{ contextData.navigation.HouseholdClientReferenceId }}"
                    },
                    {
                      "key": "ProjectBeneficiaryClientReferenceId",
                      "value":
                          "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                    }
                  ],
                  "entity": "REFERRAL",
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
                  "data": [
                    {
                      "key": "selectedIndividualClientReferenceId",
                      "value":
                          "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                    },
                    {
                      "key": "selectedIndividualName",
                      "value":
                          "{{contextData.navigation.selectedIndividualName}}"
                    },
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{ contextData.navigation.HouseholdClientReferenceId }}"
                    },
                    {
                      "key": "ProjectBeneficiaryClientReferenceId",
                      "value":
                          "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                    }
                  ],
                  "name": "referralSuccess",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
            "navigateTo": {"name": "acknowledgement", "type": "screen"},
            "properties": [
              {
                "type": "string",
                "label": "REFER_BENEFICIARY_LABEL_ADMINISTRATIVE_UNIT",
                "order": 2,
                "value": "",
                "format": "locality",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": true,
                "required": true,
                "fieldName": "administrativeArea",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message": "REFER_BENEFICIARY_ADMINISTRATIVE_UNIT_REQUIRED"
                  }
                ],
                "errorMessage": "",
                "required.message":
                    "REFER_BENEFICIARY_ADMINISTRATIVE_UNIT_REQUIRED"
              },
              {
                "type": "dynamic",
                "label": "REFER_BENEFICIARY_LABEL_REFERRED_TO",
                "order": 4,
                "value": "",
                "format": "custom",
                "hidden": false,
                "isMdms": true,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "evaluationFacility",
                "mandatory": false,
                "deleteFlag": false,
                "innerLabel": "",
                "schemaCode": "HCM.FACILITY_OPTIONS_POPULATOR",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message": "REFER_BENEFICIARY_ADMINISTRATIVE_UNIT_REQUIRED"
                  }
                ],
                "errorMessage": "",
                "includeInForm": true,
                "isMultiSelect": false,
                "required.message":
                    "REFER_BENEFICIARY_ADMINISTRATIVE_UNIT_REQUIRED"
              },
              {
                "type": "string",
                "label": "REFER_BENEFICIARY_LABEL_REFERRED_BY",
                "order": 3,
                "value": "",
                "format": "text",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": true,
                "required": true,
                "fieldName": "referredBy",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message": "REFER_BENEFICIARY_REFERRED_BY_REQUIRED"
                  }
                ],
                "errorMessage": "",
                "required.message": "REFER_BENEFICIARY_REFERRED_BY_REQUIRED",
                "autoFillCondition": [
                  {"value": "{{loggedInUserUuid}}", "expression": "true==true"}
                ]
              },
              {
                "enums": [
                  {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                  {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                  {"code": "FEVER", "name": "FEVER"},
                  {"code": "SICK", "name": "SICK"}
                ],
                "type": "string",
                "label": "HFREFERRAL_REFERRAL_DETAILS_referralReason_LABEL",
                "order": 5,
                "value": "",
                "format": "radio",
                "hidden": false,
                "isMdms": true,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "referralReason",
                "mandatory": false,
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
                "isMultiSelect": false,
                "required.message":
                    "HFREFERRAL_REFERRAL_DETAILS_referralReason_REQUIRED_ERROR"
              }
            ],
            "actionLabel": "REFER_BENEFICIARY_SUBMIT_BUTTON",
            "description": "REFER_BENEFICIARY_SCREEN_DESCRIPTION",
            "showTabView": false,
            "submitCondition": null,
            "preventScreenCapture": false,
            "conditionalNavigateTo": null
          }
        ],
        "project": "CMP-2026-01-14-010690",
        "summary": false,
        "version": 2,
        "disabled": false,
        "onAction": [
          {
            "actionType": "FETCH_TRANSFORMER_CONFIG",
            "properties": {
              "data": [
                {
                  "key": "selectedIndividualClientReferenceId",
                  "value":
                      "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                },
                {
                  "key": "HouseholdClientReferenceId",
                  "value":
                      "{{ contextData.navigation.HouseholdClientReferenceId }}"
                },
                {
                  "key": "ProjectBeneficiaryClientReferenceId",
                  "value":
                      "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                },
                //TODO:
                {
                  "key": "selectedIndividualName",
                  "value": "{{contextData.navigation.selectedIndividualName}}"
                },
              ],
              "onError": [
                {
                  "actionType": "SHOW_TOAST",
                  "properties": {"message": "Failed to fetch config."}
                }
              ],
              "configName": "referralBeneficaryCreate"
            }
          },
          {
            "actionType": "CREATE_EVENT",
            // TODOD::
            "properties": {
              "data": [
                {
                  "key": "selectedIndividualClientReferenceId",
                  "value":
                      "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                },
                {
                  "key": "HouseholdClientReferenceId",
                  "value":
                      "{{ contextData.navigation.HouseholdClientReferenceId }}"
                },
                {
                  "key": "ProjectBeneficiaryClientReferenceId",
                  "value":
                      "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                }
                //TODO:
                ,
                {
                  "key": "selectedIndividualName",
                  "value": "{{contextData.navigation.selectedIndividualName}}"
                },
              ],
              // TODO::testing
              "entity": "REFERRAL",
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
              "data": [
                {
                  "key": "selectedIndividualClientReferenceId",
                  "value":
                      "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                },
                {
                  "key": "HouseholdClientReferenceId",
                  "value":
                      "{{ contextData.navigation.HouseholdClientReferenceId }}"
                },
                {
                  "key": "ProjectBeneficiaryClientReferenceId",
                  "value":
                      "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
                }
              ],
              "name": "referralSuccess",
              "type": "TEMPLATE",
              "onError": [
                {
                  "actionType": "SHOW_TOAST",
                  "properties": {"message": "Navigation failed."}
                }
              ]
            }
          }
        ],
        "isSelected": true,
        "screenType": "FORM"
      },
      {
        "name": "HOUSEHOLD",
        "pages": [
          {
            "body": [
              {
                "fields": [
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_dateOfRegistration",
                    "order": 1,
                    "value": "",
                    "format": "date",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": true,
                    "required": true,
                    "fieldName": "dateOfRegistration",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": true,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_dateOfRegistration_mandatory_message"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "required.message":
                        "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_dateOfRegistration_mandatory_message"
                  },
                  {
                    "type": "integer",
                    "label":
                        "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_childrenCount",
                    "order": 2,
                    "value": "0",
                    "format": "numeric",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "childrenCount",
                    "mandatory": false,
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "pregnantWomenCount",
                    "mandatory": false,
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
                        "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount",
                    "order": 4,
                    "range": {
                      "max": "10",
                      "min": "1",
                      "errorMessage":
                          "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_max_message"
                    },
                    "value": "1",
                    "format": "numeric",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "memberCount",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_mandatory_message"
                      },
                      {
                        "type": "min",
                        "value": "1",
                        "message":
                            "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_min_message"
                      },
                      {
                        "type": "max",
                        "value": "10",
                        "message":
                            "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_max_message"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "required.message":
                        "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_mandatory_message"
                  }
                ]
              }
            ],
            "flow": "HOUSEHOLD",
            "page": "householdDetails",
            "type": "object",
            "label": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_HEADING",
            "order": 3,
            "footer": [
              {
                "label":
                    "APPONE_REGISTRATION_HOUSEHOLDDETAILS_ACTION_BUTTON_LABEL_1",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {"name": "beneficiaryDetails", "type": "form"}
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "REGISTRATION",
            "heading": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actions": [
                  {
                    "actionType": "FETCH_TRANSFORMER_CONFIG",
                    "properties": {
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Failed to fetch config."}
                        }
                      ],
                      "configName": "beneficiaryRegistration"
                    }
                  },
                  {
                    "actionType": "UPDATE_EVENT",
                    "properties": {
                      "entity": "HouseholdModel, TaskModel",
                      "modify": [
                        {"key": "TaskModel.status", "value": "NOT_ADMINISTERED"}
                      ],
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {
                            "message": "Failed to update closed household."
                          }
                        }
                      ]
                    }
                  },
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                        }
                      ],
                      "name": "householdOverview",
                      "type": "TEMPLATE",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Navigation failed."}
                        }
                      ]
                    }
                  }
                ],
                "condition": {
                  "expression": "isEdit==true && isClosedHousehold==true"
                }
              },
              {
                "actions": [
                  {
                    "actionType": "FETCH_TRANSFORMER_CONFIG",
                    "properties": {
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Failed to fetch config."}
                        }
                      ],
                      "configName": "beneficiaryRegistration"
                    }
                  },
                  {
                    "actionType": "UPDATE_EVENT",
                    "properties": {
                      "entity": "HouseholdModel",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {
                            "message": "Failed to update household."
                          }
                        }
                      ]
                    }
                  },
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                        }
                      ],
                      "name": "householdOverview",
                      "type": "TEMPLATE",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Navigation failed."}
                        }
                      ]
                    }
                  }
                ],
                "condition": {"expression": "isEdit==true"}
              },
              {
                "actions": [
                  {
                    "actionType": "FETCH_TRANSFORMER_CONFIG",
                    "properties": {
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Failed to fetch config."}
                        }
                      ],
                      "configName": "beneficiaryRegistration"
                    }
                  },
                  {
                    "actionType": "CREATE_EVENT",
                    "properties": {
                      "entity":
                          "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {
                            "message": "Failed to create household."
                          }
                        }
                      ]
                    }
                  },
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                        }
                      ],
                      "name": "householdOverview",
                      "type": "TEMPLATE",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Navigation failed."}
                        }
                      ]
                    }
                  }
                ],
                "condition": {"expression": "DEFAULT"}
              }
            ],
            "navigateTo": {"name": "beneficiaryDetails", "type": "form"},
            "properties": [
              {
                "type": "string",
                "label":
                    "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_dateOfRegistration",
                "order": 1,
                "value": "",
                "format": "date",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": true,
                "required": true,
                "fieldName": "dateOfRegistration",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": true,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_dateOfRegistration_mandatory_message"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "required.message":
                    "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_dateOfRegistration_mandatory_message"
              },
              {
                "type": "integer",
                "label":
                    "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_childrenCount",
                "order": 2,
                "value": "0",
                "format": "numeric",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "childrenCount",
                "mandatory": false,
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "pregnantWomenCount",
                "mandatory": false,
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
                    "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount",
                "order": 4,
                "range": {
                  "max": "10",
                  "min": "1",
                  "errorMessage":
                      "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_max_message"
                },
                "value": "1",
                "format": "numeric",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "memberCount",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_mandatory_message"
                  },
                  {
                    "type": "min",
                    "value": "1",
                    "message":
                        "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_max_message"
                  },
                  {
                    "type": "max",
                    "value": "10",
                    "message":
                        "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_max_message"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "required.message":
                    "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_mandatory_message"
              }
            ],
            "actionLabel":
                "APPONE_REGISTRATION_HOUSEHOLDDETAILS_ACTION_BUTTON_LABEL_1",
            "description":
                "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_DESCRIPTION",
            "showTabView": false,
            "submitCondition": {
              "expression": [
                {"condition": "isEdit == true"}
              ]
            },
            "preventScreenCapture": false
          },
          {
            "body": [
              {
                "fields": [
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_administrativeArea",
                    "order": 1,
                    "value": "",
                    "format": "locality",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_administrativeArea_helpText",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "administrativeArea",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_administrativeArea_mandatory_message"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "required.message":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_administrativeArea_mandatory_message"
                  },
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_latlong",
                    "order": 2,
                    "value": "",
                    "format": "latLng",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_latlong_helpText",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "latLng",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_latlong_mandatory_message"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "required.message":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_latlong_mandatory_message"
                  },
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine1",
                    "order": 3,
                    "value": "",
                    "format": "text",
                    "hidden": true,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine1_helpText",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "addressLine1",
                    "mandatory": false,
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
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine2",
                    "order": 4,
                    "value": "",
                    "format": "text",
                    "hidden": true,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine2_helpText",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "addressLine2",
                    "mandatory": false,
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
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_landmark",
                    "order": 5,
                    "value": "",
                    "format": "text",
                    "hidden": true,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_landmark_helpText",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "landmark",
                    "mandatory": false,
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
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_pincode",
                    "order": 6,
                    "value": "",
                    "format": "text",
                    "hidden": true,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_pincode_helpText",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "pincode",
                    "mandatory": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [],
                    "errorMessage": ""
                  },
                  {
                    "type": "string",
                    "enums": [
                      {
                        "code": "PERMANENT",
                        "name": "BENEFICIARYLOCATION_PERMANENT"
                      },
                      {
                        "code": "CORRESPONDENCE",
                        "name": "BENEFICIARYLOCATION_CORRESPONDENCE"
                      },
                      {"code": "OTHER", "name": "BENEFICIARYLOCATION_OTHER"}
                    ],
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_typeOfAddress",
                    "order": 7,
                    "value": "PERMANENT",
                    "format": "dropdown",
                    "hidden": true,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "typeOfAddress",
                    "mandatory": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [],
                    "errorMessage": "",
                    "includeInForm": true,
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {
                        "code": "PERMANENT",
                        "name": "BENEFICIARYLOCATION_PERMANENT"
                      },
                      {
                        "code": "CORRESPONDENCE",
                        "name": "BENEFICIARYLOCATION_CORRESPONDENCE"
                      },
                      {"code": "OTHER", "name": "BENEFICIARYLOCATION_OTHER"}
                    ],
                    "includeInSummary": false
                  }
                ]
              }
            ],
            "flow": "HOUSEHOLD",
            "page": "beneficiaryLocation",
            "type": "object",
            "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_HEADING",
            "order": 1,
            "footer": [
              {
                "label":
                    "APPONE_REGISTRATION_BENEFICIARY_LOCATION_ACTION_BUTTON_LABEL_1",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {"name": "householdDetails", "type": "form"}
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "REGISTRATION",
            "heading":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actions": [
                  {
                    "actionType": "FETCH_TRANSFORMER_CONFIG",
                    "properties": {
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Failed to fetch config."}
                        }
                      ],
                      "configName": "beneficiaryRegistration"
                    }
                  },
                  {
                    "actionType": "UPDATE_EVENT",
                    "properties": {
                      "entity": "HouseholdModel, TaskModel",
                      "modify": [
                        {"key": "TaskModel.status", "value": "NOT_ADMINISTERED"}
                      ],
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {
                            "message": "Failed to update closed household."
                          }
                        }
                      ]
                    }
                  },
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                        }
                      ],
                      "name": "householdOverview",
                      "type": "TEMPLATE",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Navigation failed."}
                        }
                      ]
                    }
                  }
                ],
                "condition": {
                  "expression": "isEdit==true && isClosedHousehold==true"
                }
              },
              {
                "actions": [
                  {
                    "actionType": "FETCH_TRANSFORMER_CONFIG",
                    "properties": {
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Failed to fetch config."}
                        }
                      ],
                      "configName": "beneficiaryRegistration"
                    }
                  },
                  {
                    "actionType": "UPDATE_EVENT",
                    "properties": {
                      "entity": "HouseholdModel",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {
                            "message": "Failed to update household."
                          }
                        }
                      ]
                    }
                  },
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                        }
                      ],
                      "name": "householdOverview",
                      "type": "TEMPLATE",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Navigation failed."}
                        }
                      ]
                    }
                  }
                ],
                "condition": {"expression": "isEdit==true"}
              },
              {
                "actions": [
                  {
                    "actionType": "FETCH_TRANSFORMER_CONFIG",
                    "properties": {
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Failed to fetch config."}
                        }
                      ],
                      "configName": "beneficiaryRegistration"
                    }
                  },
                  {
                    "actionType": "CREATE_EVENT",
                    "properties": {
                      "entity":
                          "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {
                            "message": "Failed to create household."
                          }
                        }
                      ]
                    }
                  },
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                        }
                      ],
                      "name": "householdOverview",
                      "type": "TEMPLATE",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Navigation failed."}
                        }
                      ]
                    }
                  }
                ],
                "condition": {"expression": "DEFAULT"}
              }
            ],
            "navigateTo": {"name": "householdDetails", "type": "form"},
            "properties": [
              {
                "type": "string",
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_administrativeArea",
                "order": 1,
                "value": "",
                "format": "locality",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_administrativeArea_helpText",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "administrativeArea",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_administrativeArea_mandatory_message"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "required.message":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_administrativeArea_mandatory_message"
              },
              {
                "type": "string",
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_latlong",
                "order": 2,
                "value": "",
                "format": "latLng",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_latlong_helpText",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "latLng",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_latlong_mandatory_message"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "required.message":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_latlong_mandatory_message"
              },
              {
                "type": "string",
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine1",
                "order": 3,
                "value": "",
                "format": "text",
                "hidden": true,
                "isMdms": false,
                "tooltip": "",
                "helpText":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine1_helpText",
                "infoText": "",
                "readOnly": false,
                "fieldName": "addressLine1",
                "mandatory": false,
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
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine2",
                "order": 4,
                "value": "",
                "format": "text",
                "hidden": true,
                "isMdms": false,
                "tooltip": "",
                "helpText":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine2_helpText",
                "infoText": "",
                "readOnly": false,
                "fieldName": "addressLine2",
                "mandatory": false,
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
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_landmark",
                "order": 5,
                "value": "",
                "format": "text",
                "hidden": true,
                "isMdms": false,
                "tooltip": "",
                "helpText":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_landmark_helpText",
                "infoText": "",
                "readOnly": false,
                "fieldName": "landmark",
                "mandatory": false,
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
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_pincode",
                "order": 6,
                "value": "",
                "format": "text",
                "hidden": true,
                "isMdms": false,
                "tooltip": "",
                "helpText":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_pincode_helpText",
                "infoText": "",
                "readOnly": false,
                "fieldName": "pincode",
                "mandatory": false,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [],
                "errorMessage": ""
              },
              {
                "type": "string",
                "enums": [
                  {
                    "code": "PERMANENT",
                    "name": "BENEFICIARYLOCATION_PERMANENT"
                  },
                  {
                    "code": "CORRESPONDENCE",
                    "name": "BENEFICIARYLOCATION_CORRESPONDENCE"
                  },
                  {"code": "OTHER", "name": "BENEFICIARYLOCATION_OTHER"}
                ],
                "label":
                    "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_typeOfAddress",
                "order": 7,
                "value": "PERMANENT",
                "format": "dropdown",
                "hidden": true,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "typeOfAddress",
                "mandatory": false,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [],
                "errorMessage": "",
                "includeInForm": true,
                "isMultiSelect": false,
                "dropDownOptions": [
                  {
                    "code": "PERMANENT",
                    "name": "BENEFICIARYLOCATION_PERMANENT"
                  },
                  {
                    "code": "CORRESPONDENCE",
                    "name": "BENEFICIARYLOCATION_CORRESPONDENCE"
                  },
                  {"code": "OTHER", "name": "BENEFICIARYLOCATION_OTHER"}
                ],
                "includeInSummary": false
              }
            ],
            "actionLabel":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_ACTION_BUTTON_LABEL_1",
            "description":
                "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_DESCRIPTION",
            "showTabView": false,
            "submitCondition": null,
            "preventScreenCapture": false
          },
          {
            "body": [
              {
                "fields": [
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual",
                    "order": 1,
                    "value": "",
                    "format": "text",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "nameOfIndividual",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "lengthRange": {
                      "maxLength": "200",
                      "minLength": "2",
                      "errorMessage":
                          "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message"
                    },
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_mandatory_message"
                      },
                      {
                        "type": "minLength",
                        "value": "2",
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_min_message"
                      },
                      {
                        "type": "maxLength",
                        "value": "200",
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "required.message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_mandatory_message"
                  },
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname",
                    "order": 1,
                    "value": "",
                    "format": "text",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "familyname",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname_mandatory_message"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "required.message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname_mandatory_message"
                  },
                  {
                    "type": "boolean",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_isHeadOfFamily",
                    "order": 2,
                    "value": "",
                    "format": "checkbox",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "isHeadOfFamily",
                    "mandatory": true,
                    "showLabel": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_isHeadOfFamily_mandatory_message"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "required.message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_isHeadOfFamily_mandatory_message"
                  },
                  {
                    // todo::
                    "enums": [
                      {"code": "DEFAULT", "name": "DEFAULT"},
                      {
                        "code": "UNIQUE_BENEFICIARY_ID",
                        "name": "UNIQUE_BENEFICIARY_ID"
                      },
                      {"code": "OTHER", "name": "OTHER"}
                    ],
                    "dropDownOptions": [
                      {"code": "DEFAULT", "name": "DEFAULT"},
                      {
                        "code": "UNIQUE_BENEFICIARY_ID",
                        "name": "UNIQUE_BENEFICIARY_ID"
                      },
                      {"code": "OTHER", "name": "OTHER"}
                    ],

                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers",
                    "order": 3,
                    "value": "",
                    "format": "idPopulator",
                    "hidden": false,
                    "isMdms": true,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "identifiers",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "schemaCode": "HCM.ID_TYPE_OPTIONS_POPULATOR",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_idpopulator_mandatory_message"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "required.message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_idpopulator_mandatory_message"
                  },
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker",
                    "order": 4,
                    "value": "",
                    "format": "dob",
                    "hidden": false,
                    "isMdms": false,
                    "maxAge": 1800,
                    "minAge": 3,
                    "tooltip":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_tooltip",
                    "helpText":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_helpText",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "dobPicker",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_mandatory_message"
                      },
                      {
                        "type": "minAge",
                        "value": 3,
                        "message": "AGE_VALIDATION"
                      },
                      {
                        "type": "maxAge",
                        "value": 1800,
                        "message": "AGE_VALIDATION"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "maxAge.message": "AGE_VALIDATION",
                    "minAge.message": "AGE_VALIDATION",
                    "required.message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_mandatory_message"
                  },
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_gender",
                    "order": 5,
                    "value": "",
                    "format": "select",
                    "hidden": false,
                    "isMdms": true,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "gender",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "schemaCode": "common-masters.GenderType",
                    "systemDate": false,
                    "validations": [],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "enums": [
                      {"code": "MALE", "name": "MALE"},
                      {"code": "FEMALE", "name": "FEMALE"},
                      {"code": "OTHER", "name": "OTHER"}
                    ]
                  },
                  {
                    "type": "integer",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_height",
                    "order": 6,
                    "value": "",
                    "format": "text",
                    "hidden": true,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "height",
                    "mandatory": false,
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
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_weight",
                    "order": 7,
                    "value": "",
                    "format": "text",
                    "hidden": true,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "weight",
                    "mandatory": false,
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
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone",
                    "order": 6,
                    "value": "",
                    "format": "mobileNumber",
                    "hidden": false,
                    "isMdms": false,
                    "pattern": "^\\d+",
                    "tooltip":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_tooltip",
                    "helpText":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_helpText",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "phone",
                    "mandatory": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "pattern",
                        "value": "^\\d+",
                        "message":
                            "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_regex"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "pattern.message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_regex"
                  },
                  {
                    "type": "string",
                    "label":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_scanner",
                    "order": 7,
                    "value": "",
                    "format": "scanner",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "scanner",
                    "mandatory": false,
                    "showLabel": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "includeInSummary": true
                  }
                ]
              }
            ],
            "flow": "HOUSEHOLD",
            "page": "beneficiaryDetails",
            "type": "object",
            "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING",
            "order": 4,
            "footer": [
              {
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_1",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "householdId",
                          "value": "{{formData.household.clientReferenceId}}"
                        }
                      ],
                      "name": "beneficiary-details",
                      "type": "template"
                    }
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "REGISTRATION",
            "heading": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actions": [
                  {
                    "actionType": "FETCH_TRANSFORMER_CONFIG",
                    "properties": {
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Failed to fetch config."}
                        }
                      ],
                      "configName": "beneficiaryRegistration"
                    }
                  },
                  {
                    "actionType": "UPDATE_EVENT",
                    "properties": {
                      "entity": "HouseholdModel, TaskModel",
                      "modify": [
                        {"key": "TaskModel.status", "value": "NOT_ADMINISTERED"}
                      ],
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {
                            "message": "Failed to update closed household."
                          }
                        }
                      ]
                    }
                  },
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                        }
                      ],
                      "name": "householdOverview",
                      "type": "TEMPLATE",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Navigation failed."}
                        }
                      ]
                    }
                  }
                ],
                "condition": {
                  "expression": "isEdit==true && isClosedHousehold==true"
                }
              },
              {
                "actions": [
                  {
                    "actionType": "FETCH_TRANSFORMER_CONFIG",
                    "properties": {
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Failed to fetch config."}
                        }
                      ],
                      "configName": "beneficiaryRegistration"
                    }
                  },
                  {
                    "actionType": "UPDATE_EVENT",
                    "properties": {
                      "entity": "HouseholdModel",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {
                            "message": "Failed to update household."
                          }
                        }
                      ]
                    }
                  },
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                        }
                      ],
                      "name": "householdOverview",
                      "type": "TEMPLATE",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Navigation failed."}
                        }
                      ]
                    }
                  }
                ],
                "condition": {"expression": "isEdit==true"}
              },
              {
                "actions": [
                  {
                    "actionType": "FETCH_TRANSFORMER_CONFIG",
                    "properties": {
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Failed to fetch config."}
                        }
                      ],
                      "configName": "beneficiaryRegistration"
                    }
                  },
                  {
                    "actionType": "CREATE_EVENT",
                    "properties": {
                      "entity":
                          "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {
                            "message": "Failed to create household."
                          }
                        }
                      ]
                    }
                  },
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "HouseholdClientReferenceId",
                          "value":
                              "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                        }
                      ],
                      "name": "householdOverview",
                      "type": "TEMPLATE",
                      "onError": [
                        {
                          "actionType": "SHOW_TOAST",
                          "properties": {"message": "Navigation failed."}
                        }
                      ]
                    }
                  }
                ],
                "condition": {"expression": "DEFAULT"}
              }
            ],
            "navigateTo": {
              "data": [
                {
                  "key": "householdId",
                  "value": "{{formData.household.clientReferenceId}}"
                }
              ],
              "name": "beneficiary-details",
              "type": "template"
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
                "isMdms": false,
                "tooltip": "",
                "helpText":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "nameOfIndividual",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "lengthRange": {
                  "maxLength": "200",
                  "minLength": "2",
                  "errorMessage":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message"
                },
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_mandatory_message"
                  },
                  {
                    "type": "minLength",
                    "value": "2",
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message"
                  },
                  {
                    "type": "maxLength",
                    "value": "200",
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "required.message":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_mandatory_message"
              },
              {
                "type": "string",
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname",
                "order": 1,
                "value": "",
                "format": "text",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "familyname",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname_mandatory_message"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "required.message":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname_mandatory_message"
              },
              {
                "type": "boolean",
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_isHeadOfFamily",
                "order": 2,
                "value": "",
                "format": "checkbox",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "isHeadOfFamily",
                "mandatory": true,
                "showLabel": false,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_isHeadOfFamily_mandatory_message"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "required.message":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_isHeadOfFamily_mandatory_message"
              },
              {
                "enums": [
                  {"code": "DEFAULT", "name": "DEFAULT"},
                  {
                    "code": "UNIQUE_BENEFICIARY_ID",
                    "name": "UNIQUE_BENEFICIARY_ID"
                  },
                  {"code": "OTHER", "name": "OTHER"}
                ],
                "dropDownOptions": [
                  {"code": "DEFAULT", "name": "DEFAULT"},
                  {
                    "code": "UNIQUE_BENEFICIARY_ID",
                    "name": "UNIQUE_BENEFICIARY_ID"
                  },
                  {"code": "OTHER", "name": "OTHER"}
                ],
                "type": "string",
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers",
                "order": 3,
                "value": "",
                "format": "idPopulator",
                "hidden": false,
                "isMdms": true,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "identifiers",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "schemaCode": "HCM.ID_TYPE_OPTIONS_POPULATOR",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_idpopulator_mandatory_message"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "required.message":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_idpopulator_mandatory_message"
              },
              {
                "type": "string",
                "label":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker",
                "order": 4,
                "value": "",
                "format": "dob",
                "hidden": false,
                "isMdms": false,
                "maxAge": 1800,
                "minAge": 3,
                "tooltip":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_tooltip",
                "helpText":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_helpText",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "dobPicker",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_mandatory_message"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "maxAge.message": "AGE_VALIDATION",
                "minAge.message": "AGE_VALIDATION",
                "required.message":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_mandatory_message"
              },
              {
                "type": "string",
                "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_gender",
                "order": 5,
                "value": "",
                "format": "select",
                "hidden": false,
                "isMdms": true,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "gender",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "schemaCode": "common-masters.GenderType",
                "systemDate": false,
                "validations": [],
                "errorMessage": "",
                "isMultiSelect": false,
                "enums": [
                  {"code": "MALE", "name": "MALE"},
                  {"code": "FEMALE", "name": "FEMALE"},
                  {"code": "OTHER", "name": "OTHER"}
                ]
              },
              {
                "type": "integer",
                "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_height",
                "order": 6,
                "value": "",
                "format": "text",
                "hidden": true,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "height",
                "mandatory": false,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [],
                "errorMessage": "",
                "isMultiSelect": false
              },
              {
                "type": "integer",
                "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_weight",
                "order": 7,
                "value": "",
                "format": "text",
                "hidden": true,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "weight",
                "mandatory": false,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [],
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
                "isMdms": false,
                "pattern": "^\\d+",
                "tooltip":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_tooltip",
                "helpText":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_helpText",
                "infoText": "",
                "readOnly": false,
                "fieldName": "phone",
                "mandatory": false,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [],
                "errorMessage": "",
                "isMultiSelect": false,
                "pattern.message":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_regex"
              },
              {
                "type": "string",
                "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_scanner",
                "order": 7,
                "value": "",
                "format": "scanner",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "scanner",
                "mandatory": false,
                "showLabel": false,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [],
                "errorMessage": "",
                "isMultiSelect": false,
                "includeInSummary": true
              }
            ],
            "actionLabel":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_1",
            "description":
                "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_DESCRIPTION",
            "showTabView": false,
            "submitCondition": null,
            "preventScreenCapture": false
          }
        ],
        "project": "CMP-2026-01-14-010690",
        "summary": false,
        "version": 2,
        "disabled": false,
        "onAction": [
          {
            "actions": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "beneficiaryRegistration"
                }
              },
              {
                "actionType": "UPDATE_EVENT",
                "properties": {
                  "entity": "HouseholdModel, TaskModel",
                  "modify": [
                    {"key": "TaskModel.status", "value": "NOT_ADMINISTERED"}
                  ],
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {
                        "message": "Failed to update closed household."
                      }
                    }
                  ]
                }
              },
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                    }
                  ],
                  "name": "householdOverview",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
            "condition": {"expression": "isEdit==true"}
          },
          {
            "actions": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "beneficiaryRegistration"
                }
              },
              {
                "actionType": "UPDATE_EVENT",
                "properties": {
                  "entity": "HouseholdModel",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to update household."}
                    }
                  ]
                }
              },
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                    }
                  ],
                  "name": "householdOverview",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
            "condition": {"expression": "isEdit==true"}
          },
          {
            "actions": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "beneficiaryRegistration"
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
                  "data": [
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                    }
                  ],
                  "name": "householdOverview",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
            "condition": {"expression": "DEFAULT"}
          }
        ],
        "isSelected": true,
        "screenType": "FORM"
      }
    ],
    "order": 1,
    "active": true,
    "project": "CMP-2026-01-14-010690",
    "version": 2,
    "disabled": false,
    "isSelected": true,
    "initialPage": "searchBeneficiary"
  }
};

final dynamic hfDD = {
  'data': {
    "name": "HFREFERRAL",
    "flows": [
      {
        "body": [
          {
            "type": "template",
            "format": "card",
            "children": [
              {
                "data": [
                  {
                    "key": "REFERRAL_INBOX_NAME",
                    "value": "{{0.HFReferralModel.name}}"
                  },
                  {
                    "key": "REFERRAL_INBOX_REFERRAL_SYMPTOM",
                    "value": "{{0.HFReferralModel.symptom}}"
                  }
                ],
                "type": "template",
                "format": "labelPairList",
                "fieldName": "labelList",
                "mandatory": true
              }
            ],
            "fieldName": "templateCard",
            "properties": {"type": "primary", "cardType": "primary"}
          }
        ],
        "name": "referralOverview",
        "order": 4,
        "footer": [
          {
            "type": "template",
            "label": "REFERRAL_OVERVIEW_PRIMARY_ACTION_LABEL",
            "format": "button",
            "onAction": [
              {
                "actionType": "CONDITIONAL_NAVIGATION",
                "properties": {
                  "conditions": [
                    {
                      "condition":
                          "0.HFReferralModel.additionalFields.fields.feverQ1==null&&0.HFReferralModel.symptom==FEVER",
                      "navigateTo": {
                        "name": "sideEffectFever",
                        "type": "FORM",
                        "flow": "REFERRAL_CREATE",
                        "data": [
                          {
                            "key": "clientReferenceId",
                            "value": "{{0.HFReferralModel.clientReferenceId}}"
                          },
                          {
                            "key": "referralSymptom",
                            "value": "{{0.HFReferralModel.symptom}}"
                          },
                          {"key": "isUpdate", "value": "true"}
                        ]
                      }
                    },
                    {
                      "condition":
                          "0.HFReferralModel.additionalFields.fields.sickQ1==null&&0.HFReferralModel.symptom==SICK",
                      "navigateTo": {
                        "name": "sideEffectSick",
                        "type": "FORM",
                        "flow": "REFERRAL_CREATE",
                        "data": [
                          {
                            "key": "clientReferenceId",
                            "value": "{{0.HFReferralModel.clientReferenceId}}"
                          },
                          {
                            "key": "referralSymptom",
                            "value": "{{0.HFReferralModel.symptom}}"
                          },
                          {"key": "isUpdate", "value": "true"}
                        ]
                      }
                    },
                    {
                      "condition":
                          "0.HFReferralModel.additionalFields.fields.ccQ1==null&&0.HFReferralModel.symptom==DRUG_SE_CC",
                      "navigateTo": {
                        "name": "sideEffectFromCurrentCycle",
                        "type": "FORM",
                        "flow": "REFERRAL_CREATE",
                        "data": [
                          {
                            "key": "clientReferenceId",
                            "value": "{{0.HFReferralModel.clientReferenceId}}"
                          },
                          {
                            "key": "referralSymptom",
                            "value": "{{0.HFReferralModel.symptom}}"
                          },
                          {"key": "isUpdate", "value": "true"}
                        ]
                      }
                    },
                    {
                      "condition":
                          "0.HFReferralModel.additionalFields.fields.pcQ1==null&&0.HFReferralModel.symptom==DRUG_SE_PC",
                      "navigateTo": {
                        "name": "sideEffectFromPreviousCycle",
                        "type": "FORM",
                        "flow": "REFERRAL_CREATE",
                        "data": [
                          {
                            "key": "clientReferenceId",
                            "value": "{{0.HFReferralModel.clientReferenceId}}"
                          },
                          {
                            "key": "referralSymptom",
                            "value": "{{0.HFReferralModel.symptom}}"
                          },
                          {"key": "isUpdate", "value": "true"}
                        ]
                      }
                    },
                    {
                      "default": true,
                      "navigateTo": {
                        "name": "referralInbox",
                        "type": "TEMPLATE",
                        "data": []
                      }
                    }
                  ]
                }
              }
            ],
            "fieldName": "backButton",
            "mandatory": true,
            "properties": {
              "size": "large",
              "type": "primary",
              "mainAxisSize": "max",
              "mainAxisAlignment": "center"
            }
          }
        ],
        "header": [
          {
            "type": "template",
            "label": "REFERRAL_OVERVIEW_BACK_BUTTON_LABEL",
            "format": "backLink",
            "onAction": [
              {
                "actionType": "BACK_NAVIGATION",
                "properties": {"name": "referralInbox", "type": "TEMPLATE"}
              }
            ],
            "fieldName": "backLink"
          }
        ],
        "heading": "REFERRAL_OVERVIEW_HEADING",
        "navigateTo": null,
        "screenType": "TEMPLATE",
        "description": "REFERRAL_OVERVIEW_DESCRIPTION",
        "initActions": [
          {
            "actionType": "SEARCH_EVENT",
            "properties": {
              "data": [
                {
                  "key": "clientReferenceId",
                  "value": "{{navigation.clientReferenceId}}",
                  "operation": "equals"
                }
              ],
              "name": "hFReferral",
              "type": "SEARCH_EVENT"
            }
          }
        ],
        "wrapperConfig": {
          "filters": [],
          "relations": [],
          "rootEntity": "HFReferralModel",
          "wrapperName": "hFReferral",
          "searchConfig": {
            "select": ["hFReferral"],
            "primary": "hFReferral"
          }
        },
        "submitCondition": null,
        "preventScreenCapture": false
      },
      {
        "body": [
          {
            "type": "template",
            "label": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_LABEL",
            "format": "panelCard",
            "heading": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_LABEL",
            "fieldName": "referralSuccess",
            "mandatory": true,
            "properties": {"type": "success"},
            "description": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_DESCRIPTION",
            "secondaryAction": {
              "type": "template",
              "label": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_ACTION_LABEL",
              "format": "button",
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {"name": "referralInbox", "type": "TEMPLATE"}
                }
              ],
              "fieldName": "back",
              "mandatory": true
            },
            "secondaryActionLabel":
                "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_ACTION_LABEL"
          }
        ],
        "name": "referralAcknowledgement",
        "order": 3,
        "footer": [],
        "header": [],
        "navigateTo": null,
        "screenType": "TEMPLATE",
        "submitCondition": null,
        "preventScreenCapture": false
      },
      {
        "body": [
          {
            "type": "template",
            "label": "REFERRAL_INBOX_SEARCHBAR_LABEL",
            "format": "searchBar",
            "onAction": [
              {
                "actionType": "SEARCH_EVENT",
                "properties": {
                  "data": [
                    {
                      "key": "name",
                      "value": "field.value",
                      "operation": "contains"
                    }
                  ],
                  "name": "hFReferral",
                  "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT"
                }
              }
            ],
            "fieldName": "searchBar",
            "mandatory": true
          },
          {
            "type": "template",
            "label": "REFERRAL_INBOX_INFO_CARD_HEADING",
            "format": "infoCard",
            "hidden": false,
            "fieldName": "matchNotFound",
            "description": "REFERRAL_INBOX_INFO_CARD_DESCRIPTION"
          },
          {
            "data": "hFReferral",
            "type": "template",
            "child": {
              "format": "card",
              "children": [
                {
                  "type": "template",
                  "format": "row",
                  "children": [
                    {
                      "type": "template",
                      "value": "{{ HFReferralModel.name }}",
                      "format": "textTemplate",
                      "fieldName": "referralName"
                    },
                    {
                      "type": "template",
                      "label": "Open",
                      "format": "button",
                      "onAction": [
                        {
                          "actionType": "NAVIGATION",
                          "properties": {
                            "data": [
                              {
                                "key": "clientReferenceId",
                                "value":
                                    "{{ HFReferralModel.clientReferenceId }}"
                              },
                              {
                                "key": "referralSymptom",
                                "value": "{{ HFReferralModel.symptom }}"
                              }
                            ],
                            "name": "referralOverview",
                            "type": "TEMPLATE"
                          }
                        }
                      ],
                      "fieldName": "openButton",
                      "properties": {"size": "medium", "type": "secondary"}
                    }
                  ],
                  "fieldName": "rowtemplate",
                  "properties": {
                    "mainAxisSize": "max",
                    "mainAxisAlignment": "spaceBetween"
                  }
                },
                {
                  "value":
                      "HF_REFERRAL_INBOX_DATE_OF_EVALUATION {{ fn:formatDate(HFReferralModel.additionalFields.fields.dateOfEvaluation, 'date', dd MMM yyyy) }}",
                  "format": "textTemplate",
                  "fieldName": "textTemplatetext"
                }
              ],
              "fieldName": "templateCard"
            },
            "format": "listView",
            "hidden": false,
            "fieldName": "listView"
          }
        ],
        "name": "referralInbox",
        "order": 1,
        "footer": [
          {
            "type": "template",
            "label": "REFERRAL_INBOX_PRIMARY_ACTION_LABEL",
            "format": "button",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [],
                  "name": "REFERRAL_CREATE",
                  "type": "FORM"
                }
              }
            ],
            "fieldName": "createReferral",
            "mandatory": true,
            "properties": {
              "size": "large",
              "type": "primary",
              "mainAxisSize": "max",
              "mainAxisAlignment": "center"
            }
          }
        ],
        "header": [
          {
            "type": "template",
            "label": "REFERRAL_INBOX_BACK_BUTTON_LABEL",
            "format": "backLink",
            "onAction": [
              {
                "actionType": "BACK_NAVIGATION",
                "properties": {"name": "HOME", "type": "HOME"}
              }
            ],
            "fieldName": "backLinkNavigation"
          }
        ],
        "heading": "REFERRAL_INBOX_HEADING",
        "navigateTo": null,
        "screenType": "TEMPLATE",
        "description": "REFERRAL_INBOX_DESCRIPTION",
        "initActions": [],
        "wrapperConfig": {
          "filters": [],
          "relations": [],
          "rootEntity": "HFReferralModel",
          "wrapperName": "hFReferral",
          "searchConfig": {
            "select": ["hFReferral"],
            "primary": "hFReferral"
          }
        },
        "submitCondition": null,
        "preventScreenCapture": false
      },
      {
        "name": "REFERRAL_CREATE",
        "pages": [
          {
            "body": [
              {
                "fields": [
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "sickQ1",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "SICKQ1_YES"},
                      {"code": "NO", "name": "SICKQ1_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ1_REQUIRED_ERROR"
                  },
                  {
                    "type": "string",
                    "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_LABEL",
                    "order": 2,
                    "value": "",
                    "format": "text",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "sickQ4",
                    "mandatory": false,
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
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_REQUIRED_ERROR",
                    "visibilityCondition": {
                      "expression": [
                        {"condition": "sideEffectSick.sickQ1==YES"}
                      ]
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "sickQ2",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "SICKQ2_YES"},
                      {"code": "NO", "name": "SICKQ2_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ2_REQUIRED_ERROR"
                  },
                  {
                    "type": "string",
                    "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_LABEL",
                    "order": 4,
                    "value": "",
                    "format": "text",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "sickQ5",
                    "mandatory": true,
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
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_REQUIRED_ERROR",
                    "visibilityCondition": {
                      "expression": [
                        {"condition": "sideEffectSick.sickQ2==YES"}
                      ]
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "sickQ3",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "SICKQ3_YES"},
                      {"code": "NO", "name": "SICKQ3_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ3_REQUIRED_ERROR"
                  }
                ]
              }
            ],
            "flow": "REFERRAL_CREATE",
            "page": "sideEffectSick",
            "type": "object",
            "label": "HFREFERRAL_SIDEEFFECTFROMSICK_HEADING",
            "order": 4.4,
            "footer": [
              {
                "label": "HFREFERRAL_SIDEEFFECTFROMSICK_ACTION_LABEL",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "name": "ReferralReconAcknowledgement",
                      "type": "template"
                    }
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "HFREFERRAL",
            "heading": "HFREFERRAL_SIDEEFFECTFROMSICK_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "referralCreation"
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
                  "data": [],
                  "name": "referralAcknowledgement",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "sickQ1",
                "mandatory": true,
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
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "SICKQ1_YES"},
                  {"code": "NO", "name": "SICKQ1_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ1_REQUIRED_ERROR"
              },
              {
                "type": "string",
                "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_LABEL",
                "order": 2,
                "value": "",
                "format": "text",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "sickQ4",
                "mandatory": false,
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
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_REQUIRED_ERROR",
                "visibilityCondition": {
                  "expression": [
                    {"condition": "sideEffectSick.sickQ1==YES"}
                  ]
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "sickQ2",
                "mandatory": true,
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
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "SICKQ2_YES"},
                  {"code": "NO", "name": "SICKQ2_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ2_REQUIRED_ERROR"
              },
              {
                "type": "string",
                "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_LABEL",
                "order": 4,
                "value": "",
                "format": "text",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "sickQ5",
                "mandatory": true,
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
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_REQUIRED_ERROR",
                "visibilityCondition": {
                  "expression": [
                    {"condition": "sideEffectSick.sickQ2==YES"}
                  ]
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "sickQ3",
                "mandatory": true,
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
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "SICKQ3_YES"},
                  {"code": "NO", "name": "SICKQ3_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ3_REQUIRED_ERROR"
              }
            ],
            "actionLabel": "HFREFERRAL_SIDEEFFECTFROMSICK_ACTION_LABEL",
            "description": "HFREFERRAL_SIDEEFFECTFROMSICK_DESCRIPTION",
            "showTabView": false,
            "submitCondition": null,
            "preventScreenCapture": false,
            "conditionalNavigateTo": null
          },
          {
            "body": [
              {
                "fields": [
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "sideEffectPQ1",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "SIDE_EFFECT_PREQ1_YES"},
                      {"code": "NO", "name": "SIDE_EFFECT_PREQ1_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ1_REQUIRED_ERROR"
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "sideEffectPQ2",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "SIDE_EFFECT_PREQ2_YES"},
                      {"code": "NO", "name": "SIDE_EFFECT_PREQ2_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ2_REQUIRED_ERROR"
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "sideEffectPQ3",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "SIDE_EFFECT_PREQ3_YES"},
                      {"code": "NO", "name": "SIDE_EFFECT_PREQ3_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ3_REQUIRED_ERROR"
                  }
                ]
              }
            ],
            "flow": "REFERRAL_CREATE",
            "page": "sideEffectFromPreviousCycle",
            "type": "object",
            "label": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_HEADING",
            "order": 4.2,
            "footer": [
              {
                "label": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_ACTION_LABEL",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "name": "ReferralReconAcknowledgement",
                      "type": "template"
                    }
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "HFREFERRAL",
            "heading": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "referralCreation"
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
                  "data": [],
                  "name": "referralAcknowledgement",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "sideEffectPQ1",
                "mandatory": true,
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
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "SIDE_EFFECT_PREQ1_YES"},
                  {"code": "NO", "name": "SIDE_EFFECT_PREQ1_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ1_REQUIRED_ERROR"
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "sideEffectPQ2",
                "mandatory": true,
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
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "SIDE_EFFECT_PREQ2_YES"},
                  {"code": "NO", "name": "SIDE_EFFECT_PREQ2_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ2_REQUIRED_ERROR"
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "sideEffectPQ3",
                "mandatory": true,
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
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "SIDE_EFFECT_PREQ3_YES"},
                  {"code": "NO", "name": "SIDE_EFFECT_PREQ3_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ3_REQUIRED_ERROR"
              }
            ],
            "actionLabel":
                "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_ACTION_LABEL",
            "description": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_DESCRIPTION",
            "showTabView": false,
            "submitCondition": null,
            "preventScreenCapture": false
          },
          {
            "body": [
              {
                "fields": [
                  {
                    "type": "string",
                    "label": "HFREFERRAL_REFERRAL_DETAILS_referralCycle_LABEL",
                    "order": 1,
                    "value": "",
                    "format": "custom",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "referralCycle",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "HFREFERRAL_REFERRAL_DETAILS_referralCycle_REQUIRED_ERROR"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "required.message":
                        "HFREFERRAL_REFERRAL_DETAILS_referralCycle_REQUIRED_ERROR"
                  },
                  {
                    "type": "string",
                    "label": "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_LABEL",
                    "order": 2,
                    "value": "",
                    "format": "text",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "nameOfChild",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "required.message":
                        "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_REQUIRED_ERROR"
                  },
                  {
                    "type": "string",
                    "label": "HFREFERRAL_REFERRAL_DETAILS_beneficiaryId_LABEL",
                    "order": 3,
                    "value": "",
                    "format": "text",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "beneficiaryId",
                    "mandatory": false,
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "referralCode",
                    "mandatory": false,
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "ageInMonths",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "required.message":
                        "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_REQUIRED_ERROR"
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
                    "isMdms": true,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "gender",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "schemaCode": "common-masters.GenderType",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "HFREFERRAL_REFERRAL_DETAILS_gender_REQUIRED_ERROR"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "OTHER", "name": "OTHER"},
                      {"code": "FEMALE", "name": "FEMALE"},
                      {"code": "MALE", "name": "MALE"}
                    ],
                    "required.message":
                        "HFREFERRAL_REFERRAL_DETAILS_gender_REQUIRED_ERROR"
                  },
                  {
                    "enums": [
                      {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                      {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                      {"code": "FEVER", "name": "FEVER"},
                      {"code": "SICK", "name": "SICK"}
                    ],
                    "dropDownOptions": [
                      {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                      {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                      {"code": "FEVER", "name": "FEVER"},
                      {"code": "SICK", "name": "SICK"}
                    ],
                    "type": "string",
                    "label": "HFREFERRAL_REFERRAL_DETAILS_referralReason_LABEL",
                    "order": 7,
                    "value": "",
                    "format": "radio",
                    "hidden": false,
                    "isMdms": true,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "referralReason",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "required.message":
                        "HFREFERRAL_REFERRAL_DETAILS_referralReason_REQUIRED_ERROR"
                  }
                ]
              }
            ],
            "flow": "REFERRAL_CREATE",
            "page": "referralDetails",
            "type": "object",
            "label": "HFREFERRAL_REFERRAL_DETAILS_HEADING",
            "order": 3,
            "footer": [
              {
                "label": "HFREFERRAL_REFERRAL_DETAILS_ACTION_LABEL",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "name": "ReferralReconAcknowledgement",
                      "type": "template"
                    }
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "HFREFERRAL",
            "heading": "HFREFERRAL_REFERRAL_DETAILS_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "referralCreation"
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
                  "data": [],
                  "name": "referralAcknowledgement",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "referralCycle",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "HFREFERRAL_REFERRAL_DETAILS_referralCycle_REQUIRED_ERROR"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "required.message":
                    "HFREFERRAL_REFERRAL_DETAILS_referralCycle_REQUIRED_ERROR"
              },
              {
                "type": "string",
                "label": "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_LABEL",
                "order": 2,
                "value": "",
                "format": "text",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "nameOfChild",
                "mandatory": true,
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
                "isMultiSelect": false,
                "required.message":
                    "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_REQUIRED_ERROR"
              },
              {
                "type": "string",
                "label": "HFREFERRAL_REFERRAL_DETAILS_beneficiaryId_LABEL",
                "order": 3,
                "value": "",
                "format": "text",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "beneficiaryId",
                "mandatory": false,
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "referralCode",
                "mandatory": false,
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "ageInMonths",
                "mandatory": true,
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
                "isMultiSelect": false,
                "required.message":
                    "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_REQUIRED_ERROR"
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
                "isMdms": true,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "gender",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "schemaCode": "common-masters.GenderType",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "HFREFERRAL_REFERRAL_DETAILS_gender_REQUIRED_ERROR"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "OTHER", "name": "OTHER"},
                  {"code": "FEMALE", "name": "FEMALE"},
                  {"code": "MALE", "name": "MALE"}
                ],
                "required.message":
                    "HFREFERRAL_REFERRAL_DETAILS_gender_REQUIRED_ERROR"
              },
              {
                "enums": [
                  {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                  {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                  {"code": "FEVER", "name": "FEVER"},
                  {"code": "SICK", "name": "SICK"}
                ],
                "dropDownOptions": [
                  {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                  {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                  {"code": "FEVER", "name": "FEVER"},
                  {"code": "SICK", "name": "SICK"}
                ],
                "type": "string",
                "label": "HFREFERRAL_REFERRAL_DETAILS_referralReason_LABEL",
                "order": 7,
                "value": "",
                "format": "radio",
                "hidden": false,
                "isMdms": true,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "referralReason",
                "mandatory": true,
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
                "isMultiSelect": false,
                "required.message":
                    "HFREFERRAL_REFERRAL_DETAILS_referralReason_REQUIRED_ERROR"
              }
            ],
            "actionLabel": "HFREFERRAL_REFERRAL_DETAILS_ACTION_LABEL",
            "description": "HFREFERRAL_REFERRAL_DETAILS_DESCRIPTION",
            "showTabView": false,
            "submitCondition": null,
            "preventScreenCapture": false,
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
            "body": [
              {
                "fields": [
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "feverQ1",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "FEVERQ1_YES"},
                      {"code": "NO", "name": "FEVERQ1_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ1_REQUIRED_ERROR"
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "feverQ2",
                    "mandatory": true,
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
                    "dropDownOptions": [
                      {"code": "POSITIVE", "name": "FEVERQ2_POSITIVE"},
                      {"code": "NEGATIVE", "name": "FEVERQ2_NEGATIVE"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ2_REQUIRED_ERROR",
                    "visibilityCondition": {
                      "expression": [
                        {"condition": "sideEffectFever.feverQ1==YES"}
                      ]
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "feverQ3",
                    "mandatory": true,
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
                    "dropDownOptions": [
                      {"code": "YES", "name": "FEVERQ3_YES"},
                      {"code": "NO", "name": "FEVERQ2_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ3_REQUIRED_ERROR",
                    "visibilityCondition": {
                      "expression": [
                        {"condition": "sideEffectFever.feverQ2==NEGATIVE"}
                      ]
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "feverQ4",
                    "mandatory": true,
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
                    "dropDownOptions": [
                      {"code": "YES", "name": "FEVERQ4_YES"},
                      {"code": "NO", "name": "FEVERQ4_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ4_REQUIRED_ERROR",
                    "visibilityCondition": {
                      "expression": [
                        {"condition": "sideEffectFever.feverQ2==POSITIVE"}
                      ]
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "feverQ5",
                    "mandatory": true,
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
                    "dropDownOptions": [
                      {"code": "YES", "name": "FEVERQ5_YES"},
                      {"code": "NO", "name": "FEVERQ5_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ5_REQUIRED_ERROR",
                    "visibilityCondition": {
                      "expression": [
                        {"condition": "sideEffectFever.feverQ2==POSITIVE"}
                      ]
                    }
                  },
                  {
                    "type": "string",
                    "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_LABEL",
                    "order": 6,
                    "value": "",
                    "format": "text",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "feverQ6",
                    "mandatory": false,
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
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_REQUIRED_ERROR",
                    "visibilityCondition": {
                      "expression": [
                        {"condition": "sideEffectFever.feverQ5==YES"}
                      ]
                    }
                  }
                ]
              }
            ],
            "flow": "REFERRAL_CREATE",
            "page": "sideEffectFever",
            "type": "object",
            "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_HEADING",
            "order": 4.3,
            "footer": [
              {
                "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_ACTION_LABEL",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "name": "ReferralReconAcknowledgement",
                      "type": "template"
                    }
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "HFREFERRAL",
            "heading": "HFREFERRAL_SIDEEFFECTFROMFEVER_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "referralCreation"
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
                  "data": [],
                  "name": "referralAcknowledgement",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "feverQ1",
                "mandatory": true,
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
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "FEVERQ1_YES"},
                  {"code": "NO", "name": "FEVERQ1_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ1_REQUIRED_ERROR"
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "feverQ2",
                "mandatory": true,
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
                "dropDownOptions": [
                  {"code": "POSITIVE", "name": "FEVERQ2_POSITIVE"},
                  {"code": "NEGATIVE", "name": "FEVERQ2_NEGATIVE"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ2_REQUIRED_ERROR",
                "visibilityCondition": {
                  "expression": [
                    {"condition": "sideEffectFever.feverQ1==YES"}
                  ]
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "feverQ3",
                "mandatory": true,
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
                "dropDownOptions": [
                  {"code": "YES", "name": "FEVERQ3_YES"},
                  {"code": "NO", "name": "FEVERQ2_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ3_REQUIRED_ERROR",
                "visibilityCondition": {
                  "expression": [
                    {"condition": "sideEffectFever.feverQ2==NEGATIVE"}
                  ]
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "feverQ4",
                "mandatory": true,
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
                "dropDownOptions": [
                  {"code": "YES", "name": "FEVERQ4_YES"},
                  {"code": "NO", "name": "FEVERQ4_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ4_REQUIRED_ERROR",
                "visibilityCondition": {
                  "expression": [
                    {"condition": "sideEffectFever.feverQ2==POSITIVE"}
                  ]
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "feverQ5",
                "mandatory": true,
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
                "dropDownOptions": [
                  {"code": "YES", "name": "FEVERQ5_YES"},
                  {"code": "NO", "name": "FEVERQ5_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ5_REQUIRED_ERROR",
                "visibilityCondition": {
                  "expression": [
                    {"condition": "sideEffectFever.feverQ2==POSITIVE"}
                  ]
                }
              },
              {
                "type": "string",
                "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_LABEL",
                "order": 6,
                "value": "",
                "format": "text",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "feverQ6",
                "mandatory": false,
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
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_REQUIRED_ERROR",
                "visibilityCondition": {
                  "expression": [
                    {"condition": "sideEffectFever.feverQ5==YES"}
                  ]
                }
              }
            ],
            "actionLabel": "HFREFERRAL_SIDEEFFECTFROMFEVER_ACTION_LABEL",
            "description": "HFREFERRAL_SIDEEFFECTFROMFEVER_DESCRIPTION",
            "showTabView": false,
            "submitCondition": null,
            "preventScreenCapture": false
          },
          {
            "body": [
              {
                "fields": [
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "sideEffectQ1",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "SIDE_EFFECTQ1_YES"},
                      {"code": "NO", "name": "SIDE_EFFECTQ1_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ1_REQUIRED_ERROR"
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "sideEffectQ2",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "SIDE_EFFECTQ2_YES"},
                      {"code": "NO", "name": "SIDE_EFFECTQ2_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ2_REQUIRED_ERROR"
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
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "sideEffectQ3",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "dropDownOptions": [
                      {"code": "YES", "name": "SIDE_EFFECTQ3_YES"},
                      {"code": "NO", "name": "SIDE_EFFECTQ3_NO"}
                    ],
                    "required.message":
                        "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ3_REQUIRED_ERROR"
                  }
                ]
              }
            ],
            "flow": "REFERRAL_CREATE",
            "page": "sideEffectFromCurrentCycle",
            "type": "object",
            "label": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_HEADING",
            "order": 4.1,
            "footer": [
              {
                "label": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_ACTION_LABEL",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "name": "ReferralReconAcknowledgement",
                      "type": "template"
                    }
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "HFREFERRAL",
            "heading": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "referralCreation"
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
                  "data": [],
                  "name": "referralAcknowledgement",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "sideEffectQ1",
                "mandatory": true,
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
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "SIDE_EFFECTQ1_YES"},
                  {"code": "NO", "name": "SIDE_EFFECTQ1_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ1_REQUIRED_ERROR"
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "sideEffectQ2",
                "mandatory": true,
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
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "SIDE_EFFECTQ2_YES"},
                  {"code": "NO", "name": "SIDE_EFFECTQ2_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ2_REQUIRED_ERROR"
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
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "sideEffectQ3",
                "mandatory": true,
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
                "isMultiSelect": false,
                "dropDownOptions": [
                  {"code": "YES", "name": "SIDE_EFFECTQ3_YES"},
                  {"code": "NO", "name": "SIDE_EFFECTQ3_NO"}
                ],
                "required.message":
                    "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ3_REQUIRED_ERROR"
              }
            ],
            "actionLabel": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_ACTION_LABEL",
            "description": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_DESCRIPTION",
            "showTabView": false,
            "submitCondition": null,
            "preventScreenCapture": false
          },
          {
            "body": [
              {
                "fields": [
                  {
                    "type": "string",
                    "label":
                        "HFREFERRAL_FACILITY_DETAILS_administrativeArea_LABEL",
                    "order": 1,
                    "value": "",
                    "format": "locality",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "administrativeArea",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "required.message":
                        "HFREFERRAL_FACILITY_DETAILS_administrativeArea_REQUIRED_ERROR"
                  },
                  {
                    "type": "integer",
                    "label":
                        "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_LABEL",
                    "order": 2,
                    "value": "",
                    "format": "date",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": true,
                    "required": true,
                    "fieldName": "dateOfEvaluation",
                    "mandatory": true,
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
                    "isMultiSelect": false,
                    "required.message":
                        "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_REQUIRED_ERROR"
                  },
                  {
                    "type": "dynamic",
                    "enums": [],
                    "label":
                        "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_LABEL",
                    "order": 3,
                    "value": "",
                    "format": "custom",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "required": true,
                    "fieldName": "evaluationFacility",
                    "mandatory": true,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "schemaCode": "",
                    "systemDate": false,
                    "validations": [
                      {
                        "type": "required",
                        "value": true,
                        "message":
                            "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_REQUIRED_ERROR"
                      }
                    ],
                    "errorMessage": "",
                    "isMultiSelect": false,
                    "dropDownOptions": [],
                    "required.message":
                        "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_REQUIRED_ERROR"
                  },
                  {
                    "type": "string",
                    "label": "HFREFERRAL_FACILITY_DETAILS_hfCoordinator_LABEL",
                    "order": 4,
                    "value": "",
                    "format": "text",
                    "hidden": false,
                    "isMdms": false,
                    "tooltip": "",
                    "helpText": "",
                    "infoText": "",
                    "readOnly": false,
                    "fieldName": "hfCoordinator",
                    "mandatory": false,
                    "deleteFlag": false,
                    "innerLabel": "",
                    "schemaCode": "",
                    "systemDate": false,
                    "validations": [],
                    "errorMessage": "",
                    "isMultiSelect": false
                  }
                ]
              }
            ],
            "flow": "REFERRAL_CREATE",
            "page": "facilityDetails",
            "type": "object",
            "label": "HFREFERRAL_FACILITY_DETAILS_HEADING",
            "order": 2,
            "footer": [
              {
                "label": "HFREFERRAL_FACILITY_DETAILS_ACTION_LABEL",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {"name": "referralDetails", "type": "form"}
                  }
                ],
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "module": "HFREFERRAL",
            "heading": "HFREFERRAL_FACILITY_DETAILS_HEADING",
            "project": "CMP-2026-01-14-010690",
            "summary": false,
            "version": 1,
            "onAction": [
              {
                "actionType": "FETCH_TRANSFORMER_CONFIG",
                "properties": {
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Failed to fetch config."}
                    }
                  ],
                  "configName": "referralCreation"
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
                  "data": [],
                  "name": "referralAcknowledgement",
                  "type": "TEMPLATE",
                  "onError": [
                    {
                      "actionType": "SHOW_TOAST",
                      "properties": {"message": "Navigation failed."}
                    }
                  ]
                }
              }
            ],
            "navigateTo": {"name": "referralDetails", "type": "form"},
            "properties": [
              {
                "type": "string",
                "label": "HFREFERRAL_FACILITY_DETAILS_administrativeArea_LABEL",
                "order": 1,
                "value": "",
                "format": "locality",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "administrativeArea",
                "mandatory": true,
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
                "isMultiSelect": false,
                "required.message":
                    "HFREFERRAL_FACILITY_DETAILS_administrativeArea_REQUIRED_ERROR"
              },
              {
                "type": "integer",
                "label": "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_LABEL",
                "order": 2,
                "value": "",
                "format": "date",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": true,
                "required": true,
                "fieldName": "dateOfEvaluation",
                "mandatory": true,
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
                "isMultiSelect": false,
                "required.message":
                    "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_REQUIRED_ERROR"
              },
              {
                "type": "dynamic",
                "enums": [],
                "label": "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_LABEL",
                "order": 3,
                "value": "",
                "format": "custom",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "required": true,
                "fieldName": "evaluationFacility",
                "mandatory": true,
                "deleteFlag": false,
                "innerLabel": "",
                "schemaCode": "",
                "systemDate": false,
                "validations": [
                  {
                    "type": "required",
                    "value": true,
                    "message":
                        "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_REQUIRED_ERROR"
                  }
                ],
                "errorMessage": "",
                "isMultiSelect": false,
                "dropDownOptions": [],
                "required.message":
                    "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_REQUIRED_ERROR"
              },
              {
                "type": "string",
                "label": "HFREFERRAL_FACILITY_DETAILS_hfCoordinator_LABEL",
                "order": 4,
                "value": "",
                "format": "text",
                "hidden": false,
                "isMdms": false,
                "tooltip": "",
                "helpText": "",
                "infoText": "",
                "readOnly": false,
                "fieldName": "hfCoordinator",
                "mandatory": false,
                "deleteFlag": false,
                "innerLabel": "",
                "schemaCode": "",
                "systemDate": false,
                "validations": [],
                "errorMessage": "",
                "isMultiSelect": false
              }
            ],
            "actionLabel": "HFREFERRAL_FACILITY_DETAILS_ACTION_LABEL",
            "description": "HFREFERRAL_FACILITY_DETAILS_DESCRIPTION",
            "showTabView": false,
            "submitCondition": null,
            "preventScreenCapture": false
          }
        ],
        "project": "CMP-2026-01-14-010690",
        "summary": false,
        "version": 2,
        "disabled": false,
        "onAction": [
          {
            "actionType": "FETCH_TRANSFORMER_CONFIG",
            "properties": {
              "onError": [
                {
                  "actionType": "SHOW_TOAST",
                  "properties": {"message": "Failed to fetch config."}
                }
              ],
              "configName": "referralCreation"
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
              "data": [],
              "name": "referralAcknowledgement",
              "type": "TEMPLATE",
              "onError": [
                {
                  "actionType": "SHOW_TOAST",
                  "properties": {"message": "Navigation failed."}
                }
              ]
            }
          }
        ],
        "isSelected": true,
        "screenType": "FORM"
      }
    ],
    "order": 3,
    "active": true,
    "project": "CMP-2026-01-14-010690",
    "version": 2,
    "disabled": false,
    "isSelected": true,
    "initialPage": "referralInbox"
  }
};
