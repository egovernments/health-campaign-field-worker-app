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
                  {"key": "reportType", "value": "ISSUED"},
                  {
                    "key": "facilities",
                    "value": "{{fn:getCurrentFacilities(ProjectFacilityModel)}}"
                  },
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
                  {
                    "key": "facilities",
                    "value": "{{fn:getCurrentFacilities(ProjectFacilityModel)}}"
                  },
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
                  {
                    "key": "facilities",
                    "value": "{{fn:getCurrentFacilities(ProjectFacilityModel)}}"
                  },
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
          "visible": "{{fn:hasRole('WAREHOUSE_MANAGER')}} == false",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "damage"},
                  {
                    "key": "facilities",
                    "value": "{{fn:getCurrentFacilities(ProjectFacilityModel)}}"
                  },
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
                  {
                    "key": "facilities",
                    "value": "{{fn:getCurrentFacilities(ProjectFacilityModel)}}"
                  },
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_EXCESS_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_EXCESS_DESCRIPTION",
          "visible": "{{fn:hasRole('DISTRIBUTOR')}} == true",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "excess"},
                  {
                    "key": "facilities",
                    "value": "{{fn:getCurrentFacilities(ProjectFacilityModel)}}"
                  },
                  {"key": "productVariants", "value": "{{ProductVariantModel}}"}
                ]
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "menu_card",
          "heading": "STOCKREPORTS_VIEW_REPORTS_STOCK_LESS_HEADING",
          "description": "STOCKREPORTS_VIEW_REPORTS_STOCK_LESS_DESCRIPTION",
          "visible": "{{fn:hasRole('DISTRIBUTOR')}} == true",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "reportDetails",
                "data": [
                  {"key": "reportType", "value": "less"},
                  {
                    "key": "facilities",
                    "value": "{{fn:getCurrentFacilities(ProjectFacilityModel)}}"
                  },
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
                  {
                    "key": "facilities",
                    "value": "{{fn:getCurrentFacilities(ProjectFacilityModel)}}"
                  },
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
              "displayKey": "facilityId",
              "showWhenSingleOption": true,
              "valueKey": "facilityId",
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
                        "key": "additionalFields",
                        "value":
                            "{{fn:getStockEntryType(navigation.reportType)}}",
                        "operation": "contains"
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
                        "key": "additionalFields",
                        "value":
                            "{{fn:getStockEntryType(navigation.reportType)}}",
                        "operation": "contains"
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
          "label": "STOCK_REPORT_DETAILS_INFO_CARD_LABEL",
          "description": "STOCK_REPORT_DETAILS_INFO_CARD_DESCRIPTION",
          "properties": {"type": "info"},
          "visible":
              "{{fn:isEmpty(selectedFacility)}} && {{fn:isEmpty(selectedProduct)}}",
        },
        {
          "type": "template",
          "format": "infoCard",
          "label": "STOCK_REPORT_DETAILS_NO_RECORD_FOUND_INFO",
          "description": "STOCK_REPORT_DETAILS_NO_RECORD_FOUND_DESCRIPTION",
          "properties": {"type": "info"},
          "visible":
              "{{fn:isEmpty(stock)}} && {{fn:isNotEmpty(selectedFacility)}}",
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
                "header":
                    "STOCKREPORTS_REPORT_DETAILS_TABLE_HEADER_PRODUCT_LABEL",
                "cellValue":
                    "{{fn:getAdditionalFieldValue(item.additionalFields.fields, 'sku')}}"
              },
              {
                "header": "STOCKREPORTS_REPORT_DETAILS_TABLE_HEADER_2_LABEL",
                "cellValue":
                    "{{fn:getAdditionalFieldValue(item.additionalFields.fields, 'mrnNumber')}}"
              },
              {
                "header": "STOCKREPORTS_REPORT_DETAILS_TABLE_HEADER_3_LABEL",
                "cellValue": "{{item.waybillNumber}}"
              },
              {
                "header": "STOCKREPORTS_REPORT_DETAILS_TABLE_HEADER_4_LABEL",
                "cellValue": "{{item.quantity}}"
              }
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
                        "value": "{{selectedReckonProduct}}",
                        "operation": "equals"
                      },
                      {
                        "key": "facilityId",
                        "value": "{{selectedReconFacility}}",
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
                        "value": "{{selectedReckonProduct}}",
                        "operation": "equals"
                      },
                      {
                        "key": "facilityId",
                        "value": "{{selectedReconFacility}}",
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
          "visible":
              "{{fn:isNotEmpty(selectedReconFacility)}} && {{fn:isNotEmpty(selectedReckonProduct)}}",
        },
        {
          "type": "template",
          "format": "infoCard",
          "label": "STOCKRECON_REPORT_DETAILS_NO_RECORD_FOUND_INFO",
          "description":
              "STOCKRECON_REPORT_DETAILS_NO_RECORD_FOUND_DESCRIPTION",
          "properties": {"type": "info"},
          "visible":
              "{{fn:length(stockReconciliation)}} == 0 && {{fn:isNotEmpty(selectedReconFacility)}} && {{fn:isNotEmpty(selectedReckonProduct)}}"
        },
        {
          "type": "template",
          "format": "table",
          "data": {
            "source": "StockReconciliationModel",
            "columns": [
              {
                "header": "STOCKRECON_REPORT_DETAILS_TABLE_HEADER_1_LABEL",
                "cellValue":
                    "{{fn:formatDate(item.dateOfReconciliation, 'date', 'dd MMM yyyy')}}"
              },
              {
                "header": "STOCKRECON_REPORT_DETAILS_TABLE_HEADER_2_LABEL",
                "cellValue": "{{item.additionalFields.fields.stockReceived}}"
              },
              {
                "header": "STOCKRECON_REPORT_DETAILS_TABLE_HEADER_3_LABEL",
                "cellValue": "{{item.additionalFields.fields.stockIssued}}"
              },
              {
                "header": "STOCKRECON_REPORT_DETAILS_TABLE_HEADER_4_LABEL",
                "cellValue": "{{item.additionalFields.fields.stockReturned}}"
              },
              {
                "header": "STOCKRECON_REPORT_DETAILS_TABLE_HEADER_5_LABEL",
                "cellValue": "{{item.additionalFields.fields.stockLost}}"
              },
              {
                "header": "STOCKRECON_REPORT_DETAILS_TABLE_HEADER_6_LABEL",
                "cellValue": "{{item.additionalFields.fields.stockDamaged}}"
              },
              {
                "header": "STOCKRECON_REPORT_DETAILS_TABLE_HEADER_EXCESS_LABEL",
                "cellValue": "{{item.additionalFields.fields.stockExcess}}"
              },
              {
                "header": "STOCKRECON_REPORT_DETAILS_TABLE_HEADER_LESS_LABEL",
                "cellValue": "{{item.additionalFields.fields.stockLess}}"
              },
              {
                "header": "STOCKRECON_REPORT_DETAILS_TABLE_HEADER_7_LABEL",
                "cellValue": "{{item.physicalCount}}"
              },
              {
                "header": "STOCKRECON_REPORT_DETAILS_TABLE_HEADER_8_LABEL",
                "cellValue": "{{item.calculatedCount}}"
              }
            ],
            "rows": "{{contextData.0.StockReconciliationModel}}"
          }
        }
      ]
    }
  ]
};
