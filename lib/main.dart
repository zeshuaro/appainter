import 'package:appainter/text_theme/text_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appainter/home/home.dart';

import 'app.dart';
import 'bloc_observer.dart';

void main() {
  EquatableConfig.stringify = kDebugMode;

  BlocOverrides.runZoned(
    () => runApp(MyApp(
      homeRepo: HomeRepository(),
      textThemeRepo: TextThemeRepository(),
    )),
    blocObserver: MyBlocObserver(),
  );
}
