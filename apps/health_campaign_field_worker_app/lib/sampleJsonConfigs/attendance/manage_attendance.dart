final dynamic manageAttendanceFlow = {
  "screenType": "TEMPLATE",
  "name": "manageAttendance",
  "heading": "MANAGE_ATTENDANCE",
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
    }
  ],
  "wrapperConfig": {
    "filters": [],
    "relations": [],
    "rootEntity": "AttendanceRegisterModel",
    "wrapperName": "AttendanceWrapper",
    "searchConfig": {
      "select": ["attendanceRegister", "attendee"],
      "primary": "attendanceRegister"
    }
  },
  "header": [
    {
      "format": "backLink",
      "type": "template",
      "label": "MANAGE_ATTENDANCE_BACK_BUTTON_LABEL",
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
      "visibilityCondition": "{{ context.AttendanceWrapper.empty }}",
      "child": {
        "type": "template",
        "format": "card",
        "children": [
          {
            "data": [
              {
                "key": "CAMPAIGN_NAME",
                "value":
                    "{{fn:getAdditionalDetails(item.AttendanceRegisterModel.additionalDetails, 'campaignName')}}",
              },
              {
                "key": "EVENT_TYPE",
                "value":
                    "{{fn:getAdditionalDetails(item.AttendanceRegisterModel.additionalDetails, 'eventType')}}",
              },
              {
                "key": "STAFF_COUNT",
                "value": "{{item.AttendeeModel.attendees.length}}"
              },
              {
                "key": "START_DATE",
                "value":
                    "{{fn:formatDate(item.AttendanceRegisterModel.startDate, 'date', dd MMM yyyy)}}"
              },
              {
                "key": "END_DATE",
                "value":
                    "{{fn:formatDate(item.AttendanceRegisterModel.endDate, 'date', dd MMM yyyy)}}"
              },
              {
                "key": "STATUS",
                "value": "{{item.AttendanceRegisterModel.status}}"
              },
              {
                "key": "ATTENDANCE_COMPLETION",
                "value": "{{item.AttendanceRegisterModel.status}}"
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
                  "type": "TEMPLATE",
                  "name": "markAttendance",
                  "data": []
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
        "fieldName": "complaintCard"
      },
    },
  ]
};
