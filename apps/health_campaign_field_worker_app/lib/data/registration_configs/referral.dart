final referralConfig = '''{
  "name": "ADD_MEMBER",
  "version": 1,
  "pages": {
    "referralDetails": {
      "label": "Referral Details",
      "order": 4,
      "type": "object",
      "description": "",
      "actionLabel": "APPONE_REGISTRATION_BENEFICIARYDETAILS_ACTION_BUTTON_LABEL_1",
      "properties": {
        "dateOfReferral": {
          "type": "string",
          "label": "Date of referral",
          "order": 1,
          "value": "",
          "format": "date",
          "hidden": false,
          "tooltip": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_tooltip",
          "helpText": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText",
          "infoText": "",
          "readOnly": false,
          "fieldName": "dateOfReferral",
          "deleteFlag": false,
          "innerLabel": "",
          "systemDate": true,
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
        "administrativeUnit": {
          "type": "string",
          "label": "Administrative unit",
          "order": 2,
          "value": "",
          "format": "locality",
          "hidden": false,
          "tooltip": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_tooltip",
          "helpText": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_nameOfIndividual_helpText",
          "infoText": "",
          "readOnly": false,
          "fieldName": "administrativeUnit",
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
         "referredBy": {
          "type": "string",
          "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_identifiers",
          "order": 3,
          "value": "",
          "format": "text",
          "hidden": false,
          "tooltip": "",
          "helpText": "",
          "infoText": "",
          "readOnly": true,
          "fieldName": "referredBy",
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
        "evaluationFacilityKey": {
          "type": "dynamic",
          "label": "Referred to",
          "order": 4,
          "value": "",
          "format": "custom",
          "hidden": false,
          "tooltip": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_tooltip",
          "helpText": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_dobPicker_helpText",
          "infoText": "",
          "readOnly": false,
          "fieldName": "evaluationFacilityKey",
          "deleteFlag": false,
          "innerLabel": "",
          "systemDate": false,
          "validations": [],
          "errorMessage": "",
          "isMultiSelect": false
        },
        "reasonForReferral": {
          "type": "string",
          "label": "Reason for Referral",
          "order": 5,
          "value": "",
          "format": "radio",
          "hidden": false,
          "tooltip": "",
          "helpText": "",
          "infoText": "",
          "readOnly": false,
          "fieldName": "reasonForReferral",
          "deleteFlag": false,
          "innerLabel": "",
          "schemaCode": "HCM.REFERRAL_REASONS",
          "systemDate": false,
          "validations": [],
          "enums": [],
          "errorMessage": "",
          "isMultiSelect": false
        },
        "comments": {
          "type": "string",
          "label": "Referral Comments",
          "order": 6,
          "value": "",
          "format": "textArea",
          "hidden": false,
          "tooltip": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_tooltip",
          "helpText": "APPONE_REGISTRATION_BENEFICIARYDETAILS_label_phone_helpText",
          "infoText": "",
          "readOnly": false,
          "fieldName": "comments",
          "deleteFlag": false,
          "innerLabel": "",
          "systemDate": false,
          "validations": [],
          "errorMessage": "",
          "isMultiSelect": false
        }
      },
      "navigateTo": {
        "name": "household-overview",
        "type": "template"
      }
    }
  }
}
''';
