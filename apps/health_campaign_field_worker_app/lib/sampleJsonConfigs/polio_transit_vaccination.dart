final dynamic sampleTransitVaccinationFlows = {
  "name": "TRANSIT_POST",
  "initialPage": "transitSessionsList",
  "project": "POLIO",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ══════════════════════════════════════════════════════════════════════
    // Flow 1: transitSessionsList (TEMPLATE) — Landing page
    // Lists open sessions with a "Start Session" footer CTA.
    // ══════════════════════════════════════════════════════════════════════
    {
      "name": "transitSessionsList",
      "screenType": "TEMPLATE",
      "order": 1,
      "canPop": true,
      "heading": "GV_TRANSIT_SESSIONS_HEADING",
      "description": "GV_TRANSIT_SESSIONS_DESCRIPTION",
      "header": [
        {
          "type": "template",
          "label": "GV_BACK_LABEL",
          "format": "backLink",
          "fieldName": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "HOME", "type": "HOME"}
            }
          ]
        }
      ],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "tenantId",
                "value": "{{singleton.selectedProject.tenantId}}",
                "operation": "equals",
                "root": "userAction"
              },
              {
                "key": "projectId",
                "value": "{{singleton.selectedProject.id}}",
                "operation": "equals",
                "root": "userAction"
              }
            ],
            "name": "sessions",
            "type": "SEARCH_EVENT"
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "TransitSessionsListWrapper",
        "rootEntity": "UserActionModel",
        "filters": [
          {"field": "action", "equals": "POLIO_TRANSIT_SESSION"}
        ],
        "relations": [
          {
            "name": "children",
            "match": {
              "field": "resourceTag",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "UserActionModel",
            "filters": [
              {"field": "action", "equals": "VACCINATION_ADMINISTERED"}
            ]
          },
          {
            "name": "malesChildren",
            "match": {
              "field": "resourceTag",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "UserActionModel",
            "filters": [
              {"field": "action", "equals": "VACCINATION_ADMINISTERED"},
              {"field": "additionalFields.fields.childSex", "equals": "MALE"}
            ]
          },
          {
            "name": "femaleChildren",
            "match": {
              "field": "resourceTag",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "UserActionModel",
            "filters": [
              {"field": "action", "equals": "VACCINATION_ADMINISTERED"},
              {"field": "additionalFields.fields.childSex", "equals": "FEMALE"}
            ]
          },
          {
            "name": "referrals",
            "match": {
              "field": "resourceTag",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "UserActionModel",
            "filters": [
              {"field": "action", "equals": "REFERRAL_RECORDED"}
            ]
          }
        ],
        "searchConfig": {
          "primary": "userAction",
          "select": ["userAction"],
          "orderBy": {"field": "clientCreatedTime", "order": "DESC"}
        }
      },
      "body": [
        // Empty state — shown when there are no records at all
        {
          "type": "template",
          "format": "infoCard",
          "fieldName": "emptyState",
          "hidden": "{{context.UserActionModel.isNotEmpty}}",
          "label": "GV_SESSIONS_EMPTY_MESSAGE",
          "description": "GV_SESSIONS_EMPTY_DESCRIPTION"
        },
        // Session cards list (iterates all wrapper items, no dataSource)
        {
          "type": "template",
          "format": "listView",
          "fieldName": "listViewSessions",
          "properties": {"spacing": "spacer4"},
          "child": {
            "type": "template",
            "format": "card",
            "fieldName": "sessionCard",
            "properties": {
              "type": "secondary",
              "spacing": 0,
              "cardType": "secondary"
            },
            "children": [
              {
                "type": "template",
                "format": "textTemplate",
                "fieldName": "sessionLocationName",
                "value":
                    "{{item.UserActionModel.additionalFields.fields.locationName}}",
                "properties": {"bottomGap": 4, "style": "headingL"}
              },
              {
                "type": "template",
                "format": "textTemplate",
                "fieldName": "sessionSubtitle",
                "value":
                    "{{item.UserActionModel.additionalFields.fields.transitLocationType}} · {{fn:formatDate(item.UserActionModel.timestamp, 'date', 'dd MMM yyyy')}}",
                "properties": {"bottomGap": 12}
              },
              {
                "type": "template",
                "format": "textTemplate",
                "fieldName": "vaccinatedInline",
                "value":
                    "{{item.children.length}} vaccinated · {{item.malesChildren.length}}M · {{item.femaleChildren.length}}F",
                "properties": {"bottomGap": 4}
              },
              {
                "type": "template",
                "format": "textTemplate",
                "fieldName": "referredInline",
                "value": "{{item.referrals.length}} referred",
                "properties": {"bottomGap": 12}
              },
              {
                "type": "template",
                "label": "GV_RESUME_SESSION_BUTTON",
                "format": "button",
                "fieldName": "resumeSession",
                "properties": {
                  "size": "medium",
                  "type": "secondary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                },
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "SessionClientReferenceId",
                          "value":
                              "{{item.UserActionModel.clientReferenceId}}"
                        },
                        {"key": "SessionType", "value": "TRANSIT"}
                      ],
                      "name": "transitSessionOverview",
                      "type": "TEMPLATE"
                    }
                  }
                ]
              }
            ]
          }
        }
      ],
      "footer": [
        {
          "type": "template",
          "label": "GV_START_SESSION_BUTTON",
          "format": "button",
          "fieldName": "startSession",
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "name": "transitSessionSetup",
                "type": "FORM"
              }
            }
          ]
        }
      ]
    },

    // ══════════════════════════════════════════════════════════════════════
    // Flow 2: transitSessionSetup (FORM) — Type + Landmark + GPS
    // ══════════════════════════════════════════════════════════════════════
    {
      "name": "transitSessionSetup",
      "screenType": "FORM",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        {
          "page": "sessionSetup",
          "type": "object",
          "label": "GV_TRANSIT_SESSION_SETUP_LABEL",
          "order": 1,
          "description": "GV_TRANSIT_SESSION_SETUP_DESC",
          "actionLabel": "GV_ACTION_START_SESSION",
          "value": null,
          "hidden": null,
          "endDate": null,
          "tooltip": null,
          "helpText": null,
          "readOnly": null,
          "required": null,
          "charCount": null,
          "startDate": null,
          "autoEnable": null,
          "innerLabel": null,
          "systemDate": null,
          "validations": null,
          "isMultiSelect": null,
          "includeInForm": null,
          "includeInSummary": null,
          "properties": [
            {
              "type": "string",
              "label": "GV_TRANSIT_LOCATION_TYPE_LABEL",
              "order": 1,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "transitLocationType",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "GV_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "BUS_STATION", "name": "GV_ENUM_BUS_STATION"},
                {"code": "BORDER_CROSSING", "name": "GV_ENUM_BORDER_CROSSING"},
                {"code": "CHECKPOINT", "name": "GV_ENUM_CHECKPOINT"},
                {"code": "FERRY_TERMINAL", "name": "GV_ENUM_FERRY_TERMINAL"},
                {"code": "OTHER", "name": "GV_ENUM_OTHER"}
              ]
            },
            {
              "type": "string",
              "label": "GV_TRANSIT_SITE_LANDMARK_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "GV_TRANSIT_SITE_LANDMARK_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "locationName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "GV_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "GV_SESSION_DATE_LABEL",
              "order": 3,
              "value": "",
              "format": "date",
              "hidden": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sessionDate",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "GV_SESSION_AREA_LABEL",
              "order": 4,
              "value": "",
              "format": "locality",
              "hidden": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sessionArea",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "GV_WORKER_NAME_LABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "workerName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "autoFillCondition": [
                {"value": "{{loggedInUserName}}", "expression": "true==true"}
              ]
            },
            {
              "type": "string",
              "label": "GV_WORKER_PHONE_LABEL",
              "order": 6,
              "value": "",
              "format": "phone",
              "hidden": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "workerPhone",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "autoFillCondition": [
                {
                  "value": "{{loggedInUserMobileNumber}}",
                  "expression": "true==true"
                }
              ]
            },
            {
              "type": "string",
              "label": "GV_LOCATION_CAPTURED_LABEL",
              "order": 7,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "GV_GPS_START_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gpsStart",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "GV_VALIDATION_GPS_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ]
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "data": [],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "GV_ERROR_FETCH_CONFIG"}
              }
            ],
            "configName": "transitSession"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "USERACTION",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "GV_ERROR_RECORD_DATA"}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "data": [
              {
                "key": "SessionClientReferenceId",
                "value":
                    "{{contextData.entities.UserActionModel.clientReferenceId}}"
              },
              {"key": "SessionType", "value": "TRANSIT"}
            ],
            "name": "transitSessionOverview",
            "type": "TEMPLATE",
            "navigationMode": "popUntilAndPush",
            "popUntilPageName": "transitSessionsList",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "GV_ERROR_NAVIGATION"}
              }
            ]
          }
        }
      ]
    },

    // ══════════════════════════════════════════════════════════════════════
    // Flow 3: transitSessionOverview (TEMPLATE) — Active session dashboard
    // Shows metrics: Vaccinated today (M · F) + Children referred, plus
    // Vaccinate / Refer buttons.
    // ══════════════════════════════════════════════════════════════════════
    {
      "name": "transitSessionOverview",
      "screenType": "TEMPLATE",
      "order": 3,
      "canPop": true,
      "heading": "GV_SESSION_OVERVIEW_HEADING",
      "description": "GV_SESSION_OVERVIEW_TODAY",
      "header": [
        {
          "type": "template",
          "label": "GV_BACK_LABEL",
          "format": "backLink",
          "fieldName": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "transitSessionsList", "type": "TEMPLATE"}
            }
          ]
        }
      ],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "resourceTag",
                "value": "{{navigation.SessionClientReferenceId}}",
                "operation": "equals",
                "root": "userAction"
              }
            ],
            "name": "session",
            "type": "SEARCH_EVENT"
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "TransitSessionWrapper",
        "rootEntity": "UserActionModel",
        "filters": [
          {"field": "action", "equals": "POLIO_TRANSIT_SESSION"}
        ],
        "relations": [
          {
            "name": "children",
            "match": {
              "field": "resourceTag",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "UserActionModel",
            "filters": [
              {"field": "action", "equals": "VACCINATION_ADMINISTERED"}
            ],
            "relations": [
              {
                "name": "child",
                "match": {
                  "field": "clientReferenceId",
                  "equalsFrom": "clientReferenceId"
                },
                "entity": "UserActionModel"
              }
            ]
          },
          {
            "name": "malesChildren",
            "match": {
              "field": "resourceTag",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "UserActionModel",
            "filters": [
              {"field": "action", "equals": "VACCINATION_ADMINISTERED"},
              {"field": "additionalFields.fields.childSex", "equals": "MALE"}
            ]
          },
          {
            "name": "femaleChildren",
            "match": {
              "field": "resourceTag",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "UserActionModel",
            "filters": [
              {"field": "action", "equals": "VACCINATION_ADMINISTERED"},
              {"field": "additionalFields.fields.childSex", "equals": "FEMALE"}
            ]
          },
          {
            "name": "referrals",
            "match": {
              "field": "resourceTag",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "UserActionModel",
            "filters": [
              {"field": "action", "equals": "REFERRAL_RECORDED"}
            ]
          }
        ],
        "searchConfig": {
          "primary": "userAction",
          "select": ["userAction"]
        }
      },
      "body": [
        // Session location card
        {
          "type": "template",
          "format": "card",
          "fieldName": "sessionCard",
          "properties": {"type": "primary"},
          "children": [
            {
              "type": "template",
              "format": "labelPairList",
              "fieldName": "sessionDetails",
              "data": [
                {
                  "key": "GV_SUMMARY_LOCATION_TYPE",
                  "value":
                      "{{contextData.0.UserActionModel.additionalFields.fields.transitLocationType}}",
                  "isActive": true
                },
                {
                  "key": "GV_SUMMARY_LOCATION_NAME",
                  "value":
                      "{{contextData.0.UserActionModel.additionalFields.fields.locationName}}",
                  "isActive": true
                },
                {
                  "key": "GV_SUMMARY_SESSION_DATE",
                  "value":
                      "{{fn:formatDate(contextData.0.UserActionModel.timestamp, 'date', 'dd MMM yyyy')}}",
                  "isActive": true
                }
              ]
            }
          ]
        },
        // Metrics — two tiles stacked vertically (label / big count / subtext)
        {
          "type": "template",
          "format": "card",
          "fieldName": "vaccinatedTile",
          "properties": {"type": "primary"},
          "children": [
            {
              "type": "template",
              "format": "textTemplate",
              "fieldName": "vaccinatedLabel",
              "value": "GV_METRIC_VACCINATED_TODAY"
            },
            {
              "type": "template",
              "format": "textTemplate",
              "fieldName": "vaccinatedCount",
              "value": "{{contextData.0.children.length}}"
            },
            {
              "type": "template",
              "format": "textTemplate",
              "fieldName": "vaccinatedSplit",
              "value":
                  "{{contextData.0.malesChildren.length}} male · {{contextData.0.femaleChildren.length}} female"
            }
          ]
        },
        {
          "type": "template",
          "format": "card",
          "fieldName": "referredTile",
          "properties": {"type": "primary"},
          "children": [
            {
              "type": "template",
              "format": "textTemplate",
              "fieldName": "referredLabel",
              "value": "GV_METRIC_CHILDREN_REFERRED"
            },
            {
              "type": "template",
              "format": "textTemplate",
              "fieldName": "referredCount",
              "value": "{{contextData.0.referrals.length}}"
            }
          ]
        },
      ],
      "footer": [
        {
          "type": "template",
          "label": "GV_ADD_VACCINATION_BUTTON",
          "format": "button",
          "fieldName": "addVaccination",
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {
                    "key": "SessionClientReferenceId",
                    "value":
                        "{{contextData.0.UserActionModel.clientReferenceId}}"
                  },
                  {"key": "SessionType", "value": "TRANSIT"},
                  {
                    "key": "TransitLocationType",
                    "value":
                        "{{contextData.0.UserActionModel.additionalFields.fields.transitLocationType}}"
                  }
                ],
                "name": "ADD_TRANSIT_CHILD",
                "type": "FORM"
              }
            }
          ]
        },
        {
          "type": "template",
          "label": "GV_ADD_REFERRAL_BUTTON",
          "format": "button",
          "fieldName": "addReferral",
          "properties": {
            "size": "large",
            "type": "secondary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {
                    "key": "SessionClientReferenceId",
                    "value":
                        "{{contextData.0.UserActionModel.clientReferenceId}}"
                  }
                ],
                "name": "ADD_TRANSIT_REFERRAL",
                "type": "FORM"
              }
            }
          ]
        }
      ]
    },

    // ══════════════════════════════════════════════════════════════════════
    // Flow 4: ADD_TRANSIT_CHILD (FORM) — 2-page vaccination record
    // Page 1: childDetails       (name, sex, ageBand)
    // Page 2: confirmVaccination (twoDrops + fingerMarked checkboxes)
    // ══════════════════════════════════════════════════════════════════════
    {
      "name": "ADD_TRANSIT_CHILD",
      "screenType": "FORM",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "includeSummary": true,
      "pages": [
        // ── Page 1: childDetails ──
        {
          "page": "childDetails",
          "type": "object",
          "label": "GV_CHILD_DETAILS_LABEL",
          "order": 1,
          "description": "GV_CHILD_STEP_1_OF_2",
          "actionLabel": "GV_ACTION_CONTINUE",
          "value": null,
          "hidden": null,
          "endDate": null,
          "tooltip": null,
          "helpText": null,
          "readOnly": null,
          "required": null,
          "charCount": null,
          "startDate": null,
          "autoEnable": null,
          "innerLabel": null,
          "systemDate": null,
          "validations": null,
          "isMultiSelect": null,
          "includeInForm": null,
          "includeInSummary": null,
          "navigateTo": {"name": "confirmVaccination", "type": "form"},
          "properties": [
            {
              "type": "string",
              "label": "GV_CHILD_NAME_LABEL",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "GV_CHILD_NAME_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "GV_CHILD_SEX_LABEL",
              "order": 2,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childSex",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "GV_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "MALE", "name": "GV_ENUM_MALE"},
                {"code": "FEMALE", "name": "GV_ENUM_FEMALE"}
              ]
            },
            {
              "type": "string",
              "label": "GV_AGE_BAND_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "ageBand",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "GV_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "0_11_MONTHS", "name": "GV_ENUM_AGE_0_11_MONTHS"},
                {"code": "12_59_MONTHS", "name": "GV_ENUM_AGE_12_59_MONTHS"}
              ]
            },
            {
              "type": "string",
              "label": "GV_DIRECTION_OF_TRAVEL_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "directionOfTravel",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "ENTERING", "name": "GV_ENUM_ENTERING"},
                {"code": "EXITING", "name": "GV_ENUM_EXITING"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition":
                        "navigation.TransitLocationType=='BORDER_CROSSING'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "GV_NATIONALITY_LABEL",
              "order": 6,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "nationality",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "CHAD", "name": "GV_ENUM_CHAD"},
                {"code": "NIGERIA", "name": "GV_ENUM_NIGERIA"},
                {"code": "CAMEROON", "name": "GV_ENUM_CAMEROON"},
                {"code": "CAR", "name": "GV_ENUM_CAR"},
                {"code": "SUDAN", "name": "GV_ENUM_SUDAN"},
                {"code": "NIGER", "name": "GV_ENUM_NIGER"},
                {"code": "OTHER", "name": "GV_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition":
                        "navigation.TransitLocationType=='BORDER_CROSSING'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "GV_OPV_PRIOR_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "opvPrior",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "GV_ENUM_YES"},
                {"code": "NO", "name": "GV_ENUM_NO"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition":
                        "navigation.TransitLocationType=='BORDER_CROSSING'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "GV_IPV_PRIOR_LABEL",
              "order": 8,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "ipvPrior",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "GV_ENUM_YES"},
                {"code": "NO", "name": "GV_ENUM_NO"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition":
                        "navigation.TransitLocationType=='BORDER_CROSSING'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "GV_LOCATION_CAPTURED_LABEL",
              "order": 9,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gpsChild",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "GV_VALIDATION_GPS_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ]
        },

        // ── Page 2: confirmVaccination (checkboxes) ──
        {
          "page": "confirmVaccination",
          "type": "object",
          "label": "GV_CONFIRM_VACCINATION_LABEL",
          "order": 2,
          "description": "GV_CONFIRM_VACCINATION_DESC",
          "actionLabel": "GV_ACTION_CONFIRM_VACCINATION",
          "value": null,
          "hidden": null,
          "endDate": null,
          "tooltip": null,
          "helpText": null,
          "readOnly": null,
          "required": null,
          "charCount": null,
          "startDate": null,
          "autoEnable": null,
          "innerLabel": null,
          "systemDate": null,
          "validations": null,
          "isMultiSelect": null,
          "includeInForm": null,
          "includeInSummary": null,
          "properties": [
            {
              "type": "boolean",
              "label": "GV_TWO_DROPS_LABEL",
              "order": 1,
              "value": true,
              "format": "checkbox",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "twoDropsAdministered",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "boolean",
              "label": "GV_FINGER_MARKED_LABEL",
              "order": 2,
              "value": true,
              "format": "checkbox",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "fingerMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ]
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "data": [
              {
                "key": "SessionClientReferenceId",
                "value": "{{navigation.SessionClientReferenceId}}"
              }
            ],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "GV_ERROR_FETCH_CONFIG"}
              }
            ],
            "configName": "groupVacChild"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "USERACTION",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "GV_ERROR_RECORD_DATA"}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "data": [
              {
                "key": "SessionClientReferenceId",
                "value": "{{navigation.SessionClientReferenceId}}"
              },
              {"key": "SessionType", "value": "TRANSIT"},
              {
                "key": "TransitLocationType",
                "value": "{{navigation.TransitLocationType}}"
              }
            ],
            "name": "transitVaccinationSuccess",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "GV_ERROR_NAVIGATION"}
              }
            ]
          }
        }
      ]
    },

    // ══════════════════════════════════════════════════════════════════════
    // Flow 5: transitVaccinationSuccess (TEMPLATE)
    // "nOPV2 delivered successfully." — Record Another / Back to Dashboard
    // ══════════════════════════════════════════════════════════════════════
    {
      "name": "transitVaccinationSuccess",
      "screenType": "TEMPLATE",
      "order": 5,
      "canPop": false,
      "heading": "",
      "description": "",
      "header": [],
      "initActions": [],
      "body": [
        {
          "type": "template",
          "label": "GV_VACCINATION_SUCCESS_HEADING",
          "format": "panelCard",
          "properties": {"type": "success"},
          "description": "GV_VACCINATION_SUCCESS_MESSAGE",
          "primaryAction": {
            "type": "template",
            "label": "GV_SUCCESS_RECORD_ANOTHER",
            "format": "button",
            "fieldName": "recordAnother",
            "properties": {"type": "primary"},
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "SessionClientReferenceId",
                      "value": "{{navigation.SessionClientReferenceId}}"
                    },
                    {"key": "SessionType", "value": "TRANSIT"},
                    {
                      "key": "TransitLocationType",
                      "value": "{{navigation.TransitLocationType}}"
                    }
                  ],
                  "name": "ADD_TRANSIT_CHILD",
                  "type": "FORM"
                }
              }
            ]
          },
          "secondaryAction": {
            "type": "template",
            "label": "GV_SUCCESS_BACK_TO_DASHBOARD",
            "format": "button",
            "fieldName": "backToDashboard",
            "properties": {"type": "secondary"},
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "SessionClientReferenceId",
                      "value": "{{navigation.SessionClientReferenceId}}"
                    },
                    {"key": "SessionType", "value": "TRANSIT"}
                  ],
                  "name": "transitSessionOverview",
                  "type": "TEMPLATE",
                  "navigationMode": "popUntilAndPush",
                  "popUntilPageName": "transitSessionsList"
                }
              }
            ]
          }
        }
      ],
      "footer": []
    },

    // ══════════════════════════════════════════════════════════════════════
    // Flow 6: ADD_TRANSIT_REFERRAL (FORM)
    // ══════════════════════════════════════════════════════════════════════
    {
      "name": "ADD_TRANSIT_REFERRAL",
      "screenType": "FORM",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        {
          "page": "referralDetails",
          "type": "object",
          "label": "GV_REFERRAL_PAGE_LABEL",
          "order": 1,
          "description": "GV_REFERRAL_PAGE_DESCRIPTION",
          "actionLabel": "GV_ACTION_CONFIRM_REFERRAL",
          "value": null,
          "hidden": null,
          "endDate": null,
          "tooltip": null,
          "helpText": null,
          "readOnly": null,
          "required": null,
          "charCount": null,
          "startDate": null,
          "autoEnable": null,
          "innerLabel": null,
          "systemDate": null,
          "validations": null,
          "isMultiSelect": null,
          "includeInForm": null,
          "includeInSummary": null,
          "properties": [
            {
              "type": "string",
              "label": "GV_REFERRAL_CONTACT_PERSON_LABEL",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "contactPerson",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "GV_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "GV_REFERRAL_CONTACT_NUMBER_LABEL",
              "order": 2,
              "value": "",
              "format": "phone",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "contactNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "GV_REFERRAL_ADDRESS_LABEL",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "address",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "maxLength",
                  "value": 300,
                  "message": "GV_VALIDATION_MAX_300"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "GV_REFERRAL_REASON_LABEL",
              "order": 4,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "referralReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "GV_VALIDATION_REQUIRED"
                },
                {
                  "type": "maxLength",
                  "value": 500,
                  "message": "GV_VALIDATION_MAX_500"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "GV_LOCATION_CAPTURED_LABEL",
              "order": 5,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gpsReferral",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "GV_VALIDATION_GPS_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ]
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "data": [
              {
                "key": "SessionClientReferenceId",
                "value": "{{navigation.SessionClientReferenceId}}"
              }
            ],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "GV_ERROR_FETCH_CONFIG"}
              }
            ],
            "configName": "groupVacReferral"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "USERACTION",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "GV_ERROR_RECORD_DATA"}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "data": [
              {
                "key": "SessionClientReferenceId",
                "value": "{{navigation.SessionClientReferenceId}}"
              }
            ],
            "name": "transitReferralSuccess",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "GV_ERROR_NAVIGATION"}
              }
            ]
          }
        }
      ]
    },

    // ══════════════════════════════════════════════════════════════════════
    // Flow 7: transitReferralSuccess (TEMPLATE)
    // "The child has been referred for follow-up."
    // ══════════════════════════════════════════════════════════════════════
    {
      "name": "transitReferralSuccess",
      "screenType": "TEMPLATE",
      "order": 7,
      "canPop": false,
      "heading": "",
      "description": "",
      "header": [],
      "initActions": [],
      "body": [
        {
          "type": "template",
          "label": "GV_REFERRAL_SUCCESS_HEADING",
          "format": "panelCard",
          "properties": {"type": "success"},
          "description": "GV_REFERRAL_SUCCESS_MESSAGE",
          "primaryAction": {
            "type": "template",
            "label": "GV_SUCCESS_RECORD_ANOTHER_REFERRAL",
            "format": "button",
            "fieldName": "recordAnotherReferral",
            "properties": {"type": "primary"},
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "SessionClientReferenceId",
                      "value": "{{navigation.SessionClientReferenceId}}"
                    }
                  ],
                  "name": "ADD_TRANSIT_REFERRAL",
                  "type": "FORM"
                }
              }
            ]
          },
          "secondaryAction": {
            "type": "template",
            "label": "GV_SUCCESS_BACK_TO_DASHBOARD",
            "format": "button",
            "fieldName": "backToDashboard",
            "properties": {"type": "secondary"},
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "SessionClientReferenceId",
                      "value": "{{navigation.SessionClientReferenceId}}"
                    },
                    {"key": "SessionType", "value": "TRANSIT"}
                  ],
                  "name": "transitSessionOverview",
                  "type": "TEMPLATE",
                  "navigationMode": "popUntilAndPush",
                  "popUntilPageName": "transitSessionsList"
                }
              }
            ]
          }
        }
      ],
      "footer": []
    }
  ]
};
