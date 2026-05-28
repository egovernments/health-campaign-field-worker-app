import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:reactive_forms/reactive_forms.dart';

// ---------------------------------------------------------------------------
// Global registry for computed-field configurations.
// Key: schemaKey  ->  Map of targetFieldName -> config map
// Each config map has: { "sources": [...], "operation": "sum" }
// ---------------------------------------------------------------------------

final Map<String, Map<String, Map<String, dynamic>>> _computedFieldRegistry =
    {};

/// Register computed-field configs extracted from the raw JSON schema.
void registerComputedFields(
    String schemaKey, Map<String, Map<String, dynamic>> configs) {
  _computedFieldRegistry[schemaKey] = configs;
}

/// Retrieve computed-field configs for a given schema.
Map<String, Map<String, dynamic>>? getComputedFields(String schemaKey) {
  return _computedFieldRegistry[schemaKey];
}

/// Remove computed-field configs when the schema is unloaded.
void unregisterComputedFields(String schemaKey) {
  _computedFieldRegistry.remove(schemaKey);
}

// ---------------------------------------------------------------------------
// ComputedFieldManager
// ---------------------------------------------------------------------------

/// Manages auto-computed fields within a [FormGroup].
///
/// For each configured target field the manager:
///  1. Listens to value changes on every source field.
///  2. Recomputes the aggregate (currently only `sum`).
///  3. Always updates the target field value to match the computed sum.
///
/// The user can still manually edit the target field, but it will be
/// overwritten the next time any source field changes.
class ComputedFieldManager {
  final FormGroup formGroup;
  final Map<String, Map<String, dynamic>> configs;

  final List<StreamSubscription> _subscriptions = [];

  ComputedFieldManager({
    required this.formGroup,
    required this.configs,
  }) {
    _setup();
  }

  // -------------------------------------------------------------------------
  // Setup
  // -------------------------------------------------------------------------

  void _setup() {
    configs.forEach((targetField, config) {
      final sources = (config['sources'] as List?)?.cast<String>() ?? [];
      final operation = config['operation'] as String? ?? 'sum';

      if (sources.isEmpty) return;

      // Compute initial value
      _recompute(targetField, sources, operation);

      // Listen to each source field
      for (final source in sources) {
        try {
          final control = formGroup.control(source);
          final sub = control.valueChanges.listen((_) {
            _recompute(targetField, sources, operation);
          });
          _subscriptions.add(sub);
        } catch (e) {
          if (kDebugMode) {
            print(
                'ComputedFieldManager: source field "$source" not found in form');
          }
        }
      }
    });
  }

  // -------------------------------------------------------------------------
  // Computation
  // -------------------------------------------------------------------------

  void _recompute(
      String targetField, List<String> sources, String operation) {
    num computed = 0;

    if (operation == 'sum') {
      for (final source in sources) {
        try {
          final raw = formGroup.control(source).value;
          final val = _toNum(raw);
          computed += val;
        } catch (_) {
          // source control missing – skip
        }
      }
    }

    // Always set the target control to the computed sum.
    try {
      final target = formGroup.control(targetField);

      // Determine the correct typed value to set.
      // FormControl<int> expects int?, FormControl<String> expects String?.
      final bool isIntControl = target is FormControl<int>;

      if (computed == 0) {
        target.value = null;
      } else if (isIntControl) {
        target.value = computed.toInt();
      } else {
        target.value = computed.toString();
      }

      target.updateValueAndValidity();
    } catch (e) {
      if (kDebugMode) {
        print(
            'ComputedFieldManager: target field "$targetField" not found in form');
      }
    }
  }

  // -------------------------------------------------------------------------
  // Helpers
  // -------------------------------------------------------------------------

  static num _toNum(dynamic value) {
    if (value == null) return 0;
    if (value is num) return value;
    return num.tryParse(value.toString()) ?? 0;
  }

  // -------------------------------------------------------------------------
  // Dispose
  // -------------------------------------------------------------------------

  void dispose() {
    for (final sub in _subscriptions) {
      sub.cancel();
    }
    _subscriptions.clear();
  }
}
