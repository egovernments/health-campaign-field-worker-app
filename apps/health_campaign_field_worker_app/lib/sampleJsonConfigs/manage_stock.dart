final dynamic sampleInventoryFlows = {
  "name": "INVENTORY",
  "initialPage": "manageStock",
  "project": "CMP-2026-02-25-000161",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "manageStock",
      "heading": "INVENTORY_MANAGE_STOCK_HEADING",
      "description": "INVENTORY_MANAGE_STOCK_DESCRIPTION",
      "header": [
        {
          "format": "backLink",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [
        {
          "format": "button",
          "label": "INVENTORY_VIEW_TRANSACTIONS_LABEL",
          "properties": {
            "type": "primary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "viewTransaction",
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "viewTransaction",
                "data": []
              }
            }
          ]
        }
      ],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "projectFacility",
            "awaitResults": true,
            "skipAccumulatedFilters": true,
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
          "select": ["projectFacility", "productVariant", "stock"]
        }
      },
      "body": [
        {
          "format": "menu_card",
          "heading": "INVENTORY_RECORD_STOCK_RECEIPT_HEADING",
          "description": "INVENTORY_RECORD_STOCK_RECEIPT_DESCRIPTION",
          "icon": "FileUpload",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "incomingTransactions",
                "data": []
              }
            }
            // {
            //   "actionType": "NAVIGATION",
            //   "properties": {
            //     "type": "FORM",
            //     "name": "RECORDSTOCK",
            //     "data": [
            //       {"key": "stockEntryType", "value": "RECEIPT"},
            //       {"key": "transactionType", "value": "RECEIVED"},
            //       {"key": "primaryRole", "value": "RECEIVER"},
            //       {"key": "secondaryRole", "value": "SENDER"},
            //       {
            //         "key": "mrnNumber",
            //         "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
            //       }
            //     ]
            //   }
            // }
          ]
        },
        {
          "format": "menu_card",
          "heading": "INVENTORY_RECORD_STOCK_ISSUED_HEADING",
          "description": "INVENTORY_RECORD_STOCK_ISSUED_DESCRIPTION",
          "icon": "FileDownload",
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "type": "SEARCH_EVENT",
                "name": "stockSearch",
                "primary": "stock",
                "select": ["stock"],
                "awaitResults": true,
                "skipAccumulatedFilters": true,
                "data": [
                  {
                    "key": "tenantId",
                    "value": "{{singleton.tenantId}}",
                    "operation": "equals",
                    "root": "stock"
                  }
                ]
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "RECORDSTOCK",
                "data": [
                  {"key": "stockEntryType", "value": "ISSUED"},
                  {"key": "transactionType", "value": "DISPATCHED"},
                  {"key": "primaryRole", "value": "SENDER"},
                  {"key": "secondaryRole", "value": "RECEIVER"},
                  {
                    "key": "mrnNumber",
                    "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
                  },
                  {
                    "key": "stockBalances",
                    "value": "{{fn:getAllStockBalances()}}"
                  }
                ]
              }
            }
          ]
        },
        {
          "format": "menu_card",
          "heading": "INVENTORY_STOCK_RETURNED_HEADING",
          "description": "INVENTORY_STOCK_RETURNED_DESCRIPTION",
          "icon": "Restore",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "RECORDSTOCK",
                "data": [
                  {"key": "stockEntryType", "value": "RETURNED"},
                  {"key": "transactionType", "value": "RECEIVED"},
                  {"key": "primaryRole", "value": "RECEIVER"},
                  {"key": "secondaryRole", "value": "SENDER"},
                  {
                    "key": "mrnNumber",
                    "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
                  }
                ]
              }
            }
          ]
        },
        {
          "format": "menu_card",
          "heading": "INVENTORY_STOCK_DAMAGED_HEADING",
          "visible": "{{fn:hasRole('WAREHOUSE_MANAGER')}} == false",
          "description": "INVENTORY_STOCK_DAMAGED_DESCRIPTION",
          "icon": "Store",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "RECORDSTOCK",
                "data": [
                  {"key": "stockEntryType", "value": "DAMAGED"},
                  {"key": "transactionType", "value": "DISPATCHED"},
                  {"key": "primaryRole", "value": "SENDER"},
                  {"key": "secondaryRole", "value": "RECEIVER"},
                  {
                    "key": "mrnNumber",
                    "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
                  }
                ]
              }
            }
          ]
        },
        {
          "format": "menu_card",
          "heading": "INVENTORY_STOCK_LOSS_HEADING",
          "description": "INVENTORY_STOCK_LOSS_DESCRIPTION",
          "icon": "Store",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "RECORDSTOCK",
                "data": [
                  {"key": "stockEntryType", "value": "LOSS"},
                  {"key": "transactionType", "value": "DISPATCHED"},
                  {"key": "primaryRole", "value": "SENDER"},
                  {"key": "secondaryRole", "value": "RECEIVER"},
                  {
                    "key": "mrnNumber",
                    "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
                  }
                ]
              }
            }
          ]
        },
        // {
          "format": "menu_card",
          "heading": "INVENTORY_RECORD_LESS_EXCESS_HEADING",
          "description": "INVENTORY_RECORD_LESS_EXCESS_DESCRIPTION",
          "icon": "Store",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "RECORDLESSEXCESS",
                "data": [
                  {"key": "stockEntryType", "value": "LESS_EXCESS"},
                  {"key": "transactionType", "value": "RECEIVED"},
                  {
                    "key": "mrnNumber",
                    "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
                  }
                ]
              }
            }
          ]
        },
        {
        //   "format": "menu_card",
        //   "heading": "INVENTORY_INCOMING_TRANSACTIONS_HEADING",
        //   "description": "INVENTORY_INCOMING_TRANSACTIONS_DESCRIPTION",
        //   "icon": "Inbox",
        //   "onAction": [
        //     {
        //       "actionType": "NAVIGATION",
        //       "properties": {
        //         "type": "TEMPLATE",
        //         "name": "incomingTransactions",
        //         "data": []
        //       }
        //     }
        //   ]
        // }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "scanStockReceipt",
      "heading": "INVENTORY_SCAN_STOCK_RECEIPT_HEADING",
      "description": "INVENTORY_SCAN_STOCK_RECEIPT_DESCRIPTION",
      "header": [
        {
          "format": "backLink",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "initActions": [
        {
          "actionType": "OPEN_SCANNER",
          "properties": {
            "scanType": "qr",
            "fieldName": "scannedMrn",
            "singleValue": true,
            "quantity": 1,
            "isGS1code": false,
            "onSuccess": [
              {
                "actionType": "SEARCH_EVENT",
                "properties": {
                  "type": "SEARCH_EVENT",
                  "name": "stock",
                  "awaitResults": true,
                  "data": [
                    {
                      "key": "additionalFields",
                      "value": "{{scannedMrn}}",
                      "operation": "contains"
                    }
                  ]
                }
              },
              {
                "actionType": "REVERSE_TRANSFORM",
                "properties": {
                  "configName": "stock",
                  "entityTypes": ["StockModel"]
                }
              },
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "FORM",
                  "name": "RECORDSTOCK",
                  "data": [
                    {"key": "stockEntryType", "value": "RECEIPT"},
                    {"key": "transactionType", "value": "RECEIVED"},
                    {"key": "primaryRole", "value": "RECEIVER"},
                    {"key": "secondaryRole", "value": "SENDER"},
                    {"key": "scannedMrn", "value": "577E-52D8-B4F8"},
                    {"key": "isEdit", "value": "true"},
                    {"key": "forceCreate", "value": "true"}
                  ]
                }
              }
            ]
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "ScanStockWrapper",
        "groupByType": true,
        "rootEntity": "StockModel",
        "filters": [],
        "relations": [
          {"name": "stock", "entity": "StockModel"}
        ],
        "searchConfig": {
          "primary": "stock",
          "select": ["stock"]
        }
      },
      "body": [
        {
          "format": "qrScanner",
          "label": "INVENTORY_SCAN_MRN_LABEL",
          "scanType": "qr",
          "fieldName": "scanPage.scannedMrn",
          "properties": {
            "type": "primary",
            "size": "large",
            "mainAxisSize": "max"
          },
          "onChange": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "type": "SEARCH_EVENT",
                "name": "stock",
                "data": [
                  {
                    "key": "additionalFields",
                    "value": "680C-E975-B27F",
                    "operation": "contains"
                  }
                ]
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "RECORDSTOCK",
                "data": [
                  {"key": "stockEntryType", "value": "RECEIPT"},
                  {"key": "transactionType", "value": "RECEIVED"},
                  {"key": "primaryRole", "value": "RECEIVER"},
                  {"key": "secondaryRole", "value": "SENDER"},
                  {
                    "key": "mrnNumber",
                    "value": "{{fn:generateUniqueMaterialNoteNumber()}}"
                  },
                  {"key": "scannedMrn", "value": "{{scanPage.scannedMrn}}"},
                  {"key": "prefillFromScan", "value": "true"}
                ]
              }
            }
          ]
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "RECORDSTOCK",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "projectFacility",
            "awaitResults": true,
            "skipAccumulatedFilters": true,
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
          "select": ["projectFacility", "productVariant", "stock"]
        }
      },
      "pages": [
        {
          "page": "warehouseDetails",
          "label": "APPONE_MANAGESTOCK_WAREHOUSE_SCREEN_HEADING",
          "order": 1,
          "type": "object",
          "description": "APPONE_MANAGESTOCK_WAREHOUSE_SCREEN_DESCRIPTION",
          "actionLabel": "APPONE_MANAGESTOCK_WAREHOUSE_ACTION_BUTTON_LABEL_1",
          "properties": [
            {
              "type": "integer",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_dateOfReceipt",
              "order": 1,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the date on which the stock was received",
              "infoText": "",
              "readOnly": true,
              "fieldName": "dateOfEntry",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "includeInForm": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_dateOfReceipt_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_administrativeArea",
              "order": 2,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select the administrative area of the warehouse",
              "infoText": "",
              "readOnly": false,
              "fieldName": "administrativeArea",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInForm": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_administrativeArea_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "dynamic",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityToWhich",
              "order": 3,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "Select the facility to which the stock is being sent",
              "infoText": "",
              "readOnly": false,
              "fieldName": "facilityToWhich",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityToWhich_mandatory_message"
                },
                {
                  "type": "facilityHierarchy",
                  "value": {
                    "hierarchyMapping": {
                      "State": {
                        "forReceipt": ["LGA Facility"],
                        "forIssue": ["LGA Facility"]
                      },
                      "LGA": {
                        "forReceipt": ["State Facility"],
                        "forIssue": ["Health Facility"]
                      },
                      "Health Facility": {
                        "forReceipt": ["LGA Facility"],
                        "forIssue": ["DELIVERY_TEAM"]
                      }
                    },
                    "useTransactionType": true
                  },
                  "message": ""
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "includeInForm": true,
              "enums": []
            },
            {
              "type": "string",
              "enums": [],
              "label": "APP_CONFIG_INVENTORY_warehouseDetails_teamCode_LABEL",
              "order": 4,
              "value": "",
              "format": "scanner",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "teamCode",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInSummary": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityToWhich_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": []
            }
          ],
          "navigateTo": {"name": "stockDetails", "type": "form"}
        },
        {
          "page": "stockDetails",
          "label": "APPONE_INVENTORY_STOCKDETAILS_SCREEN_HEADING",
          "order": 2,
          "type": "object",
          "format": null,
          "description": "APPONE_INVENTORY_STOCKDETAILS_SCREEN_DESCRIPTION",
          "actionLabel": "APPONE_INVENTORY_STOCKDETAILS_ACTION_BUTTON_LABEL",
          "properties": [
            {
              "type": "dynamic",
              "label": "APPONE_INVENTORY_PRODUCTDETAILS_LABEL",
              "order": 1,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select multiple products which are being recorded",
              "infoText": "",
              "readOnly": false,
              "fieldName": "productdetail",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.DELIVERY_COMMENT_OPTIONS_POPULATOR",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Product selection is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": true,
              "enums": []
            },
            {
              "type": "dynamic",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityFromWhich",
              "order": 2,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "Select the facility from which the stock is being received",
              "infoText": "",
              "readOnly": false,
              "fieldName": "facilityFromWhich",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityToWhich_mandatory_message"
                },
                {
                  "type": "notEqualTo",
                  "value": "warehouseDetails.facilityToWhich",
                  "message": "Facility from and to must be different"
                },
                {
                  "type": "facilityHierarchy",
                  "value": {
                    "hierarchyMapping": {
                      "State": {
                        "forReceipt": ["Central Facility"],
                        "forIssue": ["LGA Facility"]
                      },
                      "LGA": {
                        "forReceipt": ["State Facility"],
                        "forIssue": ["Health Facility"]
                      },
                      "Health Facility": {
                        "forReceipt": ["LGA Facility"],
                        "forIssue": ["DELIVERY_TEAM"]
                      }
                    },
                    "useTransactionType": true
                  },
                  "message": ""
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "includeInForm": true,
              "schemaCode": "HCM.FACILITY_OPTIONS_POPULATOR"
            },
            {
              "type": "string",
              "visibilityCondition": {
                "expression": [
                  {"condition": "stockDetails.facilityFromWhich==Delivery Team"}
                ]
              },
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_deliveryTeamCode",
              "order": 4,
              "value": "",
              "format": "scanner",
              "hidden": false,
              "tooltip": "",
              "helpText": "Scan Team Code",
              "infoText": "",
              "readOnly": false,
              "fieldName": "deliveryTeam",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityFromWhich_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": []
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_TRANSPORT_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select the type of transport used",
              "infoText": "",
              "readOnly": false,
              "fieldName": "transportType",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "BUS", "name": "Bus"},
                {"code": "TRUCK", "name": "Truck"}
              ]
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_VEHICLE_NUMBER_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the vehicle number",
              "infoText": "",
              "readOnly": false,
              "fieldName": "vehicleNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
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
          "navigateTo": {"name": "stockProductDetails", "type": "form"}
        },
        {
          "page": "stockProductDetails",
          "label": "APPONE_INVENTORY_PRODUCTDETAILS_SCREEN_HEADING",
          "order": 3,
          "type": "object",
          "format": null,
          "description": "APPONE_INVENTORY_PRODUCTDETAILS_SCREEN_DESCRIPTION",
          "actionLabel":
              "APPONE_INVENTORY_PRODUCTDETAILS_ACTION_BUTTON_LABEL_1",
          "multiEntityConfig": {
            "sourcePageKey": "stockDetails",
            "sourceFieldKey": "productdetail"
          },
          "properties": [
            {
              "type": "string",
              "label": "APPONE_INVENTORY_WAYBILL_LABEL",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the waybill number",
              "infoText": "",
              "readOnly": false,
              "fieldName": "wayBillNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": false,
                  "message": "Waybill number is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_BATCH_NUMBER_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the batch number",
              "infoText": "",
              "readOnly": false,
              "fieldName": "batchNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": false,
                  "message": "Batch number is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_EXPIRY_DATE_LABEL",
              "order": 3,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select the expiry date",
              "infoText": "",
              "readOnly": false,
              "fieldName": "expiryDate",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "visibilityCondition": {},
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Expiry date is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_QUANTITY_SENT_LABEL_01",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the quantity sent by the warehouse",
              "infoText": "",
              "readOnly": false,
              "fieldName": "quantitySent",
              "deleteFlag": false,
              "innerLabel": "",
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "navigation.stockEntryType == 'ISSUED'",
                    "type": "custom"
                  }
                ]
              },
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Quantity sent is required"
                },
                {
                  "type": "regex",
                  "value": r"^[0-9]+$",
                  "message": "Please enter a valid number"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_QUANTITY__LOSTLABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the quantity lost by the warehouse",
              "infoText": "",
              "readOnly": false,
              "fieldName": "quantityLost",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Quantity lost is required"
                },
                {
                  "type": "regex",
                  "value": r"^[0-9]+$",
                  "message": "Please enter a valid number"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "navigation.stockEntryType == 'LOSS'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_QUANTITY__DAMAGEDLABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the quantity damaged by the warehouse",
              "infoText": "",
              "readOnly": false,
              "fieldName": "quantityDamaged",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Quantity Damaged is required"
                },
                {
                  "type": "regex",
                  "value": r"^[0-9]+$",
                  "message": "Please enter a valid number"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "navigation.stockEntryType == 'DAMAGED'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_QUANTITY_RETURNED_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the actual quantity returned",
              "infoText": "",
              "readOnly": false,
              "fieldName": "quantityReturned",
              "deleteFlag": false,
              "innerLabel": "",
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "navigation.stockEntryType == 'RETURNED'",
                    "type": "custom"
                  }
                ]
              },
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Quantity received is required"
                },
                {
                  "type": "regex",
                  "value": r"^[0-9]+$",
                  "message": "Please enter a valid number"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_QUANTITY_RECEIVED_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the actual quantity received",
              "infoText": "",
              "readOnly": false,
              "fieldName": "quantityReceived",
              "deleteFlag": false,
              "innerLabel": "",
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "navigation.stockEntryType == 'RECEIPT'",
                    "type": "custom"
                  }
                ]
              },
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Quantity received is required"
                },
                {
                  "type": "regex",
                  "value": r"^[0-9]+$",
                  "message": "Please enter a valid number"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_INVENTORY_COMMENT_LABEL",
              "order": 9,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText": "Add comments if quantities differ",
              "infoText": "",
              "readOnly": false,
              "fieldName": "comment",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition":
                        "stockProductDetails.quantitySent!=stockProductDetails.quantityReceived"
                  }
                ]
              },
              "validations": [
                {
                  "type": "required",
                  "value": false,
                  "message": "Comment is required when quantities differ"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_scanResource",
              "order": 10,
              "value": "",
              "format": "scanner",
              "validations": [
                {"type": "isGS1", "value": true, "message": ""}
              ],
              "comparisonConfig": {
                "model": "stock",
                "extractKey": "scanResource",
                "extractFrom": "additionalFields",
                "filters": [
                  {
                    "key": "senderId",
                    "value": "{{navigation.facilityFromWhich}}",
                    "operation": "equals",
                    "switchOn": "{{navigation.stockEntryType}}",
                    "cases": {
                      "ISSUED": "{{navigation.facilityToWhich}}",
                      "DAMAGED": "{{navigation.facilityToWhich}}",
                      "LOSS": "{{navigation.facilityToWhich}}"
                    }
                  },
                  {
                    "key": "receiverId",
                    "value": "{{navigation.facilityToWhich}}",
                    "operation": "equals",
                    "switchOn": "{{navigation.stockEntryType}}",
                    "cases": {
                      "ISSUED": "{{navigation.facilityFromWhich}}",
                      "DAMAGED": "{{navigation.facilityFromWhich}}",
                      "LOSS": "{{navigation.facilityFromWhich}}"
                    }
                  }
                ],
                "errorMessage": "RESOURCES_ALREADY_SCANNED"
              },
              "hidden": false,
              "tooltip": "",
              "helpText": "Scan Resource",
              "infoText": "",
              "readOnly": false,
              "fieldName": "scanResource",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": []
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
          "navigateTo": {"name": "stock-acknowledgement", "type": "template"}
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "stock",
            "data": [
              {
                "key": "stockEntryType",
                "value": "{{navigation.stockEntryType}}"
              },
              {
                "key": "transactionType",
                "value": "{{navigation.transactionType}}"
              },
              {"key": "primaryRole", "value": "{{navigation.primaryRole}}"},
              {"key": "secondaryRole", "value": "{{navigation.secondaryRole}}"},
              {
                "key": "secondaryType",
                "value":
                    "{{fn:getSecondaryType(stockDetails.facilityFromWhich)}}"
              },
              {"key": "mrnNumber", "value": "{{navigation.mrnNumber}}"}
            ],
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
            "entity": "STOCK",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to create stock."}
              }
            ]
          }
        },
        {
          "actionType": "UPDATE_STOCK_BALANCE",
          "properties": {
            "entity": "STOCK",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to update stock balance."}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "stockSuccess",
            "navigationMode": "popUntilAndPush",
            "popUntilPageName": "manageStock",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "data": [
              {"key": "mrnNumber", "value": "{{navigation.mrnNumber}}"}
            ]
          }
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "RECORDLESSEXCESS",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "projectFacility",
            "awaitResults": true,
            "skipAccumulatedFilters": true,
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
          "select": ["projectFacility", "productVariant", "stock"]
        }
      },
      "pages": [
        {
          "page": "warehouseDetails",
          "label": "APPONE_MANAGESTOCK_WAREHOUSE_SCREEN_HEADING",
          "order": 1,
          "type": "object",
          "description": "APPONE_MANAGESTOCK_WAREHOUSE_SCREEN_DESCRIPTION",
          "actionLabel": "APPONE_MANAGESTOCK_WAREHOUSE_ACTION_BUTTON_LABEL_1",
          "properties": [
            {
              "type": "integer",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_dateOfReceipt",
              "order": 1,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the date on which the stock was received",
              "infoText": "",
              "readOnly": true,
              "fieldName": "dateOfEntry",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "includeInForm": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_dateOfReceipt_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_administrativeArea",
              "order": 2,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select the administrative area of the warehouse",
              "infoText": "",
              "readOnly": false,
              "fieldName": "administrativeArea",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInForm": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_administrativeArea_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "dynamic",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityToWhich",
              "order": 3,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "Select the facility to which the stock is being sent",
              "infoText": "",
              "readOnly": false,
              "fieldName": "facilityToWhich",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityToWhich_mandatory_message"
                },
                {
                  "type": "facilityHierarchy",
                  "value": {
                    "hierarchyMapping": {
                      "State": {
                        "forReceipt": ["LGA Facility"],
                        "forIssue": ["LGA Facility"]
                      },
                      "LGA": {
                        "forReceipt": ["State Facility"],
                        "forIssue": ["Health Facility"]
                      },
                      "Health Facility": {
                        "forReceipt": ["LGA Facility"],
                        "forIssue": ["DELIVERY_TEAM"]
                      }
                    },
                    "useTransactionType": true
                  },
                  "message": ""
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "includeInForm": true,
              "enums": []
            },
            {
              "type": "string",
              "enums": [],
              "label": "APP_CONFIG_INVENTORY_warehouseDetails_teamCode_LABEL",
              "order": 4,
              "value": "",
              "format": "scanner",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "teamCode",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "includeInSummary": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityToWhich_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": []
            }
          ],
          "navigateTo": {"name": "lessExcessDetails", "type": "form"}
        },
        {
          "page": "lessExcessDetails",
          "label": "INVENTORY_LESS_EXCESS_DETAILS_HEADING",
          "order": 2,
          "type": "object",
          "format": null,
          "description": "INVENTORY_LESS_EXCESS_DETAILS_DESCRIPTION",
          "actionLabel": "CORE_COMMON_SUBMIT",
          "properties": [
            {
              "type": "string",
              "label": "INVENTORY_WHAT_ARE_YOU_RECORDING_LABEL",
              "order": 1,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select whether you are recording less or excess",
              "infoText": "",
              "readOnly": false,
              "fieldName": "recordType",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "INVENTORY_RECORD_TYPE_REQUIRED_MESSAGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "LESS", "name": "Less"},
                {"code": "EXCESS", "name": "Excess"}
              ]
            },
            {
              "type": "dynamic",
              "label": "APPONE_INVENTORY_PRODUCTDETAILS_LABEL",
              "order": 2,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select the product variant",
              "infoText": "",
              "readOnly": false,
              "fieldName": "productVariant",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.DELIVERY_COMMENT_OPTIONS_POPULATOR",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "INVENTORY_PRODUCT_VARIANT_REQUIRED_MESSAGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": []
            },
            {
              "type": "dynamic",
              "label": "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityFromWhich",
              "order": 3,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "Select the facility from which the stock is being received",
              "infoText": "",
              "readOnly": false,
              "fieldName": "facilityFromWhich",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_MANAGESTOCK_WAREHOUSE_label_facilityToWhich_mandatory_message"
                },
                {
                  "type": "facilityHierarchy",
                  "value": {
                    "hierarchyMapping": {
                      "State": {
                        "forReceipt": ["Central Facility"],
                        "forIssue": ["LGA Facility"]
                      },
                      "LGA": {
                        "forReceipt": ["State Facility"],
                        "forIssue": ["Health Facility"]
                      },
                      "Health Facility": {
                        "forReceipt": ["LGA Facility"],
                        "forIssue": ["DELIVERY_TEAM"]
                      }
                    },
                    "useTransactionType": true
                  },
                  "message": ""
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "includeInForm": true,
              "schemaCode": "HCM.FACILITY_OPTIONS_POPULATOR"
            },
            {
              "type": "string",
              "label": "INVENTORY_QUANTITY_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the quantity",
              "infoText": "",
              "readOnly": false,
              "fieldName": "quantity",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "INVENTORY_QUANTITY_REQUIRED_MESSAGE"
                },
                {
                  "type": "regex",
                  "value": r"^[0-9]+$",
                  "message": "Please enter a valid number"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "INVENTORY_REASON_FOR_LESS_EXCESS_LABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the reason for less/excess",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonForLessExcess",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "INVENTORY_REASON_REQUIRED_MESSAGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
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
          "navigateTo": {"name": "stock-acknowledgement", "type": "template"}
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "stockLessExcess",
            "data": [
              {
                "key": "stockEntryType",
                "value": "{{formData.lessExcessDetails.recordType}}"
              },
              {
                "key": "mrnNumber",
                "value": "{{navigation.mrnNumber}}"
              }
            ],
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
            "entity": "STOCK",
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
            "name": "stockSuccess",
            "navigationMode": "popUntilAndPush",
            "popUntilPageName": "manageStock",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "data": [
              {"key": "mrnNumber", "value": "{{navigation.mrnNumber}}"}
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "stockSuccess",
      "heading": "",
      "description": "",
      "body": [
        {
          "format": "panelCard",
          "label": "INVENTORY_STOCK_SUCCESS_LABEL",
          "description":
              "INVENTORY_STOCK_SUCCESS_MRN_DESCRIPTION {{navigation.mrnNumber}}",
          "additionalWidgets": [
            {
              "format": "qr_view",
              "data": "{{navigation.mrnNumber}}",
              "size": "medium",
              "errorCorrectionLevel": "M",
              "dataModuleColor": "black",
              "backgroundColor": "white",
              "padding": 16,
              "visible": "{{fn:hasRole('DISTRIBUTOR')}}"
            }
          ],
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "INVENTORY_VIEW_TRANSACTION_LABEL",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "TEMPLATE",
                  "name": "viewTransactionDetails",
                  "data": [
                    {
                      "key": "selectedStock",
                      "value": "{{navigation.mrnNumber}}"
                    }
                  ]
                }
              }
            ]
          },
          "secondaryAction": {
            "label": "INVENTORY_CREATE_NEW_TRANSACTION_LABEL",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "TEMPLATE",
                  "name": "manageStock",
                  "navigationMode": "popUntilAndReplace",
                  "popUntilPageName": "manageStock"
                }
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "viewTransaction",
      "heading": "INVENTORY_VIEW_TRANSACTION_HEADING",
      "description": "INVENTORY_VIEW_TRANSACTION_DESCRIPTION",
      "header": [
        {
          "format": "backLink",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "stock",
            "data": [
              {
                "key": "clientCreatedBy",
                "value": "{{singleton.loggedInUserUuid}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "ViewStockWrapper",
        "groupByType": true,
        "rootEntity": "StockModel",
        "groupBy": "additionalFields.fields.mrnNumber",
        "filters": [],
        "relations": [
          {
            "name": "stock",
            "entity": "StockModel",
            "match": {
              "field": "clientAuditDetails.createdBy",
              "equalsFrom": "{{singleton.loggedInUserUuid}}"
            }
          }
        ],
        "searchConfig": {
          "primary": "stock",
          "select": ["stock"],
          "orderBy": {"field": "clientCreatedTime", "order": "DESC"}
        }
      },
      "body": [
        {
          "format": "infoCard",
          "hidden": "{{fn:length(stock)}} < 0}}",
          "label": "INVENTORY_NO_TRANSACTIONS_LABEL",
          "description": "INVENTORY_NO_TRANSACTIONS_DESCRIPTION"
        },
        {
          "format": "listView",
          "hidden": "{{ context.stock.isEmpty }}",
          "fieldName": "listView",
          "dataSource": "StockModel",
          "child": {
            "format": "card",
            "children": [
              {
                "format": "row",
                "properties": {
                  "mainAxisAlignment": "spaceBetween",
                  "mainAxisSize": "max"
                },
                "children": [
                  {
                    "format": "tag",
                    "type": "",
                    "label": "INVENTORY_MRN_TAG_LABEL {{item.groupKey}}"
                  },
                  {
                    "format": "textTemplate",
                    "value":
                        "{{fn:formatDate(item.items[0].dateOfEntry, 'date', dd MMM yyyy)}}"
                  }
                ]
              },
              {
                "format": "row",
                "properties": {
                  "mainAxisAlignment": "spaceBetween",
                  "mainAxisSize": "max"
                },
                "children": [
                  {
                    "format": "column",
                    "properties": {
                      "mainAxisAlignment": "spaceBetween",
                      "mainAxisSize": "min"
                    },
                    "children": [
                      {
                        "format": "textTemplate",
                        "value":
                            "{{fn:getFirstPagePartyLabel(item.items[0].additionalFields.fields)}}"
                      },
                      {
                        "format": "textTemplate",
                        "value":
                            "{{fn:getFirstPageParty(item.items[0].additionalFields.fields, item.items[0].senderId, item.items[0].receiverId)}}"
                      }
                    ]
                  },
                  {
                    "format": "actionPopup",
                    "label": "INVENTORY_VIEW_QR_LABEL",
                    "properties": {
                      "type": "tertiary",
                      "size": "medium",
                      "mainAxisSize": "min",
                      "mainAxisAlignment": "start",
                      "popupConfig": {
                        "type": "default",
                        "title": "INVENTORY_QR_CODE_TITLE",
                        "titleIcon": "qr",
                        "showCloseButton": true,
                        "barrierDismissible": true,
                        "body": [
                          {
                            "format": "qr_view",
                            "data":
                                "{{item.items[0].additionalFields.fields.mrnNumber}}",
                            "size": "medium",
                            "errorCorrectionLevel": "M",
                            "dataModuleColor": "black",
                            "backgroundColor": "white",
                            "padding": 16
                          }
                        ],
                        "footerActions": []
                      }
                    },
                    "suffixIcon": "qr"
                  }
                ]
              },
              {
                "format": "listView",
                "fieldName": "groupedItems",
                "dataSource": "item.items",
                "child": {
                  "format": "textTemplate",
                  "value":
                      "{{item.additionalFields.fields.sku}}: {{item.quantity}}"
                }
              },
              {
                "format": "button",
                "label": "INVENTORY_SELECT_TRANSACTION_LABEL",
                "properties": {
                  "type": "primary",
                  "size": "large",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                },
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "type": "TEMPLATE",
                      "name": "viewTransactionDetails",
                      "navigationMode": "popUntilAndPush",
                      "popUntilPageName": "manageStock",
                      "data": [
                        {"key": "selectedStock", "value": "{{item.groupKey}}"}
                      ]
                    }
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "viewTransactionDetails",
      "heading": "INVENTORY_STOCK_RECEIPT_DETAILS_HEADING",
      "description": "",
      "header": [
        {
          "format": "backLink",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"type": "TEMPLATE", "name": "viewTransaction"}
            }
          ]
        }
      ],
      "footer": [],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "stock",
            "data": [
              {
                "key": "additionalFields",
                "value": "{{navigation.selectedStock}}",
                "operation": "contains"
              }
            ]
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "ViewStockDetailsWrapper",
        "groupByType": true,
        "rootEntity": "StockModel",
        "filters": [],
        "relations": [
          {"name": "stock", "entity": "StockModel"}
        ],
        "searchConfig": {
          "primary": "stock",
          "select": ["stock"]
        }
      },
      "body": [
        {
          "format": "listView",
          "fieldName": "stockItems",
          "dataSource": "StockModel",
          "child": {
            "format": "card",
            "children": [
              {
                "format": "labelPairList",
                "data": [
                  {
                    "key": "INVENTORY_RESOURCE_LABEL",
                    "value": "{{item.additionalFields.fields.sku}}"
                  },
                  {
                    "key": "INVENTORY_TRANSACTION_TYPE_LABEL",
                    "value": "{{item.transactionType}}"
                  },
                  {
                    "key":
                        "{{fn:getSecondPagePartyLabel(item.additionalFields.fields)}}",
                    "value":
                        "{{fn:getSecondPageParty(item.additionalFields.fields, item.senderId, item.receiverId)}}"
                  },
                  {
                    "key": "INVENTORY_MRN_NUMBER_LABEL",
                    "value": "{{item.additionalFields.fields.mrnNumber}}"
                  },
                  {
                    "key": "INVENTORY_WAYBILL_NUMBER_LABEL",
                    "value": "{{item.waybillNumber}}"
                  },
                  {
                    "key": "INVENTORY_BATCH_NUMBER_LABEL",
                    "value": "{{item.additionalFields.fields.batchNumber}}"
                  },
                  {
                    "key": "INVENTORY_EXPIRY_LABEL",
                    "value":
                        "{{fn:formatDate(item.additionalFields.fields.expiryDate, 'date', dd MMM yyyy)}}"
                  },
                  {
                    "key":
                        "{{fn:getQuantityLabel(item.additionalFields.fields.sku)}}",
                    "value": "{{item.quantity}}"
                  },
                  {
                    "key": "INVENTORY_COMMENTS_LABEL",
                    "value": "{{item.additionalFields.fields.comments}}"
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "incomingTransactions",
      "heading": "INVENTORY_INCOMING_TRANSACTIONS_HEADING",
      "description": "INVENTORY_INCOMING_TRANSACTIONS_DESCRIPTION",
      "header": [
        {
          "format": "backLink",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [],
      "initActions": [],
      "wrapperConfig": {
        "wrapperName": "IncomingStockWrapper",
        "groupByType": true,
        "rootEntity": "StockModel",
        "groupBy": "additionalFields.fields.mrnNumber",
        "filters": [],
        "relations": [
          {"name": "stock", "entity": "StockModel"}
        ],
        "searchConfig": {
          "primary": "stock",
          "select": ["stock"],
          "orderBy": {"field": "clientCreatedTime", "order": "DESC"}
        }
      },
      "body": [
        {
          "format": "dropdownTemplate",
          "fieldName": "selectedFacility",
          "label": "INVENTORY_SELECT_FACILITY_LABEL",
          "valueKey": "code",
          "displayKey": "name",
          "source": "{{fn:getProjectFacilities()}}",
          "onChange": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "type": "SEARCH_EVENT",
                "name": "stock",
                "awaitResults": true,
                "data": [
                  {
                    "key": "receiverId",
                    "value": "{{selectedFacility}}",
                    "operation": "equals"
                  },
                  {
                    "key": "auditCreatedBy",
                    "value": "{{singleton.loggedInUserUuid}}",
                    "operation": "notEquals"
                  },
                  {
                    "key": "additionalFields",
                    "value": "\"key\":\"status\"",
                    "operation": "notContains"
                  },
                  {
                    "key": "productVariantId",
                    "value": "{{fn:getProjectProductVariantIds()}}",
                    "operation": "in"
                  }
                ]
              }
            }
          ]
        },
        {
          "format": "infoCard",
          "hidden": "{{ context.stock.isNotEmpty }}",
          "label": "INVENTORY_NO_INCOMING_TRANSACTIONS_LABEL",
          "description": "INVENTORY_NO_INCOMING_TRANSACTIONS_DESCRIPTION"
        },
        {
          "format": "listView",
          "hidden": "{{ context.stock.isEmpty }}",
          "fieldName": "incomingList",
          "dataSource": "StockModel",
          "child": {
            "format": "card",
            "children": [
              {
                "format": "row",
                "properties": {
                  "mainAxisAlignment": "spaceBetween",
                  "mainAxisSize": "max"
                },
                "children": [
                  {
                    "format": "tag",
                    "type": "",
                    "label": "MRN {{item.groupKey}}"
                  },
                  {
                    "format": "textTemplate",
                    "value":
                        "{{fn:formatDate(item.items[0].dateOfEntry, 'date', dd MMM yyyy)}}"
                  }
                ]
              },
              {
                "format": "row",
                "properties": {
                  "mainAxisAlignment": "spaceBetween",
                  "mainAxisSize": "max"
                },
                "children": [
                  {
                    "format": "column",
                    "properties": {
                      "mainAxisAlignment": "spaceBetween",
                      "mainAxisSize": "min"
                    },
                    "children": [
                      {"format": "textTemplate", "value": "Sender"},
                      {
                        "format": "textTemplate",
                        "value":
                            "{{fn:getFacilityName(item.items[0].senderId)}}"
                      }
                    ]
                  },
                  {
                    "format": "tag",
                    "type":
                        "{{fn:getTransactionStatusType(item.items[0].transactionType)}}",
                    "label": "{{item.items[0].transactionType}}"
                  }
                ]
              },
              {
                "format": "listView",
                "fieldName": "groupedItems",
                "dataSource": "item.items",
                "child": {
                  "format": "textTemplate",
                  "value":
                      "{{item.additionalFields.fields.sku}}: {{item.quantity}}"
                }
              },
              {
                "format": "button",
                "label": "INVENTORY_ACKNOWLEDGE_RECEIPT_LABEL",
                "visible": "{{item.items[0].transactionType == 'DISPATCHED'}}",
                "properties": {
                  "type": "primary",
                  "size": "large",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                },
                "onAction": [
                  {
                    "actionType": "REVERSE_TRANSFORM",
                    "properties": {
                      "configName": "stock",
                      "entityTypes": ["StockModel"],
                      "sourceData": "item.items"
                    }
                  },
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "type": "FORM",
                      "name": "stockReceiptDetails",
                      "data": [
                        {"key": "stockEntryType", "value": "RECEIPT"},
                        {"key": "transactionType", "value": "RECEIVED"},
                        {"key": "primaryRole", "value": "RECEIVER"},
                        {"key": "secondaryRole", "value": "SENDER"},
                        {"key": "mrnNumber", "value": "{{item.groupKey}}"},
                        {"key": "isEdit", "value": "true"},
                        {"key": "prefillFromScan", "value": "true"},
                        {
                          "key": "senderFacilityId",
                          "value": "{{item.items[0].senderId}}"
                        },
                        {
                          "key": "quantity",
                          "value": "{{item.items[0].quantity}}"
                        },
                        {
                          "key": "wayBillNumber",
                          "value": "{{item.items[0].waybillNumber}}"
                        },
                        {
                          "key": "productVariantId",
                          "value": "{{item.items[0].productVariantId}}"
                        },
                        {
                          "key": "sku",
                          "value":
                              "{{item.items[0].additionalFields.fields.sku}}"
                        }
                      ]
                    }
                  }
                ]
              },
              {
                "format": "button",
                "label": "INVENTORY_VIEW_DETAILS_LABEL",
                "visible": "{{item.items[0].transactionType != 'DISPATCHED'}}",
                "properties": {
                  "type": "secondary",
                  "size": "large",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                },
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "type": "TEMPLATE",
                      "name": "viewTransactionDetails",
                      "data": [
                        {"key": "selectedStock", "value": "{{item.groupKey}}"}
                      ]
                    }
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "stockReceiptDetails",
      "heading": "INVENTORY_STOCK_RECEIPT_DETAILS_HEADING",
      "description": "",
      "version": 1,
      "header": [
        {
          "format": "backLink",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        },
        {"format": "helpLink", "label": "CORE_COMMON_HELP"}
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "stockReceipt",
            "forceCreate": true,
            "data": [
              {"key": "stockEntryType", "value": "RECEIPT"},
              {"key": "transactionType", "value": "RECEIVED"},
              {"key": "primaryRole", "value": "RECEIVER"},
              {"key": "secondaryRole", "value": "SENDER"},
              {"key": "mrnNumber", "value": "{{navigation.mrnNumber}}"},
              {
                "key": "senderFacilityId",
                "value": "{{navigation.senderFacilityId}}"
              },
              {
                "key": "productVariantId",
                "value": "{{navigation.productVariantId}}"
              },
              {"key": "userFacilityId", "value": "{{fn:getUserFacilityId()}}"},
              {"key": "sku", "value": "{{navigation.sku}}"}
            ],
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
            "entity": "STOCK",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to accept stock."}
              }
            ]
          }
        },
        {
          "actionType": "UPDATE_EVENT",
          "properties": {
            "source": "existingModels",
            "entity": "StockModel",
            "modify": [
              {
                "key": "StockModel.additionalFields.fields.status",
                "value": "accepted"
              }
            ]
          }
        },
        {
          "actionType": "UPDATE_STOCK_BALANCE",
          "properties": {
            "entity": "STOCK",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to update stock balance."}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "manageStock",
            "navigationMode": "popUntilAndReplace",
            "popUntilPageName": "manageStock"
          }
        }
      ],
      "onSecondaryAction": [
        {
          "actionType": "UPDATE_EVENT",
          "properties": {
            "entity": "StockModel",
            "modify": [
              {
                "key": "StockModel.additionalFields.fields.status",
                "value": "rejected"
              }
            ],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to reject stock."}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "manageStock",
            "navigationMode": "popUntilAndReplace",
            "popUntilPageName": "manageStock"
          }
        }
      ],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "stock",
            "awaitResults": true,
            "data": [
              {
                "key": "additionalFields",
                "value": "{{navigation.mrnNumber}}",
                "operation": "contains"
              }
            ]
          }
        },
      ],
      "wrapperConfig": {
        "wrapperName": "StockReceiptDetailsWrapper",
        "groupByType": false,
        "rootEntity": "StockModel",
        "filters": [],
        "relations": [
          {"name": "stock", "entity": "StockModel"}
        ],
        "searchConfig": {
          "primary": "stock",
          "select": ["stock"]
        }
      },
      "pages": [
        {
          "page": "stockReceiptDetails",
          "label": "INVENTORY_STOCK_RECEIPT_DETAILS_HEADING",
          "order": 1,
          "type": "object",
          "description": "",
          "actionLabel": "INVENTORY_ACCEPT_STOCK_LABEL",
          "secondaryActionLabel": "INVENTORY_DECLINE_STOCK_LABEL",
          "properties": [
            {
              "type": "string",
              "label": "INVENTORY_RESOURCE_LABEL",
              "order": 1,
              "value": "{{sku}}",
              "format": "text",
              "fieldName": "resource",
              "displayOnly": true
            },
            {
              "type": "string",
              "label": "INVENTORY_MATERIAL_ISSUE_NUMBER_LABEL",
              "order": 2,
              "value": "{{mrnNumber}}",
              "format": "text",
              "fieldName": "materialIssueNumber",
              "displayOnly": true
            },
            {
              "type": "string",
              "label": "INVENTORY_RECEIVED_FROM_LABEL",
              "order": 3,
              "value": "{{senderFacilityId}}",
              "format": "text",
              "fieldName": "receivedFrom",
              "displayOnly": true
            },
            {
              "type": "string",
              "label": "INVENTORY_WAYBILL_NUMBER_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter waybill number",
              "infoText": "",
              "readOnly": false,
              "fieldName": "wayBillNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "visibilityCondition": {},
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "INVENTORY_BATCH_NUMBER_LABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter batch number",
              "infoText": "",
              "readOnly": false,
              "fieldName": "batchNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "visibilityCondition": {},
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "INVENTORY_EXPIRY_LABEL",
              "order": 6,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select the expiry date",
              "infoText": "",
              "readOnly": false,
              "fieldName": "expiryDate",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "visibilityCondition": {},
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Expiry date is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "INVENTORY_QUANTITY_SENT_BY_WAREHOUSE_LABEL",
              "order": 7,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the quantity of blisters sent by warehouse",
              "infoText": "",
              "readOnly": false,
              "fieldName": "quantity",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "visibilityCondition": {},
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Quantity is required"
                },
                {
                  "type": "regex",
                  "value": r"^[0-9]+$",
                  "message": "Please enter a valid number"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            },
            {
              "type": "string",
              "label": "INVENTORY_COMMENTS_LABEL",
              "order": 8,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText": "Add any comments",
              "infoText": "",
              "readOnly": false,
              "fieldName": "comment",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "visibilityCondition": {},
              "validations": [
                {"type": "required", "value": false, "message": ""}
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": null
            }
          ]
        }
      ]
    }
  ]
};
