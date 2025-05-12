const fakeSchema = """
{
  "name": "",
  "version": 1,

  "pages": {
    "beneficiaryLocation": {
      "type": "object",
      "label": "Beneficiary Location Screen",
      "properties": {
     "administrativeArea": {
          "type": "string",
          "format": "locality",
          "label": "Administrative Area *",
          "value": ""
        },
          "latlng": {
          "type": "string",
          "format" : "latLng",
          "label": "Lat/Long *"
        },   
        "addressLine1": {
          "type": "string",
          "label": "Address Line 1"
        },
        "addressLine2": {
          "type": "string",
          "label": "Address Line 2"
        },
          "landmark": {
          "type": "string",
          "label": "Land Mark"
        },
        "pinCode": {
          "type": "string",
          "label": "PostalCode"
        },
        "type": {
          "type": "string",
          "label": "Type of address",
          "enums": ["PERMANENT", "CORRESPONDENCE", "OTHER"]
        }
      }
    },
"HouseDetails": {
      "type": "object",
      "label": "House Details",
      "properties": {
             "structureType": {
          "type": "string",
           "format": "select",
          "label": "Type of Structure",
          "enums": ["Glass", "Metal", "Clay","Reeds","Cement"]
        },
        "NoofRooms": {
          "type": "integer",
          "format": "incrementer",
          "label": "No of Rooms"
        }
        }
        },
   
                "HouseHoldDetails": {
      "type": "object",
      "label": "HouseHold Details",
      "properties": {
             "dateOfRegistration": {
          "type": "string",
          "format": "date",
          "label": "Date of Registration",
          "value": "2022-10-14"
        },
          
        "childrenCount": {
          "type": "integer",
          "format": "incrementer",
          "label": "No of children below 5 years"
        },
            "pregnantWomenCount": {
          "type": "integer",
          "format": "incrementer",
          "label": "No of pregnant Women in household"
        },
          "memberCount": {
          "type": "integer",
          "format": "incrementer",
          "label": "No of member living in the household"
        }
        }
        },

    "beneficiaryDetails": {
      "type": "object",
      "label": "Beneficiary Details",
      "properties": {
 
        "nameOfIndividual": {
          "type": "string",
          "minLength": 10,
          "label": "Name of the individual"
        },
        "isHeadOfFamily": {
          "type": "boolean",
          "label": "Is head of family"
        },
        "idType": {
          "type": "string",
          "label": "ID Type",
          "enums": ["National ID", "Tax ID", "System generated"]
        },
        "idNumber": {
          "type": "string",
          "label": "ID Number",
          "conditions": {
            "regex": {
              "field": "idType",
              "values": {
                "National ID": "^[0-9]{10}",
                "Tax ID": "^[A-Z]{3}[0-9]{4}[A-Z]{1}",
                "System generated": "^[A-Z0-9]{12}"
              }
            }
          }
        },
        "dobPicker": {
          "type": "string",
          "label": "Date of Birth",
          "format": "custom"
        },
        "gender": {
          "type": "string",
          "label": "Gender",
              "format": "select",
          "enums": ["Male", "Female", "Other"]
        },
        "phone": {
          "type": "string",
          "label": "Phone Number",
          "conditions": {
            "isVisible": {
              "field": "gender",
              "value": "Male"
            }
          }
        },
         "scanner": {
          "type": "string",
          "label": "Link voucher to individual",
          "format": "custom"
        }
      }
    }
  }
}
""";
