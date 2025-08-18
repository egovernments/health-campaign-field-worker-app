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
            // for checklist
            "sideEffectQ1": "sideEffectFromCurrentCycle.sideEffectQ1",
            "sideEffectQ2": "sideEffectFromCurrentCycle.sideEffectQ2",
            "sideEffectQ3": "sideEffectFromCurrentCycle.sideEffectQ3",

            "sideEffectPQ1": "sideEffectFromPreviousCycle.sideEffectPQ1",
            "sideEffectPQ2": "sideEffectFromPreviousCycle.sideEffectPQ2",
            "sideEffectPQ3": "sideEffectFromPreviousCycle.sideEffectPQ3",

            "feverQ1": "sideEffectFever.feverQ1",
            "feverQ2": "sideEffectFever.feverQ2",
            "feverQ3": "sideEffectFever.feverQ3",
            "feverQ4": "sideEffectFever.feverQ4",
            "feverQ5": "sideEffectFever.feverQ5",
            "feverQ6": "sideEffectFever.feverQ6",

            "sickQ1": "sideEffectSick.sickQ1",
            "sickQ4": "sideEffectSick.sickQ4",
            "sickQ2": "sideEffectSick.sickQ2",
            "sickQ5": "sideEffectSick.sickQ5",
            "sickQ3": "sideEffectSick.sickQ3",
          }
        }
      }
    },
  },
};
