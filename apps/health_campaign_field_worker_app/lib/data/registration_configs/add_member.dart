final addMember = '''{
  "name": "ADD_MEMBER",
  "version": 1,
  "pages": {
    "beneficiaryDetails": {
      "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING",
      "order": 4,
      "type": "object",
      "description": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_DESCRIPTION",
      "actionLabel": "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_1",
      "properties": {
        "nameOfIndividual": {
          "type": "string",
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual",
          "order": 1,
          "value": "",
          "format": "text",
          "hidden": false,
          "tooltip": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_tooltip",
          "helpText": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText",
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
        "familyNameOfIndividual": {
          "type": "string",
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual",
          "order": 2,
          "value": "",
          "format": "text",
          "hidden": false,
          "tooltip": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_tooltip",
          "helpText": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText",
          "infoText": "",
          "readOnly": false,
          "fieldName": "familyNameOfIndividual",
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
         "identifiers": {
          "type": "string",
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers",
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
            { "code": "DEFAULT", "name": "DEFAULT" },
            { "code": "UNIQUE_BENEFICIARY_ID", "name": "UNIQUE_BENEFICIARY_ID" },
            { "code": "OTHER", "name": "OTHER" }
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
        "dobPicker": {
          "type": "string",
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker",
          "order": 4,
          "value": "",
          "format": "dob",
          "hidden": false,
          "tooltip": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_tooltip",
          "helpText": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_helpText",
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
        "gender": {
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
            { "code": "MALE", "name": "MALE" },
            { "code": "FEMALE", "name": "FEMALE" },
            { "code": "OTHER", "name": "OTHER" }
          ],
          "errorMessage": "",
          "isMultiSelect": false
        },
        "phone": {
          "type": "string",
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone",
          "order": 6,
          "value": "",
          "format": "phoneNumber",
          "hidden": false,
          "tooltip": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_tooltip",
          "helpText": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_helpText",
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
        "scanner": {
          "type": "string",
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_scanner",
          "order": 7,
          "value": "",
          "format": "scanner",
          "hidden": true,
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
          "isMultiSelect": false
        }
      },
      "navigateTo": {
        "name": "beneficiary-details",
        "type": "template",
        "data": [
          {
            "key": "householdId",
            "value": "{{formData.household.clientReferenceId}}"
          }
        ]
      }
    }
  },
  "templates": {}
}
''';
