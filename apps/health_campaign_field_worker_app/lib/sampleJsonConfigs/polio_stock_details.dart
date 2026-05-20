final dynamic samplePolioStockDetailsFlows = {
  "name": "STOCK",
  "initialPage": "vialDetailsMenu",
  "project": "POLIO",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "body": [
        {
          "icon": "FileUpload",
          "type": "template",
          "format": "menu_card",
          "heading": "POLIO_STOCK_RECORD_ISSUED_VIAL_HEADING",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {"data": [], "name": "issuedVials", "type": "FORM"}
            }
          ],
          "fieldName": "issuedMenuCard",
          "description": "POLIO_STOCK_RECORD_ISSUED_VIAL_DESCRIPTION"
        },
        {
          "icon": "Restore",
          "type": "template",
          "format": "menu_card",
          "heading": "POLIO_STOCK_RECORD_RETURNED_VIAL_HEADING",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [],
                "name": "returnedVials",
                "type": "FORM"
              }
            }
          ],
          "fieldName": "returnedMenuCard",
          "description": "POLIO_STOCK_RECORD_RETURNED_VIAL_DESCRIPTION"
        }
      ],
      "name": "vialDetailsMenu",
      "order": 1,
      "footer": [],
      "header": [
        {
          "label": "POLIO_STOCK_BACK_BUTTON_LABEL",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "HOME", "type": "HOME"}
            }
          ]
        }
      ],
      "heading": "POLIO_STOCK_VIAL_DETAILS_HEADING",
      "screenType": "TEMPLATE",
      "initActions": []
    },
    {
      "name": "issuedVials",
      "order": 2,
      "pages": [
        {
          "page": "issuedVialDetails",
          "type": "object",
          "label": "POLIO_STOCK_ISSUED_VIALS_HEADING",
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
              "label": "POLIO_STOCK_DETECTED_LOCATION_LABEL",
              "order": 0,
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
                  "message": "POLIO_STOCK_LOCATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "POLIO_STOCK_BATCH_LOT_NUMBER_LABEL",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_BATCH_LOT_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "batchLotNumber",
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
              "label": "POLIO_STOCK_UNOPENED_VIALS_RECEIVED_LABEL",
              "order": 2,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_UNOPENED_VIALS_RECEIVED_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "unopenedVialsReceived",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "POLIO_STOCK_UNOPENED_VIALS_RECEIVED_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "POLIO_STOCK_VALUE_MUST_BE_POSITIVE"
                },
                {
                  "type": "max",
                  "value": 1000000,
                  "message": "POLIO_STOCK_VALUE_TOO_LARGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "POLIO_STOCK_ADDITIONAL_UNOPENED_VIALS_RECEIVED_LABEL",
              "order": 3,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "POLIO_STOCK_ADDITIONAL_UNOPENED_VIALS_RECEIVED_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "additionalUnopenedVialsReceived",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "POLIO_STOCK_ADDITIONAL_UNOPENED_VIALS_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "POLIO_STOCK_VALUE_MUST_BE_POSITIVE"
                },
                {
                  "type": "max",
                  "value": 1000000,
                  "message": "POLIO_STOCK_VALUE_TOO_LARGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "POLIO_STOCK_TOTAL_VIALS_RECEIVED_FOR_DAY_LABEL",
              "order": 4,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_TOTAL_VIALS_RECEIVED_FOR_DAY_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "totalVialsReceivedForDay",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "POLIO_STOCK_TOTAL_VIALS_RECEIVED_FOR_DAY_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "POLIO_STOCK_VALUE_MUST_BE_POSITIVE"
                },
                {
                  "type": "max",
                  "value": 1000000,
                  "message": "POLIO_STOCK_VALUE_TOO_LARGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ],
          "systemDate": null,
          "actionLabel": "POLIO_STOCK_SUBMIT_BUTTON",
          "description": "POLIO_STOCK_ISSUED_VIALS_DESCRIPTION",
          "validations": null,
          "includeInForm": null,
          "isMultiSelect": null,
          "includeInSummary": null
        }
      ],
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
                "properties": {"message": "POLIO_STOCK_ERROR_FETCH_CONFIG"}
              }
            ],
            "configName": "polioIssuedVials"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "USERACTION",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "POLIO_STOCK_ERROR_RECORD_VIAL"}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "name": "issuedVialsSuccess",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "POLIO_STOCK_ERROR_NAVIGATION"}
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
    {
      "name": "returnedVials",
      "order": 3,
      "pages": [
        {
          "page": "returnedVialDetails",
          "type": "object",
          "label": "POLIO_STOCK_RETURNED_VIALS_HEADING",
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
              "label": "POLIO_STOCK_DETECTED_LOCATION_LABEL",
              "order": 0,
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
                  "message": "POLIO_STOCK_LOCATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "POLIO_STOCK_BATCH_LOT_NUMBER_LABEL",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_BATCH_LOT_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "batchLotNumber",
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
              "label": "POLIO_STOCK_UNOPENED_USABLE_VIALS_RETURNED_LABEL",
              "order": 2,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_UNOPENED_USABLE_VIALS_RETURNED_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "unopenedUsableVialsReturned",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "POLIO_STOCK_VALUE_MUST_BE_POSITIVE"
                },
                {
                  "type": "max",
                  "value": 1000000,
                  "message": "POLIO_STOCK_VALUE_TOO_LARGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "POLIO_STOCK_UNOPENED_USABLE_VIALS_RETRIEVED_LABEL",
              "order": 3,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "POLIO_STOCK_UNOPENED_USABLE_VIALS_RETRIEVED_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "unopenedUsableVialsRetrieved",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "POLIO_STOCK_VALUE_MUST_BE_POSITIVE"
                },
                {
                  "type": "max",
                  "value": 1000000,
                  "message": "POLIO_STOCK_VALUE_TOO_LARGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "POLIO_STOCK_UNOPENED_SPOILT_VIALS_RETURNED_LABEL",
              "order": 4,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_UNOPENED_SPOILT_VIALS_RETURNED_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "unopenedSpoiltVialsReturned",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "POLIO_STOCK_VALUE_MUST_BE_POSITIVE"
                },
                {
                  "type": "max",
                  "value": 1000000,
                  "message": "POLIO_STOCK_VALUE_TOO_LARGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "POLIO_STOCK_OPENED_VIALS_RETURNED_LABEL",
              "order": 5,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_OPENED_VIALS_RETURNED_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "openedVialsReturned",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "POLIO_STOCK_VALUE_MUST_BE_POSITIVE"
                },
                {
                  "type": "max",
                  "value": 1000000,
                  "message": "POLIO_STOCK_VALUE_TOO_LARGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "POLIO_STOCK_TOTAL_RETURNED_LABEL",
              "order": 6,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_TOTAL_RETURNED_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "totalReturned",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "POLIO_STOCK_TOTAL_RETURNED_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "POLIO_STOCK_VALUE_MUST_BE_POSITIVE"
                },
                {
                  "type": "max",
                  "value": 1000000,
                  "message": "POLIO_STOCK_VALUE_TOO_LARGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ],
          "systemDate": null,
          "actionLabel": "POLIO_STOCK_SUBMIT_BUTTON",
          "description": "POLIO_STOCK_RETURNED_VIALS_DESCRIPTION",
          "validations": null,
          "includeInForm": null,
          "isMultiSelect": null,
          "includeInSummary": null
        }
      ],
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
                "properties": {"message": "POLIO_STOCK_ERROR_FETCH_CONFIG"}
              }
            ],
            "configName": "polioReturnedVials"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "USERACTION",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "POLIO_STOCK_ERROR_RECORD_VIAL"}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "name": "returnedVialsSuccess",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "POLIO_STOCK_ERROR_NAVIGATION"}
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
    {
      "body": [
        {
          "type": "template",
          "label": "POLIO_STOCK_ISSUED_VIALS_SUCCESS_HEADING",
          "format": "panelCard",
          "fieldName": "successCard",
          "properties": {"type": "success"},
          "description": "POLIO_STOCK_ISSUED_VIALS_SUCCESS_DESCRIPTION",
          "primaryAction": {
            "type": "template",
            "label": "POLIO_STOCK_BACK_TO_MENU",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"name": "vialDetailsMenu", "type": "TEMPLATE"}
              }
            ],
            "fieldName": "backToMenuButton"
          },
          "secondaryAction": {
            "type": "template",
            "label": "POLIO_STOCK_BACK_TO_HOME",
            "onAction": [
              {
                "actionType": "BACK_NAVIGATION",
                "properties": {"name": "HOME", "type": "HOME"}
              }
            ],
            "fieldName": "backToHomeButton"
          }
        }
      ],
      "name": "issuedVialsSuccess",
      "order": 4,
      "footer": [],
      "header": [],
      "heading": "",
      "screenType": "TEMPLATE",
      "description": "",
      "initActions": []
    },
    {
      "body": [
        {
          "type": "template",
          "label": "POLIO_STOCK_RETURNED_VIALS_SUCCESS_HEADING",
          "format": "panelCard",
          "fieldName": "successCard",
          "properties": {"type": "success"},
          "description": "POLIO_STOCK_RETURNED_VIALS_SUCCESS_DESCRIPTION",
          "primaryAction": {
            "type": "template",
            "label": "POLIO_STOCK_BACK_TO_MENU",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"name": "vialDetailsMenu", "type": "TEMPLATE"}
              }
            ],
            "fieldName": "backToMenuButton"
          },
          "secondaryAction": {
            "type": "template",
            "label": "POLIO_STOCK_BACK_TO_HOME",
            "onAction": [
              {
                "actionType": "BACK_NAVIGATION",
                "properties": {"name": "HOME", "type": "HOME"}
              }
            ],
            "fieldName": "backToHomeButton"
          }
        }
      ],
      "name": "returnedVialsSuccess",
      "order": 5,
      "footer": [],
      "header": [],
      "heading": "",
      "screenType": "TEMPLATE",
      "description": "",
      "initActions": []
    }
  ]
};
