final dynamic samplePolioStockDetailsFlows = {
  "name": "STOCK",
  "initialPage": "stockEntry",
  "project": "POLIO",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ──────────────────────────────────────────────────────────
    // 1. stockEntry (FORM, order:1) — Vial Details Entry
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "FORM",
      "name": "stockEntry",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        {
          "page": "vialDetails",
          "label": "POLIO_STOCK_VIAL_DETAILS_HEADING",
          "order": 1,
          "type": "object",
          "description": "POLIO_STOCK_ENTER_VIAL_DETAILS",
          "actionLabel": "POLIO_STOCK_SUBMIT_BUTTON",
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
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "POLIO_STOCK_BATCH_LOT_REQUIRED"
                },
                {
                  "type": "minLength",
                  "value": 2,
                  "message": "POLIO_STOCK_MIN_LENGTH_2"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "POLIO_STOCK_EXPIRY_DATE_LABEL",
              "order": 2,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_EXPIRY_DATE_HELPTEXT",
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
                  "message": "POLIO_STOCK_EXPIRY_DATE_REQUIRED"
                },
                {
                  "type": "startDate",
                  "value": "TODAY",
                  "message": "POLIO_STOCK_EXPIRY_DATE_FUTURE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "POLIO_STOCK_VVM_STATUS_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_VVM_STATUS_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "vvmStatus",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "POLIO_STOCK_VVM_STATUS_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "USABLE", "name": "POLIO_STOCK_VVM_USABLE"},
                {"code": "UNUSABLE", "name": "POLIO_STOCK_VVM_UNUSABLE"}
              ]
            },
            {
              "type": "string",
              "label": "POLIO_STOCK_TIME_OF_OPENING_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "timeOfOpening",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
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
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "polioStockDetails",
            "data": [],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "POLIO_STOCK_ERROR_FETCH_CONFIG"}
              }
            ]
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
            "type": "TEMPLATE",
            "name": "stockEntrySuccess",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "POLIO_STOCK_ERROR_NAVIGATION"}
              }
            ]
          }
        }
      ]
    },

    // ──────────────────────────────────────────────────────────
    // 2. stockEntrySuccess (TEMPLATE, order:2)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "TEMPLATE",
      "name": "stockEntrySuccess",
      "order": 2,
      "heading": "",
      "description": "",
      "header": [],
      "footer": [],
      "initActions": [],
      "body": [
        {
          "type": "template",
          "format": "panelCard",
          "fieldName": "successCard",
          "label": "POLIO_STOCK_SUCCESS_HEADING",
          "description": "POLIO_STOCK_SUCCESS_DESCRIPTION",
          "properties": {"type": "success"},
          "primaryAction": {
            "type": "template",
            "fieldName": "addAnotherVialButton",
            "label": "POLIO_STOCK_ADD_ANOTHER_VIAL",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"type": "FORM", "name": "stockEntry"}
              }
            ]
          },
          "secondaryAction": {
            "type": "template",
            "fieldName": "backToHomeButton",
            "label": "POLIO_STOCK_BACK_TO_HOME",
            "onAction": [
              {
                "actionType": "BACK_NAVIGATION",
                "properties": {"name": "HOME", "type": "HOME"}
              }
            ]
          }
        }
      ]
    }
  ]
};
