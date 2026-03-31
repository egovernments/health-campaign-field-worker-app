final dynamic markAttendanceFlow = {
  "screenType": "TEMPLATE",
  "name": "markAttendance",
  "heading": "LABEL_MARK_ATTENDANCE",
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
            "key": "registerId",
            "value": "{{navigation.registerId}}",
            "operation": "equals"
          }
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
            "value": "{{singleton.selectedProject.tenantId}}",
            "operation": "equals"
          }
        ],
        "name": "attendance",
        "type": "SEARCH_EVENT"
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
          }
        ],
        "name": "individual",
        "type": "SEARCH_EVENT"
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
          }
        ],
        "name": "name",
        "type": "SEARCH_EVENT"
      }
    },
  ],
  "wrapperConfig": {
    "filters": [],
    "relations": [
      {
        "name": "attendees",
        "entity": "AttendeeModel",
        "match": {"field": "registerId", "equalsFrom": "id"},
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
        "attendance",
        "individual",
        "name"
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
                // {
                //   "actionType": "SUBMIT_ATTENDANCE",
                //   "properties": {
                //     "isNotSingleSession":
                //         "{{fn:isNotSingleSession(contextData.0.AttendanceRegisterModel)}}",
                //   }
                // },
                // {
                //   "actionType": "CREATE_EVENT",
                //   "properties": {"entity": "AttendanceLogModel"}
                // },
                // {
                //   "actionType": "NAVIGATION",
                //   "properties": {
                //     "type": "TEMPLATE",
                //     "name": "attendanceAcknowledgement"
                //   }
                // }
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
        {
          "type": "template",
          "format": "expanded",
          "child": {
            "type": "template",
            "format": "searchBar",
            "label": "CORE_COMMON_SEARCH",
            "fieldName": "searchBar",
            "onAction": []
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
      "type": "template",
      "format": "markAttendanceCard",
      "fieldName": "makeAttendanceCard",
      "groupByTeam": true,
      "signatureCapture": true,
      "scanQrCode": true,
      "proofOfWork": false,
      "components": {
        "presentButton": {
          "type": "template",
          "format": "button",
          "label": "PRESENT",
          "prefixIcon": "Check",
          "properties": {
            "type": "secondary",
            "size": "small",
            "color": "green",
            "mainAxisAlignment": "center"
          },
        },
        "absentButton": {
          "type": "template",
          "format": "button",
          "label": "ABSENT",
          "prefixIcon": "Close",
          "properties": {
            "type": "secondary",
            "size": "small",
            "color": "red",
            "mainAxisAlignment": "center"
          },
        },
        "signatureButton": {
          "type": "template",
          "format": "button",
          "label": "SIGNATURE",
          "properties": {
            "type": "secondary",
            "size": "small",
            "mainAxisAlignment": "center"
          },
        },
        "statusMapping": {
          "-1.0": "ATTENDANCE_UNMARKED",
          "0.0": "MARK_AS_ABSENT",
          "1.0": "MARK_AS_PRESENT",
        },
        "attendanceMarkInfo": {
          "title": "MARK_ATTENDANCE_INFO_TITLE",
          "description": "MARK_ATTENDANCE_INFO_DESC",
        }
      },
      "onAction": [],
      "popupConfig": {
        "title": "MARK_ATTENDANCE_COMPARE_SIGNATURE_LABEL",
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
            "captureSignatureLabel": "MARK_ATTENDANCE_CAPTURE_SIGNATURE_LABEL",
            "clearSignatureLabel": "MARK_ATTENDANCE_CLEAR_SIGNATURE_LABEL",
            "saveSignatureLabel": "MARK_ATTENDANCE_SAVE_SIGNATURE_LABEL",
            "signatureRequiredLabel":
                "MARK_ATTENDANCE_SIGNATURE_REQUIRED_LABEL",
            "onAction": [
              // {
              //   "actionType": "MARK_ATTENDANCE",
              //   "properties": {
              //     "status": 1.0,
              //     "data": [
              //       {
              //         "key": "individualId",
              //         "value": "{{item.entity.individualId}}"
              //       },
              //       {
              //         "key": "individualName",
              //         "value": "{{item.entity.individual.name}}"
              //       },
              //       {
              //         "key": "registerId",
              //         "value": "{{item.entity.registerId}}"
              //       },
              //     ]
              //   }
              // },
              {"actionType": "CLOSE_POPUP", "properties": {}},
              {
                "actionType": "OPEN_POPUP",
                "properties": {
                  "title": "MARK_ATTENDANCE_PROOF_OF_WORK_LABEL",
                  "titleIcon": "CheckCircle",
                  "showCloseButton": true,
                  "barrierDismissible": true,
                  "body": [
                    {
                      "type": "template",
                      "format": "signatureCompare",
                      "registerId": "{{item.entity.registerId}}",
                      "individualId": "{{item.entity.individualId}}",
                      "individualName":
                          "{{item.entity.first.individual.name.givenName}}",
                      "existingSignatureData":
                          "{{fn:getAttendeeSignature(contextData.0.attendee.entity.individualId, contextData.0.attendanceLog)}}",
                      "compareSignatureLabel":
                          "MARK_ATTENDANCE_COMPARE_SIGNATURE_LABEL",
                      "presentSignatureLabel":
                          "MARK_ATTENDANCE_PRESENT_SIGNATURE_LABEL",
                      "absentSignatureLabel":
                          "MARK_ATTENDANCE_ABSENT_SIGNATURE_LABEL",
                      "onAction": [
                        {"actionType": "CLOSE_POPUP", "properties": {}},
                      ]
                    },
                  ]
                }
              }
            ]
          }
        ],
        "onAction": []
      },
    }
  ]
};
