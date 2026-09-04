import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/utils.dart';
import 'entity_field_accessor.dart';

/// Abstract interface for resolving values from paths/templates.
/// Enables dependency injection and testability via mocking.
abstract class IValueResolver {
  dynamic resolveValue(
      String path, dynamic root, Map<String, dynamic> wrapperData);
  List<dynamic> resolveList(String path, Map<String, dynamic> wrapperData);
  dynamic traverse(dynamic obj, String path);
}

/// Resolves values from dot-notation paths against entities, maps, and context.
class ValueResolver implements IValueResolver {
  @override
  dynamic resolveValue(
      String path, dynamic root, Map<String, dynamic> wrapperData) {
    try {
      String expr = path.trim();

      // Strip template braces
      if (expr.startsWith('{{') && expr.endsWith('}}')) {
        expr = expr.substring(2, expr.length - 2).trim();
      }

      // Handle .length shortcut
      if (expr.endsWith('.length')) {
        final listPath = expr.substring(0, expr.length - '.length'.length);
        var list = resolveValue(listPath, root, wrapperData);
        if (list is Iterable) {
          return list.length;
        }
        return 0;
      }

      // now shortcut
      if (expr == 'now') return DateTime.now().millisecondsSinceEpoch;

      // singleton access
      if (expr.startsWith('singleton.')) {
        final singleton = singletonToMap();
        final subPath = expr.replaceFirst('singleton.', '');
        return traverse(singleton, subPath);
      }

      final parts = expr.split('.');
      dynamic current;

      // FIRST check wrapperData
      if (wrapperData.containsKey(parts[0])) {
        current = wrapperData[parts[0]];
        parts.removeAt(0);
        if (parts.isEmpty) return current;
      }
      // root Map
      else if (root is Map) {
        current = root[parts[0]];
        parts.removeAt(0);
        if (parts.isEmpty) return current;
      }
      // root EntityModel
      else if (root is EntityModel) {
        current = EnhancedEntityFieldAccessor.getFieldValue(root, parts[0]);
        parts.removeAt(0);
        if (parts.isEmpty) return current;
      }
      // AdditionalField
      else if (root is AdditionalField) {
        if (parts[0] == 'key') return root.key;
        if (parts[0] == 'value') return root.value;
        return null;
      } else {
        return null;
      }

      // traverse remaining parts
      for (var i = 0; i < parts.length; i++) {
        final part = parts[i];
        final isLast = i == parts.length - 1;

        if (current == null) return null;

        if (current is Map) {
          current = current[part];
          continue;
        }

        if (current is List) {
          final idx = int.tryParse(part);
          if (idx != null && idx >= 0 && idx < current.length) {
            current = current[idx];
          } else {
            // Check if this is a list of AdditionalField objects (or Maps with key/value)
            if (current.isNotEmpty) {
              final firstItem = current.first;
              final isAdditionalFieldList = firstItem is AdditionalField ||
                  (firstItem is Map &&
                      firstItem.containsKey('key') &&
                      firstItem.containsKey('value'));

              if (isAdditionalFieldList) {
                // Search for item with matching key
                for (final item in current) {
                  String? itemKey;
                  dynamic itemValue;

                  if (item is AdditionalField) {
                    itemKey = item.key;
                    itemValue = item.value;
                  } else if (item is Map) {
                    itemKey = item['key']?.toString();
                    itemValue = item['value'];
                  }

                  if (itemKey == part) {
                    current = itemValue;
                    break;
                  }
                }
                // If we found a match, current is now the value, otherwise it's still the list
                if (current is! List) {
                  continue;
                }
                // If no match found, return null
                return null;
              }
            }

            final List<dynamic> next = [];
            for (final item in current) {
              try {
                dynamic val;
                if (item is Map) {
                  val = item[part];
                } else if (item is EntityModel)
                  val = EnhancedEntityFieldAccessor.getFieldValue(item, part);
                else if (item is AdditionalField) if ((part == 'key')) {
                  val = item.key;
                } else {
                  val = (part == 'value') ? item.value : null;
                }
                if (val != null) {
                  if (val is Iterable && val is! String) {
                    next.addAll(val.where((e) => e != null));
                  } else {
                    next.add(val);
                  }
                }
              } catch (_) {
                // Skip items where field access fails
                continue;
              }
            }
            if (next.isEmpty) return null;
            current = (isLast && next.length == 1) ? next.first : next;
          }
          continue;
        }

        if (current is AdditionalField) {
          current = (part == 'key')
              ? current.key
              : (part == 'value')
                  ? current.value
                  : null;
          continue;
        }

        if (current is EntityModel) {
          current = EnhancedEntityFieldAccessor.getFieldValue(current, part);
          continue;
        }

        return null;
      }

      return current;
    } catch (e) {
      debugPrint('ValueResolver.resolveValue error: $e for path=$path');
      return null;
    }
  }

  @override
  List<dynamic> resolveList(String path, Map<String, dynamic> wrapperData) {
    final value = resolveValue(path, null, wrapperData);
    if (value is List) return value;
    return [value];
  }

  @override
  dynamic traverse(dynamic obj, String path) {
    if (obj == null || path.isEmpty) return null;
    final parts = path.split('.');
    dynamic current = obj;

    for (final part in parts) {
      if (current == null) return null;

      if (current is Map) {
        current = current[part];
      } else if (current is EntityModel) {
        current = EnhancedEntityFieldAccessor.getFieldValue(current, part);
      } else if (current is String) {
        // Try parsing JSON string
        try {
          final decoded = jsonDecode(current);
          if (decoded is Map) {
            current = decoded[part];
          } else {
            return null;
          }
        } catch (_) {
          return null; // not valid JSON
        }
      } else {
        // Fallback for nested POJOs
        try {
          if ((current as dynamic).toJson is Function) {
            current = (current as dynamic).toJson()[part];
          } else if ((current as dynamic).toMap is Function) {
            current = (current as dynamic).toMap()[part];
          } else {
            return null;
          }
        } catch (_) {
          return null;
        }
      }
    }
    return current;
  }
}
