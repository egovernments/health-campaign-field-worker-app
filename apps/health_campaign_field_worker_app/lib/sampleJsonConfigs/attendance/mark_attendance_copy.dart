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
          },
          {"key": "uploadToServer", "value": true, "operation": "equals"}
        ],
        "name": "attendance",
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
      },
      {
        "name": "attendanceLog",
        "entity": "AttendanceLogModel",
        "match": {"field": "registerId", "equalsFrom": "id"},
        "filters": [
          {"field": "time", "equals": "{{navigation.entryTime}}"}
        ]
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
      "format": "button",
      "type": "template",
      "fieldName": "submitAttendance",
      "label": "CORE_COMMON_SUBMIT",
      "disabled":
          "{{fn:allAttendanceSelected(contextData.0.attendees, widgetData.attendanceCollection)}}",
      "properties": {
        "type": "secondary",
        "size": "large",
        "mainAxisSize": "max",
        "mainAxisAlignment": "center",
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
        },
      ]
    },
    {
      "data": "AttendeeWrapper",
      "dataSource": "attendees",
      "type": "template",
      "format": "listView",
      "hidden": false,
      "fieldName": "listView",
      "properties": {"spacing": "spacer4"},
      "child": {
        "type": "template",
        "format": "textTemplate",
        "value": "{{item.id}}",
        "properties": {"style": "headingS"}
      },
    },
    {
      "data": "AttendeeWrapper",
      "dataSource": "attendanceLog",
      "type": "template",
      "format": "listView",
      "hidden": false,
      "fieldName": "listView",
      "properties": {"spacing": "spacer4"},
      "child": {
        "type": "template",
        "format": "textTemplate",
        "value": "{{item.time}}",
        "properties": {"style": "headingS"}
      },
    }
  ]
};
