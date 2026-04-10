final dynamic samplePolioMissedChildrenFlows = {
  "name": "POLIO_MISSED_CHILDREN",
  "initialPage": "missedChildEntry",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ──────────────────────────────────────────────────────────
    // 1. missedChildEntry (FORM, order:1) — Missed Children Recording
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "FORM",
      "name": "missedChildEntry",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        // ── Missed Child Information ──
        {
          "page": "missedChildInfo",
          "label": "Record Missed Children",
          "order": 1,
          "type": "object",
          "description": "Record details of households with missed children",
          "actionLabel": "Submit",
          "properties": [
            {
              "type": "string",
              "label": "Head of Household Name",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the name of the head of household",
              "infoText": "",
              "readOnly": false,
              "fieldName": "headOfHouseholdName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Head of household name is required"
                },
                {
                  "type": "minLength",
                  "value": 2,
                  "message": "Name must be at least 2 characters"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "Village Name and Landmark",
              "order": 2,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "villageLandmark",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "Phone Number",
              "order": 3,
              "value": "",
              "format": "phone",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter phone number (optional)",
              "infoText": "",
              "readOnly": false,
              "fieldName": "phoneNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "Children not at home",
              "order": 4,
              "value": "1",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenMissedCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "isEditable": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Number of missed children is required"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "Value must be 0 or more"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "Reason child was not vaccinated",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "missingReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Reason for missing is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "NOBODY_AT_HOME", "name": "Nobody at home"},
                {"code": "CHILD_ABSENT", "name": "Child absent"},
                {"code": "REFUSAL", "name": "Refusal"}
              ]
            },
            {
              "type": "string",
              "label": "Reason for refusal (if applicable)",
              "order": 6,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "maxLength",
                  "value": 200,
                  "message": "Max 200 characters"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "showCondition": {
                "field": "missingReason",
                "equals": "REFUSAL"
              }
            },
            {
              "type": "integer",
              "label": "Revisit date",
              "order": 7,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "Default: Tomorrow",
              "infoText": "",
              "readOnly": false,
              "fieldName": "revisitDate",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "Outcome of revisit",
              "order": 8,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "revisitOutcome",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "ALREADY_VACCINATED", "name": "Already Vaccinated"},
                {"code": "VACCINATED_BY_TEAM", "name": "Vaccinated by the team"},
                {"code": "STILL_MISSING", "name": "Still missing"}
              ]
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
            "configName": "polioMissedChild",
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
                  "message": "Failed to record missed child."
                }
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "missedChildSuccess",
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
    // 2. missedChildSuccess (TEMPLATE, order:2)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "TEMPLATE",
      "name": "missedChildSuccess",
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
          "label": "Missed Child Recorded",
          "description": "The missed child entry has been recorded successfully",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "Add Another",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "FORM",
                  "name": "missedChildEntry"
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
