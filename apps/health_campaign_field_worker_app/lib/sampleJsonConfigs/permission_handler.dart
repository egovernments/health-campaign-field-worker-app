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
      "description": "CORE_COMMON_ALLOW_PERMISSIONS",
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
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "NotificationsActive"},
                        {
                          "format": "column",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_NOTIFICATION",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": false,
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
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": false,
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
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "LocationOn"},
                        {
                          "format": "column",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_LOCATION",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": false,
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
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "PermScanWifi"},
                        {
                          "format": "column",
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
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": false,
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
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "PermScanWifi"},
                        {
                          "format": "column",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_BLUETOOTHSCAN",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": false,
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
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {"format": "icon", "value": "PermCameraMic"},
                        {
                          "format": "column",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "format": "textTemplate",
                              "value": "CORE_COMMON_PERMISSION_CAMERA"
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "format": "button",
                      "label": "GRANT_PERMISSION",
                      "hidden": false,
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
