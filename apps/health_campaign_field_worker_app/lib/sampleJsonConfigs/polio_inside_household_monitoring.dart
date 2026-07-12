final dynamic samplePolioInsideHouseholdMonitoringFlows = {
  "name": "POLIO_INSIDE_HOUSEHOLD_MONITORING",
  "initialPage": "insideHouseholdEntry",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "name": "insideHouseholdEntry",
      "order": 1,
      "pages": [
        {
          "page": "firstHouseholdLocation",
          "type": "object",
          "label": "IHM_FIRST_HOUSEHOLD_LOCATION_LABEL",
          "order": 1,
          "value": null,
          "hidden": null,
          "endDate": null,
          "tooltip": null,
          "helpText": null,
          "readOnly": null,
          "required": null,
          "charCount": null,
          "startDate": null,
          "autoEnable": null,
          "innerLabel": null,
          "navigateTo": {"name": "monitoringDetails", "type": "form"},
          "properties": [
            {
              "type": "string",
              "label": "IHM_GPS_FIRST_HOUSEHOLD_LABEL",
              "order": 1,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gpsFirstHousehold",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "IHM_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_gpsFirstHousehold_ERROR",
              "isMultiSelect": false
            }
          ],
          "systemDate": null,
          "actionLabel": "IHM_NEXT",
          "description": "IHM_FIRST_HOUSEHOLD_LOCATION_DESC",
          "validations": null,
          "includeInForm": null,
          "isMultiSelect": null,
          "includeInSummary": null
        },
        {
          "page": "monitoringDetails",
          "type": "object",
          "label": "IHM_MONITORING_DETAILS_LABEL",
          "order": 2,
          "value": null,
          "hidden": null,
          "endDate": null,
          "tooltip": null,
          "helpText": null,
          "readOnly": null,
          "required": null,
          "charCount": null,
          "startDate": null,
          "autoEnable": null,
          "innerLabel": null,
          "navigateTo": {"name": "closeout", "type": "form"},
          "properties": [
            {
              "type": "string",
              "enums": [
                {"code": "WHO_HQ", "name": "IHM_ENUM_WHO_HQ"},
                {"code": "WHO_REGION", "name": "IHM_ENUM_WHO_REGION"},
                {"code": "WHO_COUNTRY", "name": "IHM_ENUM_WHO_COUNTRY"},
                {"code": "WHO_HUB", "name": "IHM_ENUM_WHO_HUB"},
                {
                  "code": "WHO_SUB_NATIONAL",
                  "name": "IHM_ENUM_WHO_SUB_NATIONAL"
                },
                {"code": "WHO_ZONAL", "name": "IHM_ENUM_WHO_ZONAL"},
                {"code": "UNICEF_HQ", "name": "IHM_ENUM_UNICEF_HQ"},
                {"code": "UNICEF_REGION", "name": "IHM_ENUM_UNICEF_REGION"},
                {"code": "UNICEF_COUNTRY", "name": "IHM_ENUM_UNICEF_COUNTRY"},
                {
                  "code": "UNICEF_SUB_NATIONAL",
                  "name": "IHM_ENUM_UNICEF_SUB_NATIONAL"
                },
                {"code": "CDC_HQ", "name": "IHM_ENUM_CDC_HQ"},
                {"code": "CDC_COUNTRY", "name": "IHM_ENUM_CDC_COUNTRY"},
                {"code": "BMGF", "name": "IHM_ENUM_BMGF"},
                {"code": "ROTARY", "name": "IHM_ENUM_ROTARY"},
                {"code": "MOH_NATIONAL", "name": "IHM_ENUM_MOH_NATIONAL"},
                {"code": "MOH_STATE", "name": "IHM_ENUM_MOH_STATE"},
                {"code": "MOH_LGA", "name": "IHM_ENUM_MOH_LGA"},
                {"code": "NPHCDA", "name": "IHM_ENUM_NPHCDA"},
                {"code": "SPHCDA", "name": "IHM_ENUM_SPHCDA"},
                {"code": "LPHCDA", "name": "IHM_ENUM_LPHCDA"},
                {"code": "PARTNER", "name": "IHM_ENUM_PARTNER"},
                {"code": "VOLUNTEER", "name": "IHM_ENUM_VOLUNTEER"},
                {"code": "STUDENT", "name": "IHM_ENUM_STUDENT"},
                {"code": "OTHERS", "name": "IHM_ENUM_OTHERS"}
              ],
              "label": "IHM_MONITOR_DESIGNATION_LABEL",
              "order": 1,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "monitorDesignation",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "IHM_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_monitorDesignation_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "IHM_DESIGNATION_OTHER_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "designationOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition":
                        "monitoringDetails.monitorDesignation=='OTHERS'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "IN_PROCESS", "name": "IHM_ENUM_IN_PROCESS"},
                {"code": "END_PROCESS", "name": "IHM_ENUM_END_PROCESS"}
              ],
              "label": "IHM_MONITORING_TYPE_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "monitoringType",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "IHM_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_monitoringType_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "IHM_MONITORING_DATE_LABEL",
              "order": 4,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "monitoringDate",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "IHM_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_monitoringDate_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "IHM_SETTLEMENT_AREA_LABEL",
              "order": 5,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "settlementArea",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "IHM_MONITOR_NAME_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "monitorName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "IHM_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_monitorName_ERROR",
              "isMultiSelect": false,
              "autoFillCondition": [
                {"value": "{{loggedInUserName}}", "expression": "true==true"}
              ]
            },
            {
              "type": "string",
              "label": "IHM_MONITOR_PHONE_LABEL",
              "order": 9,
              "value": "",
              "format": "phone",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "monitorPhone",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "autoFillCondition": [
                {
                  "value": "{{loggedInUserMobileNumber}}",
                  "expression": "true==true"
                }
              ]
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "IHM_ENUM_YES"},
                {"code": "NO", "name": "IHM_ENUM_NO"}
              ],
              "label": "IHM_TEAM_VISITED_LABEL",
              "order": 10,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "teamVisited",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "IHM_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_teamVisited_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "IHM_ENUM_YES"},
                {"code": "NO", "name": "IHM_ENUM_NO"}
              ],
              "label": "IHM_HOUSE_MARKED_LABEL",
              "order": 11,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "houseMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "monitoringDetails.teamVisited=='YES'"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "IHM_CHILDREN_PRESENT_LABEL",
              "order": 12,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenPresent",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "IHM_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_childrenPresent_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "IHM_CHILDREN_VACCINATED_LABEL",
              "order": 13,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenVaccinated",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "IHM_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_childrenVaccinated_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "HOUSE", "name": "IHM_ENUM_HOUSE"},
                {"code": "HEALTH_FACILITY", "name": "IHM_ENUM_HEALTH_FACILITY"},
                {"code": "SCHOOL", "name": "IHM_ENUM_SCHOOL"},
                {"code": "MARKET", "name": "IHM_ENUM_MARKET"},
                {"code": "FARM", "name": "IHM_ENUM_FARM"},
                {
                  "code": "RELIGIOUS_CENTER",
                  "name": "IHM_ENUM_RELIGIOUS_CENTER"
                },
                {"code": "TRANSIT_POINT", "name": "IHM_ENUM_TRANSIT_POINT"},
                {
                  "code": "COMMUNITY_CENTER",
                  "name": "IHM_ENUM_COMMUNITY_CENTER"
                },
                {"code": "PLAYGROUND", "name": "IHM_ENUM_PLAYGROUND"},
                {"code": "OTHER", "name": "IHM_ENUM_OTHER"}
              ],
              "label": "IHM_VACCINATION_LOCATION_LABEL",
              "order": 14,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "vaccinationLocation",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "IHM_MISSED_ABSENT_LABEL",
              "order": 15,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "missedAbsent",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "IHM_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_missedAbsent_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "IHM_MISSED_REFUSAL_LABEL",
              "order": 16,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "missedRefusal",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "IHM_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_missedRefusal_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "IHM_MISSED_NOT_VISITED_LABEL",
              "order": 17,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "missedNotVisited",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "IHM_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_missedNotVisited_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "IHM_MISSED_NOT_REVISITED_LABEL",
              "order": 18,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "missedNotRevisited",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "IHM_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_missedNotRevisited_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "IHM_MISSED_ASLEEP_LABEL",
              "order": 19,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "missedAsleep",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "IHM_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_missedAsleep_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "IHM_MISSED_ROUTINE_LABEL",
              "order": 20,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "missedRoutine",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "IHM_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_missedRoutine_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "IHM_MISSED_OTHER_LABEL",
              "order": 21,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "missedOther",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "IHM_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_missedOther_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "IHM_ENUM_YES"},
                {"code": "NO", "name": "IHM_ENUM_NO"}
              ],
              "label": "IHM_CAREGIVER_INFORMED_LABEL",
              "order": 22,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "caregiverInformed",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "IHM_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_caregiverInformed_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "TV", "name": "IHM_ENUM_TV"},
                {"code": "RADIO", "name": "IHM_ENUM_RADIO"},
                {"code": "MOB_VAN", "name": "IHM_ENUM_MOB_VAN"},
                {"code": "HEALTH_WORKER", "name": "IHM_ENUM_HEALTH_WORKER"},
                {"code": "VOLUNTEER_CHW", "name": "IHM_ENUM_VOLUNTEER_CHW"},
                {
                  "code": "RELIGIOUS_LEADER",
                  "name": "IHM_ENUM_RELIGIOUS_LEADER"
                },
                {
                  "code": "COMMUNITY_LEADER",
                  "name": "IHM_ENUM_COMMUNITY_LEADER"
                },
                {"code": "SOCIAL_MEDIA", "name": "IHM_ENUM_SOCIAL_MEDIA"},
                {"code": "SCHOOL", "name": "IHM_ENUM_SCHOOL_SOURCE"},
                {"code": "IEC_MATERIALS", "name": "IHM_ENUM_IEC_MATERIALS"},
                {
                  "code": "SOCIAL_MOBILIZER",
                  "name": "IHM_ENUM_SOCIAL_MOBILIZER"
                },
                {"code": "NEIGHBOUR", "name": "IHM_ENUM_NEIGHBOUR"},
                {"code": "NEWSPAPER", "name": "IHM_ENUM_NEWSPAPER"},
                {"code": "OTHERS", "name": "IHM_ENUM_OTHERS_SOURCE"}
              ],
              "label": "IHM_CAMPAIGN_INFO_SOURCE_LABEL",
              "order": 23,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignInfoSource",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": true,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "monitoringDetails.caregiverInformed=='YES'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "IHM_INFO_SOURCE_OTHER_LABEL",
              "order": 24,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "infoSourceOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "contains(monitoringDetails.campaignInfoSource, 'OTHERS')"
                  }
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "IHM_ENUM_YES"},
                {"code": "NO", "name": "IHM_ENUM_NO"}
              ],
              "label": "IHM_AFP_LIMB_WEAKNESS_LABEL",
              "order": 25,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpLimbWeakness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "IHM_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_afpLimbWeakness_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "IHM_AFP_CASE_COUNT_LABEL",
              "order": 26,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpSuddenWeakness",
              "deleteFlag": false,
              "innerLabel": "",
              "isEditable": true,
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "IHM_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_afpSuddenWeakness_ERROR",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "type": "custom",
                    "condition": "monitoringDetails.afpLimbWeakness=='YES'"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "IHM_CAREGIVER_NAME_LABEL",
              "order": 27,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "caregiverName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "IHM_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_caregiverName_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "IHM_CAREGIVER_PHONE_LABEL",
              "order": 28,
              "value": "",
              "format": "phone",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "caregiverPhone",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "minLength",
                  "value": "10",
                  "message": "IHM_PHONE_MIN_LENGTH_ERROR"
                },
                {
                  "type": "maxLength",
                  "value": "10",
                  "message": "IHM_PHONE_MAX_LENGTH_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ],
          "systemDate": null,
          "actionLabel": "IHM_NEXT",
          "description": "IHM_MONITORING_DETAILS_DESC",
          "validations": null,
          "includeInForm": null,
          "isMultiSelect": null,
          "includeInSummary": null
        },
        {
          "page": "closeout",
          "type": "object",
          "label": "IHM_CLOSEOUT_LABEL",
          "order": 3,
          "value": null,
          "hidden": null,
          "endDate": null,
          "tooltip": null,
          "helpText": null,
          "readOnly": null,
          "required": null,
          "charCount": null,
          "startDate": null,
          "autoEnable": null,
          "innerLabel": null,
          "properties": [
            {
              "type": "string",
              "label": "IHM_GPS_LAST_HOUSEHOLD_LABEL",
              "order": 1,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gpsLastHousehold",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "IHM_ENUM_YES"},
                {"code": "NO", "name": "IHM_ENUM_NO"}
              ],
              "label": "IHM_POORLY_COVERED_AREAS_LABEL",
              "order": 2,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "poorlyCoveredAreas",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "IHM_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_poorlyCoveredAreas_ERROR",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "IHM_FINAL_COMMENTS_LABEL",
              "order": 3,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "finalComments",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "maxLength",
                  "value": 500,
                  "message": "IHM_VALIDATION_MAX_500"
                }
              ],
              "errorMessage":
                  "INSIDEMONITORING_INSIDEHOUSEHOLDENTRY_finalComments_ERROR",
              "isMultiSelect": false
            }
          ],
          "systemDate": null,
          "actionLabel": "IHM_SUBMIT",
          "description": "IHM_CLOSEOUT_DESC",
          "validations": null,
          "includeInForm": null,
          "isMultiSelect": null,
          "includeInSummary": null
        }
      ],
      "version": 1,
      "category": "Monitoring",
      "disabled": false,
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "data": [],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "IHM_ERROR_FETCH_CONFIG"}
              }
            ],
            "configName": "polioInsideHousehold"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "USERACTION",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "IHM_ERROR_CREATE_RECORD"}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "data": [
              {
                "key": "SessionClientReferenceId",
                "value":
                    "{{contextData.entities.UserActionModel.clientReferenceId}}"
              }
            ],
            "name": "insideMonitoringSummary",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "IHM_ERROR_NAVIGATION"}
              }
            ]
          }
        }
      ],
      "isSelected": true,
      "screenType": "FORM",
      "initActions": [],
      "wrapperConfig": {},
      "includeSummary": true
    },
    {
      "body": [
        {
          "type": "template",
          "format": "card",
          "children": [
            {
              "data": [
                {
                  "key": "IHM_SUMMARY_MONITOR_NAME",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.monitorName}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_MONITORING_DATE",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.monitoringDate}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_SETTLEMENT_AREA",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.settlementArea}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_MONITOR_DESIGNATION",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.monitorDesignation}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_CHILDREN_PRESENT",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.childrenPresent}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_CHILDREN_VACCINATED",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.childrenVaccinated}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_MISSED_ABSENT",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.missedAbsent}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_MISSED_REFUSAL",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.missedRefusal}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_MISSED_NOT_VISITED",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.missedNotVisited}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_MISSED_NOT_REVISITED",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.missedNotRevisited}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_MISSED_ASLEEP",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.missedAsleep}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_MISSED_ROUTINE",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.missedRoutine}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_MISSED_OTHER",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.missedOther}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_POORLY_COVERED",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.poorlyCoveredAreas}}",
                  "isActive": true
                },
                {
                  "key": "IHM_SUMMARY_FINAL_COMMENTS",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.finalComments}}",
                  "isActive": true
                }
              ],
              "type": "template",
              "format": "labelPairList",
              "fieldName": "sessionSummary",
              "valueLocalizationPrefix": "IHM_ENUM_"
            }
          ],
          "fieldName": "summaryCard",
          "properties": {"type": "primary"}
        }
      ],
      "name": "insideMonitoringSummary",
      "order": 2,
      "canPop": false,
      "footer": [
        {
          "type": "template",
          "label": "IHM_ADD_ANOTHER_SESSION",
          "format": "button",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {"name": "insideHouseholdEntry", "type": "FORM"}
            }
          ],
          "fieldName": "addAnotherSession",
          "properties": {
            "size": "large",
            "type": "secondary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        },
        {
          "type": "template",
          "label": "IHM_BACK_TO_HOME",
          "format": "button",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "HOME", "type": "HOME"}
            }
          ],
          "fieldName": "backToHome",
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        }
      ],
      "header": [],
      "heading": "IHM_SUMMARY_HEADING",
      "category": "Monitoring",
      "screenType": "TEMPLATE",
      "description": "IHM_SUMMARY_DESCRIPTION",
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "clientReferenceId",
                "root": "userAction",
                "value": "{{navigation.SessionClientReferenceId}}",
                "operation": "equals"
              }
            ],
            "name": "session",
            "type": "SEARCH_EVENT"
          }
        }
      ],
      "wrapperConfig": {
        "filters": [
          {"field": "action", "equals": "LOCATION_CAPTURE"},
          {
            "field": "additionalFields.fields.form",
            "equals": "POLIO_INSIDE_MONITORING"
          }
        ],
        "relations": [
          {
            "name": "session",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "UserActionModel"
          }
        ],
        "rootEntity": "UserActionModel",
        "wrapperName": "InsideMonitoringWrapper",
        "searchConfig": {
          "select": ["userAction"],
          "primary": "userAction"
        }
      }
    }
  ]
};
