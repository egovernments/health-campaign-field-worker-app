## 0.0.8-dev

- Added dependency field logic
- Added formula parser to validate dependency

## 0.0.4-dev

### BugFix
- Removed min and maxLength validation for empty string


## 0.0.3-dev

### Added
- Added mobile number for type string

## 0.0.2-dev

### Added
- Dynamic form rendering engine based on JSON schema
- Page configuration with map-based pages (keyed by page name)
- Support for multiple field types: `text`, `dropdown`, `latLng`, `locality`, etc.
- Validation support using `reactive_forms`
- Built-in navigation and page order logic
- Integration-ready with `FormsBloc` for loading and managing form state
- Theming support via `digit_ui_components`
- Custom format handling for scanner, location picker, and more
- Form state management using BLoC pattern
- Multi-page form support with automatic navigation
- Conditional validation
- Form submission with data collection and summary generation

### Technical Features
- JSON-driven form configuration
- Automatic form control generation
- Field-level and page-level validation
- Custom widget builders for different field types
- Localization support
- Responsive design with digit_ui_components theming
- Type-safe form data handling
- Memory-efficient form state management

## 0.0.1-dev

### Initial Development Release
- Dynamic form rendering engine based on JSON schema
- Page configuration now supports **map-based pages** (keyed by page name)
- Field types supported:
    - `text`, `dropdown`, `latLng`, `locality`, etc.
- Validation support using `reactive_forms`
- Built-in navigation and page order logic
- Integration-ready with `FormsBloc` for loading and managing form state
- Theming support via `digit_ui_components`
- Custom format handling for scanner, location picker, and more
