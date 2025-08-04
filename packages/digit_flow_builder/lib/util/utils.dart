// Transforms the input JSON into a new structure where each page's properties
// are keyed by their fieldName and the main structure is flattened for use.
import 'package:flutter/material.dart';

/// TODO: WILL REMOVE THIS FUNCTION ALSO : TEMPORARY
Map<String, dynamic> transformJson(Map<String, dynamic> inputJson) {
  try {
    final transformed = <String, dynamic>{
      'name': inputJson['name'],
      'version': inputJson['version'],
      'pages': <String, dynamic>{},
      'summary': inputJson['summary'],
      'templates': <String, dynamic>{},
    };

    for (final page in inputJson['pages'] as List<dynamic>) {
      final pageMap = page as Map<String, dynamic>;
      final pageKey = pageMap['page'];
      final type = pageMap['type'];

      final Map<String, dynamic> properties = {};

      for (final prop in pageMap['properties'] as List<dynamic>) {
        final property = prop as Map<String, dynamic>;
        final fieldName = property['fieldName'];
        if (fieldName != null) {
          properties[fieldName] = Map<String, dynamic>.from(property);
        }
      }

      final transformedPage = <String, dynamic>{
        'label': pageMap['label'],
        'order': pageMap['order'],
        'type': pageMap['type'],
        'format': pageMap['format'],
        'description': pageMap['description'],
        'actionLabel': pageMap['actionLabel'],
        'properties': properties,
        'value': pageMap['value'],
        'required': pageMap['required'],
        'hidden': pageMap['hidden'],
        'helpText': pageMap['helpText'],
        'innerLabel': pageMap['innerLabel'],
        'validations': pageMap['validations'],
        'tooltip': pageMap['tooltip'],
        'startDate': pageMap['startDate'],
        'endDate': pageMap['endDate'],
        'readOnly': pageMap['readOnly'],
        'charCount': pageMap['charCount'],
        'systemDate': pageMap['systemDate'],
        'isMultiSelect': pageMap['isMultiSelect'],
        'includeInForm': pageMap['includeInForm'],
        'includeInSummary': pageMap['includeInSummary'],
        'autoEnable': pageMap['autoEnable'],
        'prefixText': pageMap['prefixText'],
        'suffixText': pageMap['suffixText'],
        'navigateTo': pageMap['navigateTo'] is Map<String, dynamic>
            ? pageMap['navigateTo']
            : null,
      };

      if (type == 'template') {
        (transformed['templates'] as Map<String, dynamic>)[pageKey] =
            transformedPage;
      } else {
        (transformed['pages'] as Map<String, dynamic>)[pageKey] =
            transformedPage;
      }
    }

    return transformed;
  } catch (e, stackTrace) {
    // Log and rethrow to propagate error to the outer try-catch
    debugPrint('Error inside transformJson: $e');
    debugPrint('$stackTrace');
    rethrow;
  }
}
