final dynamic manageAttendanceFlow = {
  "screenType": "TEMPLATE",
  "name": "manageAttendance",
  "heading": "MANAGE_ATTENDANCE",
  "initActions": [],
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
  "wrapperConfig": {
    "wrapperName": "hFReferral",
    "rootEntity": "HFReferralModel",
    "filters": [],
    "relations": [],
    "searchConfig": {
      "primary": "hFReferral",
      "select": ["hFReferral"]
    }
  },
  "body": [
    {
      "type": "template",
      "format": "card",
      "properties": {"type": "secondary"},
      "children": [
        {
          "type": "template",
          "format": "labelValueSummary",
          "items": [
            {"label": "CAMPAIGN_NAME"},
            {"label": "EVENT_TYPE"},
            {"label": "STAFF_COUNT"},
            {"label": "START_DATE", "value": "startDate"},
            {"label": "END_DATE", "value": "endDate"},
            {"label": "STATUS", "value": "status"},
            {"label": "ATTENDANCE_COMPLETION"},
          ],
        },
        {
          "format": "button",
          "type": "template",
          "fieldName": "createReferral",
          "label": "MANAGE_ATTENDANCE_OPEN_REGISTER_LABEL",
          "properties": {
            "type": "primary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "markAttendance",
                "data": []
              }
            }
          ]
        },
      ]
    }
  ]
};
