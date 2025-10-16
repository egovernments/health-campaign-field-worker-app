final referralConfig = '''{
  "name": "BENEFICIARY_REFERRED",
  "version": 1,
  "pages": {
    "referralDetails": {
      "label": "BENEFICIARY_REFERRAL_DETAILS_LABEL",
      "order": 1,
      "type": "object",
      "description": "",
      "actionLabel": "BENEFICIARY_REFERRAL_DETAILS_SUBMIT_LABEL",
      "properties": {
        "dateOfReferral": {
          "type": "string",
          "label": "BENEFICIARY_REFERRAL_DETAILS_dateOfReferral_LABEL",
          "order": 1,
          "value": "",
          "format": "date",
          "hidden": false,
          "tooltip": "",
          "helpText": "",
          "infoText": "",
          "readOnly": true,
          "fieldName": "dateOfReferral",
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
        "administrativeArea": {
          "type": "string",
          "label": "BENEFICIARY_REFERRAL_DETAILS_administrativeUnit_LABEL",
          "order": 2,
          "value": "",
          "format": "locality",
          "hidden": false,
          "tooltip": "",
          "helpText": "",
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
          "label": "BENEFICIARY_REFERRAL_DETAILS_referredBy_LABEL",
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
          "enums": [],
          "innerLabel": "",
          "schemaCode": "",
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
          "label": "BENEFICIARY_REFERRAL_DETAILS_evaluationFacilityKey_LABEL",
          "order": 4,
          "value": "",
          "format": "custom",
          "hidden": false,
          "tooltip": "",
          "helpText": "",
          "infoText": "",
          "readOnly": false,
          "fieldName": "evaluationFacilityKey",
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
        "reasonForReferral": {
          "type": "string",
          "label": "BENEFICIARY_REFERRAL_DETAILS_reasonForReferral_LABEL",
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
          "enums": [
            {
              "code": "DRUG_SE_CC",
              "name": "Drug Side Effect from the current cycle"
            },
            {
              "code": "DRUG_SE_PC",
              "name": "Drug Side Effect from the previous cycle"
            },
            {
              "code": "FEVER",
              "name": "Fever"
            },
            {
              "code": "SICK",
              "name": "Sick"
            }
          ],
          "errorMessage": "",
          "isMultiSelect": false
        },
        "comments": {
          "type": "string",
          "label": "BENEFICIARY_REFERRAL_DETAILS_comments_LABEL",
          "order": 6,
          "value": "",
          "format": "textArea",
          "hidden": false,
          "tooltip": "",
          "helpText": "",
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
        "name": "household-acknowledgement",
        "type": "template"
      }
    }
  }
}''';
