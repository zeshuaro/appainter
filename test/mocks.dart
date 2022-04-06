import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/checkbox_theme/checkbox_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/elevated_button_theme/elevated_button_theme.dart';
import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:appainter/home/home.dart';
import 'package:appainter/icon_theme/icon_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/outlined_button_theme/outlined_button_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/slider_theme/slider_theme.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:appainter/text_button_theme/text_button_theme.dart';
import 'package:appainter/text_theme/text_theme.dart';
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

class MockAppBarActionsIconThemeCubit extends MockCubit<IconThemeState>
    implements AppBarActionsIconThemeCubit {}

class MockAppBarIconThemeCubit extends MockCubit<IconThemeState>
    implements AppBarIconThemeCubit {}

class MockAppBarTitleTextStyleCubit extends MockCubit<TextStyleState>
    implements AppBarTitleTextStyleCubit {}

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

class MockRadioThemeCubit extends MockCubit<RadioThemeState>
    implements RadioThemeCubit {}

class MockSliderThemeCubit extends MockCubit<SliderThemeState>
    implements SliderThemeCubit {}

class MockTextThemeCubit extends MockCubit<TextThemeState>
    implements TextThemeCubit {}

class MockHeadline1TextStyleCubit extends MockCubit<TextStyleState>
    implements Headline1TextStyleCubit {}

class MockHeadline2TextStyleCubit extends MockCubit<TextStyleState>
    implements Headline2TextStyleCubit {}

class MockHeadline3TextStyleCubit extends MockCubit<TextStyleState>
    implements Headline3TextStyleCubit {}

class MockHeadline4TextStyleCubit extends MockCubit<TextStyleState>
    implements Headline4TextStyleCubit {}

class MockHeadline5TextStyleCubit extends MockCubit<TextStyleState>
    implements Headline5TextStyleCubit {}

class MockHeadline6TextStyleCubit extends MockCubit<TextStyleState>
    implements Headline6TextStyleCubit {}

class MockSubtitle1TextStyleCubit extends MockCubit<TextStyleState>
    implements Subtitle1TextStyleCubit {}

class MockSubtitle2TextStyleCubit extends MockCubit<TextStyleState>
    implements Subtitle2TextStyleCubit {}

class MockBodyText1TextStyleCubit extends MockCubit<TextStyleState>
    implements BodyText1TextStyleCubit {}

class MockBodyText2TextStyleCubit extends MockCubit<TextStyleState>
    implements BodyText2TextStyleCubit {}

class MockButtonTextStyleCubit extends MockCubit<TextStyleState>
    implements ButtonTextStyleCubit {}

class MockCaptionTextStyleCubit extends MockCubit<TextStyleState>
    implements CaptionTextStyleCubit {}

class MockOverlineTextStyleCubit extends MockCubit<TextStyleState>
    implements OverlineTextStyleCubit {}

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
