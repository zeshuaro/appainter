import 'package:appainter/text_theme/text_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appainter/home/home.dart';
import 'package:universal_io/io.dart';
import 'package:window_size/window_size.dart';

import 'app.dart';
import 'bloc_observer.dart';

void main() {
  EquatableConfig.stringify = kDebugMode;
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle("Appainter");
    setWindowMinSize(const Size(1350, 850));
    setWindowMaxSize(Size.infinite);
  }

  BlocOverrides.runZoned(
    () => runApp(MyApp(
      homeRepo: HomeRepository(),
      textThemeRepo: TextThemeRepository(),
    )),
    blocObserver: MyBlocObserver(),
  );
}
