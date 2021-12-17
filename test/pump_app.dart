import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    HomeCubit? homeCubit,
    BasicThemeCubit? basicThemeCubit,
    AdvancedThemeCubit? advancedThemeCubit,
    AppBarThemeCubit? appBarThemeCubit,
  }) async {
    registerFallbackValue(FakeHomeState());
    registerFallbackValue(FakeBasicThemeState());
    registerFallbackValue(FakeAdvancedThemeState());
    registerFallbackValue(FakeAppBarThemeState());

    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: homeCubit ?? MockHomeCubit()),
          BlocProvider.value(value: basicThemeCubit ?? MockBasicThemeCubit()),
          BlocProvider.value(
            value: advancedThemeCubit ?? MockAdvancedThemeCubit(),
          ),
          BlocProvider.value(value: appBarThemeCubit ?? MockAppBarThemeCubit()),
        ],
        child: MaterialApp(
          home: widget,
        ),
      ),
    );
  }
}
