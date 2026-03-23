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
            "value": "{{navigationData.registerId}}",
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
            "value": "{{navigationData.registerId}}",
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
    // {
    //   "actionType": "OPEN_POPUP",
    //   "properties": {
    //     "popupConfig": {
    //       "title": "ACTION_REQUIRED",
    //       "showCloseButton": true,
    //       "barrierDismissible": true,
    //       "body": [
    //         {
    //           "type": "template",
    //           "format": "card",
    //           "children": [
    //             {
    //               "type": "template",
    //               "format": "textTemplate",
    //               "value": "MISSED_ATTENDANCE_INFO",
    //             },
    //             {
    //               "type": "template",
    //               "format": "textTemplate",
    //               "value": "{{fn:getMissedDays(contextData.0.attendanceLog)}}",
    //             },
    //           ]
    //         },
    //         {
    //           "format": "button",
    //           "type": "template",
    //           "fieldName": "dateChangeProceed",
    //           "label": "DATE_CHANGE_PROCEED",
    //           "properties": {
    //             "type": "primary",
    //             "size": "large",
    //             "mainAxisSize": "max",
    //             "mainAxisAlignment": "center"
    //           },
    //           "onAction": [
    //             {"actionType": "CLOSE_POPUP", "properties": {}},
    //           ]
    //         },
    //       ],
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
          "{{fn:isSameDay(widgetData.selectedAttendanceDate, contextData.0.attendanceLog)}}",
      "format": "attendanceQRScannerButton",
      "type": "template",
      "fieldName": "createReferral",
      "label": "SCAN_QR_CODE",
      "prefixIcon": "QrCodeScanner",
      "properties": {
        "type": "primary",
        "size": "large",
        "mainAxisSize": "max",
        "mainAxisAlignment": "center"
      },
      "onAction": []
    },
    {
      "format": "button",
      "type": "template",
      "fieldName": "submitAttendance",
      "label": "SAVE_AND_SUBMIT",
      "disabled":
          "{{fn:allAttendanceSelected(contextData.0.attendees, widgetData.attendanceCollection)}}",
      "properties": {
        "type": "secondary",
        "size": "large",
        "mainAxisSize": "max",
        "mainAxisAlignment": "center",
      },
      "onAction": [
        // {"actionType": "SUBMIT_ATTENDANCE", "properties": {}},
        // {
        //   "actionType": "CREATE_EVENT",
        //   "properties": {"entity": "AttendanceLogModel"}
        // },
        {
          "actionType": "OPEN_POPUP",
          "properties": {
            "popupConfig": {
              "title": "CONFIRMATION_LABEL",
              "showCloseButton": true,
              "barrierDismissible": true,
              "body": [
                {
                  "type": "template",
                  "format": "textTemplate",
                  "value": 'COMMENT_KEY'
                },
                {
                  "type": "template",
                  "format": "textInput",
                  "fieldName": "COMMENT",
                  "inputType": "multiline",
                },
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
                    {"actionType": "SUBMIT_ATTENDANCE", "properties": {}},
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
              ],
            }
          }
        },
      ]
    },
    // {
    //   "format": "actionPopup",
    //   "type": "template",
    //   "fieldName": "submitAttendance",
    //   "label": "CORE_COMMON_SUBMIT",
    //   "properties": {
    //     "type": "secondary",
    //     "size": "large",
    //     "mainAxisSize": "max",
    //     "mainAxisAlignment": "center",
    //     "popupConfig": {
    //       "title": "MARK_ATTENDANCE_FILTER_TITLE",
    //       "description": "MARK_ATTENDANCE_FILTER_DESC",
    //       "showCloseButton": true,
    //       "barrierDismissible": true,
    //       "body": [
    //         {
    //           "type": "template",
    //           "format": "textInput",
    //           "fieldName": "COMMENT",
    //           "inputType": "multiline",
    //         },
    //         {
    //           "format": "button",
    //           "type": "template",
    //           "fieldName": "createReferral",
    //           "label": "BUTTON_MARK_ATTENDANCE",
    //           "properties": {
    //             "type": "primary",
    //             "size": "large",
    //             "mainAxisSize": "max",
    //             "mainAxisAlignment": "center"
    //           },
    //           "onAction": [
    //             {"actionType": "CLOSE_POPUP", "properties": {}},
    //             {"actionType": "SUBMIT_ATTENDANCE", "properties": {}},
    //             {
    //               "actionType": "CREATE_EVENT",
    //               "properties": {"entity": "AttendanceLogModel"}
    //             },
    //             {
    //               "actionType": "NAVIGATION",
    //               "properties": {
    //                 "type": "TEMPLATE",
    //                 "name": "attendanceAcknowledgement"
    //               }
    //             }
    //           ]
    //         },
    //       ],
    //     }
    //   },
    //   "onAction": []
    // }
  ],
  "body": [
    {
      "type": "template",
      "format": "date",
      "fieldKey": "selectedAttendanceDate",
      "label": "MARK_ATTENDANCE_DATE",
      "innerLabel": "Select date",
      "startDate": "{{contextData.0.AttendanceRegisterModel.startDate}}",
      "endDate": "{{fn:todayDate()}}",
      "onAction": [
        {
          "actionType": "CLEAR_STATE",
          "properties": {
            "widgetKeys": ["attendanceCollection", "attendanceManualData"],
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
                "description": "MARK_ATTENDANCE_FILTER_DESC",
                "titleIcon": "FilterAlt",
                "showCloseButton": true,
                "barrierDismissible": true,
                "body": [
                  {
                    "type": "template",
                    "format": "row",
                    "children": [
                      {
                        "type": "template",
                        "format": "checkbox",
                        "value": true,
                      },
                      {
                        "type": "template",
                        "format": "textTemplate",
                        "value": "UNMARKED_ATTENDANCE_ONLY",
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
                            "mainAxisAlignment": "center"
                          },
                          "onAction": [
                            {"actionType": "CLOSE_POPUP", "properties": {}},
                            {
                              "actionType": "CLEAR_STATE",
                              "properties": {
                                "widgetKeys": ["checkboxValue", "searchBar"],
                              }
                            }
                          ]
                        }
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
    // {
    //   "type": "template",
    //   "format": "labeledToggle",
    //   "visible":
    //       "{{fn:isNotSingleSession(contextData.0.AttendanceRegisterModel)}}",
    //   "activeLabel": "Morning Session",
    //   "inactiveLabel": "Afternoon Session",
    //   "onAction": []
    // },
    {
      "type": "template",
      "format": "markAttendanceCard",
      "fieldName": "makeAttendanceCard",
      "groupByTeam": false,
      "signatureCapture": false,
      "scanQrCode": true,
      "proofOfWork": false,
      "components": {
        "presentButton": {
          "type": "template",
          "format": "button",
          "label": "PRESENT",
          "prefixIcon": "Close",
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
      "popupConfig": {
        "title": "MARK_ATTENDANCE_CONFIRM_TITLE",
        "description": "MARK_ATTENDANCE_CONFIRM_PRESENT_DESC",
        "titleIcon": "CheckCircle",
        "showCloseButton": true,
        "barrierDismissible": true,
        "body": [
          {
            "type": "template",
            "format": "signatureCapture",
            "fieldName": "signature",
            "individualName": "individualName",
            "existingSignatureData":
                "{{fn:getAttendeeSignature(contextData.0.attendee.entity.individualId, contextData.0.attendanceLog)}}",
            "compareSignatureLabel": "MARK_ATTENDANCE_COMPARE_SIGNATURE_LABEL",
            "presentSignatureLabel": "MARK_ATTENDANCE_PRESENT_SIGNATURE_LABEL",
            "absentSignatureLabel": "MARK_ATTENDANCE_ABSENT_SIGNATURE_LABEL",
            "captureSignatureLabel": "MARK_ATTENDANCE_CAPTURE_SIGNATURE_LABEL",
            "clearSignatureLabel": "MARK_ATTENDANCE_CLEAR_SIGNATURE_LABEL",
            "saveSignatureLabel": "MARK_ATTENDANCE_SAVE_SIGNATURE_LABEL",
            "signatureRequiredLabel":
                "MARK_ATTENDANCE_SIGNATURE_REQUIRED_LABEL",
            "onAction": [
              {
                "actionType": "MARK_ATTENDANCE",
                "properties": {
                  "status": 1.0,
                  "data": [
                    {
                      "key": "individualId",
                      "value": "{{item.entity.individualId}}"
                    },
                    {
                      "key": "registerId",
                      "value": "{{item.entity.registerId}}"
                    },
                  ]
                }
              },
              {"actionType": "CLOSE_POPUP", "properties": {}},
            ]
          }
        ],
        "onAction": []
      },
    }
  ]
};
