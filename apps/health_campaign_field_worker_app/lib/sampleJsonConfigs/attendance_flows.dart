final dynamic attendanceFlows = {
  "name": "ATTENDANCE",
  "initialPage": "manageAttendance",
  "order": 9,
  "project": "LLIN-mz",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "manageAttendance",
      "heading": "ATTENDANCE_REGISTAR_LABEL",
      "initActions": [
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
                "key": "referenceId",
                "value": "{{singleton.selectedProject.id}}",
                "operation": "equals"
              }
            ],
            "name": "attendanceRegister",
            "type": "SEARCH_EVENT"
          }
        },
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "tenantId",
                // Root on the register so tenantId scoping doesn't gate
                // registers via a cross-table subquery on `attendee`.
                "root": "attendanceRegister",
                "value": "{{singleton.selectedProject.tenantId}}",
                "operation": "equals"
              },
              {
                // referenceId lives on attendanceRegister, not on attendee;
                // resolver walks the registerId FK to filter attendees.
                "key": "referenceId",
                "root": "attendanceRegister",
                "value": "{{singleton.selectedProject.id}}",
                "operation": "equals"
              },
            ],
            "name": "attendee",
            "type": "SEARCH_EVENT"
          }
        },
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "tenantId",
                // Root on the register so tenantId scoping doesn't gate
                // registers via a cross-table subquery on `attendance`
                // (which would hide registers that have no attendance rows yet).
                "root": "attendanceRegister",
                "value": "{{singleton.selectedProject.tenantId}}",
                "operation": "equals"
              },
              {
                // Same as attendee: referenceId is on the register only.
                "key": "referenceId",
                "root": "attendanceRegister",
                "value": "{{singleton.selectedProject.id}}",
                "operation": "equals"
              }
            ],
            "name": "attendance",
            "type": "SEARCH_EVENT"
          }
        }
      ],
      "wrapperConfig": {
        "filters": [],
        "relations": [
          {
            "name": "attendees",
            "entity": "AttendeeModel",
            "match": {"field": "registerId", "equalsFrom": "id"}
          },
          {
            "name": "attendanceLog",
            "entity": "AttendanceLogModel",
            "match": {"field": "registerId", "equalsFrom": "id"}
          }
        ],
        "rootEntity": "AttendanceRegisterModel",
        "wrapperName": "AttendanceWrapper",
        "searchConfig": {
          "select": ["attendanceRegister", "attendee", "attendance"],
          "primary": "attendanceRegister",
          "pagination": {"limit": 10, "maxItems": 30},
          "orderBy": {"field": "startDate", "order": "DESC"}
        }
      },
      "scrollListener": {
        "triggerMode": "end",
        "debounceMs": 300,
        "showLoadingIndicator": true,
        "onScroll": [
          {
            "actionType": "REFRESH_SEARCH",
            "properties": {
              "pagination": {"limit": 10, "maxItems": 30}
            }
          }
        ]
      },
      "header": [
        {
          "format": "backLink",
          "type": "template",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [],
      "body": [
        {
          "type": "template",
          "format": "noResultCard",
          "visible": "{{fn:isEmpty(contextData)}}",
          "label": "NO_RESULTS_FOUND"
        },
        {
          "data": "AttendanceWrapper",
          "type": "template",
          "format": "listView",
          "hidden": "{{fn:isEmpty(contextData)}}",
          "fieldName": "listView",
          "properties": {"spacing": "spacer4"},
          "child": {
            "type": "template",
            "format": "card",
            "fieldName": "registerCard",
            "children": [
              {
                "data": [
                  {
                    "key": "CAMPAIGN_NAME_LABEL",
                    "value":
                        "{{item.AttendanceRegisterModel.additionalDetails.campaignName}}"
                  },
                  {
                    "key": "EVENT_TYPE_LABEL",
                    "value":
                        "{{item.AttendanceRegisterModel.additionalDetails.eventType}}"
                  },
                  {
                    "key": "STAFF_COUNT_LABEL",
                    "value": "{{fn:activeAttendeesCount(item.attendees)}}"
                  },
                  {
                    "key": "START_DATE_LABEL",
                    "value":
                        "{{fn:formatDate(item.AttendanceRegisterModel.startDate, 'date', dd MMM yyyy)}}"
                  },
                  {
                    "key": "END_DATE_LABEL",
                    "value":
                        "{{fn:formatDate(item.AttendanceRegisterModel.endDate, 'date', dd MMM yyyy)}}"
                  },
                  {
                    "key": "STATUS_LABEL",
                    "value": "{{item.AttendanceRegisterModel.status}}"
                  },
                  {
                    "key": "ATTENDANCE_COMPLETION_LABEL",
                    "value":
                        "{{fn:calculateCompletedDays(item.AttendanceRegisterModel, item.attendanceLog)}}"
                  }
                ],
                "type": "template",
                "format": "labelPairList",
                "fieldName": "labelPairAttendance"
              },
              {
                "type": "template",
                "label": "ATTENDANCE_OPEN_REGISTER",
                "format": "button",
                "visible":
                    "{{fn:showOpenRegisterButton(item.AttendanceRegisterModel, contextData.0)}}",
                "onAction": [
                  {
                    "actionType": "NAVIGATION",
                    "properties": {
                      "type": "TEMPLATE",
                      "name": "markAttendance",
                      "data": [
                        {
                          "key": "registerId",
                          "value": "{{ item.AttendanceRegisterModel.id }}"
                        },
                        {"key": "entryTime", "value": "{{fn:entryTime()}}"},
                        {"key": "exitTime", "value": "{{fn:exitTime()}}"}
                      ]
                    }
                  }
                ],
                "fieldName": "viewDetails",
                "properties": {
                  "size": "large",
                  "type": "primary",
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "center"
                }
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "markAttendance",
      "heading": "LABEL_MARK_ATTENDANCE",
      "initActions": [
        {
          "actionType": "CLEAR_STATE",
          "properties": {
            "filterKeys": ["referenceId", "givenName"],
            "triggerSearch": false
          }
        },
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
                "key": "referenceId",
                "value": "{{singleton.selectedProject.id}}",
                "operation": "equals"
              },
              {
                "key": "id",
                "value": "{{navigation.registerId}}",
                "operation": "equals"
              }
            ],
            "name": "attendanceRegister",
            "type": "SEARCH_EVENT"
          }
        }
      ],
      "wrapperConfig": {
        "filters": [],
        "relations": [
          {
            "name": "attendees",
            "entity": "AttendeeModel",
            "match": {"field": "registerId", "equalsFrom": "id"},
            "mappedFields": {
              "name": "{{individual.0.name.givenName}}",
              "individualNumber": "{{individual.0.individualId}}",
              "individualId": "{{individual.0.id}}"
            },
            "relations": [
              {
                "name": "individual",
                "entity": "IndividualModel",
                "match": {"field": "id", "equalsFrom": "individualId"}
              }
            ]
          },
          {
            "name": "attendanceLog",
            "entity": "AttendanceLogModel",
            "match": {"field": "registerId", "equalsFrom": "id"}
          }
        ],
        "rootEntity": "AttendanceRegisterModel",
        "wrapperName": "AttendanceWrapper",
        "searchConfig": {
          "select": [
            "attendanceRegister",
            "attendee",
            "individual",
            "name",
            "attendance"
          ],
          "primary": "attendanceRegister"
        }
      },
      "header": [
        {
          "format": "backLink",
          "type": "template",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [
        {
          "visible":
              "{{fn:showAttendanceQRButton(widgetData.selectedDate, widgetData.sessionToggle, contextData.0.AttendanceRegisterModel)}}",
          "format": "attendanceQRScannerButton",
          "type": "template",
          "fieldName": "createReferral",
          "label": "SCAN_QR_CODE",
          "prefixIcon": "QrCodeScanner",
          "enableDynamicQRScanning": true,
          "properties": {
            "type": "secondary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "CLEAR_STATE",
              "properties": {
                "widgetKeys": [
                  "attendanceCollection",
                  "attendanceManualData",
                  "signatureCollection"
                ]
              }
            }
          ]
        },
        {
          "disabled": "{{fn:anyAttendanceSelected(widgetData)}}",
          "format": "button",
          "type": "template",
          "fieldName": "createReferral",
          "label": "SAVE_AND_MARK_LATER_LABEL",
          "properties": {
            "type": "primary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "CUSTOM_DATA",
              "properties": {
                "entities":
                    "{{fn:createAttendanceLog(widgetData, contextData.0.AttendanceRegisterModel, contextData.0.attendanceLog, 0)}}"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {"entity": "AttendanceLogModel"}
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "attendanceAcknowledgement"
              }
            }
          ]
        },
        {
          "format": "actionPopup",
          "type": "template",
          "fieldName": "submitAttendance",
          "label": "CORE_COMMON_SUBMIT",
          "disabled":
              "{{fn:allAttendanceSelected(widgetData, contextData.0.AttendanceRegisterModel)}}==false",
          "onAction": [],
          "properties": {
            "type": "secondary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center",
            "popupConfig": {
              "title": "CONFIRMATION_LABEL",
              "showCloseButton": true,
              "barrierDismissible": true,
              "body": [
                {
                  "type": "template",
                  "format": "textTemplate",
                  "maxLines": 5,
                  "value": "CONFIRMATION_DESCRIPTION"
                },
                {
                  "type": "template",
                  "format": "textInput",
                  "fieldName": "COMMENT",
                  "label": "COMMENT_KEY",
                  "inputType": "multiline"
                }
              ],
              "footerActions": [
                {
                  "format": "button",
                  "type": "template",
                  "fieldName": "createReferral",
                  "label": "PROCEED_BUTTON",
                  "properties": {
                    "type": "primary",
                    "size": "large",
                    "mainAxisSize": "max",
                    "mainAxisAlignment": "center"
                  },
                  "onAction": [
                    {
                      "actionType": "CUSTOM_DATA",
                      "properties": {
                        "entities":
                            "{{fn:createAttendanceLog(widgetData, contextData.0.AttendanceRegisterModel, contextData.0.attendanceLog, 1)}}"
                      }
                    },
                    {"actionType": "CLOSE_POPUP", "properties": {}},
                    {
                      "actionType": "CREATE_EVENT",
                      "properties": {"entity": "AttendanceLogModel"}
                    },
                    {
                      "actionType": "NAVIGATION",
                      "properties": {
                        "type": "TEMPLATE",
                        "name": "attendanceAcknowledgement"
                      }
                    }
                  ]
                },
                {
                  "format": "button",
                  "type": "template",
                  "fieldName": "createReferral",
                  "label": "CORE_COMMON_GO_BACK",
                  "properties": {
                    "type": "secondary",
                    "size": "large",
                    "mainAxisSize": "max",
                    "mainAxisAlignment": "center"
                  },
                  "onAction": [
                    {"actionType": "CLOSE_POPUP", "properties": {}}
                  ]
                }
              ]
            }
          }
        }
      ],
      "body": [
        {
          "type": "template",
          "format": "date",
          "fieldKey": "selectedDate",
          "label": "MARK_ATTENDANCE_DATE",
          "innerLabel": "Select date",
          "startDate": "{{contextData.0.AttendanceRegisterModel.startDate}}",
          "endDate": "{{fn:todayDate()}}",
          "onAction": [
            {
              "actionType": "CLEAR_STATE",
              "properties": {
                "widgetKeys": [
                  "attendanceCollection",
                  "attendanceManualData",
                  "signatureCollection"
                ]
              }
            },
            {
              "actionType": "CUSTOM_DATA",
              "properties": {
                "widgetData":
                    "{{fn:setAttendanceDate(widgetData.selectedDate, contextData.0.AttendanceRegisterModel, widgetData.sessionToggle)}}"
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "labeledToggle",
          "fieldKey": "sessionToggle",
          "visible":
              "{{fn:isNotSingleSession(contextData.0.AttendanceRegisterModel)}}",
          "activeLabel": "Morning Session",
          "inactiveLabel": "Afternoon Session",
          "onAction": [
            {
              "actionType": "CLEAR_STATE",
              "properties": {
                "widgetKeys": [
                  "attendanceCollection",
                  "attendanceManualData",
                  "signatureCollection"
                ]
              }
            },
            {
              "actionType": "CUSTOM_DATA",
              "properties": {
                "widgetData":
                    "{{fn:setAttendanceDate(widgetData.selectedDate, contextData.0.AttendanceRegisterModel, widgetData.sessionToggle)}}"
              }
            }
          ]
        },
        {
          "type": "template",
          "format": "row",
          "properties": {
            "mainAxisAlignment": "start",
            "crossAxisAlignment": "stretch"
          },
          "children": [
            {
              "type": "template",
              "format": "expanded",
              "child": {
                "type": "template",
                "label": "CORE_COMMON_SEARCH",
                "format": "searchBar",
                "onAction": [
                  {
                    "actionType": "SEARCH_EVENT",
                    "properties": {
                      "data": [
                        {
                          "key": "givenName",
                          "value": "field.value",
                          "operation": "contains"
                        }
                      ],
                      "name": "name",
                      "type": "SEARCH_EVENT"
                    }
                  }
                ],
                "fieldName": "searchBar",
                "mandatory": true,
                "validations": [
                  {"type": "minSearchChars", "value": 2}
                ],
                "minSearchChars": 2
              }
            },
            {"type": "template", "format": "sizedBox", "width": 12.0},
            {
              "type": "template",
              "format": "actionPopup",
              "label": "Filter",
              "prefixIcon": "FilterAlt",
              "fieldName": "filterButton",
              "properties": {
                "prefixIcon": "FilterAlt",
                "type": "secondary",
                "size": "small",
                "mainAxisAlignment": "center",
                "height": "spacer12",
                "radius": "spacer3",
                "popupConfig": {
                  "title": "MARK_ATTENDANCE_FILTER_TITLE",
                  "titleIcon": "FilterAlt",
                  "showCloseButton": true,
                  "barrierDismissible": true,
                  "body": [
                    {
                      "type": "template",
                      "format": "card",
                      "children": [
                        {
                          "type": "template",
                          "format": "textTemplate",
                          "value": "SORT_BY"
                        },
                        {
                          "data": [
                            {"code": "PRESENT", "name": "PRESENT"},
                            {"code": "ABSENT", "name": "ABSENT"}
                          ],
                          "type": "template",
                          "format": "radioList",
                          "fieldName": "SORT_BY"
                        }
                      ]
                    },
                    {
                      "type": "template",
                      "format": "card",
                      "children": [
                        {
                          "type": "template",
                          "format": "row",
                          "children": [
                            {
                              "type": "template",
                              "format": "checkbox",
                              "fieldKey": "checkboxValue",
                              "value": false
                            },
                            {
                              "type": "template",
                              "format": "textTemplate",
                              "value": "UNMARKED_ATTENDANCE_ONLY"
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "template",
                      "format": "row",
                      "children": [
                        {
                          "type": "template",
                          "format": "expanded",
                          "child": {
                            "type": "template",
                            "format": "button",
                            "label": "CLEAR",
                            "prefixIcon": "Close",
                            "properties": {
                              "type": "secondary",
                              "size": "small",
                              "mainAxisAlignment": "center",
                              "height": "spacer8",
                              "radius": "spacer3"
                            },
                            "onAction": [
                              {
                                "actionType": "CLEAR_STATE",
                                "properties": {
                                  "widgetKeys": [
                                    "checkboxValue",
                                    "searchBar",
                                    "SORT_BY"
                                  ]
                                }
                              }
                            ]
                          }
                        },
                        {
                          "type": "template",
                          "format": "sizedBox",
                          "width": 12.0
                        },
                        {
                          "type": "template",
                          "format": "expanded",
                          "child": {
                            "type": "template",
                            "format": "button",
                            "label": "APPLY_FILTER",
                            "prefixIcon": "Close",
                            "properties": {
                              "type": "primary",
                              "size": "small",
                              "mainAxisAlignment": "center",
                              "height": "spacer8",
                              "radius": "spacer3"
                            },
                            "onAction": [
                              {"actionType": "CLOSE_POPUP", "properties": {}}
                            ]
                          }
                        }
                      ]
                    }
                  ],
                  "onAction": []
                }
              }
            }
          ]
        },
        {"type": "template", "format": "faceAuthEventLegend"},
        {
          "items":
              "{{fn:todayAttendeesList(widgetData, contextData.0.attendees, contextData.0.AttendanceRegisterModel)}}",
          "type": "template",
          "format": "groupListView",
          "fieldName": "groupListView",
          "emptyListMessage": "NO_RESULTS_FOUND",
          "properties": {"spacing": "spacer4", "groupTextStyle": "headingM"},
          "groupBy": {"field": "entity.tag"},
          "clientFilter": [
            {
              "type": "search",
              "field": "name",
              "widgetKey": "searchBar",
              "operation": "contains"
            },
            {
              "type": "filter",
              "field": "status",
              "widgetKey": "checkboxValue",
              "operation": "in",
              "values": [-1.0]
            },
            {
              "type": "sort",
              "field": "status",
              "widgetKey": "SORT_BY",
              "presentValue": "PRESENT",
              "absentValue": "ABSENT"
            }
          ],
          "child": {
            "type": "template",
            "format": "card",
            "properties": {
              "color": "white",
              "type": "secondary",
              "padding": "spacer4"
            },
            "children": [
              {
                "type": "template",
                "format": "textTemplate",
                "value": "{{item.name}}",
                "properties": {"style": "headingS", "color": "primary"}
              },
              {
                "type": "template",
                "format": "tag",
                "fieldName": "attendanceStatus",
                "label": "{{fn:attendanceStatus(widgetData, item)}}"
              },
              {
                "type": "template",
                "format": "faceAuthEventDots",
                "individualId": "{{item.entity.individualId}}"
              },
              {
                "type": "template",
                "format": "customRow",
                "hide":
                    "{{fn:hideMarkAttendanceButtons(widgetData, item, contextData.0.AttendanceRegisterModel)}}",
                "properties": {
                  "mainAxisAlignment": "start",
                  "crossAxisAlignment": "stretch",
                  "spacing": "spacer3"
                },
                "children": [
                  {
                    "type": "template",
                    "format": "expanded",
                    "child": {
                      "type": "template",
                      "format": "selectButton",
                      "selectionConditions": [
                        {
                          "condition": "NOT_EMPTY",
                          "target":
                              "{{fn:getCurrentSignature(widgetData, item.entity.individualId)}}"
                        },
                        {
                          "condition": "CONTAINS",
                          "target": "{{widgetData.attendanceCollection}}",
                          "value": "{{item.individualId}}"
                        },
                        {
                          "condition": "EQUALS",
                          "target": "{{widgetData.attendanceCollection}}",
                          "value": "{{item.individualId}}==present"
                        }
                      ],
                      "label": "PRESENT",
                      "prefixIcon": "Check",
                      "properties": {
                        "color": "green",
                        "type": "{{fn:buttonType(widgetData, item, 1.0)}}",
                        "selectedType": "primary",
                        "size": "small",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [],
                      "popupConfig": {
                        "title": "MARK_ATTENDANCE_CAPTURE_SIGNATURE_LABEL",
                        "titleIcon": "CheckCircle",
                        "showCloseButton": true,
                        "barrierDismissible": true,
                        "body": [
                          {
                            "type": "template",
                            "format": "signatureCapture",
                            "fieldName": "signature",
                            "fieldKey": "{{item.entity.individualId}}",
                            "groupKey": "signatureCollection",
                            "signatureData":
                                "{{fn:getExistingSignature(item.entity.individualId, contextData.0.attendanceLog)}}",
                            "clearSignatureLabel":
                                "MARK_ATTENDANCE_CLEAR_SIGNATURE_LABEL",
                            "saveSignatureLabel":
                                "MARK_ATTENDANCE_CONFIRM_LABEL",
                            "signatureRequiredLabel":
                                "MARK_ATTENDANCE_SIGNATURE_REQUIRED_LABEL",
                            "popupConfig": {
                              "title":
                                  "MARK_ATTENDANCE_COMPARE_SIGNATURE_LABEL",
                              "titleIcon": "CheckCircle",
                              "showCloseButton": true,
                              "barrierDismissible": true,
                              "body": [
                                {
                                  "type": "template",
                                  "format": "signatureCompare",
                                  "registerId": "{{item.entity.registerId}}",
                                  "individualId":
                                      "{{item.entity.individualId}}",
                                  "individualName":
                                      "{{item.entity.first.individual.name.givenName}}",
                                  "existingSignatureData":
                                      "{{fn:getExistingSignature(item.entity.individualId, contextData.0.attendanceLog)}}",
                                  "currentSignatureData":
                                      "{{fn:getCurrentSignature(widgetData, item.entity.individualId)}}",
                                  "compareSignatureLabel":
                                      "MARK_ATTENDANCE_COMPARE_SIGNATURE_LABEL",
                                  "presentSignatureLabel":
                                      "MARK_ATTENDANCE_PRESENT_SIGNATURE_LABEL",
                                  "absentSignatureLabel":
                                      "MARK_ATTENDANCE_ABSENT_SIGNATURE_LABEL",
                                  "referenceSignatureLabel":
                                      "MARK_ATTENDANCE_REFERENCE_SIGNATURE_LABEL",
                                  "actualSignatureLabel":
                                      "MARK_ATTENDANCE_ACTUAL_SIGNATURE_LABEL",
                                  "onAction": [
                                    {
                                      "actionType": "CLOSE_POPUP",
                                      "properties": {}
                                    }
                                  ]
                                },
                                {
                                  "type": "template",
                                  "format": "customRow",
                                  "properties": {
                                    "mainAxisAlignment": "start",
                                    "crossAxisAlignment": "stretch",
                                    "spacing": "spacer3"
                                  },
                                  "children": [
                                    {
                                      "type": "template",
                                      "format": "expanded",
                                      "child": {
                                        "fieldKey": "{{item.individualId}}",
                                        "fieldValue": "absent",
                                        "groupKey": "attendanceCollection",
                                        "type": "template",
                                        "format": "selectButton",
                                        "label": "NOT_MATCHED",
                                        "prefixIcon": "Close",
                                        "properties": {
                                          "color": "red",
                                          "type": "primary",
                                          "selectedType": "secondary",
                                          "size": "small",
                                          "mainAxisAlignment": "center"
                                        },
                                        "onAction": [
                                          {
                                            "actionType": "CLOSE_POPUP",
                                            "properties": {}
                                          }
                                        ]
                                      }
                                    },
                                    {
                                      "type": "template",
                                      "format": "expanded",
                                      "child": {
                                        "fieldKey": "{{item.individualId}}",
                                        "fieldValue": "present",
                                        "groupKey": "attendanceCollection",
                                        "type": "template",
                                        "format": "selectButton",
                                        "label": "MATCHED",
                                        "prefixIcon": "Check",
                                        "properties": {
                                          "color": "green",
                                          "type": "primary",
                                          "selectedType": "secondary",
                                          "size": "small",
                                          "mainAxisAlignment": "center"
                                        },
                                        "onAction": [
                                          {
                                            "actionType": "CLOSE_POPUP",
                                            "properties": {}
                                          }
                                        ]
                                      }
                                    }
                                  ]
                                }
                              ]
                            },
                            "onAction": [
                              {"actionType": "CLOSE_POPUP", "properties": {}}
                            ]
                          }
                        ],
                        "onAction": []
                      }
                    }
                  },
                  {
                    "type": "template",
                    "format": "expanded",
                    "child": {
                      "fieldKey": "{{item.individualId}}",
                      "fieldValue": "absent",
                      "groupKey": "attendanceCollection",
                      "type": "template",
                      "format": "selectButton",
                      "label": "ABSENT",
                      "prefixIcon": "Close",
                      "properties": {
                        "color": "red",
                        "type": "{{fn:buttonType(widgetData, item, 0.0)}}",
                        "selectedType": "primary",
                        "size": "small",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {"actionType": "CLOSE_POPUP", "properties": {}}
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
      "name": "attendanceAcknowledgement",
      "header": [
        {
          "label": "Back",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "manageAttendance", "type": "TEMPLATE"}
            }
          ],
          "mandatory": true
        }
      ],
      "body": [
        {
          "type": "template",
          "label": "ATTENDANCE_SUBMITTED_SUCCESS_MSG",
          "format": "panelCard",
          "heading": "ATTENDANCE_SUBMITTED_SUCCESS_MSG",
          "fieldName": "attendanceSuccess",
          "mandatory": true,
          "properties": {"type": "success"},
          "description": "ACKNOWLEDGEMENT_SUCCESS_DESCRIPTION_TEXT",
          "primaryAction": {
            "type": "template",
            "label": "GO_TO_ATTENDANCE_REGISTERS",
            "format": "button",
            "hidden": false,
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "name": "manageAttendance",
                  "type": "TEMPLATE",
                  "navigationMode": "popUntil",
                  "popUntilPageName": "manageAttendance"
                }
              }
            ],
            "fieldName": "backToAttendance",
            "mandatory": true,
            "properties": {"type": "primary"}
          }
        }
      ]
    }
  ]
};
