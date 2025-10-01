final jsonConfig = {
  "complaintRegistration": {
    "fallbackModel": "PgrServiceModel",
    // fallback model to map form values which are not mapped to any field
    "models": {
      "PgrServiceModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid", // referenceId in code
          "tenantId": "__context:tenantId",
          "serviceCode": "complaintType.complaintType",
          "description": "complaintDetails.complaintDescription",
          "source": "__value:mobile",
          "applicationStatus": "__value:CREATED",
          "user": {
            "tenantId": "__context:tenantId",
            "clientReferenceId": "__generate:uuid",
            "complaintClientReferenceId":
                "__ref:PgrServiceModel.clientReferenceId",
            "name": "complaintDetails.name",
            "mobileNumber": "complaintDetails.contactNumber",
            "auditDetails": "__generate:audit",
            "clientAuditDetails": "__generate:clientAudit",
            "uuid": "__context:userId",
            "userName": "__context:userName",
            "type": "__value:EMPLOYEE"
          },
          "address": {
            "relatedClientReferenceId":
                "__ref:PgrServiceModel.clientReferenceId",
            "addressLine1": "locationDetails.addressLine1",
            "addressLine2": "locationDetails.addressLine2",
            "landmark": "locationDetails.landmark",
            "pincode": "locationDetails.pincode",
            "type": "locationDetails.typeOfAddress",
            "locality": {
              "code": "__context:selectedBoundaryCode",
              "name": "__context:selectedBoundaryName",
              "tenantId": "__context:tenantId",
              "rowVersion": "meta.rowVersion"
            },
            "tenantId": "__context:tenantId",
            "rowVersion": "meta.rowVersion",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit"
          },
          "auditDetails": "__generate:audit",
          "additionalDetail": {
            "supervisorName": "complaintDetails.supervisorName",
            "supervisorContactNumber":
                "complaintDetails.supervisorContactNumber ",
            "otherComplaintDescription": "complaintType.otherReason"
          },
          "clientAuditDetails": "__generate:clientAudit"
        }
      }
    }
  }
};
