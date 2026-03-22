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
      "label": "BUTTON_MARK_ATTENDANCE",
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
      "format": "actionPopup",
      "type": "template",
      "fieldName": "submitAttendance",
      "label": "CORE_COMMON_SUBMIT",
      "properties": {
        "type": "secondary",
        "size": "large",
        "mainAxisSize": "max",
        "mainAxisAlignment": "center",
        "popupConfig": {
          "title": "MARK_ATTENDANCE_FILTER_TITLE",
          "description": "MARK_ATTENDANCE_FILTER_DESC",
          "showCloseButton": true,
          "barrierDismissible": true,
          "body": [
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
              "label": "BUTTON_MARK_ATTENDANCE",
              "properties": {
                "type": "primary",
                "size": "large",
                "mainAxisSize": "max",
                "mainAxisAlignment": "center"
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
          ],
        }
      },
      "onAction": []
    }
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
      "onAction": []
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
            "label": "CORE_COMMON_SEARCH_BY_NAME_OR_ID",
            "fieldName": "searchBar",
            "onAction": [
              {
                "actionType": "SEARCH_EVENT",
                "properties": {
                  "name": "individual",
                  "data": [
                    {
                      "key": "givenName",
                      "value": "field.value",
                      "operation": "contains"
                    }
                  ]
                }
              }
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
                        "value": "Show only absentees"
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
    {
      "data": "AttendanceWrapper",
      "dataSource": "attendees",
      "type": "template",
      "format": "listView",
      "hidden": false,
      "fieldName": "listView",
      "properties": {"spacing": "spacer4"},
      "child": {
        "type": "template",
        "format": "card",
        "visible": "{{fn:isActiveAttendee(item.entity.denrollmentDate)}}",
        "children": [
          {
            "type": "template",
            "format": "expanded",
            "child": {
              "type": "template",
              "format": "row",
              "properties": {
                "mainAxisAlignment": 'spaceBetween',
              },
              "children": [
                {
                  "type": "template",
                  "format": "textTemplate",
                  "value": "{{item.entity.tag}}",
                  "properties": {"style": "headingS"}
                },
              ]
            },
          },
          // {
          //   "type": "template",
          //   "format": "textTemplate",
          //   "value": "Target Achievement",
          // },
          // {
          //   "type": "template",
          //   "format": "row",
          //   "properties": {
          //     "mainAxisAlignment": 'stretch',
          //   },
          //   "children": [
          //     {
          //       "type": "template",
          //       "format": "expanded",
          //       "child": {
          //         "type": "template",
          //         "format": "progressBar",
          //         "valueColor": "green",
          //         "value": 0.4,
          //       },
          //     },
          //   ]
          // },
          {
            "type": "template",
            "format": "card",
            "visible":
                "{{fn:isLogNotMarked(item.entity.individualId, widgetData.selectedAttendanceDate.entryTime, contextData.0.attendanceLog, widgetData.checkboxValue)}}",
            "properties": {"type": "secondary"},
            "children": [
              {
                "type": "template",
                "format": "textTemplate",
                "value": "{{item.individual.0.name.givenName}}",
                "properties": {"style": "bodyS"}
              },
              {
                "type": "template",
                "format": "row",
                "children": [
                  {
                    "type": "template",
                    "format": "textTemplate",
                    "value":
                        "{{fn:attendanceStatus(contextData.0.attendanceLog, item.entity.individualId, widgetData.selectedAttendanceDate.entryTime, widgetData.attendanceCollection)}}",
                  },
                ]
              },
              {
                "type": "template",
                "format": "row",
                "visible":
                    "{{fn:isLogNotMarked(item.entity.individualId, widgetData.selectedAttendanceDate.entryTime, contextData.0.attendanceLog)}}",
                "properties": {
                  "mainAxisAlignment": "spaceBetween",
                },
                "children": [
                  {
                    "type": "template",
                    "format": "expanded",
                    "child": {
                      "type": "template",
                      "format": "actionPopup",
                      "label": "PRESENT",
                      "prefixIcon": "Check",
                      "fieldName": "markPresentPopup",
                      "properties": {
                        "color": "green",
                        "type": "secondary",
                        "size": "small",
                        "mainAxisAlignment": "center",
                        "prefixIcon": "Check",
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
                              "captureSignatureLabel":
                                  "MARK_ATTENDANCE_CAPTURE_SIGNATURE_LABEL",
                              "clearSignatureLabel":
                                  "MARK_ATTENDANCE_CLEAR_SIGNATURE_LABEL",
                              "saveSignatureLabel":
                                  "MARK_ATTENDANCE_SAVE_SIGNATURE_LABEL",
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
                        }
                      },
                    },
                  },
                  {"type": "template", "format": "sizedBox", "width": 8.0},
                  {
                    "type": "template",
                    "format": "expanded",
                    "child": {
                      "type": "template",
                      "format": "button",
                      "label": "ABSENT",
                      "prefixIcon": "Close",
                      "properties": {
                        "type": "secondary",
                        "size": "small",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "MARK_ATTENDANCE",
                          "properties": {
                            "status": 0.0,
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
                      ]
                    }
                  }
                ]
              }
            ]
          }
        ],
        "fieldName": "complaintCard",
      }
    }
  ]
};
