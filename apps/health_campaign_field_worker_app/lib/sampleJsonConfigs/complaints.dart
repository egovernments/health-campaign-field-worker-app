final dynamic sampleComplaintFlows = {
  "name": "COMPLAINTS",
  "flows": [
    {
      "body": [
        {
          "type": "template",
          "format": "row",
          "children": [
            {
              "type": "template",
              "label": "COMPLAINT_INBOX_SEARCHBAR_LABEL",
              "format": "searchBar",
              "onAction": [
                {
                  "actionType": "SEARCH_EVENT",
                  "properties": {
                    "data": [
                      {
                        "key": "name",
                        "value": "field.value",
                        "operation": "contains"
                      }
                    ],
                    "name": "pgrService",
                    "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT"
                  }
                }
              ],
              "fieldName": "complaintInboxSearchBar",
              "mandatory": true,
              "validation": [
                {"key": "minSearchChars", "error": "", "value": 3}
              ]
            },
            {
              "icon": "FilterAlt",
              "type": "template",
              "label": "COMPLAINT_INBOX_FILTER_LABEL",
              "format": "actionPopup",
              "fieldName": "complaintsFilter",
              "properties": {
                "icon": "FilterAlt",
                "size": "medium",
                "type": "tertiary",
                "suffixIcon": "FilterAlt",
                "popupConfig": {
                  "body": [
                    {
                      "data": [
                        {"code": "ASSIGN_TO_ME", "name": "ASSIGN_TO_ME"},
                        {"code": "ASSIGN_TO_ALL", "name": "ASSIGN_TO_ALL"}
                      ],
                      "type": "template",
                      "format": "radioList",
                      "fieldName": "assignTo"
                    },
                    {
                      "type": "template",
                      "enums": "{{fn:getUniqueComplaintTypes(contextData)}}",
                      "showWhenSingleOption": true,
                      "label": "COMPLAINT_INBOX_FILTER_COMPLAINT_TYPE_LABEL",
                      "format": "dropdownTemplate",
                      "valueKey": "code",
                      "fieldName": "complaintType"
                    },
                    {
                      "type": "template",
                      "enums": "{{fn:getUniqueLocalities(contextData)}}",
                      "showWhenSingleOption": true,
                      "label": "COMPLAINT_INBOX_FILTER_LOCALITY_TYPE_LABEL",
                      "format": "dropdownTemplate",
                      "valueKey": "code",
                      "fieldName": "locality"
                    }
                  ],
                  "type": "default",
                  "title": "COMPLAINT_INBOX_FILTER_LABEL",
                  "titleIcon": "FilterAlt",
                  "description": "",
                  "footerActions": [
                    {
                      "type": "template",
                      "label": "COMPLAINT_INBOX_FILTER_SECONDARY_ACTION_LABEL",
                      "format": "button",
                      "onAction": [
                        {
                          "actionType": "CLEAR_STATE",
                          "properties": {
                            "name": "pgrService",
                            "filterKeys": [
                              "name",
                              "serviceCode",
                              "localityBoundaryCode"
                            ],
                            "widgetKeys": [
                              "assignTo",
                              "complaintType",
                              "locality"
                            ],
                            "triggerSearch": true
                          }
                        }
                      ],
                      "fieldName": "cancel2",
                      "properties": {
                        "size": "large",
                        "type": "secondary",
                        "mainAxisSize": "max"
                      }
                    },
                    {
                      "type": "template",
                      "label": "COMPLAINT_INBOX_FILTER_PRIMARY_ACTION_LABEL",
                      "format": "button",
                      "onAction": [
                        {
                          "actionType": "CLEAR_STATE",
                          "properties": {
                            "name": "pgrService",
                            "filterKeys": [
                              "name",
                              "serviceCode",
                              "localityBoundaryCode"
                            ]
                          }
                        },
                        {"actionType": "CLOSE_POPUP", "properties": {}},
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "data": [
                              {
                                "key": "tenantId",
                                "value": "{{singleton.selectedProject.tenantId}}",
                                "operation": "equals"
                              },
                              {
                                "key": "name",
                                "root": "pgrComplainant",
                                "value": "{{singleton.loggedInUser.name}}",
                                "applyIf": "{{ assignTo }} == ASSIGN_TO_ME",
                                "operation": "equals"
                              },
                              {
                                "key": "serviceCode",
                                "value": "{{complaintType }}",
                                "applyIf": "{{complaintType }} !=null",
                                "operation": "equals"
                              },
                              {
                                "key": "localityBoundaryCode",
                                "root": "address",
                                "value": "{{ locality }}",
                                "applyIf": "{{locality }} !=null",
                                "operation": "equals"
                              }
                            ],
                            "name": "pgrService"
                          }
                        }
                      ],
                      "fieldName": "filter",
                      "properties": {
                        "size": "large",
                        "type": "primary",
                        "mainAxisSize": "max"
                      }
                    }
                  ],
                  "onCloseAction": [
                    {
                      "actionType": "CLEAR_STATE",
                      "properties": {
                        "name": "pgrService",
                        "widgetKeys": [
                          "assignTo",
                          "complaintType",
                          "locality"
                        ],
                        "triggerSearch": false
                      }
                    },
                    {"actionType": "CLOSE_POPUP", "properties": {}}
                  ],
                  "showCloseButton": true,
                  "barrierDismissible": false
                },
                "mainAxisSize": "min",
                "mainAxisAlignment": "start"
              }
            },
            {
              "icon": "SortSvg",
              "type": "template",
              "label": "COMPLAINT_INBOX_SORT_LABEL",
              "format": "actionPopup",
              "fieldName": "sortComplaints",
              "properties": {
                "icon": "SortSvg",
                "size": "medium",
                "type": "tertiary",
                "suffixIcon": "SortSvg",
                "popupConfig": {
                  "body": [
                    {
                      "data": [
                        {
                          "code": "LATEST_FIRST",
                          "name": "COMPLAINT_INBOX_SORT_LATEST_FIRST"
                        },
                        {
                          "code": "LATEST_LAST",
                          "name": "COMPLAINT_INBOX_SORT_LATEST_LAST"
                        }
                      ],
                      "type": "template",
                      "format": "radioList",
                      "fieldName": "sortBy"
                    }
                  ],
                  "type": "default",
                  "title": "COMPLAINT_INBOX_SORT_POPUP_LABEL",
                  "titleIcon": "SortSvg",
                  "description": "",
                  "footerActions": [
                    {
                      "type": "template",
                      "label": "COMPLAINT_INBOX_SORT_SECONDARY_ACTION_LABEL",
                      "format": "button",
                      "onAction": [
                        {
                          "actionType": "CLEAR_STATE",
                          "properties": {
                            "name": "pgrService",
                            "widgetKeys": ["sortBy"],
                            "triggerSearch": true
                          }
                        }
                      ],
                      "fieldName": "cancel3",
                      "properties": {
                        "size": "large",
                        "type": "secondary",
                        "mainAxisSize": "max"
                      }
                    },
                    {
                      "type": "template",
                      "label": "COMPLAINT_INBOX_SORT_PRIMARY_ACTION_LABEL",
                      "format": "button",
                      "onAction": [
                        {"actionType": "CLOSE_POPUP", "properties": {}},
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "data": [
                              {
                                "key": "tenantId",
                                "value":
                                    "{{singleton.selectedProject.tenantId}}",
                                "operation": "equals"
                              }
                            ],
                            "name": "pgrService",
                            "orderBy": {
                              "field": "auditCreatedTime",
                              "order":
                                  "{{ sortBy }} == LATEST_FIRST ? desc : asc"
                            }
                          }
                        }
                      ],
                      "fieldName": "sort",
                      "properties": {
                        "size": "large",
                        "type": "primary",
                        "mainAxisSize": "max"
                      }
                    }
                  ],
                  "showCloseButton": true,
                  "barrierDismissible": true
                },
                "mainAxisSize": "min",
                "mainAxisAlignment": "start"
              }
            }
          ],
          "fieldName": "complaintInbox_row",
          "properties": {
            "gap": 8,
            "mainAxisSize": "max",
            "mainAxisAlignment": "spaceBetween"
          }
        },
        {
          "type": "template",
          "label": "CORE_COMMON_NOT_FOUND",
          "format": "noResultCard",
          "fieldName": "complaintNotFound",
          "description": "CORE_COMMON_NOT_FOUND_DESC",
          "showOnEmptySearch": true
        },
        {
          "data": "ComplaintWrapper",
          "type": "template",
          "child": {
            "type": "template",
            "format": "card",
            "children": [
              {
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
                        "{{fn:formatDate(item.PgrServiceModel.auditDetails.createdTime, 'date', dd MMM yyyy)}}"
                  },
                  {
                    "key": "COMPLAINT_INBOX_COMPLAINT_AREA",
                    "value": "{{item.PgrServiceModel.address.locality.name}}"
                  },
                  {
                    "key": "COMPLAINT_INBOX_COMPLAINT_STATUS",
                    "value": "{{item.PgrServiceModel.applicationStatus}}"
                  }
                ],
                "type": "template",
                "format": "labelPairList",
                "fieldName": "labelPairComplaint"
              },
              {
                "type": "template",
                "label": "COMPLAINT_DETAILS_VIEW_ACTION_LABEL",
                "format": "button",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "data": [
                        {
                          "key": "clientReferenceId",
                          "value":
                              "{{ item.PgrServiceModel.clientReferenceId }}"
                        }
                      ],
                      "name": "complaintView",
                      "type": "TEMPLATE"
                    }
                  }
                ],
                "fieldName": "viewDetails",
                "mandatory": true,
                "properties": {
                  "size": "large",
                  "type": "secondary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ],
            "fieldName": "complaintCard"
          },
          "format": "listView",
          "hidden": false,
          "fieldName": "listView",
          "properties": {"spacing": "spacer4"},
          "visibilityCondition": "{{ context.ComplaintWrapper.empty }}"
        }
      ],
      "name": "complaintInbox",
      "order": 1,
      "footer": [
        {
          "type": "template",
          "label": "COMPLAINT_INBOX_PRIMARY_ACTION",
          "format": "button",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [],
                "name": "COMPLAINT_CREATE",
                "type": "FORM"
              }
            }
          ],
          "fieldName": "fileComplaint",
          "mandatory": true,
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        }
      ],
      "header": [
        {
          "type": "template",
          "label": "COMPLAINT_INBOX_BACK",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "HOME", "type": "HOME"}
            }
          ]
        }
      ],
      "heading": "COMPLAINT_INBOX_HEADING",
      "category": "COMPLAINTS",
      "screenType": "TEMPLATE",
      "description": "COMPLAINT_INBOX_DESCRIPTION",
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "tenantId",
                "value": "{{singleton.selectedProject.tenantId}}",
                "operation": "equals"
              }
            ],
            "name": "pgrService",
            "type": "SEARCH_EVENT"
          }
        }
      ],
      "wrapperConfig": {
        "filters": [],
        "relations": [],
        "rootEntity": "PgrServiceModel",
        "wrapperName": "ComplaintWrapper",
        "searchConfig": {
          "select": ["pgrService"],
          "primary": "pgrService"
        }
      }
    },
    {
      "name": "COMPLAINT_CREATE",
      "order": 2,
      "pages": [
        {
          "page": "complaintType",
          "type": "object",
          "label": "COMPLAINT_TYPE_HEADING",
          "order": 1,
          "properties": [
            {
              "type": "string",
              "enums": [
                {"code": "SyncNotWorking", "name": "Sync Not Working"},
                {"code": "NotEnoughStock", "name": "Not Enough Stock"},
                {"code": "PerformanceIssue", "name": "Performance Issue"},
                {"code": "SecurityIssues", "name": "Security Issues"},
                {"code": "DataIssues", "name": "Data Issues"},
                {"code": "TechnicalIssues", "name": "Technical Issues"},
                {"code": "UserAccountIssues", "name": "User Account Issues"},
                {"code": "Other", "name": "Other"}
              ],
              "label": "COMPLAINT_TYPE_complaintType_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "infoText": "",
              "readOnly": false,
              "fieldName": "complaintType",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "RAINMAKER-PGR.ServiceDefs",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "COMPLAINT_TYPE_complaintType_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "COMPLAINTS_COMPLAINT_CREATE_complaintType_ERROR",
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
              "errorMessage": "COMPLAINTS_COMPLAINT_CREATE_otherReason_ERROR",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {"condition": "complaintType.complaintType==Other"}
                ]
              }
            }
          ],
          "actionLabel": "COMPLAINT_TYPE_ACTION_LABEL",
          "description": "APPONE_COMPLAINTTYPE_DESCRIPTION"
        },
        {
          "page": "locationDetails",
          "type": "object",
          "label": "LOCATION_DETAILS_HEADING",
          "order": 3,
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
              "mandatory": true,
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
              "errorMessage":
                  "COMPLAINTS_COMPLAINT_CREATE_administrativeArea_ERROR",
              "isMultiSelect": false
            },
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
          ],
          "actionLabel": "LOCATION_DETAILS_ACTION_LABEL",
          "description": "LOCATION_DETAILS_DESCRIPTION"
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
              "mandatory": true,
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
              "errorMessage":
                  "COMPLAINTS_COMPLAINT_CREATE_complaintRaisedFor_ERROR",
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
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "COMPLAINT_DETAILS_name_REQUIRED_ERROR"
                },
                {
                  "type": "minLength",
                  "value": 2,
                  "message": "COMPLAINT_DETAILS_name_LABEL_MIN_VALIDATION"
                },
                {
                  "type": "maxLength",
                  "value": 64,
                  "message": "COMPLAINT_DETAILS_name_LABEL_MAX_VALIDATION"
                }
              ],
              "errorMessage": "COMPLAINTS_COMPLAINT_CREATE_name_ERROR",
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
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "prefixText": "+91",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "COMPLAINT_DETAILS_contactNumber_REQUIRED_ERROR"
                },
                {
                  "type": "minLength",
                  "value": 10,
                  "message": "MOBILE_LENGTH_10_DIGIT"
                },
                {
                  "type": "maxLength",
                  "value": 10,
                  "message": "MOBILE_LENGTH_10_DIGIT"
                }
              ],
              "errorMessage": "COMPLAINTS_COMPLAINT_CREATE_contactNumber_ERROR",
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
              "validations": [
                {
                  "type": "minLength",
                  "value": 2,
                  "message": "SUPERVISOR_name_LABEL_MIN_VALIDATION"
                },
                {
                  "type": "maxLength",
                  "value": 64,
                  "message": "SUPERVISOR_DETAILS_name_LABEL_MAX_VALIDATION"
                }
              ],
              "errorMessage":
                  "COMPLAINTS_COMPLAINT_CREATE_supervisorName_ERROR",
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
              "validations": [
                {
                  "type": "minLength",
                  "value": 10,
                  "message": "MOBILE_LENGTH_10_DIGITS"
                },
                {
                  "type": "maxLength",
                  "value": 10,
                  "message": "MOBILE_LENGTH_10_DIGITS"
                }
              ],
              "errorMessage":
                  "COMPLAINTS_COMPLAINT_CREATE_supervisorContactNumber_ERROR",
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
              "mandatory": true,
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
              "errorMessage":
                  "COMPLAINTS_COMPLAINT_CREATE_complaintDescription_ERROR",
              "isMultiSelect": false
            }
          ],
          "actionLabel": "COMPLAINT_DETAILS_ACTION_LABEL",
          "description": "COMPLAINT_DETAILS_DESCRIPTION"
        }
      ],
      "version": 1,
      "category": "COMPLAINTS",
      "disabled": false,
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "COMPLAINTS_COMPLAINT_CREATE_MESSAGE"}
              }
            ],
            "configName": "complaintRegistration"
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
            "data": [
              {
                "key": "complaintClientReferenceId",
                "value":
                    "{{contextData.entities.PgrServiceModel.clientReferenceId}}"
              }
            ],
            "name": "complaintAcknowledgement",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {
                  "message": "COMPLAINTS_COMPLAINTACKNOWLEDGEMENT_MESSAGE"
                }
              }
            ],
            "navigationMode": "popUntilAndPush",
            "popUntilPageName": "complaintInbox"
          }
        }
      ],
      "isSelected": true,
      "screenType": "FORM",
      "wrapperConfig": {
        "filters": [],
        "relations": [],
        "rootEntity": "PgrServiceModel",
        "wrapperName": "ComplaintWrapper",
        "searchConfig": {
          "select": ["pgrService"],
          "primary": "pgrService"
        }
      }
    },
    {
      "body": [
        {
          "type": "template",
          "label": "COMPLAINT_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_LABEL",
          "format": "panelCard",
          "heading": "COMPLAINT_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_LABEL",
          "fieldName": "complaintSuccess",
          "mandatory": true,
          "properties": {"type": "success"},
          "description":
              "COMPLAINT_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_DESCRIPTION",
          "primaryAction": {
            "type": "template",
            "label":
                "COMPLAINT_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_ACTION_LABEL",
            "format": "button",
            "hidden": false,
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"name": "complaintInbox", "type": "TEMPLATE"}
              }
            ],
            "fieldName": "backToComplaints",
            "mandatory": true,
            "properties": {"type": "primary"}
          }
        }
      ],
      "name": "complaintAcknowledgement",
      "order": 3,
      "header": [
        {
          "label": "Back",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "complaintInbox", "type": "TEMPLATE"}
            }
          ],
          "mandatory": true
        }
      ],
      "heading": "",
      "category": "COMPLAINTS",
      "screenType": "TEMPLATE",
      "description": "",
      "isSuccessorErrorScreen": true
    },
    {
      "body": [
        {
          "type": "template",
          "format": "card",
          "children": [
            {
              "data": [
                {
                  "key": "COMPLAINT_VIEW_COMPLAINTS_NUMBER",
                  "value": "{{contextData.0.PgrServiceModel.serviceRequestId}}",
                  "defaultValue": "Sync data to generate complaint number"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINTS_TYPE",
                  "value": "{{contextData.0.PgrServiceModel.serviceCode}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINTS_DATE",
                  "value":
                      "{{fn:formatDate(contextData.0.PgrServiceModel.auditDetails.createdTime, 'date', dd MMM yyyy)}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINTS_AREA",
                  "value":
                      "{{contextData.0.PgrServiceModel.address.locality.name}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINANT_CONTACT",
                  "value":
                      "{{contextData.0.PgrServiceModel.user.mobileNumber}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINT_STATUS",
                  "value":
                      "{{contextData.0.PgrServiceModel.applicationStatus}}",
                  "defaultValue": "NA"
                },
                {
                  "key": "COMPLAINT_VIEW_COMPLAINT_DESCRIPTION",
                  "value": "{{contextData.0.PgrServiceModel.description}}",
                  "defaultValue": "NA"
                }
              ],
              "type": "template",
              "format": "labelPairList",
              "fieldName": "complaintsLabelPair",
              "mandatory": true
            }
          ],
          "fieldName": "listOfComplaints"
        }
      ],
      "name": "complaintView",
      "order": 4,
      "footer": [
        {
          "type": "template",
          "label": "COMPLAINT_VIEW_ACTION_LABEL",
          "format": "button",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {"name": "complaintInbox", "type": "TEMPLATE"}
            }
          ],
          "fieldName": "close",
          "mandatory": true,
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        }
      ],
      "header": [
        {
          "label": "Back",
          "format": "backLink",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ],
          "mandatory": true
        }
      ],
      "heading": "COMPLAINT_VIEW_HEADING",
      "category": "COMPLAINTS",
      "screenType": "TEMPLATE",
      "description": "",
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "clientReferenceId",
                "value": "{{navigation.clientReferenceId}}",
                "operation": "equals"
              }
            ],
            "name": "pgrService",
            "type": "SEARCH_EVENT"
          }
        }
      ],
      "wrapperConfig": {
        "filters": [],
        "relations": [],
        "rootEntity": "PgrServiceModel",
        "wrapperName": "ComplaintWrapper",
        "searchConfig": {
          "select": ["pgrService"],
          "primary": "pgrService"
        }
      }
    }
  ],
  "order": 4,
  "active": true,
  "project": "Oncho",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "initialPage": "complaintInbox"
};
