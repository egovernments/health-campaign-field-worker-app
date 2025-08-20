# Digit Formula Parser

A comprehensive Dart package for parsing and evaluating mathematical and logical expressions with support for string comparisons, numeric operations, and complex logical expressions.

## Features

### ✅ String Comparisons
- **Quoted strings**: `"hello" == "hello"`, `"apple" < "banana"`
- **Unquoted strings**: `rachana==rachana`, `user_name==user_name`
- **Mixed case**: `TestUser==TestUser`
- **Special characters**: `test@123==test@123`
- **Spaces**: `"hello world" == "hello world"`

### ✅ Numeric Comparisons
- **Basic operations**: `5 == 5`, `3 < 5`, `7 > 3`
- **Decimal numbers**: `3.14 < 3.15`
- **Negative numbers**: `-5 < 5`
- **Large numbers**: `999999999 > 999999998`

### ✅ Mixed Type Comparisons
- **String with number**: `"123" == 123`
- **Quoted with unquoted**: `"hello"==world`

### ✅ Logical Operators
- **AND operator**: `"hello"=="hello" && 5>3`
- **OR operator**: `"hello"=="world" || "test"=="test"`
- **Complex combinations**: `"test"!="other" && "a"<"b"`

### ✅ Parentheses Grouping
- **Simple grouping**: `(corrent==corrent)`
- **Complex grouping**: `(user_name==user_name && 10>5)`
- **Nested parentheses**: `((user_name==user_name && 10>5) || (admin==admin && 3<2))`

### ✅ Boolean Literals
- **True/False**: `true`, `false`
- **Case insensitive**: `TRUE`, `FALSE`, `True`, `False`

### ✅ Complex Expressions
- **Your example**: `"rachana"=="rachana" || (corrent==corrent && 3!=5)`
- **Nested logic**: `((user_name==user_name && 10>5) || (admin==admin && 3<2)) && "test"=="test"`
- **Mixed operators**: `("user"=="admin" && 5>3) || ("guest"=="guest" && 10<5) || ("test"=="test")`

## Usage

```dart
import 'package:digit_formula_parser/digit_formula_parser.dart';

void main() {
  // Simple string comparison
  final parser1 = FormulaParser('"hello" == "hello"');
  final result1 = parser1.parse;
  print(result1['value']); // true

  // Complex expression
  final parser2 = FormulaParser('"rachana"=="rachana" || (corrent==corrent && 3!=5)');
  final result2 = parser2.parse;
  print(result2['value']); // true

  // Mixed types
  final parser3 = FormulaParser('"123" == 123');
  final result3 = parser3.parse;
  print(result3['value']); // true
}
```

## Supported Operators

### Comparison Operators
- `==` (equality)
- `!=` (inequality)
- `<` (less than)
- `>` (greater than)
- `<=` (less than or equal)
- `>=` (greater than or equal)

### Logical Operators
- `&&` (logical AND)
- `||` (logical OR)

### Mathematical Operators
- `+` (addition)
- `-` (subtraction)
- `*` (multiplication)
- `/` (division)
- `^` (power)

## Test Coverage

The package includes comprehensive tests covering:
- ✅ 62 test cases
- ✅ String comparisons (quoted and unquoted)
- ✅ Numeric comparisons
- ✅ Mixed type comparisons
- ✅ Logical operators
- ✅ Parentheses grouping
- ✅ Complex expressions
- ✅ Edge cases
- ✅ Boolean literals
- ✅ Operator precedence
- ✅ Performance tests

## Error Handling

The parser provides detailed error messages for:
- Invalid expressions
- Reserved word conflicts
- Parsing failures
- Type mismatches

## Performance

Optimized for:
- Fast parsing of simple expressions
- Efficient handling of complex nested expressions
- Memory-efficient string processing
- Scalable logical evaluation
