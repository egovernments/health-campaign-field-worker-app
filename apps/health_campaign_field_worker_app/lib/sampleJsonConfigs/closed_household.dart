final dynamic sampleCloseHouseholdFlows = {
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
          "label": "Missed Children Details",
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
              "label": "Village name",
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
                  "message": "Required field can not be empty"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "GPS coordinate accuracy",
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
                  "message": "Required field can not be empty"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [],
              "label": "Household head name",
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
                      "Length must be 2 to 200 characters"
                },
                {
                  "type": "maxLength",
                  "value": "200",
                  "message":
                      "Length must be 2 to 200 characters"
                },
                {
                  "type": "required",
                  "value": true,
                  "message": "This is required field."
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "Scan Voucher",
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
            }
          ],
          "systemDate": null,
          "actionLabel": "Next",
          "description":
              "Make sure the village name matches the one where you are today. If not, click on the village dropdown on the top right corner to change it.",
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
                  "message": "Failed to fetch config."
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
                  "message": "Failed to create stock."
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
                  "message": "Navigation failed."
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
          "label": "Data recorded successfully",
          "format": "panelCard",
          "heading": "Data recorded successfully",
          "fieldName": "closeHouseholdSuccess",
          "mandatory": true,
          "properties": {
            "type": "success"
          },
          "description":
              "The data has been recorded successfully",
          "primaryAction": {
            "type": "template",
            "label": "Go Back",
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
