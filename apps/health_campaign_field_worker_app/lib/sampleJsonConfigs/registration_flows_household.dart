final dynamic sampleHouseholdFlows = {
  "id": "9d3a901b-d831-427b-8aeb-4bbda9ec2019",
  "tenantId": "mz",
  "schemaCode": "HCM-ADMIN-CONSOLE.FormConfigTemplate",
  "uniqueIdentifier": "REGISTRATION.MR-DN-HOUSEHOLD",
  "name": "REGISTRATION",
  "flows": [
    {
      "body": [
        {
          "type": "template",
          "label": "DELIVERY_SUCCESSFUL_PANEL_CARD_HEADING",
          "format": "panelCard",
          "heading": "DELIVERY_SUCCESSFUL_PANEL_CARD_HEADING",
          "fieldName": "successCard",
          "mandatory": true,
          "properties": {"type": "success"},
          "description": "DELIVERY_SUCCESSFUL_PANEL_CARD_DESC",
          "primaryAction": {
            "type": "template",
            "label": "VIEW_HOUSEHOLD_DETAILS",
            "format": "button",
            "hidden": false,
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
                  "name": "householdOverview",
                  "type": "TEMPLATE"
                }
              }
            ],
            "fieldName": "viewHouseholdButton",
            "mandatory": true,
            "properties": {"type": "primary"}
          },
          "secondaryAction": {
            "type": "template",
            "label": "GO_BACK",
            "format": "button",
            "hidden": false,
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"name": "searchBeneficiary", "type": "TEMPLATE"}
              }
            ],
            "fieldName": "goBack",
            "mandatory": true,
            "properties": {"type": "secondary"}
          },
          "primaryActionLabel": "VIEW_HOUSEHOLD_DETAILS",
          "secondaryActionLabel": "GO_BACK"
        }
      ],
      "name": "deliverySuccess",
      "order": 10,
      "footer": [],
      "header": [
        {
          "type": "template",
          "label": "DELIVERY_BACK",
          "format": "backLink",
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
                "name": "searchBeneficiary",
                "type": "TEMPLATE"
              }
            }
          ],
          "fieldName": "deliveryBack",
          "mandatory": true
        }
      ],
      "category": "DELIVERY",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "submitCondition": null,
      "preventScreenCapture": false
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
                  "key": "NAME_OF_INDIVIDUAL",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.name.givenName}}"
                },
                {
                  "key": "ID_TYPE",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.identifiers.0.identifierType}}"
                },
                {
                  "key": "ID_NUMBER",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.identifiers.0.identifierId}}"
                },
                {
                  "key": "AGE",
                  "value":
                      "{{fn:formatDate(contextData.0.individuals.IndividualModel.dateOfBirth, 'age')}}"
                },
                {
                  "key": "GENDER",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.gender}}"
                },
                {
                  "key": "MOBILE_NUMBER",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.mobileNumber}}"
                },
                {
                  "key": "DATE_OF_REGISTRATION",
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
                    "header": "DOSE",
                    "isActive": true,
                    "cellValue": "REGISTRATION_CURRENT_DOSE {{item.id}}"
                  },
                  {
                    "header": "DELIVERY_STATUS",
                    "isActive": true,
                    "cellValue": {
                      "@default": "REGISTRATION_CURRENT_DOSE_STATUS_PENDING",
                      "@condition": [
                        {
                          "when":
                              "{{fn:isDoseCompleted(item.id, contextData.0.currentRunningCycle)}} == true",
                          "value":
                              "REGISTRATION_CURRENT_DOSE_STATUS_ADMINISTERED"
                        },
                        {
                          "when": "{{item.id}} == {{contextData.0.nextDoseId}}",
                          "value":
                              "REGISTRATION_CURRENT_DOSE_STATUS_TOBE_ADMINISTERED"
                        }
                      ]
                    }
                  },
                  {
                    "header": "COMPLETED_ON",
                    "isActive": true,
                    "cellValue":
                        "{{fn:getTaskCompletionDate(item.id, contextData.0.currentRunningCycle)}}"
                  }
                ]
              },
              "type": "template",
              "format": "table",
              "fieldName": "deliveryTable"
            }
          ],
          "properties": {"type": "primary"},
          "schemaCode": null
        }
      ],
      "name": "beneficiaryDetails",
      "order": 8,
      "footer": [
        {
          "type": "template",
          "label": "RECORD_CYCLE_DOSE",
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
                    "value": "{{contextData.0.household.0.clientReferenceId}}"
                  },
                  {
                    "key": "cycleIndex",
                    "value": "{{contextData.0.nextCycleId}}"
                  },
                  {"key": "doseIndex", "value": "{{contextData.0.nextDoseId}}"}
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
          "label": "BENEFICIARY_BACK",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "householdOverview", "type": "TEMPLATE"}
            }
          ]
        }
      ],
      "heading": "BENEFICIARY_DETAILS_HEADING",
      "category": "DELIVERY",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "BENEFICIARY_DETAILS_DESC",
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
        "fields": {
          "dose": {
            "from": "{{tasks.additionalFields.fields}}",
            "where": {
              "left": "{{key}}",
              "right": "doseIndex",
              "operator": "eq"
            },
            "select": "{{value}}",
            "default": 0,
            "takeLast": true
          },
          "cycle": {
            "from": "{{tasks.additionalFields.fields}}",
            "where": {
              "left": "{{key}}",
              "right": "cycleIndex",
              "operator": "eq"
            },
            "select": "{{value}}",
            "default": 1,
            "takeLast": true
          },
          "memberCount": {
            "from": "{{household.0.additionalFields.fields}}",
            "where": {
              "left": "{{key}}",
              "right": "memberCount",
              "operator": "eq"
            },
            "select": "{{value}}",
            "default": 1,
            "takeFirst": true
          }
        },
        "filters": [],
        "computed": {
          "nextDoseId": {
            "order": 4,
            "fallback": 1,
            "condition": {
              "if": {
                "left": {"value": "{{dose}}", "operation": "increment"},
                "right": "{{deliveryLength}}",
                "operator": "lte"
              },
              "else": 1,
              "then": {"value": "{{dose}}", "operation": "increment"}
            }
          },
          "nextCycleId": {
            "order": 5,
            "fallback": "{{cycle}}",
            "condition": {
              "if": {
                "left": {"value": "{{dose}}", "operation": "increment"},
                "right": "{{deliveryLength}}",
                "operator": "lte"
              },
              "else": {"value": "{{cycle}}", "operation": "increment"},
              "then": "{{cycle}}"
            }
          },
          "deliveryLength": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "order": 3,
            "where": {
              "left": "{{id}}",
              "right": "{{currentRunningCycle}}",
              "operator": "equals"
            },
            "select": "{{deliveries.length}}",
            "default": 0,
            "takeFirst": true
          },
          "hasCycleArrived": {
            "order": 2,
            "fallback": false,
            "condition": {
              "left": "{{cycle}}",
              "right": "{{currentRunningCycle}}",
              "operator": "equals"
            }
          },
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
        "relations": [
          {
            "name": "members",
            "match": {
              "field": "individualClientReferenceId",
              "equalsFrom": "IndividualModel.clientReferenceId"
            },
            "entity": "HouseholdMemberModel"
          },
          {
            "name": "household",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "members.householdClientReferenceId"
            },
            "entity": "HouseholdModel"
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
              "equalsFrom": "household.clientReferenceId"
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
              "equalsFrom": "projectBeneficiaries.clientReferenceId"
            },
            "entity": "SideEffectModel"
          },
          {
            "name": "referrals",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "projectBeneficiaries.clientReferenceId"
            },
            "entity": "ReferralModel"
          }
        ],
        "rootEntity": "IndividualModel",
        "wrapperName": "DeliveryWrapper",
        "computedList": {
          "pastCycles": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "order": 6,
            "where": {
              "left": "{{item.id}}",
              "right": "{{currentRunningCycle}}",
              "operator": "lt"
            }
          },
          "futureTasks": {
            "from": "{{tasks}}",
            "order": 2,
            "where": {
              "left": "{{item.additionalFields.deliveryStrategy}}",
              "right": "INDIRECT",
              "operator": "equals"
            }
          },
          "targetCycle": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "order": 1,
            "where": {
              "left": "{{id}}",
              "right": "{{currentRunningCycle}}",
              "operator": "equals"
            },
            "fallback": null,
            "takeLast": true
          },
          "currentDelivery": {
            "from": "{{targetCycle.0.deliveries}}",
            "order": 4,
            "where": {
              "left": "{{id}}",
              "right": "{{nextDoseId}}",
              "operator": "equals"
            },
            "fallback": null,
            "takeLast": true
          },
          "futureDeliveries": {
            "map": "{{item.deliveries}}",
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "skip": {"from": "{{dose}}"},
            "order": 3,
            "takeWhile": {
              "left": "{{item.deliveryStrategy}}",
              "right": "INDIRECT",
              "operator": "equals"
            }
          },
          "eligibleProductVariants": {
            "from": "{{currentDelivery.0.doseCriteria}}",
            "order": 5,
            "fallback": [],
            "takeLast": false,
            "evaluateCondition": {
              "context": ["{{headIndividual.0}}", "{{household.0}}"],
              "condition": "{{item.condition}}",
              "transformations": {
                "age": {"type": "ageInMonths", "source": "dateOfBirth"},
                "memberCount": {"type": "int", "source": "memberCount"}
              }
            }
          }
        },
        "searchConfig": {
          "select": [
            "individual",
            "household",
            "householdMember",
            "projectBeneficiary",
            "task"
          ],
          "primary": "household"
        }
      },
      "submitCondition": null,
      "preventScreenCapture": false
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
                  "key": "HOUSEHOLD_HEAD_NAME",
                  "value":
                      "{{contextData.0.headIndividual.IndividualModel.name.givenName}}"
                },
                {
                  "key": "HOUSEHOLD_LOCALITY",
                  "value":
                      "{{contextData.0.HouseholdModel.address.locality.code}}"
                },
                {
                  "key": "MEMBER_COUNT",
                  "value": "{{contextData.0.HouseholdModel.memberCount}}"
                }
              ],
              "type": "template",
              "format": "labelPairList",
              "fieldName": "householdDetails"
            },
            {
              "type": "template",
              "label": "ADMINISTERED_SUCCESS",
              "format": "tag",
              "visible": "{{fn:isDelivered(task.last.status)}}==true",
              "fieldName": "administrationSuccess",
              "properties": {"tagType": "success"}
            },
            {
              "type": "template",
              "label": "NOT_VISITED",
              "format": "tag",
              "visible": "{{fn:isDelivered(task.last.status)}}==false",
              "fieldName": "notVisited",
              "properties": {"tagType": "info"}
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
                      },
                      {
                        "type": "template",
                        "label": "REGISTRATION_EDIT_INDIVIDUAL_BUTTON_LABEL",
                        "format": "button",
                        "onAction": [
                          {
                            "actionType": "REVERSE_TRANSFORM",
                            "properties": {
                              "data": [
                                {
                                  "key": "entities",
                                  "value": "{{item.individual}}"
                                },
                                {
                                  "key": "entities",
                                  "value": "{{item.projectBeneficiary}}"
                                }
                              ],
                              "configName": "individualRegistration",
                              "entityTypes": [
                                "IndividualModel",
                                "ProjectBeneficiaryModel"
                              ]
                            }
                          },
                          {
                            "actionType": "NAVIGATION",
                            "properties": {
                              "data": [
                                {
                                  "key": "HouseholdClientReferenceId",
                                  "value":
                                      "{{item.member.0.householdClientReferenceId}}"
                                },
                                {"key": "isEdit", "value": "true"}
                              ],
                              "name": "ADD_MEMBER",
                              "type": "FORM"
                            }
                          }
                        ],
                        "fieldName": "editIndividualButton",
                        "properties": {
                          "icon": "Edit",
                          "size": "large",
                          "type": "tertiary",
                          "mainAxisSize": "min",
                          "mainAxisAlignment": "center"
                        }
                      }
                    ],
                    "properties": {
                      "mainAxisSize": "max",
                      "mainAxisAlignment": "spaceBetween"
                    }
                  },
                  {
                    "type": "template",
                    "value":
                        "{{item.individual.0.gender }} | {{fn:formatDate(item.individual.0.dateOfBirth, 'age')}}",
                    "format": "textTemplate",
                    "fieldName": "genderAge"
                  }
                ],
                "fieldName": "memberCard",
                "properties": {"type": "secondary", "cardType": "secondary"}
              },
              "format": "listView",
              "hidden": false,
              "fieldName": "listViewMembers",
              "dataSource": "members",
              "properties": {"spacing": "spacer4"}
            }
          ],
          "fieldName": "overviewLabelPairCard",
          "properties": {"type": "primary", "cardType": "primary"},
          "schemaCode": null
        }
      ],
      "name": "householdOverview",
      "order": 3,
      "footer": [
        {
          "type": "template",
          "label": "DELIVERY",
          "format": "button",
          "visible": "{{fn:checkAllDoseDelivered(task)}} == false",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value":
                        "{{contextData.0.HouseholdModel.clientReferenceId}}"
                  },
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{household.0.projectBeneficiary.0.clientReferenceId}}"
                  }
                ],
                "name": "beneficiaryDetails",
                "type": "TEMPLATE"
              }
            }
          ],
          "fieldName": "deliveryButton",
          "mandatory": true,
          "properties": {
            "size": "medium",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          }
        }
      ],
      "header": [
        {
          "label": "HOUSEHOLD_BACK",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {"name": "searchBeneficiary", "type": "TEMPLATE"}
            }
          ]
        }
      ],
      "heading": "REGISTRATION_HOUSEHOLD_OVERVIEW_HEADING",
      "category": "REGISTRATION",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "REGISTRATION_HOUSEHOLD_OVERVIEW_DESC",
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
        "fields": {
          "dose": {
            "from": "{{householdTasks.additionalFields.fields}}",
            "where": {
              "left": "{{key}}",
              "right": "doseIndex",
              "operator": "eq"
            },
            "select": "{{value}}",
            "default": 0,
            "takeLast": true
          },
          "cycle": {
            "from": "{{householdTasks.additionalFields.fields}}",
            "where": {
              "left": "{{key}}",
              "right": "cycleIndex",
              "operator": "eq"
            },
            "select": "{{value}}",
            "default": 1,
            "takeLast": true
          },
          "memberCount": {
            "from": "{{household.0.additionalFields.fields}}",
            "where": {
              "left": "{{key}}",
              "right": "memberCount",
              "operator": "eq"
            },
            "select": "{{value}}",
            "default": 1,
            "takeFirst": true
          }
        },
        "computed": {
          "nextDoseId": {
            "order": 4,
            "fallback": 1,
            "condition": {
              "if": {
                "left": "{{cycle}}",
                "right": "{{currentRunningCycle}}",
                "operator": "equals"
              },
              "else": 1,
              "then": {
                "if": {
                  "left": {"value": "{{dose}}", "operation": "increment"},
                  "right": "{{deliveryLength}}",
                  "operator": "lte"
                },
                "else": 1,
                "then": {"value": "{{dose}}", "operation": "increment"}
              }
            }
          },
          "nextCycleId": {
            "order": 5,
            "fallback": "{{currentRunningCycle}}",
            "condition": {
              "if": {
                "left": "{{cycle}}",
                "right": "{{currentRunningCycle}}",
                "operator": "equals"
              },
              "else": "{{currentRunningCycle}}",
              "then": {
                "if": {
                  "left": {"value": "{{dose}}", "operation": "increment"},
                  "right": "{{deliveryLength}}",
                  "operator": "lte"
                },
                "else": {"value": "{{cycle}}", "operation": "increment"},
                "then": "{{cycle}}"
              }
            }
          },
          "effectiveDose": {
            "order": 6,
            "fallback": 0,
            "condition": {
              "if": {
                "left": "{{nextCycleId}}",
                "right": "{{cycle}}",
                "operator": "equals"
              },
              "else": 0,
              "then": "{{dose}}"
            }
          },
          "deliveryLength": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "order": 3,
            "where": {
              "left": "{{id}}",
              "right": "{{currentRunningCycle}}",
              "operator": "equals"
            },
            "select": "{{deliveries.length}}",
            "default": 0,
            "takeFirst": true
          },
          "hasCycleArrived": {
            "order": 2,
            "fallback": false,
            "condition": {
              "left": "{{cycle}}",
              "right": "{{currentRunningCycle}}",
              "operator": "equals"
            }
          },
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
        "relations": [
          {
            "name": "household",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "HouseholdModel",
            "relations": [
              {
                "name": "projectBeneficiary",
                "match": {
                  "field": "beneficiaryClientReferenceId",
                  "equalsFrom": "household.clientReferenceId"
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
                "name": "referral",
                "match": {
                  "field": "projectBeneficiaryClientReferenceId",
                  "equalsFrom": "projectBeneficiary.clientReferenceId"
                },
                "entity": "ReferralModel"
              }
            ]
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
                  "equalsFrom": "householdClientReferenceId"
                },
                "entity": "ProjectBeneficiaryModel"
              }
            ]
          }
        ],
        "rootEntity": "HouseholdModel",
        "wrapperName": "HouseholdWrapper",
        "computedList": {
          "pastCycles": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "order": 6,
            "where": {
              "left": "{{item.id}}",
              "right": "{{currentRunningCycle}}",
              "operator": "lt"
            }
          },
          "futureTasks": {
            "from": "{{householdTasks}}",
            "order": 2,
            "where": {
              "left": "{{item.additionalFields.deliveryStrategy}}",
              "right": "INDIRECT",
              "operator": "equals"
            }
          },
          "targetCycle": {
            "from":
                "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
            "order": 1,
            "where": {
              "left": "{{id}}",
              "right": "{{currentRunningCycle}}",
              "operator": "equals"
            },
            "fallback": null,
            "takeLast": true
          },
          "currentDelivery": {
            "from": "{{targetCycle.0.deliveries}}",
            "order": 4,
            "where": {
              "left": "{{id}}",
              "right": "{{nextDoseId}}",
              "operator": "equals"
            },
            "fallback": null,
            "takeLast": true
          },
          "futureDeliveries": {
            "from": "{{targetCycle.0.deliveries}}",
            "skip": {"from": "{{effectiveDose}}"},
            "order": 3,
            "where": {
              "left": "{{item.deliveryStrategy}}",
              "right": "INDIRECT",
              "operator": "equals"
            }
          },
          "eligibleProductVariants": {
            "from": "{{currentDelivery.0.doseCriteria}}",
            "order": 5,
            "fallback": [],
            "takeLast": false,
            "evaluateCondition": {
              "context": ["{{headIndividual.0}}", "{{household.0}}"],
              "condition": "{{item.condition}}",
              "transformations": {
                "age": {"type": "ageInMonths", "source": "dateOfBirth"},
                "memberCount": {"type": "int", "source": "memberCount"}
              }
            }
          }
        },
        "searchConfig": {
          "select": [
            "household",
            "individual",
            "householdMember",
            "projectBeneficiary",
            "task",
            "referral"
          ],
          "primary": "household"
        }
      },
      "submitCondition": null,
      "preventScreenCapture": false
    },
    {
      "body": [
        {
          "type": "template",
          "label": "PROXIMITY_SEARCH_REGISTRATION",
          "format": "proximitySearch",
          "onAction": [
            {
              "actionType": "field.value==true ? SEARCH_EVENT : CLEAR_STATE",
              "properties": {
                "data": [
                  {"key": "", "value": 5, "operation": "within"}
                ],
                "name": "address",
                "type": "field.value==true ? SEARCH_EVENT : CLEAR_STATE"
              }
            }
          ],
          "fieldName": "proximitySearch",
          "mandatory": true,
          "schemaCode": null,
          "validations": [
            {
              "key": "proximityRadius",
              "value": 5,
              "errorMessage": "PROXIMITY_RADIUS_ERROR_MESSAGE"
            }
          ]
        },
        {
          "type": "template",
          "label": "NAME_OF_INDIVIDUAL",
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
                  }
                ],
                "name": "name",
                "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT"
              }
            }
          ],
          "fieldName": "searchBar",
          "mandatory": true,
          "schemaCode": null,
          "validations": [
            {"type": "minSearchChars", "value": 2}
          ]
        },
        {
          "icon": "FilterAlt",
          "type": "template",
          "label": "REGISTRATION_SEARCH_BENEFICIARY_FILTER_LABEL",
          "format": "actionPopup",
          "fieldName": "filterPopUp",
          "properties": {
            "icon": "FilterAlt",
            "size": "medium",
            "type": "tertiary",
            "suffixIcon": "FilterAlt",
            "popupConfig": {
              "body": [
                {
                  "type": "template",
                  "enums": [
                    {
                      "code": "ADMINISTRATION_SUCCESS",
                      "name": "REGISTRATION_ADMINISTRATION_SUCCESS"
                    }
                  ],
                  "format": "selectionCard",
                  "fieldName": "selectedStatus"
                }
              ],
              "type": "default",
              "title": "REGISTRATION_SEARCH_BENEFICIARY_FILTER_TITLE_LABEL",
              "titleIcon": "FilterAlt",
              "footerActions": [
                {
                  "type": "template",
                  "label": "REGISTRATION_SEARCH_BENEFICIARY_FILTER_CLEAR_LABEL",
                  "format": "button",
                  "onAction": [
                    {
                      "actionType": "CLEAR_STATE",
                      "properties": {
                        "name": "task",
                        "filterKeys": [
                          "status",
                          "projectBeneficiary",
                          "projectId"
                        ],
                        "widgetKeys": ["selectedStatus"],
                        "triggerSearch": true
                      }
                    }
                  ],
                  "fieldName": "clearFilter",
                  "properties": {
                    "size": "large",
                    "type": "secondary",
                    "mainAxisSize": "max"
                  }
                },
                {
                  "type": "template",
                  "label":
                      "REGISTRATION_SEARCH_BENEFICIARY_FILTER_FILTER_LABEL",
                  "format": "button",
                  "onAction": [
                    {
                      "actionType": "CLOSE_POPUP",
                      "properties": {"parentScreenKey": "searchBeneficiary"}
                    },
                    {
                      "actionType": "CLEAR_STATE",
                      "properties": {
                        "name": "task",
                        "filterKeys": [
                          "status",
                          "projectBeneficiary",
                          "projectId"
                        ],
                        "triggerSearch": false
                      }
                    },
                    {
                      "actions": [
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "data": [
                              {
                                "key": "status",
                                "value": "{{selectedStatus}}",
                                "operation": "in"
                              }
                            ],
                            "name": "task"
                          }
                        }
                      ],
                      "condition": {
                        "expression":
                            "selectedStatus == ADMINISTRATION_SUCCESS || selectedStatus == CLOSED_HOUSEHOLD || selectedStatus == ADMINISTRATION_FAILED"
                      }
                    },
                    {
                      "actions": [
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "data": [
                              {
                                "key": "projectId",
                                "value": "{{singleton.selectedProject.id}}",
                                "operation": "notEqual"
                              }
                            ],
                            "name": "projectBeneficiary"
                          }
                        }
                      ],
                      "condition": {
                        "expression": "selectedStatus == NOT_REGISTERED"
                      }
                    },
                    {
                      "actions": [
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "data": [
                              {
                                "key": "projectId",
                                "root": "projectBeneficiary",
                                "value": "{{singleton.selectedProject.id}}",
                                "operation": "notEqual"
                              },
                              {
                                "key": "status",
                                "root": "task",
                                "value": "NOT_ADMINISTERED",
                                "operation": "equals"
                              }
                            ],
                            "filterLogic": "or"
                          }
                        }
                      ],
                      "condition": {
                        "expression": "selectedStatus == NOT_ADMINISTERED"
                      }
                    }
                  ],
                  "fieldName": "saveFilter",
                  "properties": {
                    "size": "large",
                    "type": "primary",
                    "mainAxisSize": "max"
                  }
                }
              ],
              "showCloseButton": true,
              "barrierDismissible": true
            },
            "mainAxisSize": "min",
            "mainAxisAlignment": "start"
          },
          "schemaCode": null
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
                        "actions": [
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
                        "condition": {
                          "expression":
                              "{{item.tasks.0.status}} != CLOSED_HOUSEHOLD"
                        }
                      },
                      {
                        "actions": [
                          {
                            "actionType": "REVERSE_TRANSFORM",
                            "properties": {
                              "data": [
                                {"key": "entities", "value": "{{item}}"}
                              ],
                              "configName": "beneficiaryRegistration",
                              "entityTypes": ["HouseholdModel", "TaskModel"]
                            }
                          },
                          {
                            "actionType": "NAVIGATION",
                            "properties": {
                              "data": [
                                {
                                  "key": "HouseholdClientReferenceId",
                                  "value":
                                      "{{ item.HouseholdModel.clientReferenceId }}"
                                },
                                {"key": "isEdit", "value": "true"},
                                {"key": "isClosedHousehold", "value": "true"}
                              ],
                              "name": "HOUSEHOLD",
                              "type": "FORM"
                            }
                          }
                        ],
                        "condition": {
                          "expression":
                              "{{item.tasks.0.status}} == CLOSED_HOUSEHOLD"
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
                      "header": "BENEFICIARY",
                      "hidden": false,
                      "isActive": true,
                      "cellValue": "{{item.name.givenName}}"
                    },
                    {
                      "header": "AGE_OF_BENEFICIARY",
                      "hidden": false,
                      "isActive": true,
                      "cellValue": "{{fn:formatDate(item.dateOfBirth, 'age')}}"
                    },
                    {
                      "header": "GENDER",
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
      "name": "searchBeneficiary",
      "order": 1,
      "footer": [
        {
          "type": "template",
          "label": "REGISTER_BENEFICIARY",
          "format": "button",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {"key": "nameOfIndividual", "value": "{{searchBar}}"}
                ],
                "name": "HOUSEHOLD",
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
        },
        {
          "type": "template",
          "label": "SCAN_BENEFICIARY",
          "format": "qrScanner",
          "onAction": [
            {
              "actionType": "OPEN_SCANNER",
              "properties": {
                "isGS1": false,
                "scanType": "qr",
                "fieldName": "beneficiaryTag",
                "onSuccess": [
                  {
                    "actionType": "SEARCH_EVENT",
                    "properties": {
                      "data": [
                        {
                          "key": "tag",
                          "value": "{{beneficiaryTag}}",
                          "operation": "equals"
                        }
                      ],
                      "name": "projectBeneficiary",
                      "type": "SEARCH_EVENT",
                      "awaitResults": true
                    }
                  }
                ],
                "scanLimit": 1,
                "singleValue": true
              }
            }
          ],
          "fieldName": "qrScanner",
          "showLabel": false,
          "properties": {
            "icon": "QrCodeScanner",
            "size": "large",
            "type": "secondary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "validations": [
            {
              "type": "scanLimit",
              "value": 1,
              "message": "SCANLIMIT_ERROR_MESSAGE"
            },
            {"type": "isGS1", "value": false}
          ]
        }
      ],
      "header": [
        {
          "label": "BACK",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "HOME", "type": "HOME"}
            }
          ]
        }
      ],
      "heading": "REGISTRATION_SEARCH_BENEFICIARY_HEADING",
      "category": "REGISTRATION",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "REGISTRATION_SEARCH_BENEFICIARY_DESC",
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
          },
          {
            "name": "referrals",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "entity": "ReferralModel"
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
    {
      "name": "DELIVERY",
      "order": 9,
      "pages": [
        {
          "body": [
            {
              "fields": [
                {
                  "type": "string",
                  "label":
                      "APPONE_REGISTRATION_DELIVERYDETAILS_label_dateOfDelivery",
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
                  "systemDate": true,
                  "validations": [],
                  "errorMessage": "",
                  "includeInForm": true,
                  "isMultiSelect": false,
                  "includeInSummary": true
                },
                {
                  "type": "dynamic",
                  "enums": [
                    {"code": "SP1", "name": "SP1"},
                    {"code": "SP2", "name": "SP2"},
                    {"code": "AQ1", "name": "AQ1"},
                    {"code": "AQ2", "name": "AQ2"}
                  ],
                  "label": "APPONE_REGISTRATION_DELIVERYDETAILS_label_resource",
                  "order": 2,
                  "value": "",
                  "format": "custom",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "fieldName": "resourceCard",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "systemDate": false,
                  "validations": [],
                  "errorMessage": "",
                  "includeInForm": true,
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "SP1", "name": "SP1"},
                    {"code": "SP2", "name": "SP2"},
                    {"code": "AQ1", "name": "AQ1"},
                    {"code": "AQ2", "name": "AQ2"}
                  ],
                  "includeInSummary": true
                },
                {
                  "type": "string",
                  "label":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_deliveryComments",
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
                },
                {
                  "type": "string",
                  "label": "APPONE_REGISTRATION_DELIVERYDETAILS_label_scanner",
                  "order": 4,
                  "value": "",
                  "format": "scanner",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "fieldName": "scanner",
                  "mandatory": false,
                  "showLabel": false,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "systemDate": false,
                  "validations": [],
                  "errorMessage": "",
                  "includeInForm": true,
                  "isMultiSelect": false,
                  "includeInSummary": true
                }
              ]
            }
          ],
          "flow": "DELIVERY",
          "page": "DeliveryDetails",
          "type": "object",
          "label": "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_HEADING",
          "order": 1,
          "footer": [
            {
              "label":
                  "APPONE_REGISTRATION_DELIVERYDETAILS_ACTION_BUTTON_LABEL_1",
              "format": "button",
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "name": "household-acknowledgement",
                    "type": "template"
                  }
                }
              ],
              "properties": {
                "size": "large",
                "type": "primary",
                "mainAxisSize": "max",
                "mainAxisAlignment": "center"
              }
            }
          ],
          "module": "REGISTRATION",
          "heading": "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_HEADING",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "data": [
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                  },
                  {"key": "cycleIndex", "value": "{{navigation.cycleIndex}}"},
                  {"key": "doseIndex", "value": "{{navigation.doseIndex}}"}
                ],
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to fetch config."}
                  }
                ],
                "configName": "delivery"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to create household."}
                  }
                ]
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  }
                ],
                "name": "deliverySuccess",
                "type": "TEMPLATE",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Navigation failed."}
                  }
                ],
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary"
              }
            }
          ],
          "navigateTo": {
            "name": "household-acknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_DELIVERYDETAILS_label_dateOfDelivery",
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
              "enums": [
                {"code": "SP1", "name": "SP1"},
                {"code": "SP2", "name": "SP2"},
                {"code": "AQ1", "name": "AQ1"},
                {"code": "AQ2", "name": "AQ2"}
              ],
              "label": "APPONE_REGISTRATION_DELIVERYDETAILS_label_resource",
              "order": 2,
              "value": "",
              "format": "custom",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "resourceCard",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "SP1", "name": "SP1"},
                {"code": "SP2", "name": "SP2"},
                {"code": "AQ1", "name": "AQ1"},
                {"code": "AQ2", "name": "AQ2"}
              ],
              "includeInSummary": true
            },
            {
              "type": "string",
              "enums": null,
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_deliveryComments",
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
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_DELIVERYDETAILS_label_scanner",
              "order": 4,
              "value": "",
              "format": "scanner",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "scanner",
              "mandatory": false,
              "showLabel": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            }
          ],
          "actionLabel":
              "APPONE_REGISTRATION_DELIVERYDETAILS_ACTION_BUTTON_LABEL_1",
          "description":
              "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false,
          "conditionalNavigateTo": null
        }
      ],
      "summary": false,
      "version": 3,
      "category": "DELIVERY",
      "disabled": false,
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "data": [
              {
                "key": "ProjectBeneficiaryClientReferenceId",
                "value": "{{navigation.ProjectBeneficiaryClientReferenceId}}"
              },
              {"key": "cycleIndex", "value": "{{navigation.cycleIndex}}"},
              {"key": "doseIndex", "value": "{{navigation.doseIndex}}"}
            ],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to fetch config."}
              }
            ],
            "configName": "delivery"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to create household."}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "data": [
              {
                "key": "ProjectBeneficiaryClientReferenceId",
                "value": "{{navigation.ProjectBeneficiaryClientReferenceId}}"
              },
              {
                "key": "HouseholdClientReferenceId",
                "value": "{{navigation.HouseholdClientReferenceId}}"
              }
            ],
            "name": "deliverySuccess",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "navigationMode": "popUntilAndPush",
            "popUntilPageName": "searchBeneficiary"
          }
        }
      ],
      "isSelected": true,
      "screenType": "FORM",
      "initActions": [],
      "wrapperConfig": {},
      "scrollListener": {}
    },
    {
      "name": "ADD_MEMBER",
      "order": 4,
      "pages": [
        {
          "page": "beneficiaryDetails",
          "type": "object",
          "label":
              "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING_addmember",
          "order": 4,
          "navigateTo": {
            "data": [
              {
                "key": "householdId",
                "value": "{{formData.household.clientReferenceId}}"
              }
            ],
            "name": "beneficiary-details",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_addmember",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText_addmember",
              "infoText": "",
              "readOnly": false,
              "fieldName": "nameOfIndividual",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_mandatory_message_addmember"
                },
                {
                  "type": "minLength",
                  "value": "2",
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_min_message_addmember"
                },
                {
                  "type": "maxLength",
                  "value": "200",
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message_addmember"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname_addmember",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "familyname",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "minLength",
                  "value": "2",
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname_min_message_addmember"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [],
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers_addmember",
              "order": 3,
              "value": "",
              "format": "idPopulator",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "identifiers",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.ID_TYPE_OPTIONS_POPULATOR",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_idpopulator_mandatory_message_addmember"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_addmember",
              "order": 4,
              "value": "",
              "format": "dob",
              "hidden": false,
              "tooltip":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_tooltip_addmember",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_helpText_addmember",
              "infoText": "",
              "readOnly": false,
              "fieldName": "dobPicker",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_mandatory_message_addmember"
                },
                {
                  "type": "minAge",
                  "value": 3,
                  "message": "AGE_VALIDATION_ADDMEMBER"
                },
                {
                  "type": "maxAge",
                  "value": 1800,
                  "message": "AGE_VALIDATION_ADDMEMBER"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [],
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_gender_addmember",
              "order": 5,
              "value": "",
              "format": "select",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
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
                  "message": "GENDER_MANDATORY_MESSAGE_ADDMEMBER"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_addmember",
              "order": 6,
              "value": "",
              "format": "mobileNumber",
              "hidden": false,
              "tooltip":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_tooltip_addmember",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_helpText_addmember",
              "infoText": "",
              "readOnly": false,
              "fieldName": "phone",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "minLength",
                  "value": 10,
                  "message": "MOBILE_LENGTH_10_DIGIT_ERROR_ADDMEMBER"
                },
                {
                  "type": "maxLength",
                  "value": 10,
                  "message": "MOBILE_LENGTH_10_DIGIT_ERROR_ADDMEMBER"
                },
                {
                  "type": "pattern",
                  "value": "^\\d+\$",
                  "message": "MB_ONLY_NUMBERS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_scanner_addmember",
              "order": 7,
              "value": "",
              "format": "scanner",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "scanner",
              "showLabel": false,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "includeInSummary": true
            }
          ],
          "actionLabel":
              "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_addmember",
          "description":
              "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_DESCRIPTION_addmember"
        }
      ],
      "version": 1,
      "category": "REGISTRATION",
      "disabled": false,
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "data": [
              {
                "key": "HouseholdClientReferenceId",
                "value": "{{navigation.HouseholdClientReferenceId}}"
              }
            ],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to fetch config."}
              }
            ],
            "configName": "individualRegistration"
          }
        },
        {
          "actions": [
            {
              "actionType": "UPDATE_EVENT",
              "properties": {
                "entity": "IndividualModel, ProjectBeneficiaryModel"
              }
            }
          ],
          "condition": {"type": "custom", "expression": "isEdit == true"}
        },
        {
          "actions": [
            {
              "actionType": "CREATE_EVENT",
              "properties": {"entity": "INDIVIDUAL, PROJECTBENEFICIARY, MEMBER"}
            }
          ],
          "condition": {"type": "custom", "expression": "DEFAULT"}
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
            "name": "householdOverview",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "navigationMode": "popUntilAndPush",
            "popUntilPageName": "searchBeneficiary"
          }
        }
      ],
      "isSelected": true,
      "screenType": "FORM",
      "wrapperConfig": {
        "filters": [
          {"field": "isHeadOfHousehold", "equals": true}
        ],
        "relations": [
          {
            "name": "household",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "householdClientReferenceId"
            },
            "entity": "HouseholdModel"
          },
          {
            "name": "members",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            },
            "entity": "HouseholdMemberModel"
          },
          {
            "name": "headOfHousehold",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "HouseholdMemberModel.individualClientReferenceId"
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
              "equalsFrom": "household.clientReferenceId"
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
              "equalsFrom": "household.clientReferenceId"
            },
            "entity": "SideEffectModel"
          },
          {
            "name": "referrals",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            },
            "entity": "ReferralModel"
          }
        ],
        "rootEntity": "HouseholdMemberModel",
        "wrapperName": "HouseholdWrapper",
        "searchConfig": {
          "select": [
            "individual",
            "household",
            "householdMember",
            "projectBeneficiary",
            "task"
          ],
          "primary": "household"
        }
      }
    },
    {
      "name": "HOUSEHOLD",
      "order": 2,
      "pages": [
        {
          "flow": "HOUSEHOLD",
          "page": "beneficiaryDetails",
          "type": "object",
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING",
          "order": 4,
          "footer": [
            {
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_1",
              "format": "button",
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "data": [
                      {
                        "key": "householdId",
                        "value": "{{formData.household.clientReferenceId}}"
                      }
                    ],
                    "name": "beneficiary-details",
                    "type": "template"
                  }
                }
              ],
              "properties": {
                "size": "large",
                "type": "primary",
                "mainAxisSize": "max",
                "mainAxisAlignment": "center"
              }
            }
          ],
          "module": "REGISTRATION",
          "heading": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actions": [
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "UPDATE_EVENT",
                  "properties": {
                    "entity": "HouseholdModel, TaskModel",
                    "modify": [
                      {"key": "TaskModel.status", "value": "NOT_ADMINISTERED"}
                    ],
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {
                          "message": "Failed to update closed household."
                        }
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
                        "value":
                            "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                      }
                    ],
                    "name": "householdOverview",
                    "type": "TEMPLATE",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Navigation failed."}
                      }
                    ]
                  }
                }
              ],
              "condition": {
                "type": "custom",
                "expression": "isEdit==true && isClosedHousehold==true"
              }
            },
            {
              "actions": [
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "UPDATE_EVENT",
                  "properties": {
                    "entity": "HouseholdModel",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to update household."}
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
                        "value":
                            "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                      }
                    ],
                    "name": "householdOverview",
                    "type": "TEMPLATE",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Navigation failed."}
                      }
                    ]
                  }
                }
              ],
              "condition": {"type": "custom", "expression": "isEdit==true"}
            },
            {
              "actions": [
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "CREATE_EVENT",
                  "properties": {
                    "entity":
                        "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to create household."}
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
                        "value":
                            "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                      }
                    ],
                    "name": "householdOverview",
                    "type": "TEMPLATE",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Navigation failed."}
                      }
                    ]
                  }
                }
              ],
              "condition": {"type": "custom", "expression": "DEFAULT"}
            }
          ],
          "navigateTo": {
            "data": [
              {
                "key": "householdId",
                "value": "{{formData.household.clientReferenceId}}"
              }
            ],
            "name": "beneficiary-details",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "nameOfIndividual",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "lengthRange": {
                "maxLength": "200",
                "minLength": "2",
                "errorMessage":
                    "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message"
              },
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_mandatory_message"
                },
                {
                  "type": "minLength",
                  "value": "2",
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message"
                },
                {
                  "type": "maxLength",
                  "value": "200",
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_max_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_mandatory_message"
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": false,
              "fieldName": "familyname",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {
                  "type": "minLength",
                  "value": "2",
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_familyname_min_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "boolean",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_isHeadOfFamily",
              "order": 3,
              "value": true,
              "format": "checkbox",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "isHeadOfFamily",
              "mandatory": true,
              "showLabel": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_isHeadOfFamily_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_isHeadOfFamily_mandatory_message"
            },
            {
              "type": "string",
              "enums": null,
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers",
              "order": 4,
              "value": "",
              "format": "idPopulator",
              "hidden": true,
              "isMdms": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "identifiers",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.ID_TYPE_OPTIONS_POPULATOR",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker",
              "order": 5,
              "value": "",
              "format": "dob",
              "hidden": false,
              "isMdms": false,
              "tooltip":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_tooltip",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_helpText",
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
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_mandatory_message"
            },
            {
              "type": "string",
              "enums": null,
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_gender",
              "order": 6,
              "value": "",
              "format": "select",
              "hidden": false,
              "isMdms": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gender",
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
              "type": "integer",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_height",
              "order": 7,
              "value": "",
              "format": "text",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "height",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_weight",
              "order": 8,
              "value": "",
              "format": "text",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "weight",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone",
              "order": 6,
              "value": "",
              "format": "mobileNumber",
              "hidden": false,
              "tooltip":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_tooltip",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "phone",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "minLength",
                  "value": 10,
                  "message": "MOBILE_LENGTH_10_DIGIT_ERROR"
                },
                {
                  "type": "maxLength",
                  "value": 10,
                  "message": "MOBILE_LENGTH_10_DIGIT_ERROR"
                },
                {
                  "type": "pattern",
                  "value": "^\\d+\$",
                  "message": "MB_ONLY_NUMBER"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_scanner",
              "order": 10,
              "value": "",
              "format": "scanner",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "scanner",
              "mandatory": false,
              "showLabel": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false,
              "includeInSummary": true
            }
          ],
          "actionLabel":
              "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_1",
          "description":
              "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false
        },
        {
          "flow": "HOUSEHOLD",
          "page": "householdDetails",
          "type": "object",
          "label": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_HEADING",
          "order": 3,
          "footer": [
            {
              "label":
                  "APPONE_REGISTRATION_HOUSEHOLDDETAILS_ACTION_BUTTON_LABEL_1",
              "format": "button",
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {"name": "beneficiaryDetails", "type": "form"}
                }
              ],
              "properties": {
                "size": "large",
                "type": "primary",
                "mainAxisSize": "max",
                "mainAxisAlignment": "center"
              }
            }
          ],
          "module": "REGISTRATION",
          "heading": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_HEADING",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actions": [
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "UPDATE_EVENT",
                  "properties": {
                    "entity": "HouseholdModel, TaskModel",
                    "modify": [
                      {"key": "TaskModel.status", "value": "NOT_ADMINISTERED"}
                    ],
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {
                          "message": "Failed to update closed household."
                        }
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
                        "value":
                            "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                      }
                    ],
                    "name": "householdOverview",
                    "type": "TEMPLATE",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Navigation failed."}
                      }
                    ]
                  }
                }
              ],
              "condition": {
                "type": "custom",
                "expression": "isEdit==true && isClosedHousehold==true"
              }
            },
            {
              "actions": [
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "UPDATE_EVENT",
                  "properties": {
                    "entity": "HouseholdModel",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to update household."}
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
                        "value":
                            "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                      }
                    ],
                    "name": "householdOverview",
                    "type": "TEMPLATE",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Navigation failed."}
                      }
                    ]
                  }
                }
              ],
              "condition": {"type": "custom", "expression": "isEdit==true"}
            },
            {
              "actions": [
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "CREATE_EVENT",
                  "properties": {
                    "entity":
                        "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to create household."}
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
                        "value":
                            "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                      }
                    ],
                    "name": "householdOverview",
                    "type": "TEMPLATE",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Navigation failed."}
                      }
                    ]
                  }
                }
              ],
              "condition": {"type": "custom", "expression": "DEFAULT"}
            }
          ],
          "navigateTo": {"name": "beneficiaryDetails", "type": "form"},
          "properties": [
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_dateOfRegistration",
              "order": 1,
              "value": "",
              "format": "date",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "required": true,
              "fieldName": "dateOfRegistration",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_dateOfRegistration_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_dateOfRegistration_mandatory_message"
            },
            {
              "type": "integer",
              "label":
                  "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_childrenCount",
              "order": 2,
              "value": "0",
              "format": "numeric",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenCount",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label":
                  "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_pregnantWomenCount",
              "order": 3,
              "value": "0",
              "format": "numeric",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "pregnantWomenCount",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount",
              "order": 4,
              "range": {
                "max": "10",
                "min": "1",
                "errorMessage":
                    "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_max_message"
              },
              "value": "1",
              "format": "numeric",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "memberCount",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_mandatory_message"
                },
                {
                  "type": "min",
                  "value": "1",
                  "message":
                      "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_max_message"
                },
                {
                  "type": "max",
                  "value": "10",
                  "message":
                      "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_max_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount_mandatory_message"
            }
          ],
          "actionLabel":
              "APPONE_REGISTRATION_HOUSEHOLDDETAILS_ACTION_BUTTON_LABEL_1",
          "description":
              "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_DESCRIPTION",
          "showTabView": false,
          "submitCondition": {
            "expression": [
              {"condition": "isEdit == true"}
            ]
          },
          "preventScreenCapture": false
        },
        {
          "flow": "HOUSEHOLD",
          "page": "beneficiaryLocation",
          "type": "object",
          "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_HEADING",
          "order": 1,
          "footer": [
            {
              "label":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_ACTION_BUTTON_LABEL_1",
              "format": "button",
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {"name": "householdDetails", "type": "form"}
                }
              ],
              "properties": {
                "size": "large",
                "type": "primary",
                "mainAxisSize": "max",
                "mainAxisAlignment": "center"
              }
            }
          ],
          "module": "REGISTRATION",
          "heading": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_HEADING",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actions": [
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "UPDATE_EVENT",
                  "properties": {
                    "entity": "HouseholdModel, TaskModel",
                    "modify": [
                      {"key": "TaskModel.status", "value": "NOT_ADMINISTERED"}
                    ],
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {
                          "message": "Failed to update closed household."
                        }
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
                        "value":
                            "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                      }
                    ],
                    "name": "householdOverview",
                    "type": "TEMPLATE",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Navigation failed."}
                      }
                    ]
                  }
                }
              ],
              "condition": {
                "type": "custom",
                "expression": "isEdit==true && isClosedHousehold==true"
              }
            },
            {
              "actions": [
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "UPDATE_EVENT",
                  "properties": {
                    "entity": "HouseholdModel",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to update household."}
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
                        "value":
                            "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                      }
                    ],
                    "name": "householdOverview",
                    "type": "TEMPLATE",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Navigation failed."}
                      }
                    ]
                  }
                }
              ],
              "condition": {"type": "custom", "expression": "isEdit==true"}
            },
            {
              "actions": [
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "CREATE_EVENT",
                  "properties": {
                    "entity":
                        "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to create household."}
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
                        "value":
                            "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                      }
                    ],
                    "name": "householdOverview",
                    "type": "TEMPLATE",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Navigation failed."}
                      }
                    ]
                  }
                }
              ],
              "condition": {"type": "custom", "expression": "DEFAULT"}
            }
          ],
          "navigateTo": {"name": "householdDetails", "type": "form"},
          "properties": [
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_administrativeArea",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_administrativeArea_helpText",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "administrativeArea",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_administrativeArea_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_administrativeArea_mandatory_message"
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_latlong",
              "order": 2,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_latlong_helpText",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "latLng",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_latlong_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_latlong_mandatory_message"
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine1",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine1_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "addressLine1",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {
                  "type": "minLength",
                  "value": "2",
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine1_min_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine2",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine2_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "addressLine2",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {
                  "type": "minLength",
                  "value": "2",
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine2_min_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_landmark",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_landmark_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "landmark",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {
                  "type": "minLength",
                  "value": "2",
                  "message":
                      "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_landmark_min_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_pincode",
              "order": 6,
              "range": {"max": null, "min": null},
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_pincode_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "pincode",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {"type": "min", "value": null, "message": ""},
                {"type": "max", "value": null, "message": ""},
                {
                  "type": "pattern",
                  "value": "^\\d+\$",
                  "message": "PINCODE_ONLY_NUMBERS"
                }
              ],
              "errorMessage": ""
            },
            {
              "type": "string",
              "enums": [
                {"code": "PERMANENT", "name": "BENEFICIARYLOCATION_PERMANENT"},
                {
                  "code": "CORRESPONDENCE",
                  "name": "BENEFICIARYLOCATION_CORRESPONDENCE"
                },
                {"code": "OTHER", "name": "BENEFICIARYLOCATION_OTHER"}
              ],
              "label":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_typeOfAddress",
              "order": 7,
              "value": "PERMANENT",
              "format": "dropdown",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "typeOfAddress",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "PERMANENT", "name": "BENEFICIARYLOCATION_PERMANENT"},
                {
                  "code": "CORRESPONDENCE",
                  "name": "BENEFICIARYLOCATION_CORRESPONDENCE"
                },
                {"code": "OTHER", "name": "BENEFICIARYLOCATION_OTHER"}
              ],
              "includeInSummary": false
            }
          ],
          "actionLabel":
              "APPONE_REGISTRATION_BENEFICIARY_LOCATION_ACTION_BUTTON_LABEL_1",
          "description":
              "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false
        }
      ],
      "summary": false,
      "version": 3,
      "category": "REGISTRATION",
      "disabled": false,
      "onAction": [
        {
          "actions": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to fetch config."}
                  }
                ],
                "configName": "beneficiaryRegistration"
              }
            },
            {
              "actionType": "UPDATE_EVENT",
              "properties": {
                "entity": "HouseholdModel, TaskModel",
                "modify": [
                  {"key": "TaskModel.status", "value": "NOT_ADMINISTERED"}
                ],
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {
                      "message": "Failed to update closed household."
                    }
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
                    "value":
                        "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                  }
                ],
                "name": "householdOverview",
                "type": "TEMPLATE",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Navigation failed."}
                  }
                ]
              }
            }
          ],
          "condition": {"type": "custom", "expression": "isEdit==true"}
        },
        {
          "actions": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to fetch config."}
                  }
                ],
                "configName": "beneficiaryRegistration"
              }
            },
            {
              "actionType": "UPDATE_EVENT",
              "properties": {
                "entity": "HouseholdModel",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to update household."}
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
                    "value":
                        "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                  }
                ],
                "name": "householdOverview",
                "type": "TEMPLATE",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Navigation failed."}
                  }
                ]
              }
            }
          ],
          "condition": {"type": "custom", "expression": "isEdit==true"}
        },
        {
          "actions": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to fetch config."}
                  }
                ],
                "configName": "beneficiaryRegistration"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to create household."}
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
                    "value":
                        "{{contextData.entities.HouseholdModel.clientReferenceId}}"
                  }
                ],
                "name": "householdOverview",
                "type": "TEMPLATE",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Navigation failed."}
                  }
                ]
              }
            }
          ],
          "condition": {"type": "custom", "expression": "DEFAULT"}
        }
      ],
      "isSelected": true,
      "screenType": "FORM",
      "initActions": [],
      "wrapperConfig": {
        "filters": [
          {"field": "isHeadOfHousehold", "equals": true}
        ],
        "relations": [
          {
            "name": "household",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "householdClientReferenceId"
            },
            "entity": "HouseholdModel"
          },
          {
            "name": "members",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            },
            "entity": "HouseholdMemberModel"
          },
          {
            "name": "headOfHousehold",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "HouseholdMemberModel.individualClientReferenceId"
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
              "equalsFrom": "household.clientReferenceId"
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
              "equalsFrom": "household.clientReferenceId"
            },
            "entity": "SideEffectModel"
          },
          {
            "name": "referrals",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            },
            "entity": "ReferralModel"
          }
        ],
        "rootEntity": "HouseholdMemberModel",
        "wrapperName": "HouseholdWrapper",
        "searchConfig": {
          "select": [
            "individual",
            "household",
            "householdMember",
            "projectBeneficiary",
            "task"
          ],
          "primary": "household"
        }
      },
      "scrollListener": {}
    }
  ],
  "order": 1,
  "active": true,
  "project": "MR-DN",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "initialPage": "searchBeneficiary",
  "isActive": true,
  "auditDetails": {
    "createdBy": "b43b260c-f620-45d3-a43f-f53148f87f15",
    "lastModifiedBy": "f4e90853-80b7-47cc-91e7-f8cd5ec00e20",
    "createdTime": 1766988969631,
    "lastModifiedTime": 1773055228737
  }
};
