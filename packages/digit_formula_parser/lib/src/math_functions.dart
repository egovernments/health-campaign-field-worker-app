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

import 'dart:math' as math;

// List of available math functions
final List<String> availableFunctions = [
  ...comparisonFunctions.keys,
  ...functionsWithOneBoolArg.keys,
  ...functionsWithOneNumberArg.keys,
  ...functionsWithTwoNumberArg.keys,
  ...functionsWithOneListArg.keys
];

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
  return args.every((arg) => arg is num || (arg is String && double.tryParse(arg) != null));
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
