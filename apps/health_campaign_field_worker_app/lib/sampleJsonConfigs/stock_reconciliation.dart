final dynamic stockReconciliationFlows = {
  "name": "STOCKRECONCILIATION",
  "initialPage": "stockReconciliationDetails",
  "order": 6,
  "project": "LLIN-mz",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "FORM",
      "name": "stockReconciliationDetails",
      "project": "LLIN-mz",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "projectFacility",
            "data": [
              {
                "key": "projectId",
                "value": "{{singleton.selectedProject.id}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "InventoryWrapper",
        "groupByType": true,
        "rootEntity": "ProjectFacilityModel",
        "filters": [],
        "relations": [
          {
            "name": "facility",
            "entity": "FacilityModel",
            "match": {"field": "id", "equalsFrom": "facilityId"}
          },
          {
            "name": "productVariant",
            "entity": "ProductVariantModel",
            "match": {"field": "id", "equalsFrom": "resource"}
          }
        ],
        "searchConfig": {
          "primary": "projectFacility",
          "select": ["projectFacility", "facility", "productVariant", "stock"]
        }
      },
      "pages": [
        {
          "page": "stockRecon",
          "label": "STOCKRECONCILIATION_STOCKRECONCILIATION_HEADING",
          "order": 1,
          "type": "object",
          "description": "STOCKRECONCILIATION_STOCKRECONCILIATION_DESCRIPTION",
          "actionLabel": "STOCKRECONCILIATION_STOCKRECONCILIATION_ACTION_LABEL",
          "properties": [
            {
              "type": "dynamic",
              "label":
                  "STOCKRECONCILIATION_STOCKRECONCILIATION_stockReconciliationCard_LABEL",
              "order": 1,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "STOCKRECONCILIATION_STOCKRECONCILIATION_stockReconciliationCard_HELP_TEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "stockReconciliationCard",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInForm": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "STOCKRECONCILIATION_STOCKRECONCILIATION_stockReconciliationCard_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": []
            },
            {
              "type": "integer",
              "label":
                  "STOCKRECONCILIATION_STOCKRECONCILIATION_manualCount_LABEL",
              "order": 2,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "STOCKRECONCILIATION_STOCKRECONCILIATION_manualCount_HELP_TEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "manualCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInForm": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "STOCKRECONCILIATION_STOCKRECONCILIATION_manualCount_REQUIRED_ERROR"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message":
                      "STOCKRECONCILIATION_STOCKRECONCILIATION_manualCount_MIN_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "",
              "order": 2,
              "value": 0,
              "format": "number",
              "hidden": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "stockInHand",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInForm": true,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "STOCKRECONCILIATION_STOCKRECONCILIATION_comments_LABEL",
              "order": 3,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "STOCKRECONCILIATION_STOCKRECONCILIATION_comments_HELP_TEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "comments",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInForm": true,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition":
                        "stockRecon.manualCount != stockRecon.stockInHand && stockRecon.stockReconciliationCard != ''",
                    "type": "custom"
                  },
                ]
              },
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
          "autoEnable": null,
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "stockReconciliation",
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
            "entity": "STOCK_RECONCILIATION",
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
            "name": "stockReconciliationSuccess",
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
      "name": "stockReconciliationSuccess",
      "heading": "",
      "description": "",
      "header": [],
      "footer": [],
      "initActions": [],
      "body": [
        {
          "type": "template",
          "format": "panelCard",
          "label": "STOCKRECONCILIATION_STOCKRECONCILIATIONSUCCESS_HEADING",
          "description":
              "STOCKRECONCILIATION_STOCKRECONCILIATIONSUCCESS_DESCRIPTION",
          "properties": {"type": "success"},
          "primaryAction": {
            "label":
                "STOCKRECONCILIATION_STOCKRECONCILIATIONSUCCESS_PRIMARY_ACTION_LABEL",
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
