import '../models/property_schema/property_schema.dart';
import '../models/schema_object/schema_object.dart';

String? getScannerLabel(SchemaObject? schema, String key) {
  if(schema == null) return null;
  for (var page in schema.pages.values) {
    if (page.type == PropertySchemaType.object && page.properties != null) {
      final scannerSchema = page.properties![key];
      if (scannerSchema != null) {
        return scannerSchema.label;
      }
    }
  }
  return null;
}