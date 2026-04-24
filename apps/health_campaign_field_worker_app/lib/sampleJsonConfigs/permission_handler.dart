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
          "type": "template",
          "format": "column",
          "fieldName": "permissionsColumn",
          "properties": {"mainAxisAlignment": "start", "mainAxisSize": "min"},
          "children": [
            {
              "type": "template",
              "format": "card",
              "fieldName": "notificationCard",
              "children": [
                {
                  "type": "template",
                  "format": "row",
                  "fieldName": "notificationRow",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "type": "template",
                      "format": "row",
                      "fieldName": "notificationIconTextRow",
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {
                          "type": "template",
                          "format": "icon",
                          "fieldName": "notificationIcon",
                          "value": "NotificationsActive"
                        },
                        {
                          "type": "template",
                          "format": "column",
                          "fieldName": "notificationTextColumn",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "type": "template",
                              "format": "textTemplate",
                              "fieldName": "notificationText",
                              "value": "CORE_COMMON_PERMISSION_NOTIFICATION",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "template",
                      "format": "button",
                      "fieldName": "notificationGrantButton",
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
                  "type": "template",
                  "format": "tag",
                  "fieldName": "notificationStatusTag",
                  "label": "{{context.notificationPermissionStatus}}"
                }
              ]
            },
            {
              "type": "template",
              "format": "card",
              "fieldName": "batteryCard",
              "children": [
                {
                  "type": "template",
                  "format": "row",
                  "fieldName": "batteryRow",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "type": "template",
                      "format": "row",
                      "fieldName": "batteryIconTextRow",
                      "expanded": true,
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {
                          "type": "template",
                          "format": "icon",
                          "fieldName": "batteryIcon",
                          "value": "SettingsCell"
                        },
                        {
                          "type": "template",
                          "format": "column",
                          "fieldName": "batteryTextColumn",
                          "expanded": true,
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "type": "template",
                              "format": "textTemplate",
                              "fieldName": "batteryText",
                              "value":
                                  "CORE_COMMON_PERMISSION_IGNOREBATTERYOPTIMIZATIONS",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "template",
                      "format": "button",
                      "fieldName": "batteryGrantButton",
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
                  "type": "template",
                  "format": "tag",
                  "fieldName": "batteryStatusTag",
                  "label":
                      "{{context.ignoreBatteryOptimizationsPermissionStatus}}"
                }
              ]
            },
            {
              "type": "template",
              "format": "card",
              "fieldName": "locationCard",
              "children": [
                {
                  "type": "template",
                  "format": "row",
                  "fieldName": "locationRow",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "type": "template",
                      "format": "row",
                      "fieldName": "locationIconTextRow",
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {
                          "type": "template",
                          "format": "icon",
                          "fieldName": "locationIcon",
                          "value": "LocationOn"
                        },
                        {
                          "type": "template",
                          "format": "column",
                          "fieldName": "locationTextColumn",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "type": "template",
                              "format": "textTemplate",
                              "fieldName": "locationText",
                              "value": "CORE_COMMON_PERMISSION_LOCATION",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "template",
                      "format": "button",
                      "fieldName": "locationGrantButton",
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
                  "type": "template",
                  "format": "tag",
                  "fieldName": "locationStatusTag",
                  "label": "{{context.locationPermissionStatus}}"
                }
              ]
            },
            {
              "type": "template",
              "format": "card",
              "fieldName": "nearbyWifiCard",
              "visible": "{{ context.showNearbyWifiDevices }}",
              "children": [
                {
                  "type": "template",
                  "format": "row",
                  "fieldName": "nearbyWifiRow",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "type": "template",
                      "format": "row",
                      "fieldName": "nearbyWifiIconTextRow",
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {
                          "type": "template",
                          "format": "icon",
                          "fieldName": "nearbyWifiIcon",
                          "value": "PermScanWifi"
                        },
                        {
                          "type": "template",
                          "format": "column",
                          "fieldName": "nearbyWifiTextColumn",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "type": "template",
                              "format": "textTemplate",
                              "fieldName": "nearbyWifiText",
                              "value":
                                  "CORE_COMMON_PERMISSION_NEARBYWIFIDEVICES",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "template",
                      "format": "button",
                      "fieldName": "nearbyWifiGrantButton",
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
                  "type": "template",
                  "format": "tag",
                  "fieldName": "nearbyWifiStatusTag",
                  "label": "{{context.nearbyWifiDevicesPermissionStatus}}"
                }
              ]
            },
            {
              "type": "template",
              "format": "card",
              "fieldName": "bluetoothCard",
              "visible": "{{ context.showBluetoothScan }}",
              "children": [
                {
                  "type": "template",
                  "format": "row",
                  "fieldName": "bluetoothRow",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "type": "template",
                      "format": "row",
                      "fieldName": "bluetoothIconTextRow",
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {
                          "type": "template",
                          "format": "icon",
                          "fieldName": "bluetoothIcon",
                          "value": "PermScanWifi"
                        },
                        {
                          "type": "template",
                          "format": "column",
                          "fieldName": "bluetoothTextColumn",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "type": "template",
                              "format": "textTemplate",
                              "fieldName": "bluetoothText",
                              "value": "CORE_COMMON_PERMISSION_BLUETOOTHSCAN",
                              "required": true
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "template",
                      "format": "button",
                      "fieldName": "bluetoothGrantButton",
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
                  "type": "template",
                  "format": "tag",
                  "fieldName": "bluetoothStatusTag",
                  "label": "{{context.bluetoothScanPermissionStatus}}"
                }
              ]
            },
            {
              "type": "template",
              "format": "card",
              "fieldName": "cameraCard",
              "children": [
                {
                  "type": "template",
                  "format": "row",
                  "fieldName": "cameraRow",
                  "properties": {
                    "mainAxisAlignment": "spaceBetween",
                    "mainAxisSize": "max"
                  },
                  "children": [
                    {
                      "type": "template",
                      "format": "row",
                      "fieldName": "cameraIconTextRow",
                      "properties": {
                        "mainAxisAlignment": "start",
                        "mainAxisSize": "min"
                      },
                      "children": [
                        {
                          "type": "template",
                          "format": "icon",
                          "fieldName": "cameraIcon",
                          "value": "PermCameraMic"
                        },
                        {
                          "type": "template",
                          "format": "column",
                          "fieldName": "cameraTextColumn",
                          "properties": {
                            "mainAxisAlignment": "start",
                            "mainAxisSize": "min"
                          },
                          "children": [
                            {
                              "type": "template",
                              "format": "textTemplate",
                              "fieldName": "cameraText",
                              "value": "CORE_COMMON_PERMISSION_CAMERA"
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "template",
                      "format": "button",
                      "fieldName": "cameraGrantButton",
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
                {
                  "type": "template",
                  "format": "tag",
                  "fieldName": "cameraStatusTag",
                  "label": "{{context.cameraPermissionStatus}}"
                }
              ]
            }
          ]
        }
      ]
    }
  ]
};
