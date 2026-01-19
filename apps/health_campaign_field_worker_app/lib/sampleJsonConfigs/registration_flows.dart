final dynamic sampleFlows = {
  "name": "REGISTRATION-DELIVERY",
  "initialPage": "searchBeneficiary",
  "project": "CMP-2025-08-04-004846",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "searchBeneficiary",
      "heading": "Search Beneficiary",
      "preventScreenCapture": true,
      "description": "search beneficiary description",
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {"actionType": "BACK_NAVIGATION", "properties": {}}
          ]
        },
      ],
      "scrollListener": {
        "triggerMode": "bidirectional",
        "debounceMs": 0,
        "showLoadingIndicator": true,
        "onScrollDown": [
          {
            "actionType": "REFRESH_SEARCH",
            "properties": {
              "pagination": {"limit": 5, "maxItems": 15}
            }
          }
        ],
        "onScrollUp": [
          {
            "actionType": "REFRESH_SEARCH",
            "properties": {
              "pagination": {"limit": 5, "maxItems": 15}
            }
          }
        ]
      },
      "wrapperConfig": {
        "wrapperName": "HouseholdWrapper",
        "rootEntity": "HouseholdModel",
        "filters": [],
        "relations": [
          {
            "name": "members",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "clientReferenceId"
            }
          },
          {
            "name": "headOfHousehold",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "filters": [
              {"field": "isHeadOfHousehold", "equals": true}
            ]
          },
          {
            "name": "headIndividual",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "headOfHousehold.individualClientReferenceId"
            }
          },
          {
            "name": "headProjectBeneficiary",
            "entity": "ProjectBeneficiaryModel",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "headOfHousehold.individualClientReferenceId"
            }
          },
          {
            "name": "headTasks",
            "entity": "TaskModel",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "equalsFrom": "headProjectBeneficiary.clientReferenceId"
            }
          },
          {
            "name": "individuals",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "inFrom": "members.individualClientReferenceId"
            }
          },
          {
            "name": "projectBeneficiaries",
            "entity": "ProjectBeneficiaryModel",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "individuals.clientReferenceId"
            }
          },
          {
            "name": "tasks",
            "entity": "TaskModel",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "inFrom": "projectBeneficiaries.clientReferenceId"
            }
          },
          {
            "name": "sideEffects",
            "entity": "SideEffectModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            }
          },
          {
            "name": "referrals",
            "entity": "ReferralModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            }
          }
        ],
        "searchConfig": {
          "primary": "household",
          "select": [
            "household",
            "individual",
            "householdMember",
            "projectBeneficiary",
            "task"
          ],
          "pagination": {"limit": 5, "maxItems": 15}
        }
      },
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
          "validations": [
            {
              "key": "proximityRadius",
              "value": 5,
              "errorMessage": "PROXIMITY_RADIUS_ERROR_MESSAGE"
            }
          ]
        },
        {
          "format": "searchBar",
          "label": "Enter the name of individual",
          "fieldName": "searchBar",
          "onAction": [
            {
              "actionType": "SEARCH_EVENT",
              "properties": {
                "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT",
                "name": "name",
                "data": [
                  {
                    "key": "givenName",
                    "value": "field.value",
                    "operation": "contains"
                  }
                ]
              }
            }
          ]
        },
        {
          "format": "actionPopup",
          "label": "Filter search",
          "properties": {
            "type": "tertiary",
            "size": "medium",
            "mainAxisSize": "min",
            "mainAxisAlignment": "start",
            "popupConfig": {
              "type": "default",
              "title": "Filter Options",
              "titleIcon": "filter",
              "showCloseButton": true,
              "barrierDismissible": true,
              "body": [
                {
                  "format": "selectionCard",
                  "fieldName": "selectedStatus",
                  "enums": [
                    {
                      "code": "ADMINISTRATION_SUCCESS",
                      "name": "Administration Success"
                    },
                    {
                      "code": "ADMINISTRATION_FAILED",
                      "name": "Administration Failed"
                    },
                    {"code": "CLOSED_HOUSEHOLD", "name": "Closed Household"},
                    {"code": "NOT_REGISTERED", "name": "Not Registered"},
                    {"code": "NOT_ADMINISTERED", "name": "Not Administered"}
                  ],
                }
              ],
              "footerActions": [
                {
                  "format": "button",
                  "label": "Clear",
                  "properties": {
                    "type": "secondary",
                    "size": "large",
                    "mainAxisSize": "max"
                  },
                  "onAction": [
                    {"actionType": "CLEAR_STATE", "properties": {}},
                    {"actionType": "CLOSE_POPUP", "properties": {}}
                  ]
                },
                {
                  "format": "button",
                  "label": "Filter",
                  "properties": {
                    "type": "primary",
                    "size": "large",
                    "mainAxisSize": "max"
                  },
                  "onAction": [
                    {
                      "actionType": "CLOSE_POPUP",
                      "properties": {"parentScreenKey": "searchBeneficiary"}
                    },
                    {
                      "actions": [
                        {
                          "actionType": "SEARCH_EVENT",
                          "properties": {
                            "name": "task",
                            "data": [
                              {
                                "key": "status",
                                "value": "{{selectedStatus}}",
                                "operation": "in"
                              }
                            ]
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
                            "name": "projectBeneficiary",
                            "data": [
                              {
                                "key": "projectId",
                                "value": "{{singleton.selectedProject.id}}",
                                "operation": "notEqual"
                              }
                            ]
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
                            "filterLogic": "and",
                            "data": [
                              {
                                "root": "projectBeneficiary",
                                "key": "projectId",
                                "value": "{{singleton.selectedProject.id}}",
                                "operation": "equals"
                              },
                              {
                                "root": "task",
                                "key": "status",
                                "value": [
                                  "ADMINISTRATION_SUCCESS",
                                  "ADMINISTRATION_FAILED",
                                  "CLOSED_HOUSEHOLD"
                                ],
                                "operation": "notIn"
                              }
                            ]
                          }
                        }
                      ],
                      "condition": {
                        "expression": "selectedStatus == NOT_ADMINISTERED"
                      }
                    }
                  ]
                }
              ]
            }
          },
          "suffixIcon": "filter"
        },
        {
          "format": "infoCard",
          "hidden": "{{ context.household.notEmpty }}",
          "label": "No households found",
          "description":
              "Use the search above to find households or register a new one"
        },
        {
          "format": "listView",
          "hidden": "{{ context.household.empty }}",
          "fieldName": "listView",
          "properties": {"spacing": "spacer4"},
          "data": "members",
          "child": {
            "format": "card",
            "children": [
              {
                "format": "row",
                "properties": {
                  "mainAxisAlignment": "spaceBetween",
                  "mainAxisSize": "max"
                },
                "children": [
                  {
                    "format": "textTemplate",
                    "value": "{{ headIndividual.0.name.givenName }}"
                  },
                  {
                    "format": "button",
                    "label": "Open",
                    "properties": {"type": "secondary", "size": "medium"},
                    "onAction": [
                      {
                        "actions": [
                          {
                            "actionType": "NAVIGATION",
                            "properties": {
                              "type": "FORM",
                              "name": "HOUSEHOLD",
                              "data": [
                                {
                                  "key": "HouseholdClientReferenceId",
                                  "value":
                                      "{{ context.household.clientReferenceId }}"
                                },
                                {"key": "isEdit", "value": "true"}
                              ]
                            }
                          }
                        ],
                        "condition": {
                          "expression":
                              "context.headProjectBeneficiary.0!=null && "
                        }
                      },
                      {
                        "actions": [
                          {
                            "actionType": "NAVIGATION",
                            "properties": {
                              "type": "TEMPLATE",
                              "name": "householdOverview",
                              "data": [
                                {
                                  "key": "HouseholdClientReferenceId",
                                  "value":
                                      "{{ HouseholdModel.clientReferenceId }}"
                                }
                              ]
                            }
                          }
                        ],
                        "condition": {
                          "expression":
                              ".ec1==YES && eligibilityChecklist.ec3==YES && eligibilityChecklist.ec4==YES"
                        }
                      }
                    ]
                  }
                ]
              },
              {
                "format": "textTemplate",
                "value": "{{ headOfHousehold.0.isHeadOfHousehold }}"
              },
              {
                "format": "table",
                "data": {
                  "source": "{{individuals}}",
                  "columns": [
                    {
                      "header": "Beneficiary",
                      "cellValue": "{{item.name.givenName}}"
                    },
                    {
                      "header": "Age",
                      "cellValue": "{{fn:formatDate(item.dateOfBirth, 'age')}}"
                    },
                    {"header": "Gender", "cellValue": "{{item.gender}}"}
                  ],
                  "rows": "{{individuals}}"
                }
              }
            ]
          }
        }
      ],
      "footer": [
        {
          "format": "button",
          "label": "register beneficiary",
          "properties": {
            "type": "primary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {"type": "FORM", "name": "HOUSEHOLD"}
            }
          ]
        },
        {
          "type": "template",
          "label": "SCAN_BENEFICIARY",
          "format": "qrScanner",
          "onAction": [
            {
              "actionType": "OPEN_SCANNER",
              "properties": {
                "scanType": "qr",
                "fieldName": "beneficiaryTag",
                "singleValue": true,
                "scanLimit": 1,
                "isGS1": false,
                "onSuccess": [
                  {
                    "actionType": "SEARCH_EVENT",
                    "properties": {
                      "type": "SEARCH_EVENT",
                      "name": "projectBeneficiary",
                      "awaitResults": true,
                      "data": [
                        {
                          "key": "tag",
                          "value": "{{beneficiaryTag}}",
                          "operation": "equals"
                        }
                      ]
                    }
                  }
                ]
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
    },
    {
      "screenType": "FORM",
      "name": "HOUSEHOLD",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "beneficiaryLocation",
          "type": "object",
          "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_HEADING",
          "order": 2,
          "navigateTo": {"name": "householdDetails", "type": "form"},
          "properties": [
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_administrativeArea",
              "order": 1,
              "value": "",
              "format": "locality",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_administrativeArea_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "administrativeArea",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required field cannot be empty"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_latlong",
              "order": 2,
              "value": "",
              "format": "latLng",
              "hidden": false,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_latlong_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "latLng",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required field cannot be empty"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_addressLine1",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": true,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_addressLine1_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "addressLine1",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_addressLine2",
              "order": 4,
              "value": "",
              "format": "text",
              "hidden": true,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_addressLine2_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "addressLine2",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_landmark",
              "order": 5,
              "value": "",
              "format": "text",
              "hidden": true,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_landmark_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "landmark",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_pincode",
              "order": 6,
              "value": "",
              "format": "text",
              "hidden": true,
              "tooltip": "",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_pincode_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "pincode",
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
                {"code": "PERMANENT", "name": "PERMANENT"},
                {"code": "CORRESPONDENCE", "name": "CORRESPONDENCE"},
                {"code": "OTHER", "name": "OTHER"}
              ],
              "label":
                  "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_typeOfAddress",
              "order": 7,
              "value": "PERMANENT",
              "format": "dropdown",
              "hidden": true,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "typeOfAddress",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": false
            }
          ],
          "actionLabel":
              "APPONE_REGISTRATION_BENEFICIARY_LOCATION_ACTION_BUTTON_LABEL_1",
          "description":
              "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_DESCRIPTION"
        },
        {
          "page": "householdDetails",
          "preventScreenCapture": true,
          "type": "object",
          "label": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_HEADING",
          "order": 3,
          "submitCondition": {
            "expression": [
              {"condition": "isEdit == true"}
            ]
          },
          "navigateTo": {"name": "beneficiaryDetails", "type": "form"},
          "properties": [
            {
              "type": "integer",
              "label":
                  "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_dateOfRegistration",
              "order": 1,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "dateOfRegistration",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required field cannot be empty"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label":
                  "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_childrenCount",
              "order": 2,
              "value": "0",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "childrenCount",
              "deleteFlag": false,
              "innerLabel": "",
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
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "pregnantWomenCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "APPONE_REGISTRATION_HOUSEHOLDDETAILS_label_memberCount",
              "order": 4,
              "value": "1",
              "format": "numeric",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "memberCount",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {"type": "required", "value": true, "message": ""},
                {
                  "type": "min",
                  "value": "1",
                  "message": "Total household members cannot be less than 1"
                },
                {
                  "type": "max",
                  "value": "10",
                  "message": "Total household members cannot be more than 10"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            }
          ],
          "actionLabel":
              "APPONE_REGISTRATION_HOUSEHOLDDETAILS_ACTION_BUTTON_LABEL_1",
          "description":
              "APPONE_REGISTRATION_HOUSEHOLDDETAILS_SCREEN_DESCRIPTION"
        },
        {
          "page": "beneficiaryDetails",
          "type": "object",
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING",
          "order": 4,
          "navigateTo": {
            "name": "beneficiary-details",
            "type": "template",
            "data": [
              {
                "key": "householdId",
                "value": "{{formData.household.clientReferenceId}}"
              }
            ]
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
              "tooltip":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_tooltip",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "nameOfIndividual",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
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
              "isMultiSelect": false
            },
            {
              "type": "boolean",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_isHeadOfFamily",
              "order": 2,
              "value": "",
              "format": "checkbox",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "isHeadOfFamily",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required field cannot be empty"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers",
              "order": 3,
              "value": "",
              "format": "idPopulator",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "identifiers",
              "deleteFlag": false,
              "enums": [
                {"code": "DEFAULT", "name": "DEFAULT"},
                {
                  "code": "UNIQUE_BENEFICIARY_ID",
                  "name": "UNIQUE_BENEFICIARY_ID"
                },
                {"code": "OTHER", "name": "OTHER"}
              ],
              "innerLabel": "",
              "schemaCode": "HCM.ID_TYPE_OPTIONS_POPULATOR",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required field cannot be empty"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker",
              "order": 4,
              "value": "",
              "format": "dob",
              "hidden": false,
              "tooltip":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_tooltip",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "dobPicker",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_gender",
              "order": 5,
              "value": "",
              "format": "select",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gender",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "common-masters.GenderType",
              "systemDate": false,
              "validations": [],
              "enums": [
                {"code": "MALE", "name": "MALE"},
                {"code": "FEMALE", "name": "FEMALE"},
                {"code": "OTHER", "name": "OTHER"}
              ],
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
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_scanner",
              "order": 7,
              "value": "",
              "format": "scanner",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "scanner",
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
              "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_1",
          "description":
              "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_DESCRIPTION"
        }
      ],
      "wrapperConfig": {
        "wrapperName": "HouseholdWrapper",
        "rootEntity": "HouseholdMemberModel",
        "filters": [
          {"field": "isHeadOfHousehold", "equals": true}
        ],
        "relations": [
          {
            "name": "household",
            "entity": "HouseholdModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "householdClientReferenceId"
            }
          },
          {
            "name": "members",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          },
          {
            "name": "headOfHousehold",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "HouseholdMemberModel.individualClientReferenceId"
            }
          },
          {
            "name": "individuals",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "inFrom": "members.individualClientReferenceId"
            }
          },
          {
            "name": "projectBeneficiaries",
            "entity": "ProjectBeneficiaryModel",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          },
          {
            "name": "tasks",
            "entity": "TaskModel",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "inFrom": "projectBeneficiaries.clientReferenceId"
            }
          },
          {
            "name": "sideEffects",
            "entity": "SideEffectModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          },
          {
            "name": "referrals",
            "entity": "ReferralModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          }
        ],
        "searchConfig": {
          "primary": "household",
          "select": [
            "individual",
            "household",
            "householdMember",
            "projectBeneficiary",
            "task"
          ]
        }
      },
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "beneficiaryRegistration",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to fetch config."}
              }
            ]
          }
        },
        {
          "condition": {"expression": "isEdit == true"},
          "actions": [
            {
              "actionType": "UPDATE_EVENT",
              "properties": {"entity": "HouseholdModel"}
            }
          ]
        },
        {
          "condition": {"expression": "DEFAULT"},
          "actions": [
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
            }
          ]
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "householdOverview",
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
              }
            ]
          }
        }
      ]
    },
    {
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "household",
            "data": [
              {
                "key": "clientReferenceId",
                "value": "{{navigation.HouseholdClientReferenceId}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "screenType": "TEMPLATE",
      "name": "householdOverview",
      "heading": "Household Overview",
      "description": "Overview of beneficiary",
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"type": "TEMPLATE", "name": "searchBeneficiary"}
            }
          ]
        },
      ],
      "wrapperConfig": {
        "wrapperName": "HouseholdWrapper",
        "rootEntity": "HouseholdModel",
        "filters": [
          {
            "field": "clientReferenceId",
            "equalsFrom": "{{context.household.clientReferenceId}}"
          }
        ],
        "relations": [
          {
            "name": "household",
            "entity": "HouseholdModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "clientReferenceId"
            }
          },
          {
            "name": "headOfHousehold",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "filters": [
              {"field": "isHeadOfHousehold", "equals": true}
            ]
          },
          {
            "name": "headIndividual",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "headOfHousehold.individualClientReferenceId"
            }
          },
          {
            "name": "members",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "clientReferenceId"
            },
            "relations": [
              {
                "name": "member",
                "entity": "HouseholdMemberModel",
                "match": {
                  "field": "clientReferenceId",
                  "equalsFrom": "clientReferenceId"
                }
              },
              {
                "name": "individual",
                "entity": "IndividualModel",
                "match": {
                  "field": "clientReferenceId",
                  "equalsFrom": "individualClientReferenceId"
                }
              },
              {
                "name": "projectBeneficiary",
                "entity": "ProjectBeneficiaryModel",
                "match": {
                  "field": "beneficiaryClientReferenceId",
                  "equalsFrom": "individual.clientReferenceId"
                }
              },
              {
                "name": "task",
                "entity": "TaskModel",
                "match": {
                  "field": "projectBeneficiaryClientReferenceId",
                  "equalsFrom": "projectBeneficiary.clientReferenceId"
                }
              },
              {
                "name": "referral",
                "entity": "ReferralModel",
                "match": {
                  "field": "projectBeneficiaryClientReferenceId",
                  "equalsFrom": "projectBeneficiary.clientReferenceId"
                }
              }
            ]
          }
        ],
        "searchConfig": {
          "primary": "household",
          "select": [
            "household",
            "individual",
            "householdMember",
            "projectBeneficiary",
            "task",
            "referral"
          ]
        }
      },
      "body": [
        {
          "format": "card",
          "type": "primary",
          "children": [
            {
              "format": "row",
              "properties": {"mainAxisAlignment": "end"},
              "children": [
                {
                  "format": "button",
                  "label": "Edit",
                  "properties": {
                    "type": "tertiary",
                    "size": "large",
                    "mainAxisSize": "min",
                    "mainAxisAlignment": "center"
                  },
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
                        "type": "FORM",
                        "name": "HOUSEHOLD",
                        "data": [
                          {
                            "key": "HouseholdClientReferenceId",
                            "value": "{{ context.household.clientReferenceId }}"
                          },
                          {"key": "isEdit", "value": "true"}
                        ]
                      }
                    }
                  ]
                }
              ]
            },
            {
              "format": "labelPairList",
              "data": [
                {
                  "key": "Household head name",
                  "value":
                      "{{contextData.0.headIndividual.IndividualModel.name.givenName}}"
                },
                {
                  "key": "Village",
                  "value":
                      "{{contextData.0.household.HouseholdModel.address.locality.code}}"
                },
                {
                  "key": "Member Count",
                  "value":
                      "{{contextData.0.household.HouseholdModel.memberCount}}"
                }
              ]
            },
            {
              "format": "listView",
              "hidden": "{{ context.household.empty }}",
              "fieldName": "listView",
              "dataSource": "members",
              "child": {
                "format": "card",
                "type": "secondary",
                "children": [
                  {
                    "format": "row",
                    "properties": {
                      "mainAxisAlignment": "spaceBetween",
                      "mainAxisSize": "max"
                    },
                    "children": [
                      {
                        "format": "textTemplate",
                        "value": "{{ individual.0.name.givenName }}"
                      },
                      {
                        "format": "button",
                        "label": "Edit",
                        "properties": {
                          "type": "tertiary",
                          "size": "large",
                          "mainAxisSize": "min",
                          "mainAxisAlignment": "center"
                        },
                        "onAction": [
                          {
                            "actionType": "REVERSE_TRANSFORM",
                            "properties": {
                              "configName": "individualRegistration",
                              "entityTypes": ["IndividualModel"]
                            }
                          },
                          {
                            "actionType": "NAVIGATION",
                            "properties": {
                              "type": "FORM",
                              "name": "ADD_MEMBER",
                              "data": [
                                {
                                  "key": "HouseholdClientReferenceId",
                                  "value":
                                      "{{member.0.householdClientReferenceId}}"
                                },
                                {"key": "isEdit", "value": "true"}
                              ]
                            }
                          }
                        ]
                      }
                    ]
                  },
                  {
                    "format": "textTemplate",
                    "value":
                        "{{individual.0.gender }} | {{fn:formatDate(individual.0.dateOfBirth, age)}}"
                  },
                  {
                    "type": "template",
                    "format": "tag",
                    "fieldName": "statusTag",
                    "visible":
                        "{{fn:checkEligibilityForAgeAndSideEffect(individual.0.dateOfBirth)}}==false",
                    "label": "NOT_ELIGIBLE",
                    "properties": {"tagType": "error"}
                  },
                  {
                    "type": "template",
                    "format": "tag",
                    "fieldName": "statusTag",
                    "visible": "{{fn:isDelivered(task.0.status)}}==true",
                    "label": "ADMINISTERED_SUCCESS",
                    "properties": {"tagType": "success"}
                  },
                  {
                    "type": "template",
                    "format": "tag",
                    "fieldName": "statusTag",
                    "visible":
                        "{{fn:checkEligibilityForAgeAndSideEffect(individual.0.dateOfBirth)}}==true && {{fn:isDelivered(task.0.status)}}==false",
                    "label": "NOT_VISITED",
                    "properties": {"tagType": "info"}
                  },
                  {
                    "format": "row",
                    "children": [
                      {
                        "format": "button",
                        "properties": {
                          "type": "tertiary",
                          "size": "medium",
                          "mainAxisSize": "min",
                          "mainAxisAlignment": "center"
                        },
                        "label": "Add Child",
                        "icon": "add"
                      }
                    ]
                  },
                  {
                    "format": "button",
                    // "visible":
                    //     "{{fn:checkEligibilityForAgeAndSideEffect(individual.0.dateOfBirth)}} == true",
                    "properties": {
                      "type": "primary",
                      "size": "medium",
                      "mainAxisSize": "max",
                      "mainAxisAlignment": "center"
                    },
                    "label": "Delivery",
                    "icon": "add",
                    "onAction": [
                      {
                        "actionType": "NAVIGATION",
                        "properties": {
                          "type": "FORM",
                          "name": "CHECKLIST",
                          "data": [
                            {
                              "key": "selectedIndividualClientReferenceId",
                              "value": "{{individual.0.clientReferenceId}}"
                            },
                            {
                              "key": "HouseholdClientReferenceId",
                              "value":
                                  "{{member.0.householdClientReferenceId}}",
                            },
                            {
                              "key": "ProjectBeneficiaryClientReferenceId",
                              "value":
                                  "{{projectBeneficiary.0.clientReferenceId}}",
                            },
                          ]
                        }
                      }
                    ]
                  },
                  {
                    "format": "button",
                    "visible": "{{fn:checkAllDoseDelivered(task)}} == true",
                    "properties": {
                      "type": "primary",
                      "size": "medium",
                      "mainAxisSize": "max",
                      "mainAxisAlignment": "center"
                    },
                    "label": "View Details",
                    "icon": "add",
                    "onAction": [
                      {
                        "actionType": "NAVIGATION",
                        "properties": {
                          "type": "TEMPLATE",
                          "name": "beneficiaryDetails",
                          "data": [
                            {
                              "key": "selectedIndividualClientReferenceId",
                              "value": "{{individual.0.clientReferenceId}}"
                            },
                            {
                              "key": "HouseholdClientReferenceId",
                              "value":
                                  "{{member.0.householdClientReferenceId}}",
                            },
                            {
                              "key": "ProjectBeneficiaryClientReferenceId",
                              "value":
                                  "{{projectBeneficiary.0.clientReferenceId}}",
                            },
                          ]
                        }
                      }
                    ]
                  }
                ]
              }
            },
            {
              "format": "button",
              "label": "Add Member",
              "properties": {
                "type": "tertiary",
                "size": "large",
                "mainAxisSize": "min",
                "mainAxisAlignment": "center"
              },
              "onAction": [
                {
                  "actionType": "NAVIGATION",
                  "properties": {
                    "type": "FORM",
                    "name": "ADD_MEMBER",
                    "data": [
                      {
                        "key": "HouseholdClientReferenceId",
                        "value":
                            "{{household.HouseholdModel.clientReferenceId}}"
                      }
                    ]
                  }
                }
              ]
            }
          ]
        }
      ],
      "footer": []
    },
    {
      "screenType": "FORM",
      "name": "ADD_MEMBER",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "beneficiaryDetails",
          "type": "object",
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING",
          "order": 4,
          "navigateTo": {
            "name": "beneficiary-details",
            "type": "template",
            "data": [
              {
                "key": "householdId",
                "value": "{{formData.household.clientReferenceId}}"
              }
            ]
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
              "tooltip":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_tooltip",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "nameOfIndividual",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
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
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers",
              "order": 3,
              "value": "",
              "format": "idPopulator",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "identifiers",
              "deleteFlag": false,
              "enums": [
                {"code": "DEFAULT", "name": "DEFAULT"},
                {
                  "code": "UNIQUE_BENEFICIARY_ID",
                  "name": "UNIQUE_BENEFICIARY_ID"
                },
                {"code": "OTHER", "name": "OTHER"}
              ],
              "innerLabel": "",
              "schemaCode": "HCM.ID_TYPE_OPTIONS_POPULATOR",
              "systemDate": false,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "Required field cannot be empty"
                }
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker",
              "order": 4,
              "value": "",
              "format": "dob",
              "hidden": false,
              "tooltip":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_tooltip",
              "helpText":
                  "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_helpText",
              "infoText": "",
              "readOnly": false,
              "fieldName": "dobPicker",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_gender",
              "order": 5,
              "value": "",
              "format": "select",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "gender",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "common-masters.GenderType",
              "systemDate": false,
              "validations": [],
              "enums": [
                {"code": "MALE", "name": "MALE"},
                {"code": "FEMALE", "name": "FEMALE"},
                {"code": "OTHER", "name": "OTHER"}
              ],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "integer",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone",
              "order": 6,
              "value": "",
              "format": "text",
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
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_scanner",
              "order": 7,
              "value": "",
              "format": "scanner",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "scanner",
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
              "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_1",
          "description":
              "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_DESCRIPTION"
        }
      ],
      "wrapperConfig": {
        "wrapperName": "HouseholdWrapper",
        "rootEntity": "HouseholdMemberModel",
        "filters": [
          {"field": "isHeadOfHousehold", "equals": true}
        ],
        "relations": [
          {
            "name": "household",
            "entity": "HouseholdModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "householdClientReferenceId"
            }
          },
          {
            "name": "members",
            "entity": "HouseholdMemberModel",
            "match": {
              "field": "householdClientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          },
          {
            "name": "headOfHousehold",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "HouseholdMemberModel.individualClientReferenceId"
            }
          },
          {
            "name": "individuals",
            "entity": "IndividualModel",
            "match": {
              "field": "clientReferenceId",
              "inFrom": "members.individualClientReferenceId"
            }
          },
          {
            "name": "projectBeneficiaries",
            "entity": "ProjectBeneficiaryModel",
            "match": {
              "field": "beneficiaryClientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          },
          {
            "name": "tasks",
            "entity": "TaskModel",
            "match": {
              "field": "projectBeneficiaryClientReferenceId",
              "inFrom": "projectBeneficiaries.clientReferenceId"
            }
          },
          {
            "name": "sideEffects",
            "entity": "SideEffectModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          },
          {
            "name": "referrals",
            "entity": "ReferralModel",
            "match": {
              "field": "clientReferenceId",
              "equalsFrom": "household.clientReferenceId"
            }
          }
        ],
        "searchConfig": {
          "primary": "household",
          "select": [
            "individual",
            "household",
            "householdMember",
            "projectBeneficiary",
            "task"
          ]
        }
      },
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "individualRegistration",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to fetch config."}
              }
            ],
            "data": [
              {
                "key": "HouseholdClientReferenceId",
                "value": "{{navigation.HouseholdClientReferenceId}}"
              }
            ]
          }
        },
        {
          "condition": {"expression": "isEdit == true"},
          "actions": [
            {
              "actionType": "UPDATE_EVENT",
              "properties": {"entity": "INDIVIDUAL"}
            }
          ]
        },
        {
          "condition": {"expression": "DEFAULT"},
          "actions": [
            {
              "actionType": "CREATE_EVENT",
              "properties": {"entity": "INDIVIDUAL, PROJECTBENEFICIARY, MEMBER"}
            }
          ]
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "householdOverview",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
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
    {
      "screenType": "FORM",
      "name": "CHECKLIST",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "eligibilityChecklist",
          "type": "object",
          "label": "Eligibility Checklist",
          "order": 1,
          "navigateTo": {
            "name": "household-acknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "string",
              "label": "Is the child sick?",
              "order": 1,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "enums": [
                {"code": "YES", "name": "YES"},
                {"code": "NO", "name": "NO"}
              ],
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "ec1",
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
              "type": "string",
              "label": "Is the child having fever?",
              "order": 2,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "enums": [
                {"code": "YES", "name": "YES"},
                {"code": "NO", "name": "NO"}
              ],
              "visibilityCondition": {
                "expression": "eligibilityChecklist.ec1==YES"
              },
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "ec2",
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
              "type": "string",
              "label":
                  "Is there any side effect to SPAQ which was administered last cycle?",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "enums": [
                {"code": "YES", "name": "YES"},
                {"code": "NO", "name": "NO"}
              ],
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "ec3",
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
              "type": "string",
              "label":
                  "Child has taken SP or CTX containing drugs in the past 28 days?",
              "order": 3,
              "value": "",
              "format": "radio",
              "hidden": false,
              "tooltip": "",
              "enums": [
                {"code": "YES", "name": "YES"},
                {"code": "NO", "name": "NO"}
              ],
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "ec4",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": true,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
              "includeInSummary": true
            }
          ],
          "showAlertPopUp": {
            "title": "Ready to submit?",
            "description":
                "Based on responses you are going to '{value}'. Are you sure you want to proceed?",
            "primaryActionLabel": "Submit",
            "secondaryActionLabel": "Cancel",
            "conditions": [
              {
                "expression":
                    "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==NO",
                "value": "To Administer"
              },
              {
                "expression":
                    "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==YES",
                "value": "Ineligible flow"
              },
              {"expression": "DEFAULT", "value": "referral flow"}
            ]
          },
          "actionLabel":
              "APPONE_REGISTRATION_DELIVERYDETAILS_ACTION_BUTTON_LABEL_1",
          "description":
              "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_DESCRIPTION"
        }
      ],
      "onAction": [
        {
          "condition": {
            "expression":
                "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==NO"
          },
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "beneficiaryDetails",
                "data": [
                  {
                    "key": "selectedIndividualClientReferenceId",
                    "value":
                        "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value":
                        "{{ contextData.navigation.HouseholdClientReferenceId }}"
                  },
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}",
                  },
                ],
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
        {
          "condition": {
            "expression":
                "eligibilityChecklist.ec1==YES && eligibilityChecklist.ec3==YES && eligibilityChecklist.ec4==YES"
          },
          "actions": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "REFER_BENEFICIARY",
                "data": [
                  {
                    "key": "selectedIndividualClientReferenceId",
                    "value":
                        "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value":
                        "{{ contextData.navigation.HouseholdClientReferenceId }}"
                  },
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}",
                  },
                ],
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
        {
          "condition": {
            "expression":
                "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==YES"
          },
          "actions": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "configName": "ineligibleConfig",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {
                      "message": "Failed to fetch ineligible config."
                    }
                  }
                ]
              }
            },
            {
              "actionType": "CREATE_EVENT",
              "properties": {
                "entity": "TASK",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Failed to create task records."}
                  }
                ]
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "TEMPLATE",
                "name": "householdOverview",
                "data": [
                  {"key": "reason", "value": "SP_CTX_TAKEN_RECENTLY"}
                ],
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {"message": "Navigation to flow failed."}
                  }
                ]
              }
            }
          ]
        },
        {
          "condition": {"expression": "DEFAULT"},
          "actions": [
            {
              "actionType": "FETCH_TRANSFORMER_CONFIG",
              "properties": {
                "configName": "referralConfig",
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {
                      "message": "Failed to fetch referral config."
                    }
                  }
                ]
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
                      "message": "Failed to create referral records."
                    }
                  }
                ]
              }
            },
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "REFERRAL",
                "data": [
                  {"key": "referralReason", "value": "HEALTH_COMPLICATIONS"}
                ],
                "onError": [
                  {
                    "actionType": "SHOW_TOAST",
                    "properties": {
                      "message": "Navigation to referral flow failed."
                    }
                  }
                ]
              }
            }
          ]
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "REFER_BENEFICIARY",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "referBeneficiary",
          "type": "object",
          "label": "REFER_BENEFICIARY_SCREEN_HEADING",
          "order": 1,
          "navigateTo": {"name": "acknowledgement", "type": "screen"},
          "properties": [
            {
              "type": "string",
              "label": "REFER_BENEFICIARY_LABEL_ADMINISTRATIVE_UNIT",
              "order": 2,
              "value": "",
              "format": "locality",
              "hidden": false,
              "readOnly": true,
              "required": true,
              "fieldName": "administrativeArea",
              "mandatory": true,
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "REFER_BENEFICIARY_ADMINISTRATIVE_UNIT_REQUIRED"
                }
              ],
              "errorMessage": ""
            },
            {
              "type": "dynamic",
              "label": "REFER_BENEFICIARY_LABEL_REFERRED_TO",
              "order": 4,
              "value": "",
              "format": "custom",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "evaluationFacility",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "errorMessage": "",
              "includeInForm": true,
              "schemaCode": "HCM.FACILITY_OPTIONS_POPULATOR",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "REFER_BENEFICIARY_LABEL_REFERRED_BY",
              "order": 3,
              "value": "",
              "format": "text",
              "hidden": false,
              "readOnly": true,
              "required": true,
              "fieldName": "referredBy",
              "mandatory": true,
              "autoFillCondition": [
                {"value": "{{loggedInUserUuid}}", "expression": "true==true"},
              ],
              "validations": [
                {
                  "type": "required",
                  "value": true,
                  "message": "REFER_BENEFICIARY_REFERRED_BY_REQUIRED"
                }
              ],
              "errorMessage": ""
            },
            {
              "type": "string",
              "label": "HFREFERRAL_REFERRAL_DETAILS_referralReason_LABEL",
              "order": 5,
              "value": "",
              "format": "radio",
              "required": false,
              "hidden": false,
              "enums": [
                {"code": "DRUG_SE_CC", "name": "DRUG_SE_CC"},
                {"code": "DRUG_SE_PC", "name": "DRUG_SE_PC"},
                {"code": "FEVER", "name": "FEVER"},
                {"code": "SICK", "name": "SICK"}
              ],
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "referralReason",
              "deleteFlag": false,
              "innerLabel": "",
              "schemaCode": "HCM.REFERRAL_REASONS",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "isMultiSelect": false
            },
            {
              "type": "string",
              "label": "REFER_BENEFICIARY_LABEL_REASON_FOR_REFERRAL",
              "order": 6,
              "value": "",
              "format": "textArea",
              "hidden": false,
              "readOnly": false,
              "required": false,
              "fieldName": "referralComments",
              "validations": [],
              "errorMessage": ""
            }
          ],
          "actionLabel": "REFER_BENEFICIARY_SUBMIT_BUTTON",
          "description": "REFER_BENEFICIARY_SCREEN_DESCRIPTION"
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "referralBeneficaryCreate",
            "data": [
              {
                "key": "selectedIndividualClientReferenceId",
                "value":
                    "{{contextData.navigation.selectedIndividualClientReferenceId}}"
              },
              {
                "key": "HouseholdClientReferenceId",
                "value":
                    "{{ contextData.navigation.HouseholdClientReferenceId }}"
              },
              {
                "key": "ProjectBeneficiaryClientReferenceId",
                "value":
                    "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}",
              },
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
            "entity": "REFERRAL",
            "data": [
              {
                "key": "selectedIndividualClientReferenceId",
                "value":
                    "{{contextData.navigation.selectedIndividualClientReferenceId}}"
              },
              {
                "key": "HouseholdClientReferenceId",
                "value":
                    "{{ contextData.navigation.HouseholdClientReferenceId }}"
              },
            ],
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
            "type": "TEMPLATE",
            "name": "referralSuccess",
            "data": [
              {
                "key": "selectedIndividualClientReferenceId",
                "value":
                    "{{contextData.navigation.selectedIndividualClientReferenceId}}"
              },
              {
                "key": "HouseholdClientReferenceId",
                "value":
                    "{{ contextData.navigation.HouseholdClientReferenceId }}"
              },
            ],
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
    {
      "body": [
        {
          "type": "template",
          "label": "REFERRAL_SUCCESSFUL_PANEL_CARD_HEADING",
          "format": "panelCard",
          "heading": "REFERRAL_SUCCESSFUL_PANEL_CARD_HEADING",
          "fieldName": "successCard",
          "mandatory": true,
          "properties": {"type": "success"},
          "description": "REFERRAL_SUCCESSFUL_PANEL_CARD_DESC",
          "primaryAction": {
            "type": "template",
            "label": "REFERRAL_VIEW_HOUSEHOLD_DETAILS",
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
                          "{{contextData.navigation.selectedIndividualClientReferenceId}}"
                    },
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{ contextData.navigation.HouseholdClientReferenceId }}"
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
          }
        }
      ],
      "name": "referralSuccess",
      "order": 7,
      "header": [
        {
          "type": "template",
          "label": "REFERRAL_BACK",
          "format": "backLink",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {
                "data": [
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{navigation.clientReferenceId}}"
                  }
                ],
                "name": "householdOverview",
                "type": "TEMPLATE"
              }
            }
          ],
          "fieldName": "referralBack",
          "mandatory": true
        }
      ],
      "heading": "",
      "screenType": "TEMPLATE",
      "description": ""
    },
    {
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": {
            "type": "SEARCH_EVENT",
            "name": "individual",
            "data": [
              {
                "key": "clientReferenceId",
                "value": "{{navigation.selectedIndividualClientReferenceId}}",
                "operation": "equals"
              }
            ]
          }
        }
      ],
      "screenType": "TEMPLATE",
      "name": "beneficiaryDetails",
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"type": "TEMPLATE", "name": "householdOverview"}
            }
          ]
        },
      ],
      "heading": "Beneficiary Details",
      "description": "Details of beneficiary",
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
              "right": "{{cycle}}",
              "operator": "lt"
            },
            "includeCurrentIf": {
              "condition": {
                "left": "{{dose}}",
                "right": "{{deliveryLength}}",
                "operator": "eq"
              }
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
      "body": [
        {
          "format": "card",
          "type": "primary",
          "children": [
            {
              "format": "labelPairList",
              "data": [
                {
                  "key": "Name",
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
                  "key": "Date of Registration",
                  "value":
                      "{{fn:formatDate(contextData.0.projectBeneficiaries.ProjectBeneficiaryModel.dateOfRegistration, 'date', dd MMM yyyy)}}"
                }
              ]
            }
          ]
        },
        {
          "format": "card",
          "type": "primary",
          "children": [
            {
              "format": "table",
              "data": {
                "source": "{{contextData.0.targetCycle.0.deliveries}}",
                "columns": [
                  {"header": "Dose", "cellValue": "Dose {{item.id}}"},
                  {
                    "header": "DELIVERY_STATUS",
                    "hidden": false,
                    "cellValue": {
                      "@default": "Pending",
                      "@condition": [
                        {
                          "when":
                              "{{fn:isDoseCompleted(currentItem.id, contextData.0.currentRunningCycle)}} == true",
                          "value": "Administered"
                        },
                        {
                          "when":
                              "{{currentItem.id}} == {{contextData.0.nextDoseId}}",
                          "value": "To be administered"
                        }
                      ]
                    }
                  },
                  {
                    "header": "Completed On",
                    "cellValue":
                        "{{fn:getTaskCompletionDate(currentItem.id, contextData.0.cycle)}}"
                  }
                ],
                "rows": "{{contextData.0.targetCycle.0.deliveries}}"
              }
            }
          ]
        }
      ],
      "footer": [
        {
          "format": "button",
          "label":
              "Record Cycle {{contextData.0.nextCycleId}} Dose {{contextData.0.nextDoseId}}",
          "visible":
              "{{fn:canRecordDelivery(contextData.0.nextCycleId)}}==true",
          "disabled": "{{eligibleProductVariants}} == null",
          "properties": {
            "type": "primary",
            "size": "large",
            "mainAxisSize": "max",
            "mainAxisAlignment": "center"
          },
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "DELIVERY",
                "data": [
                  {
                    "key": "ProjectBeneficiaryClientReferenceId",
                    "value":
                        "{{projectBeneficiaries.ProjectBeneficiaryModel.clientReferenceId}}"
                  },
                  {
                    "key": "HouseholdClientReferenceId",
                    "value": "{{household.HouseholdModel.clientReferenceId}}"
                  },
                  {
                    "key": "cycleIndex",
                    "value": "{{contextData.0.nextCycleId}}"
                  },
                  {"key": "doseIndex", "value": "{{contextData.0.nextDoseId}}"}
                ]
              }
            }
          ]
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "DELIVERY",
      "project": "CMP-2025-08-04-004846",
      "version": 1,
      "disabled": false,
      "isSelected": true,
      "pages": [
        {
          "page": "DeliveryDetails",
          "type": "object",
          "label": "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_HEADING",
          "order": 1,
          "navigateTo": {
            "name": "household-acknowledgement",
            "type": "template"
          },
          "properties": [
            {
              "type": "integer",
              "label":
                  "APPONE_REGISTRATION_DELIVERYDETAILS_label_dateOfDelivery",
              "order": 1,
              "value": "",
              "format": "date",
              "hidden": false,
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": true,
              "fieldName": "dateOfRegistration",
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
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "resourceCard",
              "deleteFlag": false,
              "innerLabel": "",
              "systemDate": false,
              "validations": [],
              "errorMessage": "",
              "includeInForm": true,
              "isMultiSelect": false,
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
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "deliveryComment",
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
              "tooltip": "",
              "helpText": "",
              "infoText": "",
              "readOnly": false,
              "fieldName": "scanner",
              "deleteFlag": false,
              "innerLabel": "",
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
              "APPONE_REGISTRATION_DELIVERYDETAILS_SCREEN_DESCRIPTION"
        }
      ],
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": {
            "configName": "delivery",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Failed to fetch config."}
              }
            ],
            "data": [
              {
                "key": "ProjectBeneficiaryClientReferenceId",
                "value":
                    "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
              },
              {"key": "cycleIndex", "value": "{{navigation.cycleIndex}}"},
              {"key": "doseIndex", "value": "{{navigation.doseIndex}}"}
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
                "properties": {"message": "Failed to create household."}
              }
            ]
          }
        },
        {
          "actionType": "NAVIGATION",
          "properties": {
            "type": "TEMPLATE",
            "name": "deliverySuccess",
            "onError": [
              {
                "actionType": "SHOW_TOAST",
                "properties": {"message": "Navigation failed."}
              }
            ],
            "data": [
              {
                "key": "ProjectBeneficiaryClientReferenceId",
                "value":
                    "{{contextData.navigation.ProjectBeneficiaryClientReferenceId}}"
              },
              {
                "key": "HouseholdClientReferenceId",
                "value": "{{contextData.navigation.HouseholdClientReferenceId}}"
              }
            ]
          }
        }
      ]
    },
    {
      "screenType": "TEMPLATE",
      "name": "deliverySuccess",
      "heading": "Successful Delivery",
      "description": "The delivery is successful",
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"type": "TEMPLATE", "name": "householdOverview"}
            }
          ]
        },
      ],
      "body": [
        {
          "format": "panelCard",
          "label": "Delivery Successful",
          "description": "The resource is successfully delivered",
          "properties": {"type": "success"},
          "primaryAction": {
            "label": "View Household Details",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "TEMPLATE",
                  "name": "householdOverview",
                  "data": [
                    {
                      "key": "HouseholdClientReferenceId",
                      "value":
                          "{{contextData.navigation.HouseholdClientReferenceId}}"
                    }
                  ]
                }
              }
            ]
          },
          "secondaryAction": {
            "label": "Go back to home",
            "onAction": [
              {
                "actionType": "NAVIGATION",
                "properties": {
                  "type": "TEMPLATE",
                  "name": "searchBeneficiary",
                }
              }
            ]
          }
        }
      ]
    }
  ]
};
