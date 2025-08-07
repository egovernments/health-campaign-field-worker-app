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
      }
    }
  }
};
