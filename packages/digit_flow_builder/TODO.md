# DIGIT Flow Builder - TODO & Enhancement Plan

## 🚀 Quick Summary
This document outlines refactoring opportunities, enhancements, and technical debt items for the DIGIT Flow Builder package. The suggestions are organized by priority and impact to help guide development efforts.

---

## 🔥 Critical Issues (P0)

### 1. **State Management Memory Leaks** 
**File**: `lib/blocs/flow_crud_bloc.dart:72-76`
- **Issue**: StateRegistry never disposes ValueNotifiers, causing memory leaks
- **Impact**: Performance degradation, potential OOM in long-running apps
- **Solution**: 
  ```dart
  void dispose(String key) {
    final notifier = _map.remove(key);
    notifier?.dispose();
  }
  ```

### 2. **Widget Registry Error Handling**
**File**: `lib/widget_registry.dart:67`
- **Issue**: Returns plain Text widget for unknown formats - confusing for developers
- **Impact**: Poor developer experience, hard debugging
- **Solution**: 
  ```dart
  if (builder != null) {
    return builder(json, context, onAction);
  }
  assert(false, 'No widget builder registered for format: $format');
  return ErrorWidget.withDetails(
    message: 'Unknown widget format: $format',
    library: 'digit_flow_builder',
  );
  ```

### 3. **Action Handler Error Propagation**
**File**: `lib/action_handler/action_handler.dart:100+`
- **Issue**: Incomplete action handler switch cases, missing error handling
- **Impact**: Silent failures, undefined behavior
- **Solution**: Add comprehensive error handling and fallthrough case

---

## 🎯 High Priority (P1)

### 4. **Type Safety Improvements**

#### 4.1 Action Config Validation
**File**: `lib/action_handler/action_config.dart`
- **Current**: Dynamic maps with runtime checks
- **Proposed**: Sealed classes with compile-time safety
```dart
sealed class ActionConfig {
  const ActionConfig();
}

class NavigationAction extends ActionConfig {
  final String type;
  final String name;
  final List<Map<String, dynamic>>? data;
  
  const NavigationAction({
    required this.type,
    required this.name, 
    this.data,
  });
}

class SearchAction extends ActionConfig {
  final String name;
  final List<SearchCriteria> data;
  
  const SearchAction({required this.name, required this.data});
}
```

#### 4.2 Widget Configuration Validation
**File**: `lib/widget_registry.dart:70+`
- **Current**: No validation of required properties
- **Proposed**: Schema validation for widget configs
```dart
abstract class WidgetConfig {
  Map<String, dynamic> validate(Map<String, dynamic> json);
}

class ButtonConfig extends WidgetConfig {
  static const requiredFields = ['label'];
  static const optionalFields = ['properties', 'onAction'];
}
```

### 5. **Performance Optimizations**

#### 5.1 Widget Registry Caching
**File**: `lib/widget_registry.dart:57-68`
- **Issue**: Widget builders recreated on every build
- **Solution**: Cache built widgets for static configurations
```dart
static final Map<String, Widget> _widgetCache = {};

static Widget buildCached(Map<String, dynamic> json, BuildContext context) {
  final key = json.hashCode.toString();
  return _widgetCache.putIfAbsent(key, () => build(json, context, onAction));
}
```

#### 5.2 State Registry Optimization
**File**: `lib/blocs/flow_crud_bloc.dart:54-57`
- **Issue**: ValueNotifier fires on every update even if state unchanged
- **Solution**: Implement value equality checks
```dart
void update(String key, FlowCrudState state) {
  final notifier = _map.putIfAbsent(key, () => ValueNotifier<FlowCrudState?>(null));
  if (notifier.value != state) {  // Add equality check
    notifier.value = state;
  }
}
```

### 6. **Interpolation Engine Improvements**

#### 6.1 Expression Parser Enhancement
**File**: `lib/utils/interpolation.dart`
- **Current**: Basic regex-based parsing
- **Proposed**: AST-based expression parser with:
  - Nested object access: `{{ context.user.profile.name }}`
  - Array indexing: `{{ context.items[0].title }}`
  - Function calls: `{{ context.date | format('yyyy-MM-dd') }}`
  - Conditional expressions: `{{ context.status == 'active' ? 'Enabled' : 'Disabled' }}`

#### 6.2 Performance Caching
- **Issue**: Re-parsing expressions on every render
- **Solution**: Expression compilation cache
```dart
static final Map<String, CompiledExpression> _expressionCache = {};

String interpolate(String template, CrudStateData data) {
  final expression = _expressionCache.putIfAbsent(
    template, 
    () => compileExpression(template)
  );
  return expression.evaluate(data);
}
```

---

## 🛠️ Medium Priority (P2)

### 7. **Architecture Improvements**

#### 7.1 Dependency Injection
**File**: Multiple files
- **Issue**: Hard dependencies, difficult testing
- **Solution**: Implement service locator pattern
```dart
abstract class FlowBuilderServices {
  ActionHandler get actionHandler;
  WidgetRegistry get widgetRegistry;
  NavigationService get navigationService;
}

class FlowBuilderServicesImpl implements FlowBuilderServices {
  @override
  final ActionHandler actionHandler = ActionHandlerImpl();
  // ... other services
}
```

#### 7.2 Plugin Architecture
**File**: `lib/widget_registry.dart`
- **Proposed**: Plugin system for extending functionality
```dart
abstract class FlowBuilderPlugin {
  void initialize(FlowBuilderContext context);
  List<WidgetBuilder> get widgets;
  List<ActionHandler> get actionHandlers;
}

class CustomWidgetPlugin implements FlowBuilderPlugin {
  @override
  void initialize(FlowBuilderContext context) {
    context.widgetRegistry.registerBatch(widgets);
    context.actionRegistry.registerBatch(actionHandlers);
  }
}
```

### 8. **Developer Experience**

#### 8.1 Configuration Validation
**File**: New - `lib/validation/config_validator.dart`
- **Proposed**: JSON schema validation for configurations
```dart
class ConfigValidator {
  static ValidationResult validate(Map<String, dynamic> config) {
    final errors = <String>[];
    
    // Validate required fields
    if (config['screenType'] == null) {
      errors.add('screenType is required');
    }
    
    // Validate widget references
    if (config['body'] != null) {
      _validateWidgets(config['body'], errors);
    }
    
    return ValidationResult(isValid: errors.isEmpty, errors: errors);
  }
}
```

#### 8.2 Debug Tools
**File**: New - `lib/debug/flow_debug_panel.dart`
- **Proposed**: Debug overlay showing:
  - Current state data
  - Active interpolations
  - Action execution history
  - Performance metrics

### 9. **Testing Infrastructure**

#### 9.1 Widget Testing Utilities
**File**: New - `test/helpers/flow_test_utils.dart`
```dart
class FlowTestUtils {
  static Widget buildTestScreen(Map<String, dynamic> config) {
    return MaterialApp(
      home: BlocProvider<CrudBloc>(
        create: (_) => MockCrudBloc(),
        child: ScreenBuilder(config: config),
      ),
    );
  }
  
  static void mockStateData(String screenKey, CrudStateData data) {
    FlowCrudStateRegistry().update(screenKey, FlowCrudState(stateWrapper: data));
  }
}
```

#### 9.2 Action Testing Framework
```dart
class ActionTester {
  static Future<ActionResult> executeAction(
    ActionConfig action,
    Map<String, dynamic> context,
  ) async {
    final handler = TestActionHandler();
    return handler.execute(action, context);
  }
}
```

---

## 📈 Low Priority (P3)

### 10. **Feature Enhancements**

#### 10.1 Animation System
**File**: New - `lib/animations/`
- **Proposed**: Built-in animation support for transitions
```dart
{
  "format": "card",
  "animation": {
    "type": "slideIn",
    "duration": 300,
    "curve": "easeInOut"
  }
}
```

#### 10.2 Conditional Rendering
**File**: `lib/widget_registry.dart`
- **Enhanced**: More sophisticated conditional logic
```dart
{
  "format": "text",
  "visible": {
    "if": "{{ context.user.role == 'admin' }}",
    "then": true,
    "else": false
  }
}
```

#### 10.3 Theme System
**File**: New - `lib/theming/`
- **Proposed**: Dynamic theming support
```dart
{
  "format": "button",
  "theme": {
    "primary": "brand.primary",
    "textColor": "brand.onPrimary"
  }
}
```

### 11. **Documentation & Tooling**

#### 11.1 Configuration Generator
- **Tool**: CLI tool to generate type-safe config classes from JSON
- **Usage**: `flow_builder generate --input config.json --output config.dart`

#### 11.2 Visual Editor
- **Tool**: Web-based visual editor for creating configurations
- **Features**: Drag-drop interface, live preview, validation

#### 11.3 Migration Tools
- **Tool**: Automated migration between configuration versions
- **Usage**: `flow_builder migrate --from v1 --to v2 config.json`

---

## 🔧 Technical Debt

### 12. **Code Organization**

#### 12.1 File Structure Improvement
```
lib/
├── core/
│   ├── registry/
│   ├── state/
│   └── config/
├── widgets/
│   ├── built_in/
│   └── registry.dart
├── actions/
│   ├── handlers/
│   ├── types/
│   └── registry.dart
├── rendering/
│   ├── form/
│   └── template/
└── utils/
    ├── interpolation/
    ├── validation/
    └── debug/
```

#### 12.2 Barrel Exports Cleanup
**File**: `lib/flow_builder.dart`
- **Issue**: Exports too many internal classes
- **Solution**: Create separate public API file

### 13. **Documentation**

#### 13.1 API Documentation
- **Missing**: Comprehensive dartdoc comments
- **Needed**: Usage examples in all public APIs

#### 13.2 Migration Guide
- **Missing**: Breaking changes and migration paths
- **Needed**: Version compatibility matrix

---

## 📊 Implementation Roadmap

### Phase 1 (Critical - 2 weeks)
1. Fix memory leaks in StateRegistry
2. Improve error handling in WidgetRegistry
3. Complete ActionHandler implementation

### Phase 2 (High Priority - 4 weeks)
1. Implement type-safe action configs
2. Add widget configuration validation
3. Optimize state management performance

### Phase 3 (Medium Priority - 6 weeks)
1. Implement dependency injection
2. Add configuration validation
3. Create debug tools

### Phase 4 (Enhancement - 8 weeks)
1. Add animation system
2. Implement visual editor
3. Create migration tools

---

## 🧪 Testing Strategy

### Unit Tests
- [ ] Widget registry builder functions
- [ ] Interpolation engine expressions  
- [ ] Action handler execution paths
- [ ] State management lifecycle

### Integration Tests
- [ ] Form submission flows
- [ ] Template rendering with state
- [ ] Navigation between screens
- [ ] Error handling scenarios

### Performance Tests
- [ ] Memory usage with multiple screens
- [ ] Widget rendering performance
- [ ] State update frequency
- [ ] Large dataset handling

---

## 📝 Contributing Guidelines

### Code Standards
1. **Type Safety**: Prefer compile-time checks over runtime
2. **Immutability**: Use immutable data structures where possible
3. **Error Handling**: Explicit error types and handling
4. **Testing**: 100% coverage for public APIs
5. **Documentation**: Comprehensive dartdoc comments

### Review Checklist
- [ ] Memory leaks addressed
- [ ] Error handling implemented
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] Performance impact assessed
- [ ] Breaking changes documented

---

## 🎯 Success Metrics

### Performance
- Memory usage < 50MB for typical configurations
- Widget render time < 16ms for smooth 60fps
- State update frequency < 100ms response time

### Developer Experience
- Configuration validation catches 95% of errors
- Debug tools reduce debugging time by 50%
- API documentation rated >4.5/5 by developers

### Reliability  
- Zero memory leaks in production
- <0.1% error rate in action execution
- 99.9% uptime for state management

---

*Last Updated: 2025-08-19*
*Author: Claude Code Assistant*
*Version: 1.0.0*