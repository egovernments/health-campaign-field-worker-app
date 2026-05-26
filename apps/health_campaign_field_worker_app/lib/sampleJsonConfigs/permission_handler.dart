final dynamic permission_handler_config = {
  "name": "PERMISSIONHANDLER",
  "initialPage": "permissionHandler",
  "order": 6,
  "project": "LLIN-mz",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "permissionHandler",
      "heading": "CORE_COMMON_ALLOW_PERMISSIONS",
      "description": "CORE_COMMON_PERMISSION_ACCESS_PAGE_DESC",
      "header": [
        {
          "format": "backLink",
          "label": "CORE_COMMON_BACK",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        }
      ],
      "footer": [],
      "footer": [
        {
          "format": "checkbox",
          "label": "PERMISSION_HANDLER_ALLOW_BACKGROUND_ACTIVITY",
          "required": true,
          "fieldName": "backgroundActivityConfirmed"
        },
        {
          "format": "button",
          "label": "CORE_COMMON_ALLOW_ACCESS",
          "properties": {
            "type": "primary",
            "size": "large",
            "mainAxisSize": "max"
          },
          "onAction": [
            {"actionType": "REQUEST_ALL_PERMISSIONS", "properties": {}},
            {"actionType": "ATTEMPT_NAVIGATION", "properties": {}}
          ]
        },
        {
          "format": "button",
          "label": "CORE_COMMON_DONT_ALLOW",
          "properties": {
            "type": "secondary",
            "size": "large",
            "mainAxisSize": "max"
          },
          "onAction": [
            {"actionType": "SHOW_DIALOG", "properties": {}}
          ]
        }
      ],
      "initActions": [],
      "wrapperConfig": {
        "wrapperName": "PermissionWrapper",
        "rootEntity": "PermissionModel"
      },
      "body": [
        {
          "format": "column",
          "properties": {"mainAxisAlignment": "start", "mainAxisSize": "min"},
          "children": [
            {
              "format": "card",
              "children": [
                {
                  "format": "row",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "format": "row",
                      "expanded": true,
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "NotificationsActive"},
                        {
                          "format": "column",
                          "expanded": true,
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_NOTIFICATION",
                              "required": true
                            },
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_NOTIFICATION_DESC",
                              "properties": {"style": "description"}
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": true,
                      "visible": "{{ !context.notificationPermissionGranted }}",
                      "properties": {
                        "type": "primary",
                        "size": "small",
                        "mainAxisSize": "min",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "REQUEST_PERMISSION",
                          "properties": {"permission": "notification"}
                        }
                      ]
                    }
                  ]
                },
                {
                  "format": "tag",
                  "label": "{{context.notificationPermissionStatus}}"
                }
              ]
            },
            {
              "format": "card",
              "children": [
                {
                  "format": "row",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "format": "row",
                      "expanded": true,
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "SettingsCell"},
                        {
                          "format": "column",
                          "expanded": true,
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value":
                                  "CORE_COMMON_PERMISSION_IGNOREBATTERYOPTIMIZATIONS",
                              "required": true
                            },
                            {
                              "format": "textTemplate",
                              "value":
                                  "PERMISSION_HANDLER_ALLOW_BACKGROUND_ACTIVITY",
                              "properties": {"style": "description"}
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": true,
                      "visible":
                          "{{ !context.ignoreBatteryOptimizationsPermissionGranted }}",
                      "properties": {
                        "type": "primary",
                        "size": "small",
                        "mainAxisSize": "min",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "REQUEST_PERMISSION",
                          "properties": {
                            "permission": "ignoreBatteryOptimizations"
                          }
                        }
                      ]
                    }
                  ]
                },
                {
                  "format": "tag",
                  "label":
                      "{{context.ignoreBatteryOptimizationsPermissionStatus}}"
                }
              ]
            },
            {
              "format": "card",
              "children": [
                {
                  "format": "row",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "format": "row",
                      "expanded": true,
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "LocationOn"},
                        {
                          "format": "column",
                          "expanded": true,
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_LOCATION",
                              "required": true
                            },
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_LOCATION_DESC",
                              "properties": {"style": "description"}
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": true,
                      "visible": "{{ !context.locationPermissionGranted }}",
                      "properties": {
                        "type": "primary",
                        "size": "small",
                        "mainAxisSize": "min",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "REQUEST_PERMISSION",
                          "properties": {"permission": "location"}
                        }
                      ]
                    }
                  ]
                },
                {
                  "format": "tag",
                  "label": "{{context.locationPermissionStatus}}"
                }
              ]
            },
            {
              "format": "card",
              "visible": "{{ context.showNearbyWifiDevices }}",
              "children": [
                {
                  "format": "row",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "format": "row",
                      "expanded": true,
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "PermScanWifi"},
                        {
                          "format": "column",
                          "expanded": true,
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value":
                                  "CORE_COMMON_PERMISSION_NEARBYWIFIDEVICES",
                              "required": true
                            },
                            {
                              "format": "textTemplate",
                              "value":
                                  "CORE_COMMON_PERMISSION_NEARBYWIFIDEVICES_DESC",
                              "properties": {"style": "description"}
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": true,
                      "visible":
                          "{{ !context.nearbyWifiDevicesPermissionGranted }}",
                      "properties": {
                        "type": "primary",
                        "size": "small",
                        "mainAxisSize": "min",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "REQUEST_PERMISSION",
                          "properties": {"permission": "nearbyWifiDevices"}
                        }
                      ]
                    }
                  ]
                },
                {
                  "format": "tag",
                  "label": "{{context.nearbyWifiDevicesPermissionStatus}}"
                }
              ]
            },
            {
              "format": "card",
              "visible": "{{ context.showBluetoothScan }}",
              "children": [
                {
                  "format": "row",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "format": "row",
                      "expanded": true,
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "PermScanWifi"},
                        {
                          "format": "column",
                          "expanded": true,
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_BLUETOOTHSCAN",
                              "required": true
                            },
                            {
                              "format": "textTemplate",
                              "value":
                                  "CORE_COMMON_PERMISSION_BLUETOOTHSCAN_DESC",
                              "properties": {"style": "description"}
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": true,
                      "visible":
                          "{{ !context.bluetoothScanPermissionGranted }}",
                      "properties": {
                        "type": "primary",
                        "size": "small",
                        "mainAxisSize": "min",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "REQUEST_PERMISSION",
                          "properties": {"permission": "bluetoothScan"}
                        }
                      ]
                    }
                  ]
                },
                {
                  "format": "tag",
                  "label": "{{context.bluetoothScanPermissionStatus}}"
                }
              ]
            },
            {
              "format": "card",
              "children": [
                {
                  "format": "row",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "format": "row",
                      "expanded": true,
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "PermCameraMic"},
                        {
                          "format": "column",
                          "expanded": true,
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_CAMERA",
                              "properties": {"style": "title"}
                            },
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_CAMERA_DESC",
                              "properties": {"style": "description"}
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": true,
                      "visible": "{{ !context.cameraPermissionGranted }}",
                      "properties": {
                        "type": "primary",
                        "size": "small",
                        "mainAxisSize": "min",
                        "mainAxisAlignment": "center"
                      },
                      "onAction": [
                        {
                          "actionType": "REQUEST_PERMISSION",
                          "properties": {"permission": "camera"}
                        }
                      ]
                    }
                  ]
                },
                {"format": "tag", "label": "{{context.cameraPermissionStatus}}"}
              ]
            }
          ]
        }
      ]
    }
  ]
};
