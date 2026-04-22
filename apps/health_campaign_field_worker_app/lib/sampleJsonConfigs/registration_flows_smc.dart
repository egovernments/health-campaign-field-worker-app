final dynamic sampleSmcFlows = {
  "id": "9d3a901b-d831-427b-8aeb-4bbda9ec2018",
  "tenantId": "mz",
  "schemaCode": "HCM-ADMIN-CONSOLE.FormConfigTemplate",
  "uniqueIdentifier": "REGISTRATION.MR-DN",
  "name": "REGISTRATION",
  "flows": [
    {
      "body": [
        {
          "type": "template",
          "label": "HCM_DELIVERY_SUCCESS_HEADING",
          "format": "panelCard",
          "heading": "HCM_DELIVERY_SUCCESS_HEADING",
          "fieldName": "successCard",
          "mandatory": true,
          "properties": {"type": "success"},
          "description": "HCM_DELIVERY_SUCCESS_DESCRIPTION",
          "primaryAction": {
            "type": "template",
            "label": "HCM_DELIVERY_SUCCESS_VIEW_HOUSEHOLD_BUTTON",
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
            "label": "HCM_DELIVERY_SUCCESS_GO_BACK_BUTTON",
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
          "primaryActionLabel": "HCM_DELIVERY_SUCCESS_VIEW_HOUSEHOLD_BUTTON",
          "secondaryActionLabel": "HCM_DELIVERY_SUCCESS_GO_BACK_BUTTON"
        }
      ],
      "name": "deliverySuccess",
      "order": 10,
      "footer": [],
      "header": [
        {
          "type": "template",
          "label": "HCM_COMMON_BACK_LABEL",
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
                  "key": "HCM_BENEFICIARY_NAME_LABEL",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.name.givenName}}"
                },
                {
                  "key": "HCM_BENEFICIARY_ID_TYPE_LABEL",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.identifiers.0.identifierType}}"
                },
                {
                  "key": "HCM_BENEFICIARY_ID_LABEL",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.identifiers.0.identifierId}}"
                },
                {
                  "key": "HCM_BENEFICIARY_AGE_LABEL",
                  "value":
                      "{{fn:formatDate(contextData.0.individuals.IndividualModel.dateOfBirth, 'age')}}"
                },
                {
                  "key": "HCM_BENEFICIARY_GENDER_LABEL",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.gender}}"
                },
                {
                  "key": "HCM_BENEFICIARY_MOBILE_LABEL",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.mobileNumber}}"
                },
                {
                  "key": "HCM_BENEFICIARY_REGISTRATION_DATE_LABEL",
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
                    "header": "HCM_DELIVERY_TABLE_DELIVERY_NO_HEADER",
                    "isActive": true,
                    "cellValue": "Dose {{item.id}}"
                  },
                  {
                    "header": "HCM_DELIVERY_TABLE_STATUS_HEADER",
                    "isActive": true,
                    "cellValue": {
                      "@default": "HCM_DELIVERY_STATUS_TO_BE_ADMINISTERED",
                      "@condition": [
                        {
                          "when":
                              "{{fn:isDoseCompleted(item.id, contextData.0.currentRunningCycle)}} == true",
                          "value": "HCM_DELIVERY_STATUS_ADMINISTERED"
                        },
                        {
                          "when": "{{item.id}} == {{contextData.0.nextDoseId}}",
                          "value": "HCM_DELIVERY_STATUS_TO_BE_ADMINISTERED"
                        }
                      ]
                    }
                  },
                  {
                    "header": "HCM_DELIVERY_TABLE_COMPLETED_ON_HEADER",
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
                        "value": "Cycle {{item.id}}",
                        "format": "textTemplate",
                        "fieldName": "cycleNumber",
                        "properties": {"style": "headingS"}
                      },
                      {
                        "data": {
                          "rows": "{{deliveries}}",
                          "columns": [
                            {
                              "header": "HCM_DELIVERY_TABLE_DELIVERY_NO_HEADER",
                              "isActive": true,
                              "cellValue": "Dose {{item.id}}"
                            },
                            {
                              "header": "HCM_DELIVERY_TABLE_STATUS_HEADER",
                              "isActive": true,
                              "cellValue": {
                                "@default": "HCM_DELIVERY_STATUS_PENDING",
                                "@condition": [
                                  {
                                    "when":
                                        "{{fn:isDoseCompleted(item.id, currentItem.id)}} == true",
                                    "value": "HCM_DELIVERY_STATUS_ADMINISTERED"
                                  }
                                ]
                              }
                            },
                            {
                              "header":
                                  "HCM_DELIVERY_TABLE_COMPLETED_ON_HEADER",
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
              "expandLabel": "REGISTRATION_VIEW_PAST_CYCLES",
              "collapseLabel": "REGISTRATION_HIDE_PAST_CYCLES",
              "controlsField": "pastCycles"
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
          "label": "HCM_DELIVERY_RECORD_DELIVERY_BUTTON",
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
                  },
                  {
                    "key": "eligibleProductVariants",
                    "value": "{{contextData.0.eligibleProductVariants}}"
                  },
                  {
                    "key": "selectedIndividualClientReferenceId",
                    "value": "{{navigation.selectedIndividualClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualIdentifierId",
                    "value":
                        "{{contextData.0.individuals.IndividualModel.identifiers.0.identifierId}}"
                  },
                  {
                    "key": "selectedIndividualName",
                    "value":
                        "{{contextData.0.individuals.IndividualModel.name.givenName}}"
                  },
                  {
                    "key": "selectedIndividualGender",
                    "value":
                        "{{contextData.0.individuals.IndividualModel.gender}}"
                  },
                  {
                    "key": "selectedIndividualAgeInMonths",
                    "value":
                        "{{fn:formatDate(contextData.0.individuals.IndividualModel.dateOfBirth, 'ageInMonths')}}"
                  }
                ],
                "name": "CHECKLIST",
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
          "label": "HCM_COMMON_BACK_LABEL",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "householdOverview", "type": "TEMPLATE"}
            }
          ]
        }
      ],
      "heading": "HCM_DELIVERY_BENEFICIARY_DETAILS_HEADING",
      "category": "DELIVERY",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "HCM_DELIVERY_BENEFICIARY_DETAILS_DESCRIPTION",
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
          }
        },
        "filters": [
          {
            "field": "clientReferenceId",
            "equalsFrom": "{{navigation.selectedIndividualClientReferenceId}}"
          }
        ],
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
              "equalsFrom": "individuals.clientReferenceId"
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
            "name": "hFReferral",
            "match": {
              "field": "beneficiaryId",
              "equalsFrom": "individuals.identifiers.0.identifierId"
            },
            "entity": "HFReferralModel"
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
              "context": ["{{individuals.0}}", "{{household.0}}"],
              "condition": "{{item.condition}}",
              "transformations": {
                "age": {"type": "ageInMonths", "source": "dateOfBirth"}
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
          "primary": "individual"
        }
      },
      "submitCondition": null,
      "preventScreenCapture": false
    },
    {
      "body": [
        {
          "type": "template",
          "label": "HCM_REFERRAL_SUCCESS_HEADING",
          "format": "panelCard",
          "heading": "HCM_REFERRAL_SUCCESS_HEADING",
          "fieldName": "successCard",
          "mandatory": true,
          "properties": {"type": "success"},
          "description": "ID-{{navigation.selectedIndividualIdentifierId}}",
          "primaryAction": {
            "type": "template",
            "label": "HCM_REFERRAL_SUCCESS_VIEW_HOUSEHOLD_BUTTON",
            "format": "button",
            "hidden": false,
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "data": [
                    {
                      "key": "selectedIndividualClientReferenceId",
                      "value":
                          "{{navigation.selectedIndividualClientReferenceId}}"
                    },
                    {
                      "key": "selectedIndividualIdentifierId",
                      "value": "{{navigation.selectedIndividualIdentifierId}}"
                    },
                    {
                      "key": "HouseholdClientReferenceId",
                      "value": "{{ navigation.HouseholdClientReferenceId }}"
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
            "label": "HCM_REFERRAL_SUCCESS_GO_BACK_BUTTON",
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
          "primaryActionLabel": "HCM_REFERRAL_SUCCESS_VIEW_HOUSEHOLD_BUTTON",
          "secondaryActionLabel": "HCM_REFERRAL_SUCCESS_GO_BACK_BUTTON"
        }
      ],
      "name": "referralSuccess",
      "order": 7,
      "footer": [],
      "header": [
        {
          "type": "template",
          "label": "HCM_COMMON_BACK_LABEL",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.clientReferenceId}}"
                  }
                ],
                "name": "searchBeneficiary",
                "type": "TEMPLATE"
              }
            }
          ],
          "fieldName": "referralBack",
          "mandatory": true
        }
      ],
      "category": "HFREFERRAL",
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
              "format": "row",
              "children": [
                {
                  "type": "template",
                  "label": "HCM_HOUSEHOLD_OVERVIEW_EDIT_HOUSEHOLD_BUTTON",
                  "format": "button",
                  "onAction": [
                    {
                      "actionType": "REVERSE_TRANSFORM",
                      "properties": {
                        "configName": "beneficiaryRegistration",
                        "entityTypes": ["HouseholdModel", "ProjectBeneficiaryModel"]
                      }
                    },
                    {
                      "actionType": "NAVIGATION",
                      "properties": {
                        "data": [
                          {
                            "key": "HouseholdClientReferenceId",
                            "value": "{{ context.household.clientReferenceId }}"
                          },
                          {"key": "isEdit", "value": "true"}
                        ],
                        "name": "HOUSEHOLD",
                        "type": "FORM"
                      }
                    }
                  ],
                  "fieldName": "householdEditButton",
                  "properties": {
                    "icon": "Edit",
                    "size": "large",
                    "type": "tertiary",
                    "mainAxisSize": "min",
                    "mainAxisAlignment": "center"
                  }
                }
              ],
              "properties": {"mainAxisAlignment": "end"}
            },
            {
              "data": [
                {
                  "key": "HCM_HOUSEHOLD_OVERVIEW_HEAD_LABEL",
                  "value":
                      "{{contextData.0.headIndividual.IndividualModel.name.givenName}}",
                  "isActive": true
                },
                {
                  "key": "HCM_HOUSEHOLD_OVERVIEW_SETTLEMENT_LABEL",
                  "value":
                      "{{contextData.0.household.HouseholdModel.address.locality.code}}",
                  "isActive": true
                },
                {
                  "key": "HCM_HOUSEHOLD_OVERVIEW_CHILDREN_COUNT_LABEL",
                  "value":
                      "{{contextData.0.household.HouseholdModel.additionalFields.fields.childrenCount}}",
                  "isActive": true
                },
                {
                  "key": "HCM_HOUSEHOLD_OVERVIEW_PREGNANT_WOMEN_LABEL",
                  "value":
                      "{{contextData.0.household.HouseholdModel.additionalFields.fields.pregnantWomenCount}}",
                  "isActive": true
                }
              ],
              "type": "template",
              "format": "labelPairList",
              "fieldName": "householdDetails"
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
                        "label":
                            "HCM_HOUSEHOLD_OVERVIEW_EDIT_INDIVIDUAL_BUTTON",
                        "format": "button",
                        "disabled":
                            "{{fn:disableEdit(item.task, item.hFReferral)}}==true",
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
                                {"key": "isEdit", "value": "true"},
                                {
                                  "key": "headMobileNumber",
                                  "value":
                                      "{{contextData.0.headIndividual.IndividualModel.mobileNumber}}"
                                }
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
                    "fieldName": "individualRow",
                    "properties": {
                      "bottomGap": 16,
                      "mainAxisSize": "max",
                      "mainAxisAlignment": "spaceBetween"
                    }
                  },
                  {
                    "type": "template",
                    "value":
                        "{{item.individual.0.gender }} | {{fn:formatDate(item.individual.0.dateOfBirth, 'age')}}",
                    "format": "textTemplate",
                    "fieldName": "genderAge",
                    "properties": {"bottomGap": 16}
                  },
                  {
                    "type": "template",
                    "label": "HCM_HOUSEHOLD_OVERVIEW_HEAD_TAG",
                    "format": "tag",
                    "visible": "{{item.member.0.isHeadOfHousehold}}==true",
                    "fieldName": "headOfHouseholdTag",
                    "properties": {"tagType": "info", "bottomGap": 16}
                  },
                  {
                    "type": "template",
                    "label": "HCM_HOUSEHOLD_OVERVIEW_NOT_ELIGIBLE_TAG",
                    "format": "tag",
                    "visible":
                        "{{fn:checkEligibilityForAgeAndSideEffect(item.individual.0.dateOfBirth, item.task)}}==false && {{item.member.0.isHeadOfHousehold}}==false",
                    "fieldName": "notEligible",
                    "properties": {"tagType": "error"}
                  },
                  {
                    "type": "template",
                    "label": "HCM_HOUSEHOLD_OVERVIEW_BENEFICIARY_REFERRED_TAG",
                    "format": "tag",
                    "visible":
                        "{{fn:hasReferralForCurrentCycle(item.hFReferral)}}==true && {{item.member.0.isHeadOfHousehold}}==false",
                    "fieldName": "beneficiaryReferred",
                    "properties": {"tagType": "error"}
                  },
                  {
                    "type": "template",
                    "label": "HCM_HOUSEHOLD_OVERVIEW_ADMINISTERED_SUCCESS_TAG",
                    "format": "tag",
                    "visible":
                        "{{fn:isDelivered(item.task.last.status)}}==true && {{fn:checkEligibilityForAgeAndSideEffect(item.individual.0.dateOfBirth, item.task)}}==true && {{fn:hasReferralForCurrentCycle(item.hFReferral)}}==false && {{item.member.0.isHeadOfHousehold}}==false",
                    "fieldName": "administrationSuccess",
                    "properties": {"tagType": "success", "bottomGap": 16}
                  },
                  {
                    "type": "template",
                    "label": "HCM_HOUSEHOLD_OVERVIEW_NOT_VISITED_TAG",
                    "format": "tag",
                    "visible":
                        "{{fn:checkEligibilityForAgeAndSideEffect(item.individual.0.dateOfBirth, item.task)}}==true && {{fn:isDelivered(item.task.last.status)}}==false && {{fn:hasReferralForCurrentCycle(item.hFReferral)}}==false && {{item.member.0.isHeadOfHousehold}}==false",
                    "fieldName": "notVisited",
                    "properties": {"tagType": "info", "bottomGap": 16}
                  },
                  {
                    "type": "template",
                    "label":
                        "HCM_HOUSEHOLD_OVERVIEW_DELIVER_INTERVENTION_BUTTON",
                    "format": "button",
                    "visible":
                        "{{fn:checkEligibilityForAgeAndSideEffect(item.individual.0.dateOfBirth, item.task)}} == true  && {{fn:checkAllDoseDelivered(item.task)}} == false && {{fn:hasReferralForCurrentCycle(item.hFReferral)}}==false && {{item.member.0.isHeadOfHousehold}}==false",
                    "onAction": [
                      {
                        "actionType": "NAVIGATION",
                        "properties": {
                          "data": [
                            {
                              "key": "selectedIndividualClientReferenceId",
                              "value": "{{item.individual.0.clientReferenceId}}"
                            },
                            {
                              "key": "selectedIndividualIdentifierId",
                              "value":
                                  "{{item.individual.0.identifiers.0.identifierId}}"
                            },
                            {
                              "key": "HouseholdClientReferenceId",
                              "value":
                                  "{{item.member.0.householdClientReferenceId}}"
                            },
                            {
                              "key": "ProjectBeneficiaryClientReferenceId",
                              "value":
                                  "{{item.projectBeneficiary.0.clientReferenceId}}"
                            },
                            {
                              "key": "selectedIndividualName",
                              "value": "{{item.individual.0.name.givenName}}"
                            },
                            {
                              "key": "selectedIndividualGender",
                              "value": "{{item.individual.0.gender}}"
                            },
                            {
                              "key": "selectedIndividualAgeInMonths",
                              "value":
                                  "{{fn:formatDate(item.individual.0.dateOfBirth, 'ageInMonths')}}"
                            },
                            {
                              "key": "cycleIndex",
                              "value": "{{contextData.0.currentRunningCycle}}"
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
                  },
                  {
                    "icon": "add",
                    "type": "template",
                    "label": "HCM_HOUSEHOLD_OVERVIEW_VIEW_DETAILS_BUTTON",
                    "format": "button",
                    "visible":
                        "{{fn:checkEligibilityForAgeAndSideEffect(item.individual.0.dateOfBirth, item.task)}} == true &&  {{fn:checkAllDoseDelivered(item.task)}} == true && {{fn:hasReferralForCurrentCycle(item.hFReferral)}}==false && {{item.member.0.isHeadOfHousehold}}==false",
                    "onAction": [
                      {
                        "actionType": "NAVIGATION",
                        "properties": {
                          "data": [
                            {
                              "key": "selectedIndividualClientReferenceId",
                              "value": "{{item.individual.0.clientReferenceId}}"
                            },
                            {
                              "key": "selectedIndividualIdentifierId",
                              "value":
                                  "{{item.individual.0.identifiers.0.identifierId}}"
                            },
                            {
                              "key": "HouseholdClientReferenceId",
                              "value":
                                  "{{item.member.0.householdClientReferenceId}}"
                            },
                            {
                              "key": "ProjectBeneficiaryClientReferenceId",
                              "value":
                                  "{{item.projectBeneficiary.0.clientReferenceId}}"
                            },
                            {
                              "key": "selectedIndividualName",
                              "value": "{{item.individual.0.name.givenName}}"
                            },
                            {
                              "key": "selectedIndividualGender",
                              "value": "{{item.individual.0.gender}}"
                            },
                            {
                              "key": "selectedIndividualAgeInMonths",
                              "value":
                                  "{{fn:formatDate(item.individual.0.dateOfBirth, 'ageInMonths')}}"
                            },
                            {
                              "key": "cycleIndex",
                              "value": "{{contextData.0.currentRunningCycle}}"
                            }
                          ],
                          "name": "beneficiaryDetails",
                          "type": "TEMPLATE"
                        }
                      }
                    ],
                    "fieldName": "viewDetails",
                    "properties": {
                      "size": "medium",
                      "type": "secondary",
                      "mainAxisSize": "max",
                      "mainAxisAlignment": "center"
                    }
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
              "hidden": false,
              "fieldName": "listViewMembers",
              "dataSource": "members",
              "properties": {"spacing": "spacer4"}
            },
            {
              "type": "template",
              "label": "HCM_HOUSEHOLD_OVERVIEW_ADD_MEMBERS_BUTTON",
              "format": "button",
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "data": [
                      {
                        "key": "HouseholdClientReferenceId",
                        "value":
                            "{{contextData.0.household.HouseholdModel.clientReferenceId}}"
                      },
                      {
                        "key": "headMobileNumber",
                        "value":
                            "{{contextData.0.headIndividual.IndividualModel.mobileNumber}}"
                      }
                    ],
                    "name": "ADD_MEMBER",
                    "type": "FORM"
                  }
                }
              ],
              "fieldName": "addMember",
              "properties": {
                "icon": "AddIcon",
                "size": "medium",
                "type": "tertiary",
                "mainAxisSize": "min",
                "mainAxisAlignment": "center"
              }
            }
          ],
          "properties": {"type": "primary", "cardType": "primary"},
          "schemaCode": null
        }
      ],
      "name": "householdOverview",
      "order": 3,
      "footer": [],
      "header": [
        {
          "label": "HCM_COMMON_BACK_LABEL",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {"name": "searchBeneficiary", "type": "TEMPLATE"}
            }
          ]
        }
      ],
      "heading": "HCM_HOUSEHOLD_OVERVIEW_HEADING",
      "category": "REGISTRATION",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "HCM_HOUSEHOLD_OVERVIEW_DESCRIPTION",
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
            "task",
            "hFReferral"
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
          "label": "HCM_SEARCH_NEARBY_HOUSEHOLDS_LABEL",
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
          "label": "HCM_SEARCH_NAME_LABEL",
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
          "validations": [
            {"type": "minSearchChars", "value": 2}
          ],
          "minSearchChars": 2
        },
        {
          "icon": "FilterAlt",
          "type": "template",
          "label": "HCM_SEARCH_FILTER_LABEL",
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
                      "name": "HCM_SEARCH_FILTER_ADMINISTRATION_SUCCESS"
                    },
                    {
                      "code": "CLOSED_HOUSEHOLD",
                      "name": "HCM_SEARCH_FILTER_MISSED_CHILDREN"
                    }
                  ],
                  "format": "selectionCard",
                  "fieldName": "selectedStatus"
                }
              ],
              "type": "default",
              "title": "HCM_SEARCH_FILTER_LABEL",
              "titleIcon": "FilterAlt",
              "footerActions": [
                {
                  "type": "template",
                  "label": "HCM_SEARCH_FILTER_CLEAR_ALL_BUTTON",
                  "format": "button",
                  "onAction": [
                    {
                      "actionType": "CLEAR_STATE",
                      "properties": {
                        "name": "task",
                        "filterKeys": [
                          "status",
                          "projectBeneficiary",
                          "projectId",
                          "clientReferenceId"
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
                  "label": "HCM_SEARCH_FILTER_APPLY_BUTTON",
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
                          "projectId",
                          "clientReferenceId"
                        ]
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
                            "selectedStatus == ADMINISTRATION_SUCCESS || selectedStatus == CLOSED_HOUSEHOLD || selectedStatus == ADMINISTRATION_FAILED || selectedStatus == INELIGIBLE"
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
                                "root": "hFReferral",
                                "value": "{{singleton.selectedProject.id}}",
                                "operation": "equals"
                              }
                            ]
                          }
                        }
                      ],
                      "condition": {
                        "expression": "selectedStatus == BENEFICIARY_REFERRED"
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
          "schemaCode": null,
          "suffixIcon": "FilterAlt"
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
                    "label": "HCM_SEARCH_OPEN_BUTTON",
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
                      "header": "HCM_SEARCH_TABLE_BENEFICIARY_HEADER",
                      "hidden": false,
                      "isActive": true,
                      "cellValue": "{{item.name.givenName}}"
                    },
                    {
                      "header": "HCM_SEARCH_TABLE_AGE_HEADER",
                      "hidden": false,
                      "isActive": true,
                      "cellValue": "{{fn:formatDate(item.dateOfBirth, 'age')}}"
                    },
                    {
                      "header": "HCM_SEARCH_TABLE_GENDER_HEADER",
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
          "label": "HCM_SEARCH_REGISTER_BENEFICIARY_BUTTON",
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
          "isGS1": false,
          "label": "HCM_SEARCH_SCAN_BENEFICIARY_BUTTON",
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
          "scanLimit": 1,
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
              "message": "Scan limit shouldn't be greater than 1"
            },
            {"type": "isGS1", "value": false}
          ],
          "scanLimit.message": "SCANLIMIT_ERROR_MESSAGE"
        }
      ],
      "header": [
        {
          "label": "HCM_COMMON_BACK_LABEL",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "HOME", "type": "HOME"}
            }
          ]
        }
      ],
      "heading": "HCM_SEARCH_BENEFICIARY_HEADING",
      "category": "REGISTRATION",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "HCM_SEARCH_BENEFICIARY_DESCRIPTION",
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
              "inFrom": "individuals.clientReferenceId"
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
          "pagination": {"limit": 5, "maxItems": 15},
          "baseFilters": [
            {
              "key": "localityBoundaryCode",
              "root": "address",
              "value": "{{singleton.boundary.code}}",
              "operation": "equals"
            }
          ]
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
          "body": null,
          "flow": "DELIVERY",
          "page": "DeliveryDetails",
          "type": "object",
          "label": "HCM_DELIVERY_DETAILS_HEADING",
          "order": 1,
          "footer": [
            {
              "label": "HCM_DELIVERY_SAVE_BUTTON",
              "format": "button",
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "name": "DeliveryChecklist",
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
          "heading": "HCM_DELIVERY_DETAILS_HEADING",
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
                  {"key": "doseIndex", "value": "{{navigation.doseIndex}}"},
                  {
                    "key": "deliveryStrategy",
                    "value": "{{navigation.deliveryStrategy}}"
                  }
                ],
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
                  }
                ],
                "configName": "delivery"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "TaskModel",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "HCM_ERROR_CREATE_HOUSEHOLD"}
                  }
                ]
              }
            },
            {
              "actions": [
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "data": [
                      {
                        "key": "ProjectBeneficiaryClientReferenceId",
                        "value":
                            "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                      },
                      {
                        "key": "cycleIndex",
                        "value": "{{navigation.cycleIndex}}"
                      },
                      {
                        "key": "deliveryStrategy",
                        "value": "{{navigation.deliveryStrategy}}"
                      },
                      {
                        "key": "futureDoses",
                        "value": "{{navigation.futureDoses}}"
                      }
                    ],
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {
                          "message": "HCM_ERROR_FETCH_BULK_DELIVERY_CONFIG"
                        }
                      }
                    ],
                    "configName": "indirectBulkDelivery"
                  }
                },
                {
                  "actionType": "CREATE_EVENT",
                  "properties": {
                    "entity": "TaskModel",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "HCM_ERROR_CREATE_BULK_TASKS"}
                      }
                    ]
                  }
                }
              ],
              "condition": {"expression": "doseIndex == 1"}
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
                    "properties": {"message": "HCM_ERROR_NAVIGATION"}
                  }
                ],
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "householdOverview"
              }
            }
          ],
          "navigateTo": {
            "name": "DeliveryChecklist",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "label": "HCM_DELIVERY_DATE_LABEL",
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
              "label": "HCM_DELIVERY_RESOURCE_LABEL",
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
                  "message": "HCM_DELIVERY_RESOURCE_REQUIRED_MESSAGE"
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "SP1", "name": "SP1"},
                {"code": "SP2", "name": "SP2"},
                {"code": "AQ1", "name": "AQ1"},
                {"code": "AQ2", "name": "AQ2"}
              ],
              "includeInSummary": true,
              "required.message": "HCM_DELIVERY_RESOURCE_REQUIRED_MESSAGE"
            },
            {
              "type": "string",
              "label": "HCM_DELIVERY_COMMENTS_LABEL",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "isMdms": true,
              "tooltip": "",
              "helpText": "",
              "enums": [
                {
                  "code": "SUCCESSFUL_DELIVERY",
                  "name": "HCM_DELIVERY_COMMENT_SUCCESSFUL"
                },
                {
                  "code": "INSUFFICIENT_RESOURCES",
                  "name": "HCM_DELIVERY_COMMENT_INSUFFICIENT"
                },
                {
                  "code": "BENEFICIARY_REFUSED",
                  "name": "HCM_DELIVERY_COMMENT_REFUSED"
                },
                {
                  "code": "BENEFICIARY_ABSENT",
                  "name": "HCM_DELIVERY_COMMENT_ABSENT"
                }
              ],
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
              "label": "HCM_DELIVERY_SCAN_LABEL",
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
            },
            {
              "type": "string",
              "label": "HCM_DELIVERY_LAT_LONG_LABEL",
              "order": 5,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
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
                  "message": "HCM_VALIDATION_REQUIRED_FIELD"
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_REQUIRED_FIELD"
            }
          ],
          "actionLabel": "HCM_DELIVERY_SAVE_BUTTON",
          "description": "HCM_DELIVERY_DETAILS_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false
        },
        {
          "body": null,
          "flow": "DELIVERY",
          "page": "DeliveryChecklist",
          "type": "object",
          "label": "HCM_DELIVERY_CHECKLIST_HEADING",
          "order": 2,
          "footer": [
            {
              "label": "HCM_DELIVERY_CHECKLIST_SUBMIT_BUTTON",
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
          "heading": "HCM_DELIVERY_CHECKLIST_HEADING",
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
                  {"key": "doseIndex", "value": "{{navigation.doseIndex}}"},
                  {
                    "key": "deliveryStrategy",
                    "value": "{{navigation.deliveryStrategy}}"
                  }
                ],
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
                  }
                ],
                "configName": "delivery"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "TaskModel",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "HCM_ERROR_CREATE_HOUSEHOLD"}
                  }
                ]
              }
            },
            {
              "actions": [
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "data": [
                      {
                        "key": "ProjectBeneficiaryClientReferenceId",
                        "value":
                            "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                      },
                      {
                        "key": "cycleIndex",
                        "value": "{{navigation.cycleIndex}}"
                      },
                      {
                        "key": "deliveryStrategy",
                        "value": "{{navigation.deliveryStrategy}}"
                      },
                      {
                        "key": "futureDoses",
                        "value": "{{navigation.futureDoses}}"
                      }
                    ],
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {
                          "message": "HCM_ERROR_FETCH_BULK_DELIVERY_CONFIG"
                        }
                      }
                    ],
                    "configName": "indirectBulkDelivery"
                  }
                },
                {
                  "actionType": "CREATE_EVENT",
                  "properties": {
                    "entity": "TaskModel",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "HCM_ERROR_CREATE_BULK_TASKS"}
                      }
                    ]
                  }
                }
              ],
              "condition": {"expression": "doseIndex == 1"}
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
                    "properties": {"message": "HCM_ERROR_NAVIGATION"}
                  }
                ],
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "householdOverview"
              }
            }
          ],
          "navigateTo": {
            "name": "household-acknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "boolean",
              "label": "HCM_DELIVERY_CHECKLIST_ACTION_GIVE_TABLET",
              "order": 1,
              "value": "",
              "format": "checkbox",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "ACTION1",
              "required": true,
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "HCM_DELIVERY_CHECKLIST_ACTION_REQUIRED_MESSAGE"
                }
              ],
              "errorMessage": ""
            },
            {
              "type": "boolean",
              "label": "HCM_DELIVERY_CHECKLIST_ACTION_WRITE_CODE",
              "order": 2,
              "value": "",
              "format": "checkbox",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "ACTION2",
              "required": true,
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "HCM_DELIVERY_CHECKLIST_ACTION_REQUIRED_MESSAGE"
                }
              ],
              "errorMessage": ""
            },
            {
              "type": "boolean",
              "label": "HCM_DELIVERY_CHECKLIST_ACTION_SPAQ",
              "order": 3,
              "value": "",
              "format": "checkbox",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "ACTION3",
              "required": true,
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "HCM_DELIVERY_CHECKLIST_ACTION_REQUIRED_MESSAGE"
                }
              ],
              "errorMessage": ""
            }
          ],
          "actionLabel": "HCM_DELIVERY_CHECKLIST_SUBMIT_BUTTON",
          "description": "HCM_DELIVERY_CHECKLIST_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false
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
              {"key": "doseIndex", "value": "{{navigation.doseIndex}}"},
              {
                "key": "deliveryStrategy",
                "value": "{{navigation.deliveryStrategy}}"
              }
            ],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
              }
            ],
            "configName": "delivery"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "TaskModel",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "HCM_ERROR_CREATE_HOUSEHOLD"}
              }
            ]
          }
        },
        {
          "actions": [
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
                  {
                    "key": "deliveryStrategy",
                    "value": "{{navigation.deliveryStrategy}}"
                  },
                  {"key": "futureDoses", "value": "{{navigation.futureDoses}}"}
                ],
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {
                      "message": "HCM_ERROR_FETCH_BULK_DELIVERY_CONFIG"
                    }
                  }
                ],
                "configName": "indirectBulkDelivery"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "TaskModel",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "HCM_ERROR_CREATE_BULK_TASKS"}
                  }
                ]
              }
            }
          ],
          "condition": {"expression": "doseIndex == 1"}
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
                "properties": {"message": "HCM_ERROR_NAVIGATION"}
              }
            ],
            "navigationMode": "popUntilAndPush",
            "popUntilPageName": "householdOverview"
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
      "name": "CHECKLIST",
      "order": 6,
      "pages": [
        {
          "body": null,
          "flow": "CHECKLIST",
          "page": "eligibilityChecklist",
          "type": "object",
          "label": "HCM_ELIGIBILITY_CHECKLIST_HEADING",
          "order": 1,
          "footer": [
            {
              "label": "HCM_ELIGIBILITY_CHECKLIST_SUBMIT_BUTTON",
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
          "heading": "HCM_ELIGIBILITY_CHECKLIST_HEADING",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actions": [
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
                      },
                      {
                        "key": "cycleIndex",
                        "value": "{{navigation.cycleIndex}}"
                      },
                      {
                        "key": "doseIndex",
                        "value": "{{navigation.doseIndex}}"
                      },
                      {
                        "key": "deliveryStrategy",
                        "value": "{{navigation.deliveryStrategy}}"
                      },
                      {
                        "key": "totalDosesInCycle",
                        "value": "{{navigation.totalDosesInCycle}}"
                      },
                      {
                        "key": "futureDoses",
                        "value": "{{navigation.futureDoses}}"
                      },
                      {
                        "key": "eligibleProductVariants",
                        "value": "{{navigation.eligibleProductVariants}}"
                      }
                    ],
                    "name": "DELIVERY",
                    "type": "FORM",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "HCM_ERROR_NAVIGATION"}
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "householdOverview"
                  }
                }
              ],
              "condition": {
                "expression":
                    "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==NO"
              }
            },
            {
              "actions": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "data": [
                      {"key": "ec1", "value": "{{eligibilityChecklist.ec1}}"},
                      {"key": "ec2", "value": "{{eligibilityChecklist.ec2}}"},
                      {"key": "ec3", "value": "{{eligibilityChecklist.ec3}}"},
                      {"key": "ec4", "value": "{{eligibilityChecklist.ec4}}"},
                      {"key": "sourceFlow", "value": "CHECKLIST"},
                      {
                        "key": "selectedIndividualClientReferenceId",
                        "value":
                            "{{navigation.selectedIndividualClientReferenceId}}"
                      },
                      {
                        "key": "selectedIndividualIdentifierId",
                        "value":
                            "{{navigation.selectedIndividualIdentifierId}}"
                      },
                      {
                        "key": "HouseholdClientReferenceId",
                        "value": "{{navigation.HouseholdClientReferenceId}}"
                      },
                      {
                        "key": "ProjectBeneficiaryClientReferenceId",
                        "value":
                            "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                      },
                      {
                        "key": "selectedIndividualName",
                        "value": "{{navigation.selectedIndividualName}}"
                      },
                      {
                        "key": "selectedIndividualGender",
                        "value": "{{navigation.selectedIndividualGender}}"
                      },
                      {
                        "key": "selectedIndividualAgeInMonths",
                        "value":
                            "{{navigation.selectedIndividualAgeInMonths}}"
                      },
                      {
                        "key": "cycleIndex",
                        "value": "{{navigation.cycleIndex}}"
                      }
                    ],
                    "name": "REFER_BENEFICIARY",
                    "type": "FORM",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "HCM_ERROR_NAVIGATION"}
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "householdOverview"
                  }
                }
              ],
              "condition": {
                "expression":
                    "eligibilityChecklist.ec1==YES && eligibilityChecklist.ec3==YES && eligibilityChecklist.ec4==YES"
              }
            },
            {
              "actions": [
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "data": [
                      {
                        "key": "selectedIndividualClientReferenceId",
                        "value":
                            "{{navigation.selectedIndividualClientReferenceId}}"
                      },
                      {
                        "key": "selectedIndividualIdentifierId",
                        "value":
                            "{{navigation.selectedIndividualIdentifierId}}"
                      },
                      {
                        "key": "HouseholdClientReferenceId",
                        "value": "{{navigation.HouseholdClientReferenceId}}"
                      },
                      {
                        "key": "ProjectBeneficiaryClientReferenceId",
                        "value":
                            "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                      }
                    ],
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {
                          "message": "HCM_ERROR_FETCH_CONFIG"
                        }
                      }
                    ],
                    "configName": "ineligibleConfig"
                  }
                },
                {
                  "actionType": "CREATE_EVENT",
                  "properties": {
                    "entity": "TASK",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {
                          "message": "HCM_ERROR_CREATE_STOCK"
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
                        "key": "selectedIndividualClientReferenceId",
                        "value":
                            "{{navigation.selectedIndividualClientReferenceId}}"
                      },
                      {
                        "key": "selectedIndividualIdentifierId",
                        "value":
                            "{{navigation.selectedIndividualIdentifierId}}"
                      },
                      {
                        "key": "HouseholdClientReferenceId",
                        "value": "{{navigation.HouseholdClientReferenceId}}"
                      },
                      {
                        "key": "ProjectBeneficiaryClientReferenceId",
                        "value":
                            "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                      }
                    ],
                    "name": "householdOverview",
                    "type": "TEMPLATE",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {
                          "message": "HCM_ERROR_NAVIGATION"
                        }
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "householdOverview"
                  }
                }
              ],
              "condition": {
                "expression":
                    "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==YES"
              }
            },
            {
              "actions": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "data": [
                      {"key": "ec1", "value": "{{eligibilityChecklist.ec1}}"},
                      {"key": "ec2", "value": "{{eligibilityChecklist.ec2}}"},
                      {"key": "ec3", "value": "{{eligibilityChecklist.ec3}}"},
                      {"key": "ec4", "value": "{{eligibilityChecklist.ec4}}"},
                      {"key": "sourceFlow", "value": "CHECKLIST"},
                      {
                        "key": "selectedIndividualClientReferenceId",
                        "value":
                            "{{navigation.selectedIndividualClientReferenceId}}"
                      },
                      {
                        "key": "selectedIndividualIdentifierId",
                        "value":
                            "{{navigation.selectedIndividualIdentifierId}}"
                      },
                      {
                        "key": "HouseholdClientReferenceId",
                        "value": "{{navigation.HouseholdClientReferenceId}}"
                      },
                      {
                        "key": "ProjectBeneficiaryClientReferenceId",
                        "value":
                            "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                      },
                      {
                        "key": "selectedIndividualName",
                        "value": "{{navigation.selectedIndividualName}}"
                      },
                      {
                        "key": "selectedIndividualGender",
                        "value": "{{navigation.selectedIndividualGender}}"
                      },
                      {
                        "key": "selectedIndividualAgeInMonths",
                        "value":
                            "{{navigation.selectedIndividualAgeInMonths}}"
                      },
                      {
                        "key": "cycleIndex",
                        "value": "{{navigation.cycleIndex}}"
                      }
                    ],
                    "name": "REFER_BENEFICIARY",
                    "type": "FORM",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "HCM_ERROR_NAVIGATION"}
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "householdOverview"
                  }
                }
              ],
              "condition": {"expression": "DEFAULT"}
            }
          ],
          "navigateTo": {
            "name": "household-acknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "HCM_ELIGIBILITY_QUESTION_YES"},
                {"code": "NO", "name": "HCM_ELIGIBILITY_QUESTION_NO"}
              ],
              "label": "HCM_ELIGIBILITY_CHECKLIST_QUESTION_1_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "ec1",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HCM_ELIGIBILITY_CHECKLIST_QUESTION_REQUIRED_MESSAGE"
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "HCM_ELIGIBILITY_QUESTION_YES"},
                {"code": "NO", "name": "HCM_ELIGIBILITY_QUESTION_NO"}
              ],
              "includeInSummary": true
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "HCM_ELIGIBILITY_QUESTION_YES"},
                {"code": "NO", "name": "HCM_ELIGIBILITY_QUESTION_NO"}
              ],
              "label": "HCM_ELIGIBILITY_CHECKLIST_QUESTION_2_LABEL",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "ec2",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HCM_ELIGIBILITY_CHECKLIST_QUESTION_REQUIRED_MESSAGE"
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "HCM_ELIGIBILITY_QUESTION_YES"},
                {"code": "NO", "name": "HCM_ELIGIBILITY_QUESTION_NO"}
              ],
              "includeInSummary": true,
              "visibilityCondition": {
                "expression": [
                  {"condition": "eligibilityChecklist.ec1=='YES'"}
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "HCM_ELIGIBILITY_QUESTION_YES"},
                {"code": "NO", "name": "HCM_ELIGIBILITY_QUESTION_NO"}
              ],
              "label": "HCM_ELIGIBILITY_CHECKLIST_QUESTION_3_LABEL",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "ec3",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HCM_ELIGIBILITY_CHECKLIST_QUESTION_REQUIRED_MESSAGE"
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "HCM_ELIGIBILITY_QUESTION_YES"},
                {"code": "NO", "name": "HCM_ELIGIBILITY_QUESTION_NO"}
              ],
              "includeInSummary": true
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "HCM_ELIGIBILITY_QUESTION_YES"},
                {"code": "NO", "name": "HCM_ELIGIBILITY_QUESTION_NO"}
              ],
              "label": "HCM_ELIGIBILITY_CHECKLIST_QUESTION_4_LABEL",
              "order": 4,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "ec4",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HCM_ELIGIBILITY_CHECKLIST_QUESTION_REQUIRED_MESSAGE"
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "HCM_ELIGIBILITY_QUESTION_YES"},
                {"code": "NO", "name": "HCM_ELIGIBILITY_QUESTION_NO"}
              ],
              "includeInSummary": true
            }
          ],
          "actionLabel": "HCM_ELIGIBILITY_CHECKLIST_SUBMIT_BUTTON",
          "description": "HCM_ELIGIBILITY_CHECKLIST_DESCRIPTION",
          "showTabView": false,
          "showAlertPopUp": {
            "title": "HCM_ELIGIBILITY_CHECKLIST_ALERT_TITLE",
            "conditions": [
              {
                "value": "To Administer",
                "expression":
                    "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==NO"
              },
              {
                "value": "Ineligible flow",
                "expression":
                    "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==YES"
              },
              {"value": "referral flow", "expression": "DEFAULT"}
            ],
            "description": "HCM_ELIGIBILITY_CHECKLIST_ALERT_DESCRIPTION",
            "primaryActionLabel": "HCM_ACTION_SUBMIT",
            "secondaryActionLabel": "HCM_ACTION_CANCEL"
          },
          "submitCondition": null,
          "preventScreenCapture": false
        }
      ],
      "summary": false,
      "version": 3,
      "category": "DELIVERY",
      "disabled": false,
      "onAction": [
        {
          "actions": [
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
                  },
                  {
                    "key": "cycleIndex",
                    "value": "{{navigation.cycleIndex}}"
                  },
                  {
                    "key": "doseIndex",
                    "value": "{{navigation.doseIndex}}"
                  },
                  {
                    "key": "deliveryStrategy",
                    "value": "{{navigation.deliveryStrategy}}"
                  },
                  {
                    "key": "totalDosesInCycle",
                    "value": "{{navigation.totalDosesInCycle}}"
                  },
                  {
                    "key": "futureDoses",
                    "value": "{{navigation.futureDoses}}"
                  },
                  {
                    "key": "eligibleProductVariants",
                    "value": "{{navigation.eligibleProductVariants}}"
                  }
                ],
                "name": "DELIVERY",
                "type": "FORM",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "HCM_ERROR_NAVIGATION"}
                  }
                ],
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "householdOverview"
              }
            }
          ],
          "condition": {
            "expression":
                "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==NO"
          }
        },
        {
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {"key": "ec1", "value": "{{eligibilityChecklist.ec1}}"},
                  {"key": "ec2", "value": "{{eligibilityChecklist.ec2}}"},
                  {"key": "ec3", "value": "{{eligibilityChecklist.ec3}}"},
                  {"key": "ec4", "value": "{{eligibilityChecklist.ec4}}"},
                  {"key": "sourceFlow", "value": "CHECKLIST"},
                  {
                    "key": "selectedIndividualClientReferenceId",
                    "value":
                        "{{navigation.selectedIndividualClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualIdentifierId",
                    "value":
                        "{{navigation.selectedIndividualIdentifierId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualName",
                    "value": "{{navigation.selectedIndividualName}}"
                  },
                  {
                    "key": "selectedIndividualGender",
                    "value": "{{navigation.selectedIndividualGender}}"
                  },
                  {
                    "key": "selectedIndividualAgeInMonths",
                    "value":
                        "{{navigation.selectedIndividualAgeInMonths}}"
                  },
                  {
                    "key": "cycleIndex",
                    "value": "{{navigation.cycleIndex}}"
                  }
                ],
                "name": "REFER_BENEFICIARY",
                "type": "FORM",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "HCM_ERROR_NAVIGATION"}
                  }
                ],
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "householdOverview"
              }
            }
          ],
          "condition": {
            "expression":
                "eligibilityChecklist.ec1==YES && eligibilityChecklist.ec3==YES && eligibilityChecklist.ec4==YES"
          }
        },
        {
          "actions": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "data": [
                  {
                    "key": "selectedIndividualClientReferenceId",
                    "value":
                        "{{navigation.selectedIndividualClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualIdentifierId",
                    "value":
                        "{{navigation.selectedIndividualIdentifierId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                  }
                ],
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {
                      "message": "HCM_ERROR_FETCH_CONFIG"
                    }
                  }
                ],
                "configName": "ineligibleConfig"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "TASK",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {
                      "message": "HCM_ERROR_CREATE_STOCK"
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
                    "key": "selectedIndividualClientReferenceId",
                    "value":
                        "{{navigation.selectedIndividualClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualIdentifierId",
                    "value":
                        "{{navigation.selectedIndividualIdentifierId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                  }
                ],
                "name": "householdOverview",
                "type": "TEMPLATE",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {
                      "message": "HCM_ERROR_NAVIGATION"
                    }
                  }
                ],
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "householdOverview"
              }
            }
          ],
          "condition": {
            "expression":
                "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==YES"
          }
        },
        {
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {"key": "ec1", "value": "{{eligibilityChecklist.ec1}}"},
                  {"key": "ec2", "value": "{{eligibilityChecklist.ec2}}"},
                  {"key": "ec3", "value": "{{eligibilityChecklist.ec3}}"},
                  {"key": "ec4", "value": "{{eligibilityChecklist.ec4}}"},
                  {"key": "sourceFlow", "value": "CHECKLIST"},
                  {
                    "key": "selectedIndividualClientReferenceId",
                    "value":
                        "{{navigation.selectedIndividualClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualIdentifierId",
                    "value":
                        "{{navigation.selectedIndividualIdentifierId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualName",
                    "value": "{{navigation.selectedIndividualName}}"
                  },
                  {
                    "key": "selectedIndividualGender",
                    "value": "{{navigation.selectedIndividualGender}}"
                  },
                  {
                    "key": "selectedIndividualAgeInMonths",
                    "value":
                        "{{navigation.selectedIndividualAgeInMonths}}"
                  },
                  {
                    "key": "cycleIndex",
                    "value": "{{navigation.cycleIndex}}"
                  }
                ],
                "name": "REFER_BENEFICIARY",
                "type": "FORM",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "HCM_ERROR_NAVIGATION"}
                  }
                ],
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "householdOverview"
              }
            }
          ],
          "condition": {"expression": "DEFAULT"}
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
          "body": null,
          "flow": "ADD_MEMBER",
          "page": "beneficiaryDetails",
          "type": "object",
          "label": "HCM_ADD_MEMBER_HEADING",
          "order": 4,
          "footer": [
            {
              "label": "HCM_ADD_MEMBER_SAVE_BUTTON",
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
          "heading": "HCM_ADD_MEMBER_HEADING",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.HouseholdClientReferenceId}}"
                  },
                  {
                    "key": "headMobileNumber",
                    "value": "{{navigation.headMobileNumber}}"
                  }
                ],
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
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
                  "properties": {
                    "entity": "INDIVIDUAL, PROJECTBENEFICIARY, MEMBER"
                  }
                }
              ],
              "condition": {"expression": "DEFAULT"}
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
                    "properties": {"message": "HCM_ERROR_NAVIGATION"}
                  }
                ],
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary"
              }
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
              "label": "HCM_REGISTRATION_FIRST_NAME_LABEL",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
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
                "errorMessage": "HCM_VALIDATION_SIZE_2_TO_200"
              },
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "HCM_VALIDATION_REQUIRED_FIELD"
                },
                {
                  "type": "minLength",
                  "value": "2",
                  "message": "HCM_VALIDATION_SIZE_2_TO_200"
                },
                {
                  "type": "maxLength",
                  "value": "200",
                  "message": "HCM_VALIDATION_SIZE_2_TO_200"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_REQUIRED_FIELD"
            },
            {
              "type": "string",
              "label": "HCM_REGISTRATION_FAMILY_NAME_LABEL",
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
              "lengthRange": {
                "minLength": "2",
                "errorMessage": "HCM_VALIDATION_MIN_2_CHARS"
              },
              "validations": [
                {
                  "type": "minLength",
                  "value": "2",
                  "message": "HCM_VALIDATION_MIN_2_CHARS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "enums": [
                {"code": "DEFAULT", "name": "Default"}
              ],
              "label": "HCM_REGISTRATION_ID_POPULATOR_LABEL",
              "order": 3,
              "value": "DEFAULT",
              "format": "idPopulator",
              "hidden": false,
              "isMdms": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "identifiers",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.ID_TYPE_OPTIONS_POPULATOR",
              "systemDate": false,
              "validations": [
                {"type": "required", "value": true, "message": "ID is required"}
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "DEFAULT", "name": "Default"},
                {
                  "code": "UNIQUE_BENEFICIARY_ID",
                  "name": "Unique Beneficiary ID"
                },
                {"code": "OTHER", "name": "HCM_COMMON_OTHER"}
              ],
              "required.message": "ID is required"
            },
            {
              "type": "string",
              "label": "HCM_REGISTRATION_DOB_LABEL",
              "order": 4,
              "value": "",
              "format": "dob",
              "hidden": false,
              "isMdms": false,
              "tooltip": "HCM_REGISTRATION_DOB_TOOLTIP",
              "ageRange": {
                "maxAge": 1800,
                "minAge": 3,
                "errorMessage": "HCM_VALIDATION_INVALID_AGE"
              },
              "helpText": "HCM_REGISTRATION_DOB_HELPTEXT",
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
                  "message": "HCM_VALIDATION_REQUIRED"
                },
                {
                  "type": "minAge",
                  "value": 3,
                  "message": "HCM_VALIDATION_INVALID_AGE"
                },
                {
                  "type": "maxAge",
                  "value": 1800,
                  "message": "HCM_VALIDATION_INVALID_AGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_REQUIRED"
            },
            {
              "type": "string",
              "enums": [
                {"code": "MALE", "name": "HCM_COMMON_MALE"},
                {"code": "FEMALE", "name": "HCM_COMMON_FEMALE"}
              ],
              "label": "HCM_REGISTRATION_GENDER_LABEL",
              "order": 5,
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
                  "message": "HCM_VALIDATION_GENDER_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "MALE", "name": "HCM_COMMON_MALE"},
                {"code": "FEMALE", "name": "HCM_COMMON_FEMALE"}
              ],
              "required.message": "HCM_VALIDATION_GENDER_REQUIRED"
            },
            {
              "type": "string",
              "label": "HCM_REGISTRATION_MOBILE_LABEL",
              "order": 6,
              "value": "",
              "format": "mobileNumber",
              "hidden": false,
              "isMdms": false,
              "pattern": "^\\d+\$",
              "tooltip": "HCM_REGISTRATION_MOBILE_TOOLTIP",
              "helpText": "HCM_REGISTRATION_MOBILE_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "phone",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "lengthRange": {
                "maxLength": 10,
                "minLength": 10,
                "errorMessage": "HCM_VALIDATION_MOBILE_10_DIGITS"
              },
              "validations": [
                {
                  "type": "pattern",
                  "value": "^\\d+\$",
                  "message": "HCM_VALIDATION_ONLY_NUMBERS"
                },
                {
                  "type": "minLength",
                  "value": 10,
                  "message": "HCM_VALIDATION_MOBILE_10_DIGITS"
                },
                {
                  "type": "maxLength",
                  "value": 10,
                  "message": "HCM_VALIDATION_MOBILE_10_DIGITS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "pattern.message": "HCM_VALIDATION_ONLY_NUMBERS",
              "autoFillCondition": [
                {
                  "value": "{{navigation.headMobileNumber}}",
                  "expression": "true==true"
                }
              ]
            },
            {
              "type": "string",
              "label": "HCM_REGISTRATION_QR_SCAN_LABEL",
              "order": 7,
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
          "actionLabel": "HCM_ADD_MEMBER_SAVE_BUTTON",
          "description": "HCM_ADD_MEMBER_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false,
          "conditionalNavigateTo": null
        }
      ],
      "summary": false,
      "version": 3,
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
              },
              {
                "key": "headMobileNumber",
                "value": "{{navigation.headMobileNumber}}"
              }
            ],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
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
          "condition": {"expression": "DEFAULT"}
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
                "properties": {"message": "HCM_ERROR_NAVIGATION"}
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
            "name": "hFReferral",
            "match": {
              "field": "beneficiaryId",
              "equalsFrom": "individual.identifiers.0.identifierId"
            },
            "entity": "HFReferralModel"
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
    },
    {
      "name": "REFER_BENEFICIARY",
      "order": 6,
      "pages": [
        {
          "body": null,
          "flow": "REFER_BENEFICIARY",
          "page": "referBeneficiary",
          "type": "object",
          "label": "HCM_REFER_BENEFICIARY_HEADING",
          "order": 1,
          "footer": [
            {
              "label": "HCM_REFER_BENEFICIARY_SUBMIT_BUTTON",
              "format": "button",
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {"name": "acknowledgement", "type": "screen"}
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
          "heading": "HCM_REFER_BENEFICIARY_HEADING",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "data": [
                  {
                    "key": "selectedIndividualClientReferenceId",
                    "value":
                        "{{navigation.selectedIndividualClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualIdentifierId",
                    "value": "{{navigation.selectedIndividualIdentifierId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{ navigation.HouseholdClientReferenceId }}"
                  },
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualName",
                    "value": "{{navigation.selectedIndividualName}}"
                  },
                  {
                    "key": "selectedIndividualGender",
                    "value": "{{navigation.selectedIndividualGender}}"
                  },
                  {
                    "key": "selectedIndividualAgeInMonths",
                    "value": "{{navigation.selectedIndividualAgeInMonths}}"
                  },
                  {
                    "key": "cycleIndex",
                    "value": "{{fn:getCurrentCycleIndex()}}"
                  }
                ],
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
                  }
                ],
                "configName": "referralBeneficaryCreate"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "data": [
                  {
                    "key": "selectedIndividualClientReferenceId",
                    "value":
                        "{{navigation.selectedIndividualClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualIdentifierId",
                    "value": "{{navigation.selectedIndividualIdentifierId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{ navigation.HouseholdClientReferenceId }}"
                  },
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualName",
                    "value": "{{navigation.selectedIndividualName}}"
                  },
                  {
                    "key": "selectedIndividualGender",
                    "value": "{{navigation.selectedIndividualGender}}"
                  },
                  {
                    "key": "selectedIndividualAgeInMonths",
                    "value": "{{navigation.selectedIndividualAgeInMonths}}"
                  },
                  {"key": "cycleIndex", "value": "{{navigation.cycleIndex}}"}
                ],
                "entity": "HFREFERRAL",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "HCM_ERROR_CREATE_STOCK"}
                  }
                ]
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {
                    "key": "selectedIndividualClientReferenceId",
                    "value":
                        "{{navigation.selectedIndividualClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualIdentifierId",
                    "value": "{{navigation.selectedIndividualIdentifierId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{ navigation.HouseholdClientReferenceId }}"
                  },
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{navigation.ProjectBeneficiaryClientReferenceId}}"
                  },
                  {
                    "key": "selectedIndividualName",
                    "value": "{{navigation.selectedIndividualName}}"
                  },
                  {
                    "key": "selectedIndividualGender",
                    "value": "{{navigation.selectedIndividualGender}}"
                  },
                  {
                    "key": "selectedIndividualAgeInMonths",
                    "value": "{{navigation.selectedIndividualAgeInMonths}}"
                  },
                  {"key": "cycleIndex", "value": "{{navigation.cycleIndex}}"}
                ],
                "name": "referralSuccess",
                "type": "TEMPLATE",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "HCM_ERROR_NAVIGATION"}
                  }
                ],
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary"
              }
            }
          ],
          "navigateTo": {"name": "acknowledgement", "type": "screen"},
          "properties": [
            {
              "type": "string",
              "label": "HCM_REFER_ADMINISTRATIVE_UNIT_LABEL",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
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
                  "message": "HCM_VALIDATION_MANDATORY_FIELD"
                }
              ],
              "errorMessage": "",
              "required.message": "HCM_VALIDATION_MANDATORY_FIELD"
            },
            {
              "type": "string",
              "label": "HCM_REFER_REFERRED_BY_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "required": true,
              "fieldName": "referredBy",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "HCM_VALIDATION_MANDATORY_FIELD"
                }
              ],
              "errorMessage": "",
              "required.message": "HCM_VALIDATION_MANDATORY_FIELD",
              "autoFillCondition": [
                {"value": "{{loggedInUserUuid}}", "expression": "true==true"}
              ]
            },
            {
              "type": "dynamic",
              "enums": null,
              "label": "HCM_REFER_HEALTH_FACILITY_LABEL",
              "order": 3,
              "value": "",
              "format": "custom",
              "hidden": false,
              "isMdms": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "healthFacility",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.FACILITY_OPTIONS_POPULATOR",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "HCM_VALIDATION_MANDATORY_FIELD"
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_MANDATORY_FIELD"
            },
            {
              "type": "string",
              "enums": [
                {"code": "FEVER", "name": "HCM_REFER_REASON_FEVER"}
              ],
              "label": "HCM_REFER_REASON_LABEL",
              "order": 4,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "referralReason",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.REFERRAL_REASONS",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "HCM_VALIDATION_MANDATORY_FIELD"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_MANDATORY_FIELD"
            }
          ],
          "actionLabel": "HCM_REFER_BENEFICIARY_SUBMIT_BUTTON",
          "description": " ",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false,
          "conditionalNavigateTo": null
        }
      ],
      "summary": false,
      "version": 3,
      "category": "HFREFERRAL",
      "disabled": false,
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "data": [
              {
                "key": "selectedIndividualClientReferenceId",
                "value": "{{navigation.selectedIndividualClientReferenceId}}"
              },
              {
                "key": "selectedIndividualIdentifierId",
                "value": "{{navigation.selectedIndividualIdentifierId}}"
              },
              {
                "key": "HouseholdClientReferenceId",
                "value": "{{ navigation.HouseholdClientReferenceId }}"
              },
              {
                "key": "ProjectBeneficiaryClientReferenceId",
                "value": "{{navigation.ProjectBeneficiaryClientReferenceId}}"
              },
              {
                "key": "selectedIndividualName",
                "value": "{{navigation.selectedIndividualName}}"
              },
              {
                "key": "selectedIndividualGender",
                "value": "{{navigation.selectedIndividualGender}}"
              },
              {
                "key": "selectedIndividualAgeInMonths",
                "value": "{{navigation.selectedIndividualAgeInMonths}}"
              },
              {"key": "cycleIndex", "value": "{{fn:getCurrentCycleIndex()}}"}
            ],
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
              }
            ],
            "configName": "referralBeneficaryCreate"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "data": [
              {
                "key": "selectedIndividualClientReferenceId",
                "value": "{{navigation.selectedIndividualClientReferenceId}}"
              },
              {
                "key": "selectedIndividualIdentifierId",
                "value": "{{navigation.selectedIndividualIdentifierId}}"
              },
              {
                "key": "HouseholdClientReferenceId",
                "value": "{{ navigation.HouseholdClientReferenceId }}"
              },
              {
                "key": "ProjectBeneficiaryClientReferenceId",
                "value": "{{navigation.ProjectBeneficiaryClientReferenceId}}"
              },
              {
                "key": "selectedIndividualName",
                "value": "{{navigation.selectedIndividualName}}"
              },
              {
                "key": "selectedIndividualGender",
                "value": "{{navigation.selectedIndividualGender}}"
              },
              {
                "key": "selectedIndividualAgeInMonths",
                "value": "{{navigation.selectedIndividualAgeInMonths}}"
              },
              {"key": "cycleIndex", "value": "{{navigation.cycleIndex}}"}
            ],
            "entity": "HFREFERRAL",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "HCM_ERROR_CREATE_STOCK"}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "data": [
              {
                "key": "selectedIndividualClientReferenceId",
                "value": "{{navigation.selectedIndividualClientReferenceId}}"
              },
              {
                "key": "selectedIndividualIdentifierId",
                "value": "{{navigation.selectedIndividualIdentifierId}}"
              },
              {
                "key": "HouseholdClientReferenceId",
                "value": "{{ navigation.HouseholdClientReferenceId }}"
              },
              {
                "key": "ProjectBeneficiaryClientReferenceId",
                "value": "{{navigation.ProjectBeneficiaryClientReferenceId}}"
              },
              {
                "key": "selectedIndividualName",
                "value": "{{navigation.selectedIndividualName}}"
              },
              {
                "key": "selectedIndividualGender",
                "value": "{{navigation.selectedIndividualGender}}"
              },
              {
                "key": "selectedIndividualAgeInMonths",
                "value": "{{navigation.selectedIndividualAgeInMonths}}"
              },
              {"key": "cycleIndex", "value": "{{navigation.cycleIndex}}"}
            ],
            "name": "referralSuccess",
            "type": "TEMPLATE",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "HCM_ERROR_NAVIGATION"}
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
      "name": "HOUSEHOLD",
      "order": 2,
      "pages": [
        {
          "body": null,
          "flow": "HOUSEHOLD",
          "page": "beneficiaryDetails",
          "type": "object",
          "label": "HCM_REGISTRATION_BENEFICIARY_DETAILS_HEADING",
          "order": 4,
          "footer": [
            {
              "label": "HCM_REGISTRATION_SAVE_BENEFICIARY_BUTTON",
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
          "heading": "HCM_REGISTRATION_BENEFICIARY_DETAILS_HEADING",
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
                        "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "UPDATE_EVENT",
                  "properties": {
                    "entity": "HouseholdModel, TaskModel, ProjectBeneficiaryModel",
                    "modify": [
                      {"key": "TaskModel.status", "value": "NOT_ADMINISTERED"}
                    ],
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {
                          "message": "HCM_ERROR_UPDATE_MISSED_CHILDREN"
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
                        "properties": {"message": "HCM_ERROR_NAVIGATION"}
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "searchBeneficiary"
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
                        "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "UPDATE_EVENT",
                  "properties": {
                    "entity": "HouseholdModel, ProjectBeneficiaryModel",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "HCM_ERROR_UPDATE_HOUSEHOLD"}
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
                        "properties": {"message": "HCM_ERROR_NAVIGATION"}
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "searchBeneficiary"
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
                        "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
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
                        "properties": {"message": "HCM_ERROR_CREATE_HOUSEHOLD"}
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
                        "properties": {"message": "HCM_ERROR_NAVIGATION"}
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "searchBeneficiary"
                  }
                }
              ],
              "condition": {"expression": "DEFAULT"}
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
              "label": "HCM_REGISTRATION_FIRST_NAME_LABEL",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
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
                "errorMessage": "HCM_VALIDATION_SIZE_2_TO_200"
              },
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "HCM_VALIDATION_REQUIRED_FIELD"
                },
                {
                  "type": "minLength",
                  "value": "2",
                  "message": "HCM_VALIDATION_SIZE_2_TO_200"
                },
                {
                  "type": "maxLength",
                  "value": "200",
                  "message": "HCM_VALIDATION_SIZE_2_TO_200"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_REQUIRED_FIELD"
            },
            {
              "type": "string",
              "label": "HCM_REGISTRATION_FAMILY_NAME_LABEL",
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
              "lengthRange": {
                "minLength": "2",
                "errorMessage": "HCM_VALIDATION_MIN_2_CHARS_NEEDED"
              },
              "validations": [
                {
                  "type": "minLength",
                  "value": "2",
                  "message": "HCM_VALIDATION_MIN_2_CHARS_NEEDED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "boolean",
              "label": "HCM_REGISTRATION_IS_HEAD_LABEL",
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
                  "message": "HCM_VALIDATION_REQUIRED_FIELD"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_REQUIRED_FIELD"
            },
            {
              "type": "string",
              "enums": [
                {"code": "DEFAULT", "name": "Default"}
              ],
              "label": "HCM_REGISTRATION_ID_POPULATOR_LABEL",
              "order": 4,
              "value": "DEFAULT",
              "format": "idPopulator",
              "hidden": false,
              "isMdms": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
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
                      "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_idpopulator_mandatory_message"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_idpopulator_mandatory_message"
            },
            {
              "type": "string",
              "label": "HCM_REGISTRATION_DOB_LABEL",
              "order": 5,
              "value": "",
              "format": "dob",
              "hidden": false,
              "isMdms": false,
              "tooltip": "HCM_REGISTRATION_DOB_TOOLTIP",
              "ageRange": {
                "maxAge": 1800,
                "minAge": 216,
                "errorMessage": "HCM_VALIDATION_AGE_18_PLUS"
              },
              "helpText": "HCM_REGISTRATION_DOB_HELPTEXT",
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
                  "message": "HCM_VALIDATION_REQUIRED"
                },
                {
                  "type": "minAge",
                  "value": 216,
                  "message": "HCM_VALIDATION_AGE_18_PLUS"
                },
                {
                  "type": "maxAge",
                  "value": 1800,
                  "message": "HCM_VALIDATION_INVALID_AGE"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_REQUIRED"
            },
            {
              "type": "string",
              "enums": [
                {"code": "MALE", "name": "HCM_COMMON_MALE"},
                {"code": "FEMALE", "name": "HCM_COMMON_FEMALE"}
              ],
              "label": "HCM_REGISTRATION_GENDER_LABEL",
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
                  "message": "HCM_VALIDATION_GENDER_REQUIRED"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_GENDER_REQUIRED"
            },
            {
              "type": "string",
              "label": "HCM_REGISTRATION_MOBILE_LABEL",
              "order": 7,
              "value": "",
              "format": "mobileNumber",
              "hidden": false,
              "isMdms": false,
              "pattern": "^\\d+\$",
              "tooltip": "HCM_REGISTRATION_MOBILE_TOOLTIP",
              "helpText": "HCM_REGISTRATION_MOBILE_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "phone",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "lengthRange": {
                "maxLength": 10,
                "minLength": 10,
                "errorMessage": "HCM_VALIDATION_MOBILE_10_DIGITS"
              },
              "validations": [
                {
                  "type": "pattern",
                  "value": "^\\d+\$",
                  "message": "HCM_VALIDATION_ONLY_NUMBERS"
                },
                {
                  "type": "minLength",
                  "value": 10,
                  "message": "HCM_VALIDATION_MOBILE_10_DIGITS"
                },
                {
                  "type": "maxLength",
                  "value": 10,
                  "message": "HCM_VALIDATION_MOBILE_10_DIGITS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "pattern.message": "HCM_VALIDATION_ONLY_NUMBERS"
            },
            {
              "type": "string",
              "label": "HCM_REGISTRATION_QR_SCAN_LABEL",
              "order": 8,
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
          "actionLabel": "HCM_REGISTRATION_SAVE_BENEFICIARY_BUTTON",
          "description": "HCM_REGISTRATION_BENEFICIARY_DETAILS_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false,
          "conditionalNavigateTo": null
        },
        {
          "body": null,
          "flow": "HOUSEHOLD",
          "page": "householdDetails",
          "type": "object",
          "label": "HCM_REGISTRATION_HOUSEHOLD_DETAILS_HEADING",
          "order": 3,
          "footer": [
            {
              "label": "HCM_REGISTRATION_SAVE_HOUSEHOLD_BUTTON",
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
          "heading": "HCM_REGISTRATION_HOUSEHOLD_DETAILS_HEADING",
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
                        "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
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
                          "message": "HCM_ERROR_UPDATE_MISSED_CHILDREN"
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
                        "properties": {"message": "HCM_ERROR_NAVIGATION"}
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "searchBeneficiary"
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
                        "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "UPDATE_EVENT",
                  "properties": {
                    "entity": "HouseholdModel, ProjectBeneficiaryModel",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "HCM_ERROR_UPDATE_HOUSEHOLD"}
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
                        "properties": {"message": "HCM_ERROR_NAVIGATION"}
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "searchBeneficiary"
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
                        "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
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
                        "properties": {"message": "HCM_ERROR_CREATE_HOUSEHOLD"}
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
                        "properties": {"message": "HCM_ERROR_NAVIGATION"}
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "searchBeneficiary"
                  }
                }
              ],
              "condition": {"expression": "DEFAULT"}
            }
          ],
          "navigateTo": {"name": "beneficiaryDetails", "type": "form"},
          "properties": [
            {
              "type": "string",
              "label": "HCM_REGISTRATION_DATE_LABEL",
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
                  "message": "HCM_VALIDATION_REQUIRED_FIELD"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_REQUIRED_FIELD"
            },
            {
              "type": "integer",
              "label": "HCM_REGISTRATION_CHILDREN_UNDER_5_LABEL",
              "order": 2,
              "value": "0",
              "format": "numeric",
              "hidden": false,
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
              "range": {
                "min": "1",
                "errorMessage": "HCM_VALIDATION_MIN_CHILDREN_1"
              },
              "validations": [
                {
                  "type": "min",
                  "value": "1",
                  "message": "HCM_VALIDATION_MIN_CHILDREN_1"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "HCM_REGISTRATION_PREGNANT_WOMEN_LABEL",
              "order": 3,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "includeInForm": true,
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
              "label": "HCM_REGISTRATION_TOTAL_MEMBERS_LABEL",
              "order": 4,
              "range": {
                "max": "100",
                "min": "1",
                "errorMessage": "HCM_VALIDATION_MAX_MEMBERS"
              },
              "value": "1",
              "format": "numeric",
              "hidden": false,
              "includeInForm": true,
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
                  "message": "HCM_VALIDATION_REQUIRED"
                },
                {
                  "type": "min",
                  "value": "1",
                  "message": "HCM_VALIDATION_MAX_MEMBERS"
                },
                {
                  "type": "max",
                  "value": "100",
                  "message": "HCM_VALIDATION_MAX_MEMBERS"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_REQUIRED"
            }
          ],
          "actionLabel": "HCM_REGISTRATION_SAVE_HOUSEHOLD_BUTTON",
          "description": "HCM_REGISTRATION_HOUSEHOLD_DETAILS_DESCRIPTION",
          "showTabView": false,
          "submitCondition": {
            "expression": [
              {"condition": "isEdit == true"}
            ]
          },
          "preventScreenCapture": false
        },
        {
          "body": null,
          "flow": "HOUSEHOLD",
          "page": "beneficiaryLocation",
          "type": "object",
          "label": "HCM_REGISTRATION_BENEFICIARY_LOCATION_HEADING",
          "order": 1,
          "footer": [
            {
              "label": "HCM_REGISTRATION_SAVE_LOCATION_BUTTON",
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
          "heading": "HCM_REGISTRATION_BENEFICIARY_LOCATION_HEADING",
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
                        "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
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
                          "message": "HCM_ERROR_UPDATE_MISSED_CHILDREN"
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
                        "properties": {"message": "HCM_ERROR_NAVIGATION"}
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "searchBeneficiary"
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
                        "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
                      }
                    ],
                    "configName": "beneficiaryRegistration"
                  }
                },
                {
                  "actionType": "UPDATE_EVENT",
                  "properties": {
                    "entity": "HouseholdModel, ProjectBeneficiaryModel",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "HCM_ERROR_UPDATE_HOUSEHOLD"}
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
                        "properties": {"message": "HCM_ERROR_NAVIGATION"}
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "searchBeneficiary"
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
                        "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
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
                        "properties": {"message": "HCM_ERROR_CREATE_HOUSEHOLD"}
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
                        "properties": {"message": "HCM_ERROR_NAVIGATION"}
                      }
                    ],
                    "navigationMode": "popUntilAndPush",
                    "popUntilPageName": "searchBeneficiary"
                  }
                }
              ],
              "condition": {"expression": "DEFAULT"}
            }
          ],
          "navigateTo": {"name": "householdDetails", "type": "form"},
          "properties": [
            {
              "type": "string",
              "label": "HCM_REGISTRATION_ADMIN_AREA_LABEL",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
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
                  "message": "HCM_VALIDATION_REQUIRED_FIELD"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_REQUIRED_FIELD"
            },
            {
              "type": "string",
              "label": "HCM_REGISTRATION_LAT_LONG_LABEL",
              "order": 2,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
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
                  "message": "HCM_VALIDATION_REQUIRED_FIELD"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "HCM_VALIDATION_REQUIRED_FIELD"
            },
            {
              "type": "string",
              "label": "HCM_REGISTRATION_ADDRESS_LINE1_LABEL",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText": "HCM_REGISTRATION_ADDRESS_LINE1_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "addressLine1",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "lengthRange": {
                "minLength": "2",
                "errorMessage":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine1_min_message"
              },
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
              "label": "HCM_REGISTRATION_ADDRESS_LINE2_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText": "HCM_REGISTRATION_ADDRESS_LINE2_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "addressLine2",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "lengthRange": {
                "minLength": "2",
                "errorMessage":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_addressLine2_min_message"
              },
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
              "label": "HCM_REGISTRATION_LANDMARK_LABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText": "HCM_REGISTRATION_LANDMARK_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "landmark",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "lengthRange": {
                "minLength": "2",
                "errorMessage":
                    "APPONE_REGISTRATION_BENEFICIARYLOCATION_label_landmark_min_message"
              },
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
              "type": "string",
              "label": "HCM_REGISTRATION_PINCODE_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": true,
              "isMdms": false,
              "pattern": "^\\d+\$",
              "tooltip": "",
              "helpText": "HCM_REGISTRATION_PINCODE_HELPTEXT",
              "infoText": "",
              "readOnly": false,
              "fieldName": "pincode",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": null,
              "systemDate": false,
              "validations": [
                {
                  "type": "pattern",
                  "value": "^\\d+\$",
                  "message": "HCM_VALIDATION_ONLY_NUMBERS"
                }
              ],
              "errorMessage": "",
              "pattern.message": "HCM_VALIDATION_ONLY_NUMBERS"
            },
            {
              "type": "string",
              "enums": [
                {
                  "code": "PERMANENT",
                  "name": "HCM_REGISTRATION_ADDRESS_PERMANENT"
                },
                {
                  "code": "CORRESPONDENCE",
                  "name": "HCM_REGISTRATION_ADDRESS_CORRESPONDENCE"
                },
                {"code": "OTHER", "name": "HCM_COMMON_OTHER"}
              ],
              "label": "HCM_REGISTRATION_ADDRESS_TYPE_LABEL",
              "order": 7,
              "value": "PERMANENT",
              "format": "dropdown",
              "hidden": true,
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
                {
                  "code": "PERMANENT",
                  "name": "HCM_REGISTRATION_ADDRESS_PERMANENT"
                },
                {
                  "code": "CORRESPONDENCE",
                  "name": "HCM_REGISTRATION_ADDRESS_CORRESPONDENCE"
                },
                {"code": "OTHER", "name": "HCM_COMMON_OTHER"}
              ],
              "includeInSummary": false
            }
          ],
          "actionLabel": "HCM_REGISTRATION_SAVE_LOCATION_BUTTON",
          "description": "HCM_REGISTRATION_LOCATION_DESCRIPTION",
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
                    "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
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
                      "message": "HCM_ERROR_UPDATE_MISSED_CHILDREN"
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
                    "properties": {"message": "HCM_ERROR_NAVIGATION"}
                  }
                ],
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary"
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
                    "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
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
                    "properties": {"message": "HCM_ERROR_UPDATE_HOUSEHOLD"}
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
                    "properties": {"message": "HCM_ERROR_NAVIGATION"}
                  }
                ],
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary"
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
                    "properties": {"message": "HCM_ERROR_FETCH_CONFIG"}
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
                    "properties": {"message": "HCM_ERROR_CREATE_HOUSEHOLD"}
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
                    "properties": {"message": "HCM_ERROR_NAVIGATION"}
                  }
                ],
                "navigationMode": "popUntilAndPush",
                "popUntilPageName": "searchBeneficiary"
              }
            }
          ],
          "condition": {"expression": "DEFAULT"}
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
            "name": "hFReferral",
            "match": {
              "field": "beneficiaryId",
              "equalsFrom": "individual.identifiers.0.identifierId"
            },
            "entity": "HFReferralModel"
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
