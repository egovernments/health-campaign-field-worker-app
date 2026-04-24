/// Number of child interviews per LQA cluster (must match lqaChildCount in
/// polio_lqa_data_collection.dart).
const int _lqaChildCount = 10;

/// Number of household pages for Inside Household Monitoring.
const int _householdCount = 10;

/// Number of site pages for Outside House Monitoring.
const int _siteCount = 5;

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
            "locationAccuracy": "beneficiaryLocation.latLng[2]",
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
            "familyName": "beneficiaryDetails.familyname",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit",
          },
          "additionalFields": {
            "weight": "beneficiaryDetails.weight",
            "height": "beneficiaryDetails.height",
            "isPregnant": "beneficiaryDetails.isPregnant"
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
              "locationAccuracy": "beneficiaryLocation.latLng[2]",
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
          "tag": "beneficiaryDetails.scanner",
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
            "familyName": "beneficiaryDetails.familyname",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit",
          },
          "additionalFields": {
            "weight": "beneficiaryDetails.weight",
            "height": "beneficiaryDetails.height",
            "isPregnant": "beneficiaryDetails.isPregnant"
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
              "locationAccuracy": "beneficiaryLocation.latLng[2]",
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
          "tag": "beneficiaryDetails.scanner",
          "beneficiaryClientReferenceId":
              "__switch:__context:beneficiaryType:{INDIVIDUAL:__ref:IndividualModel.clientReferenceId,HOUSEHOLD:__context:HouseholdClientReferenceId}",
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
  "memberRegistration": {
    "fallbackModel": "IndividualModel",
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
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "name": {
            "individualClientReferenceId":
                "__ref:IndividualModel.clientReferenceId",
            "givenName": "beneficiaryDetails.nameOfIndividual",
            "familyName": "beneficiaryDetails.familyname",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit",
          },
          "additionalFields": {
            "weight": "beneficiaryDetails.weight",
            "height": "beneficiaryDetails.height",
            "isPregnant": "beneficiaryDetails.isPregnant"
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
              "locationAccuracy": "beneficiaryLocation.latLng[2]",
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
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "additionalFields": "additionalInfo.fields",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
        }
      },
    }
  },
  "indirectBulkDelivery": {
    "models": {
      "TaskModel": {
        "listSource": "__context:futureDoses",
        "skipFirst": 0,
        "mappings": {
          "id": "taskDetails.id",
          "projectId": "__context:projectId",
          "projectBeneficiaryId": "taskDetails.projectBeneficiaryId",
          "projectBeneficiaryClientReferenceId":
              "__context:ProjectBeneficiaryClientReferenceId",
          "createdBy": "__context:userId",
          "status": "__value:DELIVERED",
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
            "locationAccuracy": "address.latLng[1]",
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
            "doseIndex": "__listItem:id",
            "cycleIndex": "__context:cycleIndex",
            "deliveryStrategy": "__listItem:deliveryStrategy",
            "latitude": "DeliveryDetails.latLng[0]",
            "longitude": "DeliveryDetails.latLng[1]",
            "locationAccuracy": "DeliveryDetails.latLng[2]",
            "lat": "DeliveryDetails.latLng[0]",
            "lng": "DeliveryDetails.latLng[1]"
          },
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit"
        },
        "listMappings": {
          "TaskResourceModel": {
            "listSource": "__listItem:doseCriteria[0].ProductVariants",
            "mappings": {
              "clientReferenceId": "__generate:uuid",
              "taskId": "taskId",
              "productVariantId": "productVariantId",
              "quantity": "__value:1",
              "isDelivered": "__value:true",
              "deliveryComment": "DeliveryDetails.deliveryComment",
              "nonRecoverableError": "error.nonRecoverable",
              "taskclientReferenceId": "__ref:TaskModel.clientReferenceId",
              "tenantId": "__context:tenantId",
              "rowVersion": "meta.rowVersion",
              "clientAuditDetails": "__generate:clientAudit",
              "auditDetails": "__generate:audit"
            }
          }
        }
      }
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
            "locationAccuracy": "address.latLng[1]",
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
            "cycleIndex": "__context:cycleIndex",
            "deliveryStrategy": "__context:deliveryStrategy",
            "latitude": "DeliveryDetails.latLng[0]",
            "longitude": "DeliveryDetails.latLng[1]",
            "locationAccuracy": "DeliveryDetails.latLng[2]",
            "lat": "DeliveryDetails.latLng[0]",
            "lng": "DeliveryDetails.latLng[1]"
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
  },
  "ineligibleConfig": {
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
          "status": "__context:status",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",
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
            "locationAccuracy": "address.latLng[1]",
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
            "cycleIndex": "__context:cycleIndex",
            "latitude": "DeliveryDetails.latLng[0]",
            "longitude": "DeliveryDetails.latLng[1]",
            "locationAccuracy": "DeliveryDetails.latLng[2]",
            "lat": "DeliveryDetails.latLng[0]",
            "lng": "DeliveryDetails.latLng[1]"
          },
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit"
        }
      }
    }
  },
  "unableToDeliverConfig": {
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
          "status": "unableToDeliver.reason",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",
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
            "locationAccuracy": "address.latLng[1]",
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
            "cycleIndex": "__context:cycleIndex",
            "comment": "unableToDeliver.comment",
            "latitude": "DeliveryDetails.latLng[0]",
            "longitude": "DeliveryDetails.latLng[1]",
            "locationAccuracy": "DeliveryDetails.latLng[2]",
            "lat": "DeliveryDetails.latLng[0]",
            "lng": "DeliveryDetails.latLng[1]"
          },
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit"
        }
      }
    }
  },
  "stock": {
    "fallbackModel": "StockModel",
    "multiEntityField": "stockDetails.productdetail",
    "models": {
      "StockModel": {
        "mappings": {
          "id": "stockDetails.id",
          "clientReferenceId": "__generate:uuid",
          "facilityId": "warehouseDetails.facilityToWhich",
          "productVariantId": "stockDetails.productdetail.id",
          "referenceId": "__context:projectId",
          "referenceIdType": "__value:PROJECT",
          "quantity":
              "__switch:__context:stockEntryType:{RECEIPT:stockProductDetails.quantityReceived,RETURNED:stockProductDetails.quantityReturned,ISSUED:stockProductDetails.quantitySent,DAMAGED:stockProductDetails.quantityDamaged,LOSS:stockProductDetails.quantityLost}",
          "waybillNumber": "stockProductDetails.wayBillNumber",
          "transactionType": "__context:transactionType",
          "transactionReason":
              "__switch:__context:stockEntryType:{RECEIPT:__value:RECEIVED,RETURNED:__value:RETURNED,ISSUED:__value:null,DAMAGED:stockDetails.transactionReason,LOSS:stockDetails.transactionReason}",
          "transactingPartyId": "stockDetails.transactingPartyId",
          "senderId": "stockDetails.facilityFromWhich",
          "senderType": "__value:WAREHOUSE",
          "receiverId": "warehouseDetails.facilityToWhich",
          "receiverType": "__value:WAREHOUSE",
          "nonRecoverableError": "errors.nonRecoverable",
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "additionalFields": {
            "sku": "stockDetails.productdetail.sku",
            "batchNumber": "stockProductDetails.batchNumber",
            "expiryDate": "stockProductDetails.expiryDate",
            "comments": "stockProductDetails.comment",
            "transportType": "stockDetails.transportType",
            "vehicle_number": "stockDetails.vehicleNumber",
            "deliveryTeam": "stockDetails.deliveryTeam",
            "mrnNumber": "__context:mrnNumber",
            "stockEntryType": "__context:stockEntryType",
            "primaryRole": "__context:primaryRole",
            "secondaryRole": "__context:secondaryRole",
            "status": "__switch:__context:stockEntryType:{ISSUED:__value:IN_TRANSIT,RETURNED:__value:RETURNED}",
            "scanResource": "stockProductDetails.scanResource"
          },
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "dateOfEntry": "warehouseDetails.dateOfEntry"
        }
      },
    }
  },
  "stockReceipt": {
    "fallbackModel": "StockModel",
    "models": {
      "StockModel": {
        "mappings": {
          "id": "stockReceiptDetails.id",
          "clientReferenceId": "__generate:uuid",
          "facilityId": "__context:userFacilityId",
          "productVariantId": "__context:productVariantId",
          "referenceId": "__context:projectId",
          "referenceIdType": "__value:PROJECT",
          "quantity": "__context:quantity",
          "waybillNumber": "stockReceiptDetails.wayBillNumber",
          "transactionType": "__context:transactionType",
          "transactionReason": "__value:RECEIVED",
          "senderId": "__context:senderFacilityId",
          "senderType": "__value:WAREHOUSE",
          "receiverId": "__context:userFacilityId",
          "receiverType": "__value:WAREHOUSE",
          "nonRecoverableError": "errors.nonRecoverable",
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "additionalFields": {
            "sku": "__context:sku",
            "batchNumber": "stockReceiptDetails.batchNumber",
            "expiryDate": "stockReceiptDetails.expiryDate",
            "comments": "stockReceiptDetails.comment",
            "mrnNumber": "__context:mrnNumber",
            "stockEntryType": "__context:stockEntryType",
            "primaryRole": "__context:primaryRole",
            "secondaryRole": "__context:secondaryRole"
          },
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "dateOfEntry": "__value:DATETIME.NOW"
        }
      },
    }
  },
  "stockReject": {
    "fallbackModel": "StockModel",
    "models": {
      "StockModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "facilityId": "__context:userFacilityId",
          "productVariantId": "__context:productVariantId",
          "referenceId": "__context:projectId",
          "referenceIdType": "__value:PROJECT",
          "quantity": "__context:quantity",
          "waybillNumber": "stockReceiptDetails.wayBillNumber",
          "transactionType": "__value:DISPATCHED",
          "transactionReason": "__value:null",
          "senderId": "__context:senderFacilityId",
          "senderType": "__value:WAREHOUSE",
          "receiverId": "__context:receiverFacilityId",
          "receiverType": "__value:WAREHOUSE",
          "nonRecoverableError": "errors.nonRecoverable",
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "additionalFields": {
            "sku": "__context:sku",
            "batchNumber": "stockReceiptDetails.batchNumber",
            "expiryDate": "stockReceiptDetails.expiryDate",
            "comments": "stockReceiptDetails.comment",
            "mrnNumber": "__context:mrnNumber",
            "stockEntryType": "__context:stockEntryType",
            "primaryRole": "__context:primaryRole",
            "secondaryRole": "__context:secondaryRole"
          },
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "dateOfEntry": "__value:DATETIME.NOW"
        }
      },
    }
  },
  "stockLessExcess": {
    "fallbackModel": "StockModel",
    "models": {
      "StockModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "facilityId": "warehouseDetails.facilityToWhich",
          "productVariantId": "lessExcessDetails.productVariant.id",
          "referenceId": "__context:projectId",
          "referenceIdType": "__value:PROJECT",
          "quantity": "lessExcessDetails.quantity",
          "transactionType": "__value:RECEIVED",
          "transactionReason": "lessExcessDetails.reasonForLessExcess",
          "senderId": "lessExcessDetails.facilityFromWhich",
          "senderType": "__value:WAREHOUSE",
          "receiverId": "warehouseDetails.facilityToWhich",
          "receiverType": "__value:WAREHOUSE",
          "nonRecoverableError": "errors.nonRecoverable",
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "additionalFields": {
            "sku": "lessExcessDetails.productVariant.sku",
            "mrnNumber": "__context:mrnNumber",
            "stockEntryType": "__context:stockEntryType",
            "adjustmentReason": "lessExcessDetails.reasonForLessExcess"
          },
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "dateOfEntry": "warehouseDetails.dateOfEntry"
        }
      }
    }
  },
  "stockReconciliation": {
    "fallbackModel": "StockReconciliationModel",
    "models": {
      "StockReconciliationModel": {
        "mappings": {
          "id": "stockRecon.id",
          "clientReferenceId": "__generate:uuid",
          "facilityId": "stockRecon.stockReconciliationCard.facilityId",
          "productVariantId":
              "stockRecon.stockReconciliationCard.productVariantId",
          "referenceId": "__context:projectId",
          "referenceIdType": "__value:PROJECT",
          "physicalCount": "stockRecon.manualCount",
          "calculatedCount":
              "stockRecon.stockReconciliationCard.stockMetrics.stockInHand",
          "commentsOnReconciliation": "stockRecon.comments",
          "dateOfReconciliation": "__value:DATETIME.NOW",
          "nonRecoverableError": "errors.nonRecoverable",
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "additionalFields": {
            "stockReceived":
                "stockRecon.stockReconciliationCard.stockMetrics.stockReceived",
            "stockIssued":
                "stockRecon.stockReconciliationCard.stockMetrics.stockIssued",
            "stockReturned":
                "stockRecon.stockReconciliationCard.stockMetrics.stockReturned",
            "stockLost":
                "stockRecon.stockReconciliationCard.stockMetrics.stockLost",
            "stockDamaged":
                "stockRecon.stockReconciliationCard.stockMetrics.stockDamaged",
            "stockExcess":
                "stockRecon.stockReconciliationCard.stockMetrics.stockExcess",
            "stockLess":
                "stockRecon.stockReconciliationCard.stockMetrics.stockLess",
            "stockInHand":
                "stockRecon.stockReconciliationCard.stockMetrics.stockInHand"
          },
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
        }
      }
    }
  },
  "complaintRegistration": {
    "fallbackModel": "PgrServiceModel",
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
            "userName": "__context:userId",
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
  },
  "closeHouseholdRegistration": {
    "fallbackModel": "HouseholdModel",
    // fallback model to map form values which are not mapped to any field
    "models": {
      "HouseholdModel": {
        "mappings": {
          "id": "housing.id",
          "memberCount": "__value: 1",
          "latitude": "closeHouseholdDetails.latLng[0]",
          "longitude": "closeHouseholdDetails.latLng[1]",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",
          "tenantId": "__context:tenantId",
          "rowVersion": "meta.rowVersion",
          "address": {
            "id": "address.id",
            "relatedClientReferenceId":
                "__ref:HouseholdModel.clientReferenceId",
            "doorNo": "address.doorNo",
            "latitude": "closeHouseholdDetails.latLng[0]",
            "longitude": "closeHouseholdDetails.latLng[1]",
            "locationAccuracy": "closeHouseholdDetails.latLng[2]",
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
        }
      },
      "IndividualModel": {
        "mappings": {
          "id": "personalDetails.id",
          "individualId": "personalDetails.individualId",
          "userId": "personalDetails.userId",
          "userUuid": "personalDetails.uuid",
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
            "givenName": "closeHouseholdDetails.headName",
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
              "identifierType": "__value:DEFAULT",
              "identifierId": "__generate:uuid",
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
              "latitude": "closeHouseholdDetails.latLng[0]",
              "longitude": "closeHouseholdDetails.latLng[1]",
              "locationAccuracy": "closeHouseholdDetails.latLng[2]",
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
          "tag": "closeHouseholdDetails.scanner",
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
          "householdClientReferenceId":
              "__ref:HouseholdModel.clientReferenceId",
          "individualId": "members.individualId",
          "individualClientReferenceId":
              "__ref:IndividualModel.clientReferenceId",
          "isHeadOfHousehold": "__value: true",
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
      "TaskModel": {
        "mappings": {
          "id": "taskDetails.id",
          "projectId": "__context:projectId",
          "projectBeneficiaryId": "taskDetails.projectBeneficiaryId",
          "projectBeneficiaryClientReferenceId":
              "__ref:ProjectBeneficiaryModel.clientReferenceId",
          "createdBy": "__context:userId",
          "status": "__value:CLOSED_HOUSEHOLD",
          "nonRecoverableError": "errors.nonRecoverable",
          "clientReferenceId": "__generate:uuid",
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
            "latitude": "closeHouseholdDetails.latLng[0]",
            "longitude": "closeHouseholdDetails.latLng[1]",
            "locationAccuracy": "closeHouseholdDetails.latLng[2]",
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
            "latitude": "closeHouseholdDetails.latLng[0]",
            "longitude": "closeHouseholdDetails.latLng[1]",
            "locationAccuracy": "closeHouseholdDetails.latLng[2]"
          },
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit"
        }
      }
    }
  },
  "referralCreation": {
    "fallbackModel": "HFReferralModel",
    "models": {
      "HFReferralModel": {
        "mappings": {
          "localityCode": "__context:selectedBoundaryCode",
          "id": "referralDetails.id",
          "tenantId": "__context:tenantId",
          "name": "referralDetails.nameOfChild",
          "projectId": "__context:projectId",
          "projectFacilityId": "facilityDetails.evaluationFacility",
          "symptomSurveyId": "referralDetails.symptomSurveyId",
          "beneficiaryId": "referralDetails.beneficiaryId",
          "referralCode": "referralDetails.referralCode",
          "nationalLevelId": "referralDetails.nationalLevelId",
          "symptom":
              "__switch:navigation.isEdit:{true:navigation.referralSymptom,default:referralDetails.referralReason}",
          "nonRecoverableError": "referralDetails.nonRecoverable",
          "clientReferenceId":
              "__switch:navigation.isEdit:{true:navigation.clientReferenceId,default:__generate:uuid}",
          "rowVersion":
              "__switch:navigation.isEdit:{true:navigation.rowVersion,default:meta.rowVersion}",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            // Static field mappings
            "boundaryCode": "facilityDetails.administrativeUnit",
            "referralCycle": "referralDetails.referralCycle",
            "gender": "referralDetails.gender",
            "ageInMonths": "referralDetails.ageInMonths",
            "nameOfReferral": "referralDetails.nameOfChild",
            "dateOfEvaluation": "facilityDetails.dateOfEvaluation",
            "referredBy": "facilityDetails.referredByKey",
            "hfCoordinator": "facilityDetails.hfCoordinator",
            // Checklist fields from side effect pages (sideEffectSick, sideEffectFever,
            // sideEffectFromCurrentCycle, sideEffectFromPreviousCycle) are automatically
            // captured as unmapped fields and merged into additionalFields via fallbackModel.
          }
        }
      }
    },
  },
  "referralBeneficaryCreate": {
    "fallbackModel": "HFReferralModel",
    "models": {
      "HFReferralModel": {
        "mappings": {
          "tenantId": "__context:tenantId",
          "projectId": "__context:projectId",
          "projectFacilityId":
              //"__switch:referBeneficiary.evaluationFacility:{Community Health Worker:__context:userUUID,default:referBeneficiary.evaluationFacility}"
              "__switch:referBeneficiary.healthFacility:{Community Health Worker:__context:userUUID,default:referBeneficiary.healthFacility}",
          "beneficiaryId": "__context:selectedIndividualIdentifierId",
          "referralCode": "__context:selectedIndividualClientReferenceId",
          "name": "__context:selectedIndividualName",
          "symptom": "referBeneficiary.referralReason",
          "nonRecoverableError": "referral.nonRecoverable",
          "clientReferenceId": "__generate:uuid",
          "rowVersion": "meta.rowVersion",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "localityCode": "__context:selectedBoundaryCode",
          "additionalFields": {
            // Explicit field mappings matching ReferralReconEnums/ReferralReconAdditionalFields
            "boundaryCode": "facilityDetails.administrativeArea",
            "referredBy": "__context:userUUID",
            "referralComments": "referBeneficiary.referralComments",
            "nameOfReferral": "__context:selectedIndividualName",
            "referralCycle": "__context:cycleIndex",
            "gender": "__context:selectedIndividualGender",
            "ageInMonths": "__context:selectedIndividualAgeInMonths",
            "dateOfEvaluation": "__value:DATETIME.NOW"
          }
        }
      }
    }
  },
  "polioMonitoring": {
    "fallbackModel": "HouseholdModel",
    "sourcePages": ["householdMonitoring1", "householdMonitoring2", "householdMonitoring3"],
    "sourcePageBase": "householdMonitoring",
    "models": {
      "HouseholdModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "memberCount": "householdMonitoring.childrenPresent",
          "latitude": "gpsFirstHousehold.gpsFirstHousehold[0]",
          "longitude": "gpsFirstHousehold.gpsFirstHousehold[1]",
          "tenantId": "__context:tenantId",
          "address": {
            "relatedClientReferenceId":
                "__ref:HouseholdModel.clientReferenceId",
            "latitude": "gpsFirstHousehold.gpsFirstHousehold[0]",
            "longitude": "gpsFirstHousehold.gpsFirstHousehold[1]",
            "locationAccuracy": "gpsFirstHousehold.gpsFirstHousehold[2]",
            "type": "__value:PERMANENT",
            "locality": {
              "code": "__context:selectedBoundaryCode",
              "tenantId": "__context:tenantId",
            },
            "tenantId": "__context:tenantId",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit",
          },
          "householdType": "__context:householdType",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            "monitoringType": "sessionHeader.monitoringType",
            "settlementName": "sessionHeader.administrativeArea",
            "settlementType": "sessionHeader.settlementType",
            "monitorName": "sessionHeader.monitorName",
            "monitorPhone": "sessionHeader.monitorPhone",
            "monitoringDate": "sessionHeader.monitoringDate",
            "monitorDesignation": "sessionHeader.monitorDesignation",
            "designationOther": "sessionHeader.designationOther",
            "responseName": "sessionHeader.responseName",
            "roundNumber": "sessionHeader.roundNumber",
            "vaccTeamVisited": "householdMonitoring.vaccTeamVisited",
            "houseProperlyMarked": "householdMonitoring.houseProperlyMarked",
            "childrenPresent": "householdMonitoring.childrenPresent",
            "childrenVaccinated": "householdMonitoring.childrenVaccinated",
            "vaccinationLocation": "householdMonitoring.vaccinationLocation",
            "missedAbsent": "householdMonitoring.missedAbsent",
            "missedRefusal": "householdMonitoring.missedRefusal",
            "missedNotVisited": "householdMonitoring.missedNotVisited",
            "missedHouseNotRevisited":
                "householdMonitoring.missedHouseNotRevisited",
            "missedAsleep": "householdMonitoring.missedAsleep",
            "missedVaccinatedRoutine":
                "householdMonitoring.missedVaccinatedRoutine",
            "missedOtherReason": "householdMonitoring.missedOtherReason",
            "absentPlayAreas": "householdMonitoring.absentPlayAreas",
            "absentMarket": "householdMonitoring.absentMarket",
            "absentSchool": "householdMonitoring.absentSchool",
            "absentFarm": "householdMonitoring.absentFarm",
            "absentSocialEvent": "householdMonitoring.absentSocialEvent",
            "absentTravelling": "householdMonitoring.absentTravelling",
            "absentParentNotHome": "householdMonitoring.absentParentNotHome",
            "absentOther": "householdMonitoring.absentOther",
            "absentOtherSpecify": "householdMonitoring.absentOtherSpecify",
            "refusalReligious": "householdMonitoring.refusalReligious",
            "refusalSideEffects": "householdMonitoring.refusalSideEffects",
            "refusalTooManyDoses": "householdMonitoring.refusalTooManyDoses",
            "refusalChildSick": "householdMonitoring.refusalChildSick",
            "refusalNotDecisionMaker":
                "householdMonitoring.refusalNotDecisionMaker",
            "refusalAfricaPolioFree":
                "householdMonitoring.refusalAfricaPolioFree",
            "refusalNopvConcerns": "householdMonitoring.refusalNopvConcerns",
            "refusalCovidConcerns": "householdMonitoring.refusalCovidConcerns",
            "refusalOther": "householdMonitoring.refusalOther",
            "caregiverInformed": "householdMonitoring.caregiverInformed",
            "campaignInfoSource": "householdMonitoring.campaignInfoSource",
            "campaignInfoSourceOther":
                "householdMonitoring.campaignInfoSourceOther",
            "afpLimbWeakness": "householdMonitoring.afpLimbWeakness",
            "afpSuddenWeakness": "householdMonitoring.afpSuddenWeakness",
            "caregiverName": "householdMonitoring.caregiverName",
            "caregiverPhone": "householdMonitoring.caregiverPhone",
            "gpsLastHouseholdLat": "gpsLastHousehold.gpsLastHousehold[0]",
            "gpsLastHouseholdLng": "gpsLastHousehold.gpsLastHousehold[1]",
            "poorlyCoveredAreas": "closingFields.poorlyCoveredAreas",
            "finalComments": "closingFields.finalComments",
          }
        }
      },
      "IndividualModel": {
        "repeatCount": "householdMonitoring.childrenPresent",
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "mobileNumber": "householdMonitoring.caregiverPhone",
          "tenantId": "__context:tenantId",
          "name": {
            "individualClientReferenceId":
                "__ref:IndividualModel.clientReferenceId",
            "givenName": "householdMonitoring.caregiverName",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit",
          },
          "gender": "__value:OTHER",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "boundaryCode": "__context:selectedBoundaryCode",
        }
      },
      "HouseholdMemberModel": {
        "repeatCount": "householdMonitoring.childrenPresent",
        "mappings": {
          "householdClientReferenceId":
              "__ref:HouseholdModel.clientReferenceId",
          "individualClientReferenceId":
              "__ref:IndividualModel.clientReferenceId",
          "isHeadOfHousehold": "__value:false",
          "clientReferenceId": "__generate:uuid",
          "tenantId": "__context:tenantId",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
        }
      },
      "ProjectBeneficiaryModel": {
        "repeatCount": "householdMonitoring.childrenPresent",
        "mappings": {
          "projectId": "__context:projectId",
          "tenantId": "__context:tenantId",
          "beneficiaryClientReferenceId":
              "__ref:IndividualModel.clientReferenceId",
          "clientReferenceId": "__generate:uuid",
          "dateOfRegistration": "__value:DATETIME.NOW",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
        }
      }
    }
  },
  "polioRegistration": {
    "fallbackModel": "HouseholdModel",
    "models": {
      "HouseholdModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "memberCount": "householdInformation.childrenUnder5Count",
          "latitude": "householdInformation.gps[0]",
          "longitude": "householdInformation.gps[1]",
          "tenantId": "__context:tenantId",
          "address": {
            "relatedClientReferenceId":
                "__ref:HouseholdModel.clientReferenceId",
            "latitude": "householdInformation.gps[0]",
            "longitude": "householdInformation.gps[1]",
            "locationAccuracy": "householdInformation.gps[2]",
            "type": "__value:PERMANENT",
            "locality": {
              "code": "__context:selectedBoundaryCode",
              "tenantId": "__context:tenantId",
            },
            "tenantId": "__context:tenantId",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit",
          },
          "householdType": "__context:householdType",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            "enumerationDate": "householdInformation.enumerationDate",
            "enumeratorName": "householdInformation.enumeratorName",
            "campaignId": "householdInformation.campaignId",
            "village": "householdInformation.village",
            "settlementType": "householdInformation.settlementType",
            "specialPopulationNotes": "householdInformation.specialPopulationNotes",
          }
        }
      },
      "IndividualModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "tenantId": "__context:tenantId",
          "name": {
            "individualClientReferenceId":
                "__ref:IndividualModel.clientReferenceId",
            "givenName": "householdInformation.headOfHouseholdName",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit",
          },
          "gender": "householdInformation.headGender",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "boundaryCode": "__context:selectedBoundaryCode",
        }
      },
      "ProjectBeneficiaryModel": {
        "mappings": {
          "projectId": "__context:projectId",
          "tenantId": "__context:tenantId",
          "beneficiaryClientReferenceId":
              "__ref:HouseholdModel.clientReferenceId",
          "clientReferenceId": "__generate:uuid",
          "dateOfRegistration": "householdInformation.enumerationDate",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
        }
      },
      "HouseholdMemberModel": {
        "mappings": {
          "householdClientReferenceId":
              "__ref:HouseholdModel.clientReferenceId",
          "individualClientReferenceId":
              "__ref:IndividualModel.clientReferenceId",
          "isHeadOfHousehold": "__value:true",
          "clientReferenceId": "__generate:uuid",
          "tenantId": "__context:tenantId",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
        }
      }
    }
  },
  "polioChildRegistration": {
    "models": {
      "IndividualModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "tenantId": "__context:tenantId",
          "name": {
            "individualClientReferenceId":
                "__ref:IndividualModel.clientReferenceId",
            "givenName": "__context:childName",
            "clientAuditDetails": "__generate:clientAudit",
            "auditDetails": "__generate:audit",
          },
          "dateOfBirth": "childInformation.dobPicker",
          "gender": "childInformation.gender",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "boundaryCode": "__context:selectedBoundaryCode",
          "additionalFields": {
            "isZeroDose": "childInformation.isZeroDose",
          }
        }
      },
      "HouseholdMemberModel": {
        "mappings": {
          "householdClientReferenceId": "__context:HouseholdClientReferenceId",
          "individualClientReferenceId":
              "__ref:IndividualModel.clientReferenceId",
          "isHeadOfHousehold": "__value:false",
          "clientReferenceId": "__generate:uuid",
          "tenantId": "__context:tenantId",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
        }
      }
    }
  },
  "polioTallySheet": {
    "models": {
      "UserActionModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "projectId": "__context:projectId",
          "boundaryCode": "__context:selectedBoundaryCode",
          "tenantId": "__context:tenantId",
          "action": "__value:TALLY_SHEET",
          "latitude": "__value:0",
          "longitude": "__value:0",
          "locationAccuracy": "__value:0",
          "timestamp": "__value:DATETIME.NOW",
          "isSync": "__value:false",
          "beneficiaryTag": "__context:HouseholdClientReferenceId",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            "tallyDate": "sessionHeader.tallyDate",
            "village": "sessionHeader.village",
            "facilityName": "sessionHeader.facilityName",
            "siteName": "sessionHeader.siteName",
            "teamNumber": "sessionHeader.teamNumber",
            "dailyTarget": "sessionHeader.dailyTarget",
            "siteType": "siteTypeStaff.siteType",
            "staffPresent": "siteTypeStaff.staffPresent",
            "maleNeverNopv": "vaccinationCounts.maleNeverNopv",
            "malePreviouslyNopv": "vaccinationCounts.malePreviouslyNopv",
            "maleNoRecall": "vaccinationCounts.maleNoRecall",
            "femaleNeverNopv": "vaccinationCounts.femaleNeverNopv",
            "femalePreviouslyNopv": "vaccinationCounts.femalePreviouslyNopv",
            "femaleNoRecall": "vaccinationCounts.femaleNoRecall",
            "vialsOpenedToday": "stockTracking.vialsOpenedToday",
            "vialsRemainingUsable": "stockTracking.vialsRemainingUsable",
            "vialsUnusable": "stockTracking.vialsUnusable",
            "afpCasesCount": "afpSurveillance.afpCasesCount",
            "preparedBy": "signatures.preparedBy",
            "preparedDate": "signatures.preparedDate",
            "cadre": "signatures.cadre",
            "supervisorName": "signatures.supervisorName",
            "supervisorSignature": "signatures.supervisorSignature",
            "supervisorDate": "signatures.supervisorDate",
          }
        }
      }
    }
  },
  "polioMissedChild": {
    "models": {
      "UserActionModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "projectId": "__context:projectId",
          "boundaryCode": "__context:selectedBoundaryCode",
          "tenantId": "__context:tenantId",
          "action": "__value:MISSED_CHILD",
          "latitude": "__value:0",
          "longitude": "__value:0",
          "locationAccuracy": "__value:0",
          "timestamp": "__value:DATETIME.NOW",
          "isSync": "__value:false",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            "headOfHouseholdName": "missedChildInfo.headOfHouseholdName",
            "villageLandmark": "missedChildInfo.villageLandmark",
            "phoneNumber": "missedChildInfo.phoneNumber",
            "childrenMissedCount": "missedChildInfo.childrenMissedCount",
            "missingReason": "missedChildInfo.missingReason",
            "refusalReason": "missedChildInfo.refusalReason",
            "revisitDate": "missedChildInfo.revisitDate",
            "revisitOutcome": "missedChildInfo.revisitOutcome",
          }
        }
      }
    }
  },
  "polioStockDetails": {
    "models": {
      "UserActionModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "projectId": "__context:projectId",
          "boundaryCode": "__context:selectedBoundaryCode",
          "tenantId": "__context:tenantId",
          "action": "__value:LOCATION_CAPTURE",
          "latitude": "vialDetails.latLng[0]",
          "longitude": "vialDetails.latLng[1]",
          "locationAccuracy": "vialDetails.latLng[2]",
          "timestamp": "__value:DATETIME.NOW",
          "isSync": "__value:false",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            "form": "__value:POLIO_STOCK",
            "batchLotNumber": "vialDetails.batchLotNumber",
            "expiryDate": "vialDetails.expiryDate",
            "vvmStatus": "vialDetails.vvmStatus",
            "timeOfOpening": "vialDetails.timeOfOpening",
          }
        }
      }
    }
  },
  "polioAfpCase": {
    "models": {
      "UserActionModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "projectId": "__context:projectId",
          "boundaryCode": "__context:selectedBoundaryCode",
          "tenantId": "__context:tenantId",
          "action": "__value:AFP_CASE",
          "latitude": "afpCaseInfo.gps[0]",
          "longitude": "afpCaseInfo.gps[1]",
          "locationAccuracy": "afpCaseInfo.gps[2]",
          "timestamp": "__value:DATETIME.NOW",
          "isSync": "__value:false",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            "settlement": "afpCaseInfo.settlement",
            "afpCount": "afpCaseInfo.afpCount",
          }
        }
      }
    }
  },
  "polioLqaDataCollection": {
    "models": {
      "UserActionModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "projectId": "__context:projectId",
          "boundaryCode": "__context:selectedBoundaryCode",
          "tenantId": "__context:tenantId",
          "action": "__value:LOCATION_CAPTURE",
          "latitude": "clusterInfo.gpsStart[0]",
          "longitude": "clusterInfo.gpsStart[1]",
          "locationAccuracy": "clusterInfo.gpsStart[2]",
          "timestamp": "__value:DATETIME.NOW",
          "isSync": "__value:false",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            "form": "__value:POLIO_LQA",
            // ── clusterInfo (13 fields) ──
            "surveyDate": "clusterInfo.surveyDate",
            "settlementArea": "clusterInfo.settlementArea",
            "healthFacilityArea": "clusterInfo.healthFacilityArea",
            "lotNumber": "clusterInfo.lotNumber",
            "clusterNumber": "clusterInfo.clusterNumber",
            "numberOfInterviews": "clusterInfo.numberOfInterviews",
            "surveyorName": "clusterInfo.surveyorName",
            "surveyorPhone": "clusterInfo.surveyorPhone",
            "lqasCoordinatorName": "clusterInfo.lqasCoordinatorName",
            "startingVillage": "clusterInfo.startingVillage",
            "settlementType": "clusterInfo.settlementType",
            "settlementSmall": "clusterInfo.settlementSmall",
            "gpsStartLat": "clusterInfo.gpsStart[0]",
            "gpsStartLng": "clusterInfo.gpsStart[1]",

            // ── child fields: generated from _lqaChildCount ──
            for (int i = 1; i <= _lqaChildCount; i++)
              ...{
                "child${i}_childrenUnder5": "child$i.childrenUnder5",
                "child${i}_childAgeMonths": "child$i.childAgeMonths",
                "child${i}_childSex": "child$i.childSex",
                "child${i}_fingerMarked": "child$i.fingerMarked",
                "child${i}_reasonNotMarked": "child$i.reasonNotMarked",
                "child${i}_reasonNotMarkedOther":
                    "child$i.reasonNotMarkedOther",
                "child${i}_refusalReason": "child$i.refusalReason",
                "child${i}_refusalReasonOther":
                    "child$i.refusalReasonOther",
                "child${i}_absenceReason": "child$i.absenceReason",
                "child${i}_absenceReasonOther":
                    "child$i.absenceReasonOther",
                "child${i}_caregiverInformed": "child$i.caregiverInformed",
                "child${i}_campaignAwareness": "child$i.campaignAwareness",
                "child${i}_awarenessOther": "child$i.awarenessOther",
                "child${i}_opvDosesFromBirth": "child$i.opvDosesFromBirth",
                "child${i}_afpAwareness": "child$i.afpAwareness",
                "child${i}_afpCaseCount": "child$i.afpCaseCount",
              },

            // ── closeout (2 fields) ──
            "gpsFinalLat": "closeout.gpsFinal[0]",
            "gpsFinalLng": "closeout.gpsFinal[1]",
            "finalComments": "closeout.finalComments",
          }
        }
      }
    }
  },
  "polioInsideHousehold": {
    "models": {
      "UserActionModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "projectId": "__context:projectId",
          "boundaryCode": "__context:selectedBoundaryCode",
          "tenantId": "__context:tenantId",
          "action": "__value:INSIDE_HOUSEHOLD_MONITORING",
          "latitude": "sessionHeader.gpsFirstHousehold[0]",
          "longitude": "sessionHeader.gpsFirstHousehold[1]",
          "locationAccuracy": "sessionHeader.gpsFirstHousehold[2]",
          "timestamp": "__value:DATETIME.NOW",
          "isSync": "__value:false",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            // ── sessionHeader ──
            "monitoringType": "sessionHeader.monitoringType",
            "monitoringDate": "sessionHeader.monitoringDate",
            "settlementArea": "sessionHeader.settlementArea",
            "settlementName": "sessionHeader.settlementName",
            "settlementType": "sessionHeader.settlementType",
            "monitorName": "sessionHeader.monitorName",
            "monitorPhone": "sessionHeader.monitorPhone",
            "monitorDesignation": "sessionHeader.monitorDesignation",
            "designationOther": "sessionHeader.designationOther",
            "gpsFirstHouseholdLat": "sessionHeader.gpsFirstHousehold[0]",
            "gpsFirstHouseholdLng": "sessionHeader.gpsFirstHousehold[1]",

            // ── household fields ──
            for (int i = 1; i <= _householdCount; i++)
              ...{
                "hh${i}_teamVisited": "household$i.teamVisited",
                "hh${i}_houseMarked": "household$i.houseMarked",
                "hh${i}_childrenPresent": "household$i.childrenPresent",
                "hh${i}_childrenVaccinated": "household$i.childrenVaccinated",
                "hh${i}_vaccinationLocation": "household$i.vaccinationLocation",
                "hh${i}_missedAbsent": "household$i.missedAbsent",
                "hh${i}_missedRefusal": "household$i.missedRefusal",
                "hh${i}_missedNotVisited": "household$i.missedNotVisited",
                "hh${i}_missedNotRevisited": "household$i.missedNotRevisited",
                "hh${i}_missedAsleep": "household$i.missedAsleep",
                "hh${i}_missedRoutine": "household$i.missedRoutine",
                "hh${i}_missedOther": "household$i.missedOther",
                "hh${i}_caregiverInformed": "household$i.caregiverInformed",
                "hh${i}_campaignInfoSource": "household$i.campaignInfoSource",
                "hh${i}_infoSourceOther": "household$i.infoSourceOther",
                "hh${i}_afpLimbWeakness": "household$i.afpLimbWeakness",
                "hh${i}_afpSuddenWeakness": "household$i.afpSuddenWeakness",
                "hh${i}_caregiverName": "household$i.caregiverName",
                "hh${i}_caregiverPhone": "household$i.caregiverPhone",
              },

            // ── closeout ──
            "gpsLastHouseholdLat": "closeout.gpsLastHousehold[0]",
            "gpsLastHouseholdLng": "closeout.gpsLastHousehold[1]",
            "poorlyCoveredAreas": "closeout.poorlyCoveredAreas",
            "finalComments": "closeout.finalComments",
          }
        }
      }
    }
  },
  "polioOutsideHouse": {
    "models": {
      "UserActionModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "projectId": "__context:projectId",
          "boundaryCode": "__context:selectedBoundaryCode",
          "tenantId": "__context:tenantId",
          "action": "__value:OUTSIDE_HOUSE_MONITORING",
          "latitude": "__value:0",
          "longitude": "__value:0",
          "locationAccuracy": "__value:0",
          "timestamp": "__value:DATETIME.NOW",
          "isSync": "__value:false",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            // ── sessionHeader ──
            "levelOfMonitoring": "sessionHeader.levelOfMonitoring",
            "otherMonitors": "sessionHeader.otherMonitors",
            "monitoringType": "sessionHeader.monitoringType",
            "monitoringDate": "sessionHeader.monitoringDate",
            "settlementArea": "sessionHeader.settlementArea",
            "settlementName": "sessionHeader.settlementName",
            "settlementType": "sessionHeader.settlementType",
            "monitorName": "sessionHeader.monitorName",
            "monitorPhone": "sessionHeader.monitorPhone",
            "supervisorName": "sessionHeader.supervisorName",
            "supervisorPhone": "sessionHeader.supervisorPhone",
            "numberOfSites": "sessionHeader.numberOfSites",

            // ── site fields ──
            for (int i = 1; i <= _siteCount; i++)
              ...{
                "site${i}_gpsLocationLat": "site$i.gpsLocation[0]",
                "site${i}_gpsLocationLng": "site$i.gpsLocation[1]",
                "site${i}_placeOfEvaluation": "site$i.placeOfEvaluation",
                "site${i}_childrenChecked": "site$i.childrenChecked",
                "site${i}_childrenFingerMarked": "site$i.childrenFingerMarked",
                "site${i}_siteComments": "site$i.siteComments",
              },

            // ── closeout ──
            "finalComments": "closeout.finalComments",
          }
        }
      }
    }
  },
  "polioTeamSupervision": {
    "models": {
      "UserActionModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "projectId": "__context:projectId",
          "boundaryCode": "__context:selectedBoundaryCode",
          "tenantId": "__context:tenantId",
          "action": "__value:TEAM_SUPERVISION",
          "latitude": "teamHeader.gpsLocation[0]",
          "longitude": "teamHeader.gpsLocation[1]",
          "locationAccuracy": "teamHeader.gpsLocation[2]",
          "timestamp": "__value:DATETIME.NOW",
          "isSync": "__value:false",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            // ── teamHeader ──
            "reportDate": "teamHeader.reportDate",
            "teamType": "teamHeader.teamType",
            "teamNumber": "teamHeader.teamNumber",
            "supervisionDay": "teamHeader.supervisionDay",
            "settlementArea": "teamHeader.settlementArea",
            "settlementName": "teamHeader.settlementName",
            "supervisorType": "teamHeader.supervisorType",
            "otherMonitors": "teamHeader.otherMonitors",
            "gpsLocationLat": "teamHeader.gpsLocation[0]",
            "gpsLocationLng": "teamHeader.gpsLocation[1]",
            "monitorName": "teamHeader.monitorName",
            "teamSupervisorName": "teamHeader.teamSupervisorName",

            // ── checklist ──
            "teamMembersTrained": "checklist.teamMembersTrained",
            "teamComplete": "checklist.teamComplete",
            "teamLocalMember": "checklist.teamLocalMember",
            "dailyMovementPlan": "checklist.dailyMovementPlan",
            "movementPlanAllDays": "checklist.movementPlanAllDays",
            "areaMapsAvailable": "checklist.areaMapsAvailable",
            "mapsInterpretedCorrectly": "checklist.mapsInterpretedCorrectly",
            "housesMarkedCorrectly": "checklist.housesMarkedCorrectly",
            "fingerMarkingCorrect": "checklist.fingerMarkingCorrect",
            "householdTallyRecorded": "checklist.householdTallyRecorded",
            "tallyDosesMatch": "checklist.tallyDosesMatch",
            "sufficientVaccine": "checklist.sufficientVaccine",
            "dropperChangePerVial": "checklist.dropperChangePerVial",
            "tallySheetVialsRecorded": "checklist.tallySheetVialsRecorded",
            "vialsNotRecordedReason": "checklist.vialsNotRecordedReason",
            "vvmPhaseCheck": "checklist.vvmPhaseCheck",
            "vvmInterpretationCorrect": "checklist.vvmInterpretationCorrect",
            "icePacksMaintained": "checklist.icePacksMaintained",
            "foamPadInCarrier": "checklist.foamPadInCarrier",
            "vaccineHeatExposure": "checklist.vaccineHeatExposure",
            "correctVaccineDrops": "checklist.correctVaccineDrops",
            "supervisorPresent": "checklist.supervisorPresent",
            "supervisorSupervisedToday": "checklist.supervisorSupervisedToday",
            "householdsCampaignAware": "checklist.householdsCampaignAware",
            "routineVaccinationReminder": "checklist.routineVaccinationReminder",
            "handwashingReminder": "checklist.handwashingReminder",
            "afpInquiryConducted": "checklist.afpInquiryConducted",

            // ── comments ──
            "finalComments": "comments.finalComments",
          }
        }
      }
    }
  },
  "polioConsumptionMonitoring": {
    "models": {
      "UserActionModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "projectId": "__context:projectId",
          "boundaryCode": "__context:selectedBoundaryCode",
          "tenantId": "__context:tenantId",
          "action": "__value:CONSUMPTION_MONITORING",
          "latitude": "facilityInfo.gpsLocation[0]",
          "longitude": "facilityInfo.gpsLocation[1]",
          "locationAccuracy": "facilityInfo.gpsLocation[2]",
          "timestamp": "__value:DATETIME.NOW",
          "isSync": "__value:false",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            // ── facilityInfo ──
            "monitoringDate": "facilityInfo.monitoringDate",
            "settlementArea": "facilityInfo.settlementArea",
            "facilityName": "facilityInfo.facilityName",
            "monitorName": "facilityInfo.monitorName",
            "gpsLocationLat": "facilityInfo.gpsLocation[0]",
            "gpsLocationLng": "facilityInfo.gpsLocation[1]",

            // ── stockData ──
            "coldChainTempOk": "stockData.coldChainTempOk",
            "vvmAtDiscardPoint": "stockData.vvmAtDiscardPoint",
            "usableVialsOpening": "stockData.usableVialsOpening",
            "usableVialsReceived": "stockData.usableVialsReceived",
            "usableVialsTransferredOut": "stockData.usableVialsTransferredOut",
            "usableVialsGivenToTeams": "stockData.usableVialsGivenToTeams",
            "usableVialsReturnedFromTeams": "stockData.usableVialsReturnedFromTeams",
            "unusableVialsReturnedFromTeams": "stockData.unusableVialsReturnedFromTeams",
            "childrenVaccinatedTotal": "stockData.childrenVaccinatedTotal",
            "usableVialsClosingPhysical": "stockData.usableVialsClosingPhysical",
            "unusableVialsClosingPhysical": "stockData.unusableVialsClosingPhysical",

            // ── closeout ──
            "discrepancyComment": "closeout.discrepancyComment",
          }
        }
      }
    }
  },
  "polioPreparednessValidation": {
    "models": {
      "UserActionModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "projectId": "__context:projectId",
          "boundaryCode": "__context:selectedBoundaryCode",
          "tenantId": "__context:tenantId",
          "action": "__value:PREPAREDNESS_VALIDATION",
          "latitude": "header.gpsLocation[0]",
          "longitude": "header.gpsLocation[1]",
          "locationAccuracy": "header.gpsLocation[2]",
          "timestamp": "__value:DATETIME.NOW",
          "isSync": "__value:false",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            // ── header ──
            "reportDate": "header.reportDate",
            "settlementArea": "header.settlementArea",
            "levelOfMonitor": "header.levelOfMonitor",
            "levelOfMonitorOther": "header.levelOfMonitorOther",
            "gpsLocationLat": "header.gpsLocation[0]",
            "gpsLocationLng": "header.gpsLocation[1]",
            "supervisorName": "header.supervisorName",

            // ── microplan ──
            "microplanDone": "microplan.microplanDone",
            "htraAddressed": "microplan.htraAddressed",
            "sketchMaps": "microplan.sketchMaps",
            "budgetIncluded": "microplan.budgetIncluded",
            "tallySheetArrived": "microplan.tallySheetArrived",
            "fundsArrived": "microplan.fundsArrived",
            "adminCommitment": "microplan.adminCommitment",
            "siaPlanExists": "microplan.siaPlanExists",

            // ── coldChain ──
            "fridgeTemp": "coldChain.fridgeTemp",
            "freezerIcepacks": "coldChain.freezerIcepacks",
            "vvmDiscard": "coldChain.vvmDiscard",
            "suppliesArrivedOnTime": "coldChain.suppliesArrivedOnTime",
            "daysToCampaign": "coldChain.daysToCampaign",
            "vaccineDroppersAdequate": "coldChain.vaccineDroppersAdequate",
            "markersPlasticBags": "coldChain.markersPlasticBags",
            "chalkAdequate": "coldChain.chalkAdequate",
            "tallySheetsAdequate": "coldChain.tallySheetsAdequate",
            "vaccineCarriers": "coldChain.vaccineCarriers",
            "faceMasksSanitizer": "coldChain.faceMasksSanitizer",
            "transportArrangements": "coldChain.transportArrangements",

            // ── socialMobilization ──
            "smCommittee": "socialMobilization.smCommittee",
            "smPlansExist": "socialMobilization.smPlansExist",
            "announcements": "socialMobilization.announcements",
            "htraTargeted": "socialMobilization.htraTargeted",
            "stakeholdersInformed": "socialMobilization.stakeholdersInformed",
            "plansImplemented": "socialMobilization.plansImplemented",

            // ── trainings ──
            "supervisorsTrainedSeparately": "trainings.supervisorsTrainedSeparately",
            "socialMobilizersTrainedSeparately": "trainings.socialMobilizersTrainedSeparately",
            "smallGroups": "trainings.smallGroups",
            "agendaRationale": "trainings.agendaRationale",
            "agendaMappingColdchain": "trainings.agendaMappingColdchain",
            "agendaMarking": "trainings.agendaMarking",
            "agendaRecording": "trainings.agendaRecording",
            "agendaIec": "trainings.agendaIec",
            "agendaVaccineRetrieval": "trainings.agendaVaccineRetrieval",
            "agendaAfpSensitization": "trainings.agendaAfpSensitization",
            "agendaDemonstrations": "trainings.agendaDemonstrations",
            "finalComments": "trainings.finalComments",
          }
        }
      }
    }
  },
  "polioFormAVaccines": {
    "models": {
      "UserActionModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "projectId": "__context:projectId",
          "boundaryCode": "__context:selectedBoundaryCode",
          "tenantId": "__context:tenantId",
          "action": "__value:FORM_A_VACCINES",
          "latitude": "facilityInfo.gpsLocation[0]",
          "longitude": "facilityInfo.gpsLocation[1]",
          "locationAccuracy": "facilityInfo.gpsLocation[2]",
          "timestamp": "__value:DATETIME.NOW",
          "isSync": "__value:false",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            // ── facilityInfo ──
            "reportDate": "facilityInfo.reportDate",
            "settlementArea": "facilityInfo.settlementArea",
            "adminLevel": "facilityInfo.adminLevel",
            "facilityName": "facilityInfo.facilityName",
            "monitorName": "facilityInfo.monitorName",
            "vialsReturnedOnTime": "facilityInfo.vialsReturnedOnTime",
            "gpsLocationLat": "facilityInfo.gpsLocation[0]",
            "gpsLocationLng": "facilityInfo.gpsLocation[1]",

            // ── stockReconciliation ──
            "childrenVaccinated": "stockReconciliation.childrenVaccinated",
            "usableVialsOpeningBalance": "stockReconciliation.usableVialsOpeningBalance",
            "usableVialsReceived": "stockReconciliation.usableVialsReceived",
            "usableVialsResupplied": "stockReconciliation.usableVialsResupplied",
            "usableVialsTransferredOut": "stockReconciliation.usableVialsTransferredOut",
            "usableVialsDistributed": "stockReconciliation.usableVialsDistributed",
            "usableVialsReceivedFromLower": "stockReconciliation.usableVialsReceivedFromLower",
            "unusableVialsReceivedFromLower": "stockReconciliation.unusableVialsReceivedFromLower",
            "usableVialsPhysicalCount": "stockReconciliation.usableVialsPhysicalCount",
            "unusableVialsPhysicalCount": "stockReconciliation.unusableVialsPhysicalCount",
            "usableVialsReturnedToHigher": "stockReconciliation.usableVialsReturnedToHigher",
            "unusableVialsDisposedOnSite": "stockReconciliation.unusableVialsDisposedOnSite",
            "reconciliationComments": "stockReconciliation.reconciliationComments",
          }
        }
      }
    }
  }
};
