var attendanceAcknowledgementFlow = {
  "name": "attendanceAcknowledgement",
  "header": [
    {
      "label": "Back",
      "format": "backLink",
      "onAction": [
        {
          "actionType": "BACK_NAVIGATION",
          "properties": {"name": "complaintInbox", "type": "TEMPLATE"}
        }
      ],
      "mandatory": true
    }
  ],
  "heading": "",
  "screenType": "TEMPLATE",
  "description": "",
  "body": [
    {
      "type": "template",
      "label": "ATTENDANCE_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_LABEL",
      "format": "panelCard",
      "heading": "ATTENDANCE_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_LABEL",
      "fieldName": "attendanceSuccess",
      "mandatory": true,
      "properties": {"type": "success"},
      "description":
          "ATTENDANCE_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_DESCRIPTION",
      "primaryAction": {
        "type": "template",
        "label": "ATTENDANCE_ACKNOWLEDGEMENT_SUCCESS_PANEL_CARD_ACTION_LABEL",
        "format": "button",
        "hidden": false,
        "onAction": [
          {
            "actionType": "NAVIGATION",
            "properties": {"name": "attendanceInbox", "type": "TEMPLATE"}
          }
        ],
        "fieldName": "backToAttendance",
        "mandatory": true,
        "properties": {"type": "primary"}
      }
    }
  ],
};
