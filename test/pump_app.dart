import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
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
    AppBarThemeCubit? appBarThemeCubit,
    TabBarThemeCubit? tabBarThemeCubit,
    BottomNavigationBarThemeCubit? bottomNavigationBarThemeCubit,
  }) async {
    registerFallbackValue(FakeHomeState());
    registerFallbackValue(FakeBasicThemeState());
    registerFallbackValue(FakeAdvancedThemeState());
    registerFallbackValue(FakeAppBarThemeState());
    registerFallbackValue(FakeTabBarThemeState());
    registerFallbackValue(FakeBottomNavigationBarThemeState());

    final mockHomeCubit = MockHomeCubit();
    final mockBasicThemeCubit = MockBasicThemeCubit();
    final mockAdvancedThemeCubit = MockAdvancedThemeCubit();
    final mockAppBarThemeCubit = MockAppBarThemeCubit();
    final mockTabBarThemeCubit = MockTabBarThemeCubit();
    final mockBottomNavBarThemeCubit = MockBottomNavigationBarThemeCubit();

    when(() => mockHomeCubit.state).thenReturn(const HomeState());
    when(() => mockBasicThemeCubit.state).thenReturn(BasicThemeState());
    when(() => mockAdvancedThemeCubit.state).thenReturn(AdvancedThemeState());
    when(() => mockAppBarThemeCubit.state).thenReturn(const AppBarThemeState());
    when(() => mockTabBarThemeCubit.state).thenReturn(const TabBarThemeState());
    when(() {
      return mockBottomNavBarThemeCubit.state;
    }).thenReturn(const BottomNavigationBarThemeState());

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
            BlocProvider.value(
              value: appBarThemeCubit ?? mockAppBarThemeCubit,
            ),
            BlocProvider.value(
              value: tabBarThemeCubit ?? mockTabBarThemeCubit,
            ),
            BlocProvider.value(
              value:
                  bottomNavigationBarThemeCubit ?? mockBottomNavBarThemeCubit,
            ),
          ],
          child: MaterialApp(
            home: widget,
          ),
        ),
      ),
    );
  }
}
