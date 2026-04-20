final dynamic samplePolioStockDetailsFlows = {
  "name": "POLIO_STOCK_DETAILS",
  "initialPage": "stockEntry",
  "project": "POLIO-SIA",
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
          "label": "Vial Details",
          "order": 1,
          "type": "object",
          "description": "Enter vial details",
          "actionLabel": "Submit",
          "properties": [
            {
              "type": "string",
              "label": "Detected Location",
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
                  "message": "Location coordinates are required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "Batch/Lot Number",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Scan or type the batch/lot number",
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
                  "message": "Batch/Lot number is required"
                },
                {
                  "type": "minLength",
                  "value": 2,
                  "message": "Must be at least 2 characters"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "Expiry Date",
              "order": 2,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the expiry date from the label",
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
                  "message": "Expiry date is required"
                },
                {
                  "type": "startDate",
                  "value": "TODAY",
                  "message": "Expiry date must be a future date"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "VVM Status at Opening",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select VVM status",
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
                  "message": "VVM status is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "USABLE", "name": "Usable"},
                {"code": "UNUSABLE", "name": "Unusable"}
              ]
            },
            {
              "type": "string",
              "label": "Time of Opening",
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
                "properties": {"message": "Failed to fetch config."}
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
                "properties": {
                  "message": "Failed to record vial details."
                }
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
                "properties": {"message": "Navigation failed."}
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
          "label": "Vial Details Entered Successfully",
          "description":
              "The vial details have been recorded successfully",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "Add Another Vial",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "FORM",
                  "name": "stockEntry"
                }
              }
            ]
          },
          "secondaryAction": {
            "label": "Back to Home",
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
