final dynamic samplePolioLqaDataCollectionFlows = {
  "name": "LQA",
  "initialPage": "lqaDataEntry",
  "project": "POLIO",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
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
        {
          "page": "clusterInfo",
          "label": "LQA_CLUSTER_INFO_LABEL",
          "order": 1,
          "type": "object",
          "description": "LQA_CLUSTER_INFO_DESCRIPTION",
          "actionLabel": "LQA_ACTION_NEXT",
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
          "navigateTo": {"name": "child1", "type": "form"},
          "properties": [
            {
              "type": "string",
              "label": "LQA_SURVEY_DATE_LABEL",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "surveyDate",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_SURVEY_DATE_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_SETTLEMENT_AREA_LABEL",
              "order": 2,
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
              "label": "LQA_HEALTH_FACILITY_AREA_LABEL",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "healthFacilityArea",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_LOT_NUMBER_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "lotNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_LOT_NUMBER_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_CLUSTER_NUMBER_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "clusterNumber",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_CLUSTER_NUMBER_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "1", "name": "LQA_ENUM_CLUSTER_1"},
                {"code": "2", "name": "LQA_ENUM_CLUSTER_2"},
                {"code": "3", "name": "LQA_ENUM_CLUSTER_3"},
                {"code": "4", "name": "LQA_ENUM_CLUSTER_4"},
                {"code": "5", "name": "LQA_ENUM_CLUSTER_5"},
                {"code": "6", "name": "LQA_ENUM_CLUSTER_6"}
              ]
            },
            {
              "type": "integer",
              "label": "LQA_NUMBER_OF_INTERVIEWS_LABEL",
              "order": 6,
              "value": "5",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_NUMBER_OF_INTERVIEWS_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "numberOfInterviews",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 1,
                  "message": "LQA_VALIDATION_MIN_1_INTERVIEW"
                },
                {
                  "type": "max",
                  "value": 10,
                  "message": "LQA_VALIDATION_MAX_10_INTERVIEWS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_SURVEYOR_NAME_LABEL",
              "order": 7,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_SURVEYOR_NAME_HELPTEXT",
              "infoText": "",
              "readOnly": true,
              "fieldName": "surveyorName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_SURVEYOR_NAME_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "autoFillCondition": [
                {"value": "{{loggedInUserName}}", "expression": "true==true"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_SURVEYOR_PHONE_LABEL",
              "order": 8,
              "value": "",
              "format": "phone",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_SURVEYOR_PHONE_HELPTEXT",
              "infoText": "",
              "readOnly": true,
              "fieldName": "surveyorPhone",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_PHONE_REQUIRED"
                }
              ],
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
              "label": "LQA_COORDINATOR_NAME_LABEL",
              "order": 9,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "lqasCoordinatorName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_COORDINATOR_NAME_REQUIRED"
                },
                {
                  "type": "minLength",
                  "value": 2,
                  "message": "LQA_VALIDATION_NAME_MIN_2_CHARS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_STARTING_VILLAGE_LABEL",
              "order": 10,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "startingVillage",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_STARTING_VILLAGE_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_SETTLEMENT_TYPE_LABEL",
              "order": 11,
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
                  "message": "LQA_VALIDATION_SETTLEMENT_TYPE_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "URBAN", "name": "LQA_ENUM_URBAN"},
                {"code": "RURAL", "name": "LQA_ENUM_RURAL"},
                {"code": "SLUMS", "name": "LQA_ENUM_SLUMS"},
                {"code": "REFUGEES_IDPS", "name": "LQA_ENUM_REFUGEES_IDPS"},
                {"code": "HARD_TO_REACH", "name": "LQA_ENUM_HARD_TO_REACH"},
                {
                  "code": "NOMADS_PASTORALISTS",
                  "name": "LQA_ENUM_NOMADS_PASTORALISTS"
                },
                {
                  "code": "SECURITY_COMPROMISED",
                  "name": "LQA_ENUM_SECURITY_COMPROMISED"
                },
                {"code": "IMMIGRANTS", "name": "LQA_ENUM_IMMIGRANTS"},
                {"code": "CROSS_BORDER", "name": "LQA_ENUM_CROSS_BORDER"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_SETTLEMENT_SMALL_LABEL",
              "order": 12,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "settlementSmall",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_GPS_START_LABEL",
              "order": 13,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_GPS_START_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gpsStart",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_GPS_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ]
        },
        {
          "page": "child1",
          "label": "LQA_CHILD_PAGE_LABEL",
          "order": 2,
          "type": "object",
          "description": "LQA_CHILD_PAGE_DESCRIPTION",
          "actionLabel": "LQA_ACTION_NEXT",
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
          "navigateTo": {"name": "child2", "type": "form"},
          "conditionalNavigateTo": [
            {
              "type": "custom",
              "condition": "clusterInfo.numberOfInterviews=='1'",
              "navigateTo": {"name": "closeout", "type": "form"}
            }
          ],
          "properties": [
            {
              "type": "integer",
              "label": "LQA_CHILDREN_UNDER_5_LABEL",
              "order": 1,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_CHILDREN_UNDER_5_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenUnder5",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "integer",
              "label": "LQA_CHILD_AGE_MONTHS_LABEL",
              "order": 2,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childAgeMonths",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                },
                {
                  "type": "max",
                  "value": 59,
                  "message": "LQA_VALIDATION_MAX_59_MONTHS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_CHILD_SEX_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childSex",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "MALE", "name": "LQA_ENUM_MALE"},
                {"code": "FEMALE", "name": "LQA_ENUM_FEMALE"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_FINGER_MARKED_LABEL",
              "order": 4,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "fingerMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_REASON_NOT_MARKED_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "CHILD_ABSENT", "name": "LQA_ENUM_CHILD_ABSENT"},
                {"code": "NON_COMPLIANCE", "name": "LQA_ENUM_NON_COMPLIANCE"},
                {
                  "code": "HOUSE_NOT_VISITED",
                  "name": "LQA_ENUM_HOUSE_NOT_VISITED"
                },
                {
                  "code": "VACCINATED_NOT_MARKED",
                  "name": "LQA_ENUM_VACCINATED_NOT_MARKED"
                },
                {"code": "CHILD_ASLEEP", "name": "LQA_ENUM_CHILD_ASLEEP"},
                {"code": "CHILD_VISITOR", "name": "LQA_ENUM_CHILD_VISITOR"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {"condition": "child1.fingerMarked=='NO'", "type": "custom"}
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REASON_SPECIFY_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarkedOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child1.reasonNotMarked=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_REFUSAL_REASON_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {
                  "code": "RELIGIOUS_CULTURAL",
                  "name": "LQA_ENUM_RELIGIOUS_CULTURAL"
                },
                {
                  "code": "VACCINE_NOT_SAFE",
                  "name": "LQA_ENUM_VACCINE_NOT_SAFE"
                },
                {"code": "NO_FELT_NEED", "name": "LQA_ENUM_NO_FELT_NEED"},
                {"code": "TOO_MANY_ROUNDS", "name": "LQA_ENUM_TOO_MANY_ROUNDS"},
                {
                  "code": "NO_CAREGIVER_CONSENT",
                  "name": "LQA_ENUM_NO_CAREGIVER_CONSENT"
                },
                {"code": "CHILD_SICK", "name": "LQA_ENUM_CHILD_SICK"},
                {"code": "COVID_RELATED", "name": "LQA_ENUM_COVID_RELATED"},
                {
                  "code": "AFRICA_POLIO_FREE",
                  "name": "LQA_ENUM_AFRICA_POLIO_FREE"
                },
                {"code": "NOPV_CONCERNS", "name": "LQA_ENUM_NOPV_CONCERNS"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child1.reasonNotMarked=='NON_COMPLIANCE'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REFUSAL_REASON_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child1.refusalReason=='OTHERS'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_ABSENCE_REASON_LABEL",
              "order": 9,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "AT_FARM", "name": "LQA_ENUM_AT_FARM"},
                {"code": "IN_MARKET", "name": "LQA_ENUM_IN_MARKET"},
                {"code": "AT_SCHOOL", "name": "LQA_ENUM_AT_SCHOOL"},
                {"code": "IN_PLAYGROUND", "name": "LQA_ENUM_IN_PLAYGROUND"},
                {"code": "TRAVELLED", "name": "LQA_ENUM_TRAVELLED"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child1.reasonNotMarked=='CHILD_ABSENT'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_ABSENCE_REASON_LABEL",
              "order": 10,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child1.absenceReason=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_CAREGIVER_INFORMED_LABEL",
              "order": 11,
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
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_CAMPAIGN_AWARENESS_LABEL",
              "order": 12,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "TV", "name": "LQA_ENUM_TV"},
                {"code": "RADIO", "name": "LQA_ENUM_RADIO"},
                {"code": "MOB_VAN", "name": "LQA_ENUM_MOB_VAN"},
                {"code": "HEALTH_WORKER", "name": "LQA_ENUM_HEALTH_WORKER"},
                {"code": "VOLUNTEER_CHW", "name": "LQA_ENUM_VOLUNTEER_CHW"},
                {
                  "code": "RELIGIOUS_LEADER",
                  "name": "LQA_ENUM_RELIGIOUS_LEADER"
                },
                {
                  "code": "COMMUNITY_LEADER",
                  "name": "LQA_ENUM_COMMUNITY_LEADER"
                },
                {"code": "SOCIAL_MEDIA", "name": "LQA_ENUM_SOCIAL_MEDIA"},
                {"code": "SCHOOL", "name": "LQA_ENUM_SCHOOL"},
                {"code": "IEC_MATERIALS", "name": "LQA_ENUM_IEC_MATERIALS"},
                {
                  "code": "SOCIAL_MOBILIZER",
                  "name": "LQA_ENUM_SOCIAL_MOBILIZER"
                },
                {"code": "NEIGHBOUR", "name": "LQA_ENUM_NEIGHBOUR"},
                {"code": "NEWSPAPER", "name": "LQA_ENUM_NEWSPAPER"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child1.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_AWARENESS_OTHER_LABEL",
              "order": 13,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "awarenessOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child1.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "LQA_OPV_DOSES_LABEL",
              "order": 14,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "opvDosesFromBirth",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_AFP_AWARENESS_LABEL",
              "order": 15,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "integer",
              "label": "LQA_AFP_CASE_COUNT_LABEL",
              "order": 16,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpCaseCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true,
              "visibilityCondition": {
                "expression": [
                  {"condition": "child1.afpAwareness=='YES'", "type": "custom"}
                ]
              }
            }
          ]
        },
        {
          "page": "child2",
          "label": "LQA_CHILD_PAGE_LABEL",
          "order": 3,
          "type": "object",
          "description": "LQA_CHILD_PAGE_DESCRIPTION",
          "actionLabel": "LQA_ACTION_NEXT",
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
          "navigateTo": {"name": "child3", "type": "form"},
          "conditionalNavigateTo": [
            {
              "type": "custom",
              "condition": "clusterInfo.numberOfInterviews=='2'",
              "navigateTo": {"name": "closeout", "type": "form"}
            }
          ],
          "properties": [
            {
              "type": "integer",
              "label": "LQA_CHILDREN_UNDER_5_LABEL",
              "order": 1,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_CHILDREN_UNDER_5_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenUnder5",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "integer",
              "label": "LQA_CHILD_AGE_MONTHS_LABEL",
              "order": 2,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childAgeMonths",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                },
                {
                  "type": "max",
                  "value": 59,
                  "message": "LQA_VALIDATION_MAX_59_MONTHS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_CHILD_SEX_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childSex",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "MALE", "name": "LQA_ENUM_MALE"},
                {"code": "FEMALE", "name": "LQA_ENUM_FEMALE"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_FINGER_MARKED_LABEL",
              "order": 4,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "fingerMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_REASON_NOT_MARKED_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "CHILD_ABSENT", "name": "LQA_ENUM_CHILD_ABSENT"},
                {"code": "NON_COMPLIANCE", "name": "LQA_ENUM_NON_COMPLIANCE"},
                {
                  "code": "HOUSE_NOT_VISITED",
                  "name": "LQA_ENUM_HOUSE_NOT_VISITED"
                },
                {
                  "code": "VACCINATED_NOT_MARKED",
                  "name": "LQA_ENUM_VACCINATED_NOT_MARKED"
                },
                {"code": "CHILD_ASLEEP", "name": "LQA_ENUM_CHILD_ASLEEP"},
                {"code": "CHILD_VISITOR", "name": "LQA_ENUM_CHILD_VISITOR"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {"condition": "child2.fingerMarked=='NO'", "type": "custom"}
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REASON_SPECIFY_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarkedOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child2.reasonNotMarked=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_REFUSAL_REASON_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {
                  "code": "RELIGIOUS_CULTURAL",
                  "name": "LQA_ENUM_RELIGIOUS_CULTURAL"
                },
                {
                  "code": "VACCINE_NOT_SAFE",
                  "name": "LQA_ENUM_VACCINE_NOT_SAFE"
                },
                {"code": "NO_FELT_NEED", "name": "LQA_ENUM_NO_FELT_NEED"},
                {"code": "TOO_MANY_ROUNDS", "name": "LQA_ENUM_TOO_MANY_ROUNDS"},
                {
                  "code": "NO_CAREGIVER_CONSENT",
                  "name": "LQA_ENUM_NO_CAREGIVER_CONSENT"
                },
                {"code": "CHILD_SICK", "name": "LQA_ENUM_CHILD_SICK"},
                {"code": "COVID_RELATED", "name": "LQA_ENUM_COVID_RELATED"},
                {
                  "code": "AFRICA_POLIO_FREE",
                  "name": "LQA_ENUM_AFRICA_POLIO_FREE"
                },
                {"code": "NOPV_CONCERNS", "name": "LQA_ENUM_NOPV_CONCERNS"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child2.reasonNotMarked=='NON_COMPLIANCE'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REFUSAL_REASON_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child2.refusalReason=='OTHERS'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_ABSENCE_REASON_LABEL",
              "order": 9,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "AT_FARM", "name": "LQA_ENUM_AT_FARM"},
                {"code": "IN_MARKET", "name": "LQA_ENUM_IN_MARKET"},
                {"code": "AT_SCHOOL", "name": "LQA_ENUM_AT_SCHOOL"},
                {"code": "IN_PLAYGROUND", "name": "LQA_ENUM_IN_PLAYGROUND"},
                {"code": "TRAVELLED", "name": "LQA_ENUM_TRAVELLED"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child2.reasonNotMarked=='CHILD_ABSENT'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_ABSENCE_REASON_LABEL",
              "order": 10,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child2.absenceReason=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_CAREGIVER_INFORMED_LABEL",
              "order": 11,
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
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_CAMPAIGN_AWARENESS_LABEL",
              "order": 12,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "TV", "name": "LQA_ENUM_TV"},
                {"code": "RADIO", "name": "LQA_ENUM_RADIO"},
                {"code": "MOB_VAN", "name": "LQA_ENUM_MOB_VAN"},
                {"code": "HEALTH_WORKER", "name": "LQA_ENUM_HEALTH_WORKER"},
                {"code": "VOLUNTEER_CHW", "name": "LQA_ENUM_VOLUNTEER_CHW"},
                {
                  "code": "RELIGIOUS_LEADER",
                  "name": "LQA_ENUM_RELIGIOUS_LEADER"
                },
                {
                  "code": "COMMUNITY_LEADER",
                  "name": "LQA_ENUM_COMMUNITY_LEADER"
                },
                {"code": "SOCIAL_MEDIA", "name": "LQA_ENUM_SOCIAL_MEDIA"},
                {"code": "SCHOOL", "name": "LQA_ENUM_SCHOOL"},
                {"code": "IEC_MATERIALS", "name": "LQA_ENUM_IEC_MATERIALS"},
                {
                  "code": "SOCIAL_MOBILIZER",
                  "name": "LQA_ENUM_SOCIAL_MOBILIZER"
                },
                {"code": "NEIGHBOUR", "name": "LQA_ENUM_NEIGHBOUR"},
                {"code": "NEWSPAPER", "name": "LQA_ENUM_NEWSPAPER"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child2.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_AWARENESS_OTHER_LABEL",
              "order": 13,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "awarenessOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child2.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "LQA_OPV_DOSES_LABEL",
              "order": 14,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "opvDosesFromBirth",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_AFP_AWARENESS_LABEL",
              "order": 15,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "integer",
              "label": "LQA_AFP_CASE_COUNT_LABEL",
              "order": 16,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpCaseCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true,
              "visibilityCondition": {
                "expression": [
                  {"condition": "child2.afpAwareness=='YES'", "type": "custom"}
                ]
              }
            }
          ]
        },
        {
          "page": "child3",
          "label": "LQA_CHILD_PAGE_LABEL",
          "order": 4,
          "type": "object",
          "description": "LQA_CHILD_PAGE_DESCRIPTION",
          "actionLabel": "LQA_ACTION_NEXT",
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
          "navigateTo": {"name": "child4", "type": "form"},
          "conditionalNavigateTo": [
            {
              "type": "custom",
              "condition": "clusterInfo.numberOfInterviews=='3'",
              "navigateTo": {"name": "closeout", "type": "form"}
            }
          ],
          "properties": [
            {
              "type": "integer",
              "label": "LQA_CHILDREN_UNDER_5_LABEL",
              "order": 1,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_CHILDREN_UNDER_5_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenUnder5",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "integer",
              "label": "LQA_CHILD_AGE_MONTHS_LABEL",
              "order": 2,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childAgeMonths",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                },
                {
                  "type": "max",
                  "value": 59,
                  "message": "LQA_VALIDATION_MAX_59_MONTHS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_CHILD_SEX_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childSex",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "MALE", "name": "LQA_ENUM_MALE"},
                {"code": "FEMALE", "name": "LQA_ENUM_FEMALE"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_FINGER_MARKED_LABEL",
              "order": 4,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "fingerMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_REASON_NOT_MARKED_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "CHILD_ABSENT", "name": "LQA_ENUM_CHILD_ABSENT"},
                {"code": "NON_COMPLIANCE", "name": "LQA_ENUM_NON_COMPLIANCE"},
                {
                  "code": "HOUSE_NOT_VISITED",
                  "name": "LQA_ENUM_HOUSE_NOT_VISITED"
                },
                {
                  "code": "VACCINATED_NOT_MARKED",
                  "name": "LQA_ENUM_VACCINATED_NOT_MARKED"
                },
                {"code": "CHILD_ASLEEP", "name": "LQA_ENUM_CHILD_ASLEEP"},
                {"code": "CHILD_VISITOR", "name": "LQA_ENUM_CHILD_VISITOR"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {"condition": "child3.fingerMarked=='NO'", "type": "custom"}
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REASON_SPECIFY_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarkedOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child3.reasonNotMarked=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_REFUSAL_REASON_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {
                  "code": "RELIGIOUS_CULTURAL",
                  "name": "LQA_ENUM_RELIGIOUS_CULTURAL"
                },
                {
                  "code": "VACCINE_NOT_SAFE",
                  "name": "LQA_ENUM_VACCINE_NOT_SAFE"
                },
                {"code": "NO_FELT_NEED", "name": "LQA_ENUM_NO_FELT_NEED"},
                {"code": "TOO_MANY_ROUNDS", "name": "LQA_ENUM_TOO_MANY_ROUNDS"},
                {
                  "code": "NO_CAREGIVER_CONSENT",
                  "name": "LQA_ENUM_NO_CAREGIVER_CONSENT"
                },
                {"code": "CHILD_SICK", "name": "LQA_ENUM_CHILD_SICK"},
                {"code": "COVID_RELATED", "name": "LQA_ENUM_COVID_RELATED"},
                {
                  "code": "AFRICA_POLIO_FREE",
                  "name": "LQA_ENUM_AFRICA_POLIO_FREE"
                },
                {"code": "NOPV_CONCERNS", "name": "LQA_ENUM_NOPV_CONCERNS"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child3.reasonNotMarked=='NON_COMPLIANCE'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REFUSAL_REASON_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child3.refusalReason=='OTHERS'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_ABSENCE_REASON_LABEL",
              "order": 9,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "AT_FARM", "name": "LQA_ENUM_AT_FARM"},
                {"code": "IN_MARKET", "name": "LQA_ENUM_IN_MARKET"},
                {"code": "AT_SCHOOL", "name": "LQA_ENUM_AT_SCHOOL"},
                {"code": "IN_PLAYGROUND", "name": "LQA_ENUM_IN_PLAYGROUND"},
                {"code": "TRAVELLED", "name": "LQA_ENUM_TRAVELLED"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child3.reasonNotMarked=='CHILD_ABSENT'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_ABSENCE_REASON_LABEL",
              "order": 10,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child3.absenceReason=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_CAREGIVER_INFORMED_LABEL",
              "order": 11,
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
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_CAMPAIGN_AWARENESS_LABEL",
              "order": 12,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "TV", "name": "LQA_ENUM_TV"},
                {"code": "RADIO", "name": "LQA_ENUM_RADIO"},
                {"code": "MOB_VAN", "name": "LQA_ENUM_MOB_VAN"},
                {"code": "HEALTH_WORKER", "name": "LQA_ENUM_HEALTH_WORKER"},
                {"code": "VOLUNTEER_CHW", "name": "LQA_ENUM_VOLUNTEER_CHW"},
                {
                  "code": "RELIGIOUS_LEADER",
                  "name": "LQA_ENUM_RELIGIOUS_LEADER"
                },
                {
                  "code": "COMMUNITY_LEADER",
                  "name": "LQA_ENUM_COMMUNITY_LEADER"
                },
                {"code": "SOCIAL_MEDIA", "name": "LQA_ENUM_SOCIAL_MEDIA"},
                {"code": "SCHOOL", "name": "LQA_ENUM_SCHOOL"},
                {"code": "IEC_MATERIALS", "name": "LQA_ENUM_IEC_MATERIALS"},
                {
                  "code": "SOCIAL_MOBILIZER",
                  "name": "LQA_ENUM_SOCIAL_MOBILIZER"
                },
                {"code": "NEIGHBOUR", "name": "LQA_ENUM_NEIGHBOUR"},
                {"code": "NEWSPAPER", "name": "LQA_ENUM_NEWSPAPER"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child3.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_AWARENESS_OTHER_LABEL",
              "order": 13,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "awarenessOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child3.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "LQA_OPV_DOSES_LABEL",
              "order": 14,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "opvDosesFromBirth",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_AFP_AWARENESS_LABEL",
              "order": 15,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "integer",
              "label": "LQA_AFP_CASE_COUNT_LABEL",
              "order": 16,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpCaseCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true,
              "visibilityCondition": {
                "expression": [
                  {"condition": "child3.afpAwareness=='YES'", "type": "custom"}
                ]
              }
            }
          ]
        },
        {
          "page": "child4",
          "label": "LQA_CHILD_PAGE_LABEL",
          "order": 5,
          "type": "object",
          "description": "LQA_CHILD_PAGE_DESCRIPTION",
          "actionLabel": "LQA_ACTION_NEXT",
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
          "navigateTo": {"name": "child5", "type": "form"},
          "conditionalNavigateTo": [
            {
              "type": "custom",
              "condition": "clusterInfo.numberOfInterviews=='4'",
              "navigateTo": {"name": "closeout", "type": "form"}
            }
          ],
          "properties": [
            {
              "type": "integer",
              "label": "LQA_CHILDREN_UNDER_5_LABEL",
              "order": 1,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_CHILDREN_UNDER_5_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenUnder5",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "integer",
              "label": "LQA_CHILD_AGE_MONTHS_LABEL",
              "order": 2,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childAgeMonths",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                },
                {
                  "type": "max",
                  "value": 59,
                  "message": "LQA_VALIDATION_MAX_59_MONTHS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_CHILD_SEX_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childSex",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "MALE", "name": "LQA_ENUM_MALE"},
                {"code": "FEMALE", "name": "LQA_ENUM_FEMALE"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_FINGER_MARKED_LABEL",
              "order": 4,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "fingerMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_REASON_NOT_MARKED_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "CHILD_ABSENT", "name": "LQA_ENUM_CHILD_ABSENT"},
                {"code": "NON_COMPLIANCE", "name": "LQA_ENUM_NON_COMPLIANCE"},
                {
                  "code": "HOUSE_NOT_VISITED",
                  "name": "LQA_ENUM_HOUSE_NOT_VISITED"
                },
                {
                  "code": "VACCINATED_NOT_MARKED",
                  "name": "LQA_ENUM_VACCINATED_NOT_MARKED"
                },
                {"code": "CHILD_ASLEEP", "name": "LQA_ENUM_CHILD_ASLEEP"},
                {"code": "CHILD_VISITOR", "name": "LQA_ENUM_CHILD_VISITOR"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {"condition": "child4.fingerMarked=='NO'", "type": "custom"}
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REASON_SPECIFY_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarkedOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child4.reasonNotMarked=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_REFUSAL_REASON_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {
                  "code": "RELIGIOUS_CULTURAL",
                  "name": "LQA_ENUM_RELIGIOUS_CULTURAL"
                },
                {
                  "code": "VACCINE_NOT_SAFE",
                  "name": "LQA_ENUM_VACCINE_NOT_SAFE"
                },
                {"code": "NO_FELT_NEED", "name": "LQA_ENUM_NO_FELT_NEED"},
                {"code": "TOO_MANY_ROUNDS", "name": "LQA_ENUM_TOO_MANY_ROUNDS"},
                {
                  "code": "NO_CAREGIVER_CONSENT",
                  "name": "LQA_ENUM_NO_CAREGIVER_CONSENT"
                },
                {"code": "CHILD_SICK", "name": "LQA_ENUM_CHILD_SICK"},
                {"code": "COVID_RELATED", "name": "LQA_ENUM_COVID_RELATED"},
                {
                  "code": "AFRICA_POLIO_FREE",
                  "name": "LQA_ENUM_AFRICA_POLIO_FREE"
                },
                {"code": "NOPV_CONCERNS", "name": "LQA_ENUM_NOPV_CONCERNS"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child4.reasonNotMarked=='NON_COMPLIANCE'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REFUSAL_REASON_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child4.refusalReason=='OTHERS'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_ABSENCE_REASON_LABEL",
              "order": 9,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "AT_FARM", "name": "LQA_ENUM_AT_FARM"},
                {"code": "IN_MARKET", "name": "LQA_ENUM_IN_MARKET"},
                {"code": "AT_SCHOOL", "name": "LQA_ENUM_AT_SCHOOL"},
                {"code": "IN_PLAYGROUND", "name": "LQA_ENUM_IN_PLAYGROUND"},
                {"code": "TRAVELLED", "name": "LQA_ENUM_TRAVELLED"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child4.reasonNotMarked=='CHILD_ABSENT'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_ABSENCE_REASON_LABEL",
              "order": 10,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child4.absenceReason=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_CAREGIVER_INFORMED_LABEL",
              "order": 11,
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
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_CAMPAIGN_AWARENESS_LABEL",
              "order": 12,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "TV", "name": "LQA_ENUM_TV"},
                {"code": "RADIO", "name": "LQA_ENUM_RADIO"},
                {"code": "MOB_VAN", "name": "LQA_ENUM_MOB_VAN"},
                {"code": "HEALTH_WORKER", "name": "LQA_ENUM_HEALTH_WORKER"},
                {"code": "VOLUNTEER_CHW", "name": "LQA_ENUM_VOLUNTEER_CHW"},
                {
                  "code": "RELIGIOUS_LEADER",
                  "name": "LQA_ENUM_RELIGIOUS_LEADER"
                },
                {
                  "code": "COMMUNITY_LEADER",
                  "name": "LQA_ENUM_COMMUNITY_LEADER"
                },
                {"code": "SOCIAL_MEDIA", "name": "LQA_ENUM_SOCIAL_MEDIA"},
                {"code": "SCHOOL", "name": "LQA_ENUM_SCHOOL"},
                {"code": "IEC_MATERIALS", "name": "LQA_ENUM_IEC_MATERIALS"},
                {
                  "code": "SOCIAL_MOBILIZER",
                  "name": "LQA_ENUM_SOCIAL_MOBILIZER"
                },
                {"code": "NEIGHBOUR", "name": "LQA_ENUM_NEIGHBOUR"},
                {"code": "NEWSPAPER", "name": "LQA_ENUM_NEWSPAPER"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child4.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_AWARENESS_OTHER_LABEL",
              "order": 13,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "awarenessOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child4.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "LQA_OPV_DOSES_LABEL",
              "order": 14,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "opvDosesFromBirth",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_AFP_AWARENESS_LABEL",
              "order": 15,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "integer",
              "label": "LQA_AFP_CASE_COUNT_LABEL",
              "order": 16,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpCaseCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true,
              "visibilityCondition": {
                "expression": [
                  {"condition": "child4.afpAwareness=='YES'", "type": "custom"}
                ]
              }
            }
          ]
        },
        {
          "page": "child5",
          "label": "LQA_CHILD_PAGE_LABEL",
          "order": 6,
          "type": "object",
          "description": "LQA_CHILD_PAGE_DESCRIPTION",
          "actionLabel": "LQA_ACTION_NEXT",
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
          "navigateTo": {"name": "child6", "type": "form"},
          "conditionalNavigateTo": [
            {
              "type": "custom",
              "condition": "clusterInfo.numberOfInterviews=='5'",
              "navigateTo": {"name": "closeout", "type": "form"}
            }
          ],
          "properties": [
            {
              "type": "integer",
              "label": "LQA_CHILDREN_UNDER_5_LABEL",
              "order": 1,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_CHILDREN_UNDER_5_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenUnder5",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "integer",
              "label": "LQA_CHILD_AGE_MONTHS_LABEL",
              "order": 2,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childAgeMonths",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                },
                {
                  "type": "max",
                  "value": 59,
                  "message": "LQA_VALIDATION_MAX_59_MONTHS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_CHILD_SEX_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childSex",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "MALE", "name": "LQA_ENUM_MALE"},
                {"code": "FEMALE", "name": "LQA_ENUM_FEMALE"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_FINGER_MARKED_LABEL",
              "order": 4,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "fingerMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_REASON_NOT_MARKED_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "CHILD_ABSENT", "name": "LQA_ENUM_CHILD_ABSENT"},
                {"code": "NON_COMPLIANCE", "name": "LQA_ENUM_NON_COMPLIANCE"},
                {
                  "code": "HOUSE_NOT_VISITED",
                  "name": "LQA_ENUM_HOUSE_NOT_VISITED"
                },
                {
                  "code": "VACCINATED_NOT_MARKED",
                  "name": "LQA_ENUM_VACCINATED_NOT_MARKED"
                },
                {"code": "CHILD_ASLEEP", "name": "LQA_ENUM_CHILD_ASLEEP"},
                {"code": "CHILD_VISITOR", "name": "LQA_ENUM_CHILD_VISITOR"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {"condition": "child5.fingerMarked=='NO'", "type": "custom"}
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REASON_SPECIFY_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarkedOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child5.reasonNotMarked=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_REFUSAL_REASON_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {
                  "code": "RELIGIOUS_CULTURAL",
                  "name": "LQA_ENUM_RELIGIOUS_CULTURAL"
                },
                {
                  "code": "VACCINE_NOT_SAFE",
                  "name": "LQA_ENUM_VACCINE_NOT_SAFE"
                },
                {"code": "NO_FELT_NEED", "name": "LQA_ENUM_NO_FELT_NEED"},
                {"code": "TOO_MANY_ROUNDS", "name": "LQA_ENUM_TOO_MANY_ROUNDS"},
                {
                  "code": "NO_CAREGIVER_CONSENT",
                  "name": "LQA_ENUM_NO_CAREGIVER_CONSENT"
                },
                {"code": "CHILD_SICK", "name": "LQA_ENUM_CHILD_SICK"},
                {"code": "COVID_RELATED", "name": "LQA_ENUM_COVID_RELATED"},
                {
                  "code": "AFRICA_POLIO_FREE",
                  "name": "LQA_ENUM_AFRICA_POLIO_FREE"
                },
                {"code": "NOPV_CONCERNS", "name": "LQA_ENUM_NOPV_CONCERNS"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child5.reasonNotMarked=='NON_COMPLIANCE'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REFUSAL_REASON_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child5.refusalReason=='OTHERS'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_ABSENCE_REASON_LABEL",
              "order": 9,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "AT_FARM", "name": "LQA_ENUM_AT_FARM"},
                {"code": "IN_MARKET", "name": "LQA_ENUM_IN_MARKET"},
                {"code": "AT_SCHOOL", "name": "LQA_ENUM_AT_SCHOOL"},
                {"code": "IN_PLAYGROUND", "name": "LQA_ENUM_IN_PLAYGROUND"},
                {"code": "TRAVELLED", "name": "LQA_ENUM_TRAVELLED"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child5.reasonNotMarked=='CHILD_ABSENT'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_ABSENCE_REASON_LABEL",
              "order": 10,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child5.absenceReason=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_CAREGIVER_INFORMED_LABEL",
              "order": 11,
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
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_CAMPAIGN_AWARENESS_LABEL",
              "order": 12,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "TV", "name": "LQA_ENUM_TV"},
                {"code": "RADIO", "name": "LQA_ENUM_RADIO"},
                {"code": "MOB_VAN", "name": "LQA_ENUM_MOB_VAN"},
                {"code": "HEALTH_WORKER", "name": "LQA_ENUM_HEALTH_WORKER"},
                {"code": "VOLUNTEER_CHW", "name": "LQA_ENUM_VOLUNTEER_CHW"},
                {
                  "code": "RELIGIOUS_LEADER",
                  "name": "LQA_ENUM_RELIGIOUS_LEADER"
                },
                {
                  "code": "COMMUNITY_LEADER",
                  "name": "LQA_ENUM_COMMUNITY_LEADER"
                },
                {"code": "SOCIAL_MEDIA", "name": "LQA_ENUM_SOCIAL_MEDIA"},
                {"code": "SCHOOL", "name": "LQA_ENUM_SCHOOL"},
                {"code": "IEC_MATERIALS", "name": "LQA_ENUM_IEC_MATERIALS"},
                {
                  "code": "SOCIAL_MOBILIZER",
                  "name": "LQA_ENUM_SOCIAL_MOBILIZER"
                },
                {"code": "NEIGHBOUR", "name": "LQA_ENUM_NEIGHBOUR"},
                {"code": "NEWSPAPER", "name": "LQA_ENUM_NEWSPAPER"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child5.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_AWARENESS_OTHER_LABEL",
              "order": 13,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "awarenessOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child5.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "LQA_OPV_DOSES_LABEL",
              "order": 14,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "opvDosesFromBirth",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_AFP_AWARENESS_LABEL",
              "order": 15,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "integer",
              "label": "LQA_AFP_CASE_COUNT_LABEL",
              "order": 16,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpCaseCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true,
              "visibilityCondition": {
                "expression": [
                  {"condition": "child5.afpAwareness=='YES'", "type": "custom"}
                ]
              }
            }
          ]
        },
        {
          "page": "child6",
          "label": "LQA_CHILD_PAGE_LABEL",
          "order": 7,
          "type": "object",
          "description": "LQA_CHILD_PAGE_DESCRIPTION",
          "actionLabel": "LQA_ACTION_NEXT",
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
          "navigateTo": {"name": "child7", "type": "form"},
          "conditionalNavigateTo": [
            {
              "type": "custom",
              "condition": "clusterInfo.numberOfInterviews=='6'",
              "navigateTo": {"name": "closeout", "type": "form"}
            }
          ],
          "properties": [
            {
              "type": "integer",
              "label": "LQA_CHILDREN_UNDER_5_LABEL",
              "order": 1,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_CHILDREN_UNDER_5_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenUnder5",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "integer",
              "label": "LQA_CHILD_AGE_MONTHS_LABEL",
              "order": 2,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childAgeMonths",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                },
                {
                  "type": "max",
                  "value": 59,
                  "message": "LQA_VALIDATION_MAX_59_MONTHS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_CHILD_SEX_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childSex",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "MALE", "name": "LQA_ENUM_MALE"},
                {"code": "FEMALE", "name": "LQA_ENUM_FEMALE"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_FINGER_MARKED_LABEL",
              "order": 4,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "fingerMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_REASON_NOT_MARKED_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "CHILD_ABSENT", "name": "LQA_ENUM_CHILD_ABSENT"},
                {"code": "NON_COMPLIANCE", "name": "LQA_ENUM_NON_COMPLIANCE"},
                {
                  "code": "HOUSE_NOT_VISITED",
                  "name": "LQA_ENUM_HOUSE_NOT_VISITED"
                },
                {
                  "code": "VACCINATED_NOT_MARKED",
                  "name": "LQA_ENUM_VACCINATED_NOT_MARKED"
                },
                {"code": "CHILD_ASLEEP", "name": "LQA_ENUM_CHILD_ASLEEP"},
                {"code": "CHILD_VISITOR", "name": "LQA_ENUM_CHILD_VISITOR"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {"condition": "child6.fingerMarked=='NO'", "type": "custom"}
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REASON_SPECIFY_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarkedOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child6.reasonNotMarked=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_REFUSAL_REASON_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {
                  "code": "RELIGIOUS_CULTURAL",
                  "name": "LQA_ENUM_RELIGIOUS_CULTURAL"
                },
                {
                  "code": "VACCINE_NOT_SAFE",
                  "name": "LQA_ENUM_VACCINE_NOT_SAFE"
                },
                {"code": "NO_FELT_NEED", "name": "LQA_ENUM_NO_FELT_NEED"},
                {"code": "TOO_MANY_ROUNDS", "name": "LQA_ENUM_TOO_MANY_ROUNDS"},
                {
                  "code": "NO_CAREGIVER_CONSENT",
                  "name": "LQA_ENUM_NO_CAREGIVER_CONSENT"
                },
                {"code": "CHILD_SICK", "name": "LQA_ENUM_CHILD_SICK"},
                {"code": "COVID_RELATED", "name": "LQA_ENUM_COVID_RELATED"},
                {
                  "code": "AFRICA_POLIO_FREE",
                  "name": "LQA_ENUM_AFRICA_POLIO_FREE"
                },
                {"code": "NOPV_CONCERNS", "name": "LQA_ENUM_NOPV_CONCERNS"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child6.reasonNotMarked=='NON_COMPLIANCE'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REFUSAL_REASON_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child6.refusalReason=='OTHERS'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_ABSENCE_REASON_LABEL",
              "order": 9,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "AT_FARM", "name": "LQA_ENUM_AT_FARM"},
                {"code": "IN_MARKET", "name": "LQA_ENUM_IN_MARKET"},
                {"code": "AT_SCHOOL", "name": "LQA_ENUM_AT_SCHOOL"},
                {"code": "IN_PLAYGROUND", "name": "LQA_ENUM_IN_PLAYGROUND"},
                {"code": "TRAVELLED", "name": "LQA_ENUM_TRAVELLED"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child6.reasonNotMarked=='CHILD_ABSENT'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_ABSENCE_REASON_LABEL",
              "order": 10,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child6.absenceReason=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_CAREGIVER_INFORMED_LABEL",
              "order": 11,
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
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_CAMPAIGN_AWARENESS_LABEL",
              "order": 12,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "TV", "name": "LQA_ENUM_TV"},
                {"code": "RADIO", "name": "LQA_ENUM_RADIO"},
                {"code": "MOB_VAN", "name": "LQA_ENUM_MOB_VAN"},
                {"code": "HEALTH_WORKER", "name": "LQA_ENUM_HEALTH_WORKER"},
                {"code": "VOLUNTEER_CHW", "name": "LQA_ENUM_VOLUNTEER_CHW"},
                {
                  "code": "RELIGIOUS_LEADER",
                  "name": "LQA_ENUM_RELIGIOUS_LEADER"
                },
                {
                  "code": "COMMUNITY_LEADER",
                  "name": "LQA_ENUM_COMMUNITY_LEADER"
                },
                {"code": "SOCIAL_MEDIA", "name": "LQA_ENUM_SOCIAL_MEDIA"},
                {"code": "SCHOOL", "name": "LQA_ENUM_SCHOOL"},
                {"code": "IEC_MATERIALS", "name": "LQA_ENUM_IEC_MATERIALS"},
                {
                  "code": "SOCIAL_MOBILIZER",
                  "name": "LQA_ENUM_SOCIAL_MOBILIZER"
                },
                {"code": "NEIGHBOUR", "name": "LQA_ENUM_NEIGHBOUR"},
                {"code": "NEWSPAPER", "name": "LQA_ENUM_NEWSPAPER"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child6.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_AWARENESS_OTHER_LABEL",
              "order": 13,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "awarenessOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child6.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "LQA_OPV_DOSES_LABEL",
              "order": 14,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "opvDosesFromBirth",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_AFP_AWARENESS_LABEL",
              "order": 15,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "integer",
              "label": "LQA_AFP_CASE_COUNT_LABEL",
              "order": 16,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpCaseCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true,
              "visibilityCondition": {
                "expression": [
                  {"condition": "child6.afpAwareness=='YES'", "type": "custom"}
                ]
              }
            }
          ]
        },
        {
          "page": "child7",
          "label": "LQA_CHILD_PAGE_LABEL",
          "order": 8,
          "type": "object",
          "description": "LQA_CHILD_PAGE_DESCRIPTION",
          "actionLabel": "LQA_ACTION_NEXT",
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
          "navigateTo": {"name": "child8", "type": "form"},
          "conditionalNavigateTo": [
            {
              "type": "custom",
              "condition": "clusterInfo.numberOfInterviews=='7'",
              "navigateTo": {"name": "closeout", "type": "form"}
            }
          ],
          "properties": [
            {
              "type": "integer",
              "label": "LQA_CHILDREN_UNDER_5_LABEL",
              "order": 1,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_CHILDREN_UNDER_5_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenUnder5",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "integer",
              "label": "LQA_CHILD_AGE_MONTHS_LABEL",
              "order": 2,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childAgeMonths",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                },
                {
                  "type": "max",
                  "value": 59,
                  "message": "LQA_VALIDATION_MAX_59_MONTHS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_CHILD_SEX_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childSex",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "MALE", "name": "LQA_ENUM_MALE"},
                {"code": "FEMALE", "name": "LQA_ENUM_FEMALE"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_FINGER_MARKED_LABEL",
              "order": 4,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "fingerMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_REASON_NOT_MARKED_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "CHILD_ABSENT", "name": "LQA_ENUM_CHILD_ABSENT"},
                {"code": "NON_COMPLIANCE", "name": "LQA_ENUM_NON_COMPLIANCE"},
                {
                  "code": "HOUSE_NOT_VISITED",
                  "name": "LQA_ENUM_HOUSE_NOT_VISITED"
                },
                {
                  "code": "VACCINATED_NOT_MARKED",
                  "name": "LQA_ENUM_VACCINATED_NOT_MARKED"
                },
                {"code": "CHILD_ASLEEP", "name": "LQA_ENUM_CHILD_ASLEEP"},
                {"code": "CHILD_VISITOR", "name": "LQA_ENUM_CHILD_VISITOR"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {"condition": "child7.fingerMarked=='NO'", "type": "custom"}
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REASON_SPECIFY_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarkedOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child7.reasonNotMarked=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_REFUSAL_REASON_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {
                  "code": "RELIGIOUS_CULTURAL",
                  "name": "LQA_ENUM_RELIGIOUS_CULTURAL"
                },
                {
                  "code": "VACCINE_NOT_SAFE",
                  "name": "LQA_ENUM_VACCINE_NOT_SAFE"
                },
                {"code": "NO_FELT_NEED", "name": "LQA_ENUM_NO_FELT_NEED"},
                {"code": "TOO_MANY_ROUNDS", "name": "LQA_ENUM_TOO_MANY_ROUNDS"},
                {
                  "code": "NO_CAREGIVER_CONSENT",
                  "name": "LQA_ENUM_NO_CAREGIVER_CONSENT"
                },
                {"code": "CHILD_SICK", "name": "LQA_ENUM_CHILD_SICK"},
                {"code": "COVID_RELATED", "name": "LQA_ENUM_COVID_RELATED"},
                {
                  "code": "AFRICA_POLIO_FREE",
                  "name": "LQA_ENUM_AFRICA_POLIO_FREE"
                },
                {"code": "NOPV_CONCERNS", "name": "LQA_ENUM_NOPV_CONCERNS"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child7.reasonNotMarked=='NON_COMPLIANCE'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REFUSAL_REASON_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child7.refusalReason=='OTHERS'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_ABSENCE_REASON_LABEL",
              "order": 9,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "AT_FARM", "name": "LQA_ENUM_AT_FARM"},
                {"code": "IN_MARKET", "name": "LQA_ENUM_IN_MARKET"},
                {"code": "AT_SCHOOL", "name": "LQA_ENUM_AT_SCHOOL"},
                {"code": "IN_PLAYGROUND", "name": "LQA_ENUM_IN_PLAYGROUND"},
                {"code": "TRAVELLED", "name": "LQA_ENUM_TRAVELLED"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child7.reasonNotMarked=='CHILD_ABSENT'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_ABSENCE_REASON_LABEL",
              "order": 10,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child7.absenceReason=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_CAREGIVER_INFORMED_LABEL",
              "order": 11,
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
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_CAMPAIGN_AWARENESS_LABEL",
              "order": 12,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "TV", "name": "LQA_ENUM_TV"},
                {"code": "RADIO", "name": "LQA_ENUM_RADIO"},
                {"code": "MOB_VAN", "name": "LQA_ENUM_MOB_VAN"},
                {"code": "HEALTH_WORKER", "name": "LQA_ENUM_HEALTH_WORKER"},
                {"code": "VOLUNTEER_CHW", "name": "LQA_ENUM_VOLUNTEER_CHW"},
                {
                  "code": "RELIGIOUS_LEADER",
                  "name": "LQA_ENUM_RELIGIOUS_LEADER"
                },
                {
                  "code": "COMMUNITY_LEADER",
                  "name": "LQA_ENUM_COMMUNITY_LEADER"
                },
                {"code": "SOCIAL_MEDIA", "name": "LQA_ENUM_SOCIAL_MEDIA"},
                {"code": "SCHOOL", "name": "LQA_ENUM_SCHOOL"},
                {"code": "IEC_MATERIALS", "name": "LQA_ENUM_IEC_MATERIALS"},
                {
                  "code": "SOCIAL_MOBILIZER",
                  "name": "LQA_ENUM_SOCIAL_MOBILIZER"
                },
                {"code": "NEIGHBOUR", "name": "LQA_ENUM_NEIGHBOUR"},
                {"code": "NEWSPAPER", "name": "LQA_ENUM_NEWSPAPER"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child7.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_AWARENESS_OTHER_LABEL",
              "order": 13,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "awarenessOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child7.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "LQA_OPV_DOSES_LABEL",
              "order": 14,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "opvDosesFromBirth",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_AFP_AWARENESS_LABEL",
              "order": 15,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "integer",
              "label": "LQA_AFP_CASE_COUNT_LABEL",
              "order": 16,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpCaseCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true,
              "visibilityCondition": {
                "expression": [
                  {"condition": "child7.afpAwareness=='YES'", "type": "custom"}
                ]
              }
            }
          ]
        },
        {
          "page": "child8",
          "label": "LQA_CHILD_PAGE_LABEL",
          "order": 9,
          "type": "object",
          "description": "LQA_CHILD_PAGE_DESCRIPTION",
          "actionLabel": "LQA_ACTION_NEXT",
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
          "navigateTo": {"name": "child9", "type": "form"},
          "conditionalNavigateTo": [
            {
              "type": "custom",
              "condition": "clusterInfo.numberOfInterviews=='8'",
              "navigateTo": {"name": "closeout", "type": "form"}
            }
          ],
          "properties": [
            {
              "type": "integer",
              "label": "LQA_CHILDREN_UNDER_5_LABEL",
              "order": 1,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_CHILDREN_UNDER_5_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenUnder5",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "integer",
              "label": "LQA_CHILD_AGE_MONTHS_LABEL",
              "order": 2,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childAgeMonths",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                },
                {
                  "type": "max",
                  "value": 59,
                  "message": "LQA_VALIDATION_MAX_59_MONTHS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_CHILD_SEX_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childSex",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "MALE", "name": "LQA_ENUM_MALE"},
                {"code": "FEMALE", "name": "LQA_ENUM_FEMALE"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_FINGER_MARKED_LABEL",
              "order": 4,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "fingerMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_REASON_NOT_MARKED_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "CHILD_ABSENT", "name": "LQA_ENUM_CHILD_ABSENT"},
                {"code": "NON_COMPLIANCE", "name": "LQA_ENUM_NON_COMPLIANCE"},
                {
                  "code": "HOUSE_NOT_VISITED",
                  "name": "LQA_ENUM_HOUSE_NOT_VISITED"
                },
                {
                  "code": "VACCINATED_NOT_MARKED",
                  "name": "LQA_ENUM_VACCINATED_NOT_MARKED"
                },
                {"code": "CHILD_ASLEEP", "name": "LQA_ENUM_CHILD_ASLEEP"},
                {"code": "CHILD_VISITOR", "name": "LQA_ENUM_CHILD_VISITOR"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {"condition": "child8.fingerMarked=='NO'", "type": "custom"}
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REASON_SPECIFY_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarkedOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child8.reasonNotMarked=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_REFUSAL_REASON_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {
                  "code": "RELIGIOUS_CULTURAL",
                  "name": "LQA_ENUM_RELIGIOUS_CULTURAL"
                },
                {
                  "code": "VACCINE_NOT_SAFE",
                  "name": "LQA_ENUM_VACCINE_NOT_SAFE"
                },
                {"code": "NO_FELT_NEED", "name": "LQA_ENUM_NO_FELT_NEED"},
                {"code": "TOO_MANY_ROUNDS", "name": "LQA_ENUM_TOO_MANY_ROUNDS"},
                {
                  "code": "NO_CAREGIVER_CONSENT",
                  "name": "LQA_ENUM_NO_CAREGIVER_CONSENT"
                },
                {"code": "CHILD_SICK", "name": "LQA_ENUM_CHILD_SICK"},
                {"code": "COVID_RELATED", "name": "LQA_ENUM_COVID_RELATED"},
                {
                  "code": "AFRICA_POLIO_FREE",
                  "name": "LQA_ENUM_AFRICA_POLIO_FREE"
                },
                {"code": "NOPV_CONCERNS", "name": "LQA_ENUM_NOPV_CONCERNS"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child8.reasonNotMarked=='NON_COMPLIANCE'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REFUSAL_REASON_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child8.refusalReason=='OTHERS'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_ABSENCE_REASON_LABEL",
              "order": 9,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "AT_FARM", "name": "LQA_ENUM_AT_FARM"},
                {"code": "IN_MARKET", "name": "LQA_ENUM_IN_MARKET"},
                {"code": "AT_SCHOOL", "name": "LQA_ENUM_AT_SCHOOL"},
                {"code": "IN_PLAYGROUND", "name": "LQA_ENUM_IN_PLAYGROUND"},
                {"code": "TRAVELLED", "name": "LQA_ENUM_TRAVELLED"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child8.reasonNotMarked=='CHILD_ABSENT'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_ABSENCE_REASON_LABEL",
              "order": 10,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child8.absenceReason=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_CAREGIVER_INFORMED_LABEL",
              "order": 11,
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
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_CAMPAIGN_AWARENESS_LABEL",
              "order": 12,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "TV", "name": "LQA_ENUM_TV"},
                {"code": "RADIO", "name": "LQA_ENUM_RADIO"},
                {"code": "MOB_VAN", "name": "LQA_ENUM_MOB_VAN"},
                {"code": "HEALTH_WORKER", "name": "LQA_ENUM_HEALTH_WORKER"},
                {"code": "VOLUNTEER_CHW", "name": "LQA_ENUM_VOLUNTEER_CHW"},
                {
                  "code": "RELIGIOUS_LEADER",
                  "name": "LQA_ENUM_RELIGIOUS_LEADER"
                },
                {
                  "code": "COMMUNITY_LEADER",
                  "name": "LQA_ENUM_COMMUNITY_LEADER"
                },
                {"code": "SOCIAL_MEDIA", "name": "LQA_ENUM_SOCIAL_MEDIA"},
                {"code": "SCHOOL", "name": "LQA_ENUM_SCHOOL"},
                {"code": "IEC_MATERIALS", "name": "LQA_ENUM_IEC_MATERIALS"},
                {
                  "code": "SOCIAL_MOBILIZER",
                  "name": "LQA_ENUM_SOCIAL_MOBILIZER"
                },
                {"code": "NEIGHBOUR", "name": "LQA_ENUM_NEIGHBOUR"},
                {"code": "NEWSPAPER", "name": "LQA_ENUM_NEWSPAPER"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child8.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_AWARENESS_OTHER_LABEL",
              "order": 13,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "awarenessOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child8.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "LQA_OPV_DOSES_LABEL",
              "order": 14,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "opvDosesFromBirth",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_AFP_AWARENESS_LABEL",
              "order": 15,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "integer",
              "label": "LQA_AFP_CASE_COUNT_LABEL",
              "order": 16,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpCaseCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true,
              "visibilityCondition": {
                "expression": [
                  {"condition": "child8.afpAwareness=='YES'", "type": "custom"}
                ]
              }
            }
          ]
        },
        {
          "page": "child9",
          "label": "LQA_CHILD_PAGE_LABEL",
          "order": 10,
          "type": "object",
          "description": "LQA_CHILD_PAGE_DESCRIPTION",
          "actionLabel": "LQA_ACTION_NEXT",
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
          "navigateTo": {"name": "child10", "type": "form"},
          "conditionalNavigateTo": [
            {
              "type": "custom",
              "condition": "clusterInfo.numberOfInterviews=='9'",
              "navigateTo": {"name": "closeout", "type": "form"}
            }
          ],
          "properties": [
            {
              "type": "integer",
              "label": "LQA_CHILDREN_UNDER_5_LABEL",
              "order": 1,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_CHILDREN_UNDER_5_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenUnder5",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "integer",
              "label": "LQA_CHILD_AGE_MONTHS_LABEL",
              "order": 2,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childAgeMonths",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                },
                {
                  "type": "max",
                  "value": 59,
                  "message": "LQA_VALIDATION_MAX_59_MONTHS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_CHILD_SEX_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childSex",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "MALE", "name": "LQA_ENUM_MALE"},
                {"code": "FEMALE", "name": "LQA_ENUM_FEMALE"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_FINGER_MARKED_LABEL",
              "order": 4,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "fingerMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_REASON_NOT_MARKED_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "CHILD_ABSENT", "name": "LQA_ENUM_CHILD_ABSENT"},
                {"code": "NON_COMPLIANCE", "name": "LQA_ENUM_NON_COMPLIANCE"},
                {
                  "code": "HOUSE_NOT_VISITED",
                  "name": "LQA_ENUM_HOUSE_NOT_VISITED"
                },
                {
                  "code": "VACCINATED_NOT_MARKED",
                  "name": "LQA_ENUM_VACCINATED_NOT_MARKED"
                },
                {"code": "CHILD_ASLEEP", "name": "LQA_ENUM_CHILD_ASLEEP"},
                {"code": "CHILD_VISITOR", "name": "LQA_ENUM_CHILD_VISITOR"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {"condition": "child9.fingerMarked=='NO'", "type": "custom"}
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REASON_SPECIFY_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarkedOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child9.reasonNotMarked=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_REFUSAL_REASON_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {
                  "code": "RELIGIOUS_CULTURAL",
                  "name": "LQA_ENUM_RELIGIOUS_CULTURAL"
                },
                {
                  "code": "VACCINE_NOT_SAFE",
                  "name": "LQA_ENUM_VACCINE_NOT_SAFE"
                },
                {"code": "NO_FELT_NEED", "name": "LQA_ENUM_NO_FELT_NEED"},
                {"code": "TOO_MANY_ROUNDS", "name": "LQA_ENUM_TOO_MANY_ROUNDS"},
                {
                  "code": "NO_CAREGIVER_CONSENT",
                  "name": "LQA_ENUM_NO_CAREGIVER_CONSENT"
                },
                {"code": "CHILD_SICK", "name": "LQA_ENUM_CHILD_SICK"},
                {"code": "COVID_RELATED", "name": "LQA_ENUM_COVID_RELATED"},
                {
                  "code": "AFRICA_POLIO_FREE",
                  "name": "LQA_ENUM_AFRICA_POLIO_FREE"
                },
                {"code": "NOPV_CONCERNS", "name": "LQA_ENUM_NOPV_CONCERNS"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child9.reasonNotMarked=='NON_COMPLIANCE'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REFUSAL_REASON_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child9.refusalReason=='OTHERS'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_ABSENCE_REASON_LABEL",
              "order": 9,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "AT_FARM", "name": "LQA_ENUM_AT_FARM"},
                {"code": "IN_MARKET", "name": "LQA_ENUM_IN_MARKET"},
                {"code": "AT_SCHOOL", "name": "LQA_ENUM_AT_SCHOOL"},
                {"code": "IN_PLAYGROUND", "name": "LQA_ENUM_IN_PLAYGROUND"},
                {"code": "TRAVELLED", "name": "LQA_ENUM_TRAVELLED"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child9.reasonNotMarked=='CHILD_ABSENT'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_ABSENCE_REASON_LABEL",
              "order": 10,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child9.absenceReason=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_CAREGIVER_INFORMED_LABEL",
              "order": 11,
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
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_CAMPAIGN_AWARENESS_LABEL",
              "order": 12,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "TV", "name": "LQA_ENUM_TV"},
                {"code": "RADIO", "name": "LQA_ENUM_RADIO"},
                {"code": "MOB_VAN", "name": "LQA_ENUM_MOB_VAN"},
                {"code": "HEALTH_WORKER", "name": "LQA_ENUM_HEALTH_WORKER"},
                {"code": "VOLUNTEER_CHW", "name": "LQA_ENUM_VOLUNTEER_CHW"},
                {
                  "code": "RELIGIOUS_LEADER",
                  "name": "LQA_ENUM_RELIGIOUS_LEADER"
                },
                {
                  "code": "COMMUNITY_LEADER",
                  "name": "LQA_ENUM_COMMUNITY_LEADER"
                },
                {"code": "SOCIAL_MEDIA", "name": "LQA_ENUM_SOCIAL_MEDIA"},
                {"code": "SCHOOL", "name": "LQA_ENUM_SCHOOL"},
                {"code": "IEC_MATERIALS", "name": "LQA_ENUM_IEC_MATERIALS"},
                {
                  "code": "SOCIAL_MOBILIZER",
                  "name": "LQA_ENUM_SOCIAL_MOBILIZER"
                },
                {"code": "NEIGHBOUR", "name": "LQA_ENUM_NEIGHBOUR"},
                {"code": "NEWSPAPER", "name": "LQA_ENUM_NEWSPAPER"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child9.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_AWARENESS_OTHER_LABEL",
              "order": 13,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "awarenessOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child9.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "LQA_OPV_DOSES_LABEL",
              "order": 14,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "opvDosesFromBirth",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_AFP_AWARENESS_LABEL",
              "order": 15,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "integer",
              "label": "LQA_AFP_CASE_COUNT_LABEL",
              "order": 16,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpCaseCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true,
              "visibilityCondition": {
                "expression": [
                  {"condition": "child9.afpAwareness=='YES'", "type": "custom"}
                ]
              }
            }
          ]
        },
        {
          "page": "child10",
          "label": "LQA_CHILD_PAGE_LABEL",
          "order": 11,
          "type": "object",
          "description": "LQA_CHILD_PAGE_DESCRIPTION",
          "actionLabel": "LQA_ACTION_NEXT",
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
            {
              "type": "integer",
              "label": "LQA_CHILDREN_UNDER_5_LABEL",
              "order": 1,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_CHILDREN_UNDER_5_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenUnder5",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "integer",
              "label": "LQA_CHILD_AGE_MONTHS_LABEL",
              "order": 2,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childAgeMonths",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                },
                {
                  "type": "max",
                  "value": 59,
                  "message": "LQA_VALIDATION_MAX_59_MONTHS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_CHILD_SEX_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childSex",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "MALE", "name": "LQA_ENUM_MALE"},
                {"code": "FEMALE", "name": "LQA_ENUM_FEMALE"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_FINGER_MARKED_LABEL",
              "order": 4,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "fingerMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_REASON_NOT_MARKED_LABEL",
              "order": 5,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarked",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "CHILD_ABSENT", "name": "LQA_ENUM_CHILD_ABSENT"},
                {"code": "NON_COMPLIANCE", "name": "LQA_ENUM_NON_COMPLIANCE"},
                {
                  "code": "HOUSE_NOT_VISITED",
                  "name": "LQA_ENUM_HOUSE_NOT_VISITED"
                },
                {
                  "code": "VACCINATED_NOT_MARKED",
                  "name": "LQA_ENUM_VACCINATED_NOT_MARKED"
                },
                {"code": "CHILD_ASLEEP", "name": "LQA_ENUM_CHILD_ASLEEP"},
                {"code": "CHILD_VISITOR", "name": "LQA_ENUM_CHILD_VISITOR"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {"condition": "child10.fingerMarked=='NO'", "type": "custom"}
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REASON_SPECIFY_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "reasonNotMarkedOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child10.reasonNotMarked=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_REFUSAL_REASON_LABEL",
              "order": 7,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {
                  "code": "RELIGIOUS_CULTURAL",
                  "name": "LQA_ENUM_RELIGIOUS_CULTURAL"
                },
                {
                  "code": "VACCINE_NOT_SAFE",
                  "name": "LQA_ENUM_VACCINE_NOT_SAFE"
                },
                {"code": "NO_FELT_NEED", "name": "LQA_ENUM_NO_FELT_NEED"},
                {"code": "TOO_MANY_ROUNDS", "name": "LQA_ENUM_TOO_MANY_ROUNDS"},
                {
                  "code": "NO_CAREGIVER_CONSENT",
                  "name": "LQA_ENUM_NO_CAREGIVER_CONSENT"
                },
                {"code": "CHILD_SICK", "name": "LQA_ENUM_CHILD_SICK"},
                {"code": "COVID_RELATED", "name": "LQA_ENUM_COVID_RELATED"},
                {
                  "code": "AFRICA_POLIO_FREE",
                  "name": "LQA_ENUM_AFRICA_POLIO_FREE"
                },
                {"code": "NOPV_CONCERNS", "name": "LQA_ENUM_NOPV_CONCERNS"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child10.reasonNotMarked=='NON_COMPLIANCE'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_REFUSAL_REASON_LABEL",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "refusalReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child10.refusalReason=='OTHERS'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_ABSENCE_REASON_LABEL",
              "order": 9,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReason",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "AT_FARM", "name": "LQA_ENUM_AT_FARM"},
                {"code": "IN_MARKET", "name": "LQA_ENUM_IN_MARKET"},
                {"code": "AT_SCHOOL", "name": "LQA_ENUM_AT_SCHOOL"},
                {"code": "IN_PLAYGROUND", "name": "LQA_ENUM_IN_PLAYGROUND"},
                {"code": "TRAVELLED", "name": "LQA_ENUM_TRAVELLED"},
                {"code": "OTHER", "name": "LQA_ENUM_OTHER"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child10.reasonNotMarked=='CHILD_ABSENT'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_OTHER_ABSENCE_REASON_LABEL",
              "order": 10,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "absenceReasonOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child10.absenceReason=='OTHER'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_CAREGIVER_INFORMED_LABEL",
              "order": 11,
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
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "string",
              "label": "LQA_CAMPAIGN_AWARENESS_LABEL",
              "order": 12,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "TV", "name": "LQA_ENUM_TV"},
                {"code": "RADIO", "name": "LQA_ENUM_RADIO"},
                {"code": "MOB_VAN", "name": "LQA_ENUM_MOB_VAN"},
                {"code": "HEALTH_WORKER", "name": "LQA_ENUM_HEALTH_WORKER"},
                {"code": "VOLUNTEER_CHW", "name": "LQA_ENUM_VOLUNTEER_CHW"},
                {
                  "code": "RELIGIOUS_LEADER",
                  "name": "LQA_ENUM_RELIGIOUS_LEADER"
                },
                {
                  "code": "COMMUNITY_LEADER",
                  "name": "LQA_ENUM_COMMUNITY_LEADER"
                },
                {"code": "SOCIAL_MEDIA", "name": "LQA_ENUM_SOCIAL_MEDIA"},
                {"code": "SCHOOL", "name": "LQA_ENUM_SCHOOL"},
                {"code": "IEC_MATERIALS", "name": "LQA_ENUM_IEC_MATERIALS"},
                {
                  "code": "SOCIAL_MOBILIZER",
                  "name": "LQA_ENUM_SOCIAL_MOBILIZER"
                },
                {"code": "NEIGHBOUR", "name": "LQA_ENUM_NEIGHBOUR"},
                {"code": "NEWSPAPER", "name": "LQA_ENUM_NEWSPAPER"},
                {"code": "OTHERS", "name": "LQA_ENUM_OTHERS"}
              ],
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child10.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "string",
              "label": "LQA_AWARENESS_OTHER_LABEL",
              "order": 13,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "awarenessOther",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "visibilityCondition": {
                "expression": [
                  {
                    "condition": "child10.caregiverInformed=='YES'",
                    "type": "custom"
                  }
                ]
              }
            },
            {
              "type": "integer",
              "label": "LQA_OPV_DOSES_LABEL",
              "order": 14,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "opvDosesFromBirth",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "LQA_AFP_AWARENESS_LABEL",
              "order": 15,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpAwareness",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "LQA_VALIDATION_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "LQA_ENUM_YES"},
                {"code": "NO", "name": "LQA_ENUM_NO"}
              ]
            },
            {
              "type": "integer",
              "label": "LQA_AFP_CASE_COUNT_LABEL",
              "order": 16,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "afpCaseCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "min",
                  "value": 0,
                  "message": "LQA_VALIDATION_MIN_ZERO"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true,
              "visibilityCondition": {
                "expression": [
                  {"condition": "child10.afpAwareness=='YES'", "type": "custom"}
                ]
              }
            }
          ]
        },
        {
          "page": "closeout",
          "label": "LQA_CLOSEOUT_LABEL",
          "order": 12,
          "type": "object",
          "description": "LQA_CLOSEOUT_DESCRIPTION",
          "actionLabel": "LQA_ACTION_SUBMIT",
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
            {
              "type": "string",
              "label": "LQA_GPS_FINAL_LABEL",
              "order": 1,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_GPS_FINAL_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gpsFinal",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "LQA_FINAL_COMMENTS_LABEL",
              "order": 2,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText": "LQA_FINAL_COMMENTS_HELPTEXT",
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
                  "message": "LQA_VALIDATION_MAX_500_CHARS"
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
            "configName": "polioLqaDataCollection",
            "data": [],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "LQA_ERROR_FETCH_CONFIG"}
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
                "properties": {"message": "LQA_ERROR_RECORD_DATA"}
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
                "properties": {"message": "LQA_ERROR_NAVIGATION"}
              }
            ]
          }
        }
      ]
    },
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
          "label": "LQA_SUCCESS_HEADING",
          "description": "LQA_SUCCESS_DESCRIPTION",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "LQA_SUCCESS_ADD_ANOTHER",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"type": "FORM", "name": "lqaDataEntry"}
              }
            ]
          },
          "secondaryAction": {
            "label": "LQA_SUCCESS_BACK_HOME",
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
