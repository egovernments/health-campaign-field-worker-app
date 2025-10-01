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
            "ageInMonths": "referralDetails.ageInMonths",
            "nameOfReferral": "referralDetails.nameOfChild",
            "dateOfEvaluation": "facilityDetails.dateOfEvaluation",
            "referredBy": "facilityDetails.referredByKey",
            "hfCoordinator": "facilityDetails.hfCoordinatorKey",
          }
        }
      }
    },
  },
};
