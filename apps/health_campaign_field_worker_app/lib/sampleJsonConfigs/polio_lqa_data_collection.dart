final dynamic samplePolioLqaDataCollectionFlows = {
  "name": "LQA",
  "initialPage": "lqaClusterEntry",
  "project": "POLIO",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ════════════════════════════════════════════════════════════════════════
    // Flow 1: lqaClusterEntry (FORM) — Cluster info page
    // ════════════════════════════════════════════════════════════════════════
    {
      "name": "lqaClusterEntry",
      "pages": [
        {
          "page": "clusterInfo",
          "type": "object",
          "label": "LQA_CLUSTER_INFO_LABEL",
          "order": 1,
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
          "properties": [
            {
              "type": "string",
              "label": "LQA_SURVEY_DATE_LABEL",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "surveyDate",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_SURVEY_DATE_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_SETTLEMENT_AREA_LABEL",
              "order": 2,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "settlementArea",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_HEALTH_FACILITY_AREA_LABEL",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "healthFacilityArea",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_LOT_NUMBER_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "lotNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_LOT_NUMBER_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "1", "name": "LQA_ENUM_CLUSTER_1"},
                {"code": "2", "name": "LQA_ENUM_CLUSTER_2"},
                {"code": "3", "name": "LQA_ENUM_CLUSTER_3"},
                {"code": "4", "name": "LQA_ENUM_CLUSTER_4"},
                {"code": "5", "name": "LQA_ENUM_CLUSTER_5"},
                {"code": "6", "name": "LQA_ENUM_CLUSTER_6"}
              ],
              "label": "LQA_CLUSTER_NUMBER_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "clusterNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_CLUSTER_NUMBER_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_SURVEYOR_NAME_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_SURVEYOR_NAME_HELPTEXT",
              "infoText": "",
              "readOnly": true,
              "fieldName": "surveyorName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_SURVEYOR_NAME_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "autoFillCondition": [
                {"value": "{{loggedInUserName}}", "expression": "true==true"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_SURVEYOR_PHONE_LABEL",
              "order": 7,
              "value": "",
              "format": "phone",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_SURVEYOR_PHONE_HELPTEXT",
              "infoText": "",
              "readOnly": true,
              "fieldName": "surveyorPhone",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_PHONE_REQUIRED"
                }
              ],
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
              "label": "LQA_COORDINATOR_NAME_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "lqasCoordinatorName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_COORDINATOR_NAME_REQUIRED"
                },
                {
                  "type": "minLength",
                  "value": 2,
                  "message": "LQA_VALIDATION_NAME_MIN_2_CHARS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_STARTING_VILLAGE_LABEL",
              "order": 9,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "startingVillage",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_STARTING_VILLAGE_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "URBAN", "name": "LQA_ENUM_URBAN"},
                {"code": "RURAL", "name": "LQA_ENUM_RURAL"},
                {"code": "SLUMS", "name": "LQA_ENUM_SLUMS"},
                {"code": "REFUGEES_IDPS", "name": "LQA_ENUM_REFUGEES_IDPS"},
                {"code": "HARD_TO_REACH", "name": "LQA_ENUM_HARD_TO_REACH"},
                {
                  "code": "NOMADS_PASTORALISTS",
                  "name": "LQA_ENUM_NOMADS_PASTORALISTS"
                },
                {
                  "code": "SECURITY_COMPROMISED",
                  "name": "LQA_ENUM_SECURITY_COMPROMISED"
                },
                {"code": "IMMIGRANTS", "name": "LQA_ENUM_IMMIGRANTS"},
                {"code": "CROSS_BORDER", "name": "LQA_ENUM_CROSS_BORDER"}
              ],
              "label": "LQA_SETTLEMENT_TYPE_LABEL",
              "order": 10,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "settlementType",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_SETTLEMENT_TYPE_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ],
              "label": "LQA_SETTLEMENT_SMALL_LABEL",
              "order": 11,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "settlementSmall",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_GPS_START_LABEL",
              "order": 12,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_GPS_START_HELPTEXT",
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
                  "message": "LQA_VALIDATION_GPS_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ],
          "systemDate": null,
          "actionLabel": "LQA_ACTION_NEXT",
          "description": "LQA_CLUSTER_INFO_DESCRIPTION",
          "validations": null,
          "includeInForm": null,
          "isMultiSelect": null,
          "includeInSummary": null
        }
      ],
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "data": [],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "LQA_ERROR_FETCH_CONFIG"}
              }
            ],
            "configName": "lqaClusterData"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "USERACTION",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "LQA_ERROR_RECORD_DATA"}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "data": [
              {
                "key": "ClusterClientReferenceId",
                "value":
                    "{{contextData.entities.UserActionModel.clientReferenceId}}"
              }
            ],
            "name": "clusterOverview",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "LQA_ERROR_NAVIGATION"}
              }
            ]
          }
        }
      ],
      "isSelected": true,
      "screenType": "FORM",
      "initActions": [],
      "wrapperConfig": {}
    },

    // ════════════════════════════════════════════════════════════════════════
    // Flow 2: clusterOverview (TEMPLATE) — Shows cluster details + children
    // ════════════════════════════════════════════════════════════════════════
    {
      "body": [
        // ── Cluster details card ──
        {
          "type": "template",
          "format": "card",
          "children": [
            {
              "data": [
                {
                  "key": "LQA_SURVEY_DATE_LABEL",
                  "value":
                      "{{contextData.0.cluster.UserActionModel.additionalFields.fields.surveyDate}}",
                  "isActive": true
                },
                {
                  "key": "LQA_SETTLEMENT_AREA_LABEL",
                  "value":
                      "{{contextData.0.cluster.UserActionModel.additionalFields.fields.settlementArea}}",
                  "isActive": true
                },
                {
                  "key": "LQA_LOT_NUMBER_LABEL",
                  "value":
                      "{{contextData.0.cluster.UserActionModel.additionalFields.fields.lotNumber}}",
                  "isActive": true
                },
                {
                  "key": "LQA_CLUSTER_NUMBER_LABEL",
                  "value":
                      "{{contextData.0.cluster.UserActionModel.additionalFields.fields.clusterNumber}}",
                  "isActive": true
                },
                {
                  "key": "LQA_SURVEYOR_NAME_LABEL",
                  "value":
                      "{{contextData.0.cluster.UserActionModel.additionalFields.fields.surveyorName}}",
                  "isActive": true
                },
                {
                  "key": "LQA_SETTLEMENT_TYPE_LABEL",
                  "value":
                      "{{contextData.0.cluster.UserActionModel.additionalFields.fields.settlementType}}",
                  "isActive": true
                }
              ],
              "type": "template",
              "format": "labelPairList",
              "fieldName": "clusterDetails"
            }
          ],
          "fieldName": "clusterCard",
          "properties": {"type": "primary"}
        },

        // ── Children listView with memberCard ──
        {
          "type": "template",
          "child": {
            "type": "template",
            "format": "card",
            "children": [
              {
                "type": "template",
                "value":
                    "{{ item.child.0.additionalFields.fields.fingerMarked }}",
                "format": "tag",
                "visible":
                    "{{ item.child.0.additionalFields.fields.fingerMarked }}!=null",
                "fieldName": "fingerMarkedTag",
                "properties": {
                  "tagType": "status",
                  "bottomGap": 8,
                  "tagMapping": {
                    "YES": {
                      "label": "LQA_TAG_FINGER_MARKED",
                      "type": "success"
                    },
                    "NO": {"label": "LQA_TAG_NOT_MARKED", "type": "error"}
                  }
                }
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "children": [
                  {
                    "type": "template",
                    "value":
                        "{{ item.child.0.additionalFields.fields.childAgeMonths }} months | {{ item.child.0.additionalFields.fields.childSex }}",
                    "format": "textTemplate",
                    "fieldName": "childAgeSex"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "children": [
                  {
                    "type": "template",
                    "value":
                        "Children Under 5: {{ item.child.0.additionalFields.fields.childrenUnder5 }}",
                    "format": "textTemplate",
                    "fieldName": "childrenUnder5"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "visible":
                    "{{ item.child.0.additionalFields.fields.reasonNotMarked }}!=null",
                "children": [
                  {
                    "type": "template",
                    "value":
                        "Reason Not Marked: {{ item.child.0.additionalFields.fields.reasonNotMarked }}",
                    "format": "textTemplate",
                    "fieldName": "reasonNotMarked"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "visible":
                    "{{ item.child.0.additionalFields.fields.reasonNotMarkedOther }}!=null",
                "children": [
                  {
                    "type": "template",
                    "value":
                        "Other Reason: {{ item.child.0.additionalFields.fields.reasonNotMarkedOther }}",
                    "format": "textTemplate",
                    "fieldName": "reasonNotMarkedOther"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "visible":
                    "{{ item.child.0.additionalFields.fields.refusalReason }}!=null",
                "children": [
                  {
                    "type": "template",
                    "value":
                        "Refusal Reason: {{ item.child.0.additionalFields.fields.refusalReason }}",
                    "format": "textTemplate",
                    "fieldName": "refusalReason"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "visible":
                    "{{ item.child.0.additionalFields.fields.refusalReasonOther }}!=null",
                "children": [
                  {
                    "type": "template",
                    "value":
                        "Other Refusal: {{ item.child.0.additionalFields.fields.refusalReasonOther }}",
                    "format": "textTemplate",
                    "fieldName": "refusalReasonOther"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "visible":
                    "{{ item.child.0.additionalFields.fields.absenceReason }}!=null",
                "children": [
                  {
                    "type": "template",
                    "value":
                        "Absence Reason: {{ item.child.0.additionalFields.fields.absenceReason }}",
                    "format": "textTemplate",
                    "fieldName": "absenceReason"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "visible":
                    "{{ item.child.0.additionalFields.fields.absenceReasonOther }}!=null",
                "children": [
                  {
                    "type": "template",
                    "value":
                        "Other Absence: {{ item.child.0.additionalFields.fields.absenceReasonOther }}",
                    "format": "textTemplate",
                    "fieldName": "absenceReasonOther"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "children": [
                  {
                    "type": "template",
                    "value":
                        "Caregiver Informed: {{ item.child.0.additionalFields.fields.caregiverInformed }}",
                    "format": "textTemplate",
                    "fieldName": "caregiverInformed"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "visible":
                    "{{ item.child.0.additionalFields.fields.campaignAwareness }}!=null",
                "children": [
                  {
                    "type": "template",
                    "value":
                        "Campaign Awareness: {{ item.child.0.additionalFields.fields.campaignAwareness }}",
                    "format": "textTemplate",
                    "fieldName": "campaignAwareness"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "visible":
                    "{{ item.child.0.additionalFields.fields.awarenessOther }}!=null",
                "children": [
                  {
                    "type": "template",
                    "value":
                        "Other Awareness: {{ item.child.0.additionalFields.fields.awarenessOther }}",
                    "format": "textTemplate",
                    "fieldName": "awarenessOther"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "children": [
                  {
                    "type": "template",
                    "value":
                        "OPV Doses From Birth: {{ item.child.0.additionalFields.fields.opvDosesFromBirth }}",
                    "format": "textTemplate",
                    "fieldName": "opvDosesFromBirth"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "properties": {"bottomGap": 8},
                "children": [
                  {
                    "type": "template",
                    "value":
                        "AFP Awareness: {{ item.child.0.additionalFields.fields.afpAwareness }}",
                    "format": "textTemplate",
                    "fieldName": "afpAwareness"
                  }
                ]
              },
              {
                "type": "template",
                "format": "row",
                "visible":
                    "{{ item.child.0.additionalFields.fields.afpCaseCount }}!=null",
                "children": [
                  {
                    "type": "template",
                    "value":
                        "AFP Case Count: {{ item.child.0.additionalFields.fields.afpCaseCount }}",
                    "format": "textTemplate",
                    "fieldName": "afpCaseCount"
                  }
                ]
              }
            ],
            "fieldName": "childCard",
            "properties": {
              "type": "secondary",
              "spacing": 0,
              "cardType": "secondary"
            }
          },
          "format": "listView",
          "fieldName": "listViewChildren",
          "dataSource": "children",
          "properties": {"spacing": "spacer4"}
        },

        // ── "Add Child Details" button ──
        {
          "type": "template",
          "label": "LQA_ADD_CHILD_BUTTON",
          "format": "button",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {
                    "key": "ClusterClientReferenceId",
                    "value":
                        "{{contextData.0.cluster.UserActionModel.clientReferenceId}}"
                  }
                ],
                "name": "ADD_LQA_CHILD",
                "type": "FORM"
              }
            }
          ],
          "fieldName": "addChildDetails",
          "properties": {
            "icon": "AddIcon",
            "size": "medium",
            "type": "tertiary"
          }
        }
      ],
      "name": "clusterOverview",
      "order": 2,
      "canPop": false,
      "footer": [
        {
          "type": "template",
          "label": "LQA_CLOSE_CLUSTER_BUTTON",
          "format": "button",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {
                    "key": "ClusterClientReferenceId",
                    "value":
                        "{{contextData.0.cluster.UserActionModel.clientReferenceId}}"
                  }
                ],
                "name": "lqaCloseout",
                "type": "FORM"
              }
            }
          ],
          "fieldName": "closeCluster",
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        }
      ],
      "header": [],
      "heading": "LQA_CLUSTER_OVERVIEW_HEADING",
      "screenType": "TEMPLATE",
      "description": "LQA_CLUSTER_OVERVIEW_DESCRIPTION",
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "resourceTag",
                "value": "{{navigation.ClusterClientReferenceId}}",
                "operation": "equals",
                "root": "userAction"
              }
            ],
            "name": "cluster",
            "type": "SEARCH_EVENT"
          }
        }
      ],
      "wrapperConfig": {
        "filters": [
          {"field": "action", "equals": "LOCATION_CAPTURE"},
          {"field": "additionalFields.form", "equals": "POLIO_LQA"}
        ],
        "relations": [
          {
            "name": "cluster",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "UserActionModel"
          },
          {
            "name": "children",
            "match": {
              "field": "resourceTag",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "UserActionModel",
            "filters": [
              {"field": "additionalFields.formType", "equals": "LQA_CHILD_DATA"}
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
          }
        ],
        "rootEntity": "UserActionModel",
        "wrapperName": "ClusterWrapper",
        "searchConfig": {
          "select": ["userAction"],
          "primary": "userAction"
        }
      }
    },

    // ════════════════════════════════════════════════════════════════════════
    // Flow 3: ADD_LQA_CHILD (FORM) — Add a single child interview
    // ════════════════════════════════════════════════════════════════════════
    {
      "name": "ADD_LQA_CHILD",
      "pages": [
        {
          "page": "childDetails",
          "type": "object",
          "label": "LQA_CHILD_PAGE_LABEL",
          "order": 1,
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
          "properties": [
            {
              "type": "integer",
              "label": "LQA_CHILDREN_UNDER_5_LABEL",
              "order": 1,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_CHILDREN_UNDER_5_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenUnder5",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "LQA_CHILD_AGE_MONTHS_LABEL",
              "order": 2,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childAgeMonths",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                },
                {
                  "type": "max",
                  "value": 59,
                  "message": "LQA_VALIDATION_MAX_59_MONTHS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "MALE", "name": "LQA_ENUM_MALE"},
                {"code": "FEMALE", "name": "LQA_ENUM_FEMALE"}
              ],
              "label": "LQA_CHILD_SEX_LABEL",
              "order": 3,
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
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ],
              "label": "LQA_FINGER_MARKED_LABEL",
              "order": 4,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "fingerMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "CHILD_ABSENT", "name": "LQA_ENUM_CHILD_ABSENT"},
                {"code": "NON_COMPLIANCE", "name": "LQA_ENUM_NON_COMPLIANCE"},
                {
                  "code": "HOUSE_NOT_VISITED",
                  "name": "LQA_ENUM_HOUSE_NOT_VISITED"
                },
                {
                  "code": "VACCINATED_NOT_MARKED",
                  "name": "LQA_ENUM_VACCINATED_NOT_MARKED"
                },
                {"code": "CHILD_ASLEEP", "name": "LQA_ENUM_CHILD_ASLEEP"},
                {"code": "CHILD_VISITOR", "name": "LQA_ENUM_CHILD_VISITOR"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "label": "LQA_REASON_NOT_MARKED_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "childDetails.fingerMarked=='NO'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REASON_SPECIFY_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarkedOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "childDetails.reasonNotMarked=='OTHER'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {
                  "code": "RELIGIOUS_CULTURAL",
                  "name": "LQA_ENUM_RELIGIOUS_CULTURAL"
                },
                {
                  "code": "VACCINE_NOT_SAFE",
                  "name": "LQA_ENUM_VACCINE_NOT_SAFE"
                },
                {"code": "NO_FELT_NEED", "name": "LQA_ENUM_NO_FELT_NEED"},
                {"code": "TOO_MANY_ROUNDS", "name": "LQA_ENUM_TOO_MANY_ROUNDS"},
                {
                  "code": "NO_CAREGIVER_CONSENT",
                  "name": "LQA_ENUM_NO_CAREGIVER_CONSENT"
                },
                {"code": "CHILD_SICK", "name": "LQA_ENUM_CHILD_SICK"},
                {"code": "COVID_RELATED", "name": "LQA_ENUM_COVID_RELATED"},
                {
                  "code": "AFRICA_POLIO_FREE",
                  "name": "LQA_ENUM_AFRICA_POLIO_FREE"
                },
                {"code": "NOPV_CONCERNS", "name": "LQA_ENUM_NOPV_CONCERNS"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "label": "LQA_REFUSAL_REASON_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition":
                        "childDetails.reasonNotMarked=='NON_COMPLIANCE'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REFUSAL_REASON_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "childDetails.refusalReason=='OTHERS'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "AT_FARM", "name": "LQA_ENUM_AT_FARM"},
                {"code": "IN_MARKET", "name": "LQA_ENUM_IN_MARKET"},
                {"code": "AT_SCHOOL", "name": "LQA_ENUM_AT_SCHOOL"},
                {"code": "IN_PLAYGROUND", "name": "LQA_ENUM_IN_PLAYGROUND"},
                {"code": "TRAVELLED", "name": "LQA_ENUM_TRAVELLED"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "label": "LQA_ABSENCE_REASON_LABEL",
              "order": 9,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "childDetails.reasonNotMarked=='CHILD_ABSENT'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_ABSENCE_REASON_LABEL",
              "order": 10,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "childDetails.absenceReason=='OTHER'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ],
              "label": "LQA_CAREGIVER_INFORMED_LABEL",
              "order": 11,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "caregiverInformed",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "TV", "name": "LQA_ENUM_TV"},
                {"code": "RADIO", "name": "LQA_ENUM_RADIO"},
                {"code": "MOB_VAN", "name": "LQA_ENUM_MOB_VAN"},
                {"code": "HEALTH_WORKER", "name": "LQA_ENUM_HEALTH_WORKER"},
                {"code": "VOLUNTEER_CHW", "name": "LQA_ENUM_VOLUNTEER_CHW"},
                {
                  "code": "RELIGIOUS_LEADER",
                  "name": "LQA_ENUM_RELIGIOUS_LEADER"
                },
                {
                  "code": "COMMUNITY_LEADER",
                  "name": "LQA_ENUM_COMMUNITY_LEADER"
                },
                {"code": "SOCIAL_MEDIA", "name": "LQA_ENUM_SOCIAL_MEDIA"},
                {"code": "SCHOOL", "name": "LQA_ENUM_SCHOOL"},
                {"code": "IEC_MATERIALS", "name": "LQA_ENUM_IEC_MATERIALS"},
                {
                  "code": "SOCIAL_MOBILIZER",
                  "name": "LQA_ENUM_SOCIAL_MOBILIZER"
                },
                {"code": "NEIGHBOUR", "name": "LQA_ENUM_NEIGHBOUR"},
                {"code": "NEWSPAPER", "name": "LQA_ENUM_NEWSPAPER"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "label": "LQA_CAMPAIGN_AWARENESS_LABEL",
              "order": 12,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": true,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "childDetails.caregiverInformed=='YES'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_AWARENESS_OTHER_LABEL",
              "order": 13,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "awarenessOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "childDetails.caregiverInformed=='YES'"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "LQA_OPV_DOSES_LABEL",
              "order": 14,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "opvDosesFromBirth",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ],
              "label": "LQA_AFP_AWARENESS_LABEL",
              "order": 15,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "LQA_AFP_CASE_COUNT_LABEL",
              "order": 16,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpCaseCount",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "childDetails.afpAwareness=='YES'"
                  }
                ]
              }
            }
          ],
          "systemDate": null,
          "actionLabel": "LQA_ACTION_SUBMIT",
          "description": "LQA_CHILD_PAGE_DESCRIPTION",
          "validations": null,
          "includeInForm": null,
          "isMultiSelect": null,
          "includeInSummary": null
        }
      ],
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "data": [
              {
                "key": "ClusterClientReferenceId",
                "value": "{{navigation.ClusterClientReferenceId}}"
              }
            ],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "LQA_ERROR_FETCH_CONFIG"}
              }
            ],
            "configName": "lqaChildData"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "USERACTION",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "LQA_ERROR_RECORD_DATA"}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "data": [
              {
                "key": "ClusterClientReferenceId",
                "value": "{{navigation.ClusterClientReferenceId}}"
              }
            ],
            "name": "clusterOverview",
            "type": "TEMPLATE",
            "navigationMode": "popUntilAndPush",
            "popUntilPageName": "lqaClusterEntry",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "LQA_ERROR_NAVIGATION"}
              }
            ]
          }
        }
      ],
      "isSelected": true,
      "screenType": "FORM",
      "initActions": [],
      "wrapperConfig": {}
    },

    // ════════════════════════════════════════════════════════════════════════
    // Flow 4: lqaCloseout (FORM) — GPS final + comments
    // ════════════════════════════════════════════════════════════════════════
    {
      "name": "lqaCloseout",
      "pages": [
        {
          "page": "closeout",
          "type": "object",
          "label": "LQA_CLOSEOUT_LABEL",
          "order": 1,
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
          "properties": [
            {
              "type": "string",
              "label": "LQA_GPS_FINAL_LABEL",
              "order": 1,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_GPS_FINAL_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gpsFinal",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_FINAL_COMMENTS_LABEL",
              "order": 2,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_FINAL_COMMENTS_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "finalComments",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "maxLength",
                  "value": 500,
                  "message": "LQA_VALIDATION_MAX_500_CHARS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ],
          "systemDate": null,
          "actionLabel": "LQA_ACTION_SUBMIT",
          "description": "LQA_CLOSEOUT_DESCRIPTION",
          "validations": null,
          "includeInForm": null,
          "isMultiSelect": null,
          "includeInSummary": null
        }
      ],
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "data": [
              {
                "key": "ClusterClientReferenceId",
                "value": "{{navigation.ClusterClientReferenceId}}"
              }
            ],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "LQA_ERROR_FETCH_CONFIG"}
              }
            ],
            "configName": "lqaCloseoutData"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "USERACTION",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "LQA_ERROR_RECORD_DATA"}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "name": "lqaSuccess",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "LQA_ERROR_NAVIGATION"}
              }
            ]
          }
        }
      ],
      "isSelected": true,
      "screenType": "FORM",
      "initActions": [],
      "wrapperConfig": {}
    },

    // ════════════════════════════════════════════════════════════════════════
    // Flow 5: lqaSuccess (TEMPLATE) — Success screen
    // ════════════════════════════════════════════════════════════════════════
    {
      "body": [
        {
          "type": "template",
          "label": "LQA_SUCCESS_HEADING",
          "format": "panelCard",
          "properties": {"type": "success"},
          "description": "LQA_SUCCESS_DESCRIPTION",
          "primaryAction": {
            "type": "template",
            "label": "LQA_SUCCESS_ADD_ANOTHER",
            "format": "button",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"name": "lqaClusterEntry", "type": "FORM"}
              }
            ],
            "fieldName": "addLqaEntry",
            "properties": {"type": "primary"}
          },
          "secondaryAction": {
            "type": "template",
            "label": "LQA_SUCCESS_BACK_HOME",
            "format": "button",
            "onAction": [
              {
                "actionType": "BACK_NAVIGATION",
                "properties": {"name": "HOME", "type": "HOME"}
              }
            ],
            "fieldName": "goBack",
            "properties": {"type": "secondary"}
          }
        }
      ],
      "name": "lqaSuccess",
      "order": 5,
      "canPop": false,
      "footer": [],
      "header": [],
      "heading": "",
      "screenType": "TEMPLATE",
      "description": "",
      "initActions": []
    }
  ]
};
