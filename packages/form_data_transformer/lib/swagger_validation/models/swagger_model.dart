class SwaggerSchema {
  final Map<String, SwaggerModel> models;

  SwaggerSchema({required this.models});
}

class SwaggerModel {
  final String name;
  final Map<String, SwaggerField> fields;

  SwaggerModel({required this.name, required this.fields});
}

class SwaggerField {
  final String type;
  final String? format;
  final String? ref;

  SwaggerField({
    required this.type,
    this.format,
    this.ref,
  });

  factory SwaggerField.fromJson(Map<String, dynamic> json) {
    final ref = json[r'$ref'] as String?;
    final type = json['type'] as String? ?? 'object';
    final format = json['format'] as String?;

    return SwaggerField(
      type: type,
      format: format,
      ref: ref,
    );
  }
}
