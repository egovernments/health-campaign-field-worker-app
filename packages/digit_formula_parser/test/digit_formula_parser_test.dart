import 'package:test/test.dart';
import 'package:digit_formula_parser/digit_formula_parser.dart';

void main() {
  group('Digit Formula Parser - Comprehensive Tests', () {
    
    group('String Comparison Tests', () {
      test('Quoted string equality comparison', () {
        final parser = FormulaParser('"hello" == "hello"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Quoted string inequality comparison', () {
        final parser = FormulaParser('"hello" != "world"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Quoted string less than comparison', () {
        final parser = FormulaParser('"apple" < "banana"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Quoted string greater than comparison', () {
        final parser = FormulaParser('"zebra" > "apple"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Quoted string less than or equal comparison', () {
        final parser = FormulaParser('"apple" <= "apple"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Quoted string greater than or equal comparison', () {
        final parser = FormulaParser('"zebra" >= "apple"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Quoted string with spaces', () {
        final parser = FormulaParser('"hello world" == "hello world"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Quoted string with special characters', () {
        final parser = FormulaParser('"test@123" == "test@123"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });
    });

    group('Unquoted String Comparison Tests', () {
      test('Unquoted string equality comparison', () {
        final parser = FormulaParser('rachana==rachana');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Unquoted string inequality comparison', () {
        final parser = FormulaParser('rachana!=john');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Unquoted string less than comparison', () {
        final parser = FormulaParser('apple<banana');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Unquoted string greater than comparison', () {
        final parser = FormulaParser('zebra>apple');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Unquoted string with numbers', () {
        final parser = FormulaParser('test123==test123');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Unquoted string with underscores', () {
        final parser = FormulaParser('user_name==user_name');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Unquoted string with mixed case', () {
        final parser = FormulaParser('TestUser==TestUser');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });
    });

    group('Mixed String and Number Comparison Tests', () {
      test('Mixed string and number equality', () {
        final parser = FormulaParser('"123" == 123');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Mixed string and number inequality', () {
        final parser = FormulaParser('"456" != 123');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Mixed unquoted string and number', () {
        final parser = FormulaParser('test123==test123');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Quoted string with unquoted string', () {
        final parser = FormulaParser('"hello"==world');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], false);
      });
    });

    group('Numeric Comparison Tests', () {
      test('Numeric equality comparison', () {
        final parser = FormulaParser('5 == 5');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Numeric inequality comparison', () {
        final parser = FormulaParser('5 != 10');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Numeric less than comparison', () {
        final parser = FormulaParser('3 < 5');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Numeric greater than comparison', () {
        final parser = FormulaParser('7 > 3');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Numeric less than or equal comparison', () {
        final parser = FormulaParser('5 <= 5');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Numeric greater than or equal comparison', () {
        final parser = FormulaParser('7 >= 3');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Decimal number comparison', () {
        final parser = FormulaParser('3.14 < 3.15');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Negative number comparison', () {
        final parser = FormulaParser('-5 < 5');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });
    });

    group('Logical AND Operator Tests', () {
      test('Simple AND with true conditions', () {
        final parser = FormulaParser('"hello"=="hello" && 5>3');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Simple AND with false conditions', () {
        final parser = FormulaParser('"hello"=="world" && 5>3');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], false);
      });

      test('AND with unquoted strings', () {
        final parser = FormulaParser('user_name==user_name && 10>5');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('AND with mixed types', () {
        final parser = FormulaParser('"test"=="test" && admin==admin');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('AND with numeric comparisons', () {
        final parser = FormulaParser('5>3 && 10<20');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });
    });

    group('Logical OR Operator Tests', () {
      test('Simple OR with true conditions', () {
        final parser = FormulaParser('"hello"=="world" || "test"=="test"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Simple OR with false conditions', () {
        final parser = FormulaParser('"hello"=="world" || "test"=="wrong"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], false);
      });

      test('OR with unquoted strings', () {
        final parser = FormulaParser('user_name==wrong || admin==admin');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('OR with mixed types', () {
        final parser = FormulaParser('"test"=="wrong" || admin==admin');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('OR with numeric comparisons', () {
        final parser = FormulaParser('5>10 || 10>5');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });
    });

    group('Parentheses Grouping Tests', () {
      test('Simple parentheses with single condition', () {
        final parser = FormulaParser('(corrent==corrent)');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Parentheses with AND operation', () {
        final parser = FormulaParser('(corrent==corrent && 3!=5)');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Parentheses with OR operation', () {
        final parser = FormulaParser('("hello"=="world" || "test"=="test")');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Nested parentheses', () {
        final parser = FormulaParser('((user_name==user_name && 10>5) || (admin==admin && 3<2))');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Multiple nested parentheses', () {
        final parser = FormulaParser('(((user_name==user_name && 10>5) || (admin==admin && 3<2)) && "test"=="test")');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });
    });

    group('Complex Expression Tests', () {
      test('OR with AND and parentheses', () {
        final parser = FormulaParser('"rachana"=="rachana" || (corrent==corrent && 3!=5)');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Complex mixed expression', () {
        final parser = FormulaParser('(user_name==user_name && 10>5) || (admin==admin && 3<2)');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Complex expression with nested parentheses', () {
        final parser = FormulaParser('((user_name==user_name && 10>5) || (admin==admin && 3<2)) && "test"=="test"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Complex expression with mixed types', () {
        final parser = FormulaParser('"hello"=="world" || ("test"=="test" && 5>3)');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Complex expression with all operators', () {
        final parser = FormulaParser('("user"=="admin" && 5>3) || ("guest"=="guest" && 10<5) || ("test"=="test")');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });
    });

    group('Edge Cases and Error Handling Tests', () {
      test('Empty string comparison', () {
        final parser = FormulaParser('"" == ""');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Single character comparison', () {
        final parser = FormulaParser('"a" == "a"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Very long string comparison', () {
        final longString = 'a' * 1000;
        final parser = FormulaParser('"$longString" == "$longString"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Zero comparison', () {
        final parser = FormulaParser('0 == 0');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Large number comparison', () {
        final parser = FormulaParser('999999999 > 999999998');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Decimal precision comparison', () {
        final parser = FormulaParser('3.14159 > 3.14158');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });
    });

    group('Boolean Literal Tests', () {
      test('True literal', () {
        final parser = FormulaParser('true');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('False literal', () {
        final parser = FormulaParser('false');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], false);
      });

      test('Boolean with comparison', () {
        final parser = FormulaParser('true == true');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });
    });

    group('Operator Precedence Tests', () {
      test('AND has higher precedence than OR', () {
        final parser = FormulaParser('"a"=="b" || "c"=="c" && "d"=="e"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], false); // Should be false because AND is evaluated first
      });

      test('Parentheses override precedence', () {
        final parser = FormulaParser('("a"=="b" || "c"=="c") && "d"=="e"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], false);
      });

      test('Complex precedence with parentheses', () {
        final parser = FormulaParser('"a"=="a" && ("b"=="c" || "d"=="d") && "e"=="e"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });
    });

    group('Performance and Stress Tests', () {
      test('Multiple nested parentheses', () {
        final parser = FormulaParser('((((user==user && 1==1) || (admin==admin && 2==2)) && (test==test || demo==demo)) && final==final)');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Long chain of OR operations', () {
        final parser = FormulaParser('"a"=="b" || "c"=="d" || "e"=="f" || "g"=="g" || "h"=="i"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });

      test('Long chain of AND operations', () {
        final parser = FormulaParser('"a"=="a" && "b"=="b" && "c"=="c" && "d"=="d" && "e"=="e"');
        final result = parser.parse;
        expect(result['isSuccess'], true);
        expect(result['value'], true);
      });
    });
  });
} 