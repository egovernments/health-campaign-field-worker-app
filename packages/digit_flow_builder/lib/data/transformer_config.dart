final jsonConfig = {
  "beneficiaryRegistration": {
    "fallbackModel": "HouseholdModel",
    // fallback model to map form values which are not mapped to any field
    "models": {
      "HouseholdModel": {
        "mappings": {
          "id": "housing.id",
          "memberCount": "householdDetails.memberCount",
          "latitude": "beneficiaryLocation.latLng[0]",
          "longitude": "beneficiaryLocation.latLng[1]",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "address": {
            "id": "address.id",
            "relatedClientReferenceId":
                "__ref:HouseholdModel.clientReferenceId",
            "doorNo": "address.doorNo",
            "latitude": "beneficiaryLocation.latLng[0]",
            "longitude": "beneficiaryLocation.latLng[1]",
            "locationAccuracy": "address.locationAccuracy",
            "addressLine1": "beneficiaryLocation.addressLine1",
            "addressLine2": "addressLine2",
            "landmark": "address.landmark",
            "city": "address.city",
            "pincode": "address.pincode",
            "buildingName": "address.buildingName",
            "street": "address.street",
            "type": "__value:PERMANENT",
            "boundaryType": "address.boundaryType",
            "locality": {
              "code": "__context:selectedBoundaryCode",
              "name": "__context:boundary.name",
              "nonRecoverableError": "address.nonRecoverable",
              "tenantId": "__context:tenantId",
              "rowVersion": "meta.rowVersion",
            },
            "boundary": "address.boundary",
            "nonRecoverableError": "address.nonRecoverable",
            "tenantId": "__context:tenantId",
            "rowVersion": "meta.rowVersion",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit",
          },
          "householdType": "__context:householdType",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            "childrenCount": "householdDetails.childrenCount",
            "pregnantWomenCount": "householdDetails.pregnantWomenCount",
            "memberCount": "householdDetails.memberCount"
          }
        }
      },
      "IndividualModel": {
        "mappings": {
          "id": "personalDetails.id",
          "individualId": "personalDetails.individualId",
          "userId": "personalDetails.userId",
          "userUuid": "personalDetails.uuid",
          "dateOfBirth": "beneficiaryDetails.dobPicker",
          "mobileNumber": "beneficiaryDetails.phone",
          "altContactNumber": "contactInfo.altContact",
          "email": "contactInfo.email",
          "fatherName": "family.fatherName",
          "husbandName": "family.husbandName",
          "photo": "personalDetails.photo",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",

          /// Note: Generate uuid
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "name": {
            "individualClientReferenceId":
                "__ref:IndividualModel.clientReferenceId",
            "givenName": "beneficiaryDetails.nameOfIndividual",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit",
          },
          "bloodGroup": "health.bloodGroup",
          "gender": "beneficiaryDetails.gender",
          "address": "list:AddressModel",
          "identifiers": "list:IdentifierModel",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "boundaryCode": "__context:boundary.code",
        },
        "listMappings": {
          "IdentifierModel": {
            "mappings": {
              "id": "id",
              "identifierType": "beneficiaryDetails.identifiers[0]",
              "identifierId": "beneficiaryDetails.identifiers[1]",
              "boundaryCode": "__context:selectedBoundaryCode",
              "nonRecoverableError": "error.nonRecoverable",
              "individualClientReferenceId":
                  "__ref:IndividualModel.clientReferenceId",
              "clientReferenceId": "__generate:uuid",
              "tenantId": "__context:tenantId",
              "rowVersion": "meta.rowVersion",
              "clientAuditDetails": "__generate:clientAudit",
              "auditDetails": "__generate:audit",
            }
          },
          "AddressModel": {
            "mappings": {
              "id": "address.id",
              "boundaryCode": "__context:selectedBoundaryCode",
              "relatedClientReferenceId":
                  "__ref:IndividualModel.clientReferenceId",
              "doorNo": "address.doorNo",
              "latitude": "beneficiaryLocation.latLng[0]",
              "longitude": "beneficiaryLocation.latLng[1]",
              "locationAccuracy": "address.locationAccuracy",
              "addressLine1": "beneficiaryLocation.addressLine1",
              "addressLine2": "addressLine2",
              "landmark": "address.landmark",
              "city": "address.city",
              "type": "__value:PERMANENT",
              "pincode": "address.pincode",
              "buildingName": "address.buildingName",
              "street": "address.street",
              "boundaryType": "address.boundaryType",
              "locality": {
                "code": "__context:selectedBoundaryCode",
                "name": "__context:boundary.name",
                "nonRecoverableError": "address.nonRecoverable",
                "tenantId": "__context:tenantId",
                "rowVersion": "meta.rowVersion",
              },
              "boundary": "address.boundary",
              "nonRecoverableError": "address.nonRecoverable",
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
          "beneficiaryClientReferenceId":
              "__switch:__context:beneficiaryType:{INDIVIDUAL:__ref:IndividualModel.clientReferenceId,HOUSEHOLD:__ref:HouseholdModel.clientReferenceId}",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",

          /// Note: Generate uuid
          "rowVersion": "meta.rowVersion",
          "dateOfRegistration": "householdDetails.dateOfRegistration",
          "additionalFields": "additionalInfo.fields",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
        }
      },
      "HouseholdMemberModel": {
        "mappings": {
          "id": "members.id",
          "householdId": "members.householdId",
          "householdClientReferenceId":
              "__ref:HouseholdModel.clientReferenceId",
          "individualId": "members.individualId",
          "individualClientReferenceId":
              "__ref:IndividualModel.clientReferenceId",
          "isHeadOfHousehold": "beneficiaryDetails.isHeadOfFamily",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",

          /// Note: Generate uuid
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "additionalFields": "additionalInfo.fields",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
        }
      },
    }
  },
  "individualRegistration": {
    "fallbackModel": "IndividualModel",
    // fallback model to map form values which are not mapped to any field
    "models": {
      "IndividualModel": {
        "mappings": {
          "id": "personalDetails.id",
          "individualId": "personalDetails.individualId",
          "userId": "personalDetails.userId",
          "userUuid": "personalDetails.uuid",
          "dateOfBirth": "beneficiaryDetails.dobPicker",
          "mobileNumber": "beneficiaryDetails.phone",
          "altContactNumber": "contactInfo.altContact",
          "email": "contactInfo.email",
          "fatherName": "family.fatherName",
          "husbandName": "family.husbandName",
          "photo": "personalDetails.photo",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",

          /// Note: Generate uuid
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "name": {
            "individualClientReferenceId":
                "__ref:IndividualModel.clientReferenceId",
            "givenName": "beneficiaryDetails.nameOfIndividual",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit",
          },
          "bloodGroup": "health.bloodGroup",
          "gender": "beneficiaryDetails.gender",
          "address": "list:AddressModel",
          "identifiers": "list:IdentifierModel",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "boundaryCode": "__context:boundary.code",
        },
        "listMappings": {
          "IdentifierModel": {
            "mappings": {
              "id": "id",
              "identifierType": "beneficiaryDetails.identifiers[0]",
              "identifierId": "beneficiaryDetails.identifiers[1]",
              "boundaryCode": "__context:selectedBoundaryCode",
              "nonRecoverableError": "error.nonRecoverable",
              "individualClientReferenceId":
                  "__ref:IndividualModel.clientReferenceId",
              "clientReferenceId": "__generate:uuid",
              "tenantId": "__context:tenantId",
              "rowVersion": "meta.rowVersion",
              "clientAuditDetails": "__generate:clientAudit",
              "auditDetails": "__generate:audit",
            }
          },
          "AddressModel": {
            "mappings": {
              "id": "address.id",
              "boundaryCode": "__context:selectedBoundaryCode",
              "relatedClientReferenceId":
                  "__ref:IndividualModel.clientReferenceId",
              "doorNo": "address.doorNo",
              "latitude": "beneficiaryLocation.latLng[0]",
              "longitude": "beneficiaryLocation.latLng[1]",
              "locationAccuracy": "address.locationAccuracy",
              "addressLine1": "beneficiaryLocation.addressLine1",
              "addressLine2": "addressLine2",
              "landmark": "address.landmark",
              "city": "address.city",
              "type": "__value:PERMANENT",
              "pincode": "address.pincode",
              "buildingName": "address.buildingName",
              "street": "address.street",
              "boundaryType": "address.boundaryType",
              "locality": {
                "code": "__context:selectedBoundaryCode",
                "name": "__context:boundary.name",
                "nonRecoverableError": "address.nonRecoverable",
                "tenantId": "__context:tenantId",
                "rowVersion": "meta.rowVersion",
              },
              "boundary": "address.boundary",
              "nonRecoverableError": "address.nonRecoverable",
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
          "beneficiaryClientReferenceId":
              "__switch:__context:beneficiaryType:{INDIVIDUAL:__ref:IndividualModel.clientReferenceId,HOUSEHOLD:__ref:HouseholdModel.clientReferenceId}",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",

          /// Note: Generate uuid
          "rowVersion": "meta.rowVersion",
          "dateOfRegistration": "__value:DATETIME.NOW",
          "additionalFields": "additionalInfo.fields",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
        }
      },
      "HouseholdMemberModel": {
        "mappings": {
          "id": "members.id",
          "householdId": "members.householdId",
          "householdClientReferenceId": "__context:HouseholdClientReferenceId",
          "individualId": "members.individualId",
          "individualClientReferenceId":
              "__ref:IndividualModel.clientReferenceId",
          "isHeadOfHousehold": "__value:false",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",

          /// Note: Generate uuid
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "additionalFields": "additionalInfo.fields",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
        }
      },
    }
  },
  "delivery": {
    "fallbackModel": "TaskModel",
    "models": {
      "TaskModel": {
        "mappings": {
          "id": "taskDetails.id",
          "projectId": "__context:projectId",
          "projectBeneficiaryId": "taskDetails.projectBeneficiaryId",
          "projectBeneficiaryClientReferenceId":
              "__context:ProjectBeneficiaryClientReferenceId",
          "createdBy": "__context:userId",
          "status": "__value:ADMINISTRATION_SUCCESS",
          // todo: need to update later for multiround campaign
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",
          "resources": "list:TaskResourceModel",
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "plannedStartDate": "taskDetails.plannedStartDate",
          "plannedEndDate": "taskDetails.plannedEndDate",
          "actualStartDate": "taskDetails.actualStartDate",
          "actualEndDate": "taskDetails.actualEndDate",
          "createdDate": "__generate:timestamp",
          "address": {
            "id": "address.id",
            "relatedClientReferenceId": "__ref:TaskModel.clientReferenceId",
            "doorNo": "address.doorNo",
            "latitude": "address.latLng[0]",
            "longitude": "address.latLng[1]",
            "locationAccuracy": "address.locationAccuracy",
            "addressLine1": "address.addressLine1",
            "addressLine2": "address.addressLine2",
            "landmark": "address.landmark",
            "city": "address.city",
            "type": "__value:PERMANENT",
            "pincode": "address.pincode",
            "buildingName": "address.buildingName",
            "street": "address.street",
            "boundaryType": "address.boundaryType",
            "boundary": "address.boundary",
            "locality": {
              "code": "__context:selectedBoundaryCode",
              "name": "__context:boundary.name",
              "nonRecoverableError": "address.nonRecoverable",
              "tenantId": "__context:tenantId",
              "rowVersion": "meta.rowVersion"
            },
            "nonRecoverableError": "address.nonRecoverable",
            "tenantId": "__context:tenantId",
            "rowVersion": "meta.rowVersion",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit"
          },
          "additionalFields": {
            "doseIndex": "__context:doseIndex",
            "cycleIndex": "__context:cycleIndex"
          },
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit"
        },
        "listMappings": {
          "TaskResourceModel": {
            "listSource": "DeliveryDetails.resourceCard",
            "mappings": {
              "id": "id",
              "clientReferenceId": "__generate:uuid",
              "taskId": "taskId",
              "productVariantId":
                  "DeliveryDetails.resourceCard.resourceDelivered.productId",
              "quantity": "DeliveryDetails.resourceCard.quantityDistributed",
              "isDelivered": "__value:true",
              "deliveryComment": "DeliveryDetails.deliveryComment",
              "nonRecoverableError": "error.nonRecoverable",
              "taskclientReferenceId": "__ref:TaskModel.clientReferenceId",
              "tenantId": "__context:tenantId",
              "rowVersion": "meta.rowVersion",
              "clientAuditDetails": "__generate:clientAudit",
              "auditDetails": "__generate:audit",
            }
          }
        }
      }
    }
  }
};
