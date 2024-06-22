import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/analytics/analytics.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/checkbox_theme/checkbox_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:appainter/home/home.dart';
import 'package:appainter/icon_theme/icon_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/slider_theme/slider_theme.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
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

class MockAppBarToolbarTextStyleCubit extends MockCubit<TextStyleState>
    implements AppBarToolbarTextStyleCubit {}

class FakeAppBarThemeState extends Fake implements AppBarThemeState {}

class MockTabBarThemeCubit extends MockCubit<TabBarThemeState>
    implements TabBarThemeCubit {}

class FakeTabBarThemeState extends Fake implements TabBarThemeState {}

class MockTabBarLabelTextStyleCubit extends MockCubit<TextStyleState>
    implements TabBarLabelTextStyleCubit {}

class MockTabBarUnselectedLabelTextStyleCubit extends MockCubit<TextStyleState>
    implements TabBarUnselectedLabelTextStyleCubit {}

class MockBottomNavigationBarThemeCubit
    extends MockCubit<BottomNavigationBarThemeState>
    implements BottomNavigationBarThemeCubit {}

class FakeBottomNavigationBarThemeState extends Fake
    implements BottomNavigationBarThemeState {}

class MockBottomNavigationBarLabelTextStyleCubit
    extends MockCubit<TextStyleState>
    implements BottomNavigationBarLabelTextStyleCubit {}

class MockBottomNavigationBarUnselectedLabelTextStyleCubit
    extends MockCubit<TextStyleState>
    implements BottomNavigationBarUnselectedLabelTextStyleCubit {}

class MockFloatingActionButtonThemeCubit
    extends MockCubit<FloatingActionButtonThemeState>
    implements FloatingActionButtonThemeCubit {}

class MockElevatedButtonThemeCubit extends MockCubit<ButtonStyleState>
    implements ElevatedButtonThemeCubit {}

class MockFilledButtonThemeCubit extends MockCubit<ButtonStyleState>
    implements FilledButtonThemeCubit {}

class MockOutlinedButtonThemeCubit extends MockCubit<ButtonStyleState>
    implements OutlinedButtonThemeCubit {}

class MockTextButtonThemeCubit extends MockCubit<ButtonStyleState>
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

class MockDisplayLargeTextStyleCubit extends MockCubit<TextStyleState>
    implements DisplayLargeTextStyleCubit {}

class MockDisplayMediumTextStyleCubit extends MockCubit<TextStyleState>
    implements DisplayMediumTextStyleCubit {}

class MockDisplaySmallTextStyleCubit extends MockCubit<TextStyleState>
    implements DisplaySmallTextStyleCubit {}

class MockHeadlineLargeTextStyleCubit extends MockCubit<TextStyleState>
    implements HeadlineLargeTextStyleCubit {}

class MockHeadlineMediumTextStyleCubit extends MockCubit<TextStyleState>
    implements HeadlineMediumTextStyleCubit {}

class MockHeadlineSmallTextStyleCubit extends MockCubit<TextStyleState>
    implements HeadlineSmallTextStyleCubit {}

class MockTitleLargeTextStyleCubit extends MockCubit<TextStyleState>
    implements TitleLargeTextStyleCubit {}

class MockTitleMediumTextStyleCubit extends MockCubit<TextStyleState>
    implements TitleMediumTextStyleCubit {}

class MockTitleSmallTextStyleCubit extends MockCubit<TextStyleState>
    implements TitleSmallTextStyleCubit {}

class MockLabelLargeTextStyleCubit extends MockCubit<TextStyleState>
    implements LabelLargeTextStyleCubit {}

class MockLabelMediumTextStyleCubit extends MockCubit<TextStyleState>
    implements LabelMediumTextStyleCubit {}

class MockLabelSmallTextStyleCubit extends MockCubit<TextStyleState>
    implements LabelSmallTextStyleCubit {}

class MockBodyLargeTextStyleCubit extends MockCubit<TextStyleState>
    implements BodyLargeTextStyleCubit {}

class MockBodyMediumTextStyleCubit extends MockCubit<TextStyleState>
    implements BodyMediumTextStyleCubit {}

class MockBodySmallTextStyleCubit extends MockCubit<TextStyleState>
    implements BodySmallTextStyleCubit {}

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

class MockAnalyticsRepository extends Mock implements AnalyticsRepositoryImpl {}
