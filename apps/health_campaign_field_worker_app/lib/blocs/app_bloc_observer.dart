import 'package:digit_logger/digit_logger.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (!kDebugMode) return;
    if (bloc is LocationBloc) return;

    DigitLogger.trace(
      'BLoC transition',
      category: LogCategory.state,
      context: {
        'bloc': bloc.runtimeType.toString(),
        'event': transition.event.runtimeType.toString(),
        'currentState': transition.currentState.runtimeType.toString(),
        'nextState': transition.nextState.runtimeType.toString(),
      },
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (!kDebugMode || bloc.runtimeType.toString().endsWith('Bloc')) return;

    DigitLogger.trace(
      'Cubit change',
      category: LogCategory.state,
      context: {
        'cubit': bloc.runtimeType.toString(),
        'currentState': change.currentState.runtimeType.toString(),
        'nextState': change.nextState.runtimeType.toString(),
      },
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    // Always log BLoC errors (not just in debug mode)
    DigitLogger.error(
      'BLoC error',
      category: LogCategory.state,
      error: error,
      stackTrace: stackTrace,
      context: {
        'bloc': bloc.runtimeType.toString(),
      },
    );
  }
}
