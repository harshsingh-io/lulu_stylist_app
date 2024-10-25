// ignore_for_file: strict_raw_type

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class SABlocObserver extends BlocObserver {
  ///We can run something, when we create our Bloc

  static const String logTag = 'SABlocObserver';

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    ///We can check, if the BlocBase is a Bloc or a Cubit
    if (bloc is Cubit) {
      log.d(
        {
          'logTag': logTag,
          'message': 'This is a Cubit ${bloc.runtimeType}  ${bloc.hashCode}',
        },
      );
    } else {
      log.d(
        {
          'logTag': logTag,
          'message': 'This is a bloc ${bloc.runtimeType}   ${bloc.hashCode}',
        },
      );
    }
  }

  ///We can react to events
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log.d(logTag, error: 'an event Happened in $bloc the event is $event');
  }

  ///We can even react to transitions
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    /// With this we can specifically know, when and what changed in our Bloc
    // ignore: lines_longer_than_80_chars
    log.d({
      'logTag': logTag,
      'message':
          'There was a transition from ${transition.currentState} to ${transition.nextState}',
    });
  }

  ///We can react to errors, and we will know the error and the StackTrace
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log.d(
      logTag,
      error:
          'Error happened in $bloc with error $error and the stacktrace is $stackTrace',
    );
  }

  ///We can even run something, when we close our Bloc
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log.d(logTag, error: 'BLOC is closed');
  }
}
