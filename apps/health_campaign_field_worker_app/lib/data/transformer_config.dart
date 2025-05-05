final jsonConfig = {
  "beneficiaryRegistration": {
    "models": {
      "IndividualModel": {
        "mappings": {
          "id": "personalDetails.id",
          "individualId": "personalDetails.individualId",
          "userId": "personalDetails.userId",
          "userUuid": "personalDetails.uuid",
          "dateOfBirth": "personalDetails.dob",
          "mobileNumber": "contactInfo.mobile",
          "altContactNumber": "contactInfo.altContact",
          "email": "contactInfo.email",
          "fatherName": "family.fatherName",
          "husbandName": "family.husbandName",
          "photo": "personalDetails.photo",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",   /// Note: Generate uuid
          "tenantId": "meta.tenantId",
          "rowVersion": "meta.rowVersion",
          "name.givenName": "nameInfo.firstName",
          "name.familyName": "nameInfo.lastName",
          "bloodGroup": "health.bloodGroup",
          "gender": "personalDetails.gender",
          "address": "addressInfo.addressList",
          "identifiers": "list:IdentifierModel",
          "additionalFields": {
            "customOccupation": "extraInfo.occupation",
            "customNotes": "extraInfo.notes"
          }
        },
        "listMappings": {
          "IdentifierModel": {
            "mappings": {
              "id": "id",
              "identifierType": "type",
              "identifierId": "number",
              "nonRecoverableError": "error.nonRecoverable",
              "clientReferenceId": "__generate:uuid",
              "tenantId": "meta.tenantId",
              "rowVersion": "meta.rowVersion",
            }
          }
        }
      },
      "HouseholdModel": {
        "mappings": {
          "id": "housing.id",
          "memberCount": "housing.memberCount",
          "latitude": "location.latitude",
          "longitude": "location.longitude",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",   /// Note: Generate uuid
          "tenantId": "meta.tenantId",
          "rowVersion": "meta.rowVersion",
          "address": "housing.address",
          "householdType": "housing.type",
          "additionalFields": {
            "childrenCount": "HouseHoldDetails.childrenCount",
            "pregnantWomenCount": "HouseHoldDetails.pregnantWomenCount",
            "memberCount": "HouseHoldDetails.memberCount"
          }
        }
      },
      "HouseholdMemberModel": {
        "mappings": {
          "id": "members.id",
          "householdId": "members.householdId",
          "householdClientReferenceId": "__ref:HouseholdModel.clientReferenceId",
          "individualId": "members.individualId",
          "individualClientReferenceId": "__ref:IndividualModel.clientReferenceId",
          "isHeadOfHousehold": "beneficiaryDetails.isHeadOfFamily",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",   /// Note: Generate uuid
          "tenantId": "meta.tenantId",
          "rowVersion": "meta.rowVersion",
          "additionalFields": "additionalInfo.fields"
        }
      },
      "ProjectBeneficiaryModel": {
        "mappings": {
          "id": "beneficiaryDetails.id",
          "projectId": "beneficiaryDetails.projectId",
          "beneficiaryId": "beneficiaryDetails.beneficiaryId",
          "tag": "beneficiaryDetails.tag",
          "beneficiaryClientReferenceId": "beneficiaryDetails.clientRefId",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",   /// Note: Generate uuid
          "tenantId": "meta.tenantId",
          "rowVersion": "meta.rowVersion",
          "dateOfRegistration": "HouseHoldDetails.dateOfRegistration",
          "additionalFields": "additionalInfo.fields"
        }
      }
    }
  }
};
