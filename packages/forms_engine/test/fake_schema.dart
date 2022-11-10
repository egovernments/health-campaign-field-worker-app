const fakeSchema = """
{
  "name": "",
  "version": 1,
  "pages": {
    "beneficiaryLocation": {
      "type": "object",
      "properties": {
        "administrativeArea": {
          "type": "string",
          "label": "Administrative Area *",
          "indexKey": "ADMINISTRATIVE_AREA_KEY",
          "infoText": "Administration Area Detail"
        },
        "houseNumber": {
          "type": "string",
          "label": "House Number",
          "indexKey": "HOUSE_NUMBER_KEY",
          "infoText": "House Number Detail"
        },
        "locality": {
          "type": "string",
          "label": "Locality",
          "indexKey": "LOCALITY_KEY",
          "infoText": "Locality Detail"
        },
        "landmark": {
          "type": "string",
          "label": "Landmark",
          "indexKey": "LANDMARK_KEY",
          "infoText": "Landmark Detail"
        }
      },
      "label": "Beneficiary Location"
    },
    "beneficiaryDetails": {
      "type": "object",
      "properties": {
        "dateOfRegistration": {
          "type": "string",
          "format": "date",
          "label": "Date of Registration",
          "value": "2022-10-14",
          "indexKey": "DATE_OF_REGISTRATION_KEY",
          "infoText": "Date of Registration Detail"
        },
        "numberOfMembers": {
          "type": "integer",
          "format": "incrementer",
          "label": "Number of members living in the household",
          "indexKey": "NO_OF_MEMBERS_LIVING_IN_THE_HOUSEHOLD_KEY",
          "infoText": "Date of Registration Detail"
        },
        "nameOfIndividual": {
          "type": "string",
          "label": "Name of the individual",
          "indexKey": "NAME_OF_THE_INDIVIDUAL_KEY",
          "infoText": "Name of the individual Detail"
        },
        "isHeadOfFamily": {
          "type": "boolean",
          "label": "Is head of family",
          "indexKey": "IS_HEAD_OF_FAMILY_KEY",
          "infoText": "Is head of family Detail"
        },
        "idType": {
          "type": "string",
          "enums": [
            "National ID",
            "Tax ID",
            "System generated"
          ],
          "label": "ID Type",
          "indexKey": "TD_TYPE_KEY",
          "infoText": "ID Type Detail"
        },
        "idNumber": {
          "type": "string",
          "label": "ID Number",
          "indexKey": "ID_NUMBER_KEY",
          "infoText": "ID Number Detail"
        },
        "dateOfBirth": {
          "type": "string",
          "format": "date",
          "label": "Date of Birth",
          "indexKey": "DATE_OF_BIRTH_KEY",
          "infoText": "Date of Birth Detail"
        },
        "gender": {
          "type": "string",
          "enums": [
            "Male",
            "Female",
            "Other"
          ],
          "label": "Gender",
          "indexKey": "GENDER_KEY",
          "infoText": "Gender Detail"
        },
        "phone": {
          "type": "string",
          "label": "Phone Number",
          "indexKey": "PHONE_NUMBER_KEY",
          "infoText": "Phone Number Detail"
        }
      },
      "label": "Beneficiary Details"
    },
    "updateDelivery": {
      "type": "object",
      "properties": {
        "numberDistributed": {
          "type": "integer",
          "label": "Number of Bed nets distributed",
          "indexKey": "NO_OF_BED_NETS_DISTRIBUTED_KEY",
          "infoText": "Number of Bed nets distributed Detail"
        },
        "reasonIfNotDelivered": {
          "type": "string",
          "label": "Reason if not delivered",
          "indexKey": "REASON_IF_NOT_DELIVERED_KEY",
          "infoText": "Reason if not delivered Detail"
        }
      },
      "label": "Update Delivery"
    }
  }
}
""";
