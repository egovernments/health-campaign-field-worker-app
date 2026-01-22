final dynamic inventoryReportFlows = {
  "name": "STOCKREPORTS",
  "initialPage": "viewReports",
  "order": 5,
  "project": "LLIN-mz",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "viewReports",
      "heading": "STOCKREPORTS_VIEW_REPORTS_HEADING",
      "description": "STOCKREPORTS_VIEW_REPORTS_DESCRIPTION",
      "header": [
        {
          "type": "template",
          "format": "backLink",
          "label": "STOCKREPORTS_VIEW_REPORTS_BACK_BUTTON_LABEL",
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
          "select": ["projectFacility", "facility", "productVariant"]
        }
      },
      "body": [
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_RECIEVE_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_RECIEVE_DESCRIPTION",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "receipt"},
                  {"key": "facilities", "value": "{{FacilityModel}}"},
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_ISSUED_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_ISSUED_DESCRIPTION",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "dispatch"},
                  {"key": "facilities", "value": "{{FacilityModel}}"},
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_RETURNED_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_RETURNED_DESCRIPTION",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "returned"},
                  {"key": "facilities", "value": "{{FacilityModel}}"},
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_DAMAGED_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_DAMAGED_DESCRIPTION",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "damage"},
                  {"key": "facilities", "value": "{{FacilityModel}}"},
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_LOSS_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_LOSS_DESCRIPTION",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "loss"},
                  {"key": "facilities", "value": "{{FacilityModel}}"},
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_RECON_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_RECON_DESCRIPTION",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reckonReportDetails",
                "data": [
                  {"key": "reportType", "value": "reconciliation"},
                  {"key": "facilities", "value": "{{FacilityModel}}"},
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "reportDetails",
      "heading": "STOCKREPORTS_REPORT_DETAILS_HEADING",
      "description": "STOCKREPORTS_REPORT_DETAILS_DESCRIPTION",
      "initActions": [],
      "wrapperConfig": {
        "wrapperName": "StockReportWrapper",
        "groupByType": true,
        "rootEntity": "Stock",
        "filters": [],
        "relations": [],
        "searchConfig": {
          "primary": "stock",
          "select": ["stock"]
        }
      },
      "header": [
        {
          "type": "template",
          "format": "backLink",
          "label": "STOCKREPORTS_REPORT_DETAILS_BACK_BUTTON_LABEL",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [
        {
          "type": "template",
          "format": "button",
          "label": "STOCKREPORTS_REPORT_DETAILS_SECONDARY_ACTION_LABEL",
          "properties": {
            "type": "secondary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"type": "HOME", "name": "HOME"}
            }
          ]
        }
      ],
      "body": [
        {
          "type": "template",
          "format": "card",
          "children": [
            {
              "type": "template",
              "format": "dropdownTemplate",
              "label": "STOCKREPORTS_REPORT_DETAILS_SELECT_WAREHOUSE_LABEL",
              "required": true,
              "key": "selectedFacility",
              "source": "{{navigation.facilities}}",
              "displayKey": "id",
              "valueKey": "id",
              "visible": "{{fn:hasRole('WAREHOUSE_MANAGER')}}",
              "onChange": [
                {
                  "actionType": "SEARCH_EVENT",
                  "properties": {
                    "type": "SEARCH_EVENT",
                    "name": "stock",
                    "data": [
                      {
                        "key": "tenantId",
                        "value": "{{singleton.selectedProject.tenantId}}",
                        "operation": "equals"
                      },
                      {
                        "key": "productVariantId",
                        "value": "{{selectedProduct}}",
                        "operation": "equals"
                      },
                      {
                        "key": "transactionType",
                        "value":
                            "{{fn:getTransactionType(navigation.reportType)}}",
                        "operation": "in"
                      },
                      {
                        "key":
                            "{{fn:getSenderOrReceiver(navigation.reportType)}}",
                        "value": "{{selectedFacility}}",
                        "operation": "equals"
                      }
                    ]
                  }
                }
              ]
            },
            {
              "type": "template",
              "format": "dropdownTemplate",
              "label": "STOCKREPORTS_REPORT_DETAILS_SELECT_PRODUCT_LABEL",
              "required": true,
              "key": "selectedProduct",
              "source": "{{navigation.productVariants}}",
              "displayKey": "sku",
              "valueKey": "id",
              "onChange": [
                {
                  "actionType": "SEARCH_EVENT",
                  "properties": {
                    "type": "SEARCH_EVENT",
                    "name": "stock",
                    "data": [
                      {
                        "key": "tenantId",
                        "value": "{{singleton.selectedProject.tenantId}}",
                        "operation": "equals"
                      },
                      {
                        "key": "productVariantId",
                        "value": "{{selectedProduct}}",
                        "operation": "equals"
                      },
                      {
                        "key": "transactionType",
                        "value":
                            "{{fn:getTransactionType(navigation.reportType)}}",
                        "operation": "in"
                      },
                      {
                        "key":
                            "{{fn:getSenderOrReceiver(navigation.reportType)}}",
                        "value": "{{selectedFacility}}",
                        "operation": "equals"
                      }
                    ]
                  }
                }
              ]
            }
          ]
        },
        {
          "type": "template",
          "format": "infoCard",
          "label": "STOCKRECON_REPORT_DETAILS_INFO_CARD_LABEL",
          "description": "STOCKRECON_REPORT_DETAILS_INFO_CARD_DESCRIPTION",
          "properties": {"type": "info"},
          "hidden": "{{ selectedFacility == null }}",
        },
        {
          "type": "template",
          "format": "infoCard",
          "label": "STOCKRECON_REPORT_DETAILS_NO_RECORD_FOUND_INFO",
          "description":
              "STOCKRECON_REPORT_DETAILS_NO_RECORD_FOUND_DESCRIPTION",
          "properties": {"type": "info"},
          "hidden": "{{ context.stock.notEmpty }}",
        },
        {
          "type": "template",
          "format": "table",
          "data": {
            "source": "StockModel",
            "columns": [
              {
                "header": "STOCKREPORTS_REPORT_DETAILS_TABLE_HEADER_1_LABEL",
                "cellValue":
                    "{{fn:formatDate(item.dateOfEntry, 'date', 'dd MMM yyyy')}}"
              },
              {
                "header": "STOCKREPORTS_REPORT_DETAILS_TABLE_HEADER_2_LABEL",
                "cellValue":
                    "{{fn:getAdditionalFieldValue(item.additionalFields.fields, 'mrnNumber')}}"
              },
              {
                "header": "STOCKREPORTS_REPORT_DETAILS_TABLE_HEADER_3_LABEL",
                "cellValue": "{{item.wayBillNumber}}"
              },
              {"header": "Quantity", "cellValue": "{{item.quantity}}"}
            ],
            "rows": "{{contextData.0.StockModel}}"
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "reckonReportDetails",
      "heading": "STOCKRECON_REPORT_DETAILS_HEADING",
      "description": "STOCKRECON_REPORT_DETAILS_DESCRIPTION",
      "initActions": [],
      "wrapperConfig": {
        "wrapperName": "StockReconciliationReportWrapper",
        "groupByType": true,
        "rootEntity": "StockReconciliation",
        "filters": [],
        "relations": [],
        "searchConfig": {
          "primary": "stockReconciliation",
          "select": ["stockReconciliation"]
        }
      },
      "header": [
        {
          "type": "template",
          "format": "backLink",
          "label": "STOCKRECON_REPORT_DETAILS_BACK_BUTTON_LABEL",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [
        {
          "type": "template",
          "format": "button",
          "label": "STOCKRECON_REPORT_DETAILS_SECONDARY_ACTION_LABEL",
          "properties": {
            "type": "secondary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "body": [
        {
          "type": "template",
          "format": "card",
          "children": [
            {
              "type": "template",
              "format": "dropdownTemplate",
              "label": "STOCKRECON_REPORT_DETAILS_SELECT_WAREHOUSE_LABEL",
              "required": true,
              "key": "selectedReconFacility",
              "source": "{{navigation.facilities}}",
              "displayKey": "id",
              "valueKey": "id",
              "visible": "{{fn:hasRole('WAREHOUSE_MANAGER')}}",
              "onChange": [
                {
                  "actionType": "SEARCH_EVENT",
                  "properties": {
                    "type": "SEARCH_EVENT",
                    "name": "stockReconciliation",
                    "data": [
                      {
                        "key": "tenantId",
                        "value": "{{singleton.selectedProject.tenantId}}",
                        "operation": "equals"
                      },
                      {
                        "key": "productVariantId",
                        "value": "{{selectedProduct}}",
                        "operation": "equals"
                      },
                      {
                        "key": "facilityId",
                        "value": "{{selectedFacility}}",
                        "operation": "equals"
                      }
                    ]
                  }
                }
              ]
            },
            {
              "type": "template",
              "format": "dropdownTemplate",
              "label": "STOCKRECONREPORTS_REPORT_DETAILS_SELECT_PRODUCT_LABEL",
              "required": true,
              "key": "selectedReckonProduct",
              "source": "{{navigation.productVariants}}",
              "displayKey": "sku",
              "valueKey": "id",
              "onChange": [
                {
                  "actionType": "SEARCH_EVENT",
                  "properties": {
                    "type": "SEARCH_EVENT",
                    "name": "stockReconciliation",
                    "data": [
                      {
                        "key": "tenantId",
                        "value": "{{singleton.selectedProject.tenantId}}",
                        "operation": "equals"
                      },
                      {
                        "key": "productVariantId",
                        "value": "{{selectedProduct}}",
                        "operation": "equals"
                      },
                      {
                        "key": "facilityId",
                        "value": "{{selectedFacility}}",
                        "operation": "equals"
                      }
                    ]
                  }
                }
              ]
            }
          ]
        },
        {
          "type": "template",
          "format": "infoCard",
          "label": "STOCKRECON_REPORT_DETAILS_INFO_CARD_LABEL",
          "description": "STOCKRECON_REPORT_DETAILS_INFO_CARD_DESCRIPTION",
          "properties": {"type": "info"},
          "visibilityCondition": {
            "expression": [
              {
                "condition":
                    "{{selectedFacility}} == null || {{selectedProduct}} == null",
                "type": "custom"
              }
            ]
          },
        },
        {
          "type": "template",
          "format": "infoCard",
          "label": "STOCKRECON_REPORT_DETAILS_NO_RECORD_FOUND_INFO",
          "description":
              "STOCKRECON_REPORT_DETAILS_NO_RECORD_FOUND_DESCRIPTION",
          "properties": {"type": "info"},
          "visibilityCondition": {
            "expression": [
              {
                "condition":
                    "{{stockReconciliation.length}} == 0 && {{selectedFacility}} != null && {{selectedProduct}} != null",
                "type": "custom"
              }
            ]
          },
        },
        {
          "type": "template",
          "format": "table",
          "data": {
            "source": "StockReconciliationModel",
            "columns": [
              {
                "header": "STOCKREPORTS_REPORT_DETAILS_TABLE_HEADER_1_LABEL",
                "cellValue":
                    "{{fn:formatDate(item.dateOfReconciliation, 'date', 'dd MMM yyyy')}}"
              },
              {"header": "Quantity", "cellValue": "{{item.calculatedCount}}"}
            ],
            "rows": "{{contextData.0.StockReconciliationModel}}"
          }
        }
      ]
    }
  ]
};
