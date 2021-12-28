import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
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
import 'package:flutter_theme/switch_theme/switch_theme.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:flutter_theme/text_button_theme/text_button_theme.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

class MockBasicThemeCubit extends MockCubit<BasicThemeState>
    implements BasicThemeCubit {}

class MockAdvancedThemeCubit extends MockCubit<AdvancedThemeState>
    implements AdvancedThemeCubit {}

class FakeHomeState extends Fake implements HomeState {}

class FakeBasicThemeState extends Fake implements BasicThemeState {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

class MockColorThemeCubit extends MockCubit<ColorThemeState>
    implements ColorThemeCubit {}

class MockAppBarThemeCubit extends MockCubit<AppBarThemeState>
    implements AppBarThemeCubit {}

class FakeAppBarThemeState extends Fake implements AppBarThemeState {}

class MockTabBarThemeCubit extends MockCubit<TabBarThemeState>
    implements TabBarThemeCubit {}

class FakeTabBarThemeState extends Fake implements TabBarThemeState {}

class MockBottomNavigationBarThemeCubit
    extends MockCubit<BottomNavigationBarThemeState>
    implements BottomNavigationBarThemeCubit {}

class FakeBottomNavigationBarThemeState extends Fake
    implements BottomNavigationBarThemeState {}

class MockFloatingActionButtonThemeCubit
    extends MockCubit<FloatingActionButtonThemeState>
    implements FloatingActionButtonThemeCubit {}

class MockElevatedButtonThemeCubit extends MockCubit<ElevatedButtonThemeState>
    implements ElevatedButtonThemeCubit {}

class MockOutlinedButtonThemeCubit extends MockCubit<OutlinedButtonThemeState>
    implements OutlinedButtonThemeCubit {}

class MockTextButtonThemeCubit extends MockCubit<TextButtonThemeState>
    implements TextButtonThemeCubit {}

class MockIconThemeCubit extends MockCubit<IconThemeState>
    implements IconThemeCubit {}

class MockInputDecorationThemeCubit extends MockCubit<InputDecorationThemeState>
    implements InputDecorationThemeCubit {}

class MockSwitchThemeCubit extends MockCubit<SwitchThemeState>
    implements SwitchThemeCubit {}

class MockCheckboxThemeCubit extends MockCubit<CheckboxThemeState>
    implements CheckboxThemeCubit {}

mixin DiagnosticableToStringMixin on Object {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

class FakeThemeData extends Fake
    with DiagnosticableToStringMixin
    implements ThemeData {}

class MockHomeRepository extends Mock implements HomeRepository {}
