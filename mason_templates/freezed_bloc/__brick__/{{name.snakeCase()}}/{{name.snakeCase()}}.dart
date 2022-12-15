// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}.freezed.dart';

typedef {{name.pascalCase()}}Emitter = Emitter<{{name.pascalCase()}}State>;

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc(super.initialState) {

  }

}

@freezed
class {{name.pascalCase()}}Event with _${{name.pascalCase()}}Event {
  const {{name.pascalCase()}}State._();
}

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const {{name.pascalCase()}}State._();
}
