final dynamic sampleComplaintFlows = {
  "name": "COMPLAINTS",
  "initialPage": "complaintInbox",
  "project": "CMP-2025-08-04-004846",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "complaintInbox",
      "heading": "COMPLAINT_INBOX_HEADING",
      "description": "COMPLAINT_INBOX_DESCRIPTION",
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "pgrService",
            "data": [
              {
                "key": "tenantId",
                "value": "{{singleton.selectedProject.tenantId}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "header": [
        {
          "format": "backLink",
          "type": "template",
          "label": "COMPLAINT_INBOX_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [
        {
          "format": "button",
          "type": "template",
          "fieldName": "fileComplaint",
          "label": "COMPLAINT_INBOX_PRIMARY_ACTION",
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
                "type": "FORM",
                "name": "COMPLAINT_CREATE",
                "data": []
              }
            }
          ]
        }
      ],
      "wrapperConfig": {
        "wrapperName": "ComplaintWrapper",
        "rootEntity": "PgrServiceModel",
        "filters": [],
        "relations": [],
        "searchConfig": {
          "primary": "pgrService",
          "select": ["pgrService"]
        }
      },
      "body": [
        {
          "format": "row",
          "properties": {
            "mainAxisAlignment": "spaceBetween",
            "mainAxisSize": "max"
          },
          "children": [
            {
              "type": "template",
              "format": "actionPopup",
              "label": "COMPLAINT_INBOX_SEARCH_LABEL",
              "properties": {
                "suffixIcon": "Search",
                "type": "tertiary",
                "size": "medium",
                "mainAxisSize": "min",
                "mainAxisAlignment": "start",
                "popupConfig": {
                  "type": "default",
                  "title": "COMPLAINT_INBOX_SEARCH_LABEL",
                  "titleIcon": "Search",
                  "showCloseButton": true,
                  "barrierDismissible": true,
                  "body": [
                    {
                      "type": "template",
                      "format": "textInput",
                      "label": "COMPLAINT_INBOX_SEARCH_COMPLAINT_NUMBER_LABEL",
                      "fieldName": "complaintNumber",
                    },
                    {
                      "type": "template",
                      "format": "textInput",
                      "label": "COMPLAINT_INBOX_SEARCH_MOBILE_NUMBER_LABEL",
                      "fieldName": "mobileNumber",
                    }
                  ],
                  "footerActions": [
                    {
                      "type": "template",
                      "format": "button",
                      "label": "COMPLAINT_INBOX_SEARCH_SECONDARY_ACTION_LABEL",
                      "properties": {
                        "type": "secondary",
                        "size": "large",
                        "mainAxisSize": "max"
                      },
                      "onAction": [
                        {"actionType": "CLEAR_STATE", "properties": {}},
                        {"actionType": "CLOSE_POPUP", "properties": {}}
                      ]
                    },
                    {
                      "type": "template",
                      "format": "button",
                      "label": "COMPLAINT_INBOX_SEARCH_PRIMARY_ACTION_LABEL",
                      "properties": {
                        "type": "primary",
                        "size": "large",
                        "mainAxisSize": "max"
                      },
                      "onAction": [
                        {"actionType": "CLOSE_POPUP", "properties": {}},
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "name": "PgrServiceModel",
                            "data": [
                              {
                                "key": "serviceRequestId",
                                "value": "{{ widgetData.complaintNumber }}",
                                "operation": "in"
                              },
                              {
                                "key": "serviceRequestId",
                                "value": "{{ widgetData.mobileNumber }}",
                                "operation": "in"
                              }
                            ]
                          }
                        }
                      ]
                    }
                  ]
                }
              },
            },
            {
              "type": "template",
              "format": "actionPopup",
              "label": "COMPLAINT_INBOX_FILTER_LABEL",
              "properties": {
                "type": "tertiary",
                "size": "medium",
                "mainAxisSize": "min",
                "mainAxisAlignment": "start",
                "popupConfig": {
                  "type": "default",
                  "title": "COMPLAINT_INBOX_FILTER_LABEL",
                  "titleIcon": "filter",
                  "showCloseButton": true,
                  "barrierDismissible": true,
                  "body": [
                    {
                      "type": "template",
                      "format": "radioList",
                      "fieldName": "assignTo",
                      "data": [
                        {"code": "ASSIGN_TO_ME", "name": "ASSIGN_TO_ME"},
                        {"code": "ASSIGN_TO_ALL", "name": "ASSIGN_TO_ALL"},
                      ],
                    },
                    {
                      "type": "template",
                      "format": "dropdown",
                      "label": "COMPLAINT_INBOX_FILTER_COMPLAINT_TYPE_LABEL",
                      "fieldName": "complaintType",
                      "enums": "{{fn:getUniqueComplaintTypes()}}",
                    },
                    {
                      "type": "template",
                      "format": "dropdown",
                      "label": "COMPLAINT_INBOX_FILTER_LOCALITY_TYPE_LABEL",
                      "fieldName": "locality",
                      "enums": "{{fn:getUniqueLocalities()}}",
                    }
                  ],
                  "footerActions": [
                    {
                      "type": "template",
                      "format": "button",
                      "label": "COMPLAINT_INBOX_FILTER_SECONDARY_ACTION_LABEL",
                      "properties": {
                        "type": "secondary",
                        "size": "large",
                        "mainAxisSize": "max"
                      },
                      "onAction": [
                        {"actionType": "CLEAR_STATE", "properties": {}},
                        {"actionType": "CLOSE_POPUP", "properties": {}}
                      ]
                    },
                    {
                      "type": "template",
                      "format": "button",
                      "label": "COMPLAINT_INBOX_FILTER_PRIMARY_ACTION_LABEL",
                      "properties": {
                        "type": "primary",
                        "size": "large",
                        "mainAxisSize": "max"
                      },
                      "onAction": [
                        {"actionType": "CLOSE_POPUP", "properties": {}},
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "defaultRoot": "pgrService",
                            "data": [
                              {
                                "root": "pgrComplainant",
                                "key": "name",
                                "value": "{{singleton.loggedInUserName}}",
                                "operation": "equals",
                                "applyIf":
                                    "{{ widgetData.assignTo == 'ASSIGN_TO_ME' }}"
                              },
                              {
                                "key": "serviceCode",
                                "value": "{{ widgetData.complaintType }}",
                                "operation": "equals",
                                "applyIf":
                                    "{{ widgetData.complaintType.isNotEmpty }}"
                              },
                              {
                                "root": "address",
                                "key": "locality.code",
                                "value": "{{ widgetData.locality }}",
                                "operation": "equals",
                                "applyIf":
                                    "{{ widgetData.locality.isNotEmpty }}"
                              }
                            ]
                          }
                        }
                      ]
                    }
                  ]
                }
              },
              "suffixIcon": "FilterAlt"
            },
            {
              "type": "template",
              "format": "actionPopup",
              "label": "COMPLAINT_INBOX_SORT_LABEL",
              "properties": {
                "type": "tertiary",
                "size": "medium",
                "mainAxisSize": "min",
                "mainAxisAlignment": "start",
                "popupConfig": {
                  "type": "default",
                  "title": "COMPLAINT_INBOX_SORT_POPUP_LABEL",
                  "titleIcon": "Sort",
                  "showCloseButton": true,
                  "barrierDismissible": true,
                  "body": [
                    {
                      "type": "template",
                      "format": "radioList",
                      "fieldName": "sotyBy",
                      "data": [
                        {
                          "code": "LATEST_FIRST",
                          "name": "COMPLAINT_INBOX_SORT_LATEST_FIRST"
                        },
                        {
                          "code": "LATEST_LAST",
                          "name": "COMPLAINT_INBOX_SORT_LATEST_LAST"
                        },
                      ],
                    },
                  ],
                  "footerActions": [
                    {
                      "type": "template",
                      "format": "button",
                      "label": "COMPLAINT_INBOX_SORT_SECONDARY_ACTION_LABEL",
                      "properties": {
                        "type": "secondary",
                        "size": "large",
                        "mainAxisSize": "max"
                      },
                      "onAction": [
                        {"actionType": "CLEAR_STATE", "properties": {}},
                        {"actionType": "CLOSE_POPUP", "properties": {}}
                      ]
                    },
                    {
                      "type": "template",
                      "format": "button",
                      "label": "COMPLAINT_INBOX_SORT_PRIMARY_ACTION_LABEL",
                      "properties": {
                        "type": "primary",
                        "size": "large",
                        "mainAxisSize": "max"
                      },
                      "onAction": [
                        {"actionType": "CLOSE_POPUP", "properties": {}},
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "name": "IndividualModel",
                            "data": [
                              {
                                "key": "status",
                                "value": "{{ widgetData.selectedStatus }}",
                                "operation": "in"
                              }
                            ]
                          }
                        }
                      ]
                    }
                  ]
                }
              },
              "suffixIcon": "SortSvg"
            }
          ]
        },
        {
          "format": "listView",
          "type": "template",
          "fieldName": "listView",
          "hidden": false,
          "data": "ComplaintWrapper",
          "properties": {
            "spacing": "spacer4",
          },
          "visibilityCondition": "{{ context.ComplaintWrapper.empty }}",
          "child": {
            "format": "card",
            "type": "template",
            "fieldName": "complaintCard",
            "children": [
              {
                "format": "labelPairList",
                "type": "template",
                "fieldName": "labelPairComplaint",
                "data": [
                  {
                    "key": "COMPLAINT_INBOX_COMPLAINT_NUMBER",
                    "value": "{{item.PgrServiceModel.serviceRequestId}}",
                    "defaultValue": "Sync data to generate complaint number"
                  },
                  {
                    "key": "COMPLAINT_INBOX_COMPLAINT_TYPE",
                    "value": "{{item.PgrServiceModel.serviceCode}}"
                  },
                  {
                    "key": "COMPLAINT_INBOX_COMPLAINT_DATE",
                    "value":
                        "{{fn:formatDate(item.PgrServiceModel.auditDetails.createdTime, dateTime, dd MMM yyyy)}}"
                  },
                  {
                    "key": "COMPLAINT_INBOX_COMPLAINT_AREA",
                    "value": "{{item.PgrServiceModel.address.locality.code}}"
                  },
                  {
                    "key": "COMPLAINT_INBOX_COMPLAINT_STATUS",
                    "value": "{{item.PgrServiceModel.applicationStatus}}"
                  }
                ]
              },
              {
                "format": "button",
                "type": "template",
                "fieldName": "viewDetails",
                "label": "COMPLAINT_DETAILS_VIEW_ACTION_LABEL",
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
                      "name": "complaintView",
                      "data": [
                        {
                          "key": "clientReferenceId",
                          "value":
                              "{{ item.PgrServiceModel.clientReferenceId }}"
                        }
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
      "name": "COMPLAINT_CREATE",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "complaintType",
          "type": "object",
          "label": "COMPLAINT_TYPE_HEADING",
          "order": 1,
          "actionLabel": "COMPLAINT_TYPE_DESCRIPTION",
          "description": "APPONE_COMPLAINTTYPE_DESCRIPTION",
          "properties": [
            {
              "type": "string",
              "label": "COMPLAINT_TYPE_complaintType_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "infoText": "",
              "readOnly": false,
              "fieldName": "complaintType",
              "deleteFlag": false,
              "innerLabel": "",
              "enums": [
                {"code": "SyncNotWorking", "name": "Sync Not Working"},
                {"code": "NotEnoughStock", "name": "Not Enough Stock"},
                {"code": "Other", "name": "Other"}
              ],
              "schemaCode": "RAINMAKER-PGR.ServiceDefs",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "COMPLAINT_TYPE_complaintType_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "COMPLAINT_TYPE_otherReason_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "otherReason",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "COMPLAINT_TYPE_otherReason_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": "complaintType.complaintType==Other"
              }
            }
          ]
        },
        {
          "page": "locationDetails",
          "type": "object",
          "label": "LOCATION_DETAILS_HEADING",
          "order": 3,
          "actionLabel": "LOCATION_DETAILS_ACTION_LABEL",
          "description": "LOCATION_DETAILS_DESCRIPTION",
          "properties": [
            {
              "type": "string",
              "label": "LOCATION_DETAILS_addressLine1_LABEL",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "addressLine1",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LOCATION_DETAILS_addressLine2_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "addressLine2",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LOCATION_DETAILS_landmark_LABEL",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "landmark",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "LOCATION_DETAILS_pincode_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "pincode",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "PERMANENT", "name": "PERMANENT"},
                {"code": "CORRESPONDENCE", "name": "CORRESPONDENCE"},
                {"code": "OTHER", "name": "OTHER"}
              ],
              "label": "LOCATION_DETAILS_typeOfAddress_LABEL",
              "order": 5,
              "format": "dropdown",
              "hidden": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "typeOfAddress",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": false
            }
          ]
        },
        {
          "page": "complaintDetails",
          "type": "object",
          "label": "COMPLAINT_DETAILS_HEADING",
          "order": 4,
          "navigateTo": {
            "name": "ComplaintsAcknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "label": "COMPLAINT_DETAILS_administrativeArea_LABEL",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "administrativeArea",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "COMPLAINT_DETAILS_administrativeArea_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {
                  "code": "COMPLAINTS_RAISED_FOR_MYSELF",
                  "name": "COMPLAINTFLOW_RAISED_FOR_MYSELF"
                },
                {
                  "code": "COMPLAINTS_RAISED_FOR_ANOTHER_USER",
                  "name": "COMPLAINTFLOW_RAISED_FOR_ANOTHER_USER"
                }
              ],
              "label": "COMPLAINT_DETAILS_complaintRaisedFor_LABEL",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "complaintRaisedFor",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "COMPLAINT_DETAILS_complaintRaisedFor_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "COMPLAINT_DETAILS_name_LABEL",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "name",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "COMPLAINT_DETAILS_name_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "autoFillCondition": [
                {
                  "value": "{{loggedInUserName}}",
                  "expression":
                      "complaintDetails.complaintRaisedFor==COMPLAINTS_RAISED_FOR_MYSELF"
                }
              ]
            },
            {
              "type": "string",
              "label": "COMPLAINT_DETAILS_contactNumber_LABEL",
              "order": 4,
              "value": "",
              "format": "mobileNumber",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "contactNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "prefixText": "+91",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "COMPLAINT_DETAILS_contactNumber_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "autoFillCondition": [
                {
                  "value": "{{loggedInUserMobileNumber}}",
                  "expression":
                      "complaintDetails.complaintRaisedFor==COMPLAINTS_RAISED_FOR_MYSELF"
                }
              ]
            },
            {
              "type": "string",
              "label": "COMPLAINT_DETAILS_supervisorName_LABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "supervisorName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "COMPLAINT_DETAILS_supervisorContactNumber_LABEL",
              "order": 6,
              "value": "",
              "format": "mobileNumber",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "supervisorContactNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "prefixText": "+91",
              "systemDate": false,
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "COMPLAINT_DETAILS_complaintDescription_LABEL",
              "order": 7,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "complaintDescription",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "COMPLAINT_DETAILS_complaintDescription_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ],
          "actionLabel": "COMPLAINT_DETAILS_ACTION_LABEL",
          "description": "COMPLAINT_DETAILS_DESCRIPTION"
        }
      ],
      "wrapperConfig": {
        "wrapperName": "ComplaintWrapper",
        "rootEntity": "PgrServiceModel",
        "filters": [],
        "relations": [],
        "searchConfig": {
          "primary": "pgrService",
          "select": ["pgrService"]
        }
      },
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "complaintRegistration",
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
            "entity": "",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to create household."}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "complaintAcknowledgement",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "data": [
              {
                "key": "complaintClientReferenceId",
                "value":
                    "{{contextData.entities.PgrServiceModel.clientReferenceId}}"
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "complaintAcknowledgement",
      "heading": "",
      "description": "",
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"type": "TEMPLATE", "name": "complaintInbox"}
            }
          ]
        }
      ],
      "body": [
        {
          "format": "panelCard",
          "type": "template",
          "fieldName": "complaintSuccess",
          "label": "COMPLAINT_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_LABEL",
          "description":
              "COMPLAINT_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_DESCRIPTION",
          "properties": {"type": "success"},
          "secondaryAction": {
            "type": "template",
            "format": "button",
            "fieldName": "backToComplaints",
            "label":
                "COMPLAINT_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_ACTION_LABEL",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"type": "TEMPLATE", "name": "complaintInbox"}
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "complaintView",
      "heading": "COMPLAINT_VIEW_HEADING",
      "description": "",
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [
        {
          "format": "button",
          "type": "template",
          "fieldName": "close",
          "label": "COMPLAINT_VIEW_ACTION_LABEL",
          "properties": {
            "type": "primary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {"type": "TEMPLATE", "name": "complaintInbox"}
            }
          ]
        }
      ],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "pgrService",
            "data": [
              {
                "key": "clientReferenceId",
                "value": "{{navigation.clientReferenceId}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "wrapperConfig": {
        "wrapperName": "ComplaintWrapper",
        "rootEntity": "PgrServiceModel",
        "filters": [],
        "relations": [],
        "searchConfig": {
          "primary": "pgrService",
          "select": ["pgrService"]
        }
      },
      "body": [
        {
          "format": "card",
          "type": "template",
          "fieldName": "listOfComplaints",
          "children": [
            {
              "format": "labelPairList",
              "type": "template",
              "fieldName": "complaintsLabelPair",
              "data": [
                {
                  "key": "COMPLAINT_VIEW_COMPLAINTS_NUMBER",
                  "value": "{{0.PgrServiceModel.serviceRequestId}}",
                  "defaultValue": "Sync data to generate complaint number"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINTS_TYPE",
                  "value": "{{0.PgrServiceModel.serviceCode}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINTS_DATE",
                  "value":
                      "{{fn:formatDate(0.PgrServiceModel.auditDetails.createdTime, dateTime, dd MMM yyyy)}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINTS_AREA",
                  "value": "{{0.PgrServiceModel.address.locality.code}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINANT_CONTACT",
                  "value": "{{0.PgrServiceModel.user.mobileNumber}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINT_STATUS",
                  "value": "{{0.PgrServiceModel.applicationStatus}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINT_DESCRIPTION",
                  "value": "{{0.PgrServiceModel.description}}",
                  "defaultValue": "NA"
                }
              ]
            }
          ]
        }
      ]
    }
  ]
};
