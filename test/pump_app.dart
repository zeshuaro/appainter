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
import 'package:flutter_theme/slider_theme/slider_theme.dart';
import 'package:flutter_theme/switch_theme/switch_theme.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:flutter_theme/text_button_theme/text_button_theme.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';
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
    final SliderThemeCubit sliderThemeCubit = MockSliderThemeCubit();
    final TextThemeCubit textThemeCubit = MockTextThemeCubit();

    final Headline1TextStyleCubit headline1textStyleCubit =
        MockHeadline1TextStyleCubit();
    final Headline2TextStyleCubit headline2textStyleCubit =
        MockHeadline2TextStyleCubit();
    final Headline3TextStyleCubit headline3textStyleCubit =
        MockHeadline3TextStyleCubit();
    final Headline4TextStyleCubit headline4textStyleCubit =
        MockHeadline4TextStyleCubit();
    final Headline5TextStyleCubit headline5textStyleCubit =
        MockHeadline5TextStyleCubit();
    final Headline6TextStyleCubit headline6textStyleCubit =
        MockHeadline6TextStyleCubit();

    final Subtitle1TextStyleCubit subtitle1textStyleCubit =
        MockSubtitle1TextStyleCubit();
    final Subtitle2TextStyleCubit subtitle2textStyleCubit =
        MockSubtitle2TextStyleCubit();
    final BodyText1TextStyleCubit bodyText1textStyleCubit =
        MockBodyText1TextStyleCubit();
    final BodyText2TextStyleCubit bodyText2textStyleCubit =
        MockBodyText2TextStyleCubit();

    final ButtonTextStyleCubit buttontextStyleCubit =
        MockButtonTextStyleCubit();
    final CaptionTextStyleCubit captiontextStyleCubit =
        MockCaptionTextStyleCubit();
    final OverlineTextStyleCubit overlinetextStyleCubit =
        MockOverlineTextStyleCubit();

    final textStyle = Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .bodyText1!;
    final textStyleState = TextStyleState(style: textStyle);

    when(() => mockHomeCubit.state).thenReturn(const HomeState());
    when(() => mockBasicThemeCubit.state).thenReturn(const BasicThemeState());
    when(() => mockAdvancedThemeCubit.state).thenReturn(
      const AdvancedThemeState(),
    );
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
    when(() => sliderThemeCubit.state).thenReturn(const SliderThemeState());

    when(() => textThemeCubit.state).thenReturn(const TextThemeState());

    when(() => headline1textStyleCubit.state).thenReturn(textStyleState);
    when(() => headline2textStyleCubit.state).thenReturn(textStyleState);
    when(() => headline3textStyleCubit.state).thenReturn(textStyleState);
    when(() => headline4textStyleCubit.state).thenReturn(textStyleState);
    when(() => headline5textStyleCubit.state).thenReturn(textStyleState);
    when(() => headline6textStyleCubit.state).thenReturn(textStyleState);

    when(() => subtitle1textStyleCubit.state).thenReturn(textStyleState);
    when(() => subtitle2textStyleCubit.state).thenReturn(textStyleState);
    when(() => bodyText1textStyleCubit.state).thenReturn(textStyleState);
    when(() => bodyText2textStyleCubit.state).thenReturn(textStyleState);

    when(() => buttontextStyleCubit.state).thenReturn(textStyleState);
    when(() => captiontextStyleCubit.state).thenReturn(textStyleState);
    when(() => overlinetextStyleCubit.state).thenReturn(textStyleState);

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
            BlocProvider.value(value: sliderThemeCubit),
            BlocProvider.value(value: textThemeCubit),
            BlocProvider.value(value: headline1textStyleCubit),
            BlocProvider.value(value: headline2textStyleCubit),
            BlocProvider.value(value: headline3textStyleCubit),
            BlocProvider.value(value: headline4textStyleCubit),
            BlocProvider.value(value: headline5textStyleCubit),
            BlocProvider.value(value: headline6textStyleCubit),
            BlocProvider.value(value: subtitle1textStyleCubit),
            BlocProvider.value(value: subtitle2textStyleCubit),
            BlocProvider.value(value: bodyText1textStyleCubit),
            BlocProvider.value(value: bodyText2textStyleCubit),
            BlocProvider.value(value: buttontextStyleCubit),
            BlocProvider.value(value: captiontextStyleCubit),
            BlocProvider.value(value: overlinetextStyleCubit),
          ],
          child: MaterialApp(
            home: widget,
          ),
        ),
      ),
    );
  }
}
