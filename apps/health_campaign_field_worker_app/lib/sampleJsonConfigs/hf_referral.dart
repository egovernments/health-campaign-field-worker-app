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
