final dynamic sampleFlows = {
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
          "label": "Delivery Successful",
          "format": "panelCard",
          "heading": "Delivery Successful",
          "fieldName": "successCard",
          "mandatory": true,
          "properties": {"type": "success"},
          "description": "Resources has been delivered successfully.",
          "primaryAction": {
            "type": "template",
            "label": "View Household Details",
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
            "label": "Go Back",
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
          "primaryActionLabel": "View Household Details",
          "secondaryActionLabel": "Go Back"
        }
      ],
      "name": "deliverySuccess",
      "order": 10,
      "footer": [],
      "header": [
        {
          "type": "template",
          "label": "Back",
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
                  "key": "Name of the individual",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.name.givenName}}"
                },
                {
                  "key": "ID Type",
                  "value":
                      "{{contextData.0.individuals.IndividualModel.identifiers.0.identifierType}}"
                },
                {
                  "key": "Age",
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
                  "key": "Date of registration",
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
                    "header": "Delivery No.",
                    "isActive": true,
                    "cellValue": "Dose {{item.id}}"
                  },
                  {
                    "header": "Status",
                    "isActive": true,
                    "cellValue": {
                      "@default": "To be administered",
                      "@condition": [
                        {
                          "when":
                              "{{fn:isDoseCompleted(item.id, contextData.0.currentRunningCycle)}} == true",
                          "value": "Administered"
                        },
                        {
                          "when": "{{item.id}} == {{contextData.0.nextDoseId}}",
                          "value": "To be administered"
                        }
                      ]
                    }
                  },
                  {
                    "header": "Completed on",
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
                              "header": "Delivery No.",
                              "isActive": true,
                              "cellValue": "Dose {{item.id}}"
                            },
                            {
                              "header": "Status",
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
                              "header": "Completed on",
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
          "label": "Record Delivery",
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
      "category": "DELIVERY",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "Delivery Overview of beneficiary",
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
          "label": "Referral recorded successfully",
          "format": "panelCard",
          "heading": "Referral recorded successfully",
          "fieldName": "successCard",
          "mandatory": true,
          "properties": {"type": "success"},
          "description": "ID-{{navigation.selectedIndividualIdentifierId}}",
          "primaryAction": {
            "type": "template",
            "label": "View Household Details",
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
            "label": "Go Back",
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
          "primaryActionLabel": "View Household Details",
          "secondaryActionLabel": "Go Back"
        }
      ],
      "name": "referralSuccess",
      "order": 7,
      "footer": [],
      "header": [
        {
          "type": "template",
          "label": "Back",
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
                  "label": "Edit Household",
                  "format": "button",
                  "onAction": [
                    {
                      "actionType": "REVERSE_TRANSFORM",
                      "properties": {
                        "configName": "beneficiaryRegistration",
                        "entityTypes": ["HouseholdModel"]
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
                  "key": "Head of the household",
                  "value":
                      "{{contextData.0.headIndividual.IndividualModel.name.givenName}}",
                  "isActive": true
                },
                {
                  "key": "Settlement Area",
                  "value":
                      "{{contextData.0.household.HouseholdModel.address.locality.code}}",
                  "isActive": true
                },
                {
                  "key": "No. of children under 5",
                  "value":
                      "{{contextData.0.household.HouseholdModel.additionalFields.fields.childrenCount}}",
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
                        "label": "Edit Individual",
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
                    "label": "Not Eligible",
                    "format": "tag",
                    "visible":
                        "{{fn:checkEligibilityForAgeAndSideEffect(item.individual.0.dateOfBirth, item.task)}}==false",
                    "fieldName": "notEligible",
                    "properties": {"tagType": "error"}
                  },
                  {
                    "type": "template",
                    "label": "Beneficiary Referred",
                    "format": "tag",
                    "visible":
                        "{{fn:hasReferralForCurrentCycle(item.hFReferral)}}==true",
                    "fieldName": "beneficiaryReferred",
                    "properties": {"tagType": "error"}
                  },
                  {
                    "type": "template",
                    "label": "Administered Successfully",
                    "format": "tag",
                    "visible":
                        "{{fn:isDelivered(item.task.last.status)}}==true && {{fn:checkEligibilityForAgeAndSideEffect(item.individual.0.dateOfBirth, item.task)}}==true && {{fn:hasReferralForCurrentCycle(item.hFReferral)}}==false",
                    "fieldName": "administrationSuccess",
                    "properties": {"tagType": "success", "bottomGap": 16}
                  },
                  {
                    "type": "template",
                    "label": "Not Visited",
                    "format": "tag",
                    "visible":
                        "{{fn:checkEligibilityForAgeAndSideEffect(item.individual.0.dateOfBirth, item.task)}}==true && {{fn:isDelivered(item.task.last.status)}}==false && {{fn:hasReferralForCurrentCycle(item.hFReferral)}}==false",
                    "fieldName": "notVisited",
                    "properties": {"tagType": "info", "bottomGap": 16}
                  },
                  {
                    "type": "template",
                    "label": "Deliver Intervention",
                    "format": "button",
                    "visible":
                        "{{fn:checkEligibilityForAgeAndSideEffect(item.individual.0.dateOfBirth, item.task)}} == true  && {{fn:checkAllDoseDelivered(item.task)}} == false && {{fn:hasReferralForCurrentCycle(item.hFReferral)}}==false",
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
                    "label": "View Details",
                    "format": "button",
                    "visible":
                        "{{fn:checkEligibilityForAgeAndSideEffect(item.individual.0.dateOfBirth, item.task)}} == true &&  {{fn:checkAllDoseDelivered(item.task)}} == true && {{fn:hasReferralForCurrentCycle(item.hFReferral)}}==false",
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
              "label": "Add Members",
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
      "category": "REGISTRATION",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "Overview of the household",
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
          "label": "Near by households",
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
          "label": "Name of the individual",
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
          "label": "Filter",
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
                      "name": "Administration Success"
                    },
                    {"code": "CLOSED_HOUSEHOLD", "name": "Missed Children"},
                    {"code": "NOT_ADMINISTERED", "name": "Not Administered"}
                  ],
                  "format": "selectionCard",
                  "fieldName": "selectedStatus"
                }
              ],
              "type": "default",
              "title": "Filter",
              "titleIcon": "FilterAlt",
              "footerActions": [
                {
                  "type": "template",
                  "label": "Clear All",
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
                  "label": "Apply",
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
                                "key": "status",
                                "root": "task",
                                "value": {
                                  "values": ["ADMINISTRATION_SUCCESS"],
                                  "scope": "projectBeneficiary"
                                },
                                "operation": "notExists"
                              }
                            ],
                            "name": "task"
                          }
                        }
                      ],
                      "condition": {
                        "expression": "selectedStatus == NOT_ADMINISTERED"
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
                    "label": "Open",
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
      "name": "searchBeneficiary",
      "order": 1,
      "footer": [
        {
          "type": "template",
          "label": "Register Beneficiary",
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
          "label": "Scan Beneficiary",
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
      "category": "REGISTRATION",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "Search beneficiaries registered for the current campaign",
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
          "body": null,
          "flow": "DELIVERY",
          "page": "DeliveryDetails",
          "type": "object",
          "label": "Delivery Details",
          "order": 1,
          "footer": [
            {
              "label": "Save Delivery",
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
          "heading": "Delivery Details",
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
                          "message": "Failed to fetch config for bulk delivery."
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
                        "properties": {
                          "message": "Failed to create bulk tasks."
                        }
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
                    "properties": {"message": "Navigation failed."}
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
              "type": "string",
              "label": "Date of delivery",
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
                  "message": "Resource card selection is required"
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
              "required.message": "Resource card selection is required"
            },
            {
              "type": "string",
              "label": "Delivery Comments",
              "order": 3,
              "value": "",
              "format": "dropdown",
              "hidden": false,
              "isMdms": true,
              "tooltip": "",
              "helpText": "",
              "enums": [
                {"code": "SUCCESSFUL_DELIVERY", "name": "Delivery Successful"},
                {
                  "code": "INSUFFICIENT_RESOURCES",
                  "name": "Insufficient Resources"
                },
                {"code": "BENEFICIARY_REFUSED", "name": "Beneficiary Refused"},
                {"code": "BENEFICIARY_ABSENT", "name": "Beneficiary Absent"}
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
              "label": "Scan Delivery",
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
          "actionLabel": "Save Delivery",
          "description": "Capture details of the resources to be delivered ",
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
                      "message": "Failed to fetch config for bulk delivery."
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
                    "properties": {"message": "Failed to create bulk tasks."}
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
                "properties": {"message": "Navigation failed."}
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
      "name": "ADD_MEMBER",
      "order": 4,
      "pages": [
        {
          "body": null,
          "flow": "ADD_MEMBER",
          "page": "beneficiaryDetails",
          "type": "object",
          "label": "Add Member",
          "order": 4,
          "footer": [
            {
              "label": "Save Beneficiary",
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
          "heading": "Add Member",
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
                    "properties": {"message": "Navigation failed."}
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
              "label": "Full name",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "Enter the full legal name of the individual.",
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
                "errorMessage": "Size must be 2 to 200 characters"
              },
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required field cannot be empty"
                },
                {
                  "type": "minLength",
                  "value": "2",
                  "message": "Size must be 2 to 200 characters"
                },
                {
                  "type": "maxLength",
                  "value": "200",
                  "message": "Size must be 2 to 200 characters"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "Required field cannot be empty"
            },
            {
              "type": "string",
              "label": "Family name",
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
                "errorMessage": "Minimum 2 characters required"
              },
              "validations": [
                {
                  "type": "minLength",
                  "value": "2",
                  "message": "Minimum 2 characters required"
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
              "label": "ID populator",
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
                {"code": "OTHER", "name": "Other"}
              ],
              "required.message": "ID is required"
            },
            {
              "type": "string",
              "label": "Date of birth",
              "order": 4,
              "value": "",
              "format": "dob",
              "hidden": false,
              "isMdms": false,
              "tooltip": "Used for age-based program eligibility.",
              "ageRange": {
                "maxAge": 1800,
                "minAge": 3,
                "errorMessage": "Please enter a valid age"
              },
              "helpText": "Select the date of birth from the calendar.",
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
                  "message": "Please fill the required field"
                },
                {
                  "type": "minAge",
                  "value": 3,
                  "message": "Please enter a valid age"
                },
                {
                  "type": "maxAge",
                  "value": 1800,
                  "message": "Please enter a valid age"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "Please fill the required field"
            },
            {
              "type": "string",
              "enums": [
                {"code": "MALE", "name": "Male"},
                {"code": "FEMALE", "name": "Female"}
              ],
              "label": "Gender",
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
                  "message": "Please select a gender"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "MALE", "name": "Male"},
                {"code": "FEMALE", "name": "Female"}
              ],
              "required.message": "Please select a gender"
            },
            {
              "type": "string",
              "label": "Mobile number",
              "order": 6,
              "value": "",
              "format": "mobileNumber",
              "hidden": false,
              "isMdms": false,
              "pattern": "^\\d+\$",
              "tooltip":
                  "Will be used for communication and OTP-based verification.",
              "helpText": "Enter a valid mobile number.",
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
                "errorMessage": "Mobile number must be 10 digits"
              },
              "validations": [
                {
                  "type": "pattern",
                  "value": "^\\d+\$",
                  "message": "Only numbers are allowed"
                },
                {
                  "type": "minLength",
                  "value": 10,
                  "message": "Mobile number must be 10 digits"
                },
                {
                  "type": "maxLength",
                  "value": 10,
                  "message": "Mobile number must be 10 digits"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "pattern.message": "Only numbers are allowed"
            },
            {
              "type": "string",
              "label": "QR Scan",
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
          "actionLabel": "Save Beneficiary",
          "description": "Enter details of each individual in the household.",
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
          "label": "Refer Beneficiary",
          "order": 1,
          "footer": [
            {
              "label": "Submit",
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
          "heading": "Refer Beneficiary",
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
                    "properties": {"message": "Failed to fetch config."}
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
                    "properties": {"message": "Failed to create stock."}
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
                    "properties": {"message": "Navigation failed."}
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
              "label": "Admnistrative unit",
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
                  "message": "Please fill the mandatory field"
                }
              ],
              "errorMessage": "",
              "required.message": "Please fill the mandatory field"
            },
            {
              "type": "string",
              "label": "Referred by",
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
                  "message": "Please fill the mandatory field"
                }
              ],
              "errorMessage": "",
              "required.message": "Please fill the mandatory field",
              "autoFillCondition": [
                {"value": "{{loggedInUserUuid}}", "expression": "true==true"}
              ]
            },
            {
              "type": "dynamic",
              "enums": null,
              "label": "Health Facility",
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
                  "message": "Please fill the mandatory field"
                }
              ],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "required.message": "Please fill the mandatory field"
            },
            {
              "type": "string",
              "enums": [
                {"code": "FEVER", "name": "Fever"}
              ],
              "label": "What is the reason for referral?",
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
                  "message": "Please fill the mandatory field"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "Please fill the mandatory field"
            }
          ],
          "actionLabel": "Submit",
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
                "properties": {"message": "Failed to fetch config."}
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
                "properties": {"message": "Failed to create stock."}
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
      "name": "HOUSEHOLD",
      "order": 2,
      "pages": [
        {
          "body": null,
          "flow": "HOUSEHOLD",
          "page": "beneficiaryDetails",
          "type": "object",
          "label": "Beneficiary Details",
          "order": 4,
          "footer": [
            {
              "label": "Save Beneficiary",
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
          "heading": "Beneficiary Details",
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
                          "message": "Failed to update missed children."
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
              "label": "Full name",
              "order": 1,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "Enter the full legal name of the individual.",
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
                "errorMessage": "Size must be 2 to 200 characters"
              },
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required field cannot be empty"
                },
                {
                  "type": "minLength",
                  "value": "2",
                  "message": "Size must be 2 to 200 characters"
                },
                {
                  "type": "maxLength",
                  "value": "200",
                  "message": "Size must be 2 to 200 characters"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "Required field cannot be empty"
            },
            {
              "type": "string",
              "label": "Family name",
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
                "errorMessage": "Minimum 2 characters needed"
              },
              "validations": [
                {
                  "type": "minLength",
                  "value": "2",
                  "message": "Minimum 2 characters needed"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "boolean",
              "label": "Is head of family?",
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
                  "message": "Required field cannot be empty"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "Required field cannot be empty"
            },
            {
              "type": "string",
              "enums": [
                {"code": "DEFAULT", "name": "Default"}
              ],
              "label": "ID populator",
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
              "label": "Date of birth",
              "order": 5,
              "value": "",
              "format": "dob",
              "hidden": false,
              "isMdms": false,
              "tooltip": "Used for age-based program eligibility.",
              "ageRange": {
                "maxAge": 1800,
                "minAge": 3,
                "errorMessage": "Please enter a valid age"
              },
              "helpText": "Select the date of birth from the calendar.",
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
                  "message": "Please fill the required field"
                },
                {
                  "type": "minAge",
                  "value": 3,
                  "message": "Please enter a valid age"
                },
                {
                  "type": "maxAge",
                  "value": 1800,
                  "message": "Please enter a valid age"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "Please fill the required field"
            },
            {
              "type": "string",
              "enums": [
                {"code": "MALE", "name": "Male"},
                {"code": "FEMALE", "name": "Female"}
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
                  "message": "Please select a gender"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "Please select a gender"
            },
            {
              "type": "string",
              "label": "Mobile number",
              "order": 7,
              "value": "",
              "format": "mobileNumber",
              "hidden": false,
              "isMdms": false,
              "pattern": "^\\d+\$",
              "tooltip":
                  "Will be used for communication and OTP-based verification.",
              "helpText": "Enter a valid mobile number.",
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
                "errorMessage": "Mobile number must be 10 digits"
              },
              "validations": [
                {
                  "type": "pattern",
                  "value": "^\\d+\$",
                  "message": "Only numbers are allowed"
                },
                {
                  "type": "minLength",
                  "value": 10,
                  "message": "Mobile number must be 10 digits"
                },
                {
                  "type": "maxLength",
                  "value": 10,
                  "message": "Mobile number must be 10 digits"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "pattern.message": "Only numbers are allowed"
            },
            {
              "type": "string",
              "label": "QR Scan",
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
          "actionLabel": "Save Beneficiary",
          "description": "Enter details of each individual in the household.",
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
          "label": "Household Details",
          "order": 3,
          "footer": [
            {
              "label": "Save Household Details",
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
          "heading": "Household Details",
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
                          "message": "Failed to update missed children."
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
              "label": "Date of registration",
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
                  "message": "Required field cannot be empty"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "Required field cannot be empty"
            },
            {
              "type": "integer",
              "label": "Number of children under the age of 5",
              "order": 2,
              "value": "1",
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
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "Number of pregnant women",
              "order": 3,
              "value": "0",
              "format": "numeric",
              "hidden": true,
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
              "label": "Total household members",
              "order": 4,
              "range": {
                "max": "10",
                "min": "1",
                "errorMessage": "Total household members cannot be more than 10"
              },
              "value": "1",
              "format": "numeric",
              "hidden": true,
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
                  "message": "Please fill the required field"
                },
                {
                  "type": "min",
                  "value": "1",
                  "message": "Total household members cannot be more than 10"
                },
                {
                  "type": "max",
                  "value": "10",
                  "message": "Total household members cannot be more than 10"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "Please fill the required field"
            }
          ],
          "actionLabel": "Save Household Details",
          "description":
              "Enter family size, registration date, and demographics.",
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
          "label": "Beneficiary Location",
          "order": 1,
          "footer": [
            {
              "label": "Save Location",
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
          "heading": "Beneficiary Location",
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
                          "message": "Failed to update missed children."
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
              "label": "Administrative area",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText":
                  "Enter the region or ward name where the beneficiary resides.",
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
                  "message": "Required field cannot be empty"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "Required field cannot be empty"
            },
            {
              "type": "string",
              "label": "Lat/Long",
              "order": 2,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText":
                  "Provide latitude and longitude of the address, if available.",
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
                  "message": "Required field cannot be empty"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message": "Required field cannot be empty"
            },
            {
              "type": "string",
              "label": "Address line 1",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText": "Provide the primary street address or house number.",
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
              "label": "Address line 2",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText":
                  "Additional address information, like block or apartment name.",
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
              "label": "Landmark",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": true,
              "isMdms": false,
              "tooltip": "",
              "helpText":
                  "Mention a nearby landmark to help locate the address.",
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
              "label": "Pincode",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": true,
              "isMdms": false,
              "pattern": "^\\d+\$",
              "tooltip": "",
              "helpText": "Enter the area postal code (PIN Code)",
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
                  "message": "Only numbers are allowed"
                }
              ],
              "errorMessage": "",
              "pattern.message": "Only numbers are allowed"
            },
            {
              "type": "string",
              "enums": [
                {"code": "PERMANENT", "name": "Permanent"},
                {"code": "CORRESPONDENCE", "name": "Correspondence"},
                {"code": "OTHER", "name": "Other"}
              ],
              "label": "Type of address",
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
                {"code": "PERMANENT", "name": "Permanent"},
                {"code": "CORRESPONDENCE", "name": "Correspondence"},
                {"code": "OTHER", "name": "Other"}
              ],
              "includeInSummary": false
            }
          ],
          "actionLabel": "Save Location",
          "description": "Capture house location details",
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
                      "message": "Failed to update missed children."
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
