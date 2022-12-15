// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}.freezed.dart';

typedef {{name.pascalCase()}}Emitter = Emitter<{{name.pascalCase()}}State>;

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc(super.initialState) {
    {{#events}}on(_handle{{..pascalCase()}});
    {{/events}}
  }
  {{#events}}
  FutureOr<void> _handle{{..pascalCase()}}(
    {{name.pascalCase()}}{{..pascalCase()}}Event event,
    {{name.pascalCase()}}Emitter emit,
  ) async {
    // handle logic for {{..camelCase()}} here
  }
  {{/events}}
}

@freezed
class {{name.pascalCase()}}Event with _${{name.pascalCase()}}Event {
  {{^events}}const {{name.pascalCase()}}Event._();{{/events}}
  {{#events}}const {{name.pascalCase()}}Event.{{..camelCase()}}() = {{name.pascalCase()}}{{..pascalCase()}}Event;
  {{/events}}
}

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  {{^states}}const {{name.pascalCase()}}State._();{{/states}}
  {{#states}}const {{name.pascalCase()}}State.{{..camelCase()}}() = {{name.pascalCase()}}{{..pascalCase()}}State;
  {{/states}}
}