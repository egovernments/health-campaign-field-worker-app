/// This file contains common mathematical functions and their implementations.
/// It also includes a list of available math functions and their corresponding keys.
/// The [mathFunction] function takes a function name and a list of arguments and returns the result of the function.
/// The [comparisonFunctions], [functionsWithOneBoolArg], [functionsWithOneNumberArg],
/// [functionsWithTwoNumberArg], and [functionsWithOneListArg] maps store the implementations for different functions.
/// Each function implementation is associated with a key.
///
/// Example usage:
/// ```dart
/// dynamic result = mathFunction('add', [2, 3]);
/// print(result); // Output: 5
/// ```
library;

import 'dart:math' as math;

// List of available math functions
final List<String> availableFunctions = [
  ...comparisonFunctions.keys,
  ...listCheckFunctions.keys,
  ...functionsWithOneBoolArg.keys,
  ...functionsWithOneNumberArg.keys,
  ...functionsWithTwoNumberArg.keys,
  ...functionsWithOneListArg.keys
];

/// Functions for checking if a value exists in a list/collection
/// These are useful for multi-select fields where the value is a List
final Map<String, bool Function(dynamic, dynamic)> listCheckFunctions = {
  /// Checks if a list contains a specific value
  /// Usage: contains(stockDetails.productDetail, 'PVAR-xxx')
  /// Works with both List objects and string representations like "[A, B, C]"
  /// Also works with lists of objects like "[{ID:xxx,SKU:yyy},{ID:zzz,SKU:www}]"
  'contains': (dynamic list, dynamic value) {
    if (list == null || value == null) return false;

    final searchValue =
        value.toString().toUpperCase().replaceAll('"', '').replaceAll("'", '');

    // If list is actually a List, check if it contains the value
    if (list is List) {
      // Check if any item equals the search value OR if any item (when converted to string) contains it
      return list.any((item) {
        final itemStr = item.toString().toUpperCase();
        // Exact match
        if (itemStr == searchValue) return true;
        // For Map/object items, check if the search value exists within
        if (item is Map) {
          return item.values.any((v) =>
              v.toString().toUpperCase() == searchValue ||
              v.toString().toUpperCase().contains(searchValue));
        }
        // Substring match for complex items
        return itemStr.contains(searchValue);
      });
    }

    // If list is a string representation of a list
    if (list is String) {
      final upperList = list.toUpperCase();

      // Check if it looks like a list of objects (contains curly braces)
      if (list.contains('{') && list.contains('}')) {
        // For lists of objects, do a substring search
        return upperList.contains(searchValue);
      }

      // For simple lists like "[A, B, C]", do exact item matching
      var cleanList = list.replaceAll(RegExp(r'''[\[\]"']'''), '').trim();
      var items =
          cleanList.split(',').map((e) => e.trim().toUpperCase()).toList();
      // Check exact match first
      if (items.contains(searchValue)) return true;
      // Fallback to substring match
      return upperList.contains(searchValue);
    }

    return false;
  },

  /// Checks if a list does NOT contain a specific value
  /// Usage: notcontains(stockDetails.productDetail, 'PVAR-xxx')
  /// Also works with lists of objects like "[{ID:xxx,SKU:yyy},{ID:zzz,SKU:www}]"
  'notcontains': (dynamic list, dynamic value) {
    if (list == null) return true;
    if (value == null) return true;

    final searchValue =
        value.toString().toUpperCase().replaceAll('"', '').replaceAll("'", '');

    // If list is actually a List, check that no item contains the value
    if (list is List) {
      return !list.any((item) {
        final itemStr = item.toString().toUpperCase();
        // Exact match
        if (itemStr == searchValue) return true;
        // For Map/object items, check if the search value exists within
        if (item is Map) {
          return item.values.any((v) =>
              v.toString().toUpperCase() == searchValue ||
              v.toString().toUpperCase().contains(searchValue));
        }
        // Substring match for complex items
        return itemStr.contains(searchValue);
      });
    }

    // If list is a string representation of a list
    if (list is String) {
      final upperList = list.toUpperCase();

      // Check if it looks like a list of objects (contains curly braces)
      if (list.contains('{') && list.contains('}')) {
        // For lists of objects, do a substring search
        return !upperList.contains(searchValue);
      }

      // For simple lists like "[A, B, C]", do exact item matching
      var cleanList = list.replaceAll(RegExp(r'''[\[\]"']'''), '').trim();
      var items =
          cleanList.split(',').map((e) => e.trim().toUpperCase()).toList();
      // Check exact match first
      if (items.contains(searchValue)) return false;
      // Fallback to substring match
      return !upperList.contains(searchValue);
    }

    return true;
  },
};

// Add this helper function to convert dynamic values to num
List<num> _convertToNumbers(List<dynamic> args) {
  return args.map((e) {
    if (e is num) return e;
    if (e is int) return e.toDouble();
    if (e is double) return e;
    if (e is String) return double.tryParse(e) ?? 0;
    return 0;
  }).toList();
}

// Helper function to check if all arguments are numeric
bool _areAllNumeric(List<dynamic> args) {
  return args.every(
      (arg) => arg is num || (arg is String && double.tryParse(arg) != null));
}

// Update function maps with explicit types

final Map<String, bool Function(dynamic, dynamic)> comparisonFunctions = {
  'lt': (a, b) {
    if (a is String && b is String) return a.compareTo(b) < 0;
    if (a is num && b is num) return a < b;
    if (a is String && b is num) {
      final parsedA = double.tryParse(a);
      return parsedA != null ? parsedA < b : false;
    }
    if (a is num && b is String) {
      final parsedB = double.tryParse(b);
      return parsedB != null ? a < parsedB : false;
    }
    return a.toString().compareTo(b.toString()) < 0;
  },
  'gt': (a, b) {
    if (a is String && b is String) return a.compareTo(b) > 0;
    if (a is num && b is num) return a > b;
    if (a is String && b is num) {
      final parsedA = double.tryParse(a);
      return parsedA != null ? parsedA > b : false;
    }
    if (a is num && b is String) {
      final parsedB = double.tryParse(b);
      return parsedB != null ? a > parsedB : false;
    }
    return a.toString().compareTo(b.toString()) > 0;
  },
  'lte': (a, b) {
    if (a is String && b is String) return a.compareTo(b) <= 0;
    if (a is num && b is num) return a <= b;
    if (a is String && b is num) {
      final parsedA = double.tryParse(a);
      return parsedA != null ? parsedA <= b : false;
    }
    if (a is num && b is String) {
      final parsedB = double.tryParse(b);
      return parsedB != null ? a <= parsedB : false;
    }
    return a.toString().compareTo(b.toString()) <= 0;
  },
  'gte': (a, b) {
    if (a is String && b is String) return a.compareTo(b) >= 0;
    if (a is num && b is num) return a >= b;
    if (a is String && b is num) {
      final parsedA = double.tryParse(a);
      return parsedA != null ? parsedA >= b : false;
    }
    if (a is num && b is String) {
      final parsedB = double.tryParse(b);
      return parsedB != null ? a >= parsedB : false;
    }
    return a.toString().compareTo(b.toString()) >= 0;
  },
  'eq': (a, b) {
    if (a is String && b is String) return a == b;
    if (a is num && b is num) return a == b;
    if (a is String && b is num) {
      final parsedA = double.tryParse(a);
      return parsedA != null ? parsedA == b : false;
    }
    if (a is num && b is String) {
      final parsedB = double.tryParse(b);
      return parsedB != null ? a == parsedB : false;
    }
    return a.toString() == b.toString();
  },
  'ne': (a, b) {
    if (a is String && b is String) return a != b;
    if (a is num && b is num) return a != b;
    if (a is String && b is num) {
      final parsedA = double.tryParse(a);
      return parsedA != null ? parsedA != b : true;
    }
    if (a is num && b is String) {
      final parsedB = double.tryParse(b);
      return parsedB != null ? a != parsedB : true;
    }
    return a.toString() != b.toString();
  },
};

final Map<String, bool Function(bool)> functionsWithOneBoolArg = {
  'not': (bool a) => !a,
};

final Map<String, num Function(num)> functionsWithOneNumberArg = {
  'exp': math.exp,
  'log': math.log,
  'sin': math.sin,
  'asin': math.asin,
  'cos': math.cos,
  'acos': math.acos,
  'tan': math.tan,
  'atan': math.atan,
  'sqrt': math.sqrt,
  'ceil': (num a) => a.ceil().toDouble(),
  'floor': (num a) => a.floor().toDouble(),
  'round': (num a) => a.round().toDouble(),
  'abs': (num a) => a.abs().toDouble(),
};

final Map<String, num Function(num, num)> functionsWithTwoNumberArg = {
  'add': (num a, num b) => a + b,
  'sub': (num a, num b) => a - b,
  'mul': (num a, num b) => a * b,
  'divi': (num a, num b) => a / b,
  'power': (num a, num b) => math.pow(a, b).toDouble(),
};

final Map<String, num Function(List<num>)> functionsWithOneListArg = {
  'avg': (List<num> l) {
    if (l.isEmpty) throw ArgumentError("avg requires at least one argument");
    num sum = l.fold(0, (num v1, num v2) => v1 + v2);
    return sum / l.length;
  },
  'min': (List<num> l) {
    if (l.isEmpty) throw ArgumentError("min requires at least one argument");
    return l.reduce((a, b) => a < b ? a : b);
  },
  'max': (List<num> l) {
    if (l.isEmpty) throw ArgumentError("max requires at least one argument");
    return l.reduce((a, b) => a > b ? a : b);
  },
};

/// Common mathematical functions.
dynamic mathFunction(String name, List<dynamic> arguments) {
  final String fnName = name.toLowerCase();

  // Handle list check functions (contains, notContains)
  if (listCheckFunctions.containsKey(fnName) && arguments.length == 2) {
    return listCheckFunctions[fnName]!(arguments[0], arguments[1]);
  }

  // Handle comparison functions that can work with strings and numbers
  if (comparisonFunctions.containsKey(fnName) && arguments.length == 2) {
    return comparisonFunctions[fnName]!(arguments[0], arguments[1]);
  }

  // For numeric functions, convert arguments to numbers
  if (_areAllNumeric(arguments)) {
    final args = _convertToNumbers(arguments);
    if (args.isEmpty) return null;

    if (functionsWithOneNumberArg.containsKey(fnName) && args.length == 1) {
      return functionsWithOneNumberArg[fnName]!(args[0]);
    }

    if (functionsWithTwoNumberArg.containsKey(fnName) && args.length == 2) {
      return functionsWithTwoNumberArg[fnName]!(args[0], args[1]);
    }

    if (functionsWithOneListArg.containsKey(fnName) && args.isNotEmpty) {
      return functionsWithOneListArg[fnName]!(args);
    }
  }

  return null;
}
