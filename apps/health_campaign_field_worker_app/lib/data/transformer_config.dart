final jsonConfig = {
  "beneficiaryRegistration": {
    "models": {
      "HouseholdModel": {
        "mappings": {
          "id": "housing.id",
          "boundaryCode": "__context:boundary.code",
          "memberCount": "HouseHoldDetails.memberCount",
          "latitude": "location.latitude",
          "longitude": "location.longitude",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",   /// Note: Generate uuid
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "address": {
            "id": "address.id",
            "boundaryCode": "__context:boundary.code",
            "relatedClientReferenceId": "__ref:HouseholdModel.clientReferenceId",
            "doorNo": "address.doorNo",
            "latitude": "address.latitude",
            "longitude": "address.longitude",
            "locationAccuracy": "address.locationAccuracy",
            "addressLine1": "beneficiaryLocation.addressLine1",
            "addressLine2": "beneficiaryLocation.addressLine2",
            "landmark": "address.landmark",
            "city": "address.city",
            "pincode": "address.pincode",
            "buildingName": "address.buildingName",
            "street": "address.street",
            "boundaryType": "address.boundaryType",
            "boundary": "address.boundary",
            "nonRecoverableError": "address.nonRecoverable",
            "tenantId": "__context:tenantId",
            "rowVersion": "meta.rowVersion",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit",
          },
          "householdType": "housing.type",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            "childrenCount": "HouseHoldDetails.childrenCount",
            "pregnantWomenCount": "HouseHoldDetails.pregnantWomenCount",
            "memberCount": "HouseHoldDetails.memberCount"
          }
        }
      },
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
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "name": {
            "individualClientReferenceId": "__ref:IndividualModel.clientReferenceId",
            "givenName": "beneficiaryDetails.nameOfIndividual",
          },
          "bloodGroup": "health.bloodGroup",
          "gender": "personalDetails.gender",
          "address": "addressInfo.addressList",
          // "identifiers": "list:IdentifierModel",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "boundaryCode": "__context:boundary.code",
        },
        "listMappings": {
          "IdentifierModel": {
            "mappings": {
              "id": "id",
              "identifierType": "type",
              "identifierId": "number",
              "boundaryCode": "__context:boundary.code",
              "nonRecoverableError": "error.nonRecoverable",
              "clientReferenceId": "__generate:uuid",
              "tenantId": "__context:tenantId",
              "rowVersion": "meta.rowVersion",
              "clientAuditDetails": "__generate:clientAudit",
              "auditDetails": "__generate:audit",
            }
          }
        }
      },
      "ProjectBeneficiaryModel": {
        "mappings": {
          "id": "beneficiaryDetails.id",
          "projectId": "__context:projectId",
          "tenantId": "__context:tenantId",
          "beneficiaryId": "beneficiaryDetails.beneficiaryId",
          "tag": "beneficiaryDetails.tag",
          "beneficiaryClientReferenceId": "__ref:IndividualModel.clientReferenceId",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",   /// Note: Generate uuid
          "rowVersion": "meta.rowVersion",
          "dateOfRegistration": "HouseHoldDetails.dateOfRegistration",
          "additionalFields": "additionalInfo.fields",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
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
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "additionalFields": "additionalInfo.fields",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
        }
      },
    }
  }
};
