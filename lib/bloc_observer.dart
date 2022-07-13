import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      print(event);
    }
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print(error.toString());
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print(change.toString());
    }
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      print(transition.toString());
    }
    super.onTransition(bloc, transition);
  }
}
