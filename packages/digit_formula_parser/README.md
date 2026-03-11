# DIGIT Formula Parser

A Dart plugin to parse and evaluate mathematical and conditional expressions at runtime. It powers dynamic field visibility, form validations, and workflow conditions across the HCM application — enabling config-driven logic without hardcoded rules.

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  digit_formula_parser: ^1.1.0
```

Then run:

```bash
flutter pub get
```

## Features

- Parse and evaluate mathematical expressions (add, subtract, multiply, divide, power)
- String and numeric comparisons (equals, not equals, greater than, less than, etc.)
- Logical operators (AND, OR, NOT) with proper precedence
- Variable substitution — pass dynamic values at runtime
- Nested parentheses and complex grouped expressions
- Built-in math functions (sin, cos, sqrt, ceil, floor, round, avg, min, max, etc.)
- List operations — check if a list contains or does not contain a value
- Supports quoted strings, unquoted identifiers, booleans, decimals, and scientific notation
- Multiple conditions inside a single expression

## Getting Started

### Basic Usage

```dart
import 'package:digit_formula_parser/digit_formula_parser.dart';

// Simple string comparison
final parser = FormulaParser('"hello" == "hello"');
final result = parser.parse;
print(result['value']);     // true
print(result['isSuccess']); // true
```

### Variable Substitution

Pass a map of variables and their values. The parser replaces variable names with actual values before evaluating:

```dart
final parser = FormulaParser(
  'username == "admin" && status == "active"',
  {'username': 'admin', 'status': 'active'},
);
final result = parser.parse;
print(result['value']); // true
```

### Error Handling

```dart
final parser = FormulaParser('invalid expression @@');
if (parser.error) {
  print('Error: ${parser.errorMessage}');
}

// Or check from parse result
final result = parser.parse;
if (result['isFailure']) {
  print('Position: ${result['position']}');
  print('Message: ${result['message']}');
}
```

## Usage Examples

### String Comparisons

```dart
// Quoted strings
FormulaParser('"hello" == "hello"').parse['value'];          // true
FormulaParser('"apple" < "banana"').parse['value'];           // true

// Unquoted strings
FormulaParser('rachana == rachana').parse['value'];           // true
FormulaParser('user_name == user_name').parse['value'];       // true

// Special characters
FormulaParser('"test@123" == "test@123"').parse['value'];     // true

// Spaces in quoted strings
FormulaParser('"hello world" == "hello world"').parse['value']; // true
```

### Numeric Comparisons

```dart
FormulaParser('5 == 5').parse['value'];       // true
FormulaParser('3 < 5').parse['value'];        // true
FormulaParser('3.14 < 3.15').parse['value'];  // true
FormulaParser('-5 < 5').parse['value'];       // true
```

### Mixed Type Comparisons

```dart
// String with number — auto type coercion
FormulaParser('"123" == 123').parse['value'];  // true
```

### Logical Operators

```dart
// AND
FormulaParser('"hello" == "hello" && 5 > 3').parse['value'];  // true

// OR
FormulaParser('"hello" == "world" || "test" == "test"').parse['value'];  // true

// Complex
FormulaParser('"rachana" == "rachana" || (corrent == corrent && 3 != 5)').parse['value'];  // true
```

### Nested Parentheses

```dart
FormulaParser(
  '((user_name == user_name && 10 > 5) || (admin == admin && 3 < 2)) && "test" == "test"'
).parse['value'];  // true
```

### Boolean Literals

```dart
FormulaParser('true').parse['value'];   // true
FormulaParser('TRUE').parse['value'];   // true (case insensitive)
FormulaParser('false').parse['value'];  // false
```

### Math Functions

```dart
FormulaParser('sqrt(16)').parse['value'];      // 4.0
FormulaParser('ceil(3.2)').parse['value'];     // 4
FormulaParser('floor(3.8)').parse['value'];    // 3
FormulaParser('round(3.5)').parse['value'];    // 4
FormulaParser('abs(-5)').parse['value'];       // 5
FormulaParser('avg(10, 20, 30)').parse['value']; // 20
FormulaParser('max(5, 10, 3)').parse['value'];   // 10
FormulaParser('min(5, 10, 3)').parse['value'];   // 3
```

### List Operations

```dart
FormulaParser('contains("[A, B, C]", "B")').parse['value'];       // true
FormulaParser('notcontains("[A, B, C]", "D")').parse['value'];    // true
```

## API Reference

### FormulaParser

```dart
FormulaParser(String expression, [Map<String, dynamic>? options])
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `expression` | `String` | The expression to parse and evaluate |
| `options` | `Map<String, dynamic>?` | Optional variable map for substitution |

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `parse` | `Map` | Returns parse result with `isSuccess`, `isFailure`, `value`, `message`, `position` |
| `error` | `bool` | Returns `true` if parsing failed |
| `errorMessage` | `String` | Detailed error message |
| `parsedExpression` | `String` | Preprocessed expression after variable substitution |

### Parse Result Keys

| Key | Type | Description |
|-----|------|-------------|
| `isSuccess` | `bool` | Whether parsing succeeded |
| `isFailure` | `bool` | Whether parsing failed |
| `value` | `dynamic` | The evaluated result (bool, num, String) |
| `message` | `String` | Error message if parsing failed |
| `position` | `int` | Position where parsing stopped |

## Supported Operators

| Type | Operators |
|------|-----------|
| **Comparison** | `==`, `!=`, `<`, `>`, `<=`, `>=` |
| **Arithmetic** | `+`, `-`, `*`, `/`, `^` |
| **Logical** | `&&`, `\|\|`, `!` |

### Operator Precedence (lowest to highest)

1. `\|\|` (Logical OR)
2. `&&` (Logical AND)
3. `==`, `!=`, `<`, `>`, `<=`, `>=` (Comparison)
4. `+`, `-` (Addition/Subtraction)
5. `*`, `/` (Multiplication/Division)
6. `^` (Power)
7. `+`, `-`, `!` (Prefix/Unary)
8. Function calls
9. Parentheses grouping

## Built-in Functions

| Category | Functions |
|----------|-----------|
| **Math** | `exp`, `log`, `sin`, `asin`, `cos`, `acos`, `tan`, `atan`, `sqrt`, `ceil`, `floor`, `round`, `abs` |
| **Arithmetic** | `add`, `sub`, `mul`, `divi`, `power` |
| **Aggregation** | `avg`, `min`, `max` (variable number of args) |
| **List** | `contains`, `notcontains` |
| **Boolean** | `not` |

## Variable Preprocessing

When variables are passed via the `options` map, the parser preprocesses them as follows:

| Value Type | Preprocessing |
|------------|---------------|
| `null` | Replaced with `""` (empty string) |
| `num` (int/double) | Used as raw number |
| `bool` | Converted to uppercase string (`TRUE`/`FALSE`) |
| `String` | Wrapped in escaped quotes |

## Used By

| Package | Purpose |
|---------|---------|
| digit_forms_engine | Evaluate field visibility and validation conditions in form schemas |
| digit_flow_builder | Evaluate workflow conditions, action triggers, and search filters |
