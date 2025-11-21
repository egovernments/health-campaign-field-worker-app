import 'package:petitparser/petitparser.dart';

import 'math_functions.dart';

/// Helper function to convert values to boolean
bool _toBoolean(dynamic value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) return value.isNotEmpty;
  return true;
}

/// Function wrapper handler
dynamic _createFunction(left, value, right) {
  if (left is List) {
    String functionName = left[0].toLowerCase();

    if (value is List) {
      bool allNumeric = value.every((item) => item is num);
      if (allNumeric) {
        return mathFunction(functionName, value.cast<num>());
      }
      return mathFunction(functionName, value);
    }

    if (value is num) return mathFunction(functionName, [value]);
    return mathFunction(functionName, [value]);
  }
  return value;
}

/// MAIN PARSER
final parser = () {
  // ---------- PRIMITIVES ----------
  final number = (digit().plus() &
          (char('.') & digit().plus()).optional() &
          (pattern('eE') & pattern('+-').optional() & digit().plus())
              .optional())
      .flatten()
      .trim()
      .map(double.parse);

  final stringLiteral =
      (char('"') & (char('\\') & any() | char('"').neg()).star() & char('"'))
          .flatten()
          .trim()
          .map((v) => v.substring(1, v.length - 1));

  final identifier =
      (letter() & (letter() | digit() | char('_')).star()).flatten().trim();

  final booleanLiteral = (string('TRUE') | string('FALSE'))
      .flatten()
      .trim()
      .map((v) => v == 'TRUE');

  // ---------- EXPRESSION BUILDER ----------
  final builder = ExpressionBuilder();

  // PRIMITIVES
  builder
      .group()
      .primitive(number.or(stringLiteral).or(booleanLiteral).or(identifier));

  // ---------- FUNCTION CALLS ----------
  // Only identifiers followed by '(' should be treated as functions
  builder.group().wrapper(
      identifier.seq(char('(').trim()), char(')').trim(), _createFunction);

  // ---------- PARENTHESIS GROUPING ----------
  builder.group().wrapper(char('(').trim(), char(')').trim(), (l, v, r) {
    return v is bool ? v : _toBoolean(v);
  });

  // ---------- PREFIX OPERATORS ----------
  builder.group()
    ..prefix(char('+').trim(), (op, a) => a)
    ..prefix(char('-').trim(), (op, a) => -(a as num))
    ..prefix(char('!').trim(), (op, a) {
      bool val = _toBoolean(a);
      return !val;
    });

  // ---------- POWER ----------
  builder.group().right(char('^').trim(),
      (a, op, b) => mathFunction('POWER', [a as num, b as num]));

  // ---------- MULTIPLY / DIVIDE ----------
  builder.group()
    ..left(char('*').trim(),
        (a, op, b) => mathFunction('MUL', [a as num, b as num]))
    ..left(char('/').trim(),
        (a, op, b) => mathFunction('DIVI', [a as num, b as num]));

  // ---------- ADD / SUBTRACT ----------
  builder.group()
    ..left(char('+').trim(),
        (a, op, b) => mathFunction('ADD', [a as num, b as num]))
    ..left(char('-').trim(),
        (a, op, b) => mathFunction('SUB', [a as num, b as num]));

  // ---------- COMPARISON OPERATORS ----------
  builder.group()
    ..left(string("<=").trim(), (a, op, b) => mathFunction('LTE', [a, b]))
    ..left(string(">=").trim(), (a, op, b) => mathFunction('GTE', [a, b]))
    ..left(string("==").trim(), (a, op, b) => mathFunction('EQ', [a, b]))
    ..left(string("!=").trim(), (a, op, b) => mathFunction('NE', [a, b]))
    ..left(char('<').trim(), (a, op, b) => mathFunction('LT', [a, b]))
    ..left(char('>').trim(), (a, op, b) => mathFunction('GT', [a, b]));

  // ---------- LOGICAL AND ----------
  builder.group().left(string("&&").trim(), (a, op, b) {
    return _toBoolean(a) && _toBoolean(b);
  });

  // ---------- LOGICAL OR ----------
  builder.group().left(string("||").trim(), (a, op, b) {
    return _toBoolean(a) || _toBoolean(b);
  });

  // ---------- COMMA LIST BUILDER ----------
  builder.group().left(char(',').trim(), (a, op, b) {
    if (a is List) return [...a, b];
    return [a, b];
  });

  return builder.build().end();
}();
