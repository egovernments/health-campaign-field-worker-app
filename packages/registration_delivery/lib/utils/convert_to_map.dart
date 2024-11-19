import 'models/widget_config_model.dart';

class FieldConverter {
  final List<FormConfigModel>? data;

  FieldConverter(this.data);

  Map<String, Map<String, dynamic>> convertFields(String pageName) {
    final FormConfigModel page = data?.firstWhere(
          (element) => pageName.toLowerCase().contains(element.name.toLowerCase()),
      orElse: () => FormConfigModel(), // Provide a default instance
    ) ?? FormConfigModel(); // Handle null safety if data is null

    if (page.name.isEmpty) {
      return {}; // Handle case where no valid page is found
    }

    final List<FormConfigFieldModel>? fields = page.fields;
    final Map<String, Map<String, dynamic>> convertedFields = {};

    fields?.forEach((field) {
      final config = FieldConfig(
        isEnabled: field.isEnabled ?? false,
        readOnly: field.readOnly ?? false,
        isRequired: field.isRequired ?? false,
        order: field.order ?? 0,
        regex: field.regex?.cast<String>(),
        errorMessage: field.errorMessage,
      );
      convertedFields[field.name] = config.toMap();
    });

    return convertedFields;
  }
}
