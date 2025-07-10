final jsonConfig = {
  "stockManagement": {
    "fallbackModel": "StockModel",
    "models": {
      "StockModel": {
        "mappings": {
          "id": "stockDetails.id",
          "tenantId": "__context:tenantId",
          "facilityId": "warehouseDetails.facilityId",
          "productVariantId": "stockDetails.productVariantId",
          "referenceId": "stockDetails.referenceId",
          "referenceIdType": "stockDetails.referenceIdType",
          "transactingPartyId": "stockDetails.transactingPartyId",
          "transactingPartyType": "stockDetails.transactingPartyType",
          "quantity": "stockDetails.quantity",
          "wayBillNumber": "stockDetails.wayBillNumber",
          "receiverId": "stockDetails.receiverId",
          "receiverType": "stockDetails.receiverType",
          "senderId": "stockDetails.senderId",
          "senderType": "stockDetails.senderType",
          "nonRecoverableError": "stockDetails.nonRecoverableError",
          "clientReferenceId": "__generate:uuid",
          "transactionType": "stockDetails.transactionType",
          "transactionReason": "stockDetails.transactionReason",
          "rowVersion": "meta.rowVersion",
          "dateOfEntry": "warehouseDetails.dateOfEntry",
          "clientAuditDetails": "__generate:clientAudit",
          "auditDetails": "__generate:audit",
          "additionalFields": {
            "customField1": "stockDetails.additionalFields.customField1",
            "customField2": "stockDetails.additionalFields.customField2"
          }
        }
      }
    }
  }
};
