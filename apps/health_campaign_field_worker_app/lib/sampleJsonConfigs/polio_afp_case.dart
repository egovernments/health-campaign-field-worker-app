final dynamic samplePolioAfpCaseFlows = {
  "name": "POLIO_AFP_CASE",
  "initialPage": "afpCaseEntry",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ──────────────────────────────────────────────────────────
    // 1. afpCaseEntry (FORM, order:1) — AFP Case Recording
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "FORM",
      "name": "afpCaseEntry",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        {
          "page": "afpCaseInfo",
          "label": "AFP Case Recording",
          "order": 1,
          "type": "object",
          "description": "Record AFP case details",
          "actionLabel": "Submit",
          "properties": [
            {
              "type": "string",
              "label": "Settlement",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "settlement",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "GPS Location",
              "order": 2,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "Capture GPS coordinates",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gps",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "GPS location is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "Capture Photo",
              "order": 3,
              "value": "",
              "format": "photo",
              "hidden": false,
              "tooltip": "",
              "helpText": "Take a photo for documentation",
              "infoText": "",
              "readOnly": false,
              "fieldName": "picture",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "Count of AFP Cases",
              "order": 4,
              "value": "1",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "isEditable": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "AFP case count is required"
                },
                {
                  "type": "min",
                  "value": 1,
                  "message": "Must be at least 1"
                }
              ],
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
            "configName": "polioAfpCase",
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
                  "message": "Failed to record AFP case."
                }
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "afpCaseSuccess",
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
    // 2. afpCaseSuccess (TEMPLATE, order:2)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "TEMPLATE",
      "name": "afpCaseSuccess",
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
          "label": "AFP Case Recorded Successfully",
          "description":
              "The AFP case has been recorded successfully",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "Add Another",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "FORM",
                  "name": "afpCaseEntry"
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
