/// Maximum number of site evaluation pages.
const int siteCount = 5;

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

/// Build one site evaluation page.
/// [siteIndex] is 1-based.  [nextPage] is the default page to navigate to
/// (e.g. "site2", or "closeout" for the last site).
Map<String, dynamic> _sitePage(int siteIndex, String nextPage) {
  final pageName = "site$siteIndex";
  return {
    "page": pageName,
    "label": "Site $siteIndex",
    "order": siteIndex + 1, // page 1 is sessionHeader -> order 1
    "type": "object",
    "description": "Evaluate site $siteIndex",
    "actionLabel": "Next",
    ..._pageNulls(),
    "navigateTo": {"name": nextPage, "type": "form"},
    // Dynamic page skip: when this is the last site based on numberOfSites
    if (siteIndex < siteCount)
      "conditionalNavigateTo": [
        {
          "type": "custom",
          "condition": "sessionHeader.numberOfSites=='$siteIndex'",
          "navigateTo": {"name": "closeout", "type": "form"}
        }
      ],
    "properties": [
      // 1. gpsLocation
      _prop(
        type: "string",
        label: "GPS Location",
        order: 1,
        format: "latLng",
        fieldName: "gpsLocation",
        validations: [],
      ),

      // 2. placeOfEvaluation
      _prop(
        type: "string",
        label: "Place of Evaluation",
        order: 2,
        format: "dropdown",
        fieldName: "placeOfEvaluation",
        validations: [
          {"type": "required", "value": true, "message": "Required"},
        ],
        enums: [
          {"code": "MARKET", "name": "Market"},
          {"code": "SCHOOL", "name": "School"},
          {"code": "RELIGIOUS_CENTER", "name": "Religious Center"},
          {"code": "PLAYGROUND", "name": "Playground"},
          {"code": "MOTOR_PARK", "name": "Motor Park"},
          {"code": "TRANSIT_POINT", "name": "Transit Point"},
          {"code": "HEALTH_FACILITY", "name": "Health Facility"},
          {"code": "OTHER", "name": "Other"},
        ],
      ),

      // 3. childrenChecked
      _prop(
        type: "integer",
        label: "Children Checked",
        order: 3,
        format: "numeric",
        fieldName: "childrenChecked",
        value: "0",
        isEditable: true,
        validations: [
          {"type": "required", "value": true, "message": "Required"},
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 4. childrenFingerMarked
      _prop(
        type: "integer",
        label: "Children Finger Marked",
        order: 4,
        format: "numeric",
        fieldName: "childrenFingerMarked",
        value: "0",
        isEditable: true,
        validations: [
          {"type": "required", "value": true, "message": "Required"},
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 5. siteComments
      _prop(
        type: "string",
        label: "Site Comments",
        order: 5,
        format: "textArea",
        fieldName: "siteComments",
        validations: [
          {
            "type": "maxLength",
            "value": 500,
            "message": "Max 500 characters"
          },
        ],
      ),
    ],
  };
}

final dynamic samplePolioOutsideHouseMonitoringFlows = {
  "name": "POLIO_OUTSIDE_HOUSE_MONITORING",
  "initialPage": "outsideHouseEntry",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ──────────────────────────────────────────────────────────
    // 1. outsideHouseEntry (FORM, order:1) — Outside House Monitoring
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "FORM",
      "name": "outsideHouseEntry",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        // ── Page 1: Session Header ──
        {
          "page": "sessionHeader",
          "label": "Session Header",
          "order": 1,
          "type": "object",
          "description": "Monitor details, location, and session configuration",
          "actionLabel": "Next",
          ..._pageNulls(),
          "navigateTo": {"name": "site1", "type": "form"},
          "properties": [
            // 1. levelOfMonitoring
            _prop(
              type: "string",
              label: "Level of Monitoring",
              order: 1,
              format: "dropdown",
              fieldName: "levelOfMonitoring",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "WHO_HQ", "name": "WHO HQ"},
                {"code": "WHO_REGION", "name": "WHO Region"},
                {"code": "WHO_COUNTRY", "name": "WHO Country"},
                {"code": "WHO_HUB", "name": "WHO Hub"},
                {"code": "WHO_SUB_NATIONAL", "name": "WHO Sub-National"},
                {"code": "WHO_ZONAL", "name": "WHO Zonal"},
                {"code": "UNICEF_HQ", "name": "UNICEF HQ"},
                {"code": "UNICEF_REGION", "name": "UNICEF Region"},
                {"code": "UNICEF_COUNTRY", "name": "UNICEF Country"},
                {
                  "code": "UNICEF_SUB_NATIONAL",
                  "name": "UNICEF Sub-National"
                },
                {"code": "CDC_HQ", "name": "CDC HQ"},
                {"code": "CDC_COUNTRY", "name": "CDC Country"},
                {"code": "BMGF", "name": "BMGF"},
                {"code": "ROTARY", "name": "Rotary"},
                {"code": "MOH_NATIONAL", "name": "MOH National"},
                {"code": "MOH_STATE", "name": "MOH State"},
                {"code": "MOH_LGA", "name": "MOH LGA"},
                {"code": "NPHCDA", "name": "NPHCDA"},
                {"code": "SPHCDA", "name": "SPHCDA"},
                {"code": "LPHCDA", "name": "LPHCDA"},
                {"code": "PARTNER", "name": "Partner"},
                {"code": "VOLUNTEER", "name": "Volunteer"},
                {"code": "STUDENT", "name": "Student"},
                {"code": "OTHERS", "name": "Others"},
              ],
            ),

            // 2. otherMonitors — shown when levelOfMonitoring == OTHERS
            _prop(
              type: "string",
              label: "Other Monitors (specify)",
              order: 2,
              format: "text",
              fieldName: "otherMonitors",
              validations: [],
              visibilityCondition:
                  _vc("sessionHeader.levelOfMonitoring=='OTHERS'"),
            ),

            // 3. monitoringType
            _prop(
              type: "string",
              label: "Monitoring Type",
              order: 3,
              format: "dropdown",
              fieldName: "monitoringType",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "IN_PROCESS", "name": "In Process"},
                {"code": "END_PROCESS", "name": "End Process"},
              ],
            ),

            // 4. monitoringDate
            _prop(
              type: "string",
              label: "Monitoring Date",
              order: 4,
              format: "text",
              fieldName: "monitoringDate",
              readOnly: true,
              systemDate: true,
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
            ),

            // 5. settlementArea
            _prop(
              type: "string",
              label: "Settlement Area",
              order: 5,
              format: "locality",
              fieldName: "settlementArea",
              readOnly: true,
              validations: [],
            ),

            // 6. settlementName
            _prop(
              type: "string",
              label: "Settlement Name",
              order: 6,
              format: "text",
              fieldName: "settlementName",
              validations: [],
            ),

            // 7. settlementType
            _prop(
              type: "string",
              label: "Settlement Type",
              order: 7,
              format: "dropdown",
              fieldName: "settlementType",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "URBAN", "name": "Urban"},
                {"code": "RURAL", "name": "Rural"},
                {"code": "SLUMS", "name": "Slums"},
                {"code": "REFUGEES_IDPS", "name": "Refugees / IDPs"},
                {"code": "HARD_TO_REACH", "name": "Hard to Reach"},
                {
                  "code": "NOMADS_PASTORALISTS",
                  "name": "Nomads / Pastoralists"
                },
                {
                  "code": "SECURITY_COMPROMISED",
                  "name": "Security Compromised"
                },
                {"code": "IMMIGRANTS", "name": "Immigrants"},
                {"code": "CROSS_BORDER", "name": "Cross-Border"},
              ],
            ),

            // 8. monitorName
            _prop(
              type: "string",
              label: "Monitor Name",
              order: 8,
              format: "text",
              fieldName: "monitorName",
              readOnly: true,
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              autoFillCondition: [
                {
                  "value": "{{loggedInUserName}}",
                  "expression": "true==true"
                }
              ],
            ),

            // 9. monitorPhone
            _prop(
              type: "string",
              label: "Monitor Phone Number",
              order: 9,
              format: "phone",
              fieldName: "monitorPhone",
              readOnly: true,
              validations: [],
              autoFillCondition: [
                {
                  "value": "{{loggedInUserMobileNumber}}",
                  "expression": "true==true"
                }
              ],
            ),

            // 10. supervisorName
            _prop(
              type: "string",
              label: "Supervisor Name",
              order: 10,
              format: "text",
              fieldName: "supervisorName",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
            ),

            // 11. supervisorPhone
            _prop(
              type: "string",
              label: "Supervisor Phone Number",
              order: 11,
              format: "phone",
              fieldName: "supervisorPhone",
              validations: [],
            ),

            // 12. numberOfSites
            _prop(
              type: "integer",
              label: "Number of Sites",
              order: 12,
              format: "numeric",
              fieldName: "numberOfSites",
              value: "1",
              isEditable: true,
              validations: [
                {"type": "required", "value": true, "message": "Required"},
                {
                  "type": "min",
                  "value": 1,
                  "message": "Minimum 1 site"
                },
                {
                  "type": "max",
                  "value": 5,
                  "message": "Maximum 5 sites"
                },
              ],
            ),
          ],
        },

        // ── Site pages: generated dynamically (max siteCount) ──
        for (int i = 1; i <= siteCount; i++)
          _sitePage(
            i,
            i < siteCount ? "site${i + 1}" : "closeout",
          ),

        // ── Closeout page ──
        {
          "page": "closeout",
          "label": "Closeout",
          "order":
              siteCount + 2, // sessionHeader=1, sites=2..N+1, closeout=N+2
          "type": "object",
          "description": "Final comments",
          "actionLabel": "Submit",
          ..._pageNulls(),
          "properties": [
            // 1. finalComments
            _prop(
              type: "string",
              label: "Final Comments / Observations",
              order: 1,
              format: "textArea",
              fieldName: "finalComments",
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
            "configName": "polioOutsideHouse",
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
                  "message": "Failed to record outside house monitoring."
                }
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "outsideHouseSuccess",
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
    // 2. outsideHouseSuccess (TEMPLATE, order:2)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "TEMPLATE",
      "name": "outsideHouseSuccess",
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
          "label": "Outside House Monitoring Recorded Successfully",
          "description":
              "The outside house monitoring data has been recorded successfully",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "Add Another Session",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "FORM",
                  "name": "outsideHouseEntry"
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
