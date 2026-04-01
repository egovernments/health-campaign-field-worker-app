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
            "deliveryStrategy": "__listItem:deliveryStrategy"
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
            "deliveryStrategy": "__context:deliveryStrategy"
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
            "cycleIndex": "__context:cycleIndex"
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
            "comment": "unableToDeliver.comment"
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
            "status":
                "__switch:__context:stockEntryType:{ISSUED:__value:IN_TRANSIT,RETURNED:__value:RETURNED}"
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
          "additionalFields": "additionalInfo.fields",
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
  "markAttendancePresent": {
    "fallbackModel": "AttendanceLogModel",
    "models": {
      "AttendanceLogModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "tenantId": "__context:tenantId",
          "registerId": "__context:registerId",
          "individualId": "__context:individualId",
          "time": "__context:entryTime",
          "status": "__value:ACTIVE",
          "type": "__value:ENTRY",
          "uploadToServer": "__value:false",
          "rowVersion": "__value:1",
          "additionalDetails": "__context:additionalFields",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit"
        }
      }
    }
  },
  "attendanceLogSave": {
    "fallbackModel": "AttendanceLogModel",
    "multiEntityField": "attendanceLogs",
    "models": {
      "AttendanceLogModel": {
        "mappings": {
          "clientReferenceId": "__generate:uuid",
          "tenantId": "attendanceLogs.tenantId",
          "registerId": "attendanceLogs.registerId",
          "individualId": "attendanceLogs.individualId",
          "time": "attendanceLogs.entryTime",
          "status": "attendanceLogs.status",
          "type": "attendanceLogs.type",
          "uploadToServer": "attendanceLogs.uploadToServer",
          "rowVersion": "__value:1",
          "additionalDetails": "attendanceLogs.additionalFields",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit"
        }
      }
    }
  },
  "attendanceLogSubmit": {
    "fallbackModel": "AttendanceLogModel",
    "multiEntityField": "attendanceLogs",
    "models": {
      "AttendanceLogModel": {
        "mappings": {
          "clientReferenceId": "attendanceLogs.uuid",
          "tenantId": "attendanceLogs.tenantId",
          "registerId": "attendanceLogs.registerId",
          "individualId": "attendanceLogs.individualId",
          "time": "attendanceLogs.entryTime",
          "status": "attendanceLogs.status",
          "type": "attendanceLogs.type",
          "uploadToServer": "__value:true",
          "rowVersion": "attendanceLogs.rowVersion",
          "additionalDetails": "attendanceLogs.additionalFields",
          "clientAuditDetails": "attendanceLogs.clientAudit",
          "auditDetails": "attendanceLogs.audit"
        }
      }
    }
  },
  "attendanceAttendeeStatusReset": {
    "fallbackModel": "AttendeeModel",
    "multiEntityField": "attendees",
    "models": {
      "AttendeeModel": {
        "mappings": {
          "id": "attendees.id",
          "tenantId": "attendees.tenantId",
          "registerId": "attendees.registerId",
          "individualId": "attendees.individualId",
          "enrollmentDate": "attendees.enrollmentDate",
          "denrollmentDate": "attendees.denrollmentDate",
          "name": "attendees.name",
          "rowVersion": "attendees.rowVersion",
          "status": "attendees.status",
          "tag": "attendees.tag",
          "nonRecoverableError": "attendees.nonRecoverableError",
          "additionalFields": "attendees.additionalFields",
          "auditDetails": "attendees.auditDetails",
          "clientAuditDetails": "attendees.clientAuditDetails"
        }
      }
    }
  }
};
