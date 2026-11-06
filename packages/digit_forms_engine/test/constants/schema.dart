const schema = '''
{
  "name": "registration",
  "version": 1,
  "pages": {
    "dummy": {
      "type": "object",
      "properties": {
        "name": {
          "type": "string",
          "hint": "Enter name of user",
          "label": "Name",
          "format": "text",
          "value": "Dennis"
        }, 
        "gender": {
          "type": "string",
           "format": "selection",
          "enums": [{"code":"male", "name":"male"}, {"code":"female", "name":"female"}],
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
