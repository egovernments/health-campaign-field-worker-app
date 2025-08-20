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

// Update function maps with explicit types

final Map<String, bool Function(dynamic, dynamic)> comparisonFunctions = {
  'lt': (a, b) => a < b,
  'gt': (a, b) => a > b,
  'lte': (a, b) => a <= b,
  'gte': (a, b) => a >= b,
  'eq': (a, b) => a == b,
  'ne': (a, b) => a != b,
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
  final args = _convertToNumbers(arguments);
  if (args.isEmpty) return null;

  final String fnName = name.toLowerCase();

  if (functionsWithOneNumberArg.containsKey(fnName) && args.length == 1) {
    return functionsWithOneNumberArg[fnName]!(args[0]);
  }

  if (comparisonFunctions.containsKey(fnName) && args.length == 2) {
    return comparisonFunctions[fnName]!(args[0], args[1]);
  }

  if (functionsWithTwoNumberArg.containsKey(fnName) && args.length == 2) {
    return functionsWithTwoNumberArg[fnName]!(args[0], args[1]);
  }

  if (functionsWithOneListArg.containsKey(fnName) && args.isNotEmpty) {
    return functionsWithOneListArg[fnName]!(args);
  }

  return null;
}
