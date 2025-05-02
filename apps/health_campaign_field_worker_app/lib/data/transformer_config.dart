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
          "clientReferenceId": "personalDetails.clientRefId",
          "tenantId": "meta.tenantId",
          "rowVersion": "meta.rowVersion",
          "name.givenName": "nameInfo.firstName",
          "name.familyName": "nameInfo.lastName",
          "bloodGroup": "health.bloodGroup",
          "gender": "personalDetails.gender",
          "address": "addressInfo.addressList",
          "additionalFields": "additionalInfo.fields"
        }
      },
      "HouseholdModel": {
        "mappings": {
          "id": "housing.id",
          "memberCount": "housing.memberCount",
          "latitude": "location.latitude",
          "longitude": "location.longitude",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "housing.clientRefId",
          "tenantId": "meta.tenantId",
          "rowVersion": "meta.rowVersion",
          "address": "housing.address",
          "householdType": "housing.type",
          "additionalFields": "additionalInfo.fields"
        }
      },
      "HouseholdMemberModel": {
        "mappings": {
          "id": "members.id",
          "householdId": "members.householdId",
          "householdClientReferenceId": "members.householdClientRefId",
          "individualId": "members.individualId",
          "individualClientReferenceId": "members.individualClientRefId",
          "isHeadOfHousehold": "members.isHead",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "members.clientRefId",
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
          "clientReferenceId": "beneficiaryDetails.clientRefId",
          "tenantId": "meta.tenantId",
          "rowVersion": "meta.rowVersion",
          "dateOfRegistrationTime": "beneficiaryDetails.dateOfRegistration",
          "additionalFields": "additionalInfo.fields"
        }
      }
    }
  }
};
