/// Form for adding a missed place on the lowest boundary level, opened from
/// boundary selection with these navigation params:
/// `parentBoundaryCode`, `parentBoundaryName`, `parentLevelLabel`,
/// `levelLabel`, `existingNames`, `projectId`, `tenantId` and `userUuid`.
///
/// Messages use `{LEVEL}` for the lowest level's name (Settlement, Village,
/// ...), filled from `levelLabel` through `labelPlaceHolders` and
/// `descriptionPlaceHolders`.
///
/// Boundary selection opens it before the home page has set the flow-builder
/// singletons, so project, tenant and user come in as navigation params and
/// are handed to the `newSettlement` transformer as context.
///
/// Options come from MDMS like the registration gender field
/// (`common-masters.GenderType`): each option field names its master in
/// `schemaCode` (`HCM.MISSED_PLACE_TYPES`, `HCM.MISSED_PLACE_SAFETY`,
/// `HCM.MISSED_PLACE_REACHABILITY`) and project selection fills its `enums`
/// (ProjectBloc.enrichFormSchemasWithEnumsForForms). Until the config is
/// published, project selection enriches and stores this sample instead.
final dynamic sampleNewSettlementFlows = {
  "name": "MISSEDPLACE",
  "initialPage": "createSettlement",
  "order": 1,
  "project": "POLIO",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "active": true,
  "isActive": true,
  "flows": [
    {
      "name": "createSettlement",
      "order": 1,
      // Required by the forms engine's schema parser.
      "version": 1,
      "summary": false,
      "screenType": "FORM",
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        {
          "body": null,
          "flow": "createSettlement",
          "page": "settlementDetails",
          "type": "object",
          "label": "MISSED_PLACE_TITLE",
          "order": 1,
          "heading": "MISSED_PLACE_TITLE",
          "description": "MISSED_PLACE_DESCRIPTION",
          "labelPlaceHolders": [
            {"key": "LEVEL", "value": "{{navigation.levelLabel}}"}
          ],
          "descriptionPlaceHolders": [
            {"key": "LEVEL", "value": "{{navigation.levelLabel}}"}
          ],
          "actionLabel": "MISSED_PLACE_SAVE_ACTION",
          "showTabView": false,
          "summary": false,
          "submitCondition": null,
          "preventScreenCapture": false,
          "properties": [
            {
              "type": "string",
              // The parent level's name, e.g. "Health Facility".
              "label": "{PARENT_LEVEL}",
              "labelPlaceHolders": [
                {
                  "key": "PARENT_LEVEL",
                  "value": "{{navigation.parentLevelLabel}}"
                }
              ],
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "readOnly": true,
              "required": false,
              "fieldName": "parentBoundary",
              "validations": [],
              "includeInSummary": false,
              "autoFillCondition": [
                {"value": "{{parentBoundaryName}}", "expression": "true==true"}
              ]
            },
            {
              "type": "string",
              "label": "MISSED_PLACE_NAME_LABEL",
              "labelPlaceHolders": [
                {"key": "LEVEL", "value": "{{navigation.levelLabel}}"}
              ],
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "readOnly": false,
              "required": true,
              "fieldName": "settlementName",
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "MISSED_PLACE_NAME_REQUIRED"
                },
                {
                  // Names already listed under the parent.
                  "type": "notIn",
                  "value": "navigation.existingNames",
                  "message": "MISSED_PLACE_NAME_EXISTS"
                }
              ]
            },
            {
              "type": "string",
              "label": "MISSED_PLACE_TYPE_LABEL",
              "labelPlaceHolders": [
                {"key": "LEVEL", "value": "{{navigation.levelLabel}}"}
              ],
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "isMdms": true,
              "schemaCode": "HCM.MISSED_PLACE_TYPES",
              "readOnly": false,
              "required": true,
              "fieldName": "settlementType",
              "isMultiSelect": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "MISSED_PLACE_TYPE_REQUIRED"
                }
              ]
            },
            {
              "type": "string",
              "label": "MISSED_PLACE_SAFETY_LABEL",
              "order": 4,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "isMdms": true,
              "schemaCode": "HCM.MISSED_PLACE_SAFETY",
              "readOnly": false,
              "required": true,
              "fieldName": "securityLevel",
              "isMultiSelect": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "MISSED_PLACE_SAFETY_REQUIRED"
                }
              ]
            },
            {
              "type": "string",
              "label": "MISSED_PLACE_REACHABILITY_LABEL",
              "order": 5,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": true,
              "schemaCode": "HCM.MISSED_PLACE_REACHABILITY",
              "readOnly": false,
              "required": true,
              "fieldName": "accessRoute",
              "isMultiSelect": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "MISSED_PLACE_REACHABILITY_REQUIRED"
                }
              ]
            },
            {
              "type": "string",
              "label": "MISSED_PLACE_GPS_ACCURACY_LABEL",
              "order": 6,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "readOnly": true,
              "required": true,
              "fieldName": "gps",
              "includeInSummary": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "MISSED_PLACE_WAITING_FOR_GPS"
                }
              ]
            }
          ]
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "newSettlement",
            "data": [
              {
                "key": "parentBoundaryCode",
                "value": "{{navigation.parentBoundaryCode}}"
              },
              {"key": "projectId", "value": "{{navigation.projectId}}"},
              {"key": "tenantId", "value": "{{navigation.tenantId}}"},
              {"key": "userUUID", "value": "{{navigation.userUuid}}"}
            ],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "MISSED_PLACE_SAVE_FAILED"}
              }
            ]
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "USERACTION",
            // Saved before the page pops: boundary selection reads it back.
            "awaitCreate": true,
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "MISSED_PLACE_SAVE_FAILED"}
              }
            ]
          }
        },
        // Back to boundary selection, which reloads and selects it.
        {"actionType": "BACK_NAVIGATION", "properties": {}}
      ]
    }
  ]
};
