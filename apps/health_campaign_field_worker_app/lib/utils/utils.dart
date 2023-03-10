library app_utils;

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import '../blocs/auth/auth.dart';
import '../blocs/project/project.dart';
import 'app_exception.dart';

export 'app_exception.dart';
export 'constants.dart';

Expression<bool> buildAnd(Iterable<Expression<bool?>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value & element);

  return result.equals(true);
}

Expression<bool> buildOr(Iterable<Expression<bool?>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value | element);

  return result.equals(true);
}

class IdGen {
  static const IdGen _instance = IdGen._internal();

  static IdGen get instance => _instance;

  /// Shorthand for [instance]
  static IdGen get i => instance;

  final Uuid uuid;

  const IdGen._internal() : uuid = const Uuid();

  String get identifier => uuid.v1();
}

extension DateAgeExtension on DateTime {
  int get age {
    return (DateTime.now().difference(this).inDays / 365).round();
  }
}

extension IntIncrementer on int? {
  int get increment {
    return _incrementBy(1);
  }

  int _incrementBy(int value) {
    return this == null ? value : (this! + value);
  }
}

extension ContextUtilityExtensions on BuildContext {
  int millisecondsSinceEpoch([DateTime? dateTime]) {
    return (dateTime ?? DateTime.now()).millisecondsSinceEpoch;
  }

  String get loggedInUserUuid {
    final authBloc = _get<AuthBloc>();
    final userRequestObject = authBloc.state.whenOrNull(
      authenticated: (accessToken, refreshToken, userModel) {
        return userModel;
      },
    );

    if (userRequestObject == null) {
      throw AppException('User not authenticated');
    }

    return userRequestObject.uuid;
  }

  String get projectId {
    final projectBloc = _get<ProjectBloc>();
    final selectedProject = projectBloc.state.whenOrNull(
      fetched: (projects, selectedProject) {
        return selectedProject;
      },
    );

    if (selectedProject == null) {
      throw AppException('Project not selected');
    }

    return selectedProject.id;
  }

  T _get<T extends BlocBase>() {
    try {
      final bloc = read<T>();

      return bloc;
    } on ProviderNotFoundException catch (_) {
      throw AppException(
        '${T.runtimeType} not found in the current context',
      );
    } catch (error) {
      throw AppException('Could not fetch ${T.runtimeType}');
    }
  }
}

extension UniqueListItem<E> on List<E> {
  void removeDuplicates<I>(I Function(E element) constraintMapper) {
    final distinctList = map(constraintMapper).toSet();

    retainWhere((element) => distinctList.remove(constraintMapper(element)));
  }
}

class CustomValidator {
  /// Validates that control's value must be `true`
  static Map<String, dynamic>? requiredMin(AbstractControl<dynamic> control) {
    return control.value == null || control.value.toString().length >= 2
        ? null
        : {'Min 2 characters Required': true};
  }
}
