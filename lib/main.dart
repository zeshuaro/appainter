import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/theme_repository/theme_repository.dart';

import 'app.dart';
import 'bloc_observer.dart';

void main() {
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = MyBlocObserver();

  runApp(MyApp(
    homeRepo: HomeRepo(),
    themeRepo: ThemeRepository(),
  ));
}
