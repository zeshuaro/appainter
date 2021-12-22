import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    HomeRepository? homeRepo,
    HomeCubit? homeCubit,
    BasicThemeCubit? basicThemeCubit,
    AdvancedThemeCubit? advancedThemeCubit,
  }) async {
    final mockHomeCubit = MockHomeCubit();
    final mockBasicThemeCubit = MockBasicThemeCubit();
    final mockAdvancedThemeCubit = MockAdvancedThemeCubit();
    final AppBarThemeCubit appBarThemeCubit = MockAppBarThemeCubit();
    final TabBarThemeCubit tabBarThemeCubit = MockTabBarThemeCubit();
    final BottomNavigationBarThemeCubit bottomNavigationBarThemeCubit =
        MockBottomNavigationBarThemeCubit();
    final FloatingActionButtonThemeCubit floatingActionButtonThemeCubit =
        MockFloatingActionButtonThemeCubit();
    final ElevatedButtonThemeCubit elevatedButtonThemeCubit =
        MockElevatedButtonThemeCubit();

    when(() => mockHomeCubit.state).thenReturn(const HomeState());
    when(() => mockBasicThemeCubit.state).thenReturn(BasicThemeState());
    when(() => mockAdvancedThemeCubit.state).thenReturn(AdvancedThemeState());
    when(() => appBarThemeCubit.state).thenReturn(const AppBarThemeState());
    when(() => tabBarThemeCubit.state).thenReturn(const TabBarThemeState());
    when(() {
      return bottomNavigationBarThemeCubit.state;
    }).thenReturn(const BottomNavigationBarThemeState());
    when(() {
      return floatingActionButtonThemeCubit.state;
    }).thenReturn(const FloatingActionButtonThemeState());
    when(() {
      return elevatedButtonThemeCubit.state;
    }).thenReturn(const ElevatedButtonThemeState());

    return pumpWidget(
      RepositoryProvider(
        create: (context) => homeRepo ?? MockHomeRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: homeCubit ?? mockHomeCubit),
            BlocProvider.value(value: basicThemeCubit ?? mockBasicThemeCubit),
            BlocProvider.value(
              value: advancedThemeCubit ?? mockAdvancedThemeCubit,
            ),
            BlocProvider.value(value: appBarThemeCubit),
            BlocProvider.value(value: tabBarThemeCubit),
            BlocProvider.value(value: bottomNavigationBarThemeCubit),
            BlocProvider.value(value: floatingActionButtonThemeCubit),
            BlocProvider.value(value: elevatedButtonThemeCubit),
          ],
          child: MaterialApp(
            home: widget,
          ),
        ),
      ),
    );
  }
}
