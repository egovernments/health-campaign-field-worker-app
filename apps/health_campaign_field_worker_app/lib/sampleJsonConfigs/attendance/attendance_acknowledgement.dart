var attendanceAcknowledgementFlow = {
  "screenType": "TEMPLATE",
  "name": "attendanceAcknowledgement",
  "header": [
    {
      "label": "Back",
      "format": "backLink",
      "onAction": [
        {
          "actionType": "BACK_NAVIGATION",
          "properties": {"name": "manageAttendance", "type": "TEMPLATE"}
        }
      ],
      "mandatory": true
    }
  ],
  "body": [
    {
      "type": "template",
      "label": "ATTENDANCE_SUBMITTED_SUCCESS_MSG",
      "format": "panelCard",
      "heading": "ATTENDANCE_SUBMITTED_SUCCESS_MSG",
      "fieldName": "attendanceSuccess",
      "mandatory": true,
      "properties": {"type": "success"},
      "description": "ACKNOWLEDGEMENT_SUCCESS_DESCRIPTION_TEXT",
      "primaryAction": {
        "type": "template",
        "label": "GO_TO_ATTENDANCE_REGISTERS",
        "format": "button",
        "hidden": false,
        "onAction": [
          {
            "actionType": "NAVIGATION",
            "properties": {
              "name": "manageAttendance",
              "type": "TEMPLATE",
              "navigationMode": "popUntil",
              "popUntilPageName": "manageAttendance",
            }
          }
        ],
        "fieldName": "backToAttendance",
        "mandatory": true,
        "properties": {"type": "primary"}
      }
    }
  ],
};
