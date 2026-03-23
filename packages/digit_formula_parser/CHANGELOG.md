## 1.2.0

- Added `contains` and `notcontains` list check functions for validating values in lists and multi-select fields
- Improved comparison functions (`lt`, `gt`, `lte`, `gte`, `eq`, `ne`) to handle mixed string/number types
- Added support for single and double quoted string literals in expressions
- Added case-insensitive variable substitution in expressions
- Improved value type handling for null, boolean, string, and numeric values during substitution
- Rewrote parser core for better support of string, boolean, and identifier primitives

## 1.1.0

- Added support for multiple conditions inside a single expression
- Fixed issues related to empty string values

## 1.0.0

- Initial release
- Parse and evaluate mathematical and conditional expressions
- Support for string, numeric, and boolean comparisons
- Logical operators (AND, OR, NOT) with proper precedence
- Variable substitution at runtime
- Built-in math and aggregation functions
- List operations (contains, notcontains)
- Nested parentheses and complex grouped expressions
