import 'models/widget_config_model.dart';

class FieldConverter {
  final List<FormConfigModel>? data;

  FieldConverter(this.data);

  Map<String, Map<String, dynamic>> convertFields(String pageName) {
    final FormConfigModel? page = data?.firstWhere(
          (element) => element.name == pageName,
    );

    if(page == null) return {};

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
