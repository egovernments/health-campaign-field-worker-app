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

final dynamic samplePolioTeamSupervisionFlows = {
  "name": "POLIO_TEAM_SUPERVISION",
  "initialPage": "teamSupervisionEntry",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ──────────────────────────────────────────────────────────
    // 1. teamSupervisionEntry (FORM, order:1) — Team Supervision Checklist
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "FORM",
      "name": "teamSupervisionEntry",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        // ── Page 1: Team Header ──
        {
          "page": "teamHeader",
          "label": "Team Context",
          "order": 1,
          "type": "object",
          "description":
              "Team information, supervisor details, and location",
          "actionLabel": "Next",
          ..._pageNulls(),
          "navigateTo": {"name": "checklist", "type": "form"},
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

            // 2. teamType
            _prop(
              type: "string",
              label: "Team Type",
              order: 2,
              format: "dropdown",
              fieldName: "teamType",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Team type is required"
                },
              ],
              enums: [
                {"code": "HOUSE_TO_HOUSE", "name": "House to House"},
                {"code": "FIXED_POST", "name": "Fixed Post"},
              ],
            ),

            // 3. teamNumber
            _prop(
              type: "string",
              label: "Team Number",
              order: 3,
              format: "text",
              fieldName: "teamNumber",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Team number is required"
                },
              ],
            ),

            // 4. supervisionDay
            _prop(
              type: "string",
              label: "Supervision Day",
              order: 4,
              format: "dropdown",
              fieldName: "supervisionDay",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Supervision day is required"
                },
              ],
              enums: [
                {"code": "DAY_1", "name": "Day 1"},
                {"code": "DAY_2", "name": "Day 2"},
                {"code": "DAY_3", "name": "Day 3"},
                {"code": "DAY_4", "name": "Day 4"},
                {"code": "DAY_5", "name": "Day 5"},
                {"code": "MOP_UP_1", "name": "Mop Up 1"},
                {"code": "MOP_UP_2", "name": "Mop Up 2"},
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

            // 7. supervisorType
            _prop(
              type: "string",
              label: "Supervisor Type",
              order: 7,
              format: "dropdown",
              fieldName: "supervisorType",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Supervisor type is required"
                },
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
                {"code": "UNICEF_SUB_NATIONAL", "name": "UNICEF Sub-National"},
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

            // 8. otherMonitors
            _prop(
              type: "string",
              label: "Other Monitors (specify)",
              order: 8,
              format: "text",
              fieldName: "otherMonitors",
              validations: [],
              visibilityCondition:
                  _vc("teamHeader.supervisorType=='OTHERS'"),
            ),

            // 9. gpsLocation
            _prop(
              type: "string",
              label: "GPS Location",
              order: 9,
              format: "latLng",
              fieldName: "gpsLocation",
              validations: [],
            ),

            // 10. monitorName
            _prop(
              type: "string",
              label: "Monitor Name",
              order: 10,
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

            // 11. teamSupervisorName
            _prop(
              type: "string",
              label: "Team Supervisor Name",
              order: 11,
              format: "text",
              fieldName: "teamSupervisorName",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Team supervisor name is required"
                },
              ],
            ),
          ],
        },

        // ── Page 2: Checklist ──
        {
          "page": "checklist",
          "label": "Team Supervision Checklist",
          "order": 2,
          "type": "object",
          "description":
              "27 Yes/No/NA supervision checklist items with conditional fields",
          "actionLabel": "Next",
          ..._pageNulls(),
          "navigateTo": {"name": "comments", "type": "form"},
          "properties": [
            // 1. teamMembersTrained
            _prop(
              type: "string",
              label: "Team members trained on campaign protocol",
              order: 1,
              format: "dropdown",
              fieldName: "teamMembersTrained",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 2. teamComplete
            _prop(
              type: "string",
              label: "Team is complete (all members present)",
              order: 2,
              format: "dropdown",
              fieldName: "teamComplete",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 3. teamLocalMember
            _prop(
              type: "string",
              label: "Team has a local community member",
              order: 3,
              format: "dropdown",
              fieldName: "teamLocalMember",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 4. dailyMovementPlan
            _prop(
              type: "string",
              label: "Daily movement plan available",
              order: 4,
              format: "dropdown",
              fieldName: "dailyMovementPlan",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 5. movementPlanAllDays
            _prop(
              type: "string",
              label: "Movement plan covers all campaign days",
              order: 5,
              format: "dropdown",
              fieldName: "movementPlanAllDays",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 6. areaMapsAvailable
            _prop(
              type: "string",
              label: "Area maps available for the team",
              order: 6,
              format: "dropdown",
              fieldName: "areaMapsAvailable",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 7. mapsInterpretedCorrectly (visible when areaMapsAvailable == YES)
            _prop(
              type: "string",
              label: "Maps interpreted correctly",
              order: 7,
              format: "dropdown",
              fieldName: "mapsInterpretedCorrectly",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
              visibilityCondition:
                  _vc("checklist.areaMapsAvailable=='YES'"),
            ),

            // 8. housesMarkedCorrectly
            _prop(
              type: "string",
              label: "Houses marked correctly after vaccination",
              order: 8,
              format: "dropdown",
              fieldName: "housesMarkedCorrectly",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 9. fingerMarkingCorrect
            _prop(
              type: "string",
              label: "Finger marking done correctly",
              order: 9,
              format: "dropdown",
              fieldName: "fingerMarkingCorrect",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 10. householdTallyRecorded
            _prop(
              type: "string",
              label: "Household tally recorded properly",
              order: 10,
              format: "dropdown",
              fieldName: "householdTallyRecorded",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 11. tallyDosesMatch
            _prop(
              type: "string",
              label: "Tally matches doses administered",
              order: 11,
              format: "dropdown",
              fieldName: "tallyDosesMatch",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 12. sufficientVaccine
            _prop(
              type: "string",
              label: "Sufficient vaccine supply available",
              order: 12,
              format: "dropdown",
              fieldName: "sufficientVaccine",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 13. dropperChangePerVial
            _prop(
              type: "string",
              label: "Dropper changed with each new vial",
              order: 13,
              format: "dropdown",
              fieldName: "dropperChangePerVial",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 14. tallySheetVialsRecorded
            _prop(
              type: "string",
              label: "Vials recorded on tally sheet",
              order: 14,
              format: "dropdown",
              fieldName: "tallySheetVialsRecorded",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 15. vialsNotRecordedReason (visible when tallySheetVialsRecorded == NO)
            _prop(
              type: "string",
              label: "Reason vials not recorded",
              order: 15,
              format: "text",
              fieldName: "vialsNotRecordedReason",
              validations: [],
              visibilityCondition:
                  _vc("checklist.tallySheetVialsRecorded=='NO'"),
            ),

            // 16. vvmPhaseCheck
            _prop(
              type: "string",
              label: "VVM phase checked before use",
              order: 16,
              format: "dropdown",
              fieldName: "vvmPhaseCheck",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 17. vvmInterpretationCorrect
            _prop(
              type: "string",
              label: "VVM interpreted correctly",
              order: 17,
              format: "dropdown",
              fieldName: "vvmInterpretationCorrect",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 18. icePacksMaintained
            _prop(
              type: "string",
              label: "Ice packs maintained in vaccine carrier",
              order: 18,
              format: "dropdown",
              fieldName: "icePacksMaintained",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 19. foamPadInCarrier
            _prop(
              type: "string",
              label: "Foam pad placed in vaccine carrier",
              order: 19,
              format: "dropdown",
              fieldName: "foamPadInCarrier",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 20. vaccineHeatExposure
            _prop(
              type: "string",
              label: "Vaccine protected from heat exposure",
              order: 20,
              format: "dropdown",
              fieldName: "vaccineHeatExposure",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 21. correctVaccineDrops
            _prop(
              type: "string",
              label: "Correct number of vaccine drops given",
              order: 21,
              format: "dropdown",
              fieldName: "correctVaccineDrops",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 22. supervisorPresent
            _prop(
              type: "string",
              label: "Supervisor present during vaccination",
              order: 22,
              format: "dropdown",
              fieldName: "supervisorPresent",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 23. supervisorSupervisedToday (visible when supervisorPresent == YES)
            _prop(
              type: "string",
              label: "Supervisor supervised the team today",
              order: 23,
              format: "dropdown",
              fieldName: "supervisorSupervisedToday",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
              visibilityCondition:
                  _vc("checklist.supervisorPresent=='YES'"),
            ),

            // 24. householdsCampaignAware
            _prop(
              type: "string",
              label: "Households aware of campaign",
              order: 24,
              format: "dropdown",
              fieldName: "householdsCampaignAware",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 25. routineVaccinationReminder
            _prop(
              type: "string",
              label: "Team reminds about routine vaccination",
              order: 25,
              format: "dropdown",
              fieldName: "routineVaccinationReminder",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 26. handwashingReminder
            _prop(
              type: "string",
              label: "Team reminds about handwashing",
              order: 26,
              format: "dropdown",
              fieldName: "handwashingReminder",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 27. afpInquiryConducted
            _prop(
              type: "string",
              label: "AFP inquiry conducted at households",
              order: 27,
              format: "dropdown",
              fieldName: "afpInquiryConducted",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),
          ],
        },

        // ── Page 3: Comments ──
        {
          "page": "comments",
          "label": "Final Comments",
          "order": 3,
          "type": "object",
          "description": "Final comments and observations",
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
            "configName": "polioTeamSupervision",
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
                  "message": "Failed to record team supervision data."
                }
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "teamSupervisionSuccess",
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
    // 2. teamSupervisionSuccess (TEMPLATE, order:2)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "TEMPLATE",
      "name": "teamSupervisionSuccess",
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
          "label": "Team Supervision Recorded Successfully",
          "description":
              "The team supervision checklist has been recorded successfully",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "Add Another Session",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "FORM",
                  "name": "teamSupervisionEntry"
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
