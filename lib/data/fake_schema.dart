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
          "label": "Administrative Area *"
        },
        "houseNumber": {
          "type": "string",
          "label": "House Number"
        },
        "locality": {
          "type": "string",
          "label": "Locality"
        },
        "landmark": {
          "type": "string",
          "label": "Landmark"
        },
        "latlng": {
          "type": "string",
          "label": "Lat/Long *"
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
          "value": "2022-10-14"
        },
        "numberOfMembers": {
          "type": "integer",
          "format": "incrementer",
          "label": "Number of members living in the household"
        },
        "nameOfIndividual": {
          "type": "string",
          "label": "Name of the individual"
        },
        "isHeadOfFamily": {
          "type": "boolean",
          "label": "Is head of family"
        },
        "idType": {
          "type": "string",
          "enums": [
            "National ID",
            "Tax ID",
            "System generated"
          ],
          "label": "ID Type"
        },
        "idNumber": {
          "type": "string",
          "label": "ID Number"
        },
        "dateOfBirth": {
          "type": "string",
          "format": "date",
          "label": "Date of Birth"
        },
        "gender": {
          "type": "string",
          "enums": [
            "Male",
            "Female",
            "Other"
          ],
          "label": "Gender"
        },
        "phone": {
          "type": "string",
          "label": "Phone Number"
        }
      },
      "label": "Beneficiary Details"
    },
    "updateDelivery": {
      "type": "object",
      "properties": {
        "numberDistributed": {
          "type": "integer",
          "label": "Number of Bed nets distributed"
        },
        "reasonIfNotDelivered": {
          "type": "string",
          "label": "Reason if not delivered"
        }
      },
      "label": "Update Delivery"
    }
  }
}
""";
