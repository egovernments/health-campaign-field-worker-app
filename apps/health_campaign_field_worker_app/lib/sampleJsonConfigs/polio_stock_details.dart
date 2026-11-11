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
        },
        {
          "icon": "MedicalServices",
          "type": "template",
          "format": "menu_card",
          "heading": "AEFI_STOCK_RECORD_FORMS_KITS_HEADING",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [],
                "name": "aefiFormsAndKits",
                "type": "FORM"
              }
            }
          ],
          "fieldName": "aefiFormsAndKitsMenuCard",
          "description": "AEFI_STOCK_RECORD_FORMS_KITS_DESCRIPTION"
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
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {"key": "projectId", "value": "{{singleton.selectedProject.id}}"}
            ],
            "name": "userAction",
            "awaitResults": true
          }
        }
      ],
      "wrapperConfig": {
        "rootEntity": "UserActionModel",
        "searchConfig": {
          "select": ["userAction"],
          "primary": "userAction"
        }
      }
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
              "order": 1,
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
                  "value": 1,
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
              "label": "POLIO_STOCK_TOTAL_MIXING_SYRINGES_LABEL",
              "order": 5,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_TOTAL_MIXING_SYRINGES_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "totalMixingSyringes",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "POLIO_STOCK_TOTAL_MIXING_SYRINGES_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 1,
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
              "label": "POLIO_STOCK_TOTAL_DILUENTS_ISSUED_LABEL",
              "order": 6,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_TOTAL_DILUENTS_ISSUED_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "totalDiluentsIssued",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "POLIO_STOCK_TOTAL_DILUENTS_ISSUED_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 1,
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
              "type": "integer",
              "label": "POLIO_STOCK_UNOPENED_USABLE_VIALS_RETURNED_LABEL",
              "order": 3,
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
              "label": "POLIO_STOCK_UNOPENED_SPOILT_VIALS_RETURNED_LABEL",
              "order": 5,
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
              "label": "POLIO_STOCK_TOTAL_RETURNED_LABEL",
              "order": 7,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_TOTAL_RETURNED_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "totalReturned",
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
              "computedValue": {
                "sources": [
                  "unopenedUsableVialsReturned",
                  "unopenedSpoiltVialsReturned"
                ],
                "operation": "sum"
              },
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "POLIO_STOCK_UNUSED_DILUENTS_RETURNED_LABEL",
              "order": 8,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_UNUSED_DILUENTS_RETURNED_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "unusedDiluentsReturned",
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
              "label": "POLIO_STOCK_SPOILED_DILUENTS_RETURNED_LABEL",
              "order": 9,
              "value": "",
              "format": "number",
              "hidden": false,
              "tooltip": "",
              "helpText": "POLIO_STOCK_SPOILED_DILUENTS_RETURNED_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "spoiledDiluentsReturned",
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
    },
    // Record AEFI Forms and Kits (story #2299, section F): pick the site,
    // then whether AEFI forms and kits (adrenaline) are available and used.
    // A Yes opens an optional count and, for "available", the matching
    // "used" question. Saved as a UserAction (form AEFI_FORMS_KITS) like the
    // vial records above.
    {
      "name": "aefiFormsAndKits",
      "order": 6,
      "pages": [
        {
          "page": "aefiStockLocation",
          "type": "object",
          "label": "AEFI_STOCK_LOCATION_HEADING",
          "order": 1,
          "description": "AEFI_STOCK_LOCATION_DESCRIPTION",
          "actionLabel": "AEFI_NEXT",
          "properties": [
            {
              "type": "string",
              "label": "AEFI_LOCATION_DATE_LABEL",
              "order": 1,
              "value": "",
              "format": "date",
              "readOnly": true,
              "required": false,
              "fieldName": "dateOfRecord",
              "mandatory": false,
              "systemDate": true,
              "validations": [],
              "includeInForm": true
            },
            {
              "type": "string",
              // Fallback options; replaced from MDMS on a published config.
              "enums": [
                {
                  "code": "TRANSIT_POST",
                  "name": "AEFI_LOCATION_TYPE_TRANSIT_POST"
                },
                {
                  "code": "OUTSIDE_HOUSEHOLD_PLACES",
                  "name": "AEFI_LOCATION_TYPE_OUTSIDE_HOUSEHOLD_PLACES"
                }
              ],
              "label": "AEFI_LOCATION_TYPE_LABEL",
              "order": 2,
              "value": "",
              "format": "dropdown",
              "isMdms": true,
              "required": true,
              "fieldName": "locationType",
              "mandatory": true,
              "schemaCode": "HCM.OUTSIDE_HOUSEHOLD_TYPES",
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "AEFI_LOCATION_TYPE_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "AEFI_LOCATION_TYPE_REQUIRED_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "dynamic",
              "enums": [],
              "label": "AEFI_LOCATION_NAME_LABEL",
              "order": 3,
              "value": "",
              "format": "custom",
              "required": true,
              // Own field name: custom builders are registered by field
              // name, and this one reads the aefiFormsAndKits schema.
              "fieldName": "aefiStockLocationName",
              "mandatory": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "AEFI_LOCATION_NAME_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "AEFI_LOCATION_NAME_REQUIRED_ERROR",
              "isMultiSelect": false,
              // Same sites as the AEFI case location: facilities of the
              // picked type in the selected boundary or its parent.
              "conditions": {
                "localDataSource": {
                  "select": ["facility", "address"],
                  "primary": "facility",
                  "resultModel": "facility",
                  "filters": [
                    {
                      "root": "facility",
                      "key": "usage",
                      "operation": "equals",
                      "value": "{{form.locationType}}"
                    },
                    {
                      "root": "address",
                      "key": "localityBoundaryCode",
                      "operation": "in",
                      "value": "{{singleton.boundaryAndParentCodes}}"
                    }
                  ],
                  "displayKey": ["name"],
                  "valueKey": "clientReferenceId",
                  "labelControl": "locationNameLabel"
                }
              }
            },
            {
              // Site name written by the dropdown.
              "type": "string",
              "label": "AEFI_LOCATION_NAME_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": true,
              "readOnly": true,
              "fieldName": "locationNameLabel",
              "mandatory": false,
              "validations": [],
              "includeInForm": true
            },
            {
              "type": "string",
              "label": "AEFI_STOCK_RECORDED_BY_LABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "required": false,
              "fieldName": "recordedBy",
              "mandatory": false,
              "validations": []
            }
          ]
        },
        {
          "page": "aefiFormsAndKitsDetails",
          "type": "object",
          "label": "AEFI_STOCK_RECORD_FORMS_KITS_HEADING",
          "order": 2,
          "description": "AEFI_STOCK_RECORD_FORMS_KITS_DESCRIPTION",
          "actionLabel": "AEFI_SUBMIT",
          // As in the prototype: a line between the forms and kits groups,
          // and the cards a Yes opens stacked close under their question.
          "conditions": {"showDividers": true, "dependentCards": "stacked"},
          "properties": [
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "AEFI_ENUM_YES"},
                {"code": "NO", "name": "AEFI_ENUM_NO"}
              ],
              "label": "AEFI_STOCK_FORM_AVAILABLE_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "required": true,
              "fieldName": "formAvailable",
              "mandatory": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "AEFI_STOCK_SELECT_YES_OR_NO"
                }
              ],
              "errorMessage": "AEFI_STOCK_SELECT_YES_OR_NO"
            },
            {
              "type": "integer",
              "label": "AEFI_STOCK_FORM_AVAILABLE_QTY_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "required": false,
              "fieldName": "formAvailableQty",
              "conditions": {"wrapInCard": true},
              "mandatory": false,
              "validations": [
                {
                  "type": "min",
                  "value": 1,
                  "message": "AEFI_STOCK_WHOLE_NUMBER_ERROR"
                }
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "aefiFormsAndKitsDetails.formAvailable=='YES'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "AEFI_ENUM_YES"},
                {"code": "NO", "name": "AEFI_ENUM_NO"}
              ],
              "label": "AEFI_STOCK_FORM_USED_LABEL",
              "order": 3,
              "value": "",
              "format": "radio",
              "required": true,
              "fieldName": "formUsed",
              "conditions": {"wrapInCard": true},
              "mandatory": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "AEFI_STOCK_SELECT_YES_OR_NO"
                }
              ],
              "errorMessage": "AEFI_STOCK_SELECT_YES_OR_NO",
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "aefiFormsAndKitsDetails.formAvailable=='YES'"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "AEFI_STOCK_FORM_USED_QTY_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "required": false,
              "fieldName": "formUsedQty",
              // Inside the "used" card, under its Yes / No.
              "conditions": {"wrapInCard": true, "nestIn": "formUsed"},
              "mandatory": false,
              "validations": [
                {
                  "type": "min",
                  "value": 1,
                  "message": "AEFI_STOCK_WHOLE_NUMBER_ERROR"
                }
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "aefiFormsAndKitsDetails.formUsed=='YES'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "AEFI_ENUM_YES"},
                {"code": "NO", "name": "AEFI_ENUM_NO"}
              ],
              "label": "AEFI_STOCK_KIT_AVAILABLE_LABEL",
              "order": 5,
              "value": "",
              "format": "radio",
              "required": true,
              "fieldName": "kitAvailable",
              "mandatory": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "AEFI_STOCK_SELECT_YES_OR_NO"
                }
              ],
              "errorMessage": "AEFI_STOCK_SELECT_YES_OR_NO"
            },
            {
              "type": "integer",
              "label": "AEFI_STOCK_KIT_AVAILABLE_QTY_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "required": false,
              "fieldName": "kitAvailableQty",
              "conditions": {"wrapInCard": true},
              "mandatory": false,
              "validations": [
                {
                  "type": "min",
                  "value": 1,
                  "message": "AEFI_STOCK_WHOLE_NUMBER_ERROR"
                }
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "aefiFormsAndKitsDetails.kitAvailable=='YES'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "AEFI_ENUM_YES"},
                {"code": "NO", "name": "AEFI_ENUM_NO"}
              ],
              "label": "AEFI_STOCK_KIT_USED_LABEL",
              "order": 7,
              "value": "",
              "format": "radio",
              "required": true,
              "fieldName": "kitUsed",
              "conditions": {"wrapInCard": true},
              "mandatory": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "AEFI_STOCK_SELECT_YES_OR_NO"
                }
              ],
              "errorMessage": "AEFI_STOCK_SELECT_YES_OR_NO",
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "aefiFormsAndKitsDetails.kitAvailable=='YES'"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "AEFI_STOCK_KIT_USED_QTY_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "required": false,
              "fieldName": "kitUsedQty",
              "conditions": {"wrapInCard": true, "nestIn": "kitUsed"},
              "mandatory": false,
              "validations": [
                {
                  "type": "min",
                  "value": 1,
                  "message": "AEFI_STOCK_WHOLE_NUMBER_ERROR"
                }
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "aefiFormsAndKitsDetails.kitUsed=='YES'"
                  }
                ]
              }
            }
          ]
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
            "configName": "aefiFormsAndKits"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "USERACTION",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "AEFI_STOCK_ERROR_RECORD"}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "name": "aefiFormsAndKitsSuccess",
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
          "label": "AEFI_STOCK_SUCCESS_HEADING",
          "format": "panelCard",
          "fieldName": "successCard",
          "properties": {"type": "success"},
          "description": "AEFI_STOCK_SUCCESS_DESCRIPTION",
          "primaryAction": {
            "type": "template",
            "label": "AEFI_STOCK_RECORD_AGAIN",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [],
                  "name": "aefiFormsAndKits",
                  "type": "FORM"
                }
              }
            ],
            "fieldName": "recordAgainButton"
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
      "name": "aefiFormsAndKitsSuccess",
      "order": 7,
      "footer": [],
      "header": [],
      "heading": "",
      "screenType": "TEMPLATE",
      "description": "",
      "initActions": []
    }
  ]
};
