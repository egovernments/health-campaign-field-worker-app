final dynamic markAttendanceFlow = {
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
    },
    // {
    //   "actionType": "OPEN_POPUP",
    //   "properties": {
    //     "popupConfig": {
    //       "title": "LABEL_MARK_ATTENDANCE",
    //       "showCloseButton": true,
    //       "barrierDismissible": true,
    //       "waitForContextKeys": ["stateWrapper.0.AttendanceRegisterModel"],
    //       "conditions": [
    //         {"type": "notNull", "key": "stateWrapper.0.AttendanceRegisterModel"}
    //       ],
    //       "waitTimeoutMs": 5000,
    //       "waitPollIntervalMs": 100,
    //       "body": [
    //         {
    //           "type": "template",
    //           "format": "textTemplate",
    //           "value":
    //               "{{contextData.stateWrapper.AttendanceRegisterModel.id}}",
    //         }
    //       ],
    //       "footerActions": [
    //         {
    //           "format": "button",
    //           "type": "template",
    //           "label": "CORE_COMMON_GO_BACK",
    //           "properties": {
    //             "type": "secondary",
    //             "size": "small",
    //             "mainAxisAlignment": "center"
    //           },
    //           "onAction": [
    //             {"actionType": "CLOSE_POPUP", "properties": {}}
    //           ]
    //         }
    //       ]
    //     }
    //   }
    // },
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
          "individualId": "{{individual.0.id}}",
        },
        "relations": [
          {
            "name": "individual",
            "entity": "IndividualModel",
            "match": {"field": "id", "equalsFrom": "individualId"},
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
        "attendance",
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
          "{{fn:isSameDay(widgetData.selectedDate, contextData.0.AttendanceRegisterModel, widgetData.sessionToggle)}}",
      "format": "attendanceQRScannerButton",
      "type": "template",
      "fieldName": "createReferral",
      "label": "SCAN_QR_CODE",
      "prefixIcon": "QrCodeScanner",
      "properties": {
        "type": "secondary",
        "size": "large",
        "mainAxisSize": "max",
        "mainAxisAlignment": "center"
      },
      "onAction": []
    },
    {
      "disabled":
          "{{fn:allAttendanceSelected(contextData.0.attendees, widgetData.attendanceCollection)}}",
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
                "{{fn:createAttendanceLog(widgetData, contextData.0.attendanceLog, contextData.0.AttendanceRegisterModel, 0)}}"
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
          "{{fn:allAttendanceSelected(contextData.0.attendees, widgetData.attendanceCollection)}}",
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
              "inputType": "multiline",
            },
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
                {"actionType": "CLOSE_POPUP", "properties": {}},
                {
                  "actionType": "CUSTOM_DATA",
                  "properties": {
                    "entities":
                        "{{fn:createAttendanceLog(widgetData, contextData.0.attendanceLog, contextData.0.AttendanceRegisterModel, 1)}}"
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
                {"actionType": "CLOSE_POPUP", "properties": {}},
              ]
            },
          ]
        }
      },
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
              "signatureCapture"
            ],
          }
        },
        {
          "actionType": "CUSTOM_DATA",
          "properties": {
            "widgetData":
                "{{fn:setAttendanceDate(widgetData.selectedDate, contextData.0.AttendanceRegisterModel, widgetData.sessionToggle)}}"
          }
        },
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
              "signatureCapture"
            ],
          }
        },
        {
          "actionType": "CUSTOM_DATA",
          "properties": {
            "widgetData":
                "{{fn:setAttendanceDate(widgetData.selectedDate, contextData.0.AttendanceRegisterModel, widgetData.sessionToggle)}}"
          }
        },
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
        // {
        //   "type": "template",
        //   "format": "expanded",
        //   "child": {
        //     "type": "template",
        //     "format": "searchBar",
        //     "label": "CORE_COMMON_SEARCH",
        //     "fieldName": "searchBar",
        //     "mandatory": true,
        //     "validations": [
        //       {"type": "minSearchChars", "value": 2}
        //     ],
        //     "minSearchChars": 2,
        //     "onAction": [
        //       {
        //         "actionType": "SEARCH_EVENT",
        //         "properties": {
        //           "data": [
        //             {
        //               "key": "givenName",
        //               "value": "field.value",
        //               "operation": "contains"
        //             }
        //           ],
        //           "name": "name",
        //           "type": "SEARCH_EVENT"
        //         }
        //       }
        //     ],
        //   },
        // },
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
          },
        },
        {
          "type": "template",
          "format": "sizedBox",
          "width": 12.0,
        },
        {
          "type": "template",
          "format": "sizedBox",
          "width": 100.0,
          "child": {
            "type": "template",
            "format": "actionPopup",
            "label": "Filter",
            "prefixIcon": "FilterAlt",
            "fieldName": "filterButton",
            "properties": {
              "type": "secondary",
              "size": "small",
              "mainAxisAlignment": "center",
              "padding": "spacer4",
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
                      },
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
                            "value": false,
                          },
                          {
                            "type": "template",
                            "format": "textTemplate",
                            "value": "UNMARKED_ATTENDANCE_ONLY",
                          }
                        ]
                      },
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
                            "mainAxisAlignment": "center"
                          },
                          "onAction": [
                            {
                              "actionType": "CLEAR_STATE",
                              "properties": {
                                "widgetKeys": [
                                  "checkboxValue",
                                  "searchBar",
                                  "SORT_BY"
                                ],
                              }
                            }
                          ]
                        }
                      },
                      {
                        "type": "template",
                        "format": "sizedBox",
                        "width": 12.0,
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
                            "mainAxisAlignment": "center"
                          },
                          "onAction": [
                            {"actionType": "CLOSE_POPUP", "properties": {}},
                          ]
                        }
                      }
                    ]
                  }
                ],
                "onAction": []
              }
            },
          },
        },
      ]
    },
    {
      "data": "AttendanceWrapper",
      "dataSource": "attendees",
      "attendanceLogs":
          "{{fn:todayAttendanceLogs(widgetData, contextData.0.AttendanceRegisterModel)}}",
      "type": "template",
      "format": "groupListView",
      "fieldName": "groupListView",
      "emptyListMessage": "NO_RESULTS_FOUND",
      "properties": {"spacing": "spacer4", "groupTextStyle": "headingM"},
      "groupBy": {
        "field": "entity.tag",
      },
      "clientFilter": [
        {
          "type": "search",
          "field": "name",
          "widgetKey": "searchBar",
          "operation": "contains"
        }
      ],
      "init": {
        "actionType": "CUSTOM_DATA",
        "properties": {
          "widgetData":
              "{{fn:initializeAttendanceCollection(contextData.0.attendees, contextData.0.attendanceLog)}}"
        }
      },
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
            "properties": {
              "style": "bodyL",
            }
          },
          {
            "type": "template",
            "format": "textTemplate",
            "value": "{{fn:attendanceStatus(widgetData, item)}}",
          },
          {
            "type": "template",
            "format": "customRow",
            "hide":
                "{{fn:showMarkAttendanceButtons(widgetData, item, contextData.0.AttendanceRegisterModel)}}",
            "properties": {
              "mainAxisAlignment": "start",
              "crossAxisAlignment": "stretch",
            },
            "children": [
              {
                "type": "template",
                "format": "expanded",
                "child": {
                  "fieldKey": "{{item.individualId}}",
                  "fieldValue": "present",
                  "groupKey": "attendanceCollection",
                  "type": "template",
                  "format": "selectButton",
                  "label": "PRESENT",
                  "prefixIcon": "Check",
                  "properties": {
                    "color": "green",
                    "type": "secondary",
                    "selectedType": "primary",
                    "size": "small",
                    "mainAxisAlignment": "center"
                  },
                  "onAction": [
                    {
                      "actionType": "CUSTOM_DATA",
                      "properties": {
                        "widgetData":
                            "{{fn:markAttendance(widgetData, item.entity, contextData.0.AttendanceRegisterModel, 1)}}"
                      }
                    }
                  ]
                }
              },
              {
                "type": "template",
                "format": "sizedBox",
                "width": 12.0,
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
                    "type": "secondary",
                    "selectedType": "primary",
                    "size": "small",
                    "mainAxisAlignment": "center"
                  },
                  "onAction": [
                    {
                      "actionType": "CUSTOM_DATA",
                      "properties": {
                        "widgetData":
                            "{{fn:markAttendance(widgetData, item.entity, contextData.0.AttendanceRegisterModel, 0)}}"
                      }
                    }
                  ]
                }
              }
            ]
          }
        ],
      },
    }
  ]
};
