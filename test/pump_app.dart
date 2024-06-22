import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/advanced_theme/advanced_theme.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

const _iconThemeState = IconThemeState();

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
    final AppBarActionsIconThemeCubit appBarActionsIconThemeCubit =
        MockAppBarActionsIconThemeCubit();
    final AppBarIconThemeCubit appBarIconThemeCubit =
        MockAppBarIconThemeCubit();
    final AppBarTitleTextStyleCubit appBarTitleTextStyleCubit =
        MockAppBarTitleTextStyleCubit();
    final AppBarToolbarTextStyleCubit appBarToolbarTextStyleCubit =
        MockAppBarToolbarTextStyleCubit();

    final TabBarThemeCubit tabBarThemeCubit = MockTabBarThemeCubit();
    final TabBarLabelTextStyleCubit tabBarLabelTextStyleCubit =
        MockTabBarLabelTextStyleCubit();
    final TabBarUnselectedLabelTextStyleCubit
        tabBarUnselectedLabelTextStyleCubit =
        MockTabBarUnselectedLabelTextStyleCubit();

    final BottomNavigationBarThemeCubit bottomNavigationBarThemeCubit =
        MockBottomNavigationBarThemeCubit();
    final BottomNavigationBarLabelTextStyleCubit
        bottomNavigationBarLabelTextStyleCubit =
        MockBottomNavigationBarLabelTextStyleCubit();
    final BottomNavigationBarUnselectedLabelTextStyleCubit
        bottomNavigationBarUnselectedLabelTextStyleCubit =
        MockBottomNavigationBarUnselectedLabelTextStyleCubit();

    final FloatingActionButtonThemeCubit floatingActionButtonThemeCubit =
        MockFloatingActionButtonThemeCubit();
    final ElevatedButtonThemeCubit elevatedButtonThemeCubit =
        MockElevatedButtonThemeCubit();
    final FilledButtonThemeCubit filledButtonThemeCubit =
        MockFilledButtonThemeCubit();
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

    final DisplayLargeTextStyleCubit displayLargetextStyleCubit =
        MockDisplayLargeTextStyleCubit();
    final DisplayMediumTextStyleCubit displayMediumtextStyleCubit =
        MockDisplayMediumTextStyleCubit();
    final DisplaySmallTextStyleCubit displaySmalltextStyleCubit =
        MockDisplaySmallTextStyleCubit();

    final HeadlineLargeTextStyleCubit headlineLargetextStyleCubit =
        MockHeadlineLargeTextStyleCubit();
    final HeadlineMediumTextStyleCubit headlineMediumtextStyleCubit =
        MockHeadlineMediumTextStyleCubit();
    final HeadlineSmallTextStyleCubit headlineSmalltextStyleCubit =
        MockHeadlineSmallTextStyleCubit();

    final TitleLargeTextStyleCubit titleLargetextStyleCubit =
        MockTitleLargeTextStyleCubit();
    final TitleMediumTextStyleCubit titleMediumtextStyleCubit =
        MockTitleMediumTextStyleCubit();
    final TitleSmallTextStyleCubit titleSmalltextStyleCubit =
        MockTitleSmallTextStyleCubit();

    final LabelLargeTextStyleCubit labelLargetextStyleCubit =
        MockLabelLargeTextStyleCubit();
    final LabelMediumTextStyleCubit labelMediumtextStyleCubit =
        MockLabelMediumTextStyleCubit();
    final LabelSmallTextStyleCubit labelSmalltextStyleCubit =
        MockLabelSmallTextStyleCubit();

    final BodyLargeTextStyleCubit bodyLargetextStyleCubit =
        MockBodyLargeTextStyleCubit();
    final BodyMediumTextStyleCubit bodyMediumTextStyleCubit =
        MockBodyMediumTextStyleCubit();
    final BodySmallTextStyleCubit bodySmallTextStyleCubit =
        MockBodySmallTextStyleCubit();

    final textStyle = Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .titleSmall!;
    final textStyleState = TextStyleState(style: textStyle);

    when(() => mockHomeCubit.state).thenReturn(const HomeState());
    when(() => mockBasicThemeCubit.state).thenReturn(BasicThemeState());
    when(() => mockAdvancedThemeCubit.state).thenReturn(
      const AdvancedThemeState(),
    );
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    when(() => appBarThemeCubit.state).thenReturn(const AppBarThemeState());
    when(() => appBarActionsIconThemeCubit.state).thenReturn(_iconThemeState);
    when(() => appBarIconThemeCubit.state).thenReturn(_iconThemeState);
    when(() => appBarTitleTextStyleCubit.state).thenReturn(
      TextStyleState(style: AppBarThemeCubit.defaultTitleTextStyle),
    );
    when(() => appBarToolbarTextStyleCubit.state).thenReturn(
      TextStyleState(style: AppBarThemeCubit.defaultToolbarTextStyle),
    );

    when(() => tabBarThemeCubit.state).thenReturn(const TabBarThemeState());
    when(() => tabBarLabelTextStyleCubit.state).thenReturn(
      TextStyleState(style: TabBarThemeCubit.defaultLabelTextStyle),
    );
    when(() => tabBarUnselectedLabelTextStyleCubit.state).thenReturn(
      TextStyleState(style: TabBarThemeCubit.defaultLabelTextStyle),
    );

    when(() => bottomNavigationBarThemeCubit.state).thenReturn(
      const BottomNavigationBarThemeState(),
    );
    when(() => bottomNavigationBarLabelTextStyleCubit.state).thenReturn(
      TextStyleState(
        style: BottomNavigationBarThemeCubit.defaultLabelTextStyle,
      ),
    );
    when(() {
      return bottomNavigationBarUnselectedLabelTextStyleCubit.state;
    }).thenReturn(
      TextStyleState(
        style: BottomNavigationBarThemeCubit.defaultLabelTextStyle,
      ),
    );

    when(() => floatingActionButtonThemeCubit.state).thenReturn(
      const FloatingActionButtonThemeState(),
    );
    when(() => elevatedButtonThemeCubit.state).thenReturn(
      const ButtonStyleState(),
    );
    when(() => elevatedButtonThemeCubit.defaultShape).thenReturn(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
    when(() => filledButtonThemeCubit.state).thenReturn(
      const ButtonStyleState(),
    );
    when(() => filledButtonThemeCubit.defaultShape).thenReturn(
      const StadiumBorder(),
    );
    when(() => outlinedButtonThemeCubit.state).thenReturn(
      const ButtonStyleState(),
    );
    when(() => outlinedButtonThemeCubit.defaultShape).thenReturn(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
    when(() => textButtonThemeCubit.state).thenReturn(const ButtonStyleState());
    when(() => textButtonThemeCubit.defaultShape).thenReturn(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );

    when(() => iconThemeCubit.state).thenReturn(_iconThemeState);
    when(() => inputDecorationThemeCubit.state).thenReturn(
      const InputDecorationThemeState(),
    );
    when(() => switchThemeCubit.state).thenReturn(const SwitchThemeState());
    when(() => checkboxThemeCubit.state).thenReturn(const CheckboxThemeState());
    when(() => radioThemeCubit.state).thenReturn(const RadioThemeState());
    when(() => sliderThemeCubit.state).thenReturn(const SliderThemeState());

    when(() => textThemeCubit.state).thenReturn(const TextThemeState());

    when(() => displayLargetextStyleCubit.state).thenReturn(textStyleState);
    when(() => displayMediumtextStyleCubit.state).thenReturn(textStyleState);
    when(() => displaySmalltextStyleCubit.state).thenReturn(textStyleState);

    when(() => headlineLargetextStyleCubit.state).thenReturn(textStyleState);
    when(() => headlineMediumtextStyleCubit.state).thenReturn(textStyleState);
    when(() => headlineSmalltextStyleCubit.state).thenReturn(textStyleState);

    when(() => titleLargetextStyleCubit.state).thenReturn(textStyleState);
    when(() => titleMediumtextStyleCubit.state).thenReturn(textStyleState);
    when(() => titleSmalltextStyleCubit.state).thenReturn(textStyleState);

    when(() => labelLargetextStyleCubit.state).thenReturn(textStyleState);
    when(() => labelMediumtextStyleCubit.state).thenReturn(textStyleState);
    when(() => labelSmalltextStyleCubit.state).thenReturn(textStyleState);

    when(() => bodyLargetextStyleCubit.state).thenReturn(textStyleState);
    when(() => bodyMediumTextStyleCubit.state).thenReturn(textStyleState);
    when(() => bodySmallTextStyleCubit.state).thenReturn(textStyleState);

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
            BlocProvider.value(value: appBarActionsIconThemeCubit),
            BlocProvider.value(value: appBarIconThemeCubit),
            BlocProvider.value(value: appBarTitleTextStyleCubit),
            BlocProvider.value(value: appBarToolbarTextStyleCubit),
            BlocProvider.value(value: tabBarThemeCubit),
            BlocProvider.value(value: tabBarLabelTextStyleCubit),
            BlocProvider.value(value: tabBarUnselectedLabelTextStyleCubit),
            BlocProvider.value(value: bottomNavigationBarThemeCubit),
            BlocProvider.value(value: bottomNavigationBarLabelTextStyleCubit),
            BlocProvider.value(
              value: bottomNavigationBarUnselectedLabelTextStyleCubit,
            ),
            BlocProvider.value(value: floatingActionButtonThemeCubit),
            BlocProvider.value(value: elevatedButtonThemeCubit),
            BlocProvider.value(value: filledButtonThemeCubit),
            BlocProvider.value(value: outlinedButtonThemeCubit),
            BlocProvider.value(value: textButtonThemeCubit),
            BlocProvider.value(value: iconThemeCubit),
            BlocProvider.value(value: inputDecorationThemeCubit),
            BlocProvider.value(value: switchThemeCubit),
            BlocProvider.value(value: checkboxThemeCubit),
            BlocProvider.value(value: radioThemeCubit),
            BlocProvider.value(value: sliderThemeCubit),
            BlocProvider.value(value: textThemeCubit),
            BlocProvider.value(value: displayLargetextStyleCubit),
            BlocProvider.value(value: displayMediumtextStyleCubit),
            BlocProvider.value(value: displaySmalltextStyleCubit),
            BlocProvider.value(value: headlineLargetextStyleCubit),
            BlocProvider.value(value: headlineMediumtextStyleCubit),
            BlocProvider.value(value: headlineSmalltextStyleCubit),
            BlocProvider.value(value: titleLargetextStyleCubit),
            BlocProvider.value(value: titleMediumtextStyleCubit),
            BlocProvider.value(value: titleSmalltextStyleCubit),
            BlocProvider.value(value: labelLargetextStyleCubit),
            BlocProvider.value(value: labelMediumtextStyleCubit),
            BlocProvider.value(value: labelSmalltextStyleCubit),
            BlocProvider.value(value: bodyLargetextStyleCubit),
            BlocProvider.value(value: bodyMediumTextStyleCubit),
            BlocProvider.value(value: bodySmallTextStyleCubit),
          ],
          child: MaterialApp(
            home: widget,
          ),
        ),
      ),
    );
  }
}
