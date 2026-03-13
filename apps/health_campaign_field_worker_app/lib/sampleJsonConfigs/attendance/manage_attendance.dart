final dynamic manageAttendanceFlow = {
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
      "label": "CORE_COMMON_BACK",
      "onAction": [
        {"actionType": "BACK_NAVIGATION", "properties": {}}
      ]
    }
  ],
  "footer": [],
  "body": [
    {
      "data": "AttendanceWrapper",
      "type": "template",
      "format": "listView",
      "hidden": false,
      "fieldName": "listView",
      "properties": {"spacing": "spacer4"},
      // "visibilityCondition": "{{ context.AttendanceWrapper.empty }}",
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
                    "{{item.AttendanceRegisterModel.additionalDetails.campaignName}}",
              },
              {
                "key": "EVENT_TYPE_LABEL",
                "value":
                    "{{item.AttendanceRegisterModel.additionalDetails.eventType}}",
              },
              {
                "key": "STAFF_COUNT_LABEL",
                "value": "{{fn:length(item.attendees)}}"
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
            "fieldName": "labelPairComplaint"
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
                      "value": "{{item.AttendanceRegisterModel.id}}"
                    }
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
        ],
      },
    },
  ]
};
