final dynamic sampleReferralFlows = {
  "id": "126f478d-81e3-4d63-afc9-71d5f56e1c36",
  "tenantId": "mz",
  "schemaCode": "HCM-ADMIN-CONSOLE.FormConfigTemplate",
  "uniqueIdentifier": "HFREFERRAL.MR-DN",
  "name": "HFREFERRAL",
  "flows": [
    {
      "body": [
        {
          "type": "template",
          "format": "card",
          "children": [
            {
              "data": [
                {
                  "key": "REFERRAL_INBOX_NAME",
                  "value": "{{HFReferralModel.0.name}}"
                },
                {
                  "key": "REFERRAL_INBOX_REFERRAL_SYMPTOM",
                  "value": "{{HFReferralModel.0.symptom}}"
                },
                {
                  "key": "REFERRAL_INBOX_REFERRAL_STATUS",
                  "value":
                      "{{fn:computeReferralStatus(HFReferralModel.0.symptom, HFReferralModel.0.additionalFields.fields)}}"
                }
              ],
              "type": "template",
              "format": "labelPairList",
              "fieldName": "labelList",
              "mandatory": true
            }
          ],
          "fieldName": "templateCard",
          "properties": {"type": "primary", "cardType": "primary"}
        }
      ],
      "name": "referralOverview",
      "order": 4,
      "footer": [
        {
          "type": "template",
          "label": "HF_REFERRAL_GO_BACK",
          "format": "button",
          "onAction": [
            {
              "actionType": "REVERSE_TRANSFORM",
              "properties": {
                "configName": "referralCreation",
                "entityTypes": ["HFReferralModel"]
              }
            },
            {
              "actionType": "CONDITIONAL_NAVIGATION",
              "properties": {
                "conditions": [
                  {
                    "condition":
                        "0.HFReferralModel.additionalFields.fields.feverQ1==null&&0.HFReferralModel.symptom==FEVER",
                    "navigateTo": {
                      "data": [
                        {
                          "key": "clientReferenceId",
                          "value": "{{0.HFReferralModel.clientReferenceId}}"
                        },
                        {
                          "key": "referralSymptom",
                          "value": "{{0.HFReferralModel.symptom}}"
                        },
                        {"key": "isUpdate", "value": "true"},
                        {
                          "key": "rowVersion",
                          "value": "{{0.HFReferralModel.rowVersion}}"
                        },
                        {
                          "key": "nameOfChild",
                          "value": "{{0.HFReferralModel.name}}"
                        },
                        {
                          "key": "beneficiaryId",
                          "value": "{{0.HFReferralModel.beneficiaryId}}"
                        },
                        {
                          "key": "referralCode",
                          "value": "{{0.HFReferralModel.referralCode}}"
                        },
                        {
                          "key": "ageInMonths",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.ageInMonths}}"
                        },
                        {
                          "key": "gender",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.gender}}"
                        },
                        {
                          "key": "referralReason",
                          "value": "{{0.HFReferralModel.symptom}}"
                        }
                      ],
                      "flow": "REFERRAL_CREATE",
                      "name": "referralDetails",
                      "type": "FORM"
                    }
                  },
                  {
                    "condition":
                        "0.HFReferralModel.additionalFields.fields.sickQ1==null&&0.HFReferralModel.symptom==SICK",
                    "navigateTo": {
                      "data": [
                        {
                          "key": "clientReferenceId",
                          "value": "{{0.HFReferralModel.clientReferenceId}}"
                        },
                        {
                          "key": "referralSymptom",
                          "value": "{{0.HFReferralModel.symptom}}"
                        },
                        {"key": "isUpdate", "value": "true"},
                        {
                          "key": "rowVersion",
                          "value": "{{0.HFReferralModel.rowVersion}}"
                        },
                        {
                          "key": "nameOfChild",
                          "value": "{{0.HFReferralModel.name}}"
                        },
                        {
                          "key": "beneficiaryId",
                          "value": "{{0.HFReferralModel.beneficiaryId}}"
                        },
                        {
                          "key": "referralCode",
                          "value": "{{0.HFReferralModel.referralCode}}"
                        },
                        {
                          "key": "ageInMonths",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.ageInMonths}}"
                        },
                        {
                          "key": "gender",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.gender}}"
                        },
                        {
                          "key": "referralReason",
                          "value": "{{0.HFReferralModel.symptom}}"
                        }
                      ],
                      "flow": "REFERRAL_CREATE",
                      "name": "referralDetails",
                      "type": "FORM"
                    }
                  },
                  {
                    "condition":
                        "0.HFReferralModel.additionalFields.fields.sideEffectQ1==null&&0.HFReferralModel.symptom==DRUG_SE_CC",
                    "navigateTo": {
                      "data": [
                        {
                          "key": "clientReferenceId",
                          "value": "{{0.HFReferralModel.clientReferenceId}}"
                        },
                        {
                          "key": "referralSymptom",
                          "value": "{{0.HFReferralModel.symptom}}"
                        },
                        {"key": "isUpdate", "value": "true"},
                        {
                          "key": "rowVersion",
                          "value": "{{0.HFReferralModel.rowVersion}}"
                        },
                        {
                          "key": "nameOfChild",
                          "value": "{{0.HFReferralModel.name}}"
                        },
                        {
                          "key": "beneficiaryId",
                          "value": "{{0.HFReferralModel.beneficiaryId}}"
                        },
                        {
                          "key": "referralCode",
                          "value": "{{0.HFReferralModel.referralCode}}"
                        },
                        {
                          "key": "ageInMonths",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.ageInMonths}}"
                        },
                        {
                          "key": "gender",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.gender}}"
                        },
                        {
                          "key": "referralReason",
                          "value": "{{0.HFReferralModel.symptom}}"
                        }
                      ],
                      "flow": "REFERRAL_CREATE",
                      "name": "referralDetails",
                      "type": "FORM"
                    }
                  },
                  {
                    "condition":
                        "0.HFReferralModel.additionalFields.fields.sideEffectPQ1==null&&0.HFReferralModel.symptom==DRUG_SE_PC",
                    "navigateTo": {
                      "data": [
                        {
                          "key": "clientReferenceId",
                          "value": "{{0.HFReferralModel.clientReferenceId}}"
                        },
                        {
                          "key": "referralSymptom",
                          "value": "{{0.HFReferralModel.symptom}}"
                        },
                        {"key": "isUpdate", "value": "true"},
                        {
                          "key": "rowVersion",
                          "value": "{{0.HFReferralModel.rowVersion}}"
                        },
                        {
                          "key": "nameOfChild",
                          "value": "{{0.HFReferralModel.name}}"
                        },
                        {
                          "key": "beneficiaryId",
                          "value": "{{0.HFReferralModel.beneficiaryId}}"
                        },
                        {
                          "key": "referralCode",
                          "value": "{{0.HFReferralModel.referralCode}}"
                        },
                        {
                          "key": "ageInMonths",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.ageInMonths}}"
                        },
                        {
                          "key": "gender",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.gender}}"
                        },
                        {
                          "key": "referralReason",
                          "value": "{{0.HFReferralModel.symptom}}"
                        }
                      ],
                      "flow": "REFERRAL_CREATE",
                      "name": "referralDetails",
                      "type": "FORM"
                    }
                  },
                  {
                    "default": true,
                    "navigateTo": {
                      "data": [],
                      "name": "referralInbox",
                      "type": "TEMPLATE"
                    }
                  }
                ]
              }
            }
          ],
          "fieldName": "actionButton",
          "mandatory": true,
          "properties": {
            "size": "large",
            "type": "primary",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "visible":
              "{{fn:computeReferralButtonLabel(HFReferralModel.0.symptom, HFReferralModel.0.additionalFields.fields)}}==HF_REFERRAL_GO_BACK"
        },
        {
          "visible":
              "{{fn:computeReferralButtonLabel(HFReferralModel.0.symptom, HFReferralModel.0.additionalFields.fields)}}==HF_REFERRAL_CONTINUE",
          "type": "template",
          "label": "HF_REFERRAL_CONTINUE",
          "format": "button",
          "onAction": [
            {
              "actionType": "REVERSE_TRANSFORM",
              "properties": {
                "configName": "referralCreation",
                "entityTypes": ["HFReferralModel"]
              }
            },
            {
              "actionType": "CONDITIONAL_NAVIGATION",
              "properties": {
                "conditions": [
                  {
                    "condition":
                        "0.HFReferralModel.additionalFields.fields.feverQ1==null&&0.HFReferralModel.symptom==FEVER",
                    "navigateTo": {
                      "data": [
                        {
                          "key": "clientReferenceId",
                          "value": "{{0.HFReferralModel.clientReferenceId}}"
                        },
                        {
                          "key": "referralSymptom",
                          "value": "{{0.HFReferralModel.symptom}}"
                        },
                        {"key": "isUpdate", "value": "true"},
                        {
                          "key": "rowVersion",
                          "value": "{{0.HFReferralModel.rowVersion}}"
                        },
                        {
                          "key": "nameOfChild",
                          "value": "{{0.HFReferralModel.name}}"
                        },
                        {
                          "key": "beneficiaryId",
                          "value": "{{0.HFReferralModel.beneficiaryId}}"
                        },
                        {
                          "key": "referralCode",
                          "value": "{{0.HFReferralModel.referralCode}}"
                        },
                        {
                          "key": "ageInMonths",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.ageInMonths}}"
                        },
                        {
                          "key": "gender",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.gender}}"
                        },
                        {
                          "key": "referralReason",
                          "value": "{{0.HFReferralModel.symptom}}"
                        }
                      ],
                      "flow": "REFERRAL_CREATE",
                      "name": "referralDetails",
                      "type": "FORM"
                    }
                  },
                  {
                    "condition":
                        "0.HFReferralModel.additionalFields.fields.sickQ1==null&&0.HFReferralModel.symptom==SICK",
                    "navigateTo": {
                      "data": [
                        {
                          "key": "clientReferenceId",
                          "value": "{{0.HFReferralModel.clientReferenceId}}"
                        },
                        {
                          "key": "referralSymptom",
                          "value": "{{0.HFReferralModel.symptom}}"
                        },
                        {"key": "isUpdate", "value": "true"},
                        {
                          "key": "rowVersion",
                          "value": "{{0.HFReferralModel.rowVersion}}"
                        },
                        {
                          "key": "nameOfChild",
                          "value": "{{0.HFReferralModel.name}}"
                        },
                        {
                          "key": "beneficiaryId",
                          "value": "{{0.HFReferralModel.beneficiaryId}}"
                        },
                        {
                          "key": "referralCode",
                          "value": "{{0.HFReferralModel.referralCode}}"
                        },
                        {
                          "key": "ageInMonths",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.ageInMonths}}"
                        },
                        {
                          "key": "gender",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.gender}}"
                        },
                        {
                          "key": "referralReason",
                          "value": "{{0.HFReferralModel.symptom}}"
                        }
                      ],
                      "flow": "REFERRAL_CREATE",
                      "name": "referralDetails",
                      "type": "FORM"
                    }
                  },
                  {
                    "condition":
                        "0.HFReferralModel.additionalFields.fields.sideEffectQ1==null&&0.HFReferralModel.symptom==DRUG_SE_CC",
                    "navigateTo": {
                      "data": [
                        {
                          "key": "clientReferenceId",
                          "value": "{{0.HFReferralModel.clientReferenceId}}"
                        },
                        {
                          "key": "referralSymptom",
                          "value": "{{0.HFReferralModel.symptom}}"
                        },
                        {"key": "isUpdate", "value": "true"},
                        {
                          "key": "rowVersion",
                          "value": "{{0.HFReferralModel.rowVersion}}"
                        },
                        {
                          "key": "nameOfChild",
                          "value": "{{0.HFReferralModel.name}}"
                        },
                        {
                          "key": "beneficiaryId",
                          "value": "{{0.HFReferralModel.beneficiaryId}}"
                        },
                        {
                          "key": "referralCode",
                          "value": "{{0.HFReferralModel.referralCode}}"
                        },
                        {
                          "key": "ageInMonths",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.ageInMonths}}"
                        },
                        {
                          "key": "gender",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.gender}}"
                        },
                        {
                          "key": "referralReason",
                          "value": "{{0.HFReferralModel.symptom}}"
                        }
                      ],
                      "flow": "REFERRAL_CREATE",
                      "name": "referralDetails",
                      "type": "FORM"
                    }
                  },
                  {
                    "condition":
                        "0.HFReferralModel.additionalFields.fields.sideEffectPQ1==null&&0.HFReferralModel.symptom==DRUG_SE_PC",
                    "navigateTo": {
                      "data": [
                        {
                          "key": "clientReferenceId",
                          "value": "{{0.HFReferralModel.clientReferenceId}}"
                        },
                        {
                          "key": "referralSymptom",
                          "value": "{{0.HFReferralModel.symptom}}"
                        },
                        {"key": "isUpdate", "value": "true"},
                        {
                          "key": "rowVersion",
                          "value": "{{0.HFReferralModel.rowVersion}}"
                        },
                        {
                          "key": "nameOfChild",
                          "value": "{{0.HFReferralModel.name}}"
                        },
                        {
                          "key": "beneficiaryId",
                          "value": "{{0.HFReferralModel.beneficiaryId}}"
                        },
                        {
                          "key": "referralCode",
                          "value": "{{0.HFReferralModel.referralCode}}"
                        },
                        {
                          "key": "ageInMonths",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.ageInMonths}}"
                        },
                        {
                          "key": "gender",
                          "value":
                              "{{0.HFReferralModel.additionalFields.fields.gender}}"
                        },
                        {
                          "key": "referralReason",
                          "value": "{{0.HFReferralModel.symptom}}"
                        }
                      ],
                      "flow": "REFERRAL_CREATE",
                      "name": "referralDetails",
                      "type": "FORM"
                    }
                  },
                  {
                    "default": true,
                    "navigateTo": {
                      "data": [],
                      "name": "referralInbox",
                      "type": "TEMPLATE"
                    }
                  }
                ]
              }
            }
          ],
          "fieldName": "actionButton",
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
          "type": "template",
          "label": "REFERRAL_OVERVIEW_BACK_BUTTON_LABEL",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "referralInbox", "type": "TEMPLATE"}
            }
          ],
          "fieldName": "backLink"
        }
      ],
      "heading": "REFERRAL_OVERVIEW_HEADING",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "REFERRAL_OVERVIEW_DESCRIPTION",
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "clientReferenceId",
                "value": "{{navigation.clientReferenceId}}",
                "operation": "equals"
              }
            ],
            "name": "hFReferral",
            "type": "SEARCH_EVENT"
          }
        }
      ],
      "wrapperConfig": {
        "filters": [],
        "relations": [],
        "rootEntity": "HFReferralModel",
        "groupByType": true,
        "wrapperName": "hFReferral",
        "searchConfig": {
          "select": ["hFReferral"],
          "primary": "hFReferral"
        }
      },
      "submitCondition": null,
      "preventScreenCapture": false
    },
    {
      "body": [
        {
          "type": "template",
          "label": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_LABEL",
          "format": "panelCard",
          "heading": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_LABEL",
          "fieldName": "referralSuccess",
          "mandatory": true,
          "properties": {"type": "success"},
          "description": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_DESCRIPTION",
          "secondaryAction": {
            "type": "template",
            "label": "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_ACTION_LABEL",
            "format": "button",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {"name": "referralInbox", "type": "TEMPLATE"}
              }
            ],
            "fieldName": "back",
            "mandatory": true
          },
          "secondaryActionLabel":
              "REFERRAL_ACKNOWLEDGEMENT_PANEL_CARD_ACTION_LABEL"
        }
      ],
      "name": "referralAcknowledgement",
      "order": 3,
      "footer": [],
      "header": [],
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "submitCondition": null,
      "preventScreenCapture": false
    },
    {
      "body": [
        {
          "type": "template",
          "label": "REFERRAL_INBOX_SEARCHBAR_LABEL",
          "format": "searchBar",
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "data": [
                  {
                    "key": "name",
                    "value": "field.value",
                    "operation": "contains"
                  }
                ],
                "name": "hFReferral",
                "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT"
              }
            }
          ],
          "fieldName": "searchBar",
          "mandatory": true,
          "validation": [
            {"key": "minSearchChars", "error": "", "value": 3}
          ]
        },
        {
          "type": "template",
          "label": "REFERRAL_INBOX_INFO_CARD_HEADING",
          "format": "infoCard",
          "hidden": false,
          "fieldName": "matchNotFound",
          "description": "REFERRAL_INBOX_INFO_CARD_DESCRIPTION",
          "showOnEmptySearch": true
        },
        {
          "type": "template",
          "child": {
            "format": "card",
            "children": [
              {
                "type": "template",
                "format": "row",
                "children": [
                  {
                    "type": "template",
                    "value": "{{ itemData.name }}",
                    "format": "textTemplate",
                    "fieldName": "referralName"
                  },
                  {
                    "type": "template",
                    "label": "Open",
                    "format": "button",
                    "onAction": [
                      {
                        "actionType": "NAVIGATION",
                        "properties": {
                          "data": [
                            {
                              "key": "clientReferenceId",
                              "value": "{{ itemData.clientReferenceId }}"
                            },
                            {
                              "key": "referralSymptom",
                              "value": "{{ itemData.symptom }}"
                            },
                            {
                              "key": "buttonLabel",
                              "value":
                                  "{{fn:computeReferralButtonLabel(itemData.symptom, itemData.additionalFields.fields)}}"
                            }
                          ],
                          "name": "referralOverview",
                          "type": "TEMPLATE"
                        }
                      }
                    ],
                    "fieldName": "openButton",
                    "properties": {"size": "medium", "type": "secondary"}
                  }
                ],
                "fieldName": "rowtemplate",
                "properties": {
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "spaceBetween"
                }
              },
              {
                "type": "template",
                "format": "row",
                "children": [
                  {
                    "value":
                        "HF_REFERRAL_INBOX_DATE_OF_EVALUATION {{ fn:formatDate(itemData.additionalFields.fields.dateOfEvaluation, 'date', dd MMM yyyy) }}",
                    "format": "textTemplate",
                    "fieldName": "textTemplatetext"
                  }
                ],
                "fieldName": "dateRow",
                "properties": {
                  "mainAxisSize": "max",
                  "mainAxisAlignment": "start"
                }
              }
            ],
            "fieldName": "templateCard"
          },
          "format": "listView",
          "hidden": false,
          "fieldName": "listView",
          "dataSource": "HFReferralModel"
        }
      ],
      "name": "referralInbox",
      "order": 1,
      "footer": [
        {
          "type": "template",
          "label": "REFERRAL_INBOX_PRIMARY_ACTION_LABEL",
          "format": "button",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [
                  {"key": "isUpdate", "value": "false"}
                ],
                "name": "REFERRAL_CREATE",
                "type": "FORM"
              }
            }
          ],
          "fieldName": "createReferral",
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
                "fieldName": "beneficiaryId",
                "onSuccess": [
                  {
                    "actionType": "SEARCH_EVENT",
                    "properties": {
                      "data": [
                        {
                          "key": "beneficiaryId",
                          "value": "{{beneficiaryId}}",
                          "operation": "equals"
                        }
                      ],
                      "name": "hFReferral",
                      "type": "SEARCH_EVENT",
                      "awaitResults": true
                    }
                  },
                  {
                    "actionType": "CONDITIONAL_NAVIGATION",
                    "properties": {
                      "conditions": [
                        {
                          "condition":
                              "0.HFReferralModel.clientReferenceId!=null",
                          "navigateTo": {
                            "data": [
                              {
                                "key": "clientReferenceId",
                                "value":
                                    "{{0.HFReferralModel.clientReferenceId}}"
                              },
                              {
                                "key": "referralSymptom",
                                "value": "{{0.HFReferralModel.symptom}}"
                              }
                            ],
                            "name": "referralOverview",
                            "type": "TEMPLATE"
                          }
                        }
                      ],
                      "defaultAction": {
                        "actionType": "SHOW_TOAST",
                        "properties": {
                          "type": "error",
                          "message": "HF_REFERRAL_NOT_FOUND"
                        }
                      }
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
          "type": "template",
          "label": "REFERRAL_INBOX_BACK_BUTTON_LABEL",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "HOME", "type": "HOME"}
            }
          ],
          "fieldName": "backLinkNavigation"
        }
      ],
      "heading": "REFERRAL_INBOX_HEADING",
      "navigateTo": null,
      "screenType": "TEMPLATE",
      "description": "REFERRAL_INBOX_DESCRIPTION",
      "initActions": [],
      "wrapperConfig": {
        "filters": [],
        "relations": [],
        "rootEntity": "HFReferralModel",
        "groupByType": true,
        "wrapperName": "hFReferral",
        "searchConfig": {
          "select": ["hFReferral"],
          "primary": "hFReferral",
          "pagination": {"limit": 10, "maxItems": 30}
        }
      },
      "submitCondition": null,
      "preventScreenCapture": false
    },
    {
      "name": "REFERRAL_CREATE",
      "pages": [
        {
          "body": [
            {
              "fields": [
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "SICKQ1_YES"},
                    {"code": "NO", "name": "SICKQ1_NO"}
                  ],
                  "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ1_LABEL",
                  "order": 1,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "sickQ1",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ1_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "SICKQ1_YES"},
                    {"code": "NO", "name": "SICKQ1_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ1_REQUIRED_ERROR"
                },
                {
                  "type": "string",
                  "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_LABEL",
                  "order": 2,
                  "value": "",
                  "format": "text",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "sickQ4",
                  "mandatory": false,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_REQUIRED_ERROR",
                  "visibilityCondition": {
                    "expression": [
                      {"condition": "sideEffectSick.sickQ1==YES"}
                    ]
                  }
                },
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "SICKQ2_YES"},
                    {"code": "NO", "name": "SICKQ2_NO"}
                  ],
                  "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ2_LABEL",
                  "order": 3,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "sickQ2",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ2_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "SICKQ2_YES"},
                    {"code": "NO", "name": "SICKQ2_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ2_REQUIRED_ERROR"
                },
                {
                  "type": "string",
                  "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_LABEL",
                  "order": 4,
                  "value": "",
                  "format": "text",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "sickQ5",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_REQUIRED_ERROR",
                  "visibilityCondition": {
                    "expression": [
                      {"condition": "sideEffectSick.sickQ2==YES"}
                    ]
                  }
                },
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "SICKQ3_YES"},
                    {"code": "NO", "name": "SICKQ3_NO"}
                  ],
                  "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ3_LABEL",
                  "order": 5,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "sickQ3",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ3_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "SICKQ3_YES"},
                    {"code": "NO", "name": "SICKQ3_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ3_REQUIRED_ERROR"
                }
              ]
            }
          ],
          "flow": "REFERRAL_CREATE",
          "page": "sideEffectSick",
          "type": "object",
          "label": "HFREFERRAL_SIDEEFFECTFROMSICK_HEADING",
          "order": 4.4,
          "footer": [
            {
              "label": "HFREFERRAL_SIDEEFFECTFROMSICK_ACTION_LABEL",
              "format": "button",
              "onAction": [
                {
                  "actionType": "SEARCH_EVENT",
                  "properties": {
                    "data": [
                      {
                        "key": "clientReferenceId",
                        "root": "HFReferral",
                        "value": "{{navigation.clientReferenceId}}",
                        "operation": "equals"
                      }
                    ],
                    "name": "HFReferral",
                    "applyIf": "navigation.isUpdate==true",
                    "awaitResults": true
                  }
                },
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "referralCreation"
                  }
                },
                {
                  "actionType": "CREATE_EVENT",
                  "properties": {
                    "entity": "",
                    "applyIf": "navigation.isUpdate!=true",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to create."}
                      }
                    ]
                  }
                },
                {
                  "actionType": "MERGE_UPDATE_ADDITIONAL_FIELDS",
                  "properties": {
                    "applyIf": "navigation.isUpdate==true",
                    "entityType": "HFReferralModel",
                    "collectFromPages": ["sideEffectSick"],
                    "clientReferenceId": "{{navigation.clientReferenceId}}"
                  }
                },
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "data": [],
                    "name": "referralAcknowledgement",
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
              "properties": {
                "size": "large",
                "type": "primary",
                "mainAxisSize": "max",
                "mainAxisAlignment": "center"
              }
            }
          ],
          "module": "HFREFERRAL",
          "heading": "HFREFERRAL_SIDEEFFECTFROMSICK_HEADING",
          "project": "MR-DN",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "data": [
                  {
                    "key": "clientReferenceId",
                    "root": "HFReferral",
                    "value": "{{navigation.clientReferenceId}}",
                    "operation": "equals"
                  }
                ],
                "name": "HFReferral",
                "applyIf": "navigation.isUpdate==true",
                "awaitResults": true
              }
            },
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to fetch config."}
                  }
                ],
                "configName": "referralCreation"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "",
                "applyIf": "navigation.isUpdate!=true",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to create."}
                  }
                ]
              }
            },
            {
              "actionType": "MERGE_UPDATE_ADDITIONAL_FIELDS",
              "properties": {
                "applyIf": "navigation.isUpdate==true",
                "entityType": "HFReferralModel",
                "collectFromPages": ["sideEffectSick"],
                "clientReferenceId": "{{navigation.clientReferenceId}}"
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [],
                "name": "referralAcknowledgement",
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
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SICKQ1_YES"},
                {"code": "NO", "name": "SICKQ1_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ1_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "sickQ1",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ1_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "SICKQ1_YES"},
                {"code": "NO", "name": "SICKQ1_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ1_REQUIRED_ERROR"
            },
            {
              "type": "string",
              "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "sickQ4",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ4_REQUIRED_ERROR",
              "visibilityCondition": {
                "expression": [
                  {"condition": "sideEffectSick.sickQ1==YES"}
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SICKQ2_YES"},
                {"code": "NO", "name": "SICKQ2_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ2_LABEL",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "sickQ2",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ2_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "SICKQ2_YES"},
                {"code": "NO", "name": "SICKQ2_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ2_REQUIRED_ERROR"
            },
            {
              "type": "string",
              "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "sickQ5",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ5_REQUIRED_ERROR",
              "visibilityCondition": {
                "expression": [
                  {"condition": "sideEffectSick.sickQ2==YES"}
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SICKQ3_YES"},
                {"code": "NO", "name": "SICKQ3_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ3_LABEL",
              "order": 5,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "sickQ3",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ3_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "SICKQ3_YES"},
                {"code": "NO", "name": "SICKQ3_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMSICK_sickQ3_REQUIRED_ERROR"
            }
          ],
          "actionLabel": "HFREFERRAL_SIDEEFFECTFROMSICK_ACTION_LABEL",
          "description": "HFREFERRAL_SIDEEFFECTFROMSICK_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false,
          "conditionalNavigateTo": null
        },
        {
          "body": [
            {
              "fields": [
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "SIDE_EFFECT_PREQ1_YES"},
                    {"code": "NO", "name": "SIDE_EFFECT_PREQ1_NO"}
                  ],
                  "label":
                      "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ1_LABEL",
                  "order": 1,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "sideEffectPQ1",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ1_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "SIDE_EFFECT_PREQ1_YES"},
                    {"code": "NO", "name": "SIDE_EFFECT_PREQ1_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ1_REQUIRED_ERROR"
                },
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "SIDE_EFFECT_PREQ2_YES"},
                    {"code": "NO", "name": "SIDE_EFFECT_PREQ2_NO"}
                  ],
                  "label":
                      "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ2_LABEL",
                  "order": 2,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "sideEffectPQ2",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ2_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "SIDE_EFFECT_PREQ2_YES"},
                    {"code": "NO", "name": "SIDE_EFFECT_PREQ2_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ2_REQUIRED_ERROR"
                },
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "SIDE_EFFECT_PREQ3_YES"},
                    {"code": "NO", "name": "SIDE_EFFECT_PREQ3_NO"}
                  ],
                  "label":
                      "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ3_LABEL",
                  "order": 3,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "sideEffectPQ3",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ3_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "SIDE_EFFECT_PREQ3_YES"},
                    {"code": "NO", "name": "SIDE_EFFECT_PREQ3_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ3_REQUIRED_ERROR"
                }
              ]
            }
          ],
          "flow": "REFERRAL_CREATE",
          "page": "sideEffectFromPreviousCycle",
          "type": "object",
          "label": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_HEADING",
          "order": 4.2,
          "footer": [
            {
              "label": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_ACTION_LABEL",
              "format": "button",
              "onAction": [
                {
                  "actionType": "SEARCH_EVENT",
                  "properties": {
                    "data": [
                      {
                        "key": "clientReferenceId",
                        "root": "HFReferral",
                        "value": "{{navigation.clientReferenceId}}",
                        "operation": "equals"
                      }
                    ],
                    "name": "HFReferral",
                    "applyIf": "navigation.isUpdate==true",
                    "awaitResults": true
                  }
                },
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "referralCreation"
                  }
                },
                {
                  "actionType": "CREATE_EVENT",
                  "properties": {
                    "entity": "",
                    "applyIf": "navigation.isUpdate!=true",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to create."}
                      }
                    ]
                  }
                },
                {
                  "actionType": "MERGE_UPDATE_ADDITIONAL_FIELDS",
                  "properties": {
                    "applyIf": "navigation.isUpdate==true",
                    "entityType": "HFReferralModel",
                    "collectFromPages": ["sideEffectFromPreviousCycle"],
                    "clientReferenceId": "{{navigation.clientReferenceId}}"
                  }
                },
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "data": [],
                    "name": "referralAcknowledgement",
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
              "properties": {
                "size": "large",
                "type": "primary",
                "mainAxisSize": "max",
                "mainAxisAlignment": "center"
              }
            }
          ],
          "module": "HFREFERRAL",
          "heading": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_HEADING",
          "project": "MR-DN",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "data": [
                  {
                    "key": "clientReferenceId",
                    "root": "HFReferral",
                    "value": "{{navigation.clientReferenceId}}",
                    "operation": "equals"
                  }
                ],
                "name": "HFReferral",
                "applyIf": "navigation.isUpdate==true",
                "awaitResults": true
              }
            },
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to fetch config."}
                  }
                ],
                "configName": "referralCreation"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "",
                "applyIf": "navigation.isUpdate!=true",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to create."}
                  }
                ]
              }
            },
            {
              "actionType": "MERGE_UPDATE_ADDITIONAL_FIELDS",
              "properties": {
                "applyIf": "navigation.isUpdate==true",
                "entityType": "HFReferralModel",
                "collectFromPages": ["sideEffectFromPreviousCycle"],
                "clientReferenceId": "{{navigation.clientReferenceId}}"
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [],
                "name": "referralAcknowledgement",
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
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SIDE_EFFECT_PREQ1_YES"},
                {"code": "NO", "name": "SIDE_EFFECT_PREQ1_NO"}
              ],
              "label":
                  "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ1_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "sideEffectPQ1",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ1_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "SIDE_EFFECT_PREQ1_YES"},
                {"code": "NO", "name": "SIDE_EFFECT_PREQ1_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ1_REQUIRED_ERROR"
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SIDE_EFFECT_PREQ2_YES"},
                {"code": "NO", "name": "SIDE_EFFECT_PREQ2_NO"}
              ],
              "label":
                  "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ2_LABEL",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "sideEffectPQ2",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ2_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "SIDE_EFFECT_PREQ2_YES"},
                {"code": "NO", "name": "SIDE_EFFECT_PREQ2_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ2_REQUIRED_ERROR"
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SIDE_EFFECT_PREQ3_YES"},
                {"code": "NO", "name": "SIDE_EFFECT_PREQ3_NO"}
              ],
              "label":
                  "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ3_LABEL",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "sideEffectPQ3",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ3_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "SIDE_EFFECT_PREQ3_YES"},
                {"code": "NO", "name": "SIDE_EFFECT_PREQ3_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_sideEffectPQ3_REQUIRED_ERROR"
            }
          ],
          "actionLabel": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_ACTION_LABEL",
          "description": "HFREFERRAL_SIDEEFFECTFROMPREVIOUSCYCLE_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false
        },
        {
          "body": [
            {
              "fields": [
                {
                  "type": "string",
                  "label": "HFREFERRAL_REFERRAL_DETAILS_referralCycle_LABEL",
                  "order": 1,
                  "value": "",
                  "format": "custom",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "referralCycle",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_REFERRAL_DETAILS_referralCycle_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "required.message":
                      "HFREFERRAL_REFERRAL_DETAILS_referralCycle_REQUIRED_ERROR"
                },
                {
                  "type": "string",
                  "label": "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_LABEL",
                  "order": 2,
                  "value": "",
                  "format": "text",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "nameOfChild",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "required.message":
                      "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_REQUIRED_ERROR"
                },
                {
                  "type": "string",
                  "label": "HFREFERRAL_REFERRAL_DETAILS_beneficiaryId_LABEL",
                  "order": 3,
                  "value": "",
                  "format": "text",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "fieldName": "beneficiaryId",
                  "mandatory": false,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "systemDate": false,
                  "validations": [],
                  "errorMessage": "",
                  "isMultiSelect": false
                },
                {
                  "type": "string",
                  "label": "HFREFERRAL_REFERRAL_DETAILS_referralCode_LABEL",
                  "order": 4,
                  "value": "",
                  "format": "text",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "fieldName": "referralCode",
                  "mandatory": false,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "systemDate": false,
                  "validations": [],
                  "errorMessage": "",
                  "isMultiSelect": false
                },
                {
                  "type": "integer",
                  "label": "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_LABEL",
                  "order": 5,
                  "value": "",
                  "format": "text",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "ageInMonths",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_REQUIRED_ERROR"
                    },
                    {
                      "type": "min",
                      "value": 3,
                      "message":
                          "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_VALIDATION"
                    },
                    {
                      "type": "max",
                      "value": 59,
                      "message":
                          "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_VALIDATION"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "required.message":
                      "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_REQUIRED_ERROR"
                },
                {
                  "type": "string",
                  "enums": [
                    {"code": "OTHER", "name": "OTHER"},
                    {"code": "FEMALE", "name": "FEMALE"},
                    {"code": "MALE", "name": "MALE"}
                  ],
                  "label": "HFREFERRAL_REFERRAL_DETAILS_gender_LABEL",
                  "order": 6,
                  "value": "",
                  "format": "dropdown",
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
                      "message":
                          "HFREFERRAL_REFERRAL_DETAILS_gender_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "OTHER", "name": "OTHER"},
                    {"code": "FEMALE", "name": "FEMALE"},
                    {"code": "MALE", "name": "MALE"}
                  ],
                  "required.message":
                      "HFREFERRAL_REFERRAL_DETAILS_gender_REQUIRED_ERROR"
                },
                {
                  "type": "string",
                  "enums": [
                    {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                    {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                    {"code": "FEVER", "name": "FEVER"},
                    {"code": "SICK", "name": "SICK"}
                  ],
                  "label": "HFREFERRAL_REFERRAL_DETAILS_referralReason_LABEL",
                  "order": 7,
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
                      "message":
                          "HFREFERRAL_REFERRAL_DETAILS_referralReason_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                    {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                    {"code": "FEVER", "name": "FEVER"},
                    {"code": "SICK", "name": "SICK"}
                  ],
                  "required.message":
                      "HFREFERRAL_REFERRAL_DETAILS_referralReason_REQUIRED_ERROR",
                  "visibilityCondition": {
                    "expression": [
                      {
                        "type": "custom",
                        "condition": "navigation.isUpdate!=true"
                      }
                    ]
                  }
                }
              ]
            }
          ],
          "flow": "REFERRAL_CREATE",
          "page": "referralDetails",
          "type": "object",
          "label": "HFREFERRAL_REFERRAL_DETAILS_HEADING",
          "order": 3,
          "footer": [
            {
              "label": "HFREFERRAL_REFERRAL_DETAILS_ACTION_LABEL",
              "format": "button",
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "name": "ReferralReconAcknowledgement",
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
          "module": "HFREFERRAL",
          "heading": "HFREFERRAL_REFERRAL_DETAILS_HEADING",
          "project": "MR-DN",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to fetch config."}
                  }
                ],
                "configName": "referralCreation"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "",
                "applyIf": "navigation.isUpdate!=true",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to create."}
                  }
                ]
              }
            },
            {
              "actionType": "UPDATE_EVENT",
              "properties": {"applyIf": "navigation.isUpdate==true"}
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [],
                "name": "referralAcknowledgement",
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
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "label": "HFREFERRAL_REFERRAL_DETAILS_referralCycle_LABEL",
              "order": 1,
              "value": "",
              "format": "custom",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "referralCycle",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_REFERRAL_DETAILS_referralCycle_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "HFREFERRAL_REFERRAL_DETAILS_referralCycle_REQUIRED_ERROR"
            },
            {
              "type": "string",
              "label": "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_LABEL",
              "order": 2,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "nameOfChild",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "HFREFERRAL_REFERRAL_DETAILS_nameOfChild_REQUIRED_ERROR"
            },
            {
              "type": "string",
              "label": "HFREFERRAL_REFERRAL_DETAILS_beneficiaryId_LABEL",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "beneficiaryId",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "HFREFERRAL_REFERRAL_DETAILS_referralCode_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "referralCode",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_LABEL",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "ageInMonths",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "HFREFERRAL_REFERRAL_DETAILS_ageInMonths_REQUIRED_ERROR"
            },
            {
              "type": "string",
              "enums": [
                {"code": "OTHER", "name": "OTHER"},
                {"code": "FEMALE", "name": "FEMALE"},
                {"code": "MALE", "name": "MALE"}
              ],
              "label": "HFREFERRAL_REFERRAL_DETAILS_gender_LABEL",
              "order": 6,
              "value": "",
              "format": "dropdown",
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
                  "message": "HFREFERRAL_REFERRAL_DETAILS_gender_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "OTHER", "name": "OTHER"},
                {"code": "FEMALE", "name": "FEMALE"},
                {"code": "MALE", "name": "MALE"}
              ],
              "required.message":
                  "HFREFERRAL_REFERRAL_DETAILS_gender_REQUIRED_ERROR"
            },
            {
              "type": "string",
              "enums": [
                {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                {"code": "FEVER", "name": "FEVER"},
                {"code": "SICK", "name": "SICK"}
              ],
              "label": "HFREFERRAL_REFERRAL_DETAILS_referralReason_LABEL",
              "order": 7,
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
                  "message":
                      "HFREFERRAL_REFERRAL_DETAILS_referralReason_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                {"code": "FEVER", "name": "FEVER"},
                {"code": "SICK", "name": "SICK"}
              ],
              "required.message":
                  "HFREFERRAL_REFERRAL_DETAILS_referralReason_REQUIRED_ERROR",
              "visibilityCondition": {
                "expression": [
                  {"type": "custom", "condition": "navigation.isUpdate!=true"}
                ]
              }
            }
          ],
          "actionLabel": "HFREFERRAL_REFERRAL_DETAILS_ACTION_LABEL",
          "description": "HFREFERRAL_REFERRAL_DETAILS_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false,
          "conditionalNavigateTo": [
            {
              "type": "custom",
              "condition":
                  "navigation.isUpdate==true&&navigation.referralSymptom==DRUG_SE_CC",
              "navigateTo": {
                "data": [
                  {
                    "key": "clientReferenceId",
                    "value": "{{navigation.clientReferenceId}}"
                  },
                  {
                    "key": "referralSymptom",
                    "value": "{{navigation.referralSymptom}}"
                  },
                  {"key": "isUpdate", "value": "true"},
                  {"key": "rowVersion", "value": "{{navigation.rowVersion}}"}
                ],
                "name": "sideEffectFromCurrentCycle",
                "type": "form"
              }
            },
            {
              "type": "custom",
              "condition":
                  "navigation.isUpdate==true&&navigation.referralSymptom==DRUG_SE_PC",
              "navigateTo": {
                "data": [
                  {
                    "key": "clientReferenceId",
                    "value": "{{navigation.clientReferenceId}}"
                  },
                  {
                    "key": "referralSymptom",
                    "value": "{{navigation.referralSymptom}}"
                  },
                  {"key": "isUpdate", "value": "true"},
                  {"key": "rowVersion", "value": "{{navigation.rowVersion}}"}
                ],
                "name": "sideEffectFromPreviousCycle",
                "type": "form"
              }
            },
            {
              "type": "custom",
              "condition":
                  "navigation.isUpdate==true&&navigation.referralSymptom==FEVER",
              "navigateTo": {
                "data": [
                  {
                    "key": "clientReferenceId",
                    "value": "{{navigation.clientReferenceId}}"
                  },
                  {
                    "key": "referralSymptom",
                    "value": "{{navigation.referralSymptom}}"
                  },
                  {"key": "isUpdate", "value": "true"},
                  {"key": "rowVersion", "value": "{{navigation.rowVersion}}"}
                ],
                "name": "sideEffectFever",
                "type": "form"
              }
            },
            {
              "type": "custom",
              "condition":
                  "navigation.isUpdate==true&&navigation.referralSymptom==SICK",
              "navigateTo": {
                "data": [
                  {
                    "key": "clientReferenceId",
                    "value": "{{navigation.clientReferenceId}}"
                  },
                  {
                    "key": "referralSymptom",
                    "value": "{{navigation.referralSymptom}}"
                  },
                  {"key": "isUpdate", "value": "true"},
                  {"key": "rowVersion", "value": "{{navigation.rowVersion}}"}
                ],
                "name": "sideEffectSick",
                "type": "form"
              }
            },
            {
              "condition": "referralDetails.referralReason==DRUG_SE_CC",
              "navigateTo": {
                "name": "sideEffectFromCurrentCycle",
                "type": "form"
              }
            },
            {
              "condition": "referralDetails.referralReason==DRUG_SE_PC",
              "navigateTo": {
                "name": "sideEffectFromPreviousCycle",
                "type": "form"
              }
            },
            {
              "condition": "referralDetails.referralReason==FEVER",
              "navigateTo": {"name": "sideEffectFever", "type": "form"}
            },
            {
              "condition": "referralDetails.referralReason==SICK",
              "navigateTo": {"name": "sideEffectSick", "type": "form"}
            }
          ]
        },
        {
          "body": [
            {
              "fields": [
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "FEVERQ1_YES"},
                    {"code": "NO", "name": "FEVERQ1_NO"}
                  ],
                  "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ1_LABEL",
                  "order": 1,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "feverQ1",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ1_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "FEVERQ1_YES"},
                    {"code": "NO", "name": "FEVERQ1_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ1_REQUIRED_ERROR"
                },
                {
                  "type": "string",
                  "enums": [
                    {"code": "POSITIVE", "name": "FEVERQ2_POSITIVE"},
                    {"code": "NEGATIVE", "name": "FEVERQ2_NEGATIVE"}
                  ],
                  "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ2_LABEL",
                  "order": 2,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "feverQ2",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ2_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "POSITIVE", "name": "FEVERQ2_POSITIVE"},
                    {"code": "NEGATIVE", "name": "FEVERQ2_NEGATIVE"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ2_REQUIRED_ERROR",
                  "visibilityCondition": {
                    "expression": [
                      {"condition": "sideEffectFever.feverQ1==YES"}
                    ]
                  }
                },
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "FEVERQ3_YES"},
                    {"code": "NO", "name": "FEVERQ2_NO"}
                  ],
                  "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ3_LABEL",
                  "order": 3,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "feverQ3",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ3_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "FEVERQ3_YES"},
                    {"code": "NO", "name": "FEVERQ2_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ3_REQUIRED_ERROR",
                  "visibilityCondition": {
                    "expression": [
                      {"condition": "sideEffectFever.feverQ2==NEGATIVE"}
                    ]
                  }
                },
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "FEVERQ4_YES"},
                    {"code": "NO", "name": "FEVERQ4_NO"}
                  ],
                  "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ4_LABEL",
                  "order": 4,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "feverQ4",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ4_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "FEVERQ4_YES"},
                    {"code": "NO", "name": "FEVERQ4_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ4_REQUIRED_ERROR",
                  "visibilityCondition": {
                    "expression": [
                      {"condition": "sideEffectFever.feverQ2==POSITIVE"}
                    ]
                  }
                },
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "FEVERQ5_YES"},
                    {"code": "NO", "name": "FEVERQ5_NO"}
                  ],
                  "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ5_LABEL",
                  "order": 5,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "feverQ5",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ5_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "FEVERQ5_YES"},
                    {"code": "NO", "name": "FEVERQ5_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ5_REQUIRED_ERROR",
                  "visibilityCondition": {
                    "expression": [
                      {"condition": "sideEffectFever.feverQ2==POSITIVE"}
                    ]
                  }
                },
                {
                  "type": "string",
                  "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_LABEL",
                  "order": 6,
                  "value": "",
                  "format": "text",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "feverQ6",
                  "mandatory": false,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_REQUIRED_ERROR",
                  "visibilityCondition": {
                    "expression": [
                      {"condition": "sideEffectFever.feverQ5==YES"}
                    ]
                  }
                }
              ]
            }
          ],
          "flow": "REFERRAL_CREATE",
          "page": "sideEffectFever",
          "type": "object",
          "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_HEADING",
          "order": 4.3,
          "footer": [
            {
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_ACTION_LABEL",
              "format": "button",
              "onAction": [
                {
                  "actionType": "SEARCH_EVENT",
                  "properties": {
                    "data": [
                      {
                        "key": "clientReferenceId",
                        "root": "HFReferral",
                        "value": "{{navigation.clientReferenceId}}",
                        "operation": "equals"
                      }
                    ],
                    "name": "HFReferral",
                    "applyIf": "navigation.isUpdate==true",
                    "awaitResults": true
                  }
                },
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "referralCreation"
                  }
                },
                {
                  "actionType": "CREATE_EVENT",
                  "properties": {
                    "entity": "",
                    "applyIf": "navigation.isUpdate!=true",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to create."}
                      }
                    ]
                  }
                },
                {
                  "actionType": "MERGE_UPDATE_ADDITIONAL_FIELDS",
                  "properties": {
                    "applyIf": "navigation.isUpdate==true",
                    "entityType": "HFReferralModel",
                    "collectFromPages": ["sideEffectFever"],
                    "clientReferenceId": "{{navigation.clientReferenceId}}"
                  }
                },
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "data": [],
                    "name": "referralAcknowledgement",
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
              "properties": {
                "size": "large",
                "type": "primary",
                "mainAxisSize": "max",
                "mainAxisAlignment": "center"
              }
            }
          ],
          "module": "HFREFERRAL",
          "heading": "HFREFERRAL_SIDEEFFECTFROMFEVER_HEADING",
          "project": "MR-DN",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "data": [
                  {
                    "key": "clientReferenceId",
                    "root": "HFReferral",
                    "value": "{{navigation.clientReferenceId}}",
                    "operation": "equals"
                  }
                ],
                "name": "HFReferral",
                "applyIf": "navigation.isUpdate==true",
                "awaitResults": true
              }
            },
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to fetch config."}
                  }
                ],
                "configName": "referralCreation"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "",
                "applyIf": "navigation.isUpdate!=true",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to create."}
                  }
                ]
              }
            },
            {
              "actionType": "MERGE_UPDATE_ADDITIONAL_FIELDS",
              "properties": {
                "applyIf": "navigation.isUpdate==true",
                "entityType": "HFReferralModel",
                "collectFromPages": ["sideEffectFever"],
                "clientReferenceId": "{{navigation.clientReferenceId}}"
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [],
                "name": "referralAcknowledgement",
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
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "FEVERQ1_YES"},
                {"code": "NO", "name": "FEVERQ1_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ1_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "feverQ1",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ1_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "FEVERQ1_YES"},
                {"code": "NO", "name": "FEVERQ1_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ1_REQUIRED_ERROR"
            },
            {
              "type": "string",
              "enums": [
                {"code": "POSITIVE", "name": "FEVERQ2_POSITIVE"},
                {"code": "NEGATIVE", "name": "FEVERQ2_NEGATIVE"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ2_LABEL",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "feverQ2",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ2_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "POSITIVE", "name": "FEVERQ2_POSITIVE"},
                {"code": "NEGATIVE", "name": "FEVERQ2_NEGATIVE"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ2_REQUIRED_ERROR",
              "visibilityCondition": {
                "expression": [
                  {"condition": "sideEffectFever.feverQ1==YES"}
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "FEVERQ3_YES"},
                {"code": "NO", "name": "FEVERQ2_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ3_LABEL",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "feverQ3",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ3_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "FEVERQ3_YES"},
                {"code": "NO", "name": "FEVERQ2_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ3_REQUIRED_ERROR",
              "visibilityCondition": {
                "expression": [
                  {"condition": "sideEffectFever.feverQ2==NEGATIVE"}
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "FEVERQ4_YES"},
                {"code": "NO", "name": "FEVERQ4_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ4_LABEL",
              "order": 4,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "feverQ4",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ4_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "FEVERQ4_YES"},
                {"code": "NO", "name": "FEVERQ4_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ4_REQUIRED_ERROR",
              "visibilityCondition": {
                "expression": [
                  {"condition": "sideEffectFever.feverQ2==POSITIVE"}
                ]
              }
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "FEVERQ5_YES"},
                {"code": "NO", "name": "FEVERQ5_NO"}
              ],
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ5_LABEL",
              "order": 5,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "feverQ5",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ5_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "FEVERQ5_YES"},
                {"code": "NO", "name": "FEVERQ5_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ5_REQUIRED_ERROR",
              "visibilityCondition": {
                "expression": [
                  {"condition": "sideEffectFever.feverQ2==POSITIVE"}
                ]
              }
            },
            {
              "type": "string",
              "label": "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_LABEL",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "feverQ6",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMFEVER_feverQ6_REQUIRED_ERROR",
              "visibilityCondition": {
                "expression": [
                  {"condition": "sideEffectFever.feverQ5==YES"}
                ]
              }
            }
          ],
          "actionLabel": "HFREFERRAL_SIDEEFFECTFROMFEVER_ACTION_LABEL",
          "description": "HFREFERRAL_SIDEEFFECTFROMFEVER_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false
        },
        {
          "body": [
            {
              "fields": [
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "SIDE_EFFECTQ1_YES"},
                    {"code": "NO", "name": "SIDE_EFFECTQ1_NO"}
                  ],
                  "label":
                      "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ1_LABEL",
                  "order": 1,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "sideEffectQ1",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ1_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "SIDE_EFFECTQ1_YES"},
                    {"code": "NO", "name": "SIDE_EFFECTQ1_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ1_REQUIRED_ERROR"
                },
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "SIDE_EFFECTQ2_YES"},
                    {"code": "NO", "name": "SIDE_EFFECTQ2_NO"}
                  ],
                  "label":
                      "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ2_LABEL",
                  "order": 2,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "sideEffectQ2",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ2_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "SIDE_EFFECTQ2_YES"},
                    {"code": "NO", "name": "SIDE_EFFECTQ2_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ2_REQUIRED_ERROR"
                },
                {
                  "type": "string",
                  "enums": [
                    {"code": "YES", "name": "SIDE_EFFECTQ3_YES"},
                    {"code": "NO", "name": "SIDE_EFFECTQ3_NO"}
                  ],
                  "label":
                      "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ3_LABEL",
                  "order": 3,
                  "value": "",
                  "format": "radio",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "sideEffectQ3",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ3_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [
                    {"code": "YES", "name": "SIDE_EFFECTQ3_YES"},
                    {"code": "NO", "name": "SIDE_EFFECTQ3_NO"}
                  ],
                  "required.message":
                      "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ3_REQUIRED_ERROR"
                }
              ]
            }
          ],
          "flow": "REFERRAL_CREATE",
          "page": "sideEffectFromCurrentCycle",
          "type": "object",
          "label": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_HEADING",
          "order": 4.1,
          "footer": [
            {
              "label": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_ACTION_LABEL",
              "format": "button",
              "onAction": [
                {
                  "actionType": "SEARCH_EVENT",
                  "properties": {
                    "data": [
                      {
                        "key": "clientReferenceId",
                        "root": "HFReferral",
                        "value": "{{navigation.clientReferenceId}}",
                        "operation": "equals"
                      }
                    ],
                    "name": "HFReferral",
                    "applyIf": "navigation.isUpdate==true",
                    "awaitResults": true
                  }
                },
                {
                  "actionType": "FETCH_TRANSFORMER_CONFIG",
                  "properties": {
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to fetch config."}
                      }
                    ],
                    "configName": "referralCreation"
                  }
                },
                {
                  "actionType": "CREATE_EVENT",
                  "properties": {
                    "entity": "",
                    "applyIf": "navigation.isUpdate!=true",
                    "onError": [
                      {
                        "actionType": "SHOW_TOAST",
                        "properties": {"message": "Failed to create."}
                      }
                    ]
                  }
                },
                {
                  "actionType": "MERGE_UPDATE_ADDITIONAL_FIELDS",
                  "properties": {
                    "applyIf": "navigation.isUpdate==true",
                    "entityType": "HFReferralModel",
                    "collectFromPages": ["sideEffectFromCurrentCycle"],
                    "clientReferenceId": "{{navigation.clientReferenceId}}"
                  }
                },
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "data": [],
                    "name": "referralAcknowledgement",
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
              "properties": {
                "size": "large",
                "type": "primary",
                "mainAxisSize": "max",
                "mainAxisAlignment": "center"
              }
            }
          ],
          "module": "HFREFERRAL",
          "heading": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_HEADING",
          "project": "MR-DN",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "data": [
                  {
                    "key": "clientReferenceId",
                    "root": "HFReferral",
                    "value": "{{navigation.clientReferenceId}}",
                    "operation": "equals"
                  }
                ],
                "name": "HFReferral",
                "applyIf": "navigation.isUpdate==true",
                "awaitResults": true
              }
            },
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to fetch config."}
                  }
                ],
                "configName": "referralCreation"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "",
                "applyIf": "navigation.isUpdate!=true",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to create."}
                  }
                ]
              }
            },
            {
              "actionType": "MERGE_UPDATE_ADDITIONAL_FIELDS",
              "properties": {
                "applyIf": "navigation.isUpdate==true",
                "entityType": "HFReferralModel",
                "collectFromPages": ["sideEffectFromCurrentCycle"],
                "clientReferenceId": "{{navigation.clientReferenceId}}"
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "data": [],
                "name": "referralAcknowledgement",
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
          "navigateTo": {
            "name": "ReferralReconAcknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SIDE_EFFECTQ1_YES"},
                {"code": "NO", "name": "SIDE_EFFECTQ1_NO"}
              ],
              "label":
                  "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ1_LABEL",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "sideEffectQ1",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ1_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "SIDE_EFFECTQ1_YES"},
                {"code": "NO", "name": "SIDE_EFFECTQ1_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ1_REQUIRED_ERROR"
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SIDE_EFFECTQ2_YES"},
                {"code": "NO", "name": "SIDE_EFFECTQ2_NO"}
              ],
              "label":
                  "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ2_LABEL",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "sideEffectQ2",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ2_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "SIDE_EFFECTQ2_YES"},
                {"code": "NO", "name": "SIDE_EFFECTQ2_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ2_REQUIRED_ERROR"
            },
            {
              "type": "string",
              "enums": [
                {"code": "YES", "name": "SIDE_EFFECTQ3_YES"},
                {"code": "NO", "name": "SIDE_EFFECTQ3_NO"}
              ],
              "label":
                  "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ3_LABEL",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "sideEffectQ3",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ3_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [
                {"code": "YES", "name": "SIDE_EFFECTQ3_YES"},
                {"code": "NO", "name": "SIDE_EFFECTQ3_NO"}
              ],
              "required.message":
                  "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_sideEffectQ3_REQUIRED_ERROR"
            }
          ],
          "actionLabel": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_ACTION_LABEL",
          "description": "HFREFERRAL_SIDEEFFECTFROMCURRENTCYCLE_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false
        },
        {
          "body": [
            {
              "fields": [
                {
                  "type": "string",
                  "label":
                      "HFREFERRAL_FACILITY_DETAILS_administrativeArea_LABEL",
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
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_FACILITY_DETAILS_administrativeArea_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "required.message":
                      "HFREFERRAL_FACILITY_DETAILS_administrativeArea_REQUIRED_ERROR"
                },
                {
                  "type": "integer",
                  "label": "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_LABEL",
                  "order": 2,
                  "value": "",
                  "format": "date",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": true,
                  "required": true,
                  "fieldName": "dateOfEvaluation",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": true,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "required.message":
                      "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_REQUIRED_ERROR"
                },
                {
                  "type": "dynamic",
                  "enums": [],
                  "label":
                      "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_LABEL",
                  "order": 3,
                  "value": "",
                  "format": "custom",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "required": true,
                  "fieldName": "evaluationFacility",
                  "mandatory": true,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [
                    {
                      "type": "required",
                      "value": true,
                      "message":
                          "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_REQUIRED_ERROR"
                    }
                  ],
                  "errorMessage": "",
                  "isMultiSelect": false,
                  "dropDownOptions": [],
                  "required.message":
                      "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_REQUIRED_ERROR"
                },
                {
                  "type": "string",
                  "label": "HFREFERRAL_FACILITY_DETAILS_hfCoordinator_LABEL",
                  "order": 4,
                  "value": "",
                  "format": "text",
                  "hidden": false,
                  "isMdms": false,
                  "tooltip": "",
                  "helpText": "",
                  "infoText": "",
                  "readOnly": false,
                  "fieldName": "hfCoordinator",
                  "mandatory": false,
                  "deleteFlag": false,
                  "innerLabel": "",
                  "schemaCode": "",
                  "systemDate": false,
                  "validations": [],
                  "errorMessage": "",
                  "isMultiSelect": false
                }
              ]
            }
          ],
          "flow": "REFERRAL_CREATE",
          "page": "facilityDetails",
          "type": "object",
          "label": "HFREFERRAL_FACILITY_DETAILS_HEADING",
          "order": 2,
          "footer": [
            {
              "label": "HFREFERRAL_FACILITY_DETAILS_ACTION_LABEL",
              "format": "button",
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {"name": "referralDetails", "type": "form"}
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
          "module": "HFREFERRAL",
          "heading": "HFREFERRAL_FACILITY_DETAILS_HEADING",
          "project": "MR-DN",
          "summary": false,
          "version": 1,
          "onAction": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to fetch config."}
                  }
                ],
                "configName": "referralCreation"
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "",
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
                "data": [],
                "name": "referralAcknowledgement",
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
          "navigateTo": {"name": "referralDetails", "type": "form"},
          "properties": [
            {
              "type": "string",
              "label": "HFREFERRAL_FACILITY_DETAILS_administrativeArea_LABEL",
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
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_FACILITY_DETAILS_administrativeArea_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "HFREFERRAL_FACILITY_DETAILS_administrativeArea_REQUIRED_ERROR"
            },
            {
              "type": "integer",
              "label": "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_LABEL",
              "order": 2,
              "value": "",
              "format": "date",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "required": true,
              "fieldName": "dateOfEvaluation",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "required.message":
                  "HFREFERRAL_FACILITY_DETAILS_dateOfEvaluation_REQUIRED_ERROR"
            },
            {
              "type": "dynamic",
              "enums": [],
              "label": "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_LABEL",
              "order": 3,
              "value": "",
              "format": "custom",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "required": true,
              "fieldName": "evaluationFacility",
              "mandatory": true,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message":
                      "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_REQUIRED_ERROR"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false,
              "dropDownOptions": [],
              "required.message":
                  "HFREFERRAL_FACILITY_DETAILS_evaluationFacility_REQUIRED_ERROR"
            },
            {
              "type": "string",
              "label": "HFREFERRAL_FACILITY_DETAILS_hfCoordinator_LABEL",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": false,
              "isMdms": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "hfCoordinator",
              "mandatory": false,
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ],
          "actionLabel": "HFREFERRAL_FACILITY_DETAILS_ACTION_LABEL",
          "description": "HFREFERRAL_FACILITY_DETAILS_DESCRIPTION",
          "showTabView": false,
          "submitCondition": null,
          "preventScreenCapture": false
        }
      ],
      "project": "MR-DN",
      "summary": false,
      "version": 2,
      "disabled": false,
      "onAction": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "data": [
              {
                "key": "clientReferenceId",
                "root": "HFReferral",
                "value": "{{navigation.clientReferenceId}}",
                "operation": "equals"
              }
            ],
            "name": "HFReferral",
            "applyIf": "navigation.isUpdate==true",
            "awaitResults": true
          }
        },
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to fetch config."}
              }
            ],
            "configName": "referralCreation"
          }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": {
            "entity": "",
            "applyIf": "navigation.isUpdate!=true",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to create household."}
              }
            ]
          }
        },
        {
          "actionType": "MERGE_UPDATE_ADDITIONAL_FIELDS",
          "properties": {
            "applyIf": "navigation.isUpdate==true",
            "entityType": "HFReferralModel",
            "collectFromPages": [
              "sideEffectSick",
              "sideEffectFever",
              "sideEffectFromPreviousCycle",
              "sideEffectFromCurrentCycle"
            ],
            "clientReferenceId": "{{navigation.clientReferenceId}}"
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "data": [],
            "name": "referralAcknowledgement",
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
      "isSelected": true,
      "screenType": "FORM"
    }
  ],
  "order": 3,
  "active": true,
  "project": "MR-DN",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "initialPage": "referralInbox",
  "isActive": true,
  "auditDetails": {
    "createdBy": "b43b260c-f620-45d3-a43f-f53148f87f15",
    "lastModifiedBy": "f4e90853-80b7-47cc-91e7-f8cd5ec00e20",
    "createdTime": 1766989202754,
    "lastModifiedTime": 1770999846500
  }
};
