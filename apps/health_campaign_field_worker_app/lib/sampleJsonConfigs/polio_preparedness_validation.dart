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

final dynamic samplePolioPreparednessValidationFlows = {
  "name": "POLIO_PREPAREDNESS_VALIDATION",
  "initialPage": "preparednessValidationEntry",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ──────────────────────────────────────────────────────────
    // 1. preparednessValidationEntry (FORM, order:1)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "FORM",
      "name": "preparednessValidationEntry",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        // ── Page 1: Context ──
        {
          "page": "header",
          "label": "Context",
          "order": 1,
          "type": "object",
          "description": "Context information for preparedness validation",
          "actionLabel": "Next",
          ..._pageNulls(),
          "navigateTo": {"name": "microplan", "type": "form"},
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

            // 3. levelOfMonitor
            _prop(
              type: "string",
              label: "Level of Monitor",
              order: 3,
              format: "dropdown",
              fieldName: "levelOfMonitor",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
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
                {"code": "OTHERS", "name": "Others"},
              ],
            ),

            // 4. levelOfMonitorOther
            _prop(
              type: "string",
              label: "Other Level of Monitor (specify)",
              order: 4,
              format: "text",
              fieldName: "levelOfMonitorOther",
              validations: [],
              visibilityCondition: _vc("header.levelOfMonitor=='OTHERS'"),
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

            // 6. supervisorName
            _prop(
              type: "string",
              label: "Supervisor Name",
              order: 6,
              format: "text",
              fieldName: "supervisorName",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Supervisor name is required"
                },
              ],
            ),
          ],
        },

        // ── Page 2: Section I - Microplan ──
        {
          "page": "microplan",
          "label": "Section I - Microplan",
          "order": 2,
          "type": "object",
          "description": "Microplan readiness assessment",
          "actionLabel": "Next",
          ..._pageNulls(),
          "navigateTo": {"name": "coldChain", "type": "form"},
          "properties": [
            // 1. microplanDone
            _prop(
              type: "string",
              label: "Microplan completed",
              order: 1,
              format: "dropdown",
              fieldName: "microplanDone",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 2. htraAddressed
            _prop(
              type: "string",
              label: "High-risk/transit areas addressed in microplan",
              order: 2,
              format: "dropdown",
              fieldName: "htraAddressed",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 3. sketchMaps
            _prop(
              type: "string",
              label: "Sketch maps available",
              order: 3,
              format: "dropdown",
              fieldName: "sketchMaps",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 4. budgetIncluded
            _prop(
              type: "string",
              label: "Budget included in microplan",
              order: 4,
              format: "dropdown",
              fieldName: "budgetIncluded",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 5. tallySheetArrived
            _prop(
              type: "string",
              label: "Tally sheets arrived",
              order: 5,
              format: "dropdown",
              fieldName: "tallySheetArrived",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 6. fundsArrived
            _prop(
              type: "string",
              label: "Funds arrived",
              order: 6,
              format: "dropdown",
              fieldName: "fundsArrived",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 7. adminCommitment
            _prop(
              type: "string",
              label: "Administrative commitment secured",
              order: 7,
              format: "dropdown",
              fieldName: "adminCommitment",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 8. siaPlanExists
            _prop(
              type: "string",
              label: "SIA plan exists",
              order: 8,
              format: "dropdown",
              fieldName: "siaPlanExists",
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

        // ── Page 3: Section II - Cold Chain / Logistics ──
        {
          "page": "coldChain",
          "label": "Section II - Cold Chain / Logistics",
          "order": 3,
          "type": "object",
          "description": "Cold chain and logistics readiness assessment",
          "actionLabel": "Next",
          ..._pageNulls(),
          "navigateTo": {"name": "socialMobilization", "type": "form"},
          "properties": [
            // 1. fridgeTemp
            _prop(
              type: "string",
              label: "Fridge temperature within range",
              order: 1,
              format: "dropdown",
              fieldName: "fridgeTemp",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 2. freezerIcepacks
            _prop(
              type: "string",
              label: "Freezer ice packs available",
              order: 2,
              format: "dropdown",
              fieldName: "freezerIcepacks",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 3. vvmDiscard
            _prop(
              type: "string",
              label: "VVM discard point understood",
              order: 3,
              format: "dropdown",
              fieldName: "vvmDiscard",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 4. suppliesArrivedOnTime
            _prop(
              type: "string",
              label: "Supplies arrived on time",
              order: 4,
              format: "dropdown",
              fieldName: "suppliesArrivedOnTime",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 5. daysToCampaign
            _prop(
              type: "integer",
              label: "Days until campaign starts",
              order: 5,
              format: "numeric",
              fieldName: "daysToCampaign",
              value: "0",
              isEditable: true,
              validations: [
                {"type": "min", "value": 0, "message": "Must be 0 or more"},
              ],
            ),

            // 6. vaccineDroppersAdequate
            _prop(
              type: "string",
              label: "Vaccine droppers adequate",
              order: 6,
              format: "dropdown",
              fieldName: "vaccineDroppersAdequate",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 7. markersPlasticBags
            _prop(
              type: "string",
              label: "Markers and plastic bags available",
              order: 7,
              format: "dropdown",
              fieldName: "markersPlasticBags",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 8. chalkAdequate
            _prop(
              type: "string",
              label: "Chalk available for house marking",
              order: 8,
              format: "dropdown",
              fieldName: "chalkAdequate",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 9. tallySheetsAdequate
            _prop(
              type: "string",
              label: "Tally sheets adequate",
              order: 9,
              format: "dropdown",
              fieldName: "tallySheetsAdequate",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 10. vaccineCarriers
            _prop(
              type: "string",
              label: "Vaccine carriers available",
              order: 10,
              format: "dropdown",
              fieldName: "vaccineCarriers",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 11. faceMasksSanitizer
            _prop(
              type: "string",
              label: "Face masks and sanitizer available",
              order: 11,
              format: "dropdown",
              fieldName: "faceMasksSanitizer",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 12. transportArrangements
            _prop(
              type: "string",
              label: "Transport arrangements in place",
              order: 12,
              format: "dropdown",
              fieldName: "transportArrangements",
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

        // ── Page 4: Section III - Social Mobilization ──
        {
          "page": "socialMobilization",
          "label": "Section III - Social Mobilization",
          "order": 4,
          "type": "object",
          "description": "Social mobilization readiness assessment",
          "actionLabel": "Next",
          ..._pageNulls(),
          "navigateTo": {"name": "trainings", "type": "form"},
          "properties": [
            // 1. smCommittee
            _prop(
              type: "string",
              label: "Social mobilization committee exists",
              order: 1,
              format: "dropdown",
              fieldName: "smCommittee",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 2. smPlansExist
            _prop(
              type: "string",
              label: "Social mobilization plans exist",
              order: 2,
              format: "dropdown",
              fieldName: "smPlansExist",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 3. announcements
            _prop(
              type: "string",
              label: "Public announcements planned",
              order: 3,
              format: "dropdown",
              fieldName: "announcements",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 4. htraTargeted
            _prop(
              type: "string",
              label: "High-risk/transit areas targeted",
              order: 4,
              format: "dropdown",
              fieldName: "htraTargeted",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 5. stakeholdersInformed
            _prop(
              type: "string",
              label: "Key stakeholders informed",
              order: 5,
              format: "dropdown",
              fieldName: "stakeholdersInformed",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 6. plansImplemented
            _prop(
              type: "string",
              label: "Social mobilization plans implemented",
              order: 6,
              format: "dropdown",
              fieldName: "plansImplemented",
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

        // ── Page 5: Section IV - Trainings ──
        {
          "page": "trainings",
          "label": "Section IV - Trainings",
          "order": 5,
          "type": "object",
          "description": "Training readiness assessment",
          "actionLabel": "Submit",
          ..._pageNulls(),
          "properties": [
            // 1. supervisorsTrainedSeparately
            _prop(
              type: "string",
              label: "Supervisors trained separately",
              order: 1,
              format: "dropdown",
              fieldName: "supervisorsTrainedSeparately",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 2. socialMobilizersTrainedSeparately
            _prop(
              type: "string",
              label: "Social mobilizers trained separately",
              order: 2,
              format: "dropdown",
              fieldName: "socialMobilizersTrainedSeparately",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 3. smallGroups
            _prop(
              type: "string",
              label: "Training conducted in small groups",
              order: 3,
              format: "dropdown",
              fieldName: "smallGroups",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 4. agendaRationale
            _prop(
              type: "string",
              label: "Agenda includes campaign rationale",
              order: 4,
              format: "dropdown",
              fieldName: "agendaRationale",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 5. agendaMappingColdchain
            _prop(
              type: "string",
              label: "Agenda includes mapping and cold chain",
              order: 5,
              format: "dropdown",
              fieldName: "agendaMappingColdchain",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 6. agendaMarking
            _prop(
              type: "string",
              label: "Agenda includes house marking",
              order: 6,
              format: "dropdown",
              fieldName: "agendaMarking",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 7. agendaRecording
            _prop(
              type: "string",
              label: "Agenda includes recording and reporting",
              order: 7,
              format: "dropdown",
              fieldName: "agendaRecording",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 8. agendaIec
            _prop(
              type: "string",
              label: "Agenda includes IEC and communication",
              order: 8,
              format: "dropdown",
              fieldName: "agendaIec",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 9. agendaVaccineRetrieval
            _prop(
              type: "string",
              label: "Agenda includes vaccine retrieval",
              order: 9,
              format: "dropdown",
              fieldName: "agendaVaccineRetrieval",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 10. agendaAfpSensitization
            _prop(
              type: "string",
              label: "Agenda includes AFP sensitization",
              order: 10,
              format: "dropdown",
              fieldName: "agendaAfpSensitization",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 11. agendaDemonstrations
            _prop(
              type: "string",
              label: "Practical demonstrations conducted",
              order: 11,
              format: "dropdown",
              fieldName: "agendaDemonstrations",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
                {"code": "NA", "name": "N/A"},
              ],
            ),

            // 12. finalComments
            _prop(
              type: "string",
              label: "Final Comments / Observations",
              order: 12,
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
            "configName": "polioPreparednessValidation",
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
                  "message": "Failed to record preparedness validation."
                }
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "preparednessValidationSuccess",
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
    // 2. preparednessValidationSuccess (TEMPLATE, order:2)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "TEMPLATE",
      "name": "preparednessValidationSuccess",
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
          "label": "Preparedness Validation Recorded Successfully",
          "description":
              "The preparedness validation data has been recorded successfully",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "Add Another Record",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "FORM",
                  "name": "preparednessValidationEntry"
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
