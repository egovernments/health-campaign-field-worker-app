final dynamic samplePolioInsideHouseholdMonitoringFlows = {
  "name": "POLIO_INSIDE_HOUSEHOLD_MONITORING",
  "initialPage": "insideHouseholdEntry",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ══════════════════════════════════════════════════════════════════════
    // Flow 1: insideHouseholdEntry (FORM) — 3 pages
    // ══════════════════════════════════════════════════════════════════════
    {
      "screenType": "FORM",
      "name": "insideHouseholdEntry",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "includeSummary": true,
      "pages": [
        // ── Page 1: First Household Location ──
        {
          "page": "firstHouseholdLocation",
          "label": "IHM_FIRST_HOUSEHOLD_LOCATION_LABEL",
          "order": 1,
          "type": "object",
          "description": "IHM_FIRST_HOUSEHOLD_LOCATION_DESC",
          "actionLabel": "IHM_NEXT",
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
              "errorMessage": "",
              "isMultiSelect": false
            }
          ]
        },

        // ── Page 2: Monitoring Details ──
        {
          "page": "monitoringDetails",
          "label": "IHM_MONITORING_DETAILS_LABEL",
          "order": 2,
          "type": "object",
          "description": "IHM_MONITORING_DETAILS_DESC",
          "actionLabel": "IHM_NEXT",
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
          "navigateTo": {"name": "closeout", "type": "form"},
          "properties": [
            // ── Monitor info ──

            // 1. monitorDesignation
            {
              "type": "string",
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
              "errorMessage": "",
              "isMultiSelect": false,
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
              ]
            },

            // 2. designationOther
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
                    "condition":
                        "monitoringDetails.monitorDesignation=='OTHERS'",
                    "type": "custom"
                  }
                ]
              }
            },

            // 3. monitoringType
            {
              "type": "string",
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
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "IN_PROCESS", "name": "IHM_ENUM_IN_PROCESS"},
                {"code": "END_PROCESS", "name": "IHM_ENUM_END_PROCESS"}
              ]
            },

            // 4. monitoringDate
            {
              "type": "string",
              "label": "IHM_MONITORING_DATE_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
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
              "errorMessage": "",
              "isMultiSelect": false
            },

            // 5. settlementArea
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

            // 6. settlementName
            {
              "type": "string",
              "label": "IHM_SETTLEMENT_NAME_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "settlementName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },

            // 7. settlementType
            {
              "type": "string",
              "label": "IHM_SETTLEMENT_TYPE_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "settlementType",
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
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "URBAN", "name": "IHM_ENUM_URBAN"},
                {"code": "RURAL", "name": "IHM_ENUM_RURAL"},
                {"code": "SLUMS", "name": "IHM_ENUM_SLUMS"},
                {"code": "REFUGEES_IDPS", "name": "IHM_ENUM_REFUGEES_IDPS"},
                {"code": "HARD_TO_REACH", "name": "IHM_ENUM_HARD_TO_REACH"},
                {"code": "NOMADS", "name": "IHM_ENUM_NOMADS"},
                {
                  "code": "SECURITY_COMPROMISED",
                  "name": "IHM_ENUM_SECURITY_COMPROMISED"
                },
                {"code": "IMMIGRANTS", "name": "IHM_ENUM_IMMIGRANTS"},
                {"code": "CROSS_BORDER", "name": "IHM_ENUM_CROSS_BORDER"}
              ]
            },

            // 8. monitorName
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
              "errorMessage": "",
              "isMultiSelect": false,
              "autoFillCondition": [
                {
                  "value": "{{loggedInUserName}}",
                  "expression": "true==true"
                }
              ]
            },

            // 9. monitorPhone
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

            // ── Household-level questions (A through P) ──

            // A. teamVisited
            {
              "type": "string",
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
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "IHM_ENUM_YES"},
                {"code": "NO", "name": "IHM_ENUM_NO"}
              ]
            },

            // B. houseMarked
            {
              "type": "string",
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
              "enums": [
                {"code": "YES", "name": "IHM_ENUM_YES"},
                {"code": "NO", "name": "IHM_ENUM_NO"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "monitoringDetails.teamVisited=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },

            // C. childrenPresent
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
                  "type": "required",
                  "value": true,
                  "message": "IHM_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "IHM_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },

            // D. childrenVaccinated
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
                  "type": "required",
                  "value": true,
                  "message": "IHM_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "IHM_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },

            // E. vaccinationLocation
            {
              "type": "string",
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
              "isMultiSelect": false,
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
              ]
            },

            // F. missedAbsent
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
              "errorMessage": "",
              "isMultiSelect": false
            },

            // G. missedRefusal
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
              "errorMessage": "",
              "isMultiSelect": false
            },

            // H. missedNotVisited
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
              "errorMessage": "",
              "isMultiSelect": false
            },

            // I. missedNotRevisited
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
              "errorMessage": "",
              "isMultiSelect": false
            },

            // J. missedAsleep
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
              "errorMessage": "",
              "isMultiSelect": false
            },

            // K. missedRoutine
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
              "errorMessage": "",
              "isMultiSelect": false
            },

            // L. missedOther
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
              "errorMessage": "",
              "isMultiSelect": false
            },

            // M. caregiverInformed
            {
              "type": "string",
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
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "IHM_ENUM_YES"},
                {"code": "NO", "name": "IHM_ENUM_NO"}
              ]
            },

            // N. campaignInfoSource (multi-select)
            {
              "type": "string",
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
              "visibilityCondition": {
                "expression": [
                  {
                    "condition":
                        "monitoringDetails.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },

            // O. infoSourceOther
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
                    "condition":
                        "monitoringDetails.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },

            // P. afpLimbWeakness
            {
              "type": "string",
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
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "IHM_ENUM_YES"},
                {"code": "NO", "name": "IHM_ENUM_NO"}
              ]
            },

            // afpSuddenWeakness (number of AFP cases)
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
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition":
                        "monitoringDetails.afpLimbWeakness=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },

            // ── Caregiver details ──

            // caregiverName
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
              "errorMessage": "",
              "isMultiSelect": false
            },

            // caregiverPhone
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
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ]
        },

        // ── Page 3: Closeout (Last Household Location + Final observations) ──
        {
          "page": "closeout",
          "label": "IHM_CLOSEOUT_LABEL",
          "order": 3,
          "type": "object",
          "description": "IHM_CLOSEOUT_DESC",
          "actionLabel": "IHM_SUBMIT",
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
          "properties": [
            // 1. gpsLastHousehold
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

            // 2. poorlyCoveredAreas
            {
              "type": "string",
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
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "IHM_ENUM_YES"},
                {"code": "NO", "name": "IHM_ENUM_NO"}
              ]
            },

            // 3. finalComments
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
              "errorMessage": "",
              "isMultiSelect": false
            }
          ]
        }
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
                "properties": {"message": "IHM_ERROR_FETCH_CONFIG"}
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
      ]
    },

    // ══════════════════════════════════════════════════════════════════════
    // Flow 2: insideMonitoringSummary (TEMPLATE) — Summary of recorded data
    // ══════════════════════════════════════════════════════════════════════
    {
      "screenType": "TEMPLATE",
      "name": "insideMonitoringSummary",
      "order": 2,
      "canPop": false,
      "heading": "IHM_SUMMARY_HEADING",
      "description": "IHM_SUMMARY_DESCRIPTION",
      "header": [],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "clientReferenceId",
                "value": "{{navigation.SessionClientReferenceId}}",
                "operation": "equals",
                "root": "userAction"
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
            "field": "additionalFields.form",
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
      },
      "body": [
        // ── Summary card with labelPairList ──
        {
          "type": "template",
          "format": "card",
          "fieldName": "summaryCard",
          "properties": {"type": "primary"},
          "children": [
            {
              "type": "template",
              "format": "labelPairList",
              "fieldName": "sessionSummary",
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
                  "key": "IHM_SUMMARY_SETTLEMENT_TYPE",
                  "value":
                      "{{contextData.0.session.UserActionModel.additionalFields.fields.settlementType}}",
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
              ]
            }
          ]
        }
      ],
      "footer": [
        {
          "type": "template",
          "format": "button",
          "label": "IHM_ADD_ANOTHER_SESSION",
          "fieldName": "addAnotherSession",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "insideHouseholdEntry"
              }
            }
          ],
          "properties": {
            "size": "large",
            "type": "secondary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        },
        {
          "type": "template",
          "format": "button",
          "label": "IHM_BACK_TO_HOME",
          "fieldName": "backToHome",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "HOME", "type": "HOME"}
            }
          ],
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        }
      ]
    }
  ]
};
