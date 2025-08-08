const String sample = '''
{
  "HFREFERALFLOW": {
    "data": {
      "name": "HFREFERALFLOW",
      "version": 1,
      "pages": {
        "facilityDetails": {
          "label": "APPONE_HFREFERALFLOW_SCREEN_HEADING",
          "order": 2,
          "type": "object",
          "format": null,
          "description": "APPONE_HFREFERALFLOW_DESCRIPTION",
          "actionLabel": "APPONE_HFREFERALFLOW_ACTION_BUTTON_LABEL",
          "properties": {
            "administrativeUnitKey": {
              "type": "string",
              "label": "APPONE_HFREFERALFLOW_Adminstative_area_label",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "administrativeUnitKey",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "dateOfEvaluation": {
              "type": "integer",
              "label": "APPONE_HFREFERALFLOW_dateOfEvaluation_label",
              "order": 2,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_facilityDetails_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_facilityDetails_helpText_label",
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
                  "message": "APPONE_HFREFERALFLOW_facilityDetails_DATE_OF_EVALUATION"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "evaluationFacilityKey": {
              "type": "dynamic",
              "enums": [],
              "label": "APPONE_HFREFERALFLOW_EVALUATION_FACILITY_KEY_LABEL",
              "order": 3,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_EVALUATION_FACILITY_TOOLTIP_KEY_LABEL",
              "helpText": "APPONE_HFREFERALFLOW_EVALUATION_FACILITY_HELPTEXT_KEY_LABEL",
              "infoText": "",
              "readOnly": false,
              "fieldName": "evaluationFacilityKey",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_evaluationFacilityKey_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "hfCoordinatorKey": {
              "type": "string",
              "label": "APPONE_HFREFERALFLOW_hfCoordinatorKey_label",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_hfCoordinatorKey_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_hfCoordinatorKey_helpText_label",
              "infoText": "",
              "readOnly": false,
              "fieldName": "hfCoordinatorKey",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "referredByKey": {
              "type": "string",
              "label": "APPONE_HFREFERALFLOW_referredByKey_label",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_referredByKey_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_referredByKey_helpText_label",
              "infoText": "",
              "readOnly": false,
              "fieldName": "referredByKey",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {
            "name": "referralDetails",
            "type": "form"
          },
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        },
        "referralDetails": {
          "label": "APPONE_REFERRALDETAILS_SCREEN_HEADING",
          "order": 3,
          "type": "object",
          "format": null,
          "description": "APPONE_REFERRALDETAILS_SCREEN_SCREEN_DESCRIPTION",
          "actionLabel": "APPONE_REFERRALDETAILS_SCREEN_ACTION_BUTTON_LABEL",
          "properties": {
            "referralCycle": {
              "type": "dynamic",
              "label": "APPONE_REFERRALDETAILS_SCREEN_cycle_label",
              "order": 1,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText": "APPONE_REFERRALDETAILS_SCREEN_cycle_helpText_label",
              "infoText": "",
              "readOnly": false,
              "fieldName": "referralCycle",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_REFERRALDETAILS_SCREEN_cycle_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "nameOfChild": {
              "type": "string",
              "label": "APPONE_REFERRALDETAILS_SCREEN_nameOfChild_label",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "APPONE_REFERRALDETAILS_SCREEN_nameOfChild_helpText_label",
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
                  "message": "APPONE_REFERRALDETAILS_SCREEN_nameOfChild_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "beneficiaryId": {
              "type": "string",
              "label": "APPONE_REFERRALDETAILS_SCREEN_beneficiaryId_label",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "APPONE_REFERRALDETAILS_SCREEN_beneficiaryId_helpText_label",
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
            "referralCode": {
              "type": "string",
              "label": "APPONE_REFERRALDETAILS_SCREEN_referralCode_label",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "APPONE_REFERRALDETAILS_SCREEN_referralCode_helpText_label",
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
            "ageInMonths": {
              "type": "integer",
              "label": "APPONE_REFERRALDETAILS_SCREEN_ageInMonths_label",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "APPONE_REFERRALDETAILS_SCREEN_ageInMonths_helpText_label",
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
                  "message": "APPONE_REFERRALDETAILS_SCREEN_ageInMonths_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "gender": {
              "type": "string",
              "label": "APPONE_REFERRALDETAILS_SCREEN_gender_label",
              "order": 6,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "APPONE_REFERRALDETAILS_SCREEN_gender_helpText_label",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gender",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.common-masters",
              "systemDate": false,
              "enums": [
                {
                  "code": "OTHER",
                  "name": "OTHER"
                },
                {
                  "code": "FEMALE",
                  "name": "FEMALE"
                },
                {
                  "code": "MALE",
                  "name": "MALE"
                }
              ],
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_REFERRALDETAILS_SCREEN_gender_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "referralReason": {
              "type": "string",
              "label": "APPONE_REFERRALDETAILS_SCREEN_referralReason_label",
              "order": 7,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "APPONE_REFERRALDETAILS_SCREEN_referralReason_helpText_label",
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
                  "message": "APPONE_REFERRALDETAILS_SCREEN_referralReason_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {
                  "code": "DRUG_SE_CC",
                  "name": "Drug Side Effect from the current cycle"
                },
                {
                  "code": "DRUG_SE_PC",
                  "name": "Drug Side Effect from the previous cycle"
                },
                {
                  "code": "FEVER",
                  "name": "Fever"
                },
                {
                  "code": "SICK",
                  "name": "Sick"
                }
              ]
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "visibilityCondition": null,
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
              "navigateTo": {
                "name": "sideEffectFever",
                "type": "form"
              }
            },
            {
              "condition": "referralDetails.referralReason==SICK",
              "navigateTo": {
                "name": "sideEffectSick",
                "type": "form"
              }
            }
          ]
        },
        "sideEffectFromCurrentCycle": {
          "label": "Side effect from current cycle checklist",
          "order": 4.1,
          "type": "object",
          "format": null,
          "description": "APPONE_HFREFERALFLOW_DESCRIPTION",
          "actionLabel": "APPONE_HFREFERALFLOW_ACTION_BUTTON_LABEL",
          "properties": {
            "sideEffectQ1": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "Child evaluated for adverse reaction for SP and AQ",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sideEffectQ1",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "sideEffectQ2": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "The national Pharmacovigilance has been filled out?",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sideEffectQ2",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "sideEffectQ3": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "Was the child admitted / transferred to the hospital due to serious illness",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sideEffectQ3",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        },
        "sideEffectFromPreviousCycle": {
          "label": "Side effect from previous cycle checklist",
          "order": 4.2,
          "type": "object",
          "format": null,
          "description": "APPONE_HFREFERALFLOW_DESCRIPTION",
          "actionLabel": "APPONE_HFREFERALFLOW_ACTION_BUTTON_LABEL",
          "properties": {
            "sideEffectPQ1": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "Question first",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sideEffectPQ1",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "sideEffectPQ2": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "Question second",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sideEffectPQ2",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "sideEffectPQ3": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "Question third",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sideEffectPQ3",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        },
        "sideEffectFever": {
          "label": "Fever Checklist",
          "order": 4.3,
          "type": "object",
          "format": null,
          "description": "APPONE_HFREFERALFLOW_DESCRIPTION",
          "actionLabel": "APPONE_HFREFERALFLOW_ACTION_BUTTON_LABEL",
          "properties": {
            "feverQ1": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "Was the child tested for malaria?",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "feverQ1",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "feverQ2": {
              "type": "string",
              "enums": [
                {
                  "code": "POSITIVE",
                  "name": "Positive"
                },
                {
                  "code": "NEGATIVE",
                  "name": "Negative"
                }
              ],
              "label": "Result of malaria diagnostic test",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "feverQ2",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectFever.feverQ1==YES"
              }
            },
            "feverQ3": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "Child with negative malaria test received SPAQ in this Cycle",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "feverQ3",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectFever.feverQ2==NEGATIVE"
              }
            },
            "feverQ4": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "Was the child admitted/ transferred to the nearest hospital due to serious illness",
              "order": 4,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "feverQ4",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectFever.feverQ2==POSITIVE"
              }
            },
            "feverQ5": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "Child with positive malaria test treated with anti malarial",
              "order": 5,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "feverQ5",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectFever.feverQ2==POSITIVE"
              }
            },
            "feverQ6": {
              "type": "string",
              "label": "Description for yes",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "feverQ6",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectFever.feverQ5==YES"
              }
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        },
        "sideEffectSick": {
          "label": "APPONE_HFREFERALFLOW_SCREEN_HEADING",
          "order": 4.4,
          "type": "object",
          "format": null,
          "description": "APPONE_HFREFERALFLOW_DESCRIPTION",
          "actionLabel": "APPONE_HFREFERALFLOW_ACTION_BUTTON_LABEL",
          "properties": {
            "sickQ1": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "Child evaluated to determine the cause of illness",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sickQ1",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "sickQ4": {
              "type": "string",
              "label": "Enter comment for diagnosis",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sickQ4",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectSick.sickQ1==YES"
              }
            },
            "sickQ2": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "Was the child treated?",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sickQ2",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "sickQ5": {
              "type": "string",
              "label": "Name and dose of the drug",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sickQ5",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "sideEffectSick.sickQ2==YES"
              }
            },
            "sickQ3": {
              "type": "string",
              "enums": [
                {
                  "code": "YES",
                  "name": "Yes"
                },
                {
                  "code": "NO",
                  "name": "No"
                }
              ],
              "label": "Was the child admitted / transferred to the hospital due to serious illness",
              "order": 5,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "APPONE_HFREFERALFLOW_Adminstative_area_tooltip_label",
              "helpText": "APPONE_HFREFERALFLOW_Adminstative_area_helpText_label",
              "infoText": "",
              "readOnly": true,
              "fieldName": "sickQ3",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "APPONE_HFREFERALFLOW_Adminstative_area_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        }
      },
      "summary": null,
      "templates": {
        "SearchReferralReconciliations": {
          "label": "APPONE_HFREFERALFLOW_SEARCH_SCREEN_HEADING",
          "order": 1,
          "type": "template",
          "format": null,
          "description": "APPONE_HFREFERALFLOW_SEARCH_SCREEN_DESCRIPTION",
          "actionLabel": "",
          "properties": {
            "searchBar": {
              "type": "template",
              "label": "APPONE_HFREFERALFLOW_SEARCH_BAR",
              "order": 1,
              "value": "",
              "format": "searchBar",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "searchBar",
              "deleteFlag": false,
              "innerLabel": "enter the name of household",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required field cannot be empty"
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "PrimaryButton": {
              "type": "template",
              "label": "APPONE_HFREFERALFLOW_REGISTRATION_LABEL",
              "order": 2,
              "value": "",
              "format": "PrimaryButton",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "PrimaryButton",
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "SecondaryButton": {
              "type": "template",
              "label": "APPONE_HFREFERALFLOW_QR_LABEL",
              "order": 3,
              "value": true,
              "format": "SecondaryButton",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "SecondaryButton",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {
            "name": "facilityDetails",
            "type": "form"
          },
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        },
        "ReferralReconAcknowledgement": {
          "label": "APPONE_HFREFERALFLOW_ACKNOWLEDGEMENT_SCREEN_HEADING",
          "order": 5,
          "type": "template",
          "format": null,
          "description": "APPONE_HFREFERALFLOW_ACKNOWLEDGEMENT_SCREEN_DESCRIPTION",
          "actionLabel": "",
          "properties": {
            "AcknowledgementTitle": {
              "type": "template",
              "label": "HFREFERALFLOW_ACKNOWLEDGEMENT_TITLE",
              "order": 1,
              "value": "",
              "format": "AcknowledgementTitle",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "AcknowledgementTitle",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": false,
              "isMultiSelect": false,
              "includeInSummary": false
            },
            "AcknowledgementDescription": {
              "type": "template",
              "label": "HFREFERALFLOW_ACKNOWLEDGEMENT_DESCRIPTION",
              "order": 2,
              "value": "",
              "format": "AcknowledgementDescription",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "AcknowledgementDescription",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": false
            },
            "PrimaryButton": {
              "type": "template",
              "label": "HFREFERALFLOW_ACKNOWLEDGEMENT_PRIMARY_LABEL",
              "order": 3,
              "value": "",
              "format": "PrimaryButton",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "PrimaryButton",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": false,
              "isMultiSelect": false,
              "includeInSummary": false
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {
            "name": "SearchReferralReconciliations",
            "type": "template"
          },
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        }
      }
    },
    "currentVersion": 1,
    "previousVersion": 1
  },
  "REGISTRATIONFLOW": {
    "data": {
      "name": "REGISTRATIONFLOW",
      "version": 3,
      "pages": {
        "beneficiaryLocation": {
          "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_HEADING",
          "order": 2,
          "type": "object",
          "format": null,
          "description": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_DESCRIPTION",
          "actionLabel": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_ACTION_BUTTON_LABEL_1",
          "properties": {
            "administrativeArea": {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_administrativeArea",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_administrativeArea_helpText",
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "latLng": {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_latlong",
              "order": 2,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_latlong_helpText",
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "addressLine1": {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_addressLine1",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": true,
              "tooltip": "",
              "helpText": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_addressLine1_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "addressLine1",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "addressLine2": {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_addressLine2",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": true,
              "tooltip": "",
              "helpText": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_addressLine2_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "addressLine2",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "landmark": {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_landmark",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": true,
              "tooltip": "",
              "helpText": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_landmark_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "landmark",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "pincode": {
              "type": "integer",
              "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_pincode",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": true,
              "tooltip": "",
              "helpText": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_pincode_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "pincode",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "typeOfAddress": {
              "type": "string",
              "enums": [
                {
                  "code": "PERMANENT",
                  "name": "PERMANENT"
                },
                {
                  "code": "CORRESPONDENCE",
                  "name": "CORRESPONDENCE"
                },
                {
                  "code": "OTHER",
                  "name": "OTHER"
                }
              ],
              "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_typeOfAddress",
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
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {
            "name": "householdDetails",
            "type": "form"
          },
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        },
        "householdDetails": {
          "label": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_HEADING",
          "order": 3,
          "type": "object",
          "format": null,
          "description": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_DESCRIPTION",
          "actionLabel": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_ACTION_BUTTON_LABEL_1",
          "properties": {
            "dateOfRegistration": {
              "type": "integer",
              "label": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_dateOfRegistration",
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "childrenCount": {
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "pregnantWomenCount": {
              "type": "integer",
              "label": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_pregnantWomenCount",
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "memberCount": {
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
                {
                  "type": "required",
                  "value": true,
                  "message": ""
                },
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {
            "name": "beneficiaryDetails",
            "type": "form"
          },
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        },
        "beneficiaryDetails": {
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING",
          "order": 4,
          "type": "object",
          "format": null,
          "description": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_DESCRIPTION",
          "actionLabel": "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_1",
          "properties": {
            "nameOfIndividual": {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_tooltip",
              "helpText": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText",
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "isHeadOfFamily": {
              "type": "boolean",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_isHeadOfFamily",
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "identifiers": {
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true,
              "enums": [
                {
                  "code": "UNIQUE_BENEFICIARY_ID",
                  "name": "UNIQUE_BENEFICIARY_ID"
                },
                {
                  "code": "DEFAULT",
                  "name": "DEFAULT"
                },
                {
                  "code": "PAN",
                  "name": "PAN"
                },
                {
                  "code": "AADHAAR",
                  "name": "AADHAAR"
                }
              ]
            },
            "dobPicker": {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker",
              "order": 4,
              "value": "",
              "format": "dob",
              "hidden": false,
              "tooltip": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_tooltip",
              "helpText": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "dobPicker",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "gender": {
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true,
              "enums": [
                {
                  "code": "OTHER",
                  "name": "OTHER"
                },
                {
                  "code": "FEMALE",
                  "name": "FEMALE"
                },
                {
                  "code": "MALE",
                  "name": "MALE"
                }
              ]
            },
            "phone": {
              "type": "integer",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_tooltip",
              "helpText": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "phone",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "scanner": {
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {
            "name": "beneficiary-details",
            "type": "template"
          },
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        }
      },
      "summary": true,
      "templates": {
        "SearchBeneficiary": {
          "label": "APPONE_REGISTRATION_BENEFICIARY_SEARCH_SCREEN_HEADING",
          "order": 1,
          "type": "template",
          "format": null,
          "description": "APPONE_REGISTRATION_BENEFICIARY_SEARCH_SCREEN_DESCRIPTION",
          "actionLabel": "",
          "properties": {
            "searchByProximity": {
              "type": "template",
              "label": "APPONE_REGISTRATION_BENEFICIARY_SEARCH_BY_PROXIMITY",
              "order": 1,
              "value": true,
              "format": "searchByProximity",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "searchByProximity",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "searchBar": {
              "type": "template",
              "label": "APPONE_REGISTRATION_BENEFICIARY_SEARCH_BAR",
              "order": 2,
              "value": "",
              "format": "searchBar",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "searchBar",
              "deleteFlag": false,
              "innerLabel": "enter the name of household",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required field cannot be empty"
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "filter": {
              "type": "template",
              "label": "APPONE_REGISTRATION_BENEFICIARY_FILTER_LABEL",
              "order": 3,
              "value": [],
              "format": "filter",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "filter",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "PrimaryButton": {
              "type": "template",
              "label": "APPONE_REGISTRATION_BENEFICIARY_REGISTRATION_LABEL",
              "order": 4,
              "value": "",
              "format": "PrimaryButton",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "PrimaryButton",
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
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "SecondaryButton": {
              "type": "template",
              "label": "APPONE_REGISTRATION_BENEFICIARY_QR_LABEL",
              "order": 5,
              "value": true,
              "format": "SecondaryButton",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "SecondaryButton",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {},
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        },
        "HouseholdOverview": {
          "label": "APPONE_REGISTRATION_OVERVIEW_SCREEN_HEADING",
          "order": 5,
          "type": "template",
          "format": null,
          "description": "APPONE_REGISTRATION_BENEFICIARY_OVERVIEW_SCREEN_DESCRIPTION",
          "actionLabel": "",
          "properties": {
            "editHousehold": {
              "type": "template",
              "label": "EDIT_HOUSEHOLD",
              "order": 1,
              "value": true,
              "format": "editHousehold",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "editHousehold",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "DetailsCard": {
              "type": "template",
              "enums": [
                {
                  "code": "Individual.name",
                  "name": "name",
                  "fieldKey": "name",
                  "jsonPath": "Individual.name.givenName",
                  "mandatory": "false"
                },
                {
                  "code": "Household.locality",
                  "name": "locality",
                  "fieldKey": "locality",
                  "jsonPath": "Household.address.locality.code",
                  "mandatory": "false"
                },
                {
                  "code": "Household.noOfMembers",
                  "name": "noOfMembers",
                  "fieldKey": "memberCount",
                  "jsonPath": "Household.memberCount",
                  "mandatory": "true"
                }
              ],
              "label": " ",
              "order": 2,
              "value": "",
              "format": "DetailsCard",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "DetailsCard",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "editIndividual": {
              "type": "template",
              "label": "EDIT_INDIVIDUAL",
              "order": 3,
              "value": "",
              "format": "editIndividual",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "editIndividual",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "addMember": {
              "type": "template",
              "label": "ADD_MEMBER",
              "order": 4,
              "value": [],
              "format": "addMember",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "addMember",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "IndividualDeliverySecondaryButton": {
              "type": "template",
              "label": "UNABLE_TO_DELIVER",
              "order": 5,
              "value": true,
              "format": "IndividualDeliverySecondaryButton",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "IndividualDeliverySecondaryButton",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            "IndividualDeliveryPrimaryButton": {
              "type": "template",
              "label": "DELIVERY_DETAILS_LABEL",
              "order": 6,
              "value": "",
              "format": "IndividualDeliveryPrimaryButton",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "IndividualDeliveryPrimaryButton",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {},
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        }
      }
    },
    "currentVersion": 3,
    "previousVersion": 3
  },
  "DELIVERYFLOW": {
    "data": {
      "name": "DELIVERYFLOW",
      "version": 1,
      "pages": {
        "DeliveryDetails": {
          "label": "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_HEADING",
          "order": 2,
          "type": "object",
          "format": null,
          "description": "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_DESCRIPTION",
          "actionLabel": "APPONE_REGISTRATION_DELIVERYDETAILS_ACTION_BUTTON_LABEL_1",
          "properties": {
            "dateOfRegistration": {
              "type": "integer",
              "label": "APPONE_REGISTRATION_DELIVERYDETAILS_label_dateOfDelivery",
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
              "isMultiSelect": false
            },
            "resourceCard": {
              "type": "dynamic",
              "enums": [
                {
                  "code": "SP1",
                  "name": "SP1"
                },
                {
                  "code": "SP2",
                  "name": "SP2"
                },
                {
                  "code": "AQ1",
                  "name": "AQ1"
                },
                {
                  "code": "AQ2",
                  "name": "AQ2"
                }
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
              "isMultiSelect": false
            },
            "deliveryComment": {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_deliveryComments",
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
              "isMultiSelect": false,
              "enums": [
                {
                  "code": "BENEFICIARY_ABSENT",
                  "name": "Beneficiary Absent"
                },
                {
                  "code": "BENEFICIARY_REFUSED",
                  "name": "Beneficiary Refused"
                },
                {
                  "code": "INSUFFICIENT_RESOURCES",
                  "name": "Insufficient Resources"
                },
                {
                  "code": "SUCCESSFUL_DELIVERY",
                  "name": "Delivery Successful"
                }
              ]
            },
            "scanner": {
              "type": "string",
              "label": "APPONE_REGISTRATION_DELIVERYDETAILS_label_scanner",
              "order": 4,
              "value": "",
              "format": "scanner",
              "hidden": true,
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
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": {
            "name": "household-aknowledgement",
            "type": "template"
          },
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        }
      },
      "summary": true,
      "templates": {
        "BeneficiaryDetails": {
          "label": "APPONE_REGISTRATION_BENEFICIARY_DETAILS_SCREEN_HEADING",
          "order": 1,
          "type": "template",
          "format": null,
          "description": "APPONE_REGISTRATION_BENEFICIARY_DETAILS_SCREEN_DESCRIPTION",
          "actionLabel": "",
          "properties": {
            "DetailsCard": {
              "type": "template",
              "enums": [
                {
                  "code": "Individual.name",
                  "name": "name",
                  "fieldKey": "name",
                  "jsonPath": "Individual.name.givenName",
                  "mandatory": "true"
                },
                {
                  "code": "Household.locality",
                  "name": "locality",
                  "fieldKey": "locality",
                  "jsonPath": "Household.address.locality.code",
                  "mandatory": "false"
                },
                {
                  "code": "Individual.name",
                  "name": "name",
                  "fieldKey": "name",
                  "jsonPath": "Individual.name.givenName",
                  "mandatory": "true"
                },
                {
                  "code": "Individual.dateOfBirth",
                  "name": "dateOfBirth",
                  "fieldKey": "dateOfBirth",
                  "jsonPath": "Individual.dateOfBirth",
                  "mandatory": "false"
                },
                {
                  "code": "Individual.identifierId",
                  "name": "identifierId",
                  "fieldKey": "identifierId",
                  "jsonPath": "Individual.identifiers[0].identifierId",
                  "mandatory": "false"
                }
              ],
              "label": "APPONE_REGISTRATION_BENEFICIARY_DETAILS_TITLE",
              "order": 1,
              "value": "",
              "format": "DetailsCard",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "DetailsCard",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "Table": {
              "type": "template",
              "enums": [
                {
                  "code": "Task.doseIndex",
                  "name": "doseIndex",
                  "fieldKey": "doseIndex",
                  "jsonPath": "Task.additionalFields",
                  "mandatory": "false",
                  "additionalField": "true"
                },
                {
                  "code": "Task.status",
                  "name": "deliveryStatus",
                  "fieldKey": "status",
                  "jsonPath": "Task.status",
                  "mandatory": "false"
                },
                {
                  "code": "Task.createdTime",
                  "name": "createdTime",
                  "fieldKey": "createdTime",
                  "jsonPath": "Task.auditDetails.createdTime",
                  "mandatory": "false"
                }
              ],
              "label": "BENEFICIARY_DETAILS_TABLE_HEADER",
              "order": 2,
              "value": "",
              "format": "Table",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "Table",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "PrimaryButton": {
              "type": "template",
              "label": "RECORD_DELIVERY_PRIMARY_LABEL",
              "order": 3,
              "value": "",
              "format": "PrimaryButton",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "PrimaryButton",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": null,
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        },
        "HouseholdAcknowledgement": {
          "label": "APPONE_REGISTRATION_HOUSEHOLD_ACKNOWLEDGEMENT_SCREEN_HEADING",
          "order": 3,
          "type": "template",
          "format": null,
          "description": "APPONE_REGISTRATION_HOUSEHOLD_ACKNOWLEDGEMENT_SCREEN_DESCRIPTION",
          "actionLabel": "",
          "properties": {
            "AcknowledgementTitle": {
              "type": "template",
              "label": "HOUSEHOLD_ACKNOWLEDGEMENT_TITLE",
              "order": 1,
              "value": "",
              "format": "AcknowledgementTitle",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "AcknowledgementTitle",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "AcknowledgementDescription": {
              "type": "template",
              "label": "HOUSEHOLD_ACKNOWLEDGEMENT_DESCRIPTION",
              "order": 2,
              "value": "",
              "format": "AcknowledgementDescription",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "AcknowledgementDescription",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "SecondaryButton": {
              "type": "template",
              "label": "HOUSEHOLD_ACKNOWLEDGEMENT_SECONDARY_LABEL",
              "order": 3,
              "value": true,
              "format": "SecondaryButton",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "SecondaryButton",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            "PrimaryButton": {
              "type": "template",
              "label": "HOUSEHOLD_ACKNOWLEDGEMENT_PRIMARY_LABEL",
              "order": 4,
              "value": "",
              "format": "PrimaryButton",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "PrimaryButton",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            }
          },
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
          "prefixText": null,
          "suffixText": null,
          "navigateTo": null,
          "visibilityCondition": null,
          "conditionalNavigateTo": null
        }
      }
    },
    "currentVersion": 1,
    "previousVersion": 1
  }
}
''';
