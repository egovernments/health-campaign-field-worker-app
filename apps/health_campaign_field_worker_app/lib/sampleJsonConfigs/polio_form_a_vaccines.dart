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

final dynamic samplePolioFormAVaccinesFlows = {
  "name": "POLIO_FORM_A_VACCINES",
  "initialPage": "formAVaccinesEntry",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ──────────────────────────────────────────────────────────
    // 1. formAVaccinesEntry (FORM, order:1) — Form A Type 2 Vaccines
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "FORM",
      "name": "formAVaccinesEntry",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        // ── Page 1: Facility Info / Context ──
        {
          "page": "facilityInfo",
          "label": "Context",
          "order": 1,
          "type": "object",
          "description": "Facility and monitor context information",
          "actionLabel": "Next",
          ..._pageNulls(),
          "navigateTo": {"name": "stockReconciliation", "type": "form"},
          "properties": [
            // 1. reportDate
            _prop(
              type: "string",
              label: "Report Date",
              order: 1,
              format: "text",
              fieldName: "reportDate",
              readOnly: true,
              systemDate: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Report date is required"
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

            // 3. adminLevel
            _prop(
              type: "string",
              label: "Administrative Level",
              order: 3,
              format: "dropdown",
              fieldName: "adminLevel",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Administrative level is required"
                },
              ],
              enums: [
                {"code": "NATIONAL", "name": "National"},
                {"code": "COUNTY", "name": "County"},
                {"code": "SUB_COUNTY", "name": "Sub-County"},
                {"code": "FACILITY", "name": "Facility"},
              ],
            ),

            // 4. facilityName
            _prop(
              type: "string",
              label: "Facility Name",
              order: 4,
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

            // 5. monitorName
            _prop(
              type: "string",
              label: "Monitor Name",
              order: 5,
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

            // 6. vialsReturnedOnTime
            _prop(
              type: "string",
              label: "Vials returned on time",
              order: 6,
              format: "dropdown",
              fieldName: "vialsReturnedOnTime",
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
              ],
            ),

            // 7. gpsLocation
            _prop(
              type: "string",
              label: "GPS Location",
              order: 7,
              format: "latLng",
              fieldName: "gpsLocation",
              validations: [],
            ),
          ],
        },

        // ── Page 2: Stock Reconciliation ──
        {
          "page": "stockReconciliation",
          "label": "Stock Reconciliation",
          "order": 2,
          "type": "object",
          "description": "Stock transaction fields for vaccine reconciliation",
          "actionLabel": "Submit",
          ..._pageNulls(),
          "properties": [
            // 1. childrenVaccinated
            _prop(
              type: "integer",
              label: "Children vaccinated",
              order: 1,
              format: "numeric",
              fieldName: "childrenVaccinated",
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

            // 2. usableVialsOpeningBalance
            _prop(
              type: "integer",
              label: "Usable vials opening balance",
              order: 2,
              format: "numeric",
              fieldName: "usableVialsOpeningBalance",
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

            // 3. usableVialsReceived
            _prop(
              type: "integer",
              label: "Usable vials received",
              order: 3,
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

            // 4. usableVialsResupplied
            _prop(
              type: "integer",
              label: "Usable vials resupplied",
              order: 4,
              format: "numeric",
              fieldName: "usableVialsResupplied",
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

            // 6. usableVialsDistributed
            _prop(
              type: "integer",
              label: "Usable vials distributed",
              order: 6,
              format: "numeric",
              fieldName: "usableVialsDistributed",
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

            // 7. usableVialsReceivedFromLower
            _prop(
              type: "integer",
              label: "Usable vials received from lower level",
              order: 7,
              format: "numeric",
              fieldName: "usableVialsReceivedFromLower",
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

            // 8. unusableVialsReceivedFromLower
            _prop(
              type: "integer",
              label: "Unusable vials received from lower level",
              order: 8,
              format: "numeric",
              fieldName: "unusableVialsReceivedFromLower",
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

            // 9. usableVialsPhysicalCount
            _prop(
              type: "integer",
              label: "Usable vials physical count",
              order: 9,
              format: "numeric",
              fieldName: "usableVialsPhysicalCount",
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

            // 10. unusableVialsPhysicalCount
            _prop(
              type: "integer",
              label: "Unusable vials physical count",
              order: 10,
              format: "numeric",
              fieldName: "unusableVialsPhysicalCount",
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

            // 11. usableVialsReturnedToHigher
            _prop(
              type: "integer",
              label: "Usable vials returned to higher level",
              order: 11,
              format: "numeric",
              fieldName: "usableVialsReturnedToHigher",
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

            // 12. unusableVialsDisposedOnSite
            _prop(
              type: "integer",
              label: "Unusable vials disposed on site",
              order: 12,
              format: "numeric",
              fieldName: "unusableVialsDisposedOnSite",
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

            // 13. reconciliationComments
            _prop(
              type: "string",
              label: "Reconciliation Comments",
              order: 13,
              format: "textArea",
              fieldName: "reconciliationComments",
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
            "configName": "polioFormAVaccines",
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
                  "message": "Failed to record Form A vaccines data."
                }
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "formAVaccinesSuccess",
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
    // 2. formAVaccinesSuccess (TEMPLATE, order:2)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "TEMPLATE",
      "name": "formAVaccinesSuccess",
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
          "label": "Form A Vaccines Recorded Successfully",
          "description":
              "The Form A vaccine data has been recorded successfully",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "Add Another Record",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "FORM",
                  "name": "formAVaccinesEntry"
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
