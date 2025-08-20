/// A dynamic form rendering engine for Flutter.
/// 
/// This library provides a complete solution for creating dynamic, multi-page forms
/// based on JSON schemas. It includes form state management, validation, navigation,
/// and automatic widget rendering.
/// 
/// ## Features
/// 
/// - **JSON-driven forms**: Define complex forms using simple JSON schemas
/// - **Multi-page support**: Navigate between form pages automatically
/// - **Built-in validation**: Field-level and page-level validation
/// - **State management**: Powered by BLoC pattern for efficient state handling
/// - **Type safety**: Full type safety with generated models
/// - **Theming support**: Integrates with digit_ui_components theming
/// - **Localization ready**: Built-in support for multi-language forms
/// 
/// ## Quick Start
/// 
/// ```dart
/// import 'package:digit_forms_engine/forms_engine.dart';
/// 
/// // Load a form schema
/// context.read<FormsBloc>().add(
///   FormsEvent.load(schemas: [yourSchemaJson]),
/// );
/// 
/// // Render the form
/// FormsRenderPage(
///   pageName: 'personalInfo',
///   currentSchemaKey: 'userRegistration',
/// )
/// ```
/// 
/// ## Core Components
/// 
/// - [FormsBloc]: Main BLoC for form state management
/// - [FormsRenderPage]: Main widget for rendering forms
/// - [JsonForms]: Utility class for form operations
/// - [PropertySchema]: Model for field configuration
/// - [SchemaObject]: Model for form schema
library forms_engine;

export 'json_forms.dart';
export 'models/property_schema/property_schema.dart';
export 'models/schema_object/schema_object.dart';
export 'blocs/forms/forms.dart';
