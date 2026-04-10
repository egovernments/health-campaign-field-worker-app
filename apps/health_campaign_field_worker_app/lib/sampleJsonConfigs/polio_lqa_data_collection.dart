/// Maximum number of child interview pages.
const int lqaChildCount = 10;

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
/// Example: _vc("child1.fingerMarked=='NO'")
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

/// Build one child-interview page.
/// [childIndex] is 1-based.  [nextPage] is the default page to navigate to
/// (e.g. "child2", or "closeout" for the last child).
Map<String, dynamic> _childPage(int childIndex, String nextPage) {
  final pageName = "child$childIndex";
  return {
    "page": pageName,
    "label": "Child $childIndex",
    "order": childIndex + 1, // page 1 is clusterInfo → order 1
    "type": "object",
    "description": "Interview child $childIndex in this cluster",
    "actionLabel": "Next",
    ..._pageNulls(),
    "navigateTo": {"name": nextPage, "type": "form"},
    // Dynamic page skip: when this is the last child based on numberOfInterviews
    if (childIndex < lqaChildCount)
      "conditionalNavigateTo": [
        {
          "type": "custom",
          "condition": "clusterInfo.numberOfInterviews=='$childIndex'",
          "navigateTo": {"name": "closeout", "type": "form"}
        }
      ],
    "properties": [
      // 1. childrenUnder5
      _prop(
        type: "integer",
        label: "Children under 5 in household",
        order: 1,
        format: "numeric",
        fieldName: "childrenUnder5",
        value: "0",
        isEditable: true,
        helpText:
            "Total <5yr children belonging to household (excluding visitors)",
        validations: [
          {"type": "required", "value": true, "message": "Required"},
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 2. childAgeMonths
      _prop(
        type: "integer",
        label: "Age of selected child (months)",
        order: 2,
        format: "numeric",
        fieldName: "childAgeMonths",
        value: "",
        isEditable: true,
        validations: [
          {"type": "required", "value": true, "message": "Required"},
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
          {"type": "max", "value": 59, "message": "Must be 59 or less"},
        ],
      ),

      // 3. childSex
      _prop(
        type: "string",
        label: "Sex of child",
        order: 3,
        format: "dropdown",
        fieldName: "childSex",
        validations: [
          {"type": "required", "value": true, "message": "Required"},
        ],
        enums: [
          {"code": "MALE", "name": "Male"},
          {"code": "FEMALE", "name": "Female"},
        ],
      ),

      // 4. fingerMarked — core LQAS coverage indicator
      _prop(
        type: "string",
        label: "Is child's finger marked for OPV?",
        order: 4,
        format: "dropdown",
        fieldName: "fingerMarked",
        validations: [
          {"type": "required", "value": true, "message": "Required"},
        ],
        enums: [
          {"code": "YES", "name": "Yes"},
          {"code": "NO", "name": "No"},
        ],
      ),

      // ── Conditional block: shown only when fingerMarked == NO ──

      // 5. reasonNotMarked (non-mandatory)
      _prop(
        type: "string",
        label: "Reason finger not marked",
        order: 5,
        format: "dropdown",
        fieldName: "reasonNotMarked",
        validations: [],
        enums: [
          {"code": "CHILD_ABSENT", "name": "Child Absent"},
          {"code": "NON_COMPLIANCE", "name": "Non Compliance / Refusal"},
          {"code": "HOUSE_NOT_VISITED", "name": "House not visited"},
          {
            "code": "VACCINATED_NOT_MARKED",
            "name": "Vaccinated but not finger marked"
          },
          {"code": "CHILD_ASLEEP", "name": "Child was asleep"},
          {"code": "CHILD_VISITOR", "name": "Child is a visitor"},
          {"code": "OTHER", "name": "Other"},
        ],
        visibilityCondition: _vc("$pageName.fingerMarked=='NO'"),
      ),

      // 6. reasonNotMarkedOther (non-mandatory)
      _prop(
        type: "string",
        label: "Other reason (specify)",
        order: 6,
        format: "text",
        fieldName: "reasonNotMarkedOther",
        validations: [],
        visibilityCondition: _vc("$pageName.reasonNotMarked=='OTHER'"),
      ),

      // ── Sub-conditional: shown when reasonNotMarked == NON_COMPLIANCE ──

      // 7. refusalReason (non-mandatory)
      _prop(
        type: "string",
        label: "Reason for refusal",
        order: 7,
        format: "dropdown",
        fieldName: "refusalReason",
        validations: [],
        enums: [
          {
            "code": "RELIGIOUS_CULTURAL",
            "name": "Religious / Cultural beliefs"
          },
          {"code": "VACCINE_NOT_SAFE", "name": "Vaccine is not safe"},
          {"code": "NO_FELT_NEED", "name": "No felt need"},
          {"code": "TOO_MANY_ROUNDS", "name": "Too many rounds"},
          {"code": "NO_CAREGIVER_CONSENT", "name": "No caregiver consent"},
          {"code": "CHILD_SICK", "name": "Child was sick"},
          {"code": "COVID_RELATED", "name": "COVID-19 related reasons"},
          {"code": "AFRICA_POLIO_FREE", "name": "Africa is polio free"},
          {"code": "NOPV_CONCERNS", "name": "Concerns about nOPV"},
          {"code": "OTHERS", "name": "Others"},
        ],
        visibilityCondition:
            _vc("$pageName.reasonNotMarked=='NON_COMPLIANCE'"),
      ),

      // 8. refusalReasonOther (non-mandatory)
      _prop(
        type: "string",
        label: "Other refusal reason (specify)",
        order: 8,
        format: "text",
        fieldName: "refusalReasonOther",
        validations: [],
        visibilityCondition: _vc("$pageName.refusalReason=='OTHERS'"),
      ),

      // ── Sub-conditional: shown when reasonNotMarked == CHILD_ABSENT ──

      // 9. absenceReason (non-mandatory)
      _prop(
        type: "string",
        label: "Reason for absence",
        order: 9,
        format: "dropdown",
        fieldName: "absenceReason",
        validations: [],
        enums: [
          {"code": "AT_FARM", "name": "At the farm"},
          {"code": "IN_MARKET", "name": "In market"},
          {"code": "AT_SCHOOL", "name": "At school"},
          {"code": "IN_PLAYGROUND", "name": "In playground"},
          {"code": "TRAVELLED", "name": "Travelled"},
          {"code": "OTHER", "name": "Other"},
        ],
        visibilityCondition: _vc("$pageName.reasonNotMarked=='CHILD_ABSENT'"),
      ),

      // 10. absenceReasonOther (non-mandatory)
      _prop(
        type: "string",
        label: "Other absence reason (specify)",
        order: 10,
        format: "text",
        fieldName: "absenceReasonOther",
        validations: [],
        visibilityCondition: _vc("$pageName.absenceReason=='OTHER'"),
      ),

      // ── End of fingerMarked == NO conditional block ──

      // 11. caregiverInformed
      _prop(
        type: "string",
        label: "Was caregiver informed about the campaign?",
        order: 11,
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

      // 12. campaignAwareness — show when caregiverInformed == YES
      _prop(
        type: "string",
        label: "How did caregiver know about the campaign?",
        order: 12,
        format: "dropdown",
        fieldName: "campaignAwareness",
        validations: [],
        enums: [
          {"code": "TV", "name": "TV"},
          {"code": "RADIO", "name": "Radio / community radio"},
          {"code": "MOB_VAN", "name": "Mob Van / PA"},
          {"code": "HEALTH_WORKER", "name": "Health worker"},
          {
            "code": "VOLUNTEER_CHW",
            "name": "Volunteer community health workers"
          },
          {"code": "RELIGIOUS_LEADER", "name": "Religious leader"},
          {"code": "COMMUNITY_LEADER", "name": "Community leader"},
          {
            "code": "SOCIAL_MEDIA",
            "name": "Mobile Messaging / Social Media"
          },
          {"code": "SCHOOL", "name": "School (Teachers / students)"},
          {"code": "IEC_MATERIALS", "name": "IEC materials"},
          {"code": "SOCIAL_MOBILIZER", "name": "Social Mobilizer / CBV"},
          {"code": "NEIGHBOUR", "name": "Neighbour"},
          {"code": "NEWSPAPER", "name": "Newspaper"},
          {"code": "OTHERS", "name": "Others"},
        ],
        visibilityCondition: _vc("$pageName.caregiverInformed=='YES'"),
      ),

      // 13. awarenessOther — optional, shown alongside campaignAwareness
      _prop(
        type: "string",
        label: "Other awareness source (specify)",
        order: 13,
        format: "text",
        fieldName: "awarenessOther",
        validations: [],
        visibilityCondition: _vc("$pageName.caregiverInformed=='YES'"),
      ),

      // 14. opvDosesFromBirth
      _prop(
        type: "integer",
        label: "Total OPV doses received from birth",
        order: 14,
        format: "numeric",
        fieldName: "opvDosesFromBirth",
        value: "",
        isEditable: true,
        validations: [
          {"type": "required", "value": true, "message": "Required"},
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
      ),

      // 15. afpAwareness
      _prop(
        type: "string",
        label: "Caregiver aware of AFP cases in community (last 2 months)?",
        order: 15,
        format: "dropdown",
        fieldName: "afpAwareness",
        validations: [
          {"type": "required", "value": true, "message": "Required"},
        ],
        enums: [
          {"code": "YES", "name": "Yes"},
          {"code": "NO", "name": "No"},
        ],
      ),

      // 16. afpCaseCount — show when afpAwareness == YES
      _prop(
        type: "integer",
        label: "Number of AFP cases known",
        order: 16,
        format: "numeric",
        fieldName: "afpCaseCount",
        value: "",
        isEditable: true,
        validations: [
          {"type": "min", "value": 0, "message": "Must be 0 or more"},
        ],
        visibilityCondition: _vc("$pageName.afpAwareness=='YES'"),
      ),
    ],
  };
}

final dynamic samplePolioLqaDataCollectionFlows = {
  "name": "POLIO_LQA_DATA_COLLECTION",
  "initialPage": "lqaDataEntry",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ──────────────────────────────────────────────────────────
    // 1. lqaDataEntry (FORM, order:1) — LQA Data Collection
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "FORM",
      "name": "lqaDataEntry",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        // ── Page 1: Cluster Info ──
        {
          "page": "clusterInfo",
          "label": "Cluster Information",
          "order": 1,
          "type": "object",
          "description":
              "Lot/cluster header — geographic info, surveyor details, GPS",
          "actionLabel": "Next",
          ..._pageNulls(),
          "navigateTo": {"name": "child1", "type": "form"},
          "properties": [
            // 1. surveyDate
            _prop(
              type: "string",
              label: "Survey Date",
              order: 1,
              format: "text",
              fieldName: "surveyDate",
              readOnly: true,
              systemDate: true,
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Survey date is required"
                },
              ],
            ),

            // 2. settlementArea — auto-populated from selected boundary
            _prop(
              type: "string",
              label: "Settlement Area",
              order: 2,
              format: "locality",
              fieldName: "settlementArea",
              readOnly: true,
              validations: [],
            ),

            // 3. healthFacilityArea
            _prop(
              type: "string",
              label: "Health Facility Area",
              order: 3,
              format: "text",
              fieldName: "healthFacilityArea",
              validations: [],
            ),

            // 4. lotNumber
            _prop(
              type: "string",
              label: "Sub-County LOT Number",
              order: 4,
              format: "text",
              fieldName: "lotNumber",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Lot number is required"
                },
              ],
            ),

            // 5. clusterNumber
            _prop(
              type: "string",
              label: "Cluster Number",
              order: 5,
              format: "dropdown",
              fieldName: "clusterNumber",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Cluster number is required"
                },
              ],
              enums: [
                {"code": "1", "name": "Cluster 1"},
                {"code": "2", "name": "Cluster 2"},
                {"code": "3", "name": "Cluster 3"},
                {"code": "4", "name": "Cluster 4"},
                {"code": "5", "name": "Cluster 5"},
                {"code": "6", "name": "Cluster 6"},
              ],
            ),

            // 6. numberOfInterviews — controls how many child pages are shown
            _prop(
              type: "integer",
              label: "Number of Child Interviews",
              order: 6,
              format: "numeric",
              fieldName: "numberOfInterviews",
              value: "5",
              isEditable: true,
              helpText: "How many children to interview in this cluster (1-10)",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required"
                },
                {
                  "type": "min",
                  "value": 1,
                  "message": "Minimum 1 interview"
                },
                {
                  "type": "max",
                  "value": 10,
                  "message": "Maximum 10 interviews"
                },
              ],
            ),

            // 7. surveyorName — auto-populated from logged-in user
            _prop(
              type: "string",
              label: "Surveyor Name",
              order: 7,
              format: "text",
              fieldName: "surveyorName",
              readOnly: true,
              helpText: "Auto-populated from logged-in user",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Surveyor name is required"
                },
              ],
              autoFillCondition: [
                {
                  "value": "{{loggedInUserName}}",
                  "expression": "true==true"
                }
              ],
            ),

            // 8. surveyorPhone — auto-populated from logged-in user
            _prop(
              type: "string",
              label: "Surveyor Phone Number",
              order: 8,
              format: "phone",
              fieldName: "surveyorPhone",
              readOnly: true,
              helpText: "Auto-populated from logged-in user",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Phone number is required"
                },
              ],
              autoFillCondition: [
                {
                  "value": "{{loggedInUserMobileNumber}}",
                  "expression": "true==true"
                }
              ],
            ),

            // 9. lqasCoordinatorName
            _prop(
              type: "string",
              label: "LQAS Coordinator Name",
              order: 9,
              format: "text",
              fieldName: "lqasCoordinatorName",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Coordinator name is required"
                },
                {
                  "type": "minLength",
                  "value": 2,
                  "message": "Name must be at least 2 characters"
                },
              ],
            ),

            // 10. startingVillage
            _prop(
              type: "string",
              label: "Starting Village / Settlement",
              order: 10,
              format: "text",
              fieldName: "startingVillage",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Starting village is required"
                },
              ],
            ),

            // 11. settlementType
            _prop(
              type: "string",
              label: "Settlement Type",
              order: 11,
              format: "dropdown",
              fieldName: "settlementType",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "Settlement type is required"
                },
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

            // 12. settlementSmall
            _prop(
              type: "string",
              label: "Is settlement less than 20 houses?",
              order: 12,
              format: "dropdown",
              fieldName: "settlementSmall",
              validations: [
                {"type": "required", "value": true, "message": "Required"},
              ],
              enums: [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"},
              ],
            ),

            // 13. gpsStart
            _prop(
              type: "string",
              label: "GPS Start Location",
              order: 13,
              format: "latLng",
              fieldName: "gpsStart",
              helpText: "Capture GPS coordinates at cluster starting point",
              validations: [
                {
                  "type": "required",
                  "value": true,
                  "message": "GPS location is required"
                },
              ],
            ),
          ],
        },

        // ── Child pages: generated dynamically (max lqaChildCount) ──
        for (int i = 1; i <= lqaChildCount; i++)
          _childPage(
            i,
            i < lqaChildCount ? "child${i + 1}" : "closeout",
          ),

        // ── Closeout page ──
        {
          "page": "closeout",
          "label": "Cluster Closeout",
          "order":
              lqaChildCount + 2, // clusterInfo=1, children=2..N+1, closeout=N+2
          "type": "object",
          "description": "Final GPS and comments",
          "actionLabel": "Submit",
          ..._pageNulls(),
          "properties": [
            // 1. gpsFinal
            _prop(
              type: "string",
              label: "GPS Final Location",
              order: 1,
              format: "latLng",
              fieldName: "gpsFinal",
              helpText: "Capture GPS coordinates at end of cluster walk",
              validations: [],
            ),

            // 2. finalComments
            _prop(
              type: "string",
              label: "Final Comments / Observations",
              order: 2,
              format: "textArea",
              fieldName: "finalComments",
              helpText: "Comments or observations for program management",
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
            "configName": "polioLqaDataCollection",
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
                "properties": {"message": "Failed to record LQA data."}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "lqaSuccess",
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
    // 2. lqaSuccess (TEMPLATE, order:2)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "TEMPLATE",
      "name": "lqaSuccess",
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
          "label": "LQA Data Collected Successfully",
          "description":
              "The LQA cluster data has been recorded successfully",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "Add Another Cluster",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"type": "FORM", "name": "lqaDataEntry"}
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
