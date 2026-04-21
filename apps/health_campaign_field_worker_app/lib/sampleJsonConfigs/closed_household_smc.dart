final dynamic sampleCloseHouseholdSmcFlows = {
  "name": "CLOSEHOUSEHOLD",
  "initialPage": "closeHouseholdRegistration",
  "order": 2,
  "active": true,
  "project": "MR-DN",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "name": "closeHouseholdRegistration",
      "screenType": "FORM",
      "version": 1,
      "category": "CLOSE_HOUSEHOLD",
      "disabled": false,
      "isSelected": true,
      "summary": true,
      "pages": [
        {
          "page": "closeHouseholdDetails",
          "type": "object",
          "label": "HCM_CLOSE_HOUSEHOLD_LABEL",
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
              "label": "HCM_CLOSE_HOUSEHOLD_VILLAGE_NAME_LABEL",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "administrativeArea",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "HCM_VALIDATION_REQUIRED_NOT_EMPTY"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "HCM_CLOSE_HOUSEHOLD_GPS_LABEL",
              "order": 2,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "latLng",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "HCM_VALIDATION_REQUIRED_NOT_EMPTY"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "includeInForm": true
            },
            {
              "type": "string",
              "enums": [],
              "label": "HCM_CLOSE_HOUSEHOLD_HEAD_NAME_LABEL",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "headName",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "minLength",
                  "value": "2",
                  "message":
                      "HCM_VALIDATION_LENGTH_2_TO_200"
                },
                {
                  "type": "maxLength",
                  "value": "200",
                  "message":
                      "HCM_VALIDATION_LENGTH_2_TO_200"
                },
                {
                  "type": "required",
                  "value": true,
                  "message": "HCM_VALIDATION_REQUIRED_FIELD_DOT"
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "HCM_CLOSE_HOUSEHOLD_SCAN_VOUCHER_LABEL",
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
              "isMultiSelect": false,
              "includeInSummary": true
            },
            // {
            //   "type": "string",
            //   "enums": [
            //     {"code": "ABSENT", "name": "HCM_CLOSE_HOUSEHOLD_REASON_ABSENT"},
            //     {"code": "REFUSAL", "name": "HCM_CLOSE_HOUSEHOLD_REASON_REFUSAL"},
            //     {"code": "NOT_VISITED", "name": "HCM_CLOSE_HOUSEHOLD_REASON_NOT_VISITED"},
            //     {"code": "HOUSE_NOT_REVISITED", "name": "HCM_CLOSE_HOUSEHOLD_REASON_HOUSE_NOT_REVISITED"},
            //     {"code": "ASLEEP", "name": "HCM_CLOSE_HOUSEHOLD_REASON_ASLEEP"},
            //     {"code": "CHILD_VACCINATED_IN_ROUTINE", "name": "HCM_CLOSE_HOUSEHOLD_REASON_CHILD_VACCINATED_ROUTINE"},
            //     {"code": "OTHER", "name": "HCM_COMMON_OTHER"}
            //   ],
            //   "label": "HCM_CLOSE_HOUSEHOLD_REASON_NOT_VACCINATED_LABEL",
            //   "order": 5,
            //   "value": "",
            //   "format": "dropdown",
            //   "hidden": false,
            //   "tooltip": "",
            //   "helpText": "",
            //   "infoText": "",
            //   "readOnly": false,
            //   "fieldName": "reasonNotVaccinated",
            //   "mandatory": true,
            //   "deleteFlag": false,
            //   "innerLabel": "",
            //   "systemDate": false,
            //   "validations": [
            //     {
            //       "type": "required",
            //       "value": true,
            //       "message": "HCM_VALIDATION_REQUIRED_NOT_EMPTY"
            //     }
            //   ],
            //   "errorMessage": "",
            //   "isMultiSelect": false
            // },
            // {
            //   "type": "string",
            //   "enums": [
            //     {"code": "PLAY_AREAS", "name": "HCM_CLOSE_HOUSEHOLD_WHERE_PLAY_AREAS"},
            //     {"code": "MARKET", "name": "HCM_CLOSE_HOUSEHOLD_WHERE_MARKET"},
            //     {"code": "SCHOOL", "name": "HCM_CLOSE_HOUSEHOLD_WHERE_SCHOOL"},
            //     {"code": "FARM", "name": "HCM_CLOSE_HOUSEHOLD_WHERE_FARM"},
            //     {"code": "SOCIAL_EVENT", "name": "HCM_CLOSE_HOUSEHOLD_WHERE_SOCIAL_EVENT"},
            //     {"code": "TRAVELLING", "name": "HCM_CLOSE_HOUSEHOLD_WHERE_TRAVELLING"},
            //     {"code": "PARENT_NOT_AT_HOME", "name": "HCM_CLOSE_HOUSEHOLD_WHERE_PARENT_NOT_HOME"}
            //   ],
            //   "label": "HCM_CLOSE_HOUSEHOLD_WHERE_WAS_CHILD_LABEL",
            //   "order": 6,
            //   "value": "",
            //   "format": "dropdown",
            //   "hidden": false,
            //   "tooltip": "",
            //   "helpText": "",
            //   "infoText": "",
            //   "readOnly": false,
            //   "fieldName": "whereWasChild",
            //   "mandatory": true,
            //   "deleteFlag": false,
            //   "innerLabel": "",
            //   "systemDate": false,
            //   "validations": [
            //     {
            //       "type": "required",
            //       "value": true,
            //       "message": "HCM_VALIDATION_REQUIRED_NOT_EMPTY"
            //     }
            //   ],
            //   "errorMessage": "",
            //   "isMultiSelect": false,
            //   "visibilityCondition": {
            //     "expression": [
            //       {"condition": "closeHouseholdDetails.reasonNotVaccinated=='ABSENT'"}
            //     ]
            //   }
            // },
            // {
            //   "type": "string",
            //   "enums": [
            //     {"code": "RELIGIOUS_BELIEFS", "name": "HCM_CLOSE_HOUSEHOLD_REFUSAL_RELIGIOUS"},
            //     {"code": "VACCINE_SIDE_EFFECTS", "name": "HCM_CLOSE_HOUSEHOLD_REFUSAL_SIDE_EFFECTS"},
            //     {"code": "TOO_MANY_DOSES", "name": "HCM_CLOSE_HOUSEHOLD_REFUSAL_TOO_MANY"},
            //     {"code": "CHILD_WAS_SICK", "name": "HCM_CLOSE_HOUSEHOLD_REFUSAL_CHILD_SICK"},
            //     {"code": "NOT_DECISION_MAKER", "name": "HCM_CLOSE_HOUSEHOLD_REFUSAL_NOT_DECISION_MAKER"},
            //     {"code": "AFRICA_IS_POLIO_FREE", "name": "HCM_CLOSE_HOUSEHOLD_REFUSAL_AFRICA_POLIO_FREE"},
            //     {"code": "CONCERNS_ABOUT_NOPV", "name": "HCM_CLOSE_HOUSEHOLD_REFUSAL_CONCERNS_NOPV"},
            //     {"code": "CONCERNS_ABOUT_COVID19", "name": "HCM_CLOSE_HOUSEHOLD_REFUSAL_CONCERNS_COVID"}
            //   ],
            //   "label": "HCM_CLOSE_HOUSEHOLD_REASON_REFUSAL_LABEL",
            //   "order": 7,
            //   "value": "",
            //   "format": "dropdown",
            //   "hidden": false,
            //   "tooltip": "",
            //   "helpText": "",
            //   "infoText": "",
            //   "readOnly": false,
            //   "fieldName": "reasonForRefusal",
            //   "mandatory": true,
            //   "deleteFlag": false,
            //   "innerLabel": "",
            //   "systemDate": false,
            //   "validations": [
            //     {
            //       "type": "required",
            //       "value": true,
            //       "message": "HCM_VALIDATION_REQUIRED_NOT_EMPTY"
            //     }
            //   ],
            //   "errorMessage": "",
            //   "isMultiSelect": false,
            //   "visibilityCondition": {
            //     "expression": [
            //       {"condition": "closeHouseholdDetails.reasonNotVaccinated=='REFUSAL'"}
            //     ]
            //   }
            // }
          ],
          "systemDate": null,
          "actionLabel": "HCM_COMMON_NEXT_BUTTON",
          "description":
              "HCM_CLOSE_HOUSEHOLD_DETAILS_DESCRIPTION",
          "validations": null,
          "includeInForm": null,
          "isMultiSelect": null,
          "includeInSummary": null
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
                "properties": {
                  "message": "HCM_ERROR_FETCH_CONFIG"
                }
              }
            ],
            "configName": "closeHouseholdRegistration"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "HOUSEHOLD, INDIVIDUAL, MEMBER, PROJECTBENEFICIARY",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {
                  "message": "HCM_ERROR_CREATE_STOCK"
                }
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "data": [],
            "name": "closeHouseholdSuccess",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {
                  "message": "HCM_ERROR_NAVIGATION"
                }
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
          "label": "HCM_CLOSE_HOUSEHOLD_SUCCESS_HEADING",
          "format": "panelCard",
          "heading": "HCM_CLOSE_HOUSEHOLD_SUCCESS_HEADING",
          "fieldName": "closeHouseholdSuccess",
          "mandatory": true,
          "properties": {
            "type": "success"
          },
          "description":
              "HCM_CLOSE_HOUSEHOLD_SUCCESS_DESCRIPTION",
          "primaryAction": {
            "type": "template",
            "label": "HCM_CLOSE_HOUSEHOLD_SUCCESS_GO_BACK_BUTTON",
            "format": "button",
            "hidden": false,
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "name": "Home",
                  "type": "HOME"
                }
              }
            ],
            "fieldName": "GoHome",
            "mandatory": true,
            "properties": {
              "type": "primary"
            }
          }
        }
      ],
      "name": "closeHouseholdSuccess",
      "footer": [],
      "header": [],
      "heading": "",
      "category": "CLOSE_HOUSEHOLD",
      "screenType": "TEMPLATE",
      "description": "",
      "initActions": []
    }
  ]
};
