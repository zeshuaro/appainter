import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint(event?.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint(error.toString());
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint(transition.toString());
    super.onTransition(bloc, transition);
  }
}
