import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/checkbox_theme/checkbox_theme.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/icon_theme/icon_theme.dart';
import 'package:flutter_theme/input_decoration_theme/input_decoration_theme.dart';
import 'package:flutter_theme/outlined_button_theme/outlined_button_theme.dart';
import 'package:flutter_theme/radio_theme/radio_theme.dart';
import 'package:flutter_theme/switch_theme/switch_theme.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:flutter_theme/text_button_theme/text_button_theme.dart';
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
    final ColorThemeCubit colorThemeCubit = MockColorThemeCubit();
    final AppBarThemeCubit appBarThemeCubit = MockAppBarThemeCubit();
    final TabBarThemeCubit tabBarThemeCubit = MockTabBarThemeCubit();
    final BottomNavigationBarThemeCubit bottomNavigationBarThemeCubit =
        MockBottomNavigationBarThemeCubit();
    final FloatingActionButtonThemeCubit floatingActionButtonThemeCubit =
        MockFloatingActionButtonThemeCubit();
    final ElevatedButtonThemeCubit elevatedButtonThemeCubit =
        MockElevatedButtonThemeCubit();
    final OutlinedButtonThemeCubit outlinedButtonThemeCubit =
        MockOutlinedButtonThemeCubit();
    final TextButtonThemeCubit textButtonThemeCubit =
        MockTextButtonThemeCubit();
    final IconThemeCubit iconThemeCubit = MockIconThemeCubit();
    final InputDecorationThemeCubit inputDecorationThemeCubit =
        MockInputDecorationThemeCubit();
    final SwitchThemeCubit switchThemeCubit = MockSwitchThemeCubit();
    final CheckboxThemeCubit checkboxThemeCubit = MockCheckboxThemeCubit();
    final RadioThemeCubit radioThemeCubit = MockRadioThemeCubit();

    when(() => mockHomeCubit.state).thenReturn(const HomeState());
    when(() => mockBasicThemeCubit.state).thenReturn(BasicThemeState());
    when(() => mockAdvancedThemeCubit.state).thenReturn(AdvancedThemeState());
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
    when(() => appBarThemeCubit.state).thenReturn(const AppBarThemeState());
    when(() => tabBarThemeCubit.state).thenReturn(const TabBarThemeState());
    when(() => bottomNavigationBarThemeCubit.state).thenReturn(
      const BottomNavigationBarThemeState(),
    );
    when(() => floatingActionButtonThemeCubit.state).thenReturn(
      const FloatingActionButtonThemeState(),
    );
    when(() => elevatedButtonThemeCubit.state).thenReturn(
      const ElevatedButtonThemeState(),
    );
    when(() => outlinedButtonThemeCubit.state).thenReturn(
      const OutlinedButtonThemeState(),
    );
    when(() => textButtonThemeCubit.state).thenReturn(
      const TextButtonThemeState(),
    );
    when(() => iconThemeCubit.state).thenReturn(const IconThemeState());
    when(() => inputDecorationThemeCubit.state).thenReturn(
      const InputDecorationThemeState(),
    );
    when(() => switchThemeCubit.state).thenReturn(const SwitchThemeState());
    when(() => checkboxThemeCubit.state).thenReturn(const CheckboxThemeState());
    when(() => radioThemeCubit.state).thenReturn(const RadioThemeState());

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
            BlocProvider.value(value: colorThemeCubit),
            BlocProvider.value(value: appBarThemeCubit),
            BlocProvider.value(value: tabBarThemeCubit),
            BlocProvider.value(value: bottomNavigationBarThemeCubit),
            BlocProvider.value(value: floatingActionButtonThemeCubit),
            BlocProvider.value(value: elevatedButtonThemeCubit),
            BlocProvider.value(value: outlinedButtonThemeCubit),
            BlocProvider.value(value: textButtonThemeCubit),
            BlocProvider.value(value: iconThemeCubit),
            BlocProvider.value(value: inputDecorationThemeCubit),
            BlocProvider.value(value: switchThemeCubit),
            BlocProvider.value(value: checkboxThemeCubit),
            BlocProvider.value(value: radioThemeCubit),
          ],
          child: MaterialApp(
            home: widget,
          ),
        ),
      ),
    );
  }
}
