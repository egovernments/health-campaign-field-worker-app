final dynamic samplePolioRegistrationFlows = {
  "name": "POLIO_REGISTRATION",
  "initialPage": "searchBeneficiary",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // ──────────────────────────────────────────────────────────
    // 1. searchBeneficiary (TEMPLATE, order:1)
    // ──────────────────────────────────────────────────────────
    {
      "name": "searchBeneficiary",
      "order": 1,
      "footer": [
        {
          "type": "template",
          "label": "Register Household",
          "format": "button",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {"key": "headOfHouseholdName", "value": "{{searchBar}}"},
                  {
                    "key": "projectTypeCode",
                    "value": "{{singleton.projectType.code}}"
                  }
                ],
                "name": "POLIO_HOUSEHOLD",
                "type": "FORM"
              }
            }
          ],
          "fieldName": "registerBeneficiary",
          "mandatory": true,
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        }
      ],
      "header": [
        {
          "label": "Back",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "HOME", "type": "HOME"}
            }
          ]
        }
      ],
      "heading": "Search Beneficiary",
      "category": "POLIO_REGISTRATION",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "Search for a beneficiary",
      "body": [
        {
          "type": "template",
          "label": "Head of Household Name",
          "format": "searchBar",
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "data": [
                  {
                    "key": "givenName",
                    "value": "field.value",
                    "operation": "contains"
                  },
                  {
                    "key": "localityBoundaryCode",
                    "root": "address",
                    "value": "{{singleton.boundary.code}}",
                    "operation": "equals"
                  }
                ],
                "name": "name",
                "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT"
              }
            }
          ],
          "fieldName": "searchBar",
          "mandatory": true,
          "validations": [
            {"type": "minSearchChars", "value": 2}
          ],
          "minSearchChars": 2
        },
        {
          "data": "members",
          "type": "template",
          "child": {
            "type": "template",
            "format": "card",
            "children": [
              {
                "type": "template",
                "format": "row",
                "children": [
                  {
                    "type": "template",
                    "value": "{{ item.headIndividual.0.name.givenName }}",
                    "format": "textTemplate",
                    "fieldName": "headOfHousehold"
                  },
                  {
                    "type": "template",
                    "label": "OPEN",
                    "format": "button",
                    "onAction": [
                      {
                        "actionType": "NAVIGATION",
                        "properties": {
                          "data": [
                            {
                              "key": "HouseholdClientReferenceId",
                              "value":
                                  "{{ item.HouseholdModel.clientReferenceId }}"
                            }
                          ],
                          "name": "householdOverview",
                          "type": "TEMPLATE"
                        }
                      }
                    ],
                    "fieldName": "openMemberCard",
                    "properties": {"size": "medium", "type": "secondary"}
                  }
                ],
                "fieldName": "detailsRow",
                "properties": {
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "spaceBetween"
                }
              },
              {
                "data": {
                  "rows": "{{currentItem.individuals}}",
                  "source": "individuals",
                  "columns": [
                    {
                      "header": "Beneficiary",
                      "hidden": false,
                      "isActive": true,
                      "cellValue": "{{item.name.givenName}}"
                    },
                    {
                      "header": "Age",
                      "hidden": false,
                      "isActive": true,
                      "cellValue": "{{fn:formatDate(item.dateOfBirth, 'age')}}"
                    },
                    {
                      "header": "Gender",
                      "hidden": false,
                      "isActive": true,
                      "cellValue": "{{item.gender}}"
                    }
                  ]
                },
                "type": "template",
                "format": "table",
                "fieldName": "memberTable"
              }
            ],
            "fieldName": "memberCard"
          },
          "format": "listView",
          "hidden": false,
          "fieldName": "listView",
          "properties": {"spacing": "spacer4"},
          "schemaCode": null
        }
      ],
      "wrapperConfig": {
        "filters": [],
        "relations": [
          {
            "name": "members",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "HouseholdMemberModel"
          },
          {
            "name": "headOfHousehold",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "HouseholdMemberModel",
            "filters": [
              {"field": "isHeadOfHousehold", "equals": true}
            ]
          },
          {
            "name": "headIndividual",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "headOfHousehold.individualClientReferenceId"
            },
            "entity": "IndividualModel"
          },
          {
            "name": "individuals",
            "match": {
              "field": "clientReferenceId",
              "inFrom": "members.individualClientReferenceId"
            },
            "entity": "IndividualModel"
          },
          {
            "name": "projectBeneficiaries",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "ProjectBeneficiaryModel"
          },
          {
            "name": "tasks",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "equalsFrom": "projectBeneficiaries.clientReferenceId"
            },
            "entity": "TaskModel"
          },
          {
            "name": "sideEffects",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "SideEffectModel"
          },
          {
            "name": "hFReferral",
            "match": {
              "field": "beneficiaryId",
              "equalsFrom": "individual.identifiers.0.identifierId"
            },
            "entity": "HFReferralModel"
          }
        ],
        "rootEntity": "HouseholdModel",
        "wrapperName": "HouseholdWrapper",
        "searchConfig": {
          "select": [
            "household",
            "individual",
            "householdMember",
            "projectBeneficiary",
            "task"
          ],
          "primary": "household",
          "pagination": {"limit": 5, "maxItems": 15}
        }
      },
      "scrollListener": {
        "debounceMs": 0,
        "onScrollUp": [
          {
            "actionType": "REFRESH_SEARCH",
            "properties": {
              "pagination": {"limit": 5, "maxItems": 15}
            }
          }
        ],
        "triggerMode": "bidirectional",
        "onScrollDown": [
          {
            "actionType": "REFRESH_SEARCH",
            "properties": {
              "pagination": {"limit": 5, "maxItems": 15}
            }
          }
        ],
        "showLoadingIndicator": true
      },
      "submitCondition": null,
      "preventScreenCapture": false
    },

    // ──────────────────────────────────────────────────────────
    // 2. POLIO_HOUSEHOLD (FORM, order:2) — Household Registration
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "FORM",
      "name": "POLIO_HOUSEHOLD",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        // ── Household Registration (single page, merged) ──
        {
          "page": "householdInformation",
          "label": "Household Registration",
          "order": 1,
          "type": "object",
          "description": "Enter session and household details",
          "actionLabel": "Submit",
          "properties": [
            {
              "type": "integer",
              "label": "Date of Enumeration",
              "order": 1,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "Date of enumeration",
              "infoText": "",
              "readOnly": false,
              "fieldName": "enumerationDate",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Date of enumeration is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "Enumerator Name",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Auto-populated from logged-in user",
              "infoText": "",
              "readOnly": false,
              "fieldName": "enumeratorName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Enumerator name is required"
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
              "label": "SIA Campaign",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Auto-filled from project type code",
              "infoText": "",
              "readOnly": false,
              "fieldName": "campaignId",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "SIA Campaign is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "autoFillCondition": [
                {"value": "{{projectTypeCode}}", "expression": "true==true"}
              ]
            },
            {
              "type": "string",
              "label": "Village/Settlement",
              "order": 4,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText": "Auto-populated from selected boundary",
              "infoText": "",
              "readOnly": true,
              "fieldName": "village",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "Head of Household Name",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the name of the head of household",
              "infoText": "",
              "readOnly": false,
              "fieldName": "headOfHouseholdName",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Head of household name is required"
                },
                {
                  "type": "minLength",
                  "value": 2,
                  "message": "Name must be at least 2 characters"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "MALE", "name": "MALE"},
                {"code": "FEMALE", "name": "FEMALE"}
              ],
              "label": "Gender",
              "order": 6,
              "value": "",
              "format": "select",
              "hidden": false,
              "isMdms": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "headGender",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "common-masters.GenderType",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "GPS Location",
              "order": 7,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText": "Capture GPS location",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gps",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "GPS location is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "Type of Settlement",
              "order": 8,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "tooltip": "",
              "helpText": "Select the type of settlement",
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
                  "message": "Type of settlement is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "URBAN", "name": "Urban"},
                {"code": "RURAL", "name": "Rural"},
                {"code": "SLUMS", "name": "Slums"},
                {"code": "REFUGEES_IDPS", "name": "Refugees/IDPs"},
                {"code": "HARD_TO_REACH", "name": "Hard to Reach"},
                {"code": "NOMADS", "name": "Nomads/Pastoralists"},
                {
                  "code": "SECURITY_COMPROMISED",
                  "name": "Security Compromised"
                },
                {"code": "IMMIGRANTS", "name": "Immigrants"},
                {"code": "CROSS_BORDER", "name": "Cross-Border"}
              ]
            },
            {
              "type": "integer",
              "label": "Number of Children Under 5 (0-59 months)",
              "order": 9,
              "value": "",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter the number of children under 5 years",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenUnder5Count",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Number of children is required"
                },
                {
                  "type": "min",
                  "value": 1,
                  "message": "Must have at least 1 child"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "isEditable": true
            },
            {
              "type": "string",
              "label": "Special Population Notes",
              "order": 10,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "tooltip": "",
              "helpText": "Enter any notes about special populations",
              "infoText": "",
              "readOnly": false,
              "fieldName": "specialPopulationNotes",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "maxLength",
                  "value": 500,
                  "message": "Notes must be 500 characters or less"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ],
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
          "autoEnable": null
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "polioRegistration",
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
            "entity": "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to register household."}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "FORM",
            "name": "ADD_CHILD",
            "navigationMode": "popUntilAndPush",
            "popUntilPageName": "searchBeneficiary",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "data": [
              {
                "key": "HouseholdClientReferenceId",
                "value":
                    "{{contextData.entities.HouseholdModel.clientReferenceId}}"
              },
              {
                "key": "remainingChildren",
                "value": "{{householdInformation.childrenUnder5Count}}"
              },
              {
                "key": "childrenTotal",
                "value": "{{householdInformation.childrenUnder5Count}}"
              },
              {"key": "childIndex", "value": "1"}
            ]
          }
        }
      ]
    },

    // ──────────────────────────────────────────────────────────
    // 3. householdOverview (TEMPLATE, order:3)
    // ──────────────────────────────────────────────────────────
    {
      "name": "householdOverview",
      "order": 3,
      "footer": [
        {
          "type": "template",
          "label": "Record Service Delivery",
          "format": "button",
          "visible": "{{fn:isEmpty(contextData.0.householdTasks)}} == true",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  }
                ],
                "name": "POLIO_DELIVERY",
                "type": "FORM"
              }
            }
          ],
          "fieldName": "recordDelivery",
          "mandatory": true,
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        },
      ],
      "header": [
        {
          "label": "Back",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {"name": "searchBeneficiary", "type": "TEMPLATE"}
            }
          ]
        }
      ],
      "heading": "Household Overview",
      "category": "POLIO_REGISTRATION",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "Household details overview",
      "body": [
        {
          "type": "template",
          "format": "card",
          "children": [
            {
              "data": [
                {
                  "key": "Head of Household",
                  "value":
                      "{{contextData.0.headIndividual.IndividualModel.name.givenName}}",
                  "isActive": true
                },
                {
                  "key": "Member Count",
                  "value":
                      "{{contextData.0.household.HouseholdModel.memberCount}}",
                  "isActive": true
                }
              ],
              "type": "template",
              "format": "labelPairList",
              "fieldName": "householdDetailsCard"
            }
          ],
          "fieldName": "detailsCard",
          "properties": {"type": "primary"},
          "schemaCode": null
        },
        {
          "type": "template",
          "child": {
            "type": "template",
            "format": "card",
            "children": [
              {
                "type": "template",
                "format": "row",
                "children": [
                  {
                    "type": "template",
                    "value": "{{ item.individual.0.name.givenName }}",
                    "format": "textTemplate",
                    "fieldName": "individualName"
                  }
                ],
                "fieldName": "nameRow",
                "properties": {
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "spaceBetween"
                }
              },
              {
                "type": "template",
                "value":
                    "{{item.individual.0.gender}} | {{fn:formatDate(item.individual.0.dateOfBirth, 'age')}}",
                "format": "textTemplate",
                "fieldName": "genderAge",
                "properties": {"bottomGap": 16}
              },
              {
                "data": [
                  {
                    "key": "ID Type",
                    "value":
                        "{{item.individual.0.identifiers.0.identifierType}}"
                  },
                  {
                    "key": "ID Number",
                    "value": "{{item.individual.0.identifiers.0.identifierId}}"
                  }
                ],
                "type": "template",
                "format": "labelPairList",
                "fieldName": "childIdDetails"
              }
            ],
            "fieldName": "memberCard",
            "properties": {
              "type": "secondary",
              "spacing": 0,
              "cardType": "secondary"
            }
          },
          "format": "listView",
          "fieldName": "childrenListView",
          "dataSource": "members",
          "properties": {"spacing": "spacer4"}
        }
      ],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "clientReferenceId",
                "value": "{{navigation.HouseholdClientReferenceId}}",
                "operation": "equals"
              }
            ],
            "name": "household",
            "type": "SEARCH_EVENT"
          }
        }
      ],
      "wrapperConfig": {
        "filters": [],
        "relations": [
          {
            "name": "household",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "HouseholdModel"
          },
          {
            "name": "headOfHousehold",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "HouseholdMemberModel",
            "filters": [
              {"field": "isHeadOfHousehold", "equals": true}
            ]
          },
          {
            "name": "headIndividual",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "headOfHousehold.individualClientReferenceId"
            },
            "entity": "IndividualModel"
          },
          {
            "name": "members",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "HouseholdMemberModel",
            "relations": [
              {
                "name": "member",
                "match": {
                  "field": "clientReferenceId",
                  "equalsFrom": "clientReferenceId"
                },
                "entity": "HouseholdMemberModel"
              },
              {
                "name": "individual",
                "match": {
                  "field": "clientReferenceId",
                  "equalsFrom": "individualClientReferenceId"
                },
                "entity": "IndividualModel"
              },
              {
                "name": "projectBeneficiary",
                "match": {
                  "field": "beneficiaryClientReferenceId",
                  "equalsFrom": "individual.clientReferenceId"
                },
                "entity": "ProjectBeneficiaryModel"
              },
              {
                "name": "task",
                "match": {
                  "field": "projectBeneficiaryClientReferenceId",
                  "equalsFrom": "projectBeneficiary.clientReferenceId"
                },
                "entity": "TaskModel"
              },
              {
                "name": "hFReferral",
                "match": {
                  "field": "beneficiaryId",
                  "equalsFrom": "individual.identifiers.0.identifierId"
                },
                "entity": "HFReferralModel"
              }
            ]
          },
          {
            "name": "householdProjectBeneficiary",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "ProjectBeneficiaryModel"
          },
          {
            "name": "householdTasks",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "equalsFrom": "householdProjectBeneficiary.clientReferenceId"
            },
            "entity": "TaskModel"
          }
        ],
        "computed": {
          "currentRunningCycle": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "order": 1,
            "where": [
              {"left": "{{startDate}}", "right": "{{now}}", "operator": "lt"},
              {"left": "{{endDate}}", "right": "{{now}}", "operator": "gt"}
            ],
            "select": "{{id}}",
            "default": -1,
            "takeFirst": true
          }
        },
        "rootEntity": "HouseholdModel",
        "wrapperName": "HouseholdWrapper",
        "searchConfig": {
          "select": [
            "household",
            "individual",
            "householdMember",
            "projectBeneficiary",
            "task",
            "hFReferral"
          ],
          "primary": "household"
        }
      },
      "submitCondition": null,
      "preventScreenCapture": false
    },

    // ──────────────────────────────────────────────────────────
    // 4. ADD_CHILD (FORM, order:4) — Child Registration
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "FORM",
      "name": "ADD_CHILD",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        // ── Child Information (single page) ──
        {
          "page": "childInformation",
          "label": "Child Information",
          "order": 1,
          "type": "object",
          "description": "Enter child details",
          "actionLabel": "Submit",
          "properties": [
            {
              "type": "string",
              "label": "Date of Birth",
              "order": 1,
              "value": "",
              "format": "dob",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "ageRange": {
                "maxAge": 59,
                "minAge": 0,
                "errorMessage": "Child must be under 5 years (0-59 months)"
              },
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "dobPicker",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Date of birth is required"
                },
                {
                  "type": "minAge",
                  "value": 0,
                  "message": "Child must be under 5 years (0-59 months)"
                },
                {
                  "type": "maxAge",
                  "value": 59,
                  "message": "Child must be under 5 years (0-59 months)"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "MALE", "name": "MALE"},
                {"code": "FEMALE", "name": "FEMALE"}
              ],
              "label": "Gender",
              "order": 2,
              "value": "",
              "format": "select",
              "hidden": false,
              "isMdms": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "gender",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "common-masters.GenderType",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Gender is required"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "Zero-Dose Child",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "Has the child never received any polio vaccine (routine or SIA)?",
              "infoText": "",
              "readOnly": false,
              "fieldName": "isZeroDose",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "enums": [
                {"code": "YES", "name": "Yes"},
                {"code": "NO", "name": "No"}
              ]
            }
          ],
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
          "autoEnable": null
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "polioChildRegistration",
            "data": [
              {
                "key": "HouseholdClientReferenceId",
                "value": "{{navigation.HouseholdClientReferenceId}}"
              },
              {"key": "childName", "value": "Child {{navigation.childIndex}}"}
            ],
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
            "entity": "INDIVIDUAL, MEMBER",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to register child."}
              }
            ]
          }
        },
        // ── Conditional navigation: loop through children ──
        // Last child → go to householdOverview
        {
          "condition": {"expression": "remainingChildren == 1"},
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "householdOverview",
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary",
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  }
                ]
              }
            }
          ]
        },
        // 2 remaining → next with 1
        {
          "condition": {"expression": "remainingChildren == 2"},
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "ADD_CHILD",
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary",
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {"key": "remainingChildren", "value": "1"},
                  {
                    "key": "childrenTotal",
                    "value": "{{navigation.childrenTotal}}"
                  },
                  {
                    "key": "childIndex",
                    "value": "{{fn:add(navigation.childIndex, 1)}}"
                  }
                ]
              }
            }
          ]
        },
        // 3 remaining → next with 2
        {
          "condition": {"expression": "remainingChildren == 3"},
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "ADD_CHILD",
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary",
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {"key": "remainingChildren", "value": "2"},
                  {
                    "key": "childrenTotal",
                    "value": "{{navigation.childrenTotal}}"
                  },
                  {
                    "key": "childIndex",
                    "value": "{{fn:add(navigation.childIndex, 1)}}"
                  }
                ]
              }
            }
          ]
        },
        // 4 remaining → next with 3
        {
          "condition": {"expression": "remainingChildren == 4"},
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "ADD_CHILD",
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary",
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {"key": "remainingChildren", "value": "3"},
                  {
                    "key": "childrenTotal",
                    "value": "{{navigation.childrenTotal}}"
                  },
                  {
                    "key": "childIndex",
                    "value": "{{fn:add(navigation.childIndex, 1)}}"
                  }
                ]
              }
            }
          ]
        },
        // 5 remaining → next with 4
        {
          "condition": {"expression": "remainingChildren == 5"},
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "ADD_CHILD",
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary",
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {"key": "remainingChildren", "value": "4"},
                  {
                    "key": "childrenTotal",
                    "value": "{{navigation.childrenTotal}}"
                  },
                  {
                    "key": "childIndex",
                    "value": "{{fn:add(navigation.childIndex, 1)}}"
                  }
                ]
              }
            }
          ]
        },
        // 6 remaining → next with 5
        {
          "condition": {"expression": "remainingChildren == 6"},
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "ADD_CHILD",
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary",
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {"key": "remainingChildren", "value": "5"},
                  {
                    "key": "childrenTotal",
                    "value": "{{navigation.childrenTotal}}"
                  },
                  {
                    "key": "childIndex",
                    "value": "{{fn:add(navigation.childIndex, 1)}}"
                  }
                ]
              }
            }
          ]
        },
        // 7 remaining → next with 6
        {
          "condition": {"expression": "remainingChildren == 7"},
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "ADD_CHILD",
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary",
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {"key": "remainingChildren", "value": "6"},
                  {
                    "key": "childrenTotal",
                    "value": "{{navigation.childrenTotal}}"
                  },
                  {
                    "key": "childIndex",
                    "value": "{{fn:add(navigation.childIndex, 1)}}"
                  }
                ]
              }
            }
          ]
        },
        // 8 remaining → next with 7
        {
          "condition": {"expression": "remainingChildren == 8"},
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "ADD_CHILD",
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary",
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {"key": "remainingChildren", "value": "7"},
                  {
                    "key": "childrenTotal",
                    "value": "{{navigation.childrenTotal}}"
                  },
                  {
                    "key": "childIndex",
                    "value": "{{fn:add(navigation.childIndex, 1)}}"
                  }
                ]
              }
            }
          ]
        },
        // 9 remaining → next with 8
        {
          "condition": {"expression": "remainingChildren == 9"},
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "ADD_CHILD",
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary",
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {"key": "remainingChildren", "value": "8"},
                  {
                    "key": "childrenTotal",
                    "value": "{{navigation.childrenTotal}}"
                  },
                  {
                    "key": "childIndex",
                    "value": "{{fn:add(navigation.childIndex, 1)}}"
                  }
                ]
              }
            }
          ]
        },
        // 10 remaining → next with 9
        {
          "condition": {"expression": "remainingChildren == 10"},
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "ADD_CHILD",
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary",
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {"key": "remainingChildren", "value": "9"},
                  {
                    "key": "childrenTotal",
                    "value": "{{navigation.childrenTotal}}"
                  },
                  {
                    "key": "childIndex",
                    "value": "{{fn:add(navigation.childIndex, 1)}}"
                  }
                ]
              }
            }
          ]
        },
        // Default fallback → householdOverview
        {
          "condition": {"expression": "DEFAULT"},
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "householdOverview",
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary",
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  }
                ]
              }
            }
          ]
        }
      ]
    },

    // ──────────────────────────────────────────────────────────
    // 5. POLIO_DELIVERY (FORM, order:5) — Delivery Details
    // ──────────────────────────────────────────────────────────
    {
      "name": "POLIO_DELIVERY",
      "order": 5,
      "screenType": "FORM",
      "project": "POLIO-SIA",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "initActions": [],
      "wrapperConfig": {},
      "pages": [
        // ── Delivery Details (same as REGISTRATION) ──
        {
          "page": "DeliveryDetails",
          "label": "Delivery Details",
          "order": 1,
          "type": "object",
          "description": "Record delivery details",
          "actionLabel": "Next",
          "properties": [
            {
              "type": "string",
              "label": "Date of Delivery",
              "order": 1,
              "value": "",
              "format": "date",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "dateOfRegistration",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": true,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            {
              "type": "dynamic",
              "label": "Resource",
              "order": 2,
              "value": "",
              "format": "custom",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "resourceCard",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Resource selection is required"
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            },
            {
              "type": "string",
              "enums": null,
              "label": "Delivery Comment",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "isMdms": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "deliveryComment",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.DELIVERY_COMMENT_OPTIONS_POPULATOR",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            }
          ],
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
          "navigateTo": {"name": "DeliveryChecklist", "type": "form"}
        },

        // ── Delivery Checklist ──
        {
          "page": "DeliveryChecklist",
          "label": "Delivery Checklist",
          "order": 2,
          "type": "object",
          "description": "Delivery actions checklist",
          "actionLabel": "Submit",
          "properties": [
            {
              "type": "boolean",
              "label": "Administered vaccine to child",
              "order": 1,
              "value": "",
              "format": "checkbox",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "ACTION1",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [],
              "errorMessage": ""
            },
            {
              "type": "boolean",
              "label": "Recorded finger mark on child",
              "order": 2,
              "value": "",
              "format": "checkbox",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "ACTION2",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [],
              "errorMessage": ""
            },
            {
              "type": "boolean",
              "label": "Informed caregiver about next dose",
              "order": 3,
              "value": "",
              "format": "checkbox",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "ACTION3",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [],
              "errorMessage": ""
            }
          ],
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
          "navigateTo": null
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "delivery",
            "data": [
              {
                "key": "ProjectBeneficiaryClientReferenceId",
                "value": "{{navigation.ProjectBeneficiaryClientReferenceId}}"
              },
              {"key": "cycleIndex", "value": "{{navigation.cycleIndex}}"},
              {"key": "doseIndex", "value": "{{navigation.doseIndex}}"},
              {
                "key": "deliveryStrategy",
                "value": "{{navigation.deliveryStrategy}}"
              }
            ],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to fetch delivery config."}
              }
            ]
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "TaskModel",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to record service delivery."}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "data": [
              {
                "key": "HouseholdClientReferenceId",
                "value": "{{navigation.HouseholdClientReferenceId}}"
              }
            ],
            "name": "polioDeliverySuccess",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "navigationMode": "popUntilAndPush",
            "popUntilPageName": "householdOverview"
          }
        }
      ]
    },

    // ──────────────────────────────────────────────────────────
    // 6. polioDeliverySuccess (TEMPLATE, order:6)
    // ──────────────────────────────────────────────────────────
    {
      "screenType": "TEMPLATE",
      "name": "polioDeliverySuccess",
      "order": 6,
      "heading": "",
      "description": "",
      "header": [],
      "footer": [],
      "initActions": [],
      "body": [
        {
          "type": "template",
          "format": "panelCard",
          "label": "Delivery Recorded Successfully",
          "description": "The delivery has been recorded for this household",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "View Household",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "TEMPLATE",
                  "name": "householdOverview",
                  "data": [
                    {
                      "key": "HouseholdClientReferenceId",
                      "value": "{{navigation.HouseholdClientReferenceId}}"
                    }
                  ]
                }
              }
            ]
          },
          "secondaryAction": {
            "label": "Back to Search",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"name": "searchBeneficiary", "type": "TEMPLATE"}
              }
            ]
          }
        }
      ]
    },

    // ──────────────────────────────────────────────────────────
    // 7. beneficiaryDetails (TEMPLATE, order:7)
    // ──────────────────────────────────────────────────────────
    {
      "body": [
        {
          "type": "template",
          "format": "card",
          "children": [
            {
              "data": [
                {
                  "key": "Name of Individual",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.name.givenName}}"
                },
                {
                  "key": "ID Type",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.identifiers.0.identifierType}}"
                },
                {
                  "key": "ID Number",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.identifiers.0.identifierId}}"
                },
                {
                  "key": "AGE",
                  "value":
                      "{{fn:formatDate(contextData.0.individuals.IndividualModel.dateOfBirth, 'age')}}"
                },
                {
                  "key": "Gender",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.gender}}"
                },
                {
                  "key": "Mobile Number",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.mobileNumber}}"
                },
                {
                  "key": "Date of Registration",
                  "value":
                      "{{fn:formatDate(contextData.0.projectBeneficiaries.ProjectBeneficiaryModel.dateOfRegistration, 'date', dd MMM yyyy)}}"
                }
              ],
              "type": "template",
              "format": "labelPairList",
              "fieldName": "meberDetails"
            }
          ],
          "fieldName": "detailsCard",
          "properties": {"type": "primary"},
          "schemaCode": null
        },
        {
          "type": "template",
          "format": "card",
          "children": [
            {
              "data": {
                "rows": "{{contextData.0.targetCycle.0.deliveries}}",
                "source": "contextData.targetCycle.deliveries",
                "columns": [
                  {
                    "header": "Dose",
                    "isActive": true,
                    "cellValue": "REGISTRATION_CURRENT_DOSE {{item.id}}"
                  },
                  {
                    "header": "Delivery Status",
                    "isActive": true,
                    "cellValue": {
                      "@default": "Pending",
                      "@condition": [
                        {
                          "when":
                              "{{fn:isDoseCompleted(item.id, contextData.0.currentRunningCycle)}} == true",
                          "value": "Administered"
                        },
                        {
                          "when": "{{item.id}} == {{contextData.0.nextDoseId}}",
                          "value": "To be Administered"
                        }
                      ]
                    }
                  },
                  {
                    "header": "Completed On",
                    "isActive": true,
                    "cellValue":
                        "{{fn:getTaskCompletionDate(item.id, contextData.0.currentRunningCycle)}}"
                  }
                ]
              },
              "type": "template",
              "format": "table",
              "fieldName": "deliveryTable"
            },
            {
              "type": "template",
              "format": "expandable",
              "visible": "{{fn:length(contextData.0.pastCycles)}} > 0",
              "children": [
                {
                  "type": "template",
                  "child": {
                    "type": "template",
                    "format": "card",
                    "children": [
                      {
                        "type": "template",
                        "value": "REGISTRATION_PAST_CYCLE {{item.id}}",
                        "format": "textTemplate",
                        "fieldName": "cycleNumber",
                        "properties": {"style": "headingS"}
                      },
                      {
                        "data": {
                          "rows": "{{deliveries}}",
                          "columns": [
                            {
                              "header": "Dose",
                              "isActive": true,
                              "cellValue": "REGISTRATION_PAST_DOSE {{item.id}}"
                            },
                            {
                              "header": "Delivery Status",
                              "isActive": true,
                              "cellValue": {
                                "@default": "Pending",
                                "@condition": [
                                  {
                                    "when":
                                        "{{fn:isDoseCompleted(item.id, currentItem.id)}} == true",
                                    "value": "Administered"
                                  }
                                ]
                              }
                            },
                            {
                              "header": "Completed On",
                              "isActive": true,
                              "cellValue":
                                  "{{fn:getTaskCompletionDate(item.id, currentItem.id)}}"
                            }
                          ]
                        },
                        "type": "template",
                        "format": "table",
                        "fieldName": "pastCycleTable"
                      }
                    ],
                    "properties": {"type": "secondary"}
                  },
                  "format": "listView",
                  "visible": "{{fn:length(contextData.0.pastCycles)}} > 0",
                  "fieldName": "pastCyclesList",
                  "dataSource": "pastCycles",
                  "properties": {"spacing": "spacer4"}
                }
              ],
              "expandLabel": "View Past Cycles",
              "collapseLabel": "Hide Past Cycles",
              "controlsField": "pastCycles"
            }
          ],
          "properties": {"type": "primary"},
          "schemaCode": null
        }
      ],
      "name": "beneficiaryDetails",
      "order": 7,
      "footer": [
        {
          "type": "template",
          "label": "Record Cycle Dose",
          "format": "button",
          "visible":
              "{{fn:canRecordDelivery(contextData.0.nextCycleId)}}==true",
          "disabled": "{{eligibleProductVariants}} == null",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value": "{{projectBeneficiaries.0.clientReferenceId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{household.0.clientReferenceId}}"
                  },
                  {
                    "key": "cycleIndex",
                    "value": "{{contextData.0.nextCycleId}}"
                  },
                  {"key": "doseIndex", "value": "{{contextData.0.nextDoseId}}"},
                  {
                    "key": "deliveryStrategy",
                    "value":
                        "{{contextData.0.currentDelivery.0.deliveryStrategy}}"
                  },
                  {
                    "key": "totalDosesInCycle",
                    "value": "{{contextData.0.deliveryLength}}"
                  },
                  {
                    "key": "futureDoses",
                    "value": "{{contextData.0.futureDeliveries}}"
                  }
                ],
                "name": "DELIVERY",
                "type": "FORM"
              }
            }
          ],
          "fieldName": "recordCycle",
          "mandatory": true,
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        }
      ],
      "header": [
        {
          "label": "Back",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "householdOverview", "type": "TEMPLATE"}
            }
          ]
        }
      ],
      "heading": "Beneficiary Details",
      "category": "POLIO_REGISTRATION",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "Beneficiary details",
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "clientReferenceId",
                "value": "{{navigation.IndividualClientReferenceId}}",
                "operation": "equals"
              }
            ],
            "name": "individual",
            "type": "SEARCH_EVENT"
          }
        }
      ],
      "wrapperConfig": {
        "filters": [],
        "relations": [
          {
            "name": "individuals",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "IndividualModel"
          },
          {
            "name": "projectBeneficiaries",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "ProjectBeneficiaryModel"
          },
          {
            "name": "tasks",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "inFrom": "projectBeneficiaries.clientReferenceId"
            },
            "entity": "TaskModel"
          },
          {
            "name": "sideEffects",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "SideEffectModel"
          }
        ],
        "rootEntity": "IndividualModel",
        "wrapperName": "IndividualWrapper",
        "searchConfig": {
          "select": ["individual", "projectBeneficiary", "task"],
          "primary": "individual"
        }
      },
      "submitCondition": null,
      "preventScreenCapture": false
    }
  ]
};
