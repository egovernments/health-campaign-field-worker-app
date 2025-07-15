const schema = '''
{
  "name": "registration",
  "version": 1,
  "pages": {
    "dummy": {
      "type": "object",
      "required": ["name", "gender", "dateOfBirth"],
      "properties": {
        "name": {
          "type": "string",
          "minLength": 2,
          "maxLength": 20,
          "hint": "Enter name of user",
          "label": "Name",
          "value": "Dennis"
        }, 
        "gender": {
          "type": "string",
          "enums": ["Male", "Female", "Others", "Not specified"],
          "label": "Gender"
        },
        "dateOfBirth": {
          "type": "string",
          "format": "date",
          "hint": "Date of Birth",
          "firstDate": {
            "value": "1940-01-01",
            "format": "yyyy-MM-dd"
          },
          "lastDate": {
            "value": "2022-01-01",
            "format": "yyyy-MM-dd"
          },
          "format": "date"
        }
      }
    }
  }
}
''';
