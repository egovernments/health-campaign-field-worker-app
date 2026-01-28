import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/log_category.dart';
import '../core/logger.dart';

/// BlocObserver that automatically logs all BLoC errors.
///
/// Set this as the global BLoC observer to capture all BLoC errors
/// without manual try-catch blocks:
///
/// ```dart
/// void main() {
///   Bloc.observer = DigitBlocObserver();
///   runApp(MyApp());
/// }
/// ```
///
/// All errors in any BLoC will be automatically logged with:
/// - Error level
/// - State category
/// - BLoC type in context
/// - Full stack trace
class DigitBlocObserver extends BlocObserver {
  /// Whether to log state changes (can be verbose).
  final bool logStateChanges;

  /// Whether to log events.
  final bool logEvents;

  /// Whether to log transitions.
  final bool logTransitions;

  DigitBlocObserver({
    this.logStateChanges = false,
    this.logEvents = false,
    this.logTransitions = false,
  });

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    DigitLogger.error(
      'BLoC error: ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
      category: LogCategory.state,
      context: {
        'bloc': bloc.runtimeType.toString(),
        'blocState': bloc.state.runtimeType.toString(),
      },
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    if (logStateChanges) {
      DigitLogger.debug(
        'BLoC state change: ${bloc.runtimeType}',
        category: LogCategory.state,
        context: {
          'bloc': bloc.runtimeType.toString(),
          'currentState': change.currentState.runtimeType.toString(),
          'nextState': change.nextState.runtimeType.toString(),
        },
      );
    }
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    if (logEvents) {
      DigitLogger.trace(
        'BLoC event: ${bloc.runtimeType}',
        category: LogCategory.state,
        context: {
          'bloc': bloc.runtimeType.toString(),
          'event': event.runtimeType.toString(),
        },
      );
    }
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    if (logTransitions) {
      DigitLogger.trace(
        'BLoC transition: ${bloc.runtimeType}',
        category: LogCategory.state,
        context: {
          'bloc': bloc.runtimeType.toString(),
          'event': transition.event.runtimeType.toString(),
          'currentState': transition.currentState.runtimeType.toString(),
          'nextState': transition.nextState.runtimeType.toString(),
        },
      );
    }
    super.onTransition(bloc, transition);
  }
}
