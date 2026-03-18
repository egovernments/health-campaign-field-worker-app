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
    }
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
    // "groupByType": true,
    // "groupBy": "tag",
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
      "visible": "{{fn:isSameDay(widgetData.selectedAttendanceDate.date)}}",
      "format": "button",
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
            "widgetKeys": ["attendanceCollection"],
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
            "onAction": [
              // {
              //   "actionType": "SEARCH_EVENT",
              //   "properties": {
              //     "data": [
              //       {
              //         "key": "givenName",
              //         "value": "{{widgetData.searchBar}}",
              //         "operation": "contains",
              //         "root": "name"
              //       }
              //     ],
              //     "name": "name",
              //     "type": "SEARCH_EVENT"
              //   }
              // }
            ]
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
      "format": "labeledToggle",
      "visible":
          "{{fn:isNotSingleSession(contextData.0.AttendanceRegisterModel)}}",
      "value": "{{widgetData.labeledToggleValue}}",
      "activeLabel": "Morning Session",
      "inactiveLabel": "Afternoon Session",
      "onAction": []
    },
    // {
    //   "data": "AttendanceWrapper",
    //   "dataSource": "attendees",
    //   "type": "template",
    //   "format": "listView",
    //   "hidden": false,
    //   "fieldName": "listView",
    //   "properties": {"spacing": "spacer4"},
    //   "child":
    // }
    {
      "type": "template",
      "format": "markAttendanceCard",
      "fieldName": "makeAttendanceCard",
      // "visible": "{{fn:isActiveAttendee(item.entity.denrollmentDate)}}",
      "groupByTeam": true,
      "signatureCapture": true,
      "scanQrCode": false,
      "proofOfWork": false,
      "statusMapping": {
        "-1.0": "ATTENDANCE_UNMARKED",
        "0.0": "MARK_AS_ABSENT",
        "1.0": "MARK_AS_PRESENT",
      },
      "buttons": [
        {
          "label": "PRESENT",
          "color": "green",
          "prefixIcon": "Check",
        },
        {
          "label": "ABSENT",
          "color": "red",
          "prefixIcon": "Close",
        }
      ],
      "attendanceLogStatus":
          "{{fn:attendanceLogStatus(contextData.0.attendees., widgetData.selectedAttendanceDate.entryTime, contextData.0.attendanceLog)}}",
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
