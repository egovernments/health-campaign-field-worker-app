import 'package:petitparser/petitparser.dart';

import 'math_functions.dart';

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
      // Convert to List<num> safely
      List<num> args = [];
      for (var item in value) {
        if (item is num) {
          args.add(item);
        } else {
          throw "Function $functionName requires numeric arguments";
        }
      }
      return mathFunction(functionName, args);
    }

    if (value is num) {
      return mathFunction(functionName, [value]);
    }

    throw "Function $functionName requires numeric arguments";
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
  final boolean = (string('true') &
          string('True').optional() &
          string('false').optional() &
          string('False').optional())
      .flatten('true or false expected')
      .trim()
      .optional();

  final builder = ExpressionBuilder();

  builder.group().primitive(number.or(boolean));

  builder.group().wrapper(word().star().trim().flatten().seq(char('(').trim()),
      char(')').trim(), _createFunction);

  builder.group()
    ..prefix(char('+').trim(), (op, a) => a)
    ..prefix(char('-').trim(), (op, a) {
      return -1 * (a as num);
    })
    ..postfix(string('false').trim(), (op, a) => false)
    ..postfix(string('true').trim(), (op, a) => false);

  /// Rule gets applied in this order
  /// 1. First apply in this order ^, *, /, +, -
  /// 2. check comparison operators <=, >=, ==, !=, <, >
  /// 3. Apply negation operator !
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

  /// TODO: fix this to support ! operator
  /// this might fail in few scenarios and yet to be tested thoroughly
  builder.group().prefix(char('!').trim(), (op, a) {
    print(a.runtimeType);
    if (a.runtimeType == bool) {
      print(a.toString().toLowerCase());
      return !(a as bool);
    } else {
      print(a.toString().toLowerCase());
      if (['false', '0', '0.0', 'null', 'Null']
          .contains(a.toString().toLowerCase())) {
        return true; // return the opposite
      }
      return false;
    }
  });

  builder.group()
    ..left(char('<').seq(char('=')).trim(),
        (a, op, b) => mathFunction('LTE', [a as num, b as num]))
    ..left(string('>=').trim(),
        (a, op, b) => mathFunction('GTE', [a as num, b as num]))
    ..left(string('==').trim(),
        (a, op, b) => mathFunction('EQ', [a as num, b as num]))
    ..left(string('!=').trim(),
        (a, op, b) => mathFunction('NE', [a as num, b as num]))
    ..left(char('<').trim(),
        (a, op, b) => mathFunction('LT', [a as num, b as num]))
    ..left(char('>').trim(),
        (a, op, b) => mathFunction('GT', [a as num, b as num]));

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
