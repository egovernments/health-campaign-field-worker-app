/// Barrel file for backward compatibility.
/// All public symbols are re-exported from their specialized modules.
///
/// Module responsibilities:
/// - [entity_field_accessor] - Entity field access with caching
/// - [value_resolver] - Path-based value resolution (IValueResolver interface)
/// - [entity_grouper] - Entity grouping by type or custom field
/// - [entity_filter] - Entity filtering and relation matching
/// - [field_evaluator] - Field evaluation pipeline (from/where/select/map)
/// - [field_transformations] - Date/type utilities and context flattening
/// - [condition_evaluator] - If-then-else and comparison operators
/// - [computed_evaluator] - Reduce operations (max, min)
/// - [computed_list_evaluator] - Computed list evaluation with formula parsing
/// - [computed_field_processor] - Computed field orchestration
/// - [computed_list_processor] - Computed list orchestration
/// - [wrapper_builder] - Main WrapperBuilder orchestrator

export 'wrapper/entity_field_accessor.dart';
export 'wrapper/value_resolver.dart';
export 'wrapper/entity_grouper.dart';
export 'wrapper/entity_filter.dart';
export 'wrapper/field_evaluator.dart';
export 'wrapper/field_transformations.dart';
export 'wrapper/computed_field_processor.dart';
export 'wrapper/computed_list_processor.dart';
export 'wrapper/condition_evaluator.dart';
export 'wrapper/computed_evaluator.dart';
export 'wrapper/computed_list_evaluator.dart';
export 'wrapper/wrapper_builder.dart';
