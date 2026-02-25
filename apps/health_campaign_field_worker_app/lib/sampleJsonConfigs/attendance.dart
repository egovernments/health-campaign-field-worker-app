final dynamic attendanceFlows = {
  "name": "ATTENDANCE",
  "initialPage": "referralInbox",
  "order": 9,
  "project": "LLIN-mz",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "referralInbox",
      "heading": "MARK_ATTENDANCE",
      "initActions": [],
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
              "properties": {
                "type": "FORM",
                "name": "REFERRAL_CREATE",
                "data": []
              }
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
              "properties": {
                "type": "FORM",
                "name": "COMPLAINT_CREATE",
                "data": []
              }
            }
          ]
        }
      ],
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
          "format": "dateRowPicker",
          "fieldKey": "selectedAttendanceDate",
          "startDate": "2026-02-14",
          "endDate": "2026-02-28",
          "onAction": []
        },
        {
          "format": "proximitySearch",
          "label": "Only show unmarked attendance",
          "fieldName": "proximitySearch",
          "defaultValue": false,
          "validations": [
            {"key": "proximityRadius", "value": 500}
          ],
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
              "format": "iconButton",
              "iconData": "QrCodeScanner",
              "onAction": [
                {
                  "actionType": "OPEN_SCANNER",
                  "properties": {
                    "scanType": "QR_CODE" // QR_CODE, BARCODE
                  }
                }
              ]
            },
            {
              "type": "template",
              "format": "iconButton",
              "iconData": "SwapVertical",
              "onAction": [
                {
                  "actionType": "OPEN_SCANNER",
                  "properties": {
                    "scanType": "QR_CODE" // QR_CODE, BARCODE
                  }
                }
              ]
            },
          ]
        },
        {
          "type": "template",
          "format": "card",
          "children": [
            {
              "type": "template",
              "format": "card",
              "properties": {"type": "secondary"},
              "children": [
                {
                  "type": "template",
                  "format": "textTemplate",
                  "value": "MARK_ATTENDANCE_NAME_OF_THE_PERSON",
                  "properties": {"style": "headingM"}
                },
                {
                  "type": "template",
                  "format": "row",
                  "children": [
                    {
                      "type": "template",
                      "format": "textTemplate",
                      "value": "MARK_ATTENDANCE_FACIAL_RECOGNITION: ",
                    },
                    {
                      "type": "template",
                      "format": "textTemplate",
                      "value": "Failed",
                    },
                    {
                      "type": "template",
                      "format": "expanded",
                      "child": {
                        "type": "template",
                        "format": "button",
                        "label": "Absent",
                        "properties": {
                          "type": "tertiary",
                          "size": "small",
                          "mainAxisAlignment": "center"
                        }
                      }
                    }
                  ]
                },
                {
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
                        "format": "button",
                        "label": "MARK_ATTENDANCE_PRESENT",
                        "prefixIcon": "Check",
                        "properties": {
                          "color": "green",
                          "type": "secondary",
                          "size": "large",
                          "mainAxisAlignment": "center"
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
                        }
                      }
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
  ]
};
