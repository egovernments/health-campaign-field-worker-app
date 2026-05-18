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
                  "type": "minLength",
                  "value": "3",
                  "message":
                      "CLOSEHOUSEHOLD_CLOSEHOUSEHOLDDETAILS_headName_MIN_LENGTH_ERROR"
                },
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
