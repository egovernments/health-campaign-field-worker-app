// final jsonConfig = {
//   "referral": {
//     "fallbackModel": "HFReferralModel",
//     "models": {
//       "HFReferralModel": {
//         "mappings": {
//           "id": "referralDetails.id",
//           "tenantId": "__context:tenantId",
//           "name": "referralDetails.name",
//           "projectId": "__context:projectId",
//           "projectFacilityId": "referralDetails.projectFacilityId",
//           "symptomSurveyId": "referralDetails.symptomSurveyId",
//           "beneficiaryId": "referralDetails.beneficiaryId",
//           "referralCode": "referralDetails.referralCode",
//           "nationalLevelId": "referralDetails.nationalLevelId",
//           "symptom": "referralDetails.symptom",
//           "nonRecoverableError": "errors.nonRecoverable",
//           "clientReferenceId": "__generate:uuid",
//           "rowVersion": "meta.rowVersion",
//           "clientAuditDetails": "__generate:clientAudit",
//           "auditDetails": "__generate:audit",
//           "additionalFields": "HFReferralAdditionalFields"
//         }
//       },
//       "HFReferralAdditionalFields": {
//         "mappings": {
//           "schema": "__value:HFReferral", // Hardcoded as per your class
//           "version": "__context:formVersion",
//           "fields": {
//             "customField1": "referralDetails.additional.customField1",
//             "customField2": "referralDetails.additional.customField2"
//             // Add more custom fields if needed
//           }
//         }
//       }
//     }
//   }
// };

final jsonConfig = {
  "referral": {
    "fallbackModel": "HFReferralModel",
    "models": {
      "HFReferralModel": {
        "mappings": {
          "id": "referralDetails.id",
          "tenantId": "__context:tenantId",
          "name": "referralDetails.nameOfChild",
          "projectId": "__context:projectId",
          "projectFacilityId": "facilityDetails.evaluationFacilityKey",
          "symptomSurveyId": "referralDetails.symptomSurveyId",
          "beneficiaryId": "referralDetails.beneficiaryId",
          "referralCode": "referralDetails.referralCode",
          "nationalLevelId": "referralDetails.nationalLevelId",
          "symptom": "referralDetails.referralReason",
          "nonRecoverableError": "referralDetails.nonRecoverable",
          "clientReferenceId": "__generate:uuid",
          "rowVersion": "meta.rowVersion",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            "boundaryCode": "facilityDetails.administrativeUnitKey",
            "referralCycle": "referralDetails.referralCycle",
            "gender": "referralDetails.gender",
            "age": "referralDetails.age",
            "nameOfReferral": "referralDetails.nameOfChild",
            "dateOfEvaluation": "facilityDetails.dateOfEvaluation",
            "referredBy": "facilityDetails.referredByKey",
            "hfCoordinator": "facilityDetails.hfCoordinatorKey"
          }
        }
      },
      "ServiceModel": {
        "mappings": {
          "id": "serviceDetails.id",
          "tenantId": "__context:tenantId",
          "clientId": "__context:referenceId",
          "serviceDefId": "__context:serviceDefId",
          "referenceId": "__context:referenceId",
          "isActive": "__context:referenceId",
          "accountId": "__context:projectId",
          "createdAt": "__generate:createdAt",
          "nonRecoverableError": "serviceDetails.nonRecoverable",
          "rowVersion": "meta.rowVersion",
          "attributes": "list:ServiceAttributesModel",
          "auditDetails": "__generate:audit",
          "clientAuditDetails": "__generate:clientAudit",
          "additionalFields": {
            "relatedClientReferenceId":
                "serviceDetails.relatedClientReferenceId",
            "boundaryCode": "serviceDetails.boundaryCode"
          }
        },
        "listMappings": {
          "ServiceAttributesModel": {
            "listSource": "serviceDetails.attributes",
            "mappings": {
              //"id": "id",
              "attributeCode": "attributeCode",
              "value": "__context:tenantId",
              "dataType": "__context:tenantId",
              "referenceId": "__context:referenceId",
              "nonRecoverableError": "nonRecoverableError",
              "clientReferenceId": "__context:referenceId",
              "serviceClientReferenceId": "__context:referenceId",
              "tenantId": "__context:tenantId",
              //"rowVersion": "rowVersion",
              "auditDetails": "__generate:audit",
              "clientAuditDetails": "__generate:clientAudit",
              // "isDeleted": "isDeleted"
            }
          }
        }
      }
    },
  },
  // "service": {
  //   "fallbackModel": "ServiceModel",
  //   "models": {
  //     "ServiceModel": {
  //       "mappings": {
  //         "id": "serviceDetails.id",
  //         "tenantId": "__context:tenantId",
  //         "clientId": "__context:referenceId",
  //         "serviceDefId": "serviceDetails.serviceDefId",
  //         "referenceId": "__context:referenceId",
  //         "isActive": "serviceDetails.isActive",
  //         "accountId": "__context:projectId",
  //         "createdAt": "__generate:createdAt",
  //         "nonRecoverableError": "serviceDetails.nonRecoverable",
  //         "rowVersion": "meta.rowVersion",
  //         "attributes": "list:ServiceAttributesModel",
  //         "auditDetails": "__generate:audit",
  //         "clientAuditDetails": "__generate:clientAudit",
  //         "additionalFields": {
  //           "relatedClientReferenceId":
  //               "serviceDetails.relatedClientReferenceId",
  //           "boundaryCode": "serviceDetails.boundaryCode"
  //         }
  //       },
  //       "listMappings": {
  //         "ServiceAttributesModel": {
  //           "listSource": "serviceDetails.attributes",
  //           "mappings": {
  //             //"id": "id",
  //             "attributeCode": "attributeCode",
  //             "value": "value",
  //             "dataType": "dataType",
  //             "referenceId": "__context:referenceId",
  //             "nonRecoverableError": "nonRecoverableError",
  //             "clientReferenceId": "clientReferenceId",
  //             "serviceClientReferenceId": "serviceClientReferenceId",
  //             "tenantId": "tenantId",
  //             "rowVersion": "rowVersion",
  //             "auditDetails": "__generate:audit",
  //             "clientAuditDetails": "__generate:clientAudit",
  //             "isDeleted": "isDeleted"
  //           }
  //         }
  //       }
  //     }
  //   }
  // }
};
