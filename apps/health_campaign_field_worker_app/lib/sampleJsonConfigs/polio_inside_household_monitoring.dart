/// Maximum number of household pages.
const int householdCount = 10;

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

/// Build one household page.
/// [index] is 1-based. [nextPage] is the page to navigate to
/// (e.g. "household2", or "closeout" for the last household).
Map<String, dynamic> _householdPage(int index, String nextPage) {
  final pageName = "household$index";
  return {
    "page": pageName,
    "label": "Household $index",
    "order": index + 1, // page 1 is sessionHeader → order 1
    "type": "object",
    "description": "Monitoring data for household $index",
    "actionLabel": "Next",
    ..._pageNulls(),
    "navigateTo": {"name": nextPage, "type": "form"},
    "properties": [
      // 1. teamVisited
      _prop(
        type: "string",
        label: "Was this household visited by the team?",
        order: 1,
        format: "dropdown",
        fieldName: "teamVisited",
        validations: [
          {"type": "required", "value": true, "message": "Required"},
        ],
        enums: [
          {"code": "YES", "name": "Yes"},
          {"code": "NO", "name": "No"},
        ],
      ),

      // 2. houseMarked
      _prop(
        type: "string",
        label: "Is the house marked?",
        order: 2,
        format: "dropdown",
        fieldName: "houseMarked",
        validations: [],
        enums: [
          {"code": "YES", "name": "Yes"},
          {"code": "NO", "name": "No"},
        ],
        visibilityCondition: _vc("$pageName.teamVisited=='YES'"),
      ),

      // 3. childrenPresent
      _prop(
        type: "integer",
        label: "Children present in household",
        order: 3,
        format: "numeric",
        fieldName: "childrenPresent",
        value: "0",
        isEditable: true,
        validations: [
          {"type": "required", "value": true, "message": "Required"},
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 4. childrenVaccinated
      _prop(
        type: "integer",
        label: "Children vaccinated",
        order: 4,
        format: "numeric",
        fieldName: "childrenVaccinated",
        value: "0",
        isEditable: true,
        validations: [
          {"type": "required", "value": true, "message": "Required"},
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 5. vaccinationLocation
      _prop(
        type: "string",
        label: "Where was the child vaccinated?",
        order: 5,
        format: "dropdown",
        fieldName: "vaccinationLocation",
        validations: [],
        enums: [
          {"code": "HOUSE", "name": "House"},
          {"code": "HEALTH_FACILITY", "name": "Health Facility"},
          {"code": "SCHOOL", "name": "School"},
          {"code": "MARKET", "name": "Market"},
          {"code": "FARM", "name": "Farm"},
          {"code": "RELIGIOUS_CENTER", "name": "Religious Center"},
          {"code": "TRANSIT_POINT", "name": "Transit Point"},
          {"code": "COMMUNITY_CENTER", "name": "Community Center"},
          {"code": "PLAYGROUND", "name": "Playground"},
          {"code": "OTHER", "name": "Other"},
        ],
      ),

      // 6. missedAbsent
      _prop(
        type: "integer",
        label: "Missed - Absent",
        order: 6,
        format: "numeric",
        fieldName: "missedAbsent",
        value: "0",
        isEditable: true,
        validations: [
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 7. missedRefusal
      _prop(
        type: "integer",
        label: "Missed - Refusal",
        order: 7,
        format: "numeric",
        fieldName: "missedRefusal",
        value: "0",
        isEditable: true,
        validations: [
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 8. missedNotVisited
      _prop(
        type: "integer",
        label: "Missed - Not Visited",
        order: 8,
        format: "numeric",
        fieldName: "missedNotVisited",
        value: "0",
        isEditable: true,
        validations: [
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 9. missedNotRevisited
      _prop(
        type: "integer",
        label: "Missed - Not Revisited",
        order: 9,
        format: "numeric",
        fieldName: "missedNotRevisited",
        value: "0",
        isEditable: true,
        validations: [
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 10. missedAsleep
      _prop(
        type: "integer",
        label: "Missed - Asleep",
        order: 10,
        format: "numeric",
        fieldName: "missedAsleep",
        value: "0",
        isEditable: true,
        validations: [
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 11. missedRoutine
      _prop(
        type: "integer",
        label: "Missed - Routine",
        order: 11,
        format: "numeric",
        fieldName: "missedRoutine",
        value: "0",
        isEditable: true,
        validations: [
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 12. missedOther
      _prop(
        type: "integer",
        label: "Missed - Other",
        order: 12,
        format: "numeric",
        fieldName: "missedOther",
        value: "0",
        isEditable: true,
        validations: [
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 13. caregiverInformed
      _prop(
        type: "string",
        label: "Was caregiver informed about the campaign?",
        order: 13,
        format: "dropdown",
        fieldName: "caregiverInformed",
        validations: [
          {"type": "required", "value": true, "message": "Required"},
        ],
        enums: [
          {"code": "YES", "name": "Yes"},
          {"code": "NO", "name": "No"},
        ],
      ),

      // 14. campaignInfoSource
      _prop(
        type: "string",
        label: "How did caregiver know about the campaign?",
        order: 14,
        format: "dropdown",
        fieldName: "campaignInfoSource",
        validations: [],
        enums: [
          {"code": "TV", "name": "TV"},
          {"code": "RADIO", "name": "Radio"},
          {"code": "MOB_VAN", "name": "Mob Van/PA"},
          {"code": "HEALTH_WORKER", "name": "Health Worker"},
          {"code": "VOLUNTEER_CHW", "name": "Volunteer CHW"},
          {"code": "RELIGIOUS_LEADER", "name": "Religious Leader"},
          {"code": "COMMUNITY_LEADER", "name": "Community Leader"},
          {"code": "SOCIAL_MEDIA", "name": "Social Media"},
          {"code": "SCHOOL", "name": "School"},
          {"code": "IEC_MATERIALS", "name": "IEC Materials"},
          {"code": "SOCIAL_MOBILIZER", "name": "Social Mobilizer/CBV"},
          {"code": "NEIGHBOUR", "name": "Neighbour"},
          {"code": "NEWSPAPER", "name": "Newspaper"},
          {"code": "OTHERS", "name": "Others"},
        ],
        visibilityCondition: _vc("$pageName.caregiverInformed=='YES'"),
      ),

      // 15. infoSourceOther
      _prop(
        type: "string",
        label: "Other information source (specify)",
        order: 15,
        format: "text",
        fieldName: "infoSourceOther",
        validations: [],
        visibilityCondition: _vc("$pageName.caregiverInformed=='YES'"),
      ),

      // 16. afpLimbWeakness
      _prop(
        type: "string",
        label: "Any child with sudden limb weakness (AFP)?",
        order: 16,
        format: "dropdown",
        fieldName: "afpLimbWeakness",
        validations: [
          {"type": "required", "value": true, "message": "Required"},
        ],
        enums: [
          {"code": "YES", "name": "Yes"},
          {"code": "NO", "name": "No"},
        ],
      ),

      // 17. afpSuddenWeakness
      _prop(
        type: "integer",
        label: "Number of AFP cases",
        order: 17,
        format: "numeric",
        fieldName: "afpSuddenWeakness",
        value: "0",
        isEditable: true,
        validations: [
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 18. caregiverName
      _prop(
        type: "string",
        label: "Caregiver Name",
        order: 18,
        format: "text",
        fieldName: "caregiverName",
        validations: [
          {"type": "required", "value": true, "message": "Required"},
        ],
      ),

      // 19. caregiverPhone
      _prop(
        type: "string",
        label: "Caregiver Phone Number",
        order: 19,
        format: "phone",
        fieldName: "caregiverPhone",
        validations: [],
      ),
    ],
  };
}

final dynamic samplePolioInsideHouseholdMonitoringFlows = {
  "name": "POLIO_INSIDE_HOUSEHOLD_MONITORING",
  "initialPage": "insideHouseholdEntry",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ──────────────────────────────────────────────────────────
    // 1. insideHouseholdEntry (FORM, order:1)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "FORM",
      "name": "insideHouseholdEntry",
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
          "description":
              "Monitor details, location, and session header information",
          "actionLabel": "Next",
          ..._pageNulls(),
          "navigateTo": {"name": "household1", "type": "form"},
          "properties": [
            // 1. monitoringType
            _prop(
              type: "string",
              label: "Monitoring Type",
              order: 1,
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

            // 2. monitoringDate
            _prop(
              type: "string",
              label: "Monitoring Date",
              order: 2,
              format: "text",
              fieldName: "monitoringDate",
              readOnly: true,
              systemDate: true,
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
            ),

            // 3. settlementArea
            _prop(
              type: "string",
              label: "Settlement Area",
              order: 3,
              format: "locality",
              fieldName: "settlementArea",
              readOnly: true,
              validations: [],
            ),

            // 4. settlementName
            _prop(
              type: "string",
              label: "Settlement Name",
              order: 4,
              format: "text",
              fieldName: "settlementName",
              validations: [],
            ),

            // 5. settlementType
            _prop(
              type: "string",
              label: "Settlement Type",
              order: 5,
              format: "dropdown",
              fieldName: "settlementType",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "URBAN", "name": "Urban"},
                {"code": "RURAL", "name": "Rural"},
                {"code": "SLUMS", "name": "Slums"},
                {"code": "REFUGEES_IDPS", "name": "Refugees/IDPs"},
                {"code": "HARD_TO_REACH", "name": "Hard to Reach"},
                {
                  "code": "NOMADS",
                  "name": "Nomads/Pastoralists"
                },
                {
                  "code": "SECURITY_COMPROMISED",
                  "name": "Security Compromised"
                },
                {"code": "IMMIGRANTS", "name": "Immigrants"},
                {"code": "CROSS_BORDER", "name": "Cross-Border"},
              ],
            ),

            // 6. monitorName
            _prop(
              type: "string",
              label: "Monitor Name",
              order: 6,
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

            // 7. monitorPhone
            _prop(
              type: "string",
              label: "Monitor Phone Number",
              order: 7,
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

            // 8. monitorDesignation
            _prop(
              type: "string",
              label: "Monitor Designation",
              order: 8,
              format: "dropdown",
              fieldName: "monitorDesignation",
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

            // 9. designationOther
            _prop(
              type: "string",
              label: "Other designation (specify)",
              order: 9,
              format: "text",
              fieldName: "designationOther",
              validations: [],
              visibilityCondition:
                  _vc("sessionHeader.monitorDesignation=='OTHERS'"),
            ),

            // 10. gpsFirstHousehold
            _prop(
              type: "string",
              label: "GPS - First Household",
              order: 10,
              format: "latLng",
              fieldName: "gpsFirstHousehold",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
            ),
          ],
        },

        // ── Household pages: generated dynamically (max householdCount) ──
        for (int i = 1; i <= householdCount; i++)
          _householdPage(
            i,
            i < householdCount ? "household${i + 1}" : "closeout",
          ),

        // ── Closeout page ──
        {
          "page": "closeout",
          "label": "Closeout",
          "order": householdCount +
              2, // sessionHeader=1, households=2..N+1, closeout=N+2
          "type": "object",
          "description": "Final GPS and observations",
          "actionLabel": "Submit",
          ..._pageNulls(),
          "properties": [
            // 1. gpsLastHousehold
            _prop(
              type: "string",
              label: "GPS - Last Household",
              order: 1,
              format: "latLng",
              fieldName: "gpsLastHousehold",
              validations: [],
            ),

            // 2. poorlyCoveredAreas
            _prop(
              type: "string",
              label: "Are there poorly covered areas?",
              order: 2,
              format: "dropdown",
              fieldName: "poorlyCoveredAreas",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
              ],
            ),

            // 3. finalComments
            _prop(
              type: "string",
              label: "Final Comments / Observations",
              order: 3,
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
            "configName": "polioInsideHousehold",
            "data": [],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {
                  "message": "Failed to fetch config."
                }
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
                  "message": "Failed to record inside household monitoring."
                }
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "insideHouseholdSuccess",
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
    // 2. insideHouseholdSuccess (TEMPLATE, order:2)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "TEMPLATE",
      "name": "insideHouseholdSuccess",
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
          "label": "Inside Household Monitoring Recorded Successfully",
          "description":
              "The inside household monitoring data has been recorded successfully",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "Add Another Session",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "FORM",
                  "name": "insideHouseholdEntry"
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
