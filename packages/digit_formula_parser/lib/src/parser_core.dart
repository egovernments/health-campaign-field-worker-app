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

/// Creates a function based on the given left, value, and right arguments
/// if the expression is ADD(2,3) then this function will receive,
/// left = [ADD, (]
/// value = [2, 3] can be a List
/// right = [)]
/// and will return 5
///
/// If the expression is a math function with only one argument like POWER(5.6) or SQRT(9) then,
/// left = [ROUND, (] or [SQRT, (]
/// value = 5.6 or 9 // can be a number (int / double / num)
/// right = [)]
dynamic _createFunction(left, value, right) {
  if (left is List) {
    String functionName = left[0].toLowerCase();

    if (value is List) {
      // Check if all values are numeric for math functions
      bool allNumeric = value.every((item) => item is num);
      if (allNumeric) {
        List<num> args = [];
        for (var item in value) {
          if (item is num) {
            args.add(item);
          } else {
            throw "Function $functionName requires numeric arguments";
          }
        }
        return mathFunction(functionName, args);
      } else {
        // For non-numeric functions, pass the values as-is
        return mathFunction(functionName, value);
      }
    }

    if (value is num) {
      return mathFunction(functionName, [value]);
    }

    // For non-numeric values, pass as-is
    return mathFunction(functionName, [value]);
  }
  return value;
}

/// Creates a parser using PetitParser library
final parser = () {
  final number = (digit().plus() &
          (digit().plus() & char('.') & digit().plus()).optional() &
          (char('.') & digit().plus()).optional() &
          (pattern('eE') & pattern('+-').optional() & digit().plus())
              .optional())
      .flatten('number expected')
      .trim()
      .map(double.parse);

  // Add string literal support
  final stringLiteral = (char('"') &
          (char('\\') & any() | char('"').neg()).star() &
          char('"'))
      .flatten('string expected')
      .trim()
      .map((value) => value.substring(1, value.length - 1)); // Remove quotes

  // Add unquoted string identifier support (words)
  final word = (letter() & (letter() | digit() | char('_')).star())
      .flatten('word expected')
      .trim();

  final boolean = (string('TRUE').or(string('FALSE')))
      .flatten('true or false expected')
      .trim()
      .map((value) {
    if (value.toString() == 'TRUE') return true;
    if (value.toString() == 'FALSE') return false;
    return value; // Return as-is if not recognized
  });

  final builder = ExpressionBuilder();

  // Include string literals, words, numbers, and booleans in primitive parser
  builder.group().primitive(number.or(stringLiteral).or(boolean).or(word));

  builder.group().wrapper(word.star().trim().flatten().seq(char('(').trim()),
      char(')').trim(), _createFunction);

  // Add parentheses support for grouping expressions
  builder.group().wrapper(char('(').trim(), char(')').trim(),
      (left, value, right) {
    // Ensure we return the proper boolean value
    if (value is bool) {
      return value;
    }
    // For non-boolean values, convert to boolean
    return _toBoolean(value);
  });

  builder.group()
    ..prefix(char('+').trim(), (op, a) => a)
    ..prefix(char('-').trim(), (op, a) {
      return -1 * (a as num);
    });

  /// Rule gets applied in this order
  /// 1. First apply in this order ^, *, /, +, -
  /// 2. check comparison operators <=, >=, ==, !=, <, >
  /// 3. Apply logical operators &&, ||
  /// 4. Apply negation operator !
  builder.group().left(char('^').trim(),
      (a, op, b) => mathFunction('POWER', [a as num, b as num]));

  builder.group()
    ..left(char('*').trim(),
        (a, op, b) => mathFunction('MUL', [a as num, b as num]))
    ..left(char('/').trim(),
        (a, op, b) => mathFunction('DIVI', [a as num, b as num]));

  builder.group()
    ..left(char('+').trim(),
        (a, op, b) => mathFunction('ADD', [a as num, b as num]))
    ..left(char('-').trim(),
        (a, op, b) => mathFunction('SUB', [a as num, b as num]));

  builder.group()
    ..left(char('<').seq(char('=')).trim(),
        (a, op, b) => mathFunction('LTE', [a, b]))
    ..left(string('>=').trim(), (a, op, b) => mathFunction('GTE', [a, b]))
    ..left(string('==').trim(), (a, op, b) => mathFunction('EQ', [a, b]))
    ..left(string('!=').trim(), (a, op, b) => mathFunction('NE', [a, b]))
    ..left(char('<').trim(), (a, op, b) => mathFunction('LT', [a, b]))
    ..left(char('>').trim(), (a, op, b) => mathFunction('GT', [a, b]));

  // Add logical AND operator support (higher precedence than OR)
  builder.group().left(string('&&').trim(), (a, op, b) {
    // Convert both operands to boolean
    bool aBool = _toBoolean(a);
    bool bBool = _toBoolean(b);
    return aBool && bBool;
  });

  // Add logical OR operator support (lowest precedence)
  builder.group().left(string('||').trim(), (a, op, b) {
    // Convert both operands to boolean
    bool aBool = _toBoolean(a);
    bool bBool = _toBoolean(b);
    return aBool || bBool;
  });

  /// TODO: fix this to support ! operator
  /// this might fail in few scenarios and yet to be tested thoroughly
  builder.group().prefix(char('!').trim(), (op, a) {
    if (a.runtimeType == bool) {
      return !(a as bool);
    } else {
      if (['false', '0', '0.0', 'null', 'Null']
          .contains(a.toString().toLowerCase())) {
        return true; // return the opposite
      }
      return false;
    }
  });

  // FIXED: Comma operator to create flat lists
  builder.group().left(char(',').trim(), (a, op, b) {
    if (a is List) {
      return [...a, b]; // Flatten nested lists
    } else {
      return [a, b];
    }
  });

  return builder.build().end();
}();
