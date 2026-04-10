// Helper to build a standard page-level null block
Map<String, dynamic> _pageNulls() => {
      "value": null,
      "required": null,
      "hidden": null,
      "helpText": null,
      "innerLabel": null,
      "validations": null,
      "tooltip": null,
      "startDate": null,
      "endDate": null,
      "readOnly": null,
      "charCount": null,
      "systemDate": null,
      "isMultiSelect": null,
      "includeInForm": null,
      "includeInSummary": null,
      "autoEnable": null,
    };

/// Helper to build a visibilityCondition map from a condition expression.
Map<String, dynamic> _vc(String condition) => {
      "expression": [
        {"condition": condition, "type": "custom"}
      ]
    };

// Helper to build a standard property skeleton
Map<String, dynamic> _prop({
  required String type,
  required String label,
  required int order,
  required String format,
  required String fieldName,
  String value = "",
  bool hidden = false,
  String tooltip = "",
  String helpText = "",
  String infoText = "",
  bool readOnly = false,
  bool deleteFlag = false,
  String innerLabel = "",
  bool systemDate = false,
  bool? isEditable,
  List<Map<String, dynamic>> validations = const [],
  String errorMessage = "",
  bool isMultiSelect = false,
  List<Map<String, String>>? enums,
  Map<String, dynamic>? visibilityCondition,
  List<Map<String, String>>? autoFillCondition,
}) {
  final m = <String, dynamic>{
    "type": type,
    "label": label,
    "order": order,
    "value": value,
    "format": format,
    "hidden": hidden,
    "tooltip": tooltip,
    "helpText": helpText,
    "infoText": infoText,
    "readOnly": readOnly,
    "fieldName": fieldName,
    "deleteFlag": deleteFlag,
    "innerLabel": innerLabel,
    "systemDate": systemDate,
    "validations": validations,
    "errorMessage": errorMessage,
    "isMultiSelect": isMultiSelect,
  };
  if (isEditable != null) m["isEditable"] = isEditable;
  if (enums != null) m["enums"] = enums;
  if (visibilityCondition != null) {
    m["visibilityCondition"] = visibilityCondition;
  }
  if (autoFillCondition != null) m["autoFillCondition"] = autoFillCondition;
  return m;
}

final dynamic samplePolioConsumptionMonitoringFlows = {
  "name": "POLIO_CONSUMPTION_MONITORING",
  "initialPage": "consumptionMonitoringEntry",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ──────────────────────────────────────────────────────────
    // 1. consumptionMonitoringEntry (FORM, order:1)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "FORM",
      "name": "consumptionMonitoringEntry",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        // ── Page 1: Facility Info ──
        {
          "page": "facilityInfo",
          "label": "Facility Information",
          "order": 1,
          "type": "object",
          "description": "Facility context — date, location, monitor details",
          "actionLabel": "Next",
          ..._pageNulls(),
          "navigateTo": {"name": "stockData", "type": "form"},
          "properties": [
            // 1. monitoringDate
            _prop(
              type: "string",
              label: "Monitoring Date",
              order: 1,
              format: "text",
              fieldName: "monitoringDate",
              readOnly: true,
              systemDate: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Monitoring date is required"
                },
              ],
            ),

            // 2. settlementArea
            _prop(
              type: "string",
              label: "Settlement Area",
              order: 2,
              format: "locality",
              fieldName: "settlementArea",
              readOnly: true,
              validations: [],
            ),

            // 3. facilityName
            _prop(
              type: "string",
              label: "Facility Name",
              order: 3,
              format: "text",
              fieldName: "facilityName",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Facility name is required"
                },
              ],
            ),

            // 4. monitorName
            _prop(
              type: "string",
              label: "Monitor Name",
              order: 4,
              format: "text",
              fieldName: "monitorName",
              readOnly: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Monitor name is required"
                },
              ],
              autoFillCondition: [
                {
                  "value": "{{loggedInUserName}}",
                  "expression": "true==true"
                }
              ],
            ),

            // 5. gpsLocation
            _prop(
              type: "string",
              label: "GPS Location",
              order: 5,
              format: "latLng",
              fieldName: "gpsLocation",
              validations: [],
            ),
          ],
        },

        // ── Page 2: Stock Data ──
        {
          "page": "stockData",
          "label": "Daily Stock Data",
          "order": 2,
          "type": "object",
          "description": "Daily stock and consumption tracking fields",
          "actionLabel": "Next",
          ..._pageNulls(),
          "navigateTo": {"name": "closeout", "type": "form"},
          "properties": [
            // 1. coldChainTempOk
            _prop(
              type: "string",
              label: "Cold chain temperature within range",
              order: 1,
              format: "dropdown",
              fieldName: "coldChainTempOk",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
                },
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 2. vvmAtDiscardPoint
            _prop(
              type: "string",
              label: "VVM at discard point",
              order: 2,
              format: "dropdown",
              fieldName: "vvmAtDiscardPoint",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
                },
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 3. usableVialsOpening
            _prop(
              type: "integer",
              label: "Usable vials at opening",
              order: 3,
              format: "numeric",
              fieldName: "usableVialsOpening",
              value: "0",
              isEditable: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "Must be 0 or more"
                },
              ],
            ),

            // 4. usableVialsReceived
            _prop(
              type: "integer",
              label: "Usable vials received during day",
              order: 4,
              format: "numeric",
              fieldName: "usableVialsReceived",
              value: "0",
              isEditable: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "Must be 0 or more"
                },
              ],
            ),

            // 5. usableVialsTransferredOut
            _prop(
              type: "integer",
              label: "Usable vials transferred out",
              order: 5,
              format: "numeric",
              fieldName: "usableVialsTransferredOut",
              value: "0",
              isEditable: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "Must be 0 or more"
                },
              ],
            ),

            // 6. usableVialsGivenToTeams
            _prop(
              type: "integer",
              label: "Usable vials given to teams",
              order: 6,
              format: "numeric",
              fieldName: "usableVialsGivenToTeams",
              value: "0",
              isEditable: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "Must be 0 or more"
                },
              ],
            ),

            // 7. usableVialsReturnedFromTeams
            _prop(
              type: "integer",
              label: "Usable vials returned from teams",
              order: 7,
              format: "numeric",
              fieldName: "usableVialsReturnedFromTeams",
              value: "0",
              isEditable: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "Must be 0 or more"
                },
              ],
            ),

            // 8. unusableVialsReturnedFromTeams
            _prop(
              type: "integer",
              label: "Unusable vials returned from teams",
              order: 8,
              format: "numeric",
              fieldName: "unusableVialsReturnedFromTeams",
              value: "0",
              isEditable: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "Must be 0 or more"
                },
              ],
            ),

            // 9. childrenVaccinatedTotal
            _prop(
              type: "integer",
              label: "Total children vaccinated",
              order: 9,
              format: "numeric",
              fieldName: "childrenVaccinatedTotal",
              value: "0",
              isEditable: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "Must be 0 or more"
                },
              ],
            ),

            // 10. usableVialsClosingPhysical
            _prop(
              type: "integer",
              label: "Usable vials closing (physical count)",
              order: 10,
              format: "numeric",
              fieldName: "usableVialsClosingPhysical",
              value: "0",
              isEditable: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "Must be 0 or more"
                },
              ],
            ),

            // 11. unusableVialsClosingPhysical
            _prop(
              type: "integer",
              label: "Unusable vials closing (physical count)",
              order: 11,
              format: "numeric",
              fieldName: "unusableVialsClosingPhysical",
              value: "0",
              isEditable: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "Must be 0 or more"
                },
              ],
            ),
          ],
        },

        // ── Page 3: Closeout ──
        {
          "page": "closeout",
          "label": "Closeout",
          "order": 3,
          "type": "object",
          "description": "Final comments and observations",
          "actionLabel": "Submit",
          ..._pageNulls(),
          "properties": [
            // 1. discrepancyComment
            _prop(
              type: "string",
              label: "Discrepancy Comments / Observations",
              order: 1,
              format: "textArea",
              fieldName: "discrepancyComment",
              validations: [
                {
                  "type": "maxLength",
                  "value": 500,
                  "message": "Max 500 characters"
                },
              ],
            ),
          ],
        },
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "polioConsumptionMonitoring",
            "data": [],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to fetch config."}
              }
            ]
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "USERACTION",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {
                  "message": "Failed to record consumption monitoring data."
                }
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "consumptionMonitoringSuccess",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ]
          }
        }
      ]
    },

    // ──────────────────────────────────────────────────────────
    // 2. consumptionMonitoringSuccess (TEMPLATE, order:2)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "TEMPLATE",
      "name": "consumptionMonitoringSuccess",
      "order": 2,
      "heading": "",
      "description": "",
      "header": [],
      "footer": [],
      "initActions": [],
      "body": [
        {
          "type": "template",
          "format": "panelCard",
          "label": "Consumption Monitoring Recorded Successfully",
          "description":
              "The consumption monitoring data has been recorded successfully",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "Add Another Record",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "FORM",
                  "name": "consumptionMonitoringEntry"
                }
              }
            ]
          },
          "secondaryAction": {
            "label": "Back to Home",
            "onAction": [
              {
                "actionType": "BACK_NAVIGATION",
                "properties": {"name": "HOME", "type": "HOME"}
              }
            ]
          }
        }
      ]
    }
  ]
};
