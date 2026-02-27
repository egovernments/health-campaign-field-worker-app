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
        "name": "pgrService",
        "type": "SEARCH_EVENT"
      }
    }
  ],
  "wrapperConfig": {
    "filters": [],
    "relations": [],
    "rootEntity": "PgrServiceModel",
    "wrapperName": "ComplaintWrapper",
    "searchConfig": {
      "select": ["pgrService"],
      "primary": "pgrService"
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
      "data": "ComplaintWrapper",
      "type": "template",
      "format": "listView",
      "hidden": false,
      "fieldName": "listView",
      "properties": {"spacing": "spacer4"},
      "visibilityCondition": "{{ context.ComplaintWrapper.empty }}",
      "child": {
        "type": "template",
        "format": "card",
        "children": [
          {
            "data": [
              {
                "key": "CAMPAIGN_NAME",
                "value": "Test Campaign",
                "defaultValue": "Sync data to generate complaint number"
              },
              {"key": "EVENT_TYPE", "value": "Test type"},
              {
                "key": "STAFF_COUNT",
              },
              {
                "key": "START_DATE",
                "value":
                    "{{fn:formatDate(item.PgrServiceModel.auditDetails.createdTime, 'date', dd MMM yyyy)}}"
              },
              {
                "key": "END_DATE",
                "value":
                    "{{fn:formatDate(item.PgrServiceModel.auditDetails.createdTime, 'date', dd MMM yyyy)}}"
              },
              {
                "key": "STATUS",
                "value": "{{item.PgrServiceModel.applicationStatus}}"
              },
              {
                "key": "ATTENDANCE_COMPLETION",
                "value": "{{item.PgrServiceModel.applicationStatus}}"
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
