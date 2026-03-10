final dynamic markAttendanceFlow = {
  "screenType": "TEMPLATE",
  "name": "markAttendance",
  "heading": "MARK_ATTENDANCE",
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
      "primary": "attendanceRegister"
    }
  },
  "header": [
    {
      "format": "backLink",
      "type": "template",
      "label": "MARK_ATTENDANCE_BACK_BUTTON_LABEL",
      "onAction": [
        {"actionType": "BACK_NAVIGATION", "properties": {}}
      ]
    }
  ],
  "footer": [
    {
      "format": "button",
      "type": "template",
      "fieldName": "createReferral",
      "label": "MARK_ATTENDANCE_PRIMARY_ACTION_LABEL",
      "properties": {
        "type": "primary",
        "size": "large",
        "mainAxisSize": "max",
        "mainAxisAlignment": "center"
      },
      "onAction": [
        {
          "actionType": "NAVIGATION",
          "properties": {"type": "FORM", "name": "REFERRAL_CREATE", "data": []}
        }
      ]
    },
    {
      "format": "qrScanner",
      "type": "template",
      "fieldName": "scanQr",
      "label": "MARK_ATTENDANCE_SECONDARY_ACTION_LABEL",
      "properties": {
        "type": "secondary",
        "size": "large",
        "mainAxisSize": "max",
        "mainAxisAlignment": "center"
      },
      "onAction": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {"type": "FORM", "name": "COMPLAINT_CREATE", "data": []}
        }
      ]
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
      "endDate": "{{contextData.0.AttendanceRegisterModel.endDate}}",
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
            "label": "MARK_ATTENDANCE_SEARCH_BY_NAME",
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
          "format": "expanded",
          "child": {
            "type": "template",
            "format": "actionPopup",
            "label": "Filter",
            "prefixIcon": "FilterAlt",
            "fieldName": "filterButton",
            "properties": {
              "type": "secondary",
              "size": "large",
              "mainAxisAlignment": "center",
              "popupConfig": {
                "title": "MARK_ATTENDANCE_FILTER_TITLE",
                "description": "MARK_ATTENDANCE_FILTER_DESC",
                "titleIcon": "FilterAlt",
                "showCloseButton": true,
                "barrierDismissible": true,
                "body": [],
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
      "type": "template",
      "format": "listView",
      "hidden": false,
      "fieldName": "listView",
      "properties": {"spacing": "spacer4"},
      "child": {
        "type": "template",
        "format": "card",
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
                  "value": "{{item.tag}}",
                  "properties": {"style": "headingS"}
                },
              ]
            },
          },
          {
            "type": "template",
            "format": "textTemplate",
            "value": "Target Achievement",
          },
          {
            "type": "template",
            "format": "row",
            "properties": {
              "mainAxisAlignment": 'stretch',
            },
            "children": [
              {
                "type": "template",
                "format": "expanded",
                "child": {
                  "type": "template",
                  "format": "progressBar",
                  "valueColor": "green",
                  "value": 0.4,
                },
              },
              {
                "type": "template",
                "format": "sizedBox",
                "width": 4.0,
              },
              {
                "type": "template",
                "format": "textTemplate",
                "value": "40%",
              },
            ]
          },
          {
            "type": "template",
            "format": "card",
            "properties": {"type": "secondary"},
            "children": [
              {
                "type": "template",
                "format": "textTemplate",
                "value": "{{widgetData.selectedAttendanceDate.entryTime}}",
                "properties": {"style": "headingM"}
              },
              {
                "type": "template",
                "format": "row",
                "children": [
                  {
                    "type": "template",
                    "format": "textTemplate",
                    "value":
                        "{{fn:attendanceStatus(contextData.0.attendanceLog, item.individualId, widgetData.selectedAttendanceDate.entryTime)}}",
                  },
                ]
              },
              {
                "type": "template",
                "format": "visibility",
                "visible": true,
                "child": {
                  "type": "template",
                  "format": "row",
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
                        "label": "MARK_ATTENDANCE_PRESENT",
                        "prefixIcon": "Check",
                        "fieldName": "markPresentPopup",
                        "properties": {
                          "color": "green",
                          "type": "secondary",
                          "size": "large",
                          "mainAxisAlignment": "center",
                          "prefixIcon": "Check",
                          "popupConfig": {
                            "title": "MARK_ATTENDANCE_CONFIRM_TITLE",
                            "description":
                                "MARK_ATTENDANCE_CONFIRM_PRESENT_DESC",
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
                                    "actionType": "FETCH_TRANSFORMER_CONFIG",
                                    "properties": {
                                      "configName": "markAttendancePresent",
                                      "data": [
                                        {
                                          "key": "individualId",
                                          "value": "{{item.individualId}}"
                                        },
                                        {
                                          "key": "registerId",
                                          "value": "{{item.registerId}}"
                                        },
                                        {"key": "status", "value": 1.0},
                                        {
                                          "key": "isSingleSession",
                                          "value":
                                              "{{fn:isSingleSession(item.AttendanceRegisterModel.additionalDetails.sessions)}}"
                                        },
                                        {
                                          "key": "entryTime",
                                          "value":
                                              "{{widgetData.selectedAttendanceDate.entryTime}}"
                                        },
                                        {
                                          "key": "exitTime",
                                          "value":
                                              "{{widgetData.selectedAttendanceDate.exitTime}}"
                                        },
                                        {
                                          "key": "additionalFields",
                                          "value": {
                                            "version": 1,
                                            "fields": [
                                              {
                                                "key": "isMarkedManually",
                                                "value": true
                                              }
                                            ]
                                          }
                                        }
                                      ]
                                    }
                                  },
                                  {
                                    "actionType": "CREATE_EVENT",
                                    "properties": {
                                      "entity": "AttendanceLogModel"
                                    }
                                  },
                                  {
                                    "actionType": "CLOSE_POPUP",
                                    "properties": {}
                                  },
                                  {
                                    "actionType": "SHOW_TOAST",
                                    "properties": {
                                      "message":
                                          "MARK_ATTENDANCE_PRESENT_SUCCESS",
                                      "type": "success"
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
                    {"type": "template", "format": "sizedBox", "width": 8.0},
                    {
                      "type": "template",
                      "format": "expanded",
                      "child": {
                        "type": "template",
                        "format": "button",
                        "label": "MARK_ATTENDANCE_ABSENT",
                        "prefixIcon": "Close",
                        "properties": {
                          "type": "secondary",
                          "size": "large",
                          "mainAxisAlignment": "center"
                        },
                        "onAction": [
                          {
                            "actionType": "FETCH_TRANSFORMER_CONFIG",
                            "properties": {
                              "configName": "markAttendanceAbsent",
                              "data": [
                                {
                                  "key": "individualId",
                                  "value": "{{item.individualId}}"
                                },
                                {
                                  "key": "registerId",
                                  "value": "{{item.registerId}}"
                                },
                                {"key": "status", "value": 0.0},
                                {
                                  "key": "isSingleSession",
                                  "value":
                                      "{{fn:isSingleSession(item.AttendanceRegisterModel.additionalDetails.sessions)}}"
                                },
                                {
                                  "key": "entryTime",
                                  "value":
                                      "{{widgetData.selectedAttendanceDate.entryTime}}"
                                },
                                {
                                  "key": "exitTime",
                                  "value":
                                      "{{widgetData.selectedAttendanceDate.exitTime}}"
                                },
                                {
                                  "key": "additionalFields",
                                  "value": {
                                    "version": 1,
                                    "fields": [
                                      {"key": "isMarkedManually", "value": true}
                                    ]
                                  }
                                }
                              ]
                            }
                          },
                          {
                            "actionType": "CREATE_EVENT",
                            "properties": {"entity": "AttendanceLogModel"}
                          },
                          {
                            "actionType": "SHOW_TOAST",
                            "properties": {
                              "message": "MARK_ATTENDANCE_ABSENT_SUCCESS",
                              "type": "success"
                            }
                          }
                        ]
                      }
                    }
                  ]
                }
              }
            ]
          }
        ],
        "fieldName": "complaintCard",
      }
    }
  ]
};
