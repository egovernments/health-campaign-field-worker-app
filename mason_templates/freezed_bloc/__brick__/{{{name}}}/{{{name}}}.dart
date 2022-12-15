import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{{name}}}.freezed.dart';
// Uncomment the following line if the Bloc needs to handle JSON Serialization
// part '{{{name}}}.g.dart';


typedef {{name.pascalCase()}}Emitter = Emitter<{{name.pascalCase()}}State>;

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc(super.initialState) {

  }

}

@freezed
class {{name.pascalCase()}}Event with _${{name.pascalCase()}}Event {
  const {{name.pascalCase()}}._();
  // const factory AuthEvent.login({
  //   required String userId,
  //   required String password,
  // }) = AuthLoginEvent;
  //
  // const factory AuthEvent.logout() = AuthLogoutEvent;
}

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const {{name.pascalCase()}}State._();

  // const factory AuthState({
  //   @Default(false) bool initialized,
  //   @Default(false) bool loading,
  //   String? accessToken,
  //   String? refreshToken,
  // }) = _AuthState;
  //
  // bool get isAuthenticated => accessToken == null ? false : true;
}
