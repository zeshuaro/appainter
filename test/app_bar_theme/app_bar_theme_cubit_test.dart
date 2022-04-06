import 'dart:math';

import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:appainter/abstract_text_style/cubit/abstract_text_style_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/models/models.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late AppBarThemeCubit themeCubit;
  late AppBarActionsIconThemeCubit actionsIconThemeCubit;
  late AppBarIconThemeCubit iconThemeCubit;
  late AppBarTitleTextStyleCubit titleTextStyleCubit;

  late AppBarTheme theme;
  late IconThemeData iconTheme;
  late TextStyle textStyle;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    actionsIconThemeCubit = AppBarActionsIconThemeCubit();
    iconThemeCubit = AppBarIconThemeCubit();
    titleTextStyleCubit = AppBarTitleTextStyleCubit();
    themeCubit = AppBarThemeCubit(
      actionsIconThemeCubit: actionsIconThemeCubit,
      iconThemeCubit: iconThemeCubit,
      titleTextStyleCubit: titleTextStyleCubit,
    );

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();
  });

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).appBarTheme;
    },
    build: () => themeCubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [
      AppBarThemeState(theme: theme),
      AppBarThemeState(
        theme: theme.copyWith(actionsIconTheme: kAppBarIconTheme),
      ),
      AppBarThemeState(
        theme: theme.copyWith(
          actionsIconTheme: kAppBarIconTheme,
          iconTheme: kAppBarIconTheme,
        ),
      ),
      AppBarThemeState(
        theme: theme.copyWith(
          actionsIconTheme: kAppBarIconTheme,
          iconTheme: kAppBarIconTheme,
          titleTextStyle: kAppBarTitleTextStyle,
        ),
      ),
    ],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits background color',
    build: () => themeCubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    expect: () => [
      AppBarThemeState(theme: AppBarTheme(backgroundColor: color)),
    ],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits foreground color',
    build: () => themeCubit,
    act: (cubit) => cubit.foregroundColorChanged(color),
    expect: () => [
      AppBarThemeState(theme: AppBarTheme(foregroundColor: color)),
    ],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits elevation',
    build: () => themeCubit,
    act: (cubit) => cubit.elevationChanged(doubleStr),
    expect: () => [AppBarThemeState(theme: AppBarTheme(elevation: doubleNum))],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits shadow color',
    build: () => themeCubit,
    act: (cubit) => cubit.shadowColorChanged(color),
    expect: () => [AppBarThemeState(theme: AppBarTheme(shadowColor: color))],
  );

  group('test center title', () {
    for (var isCenter in [true, false]) {
      blocTest<AppBarThemeCubit, AppBarThemeState>(
        'emits $isCenter',
        build: () => themeCubit,
        act: (cubit) => cubit.centerTitleChanged(isCenter),
        expect: () => [
          AppBarThemeState(theme: AppBarTheme(centerTitle: isCenter)),
        ],
      );
    }
  });

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits title spacing',
    build: () => themeCubit,
    act: (cubit) => cubit.titleSpacingChanged(doubleStr),
    expect: () => [
      AppBarThemeState(theme: AppBarTheme(titleSpacing: doubleNum)),
    ],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits tool bar height',
    build: () => themeCubit,
    act: (cubit) => cubit.toolBarHeightChanged(doubleStr),
    expect: () => [
      AppBarThemeState(theme: AppBarTheme(toolbarHeight: doubleNum)),
    ],
  );

  group('test system UI overlay style', () {
    for (var style in MySystemUiOverlayStyle().values) {
      blocTest<AppBarThemeCubit, AppBarThemeState>(
        'emits ${style.statusBarBrightness}',
        build: () => themeCubit,
        act: (cubit) {
          cubit.systemUiOverlayStyleChanged(
            MySystemUiOverlayStyle().convertToString(style)!,
          );
        },
        expect: () => [
          AppBarThemeState(theme: AppBarTheme(systemOverlayStyle: style)),
        ],
      );
    }
  });

  blocTest<AppBarActionsIconThemeCubit, IconThemeState>(
    'emits action icon theme color',
    setUp: () => iconTheme = IconThemeData(color: color),
    build: () => actionsIconThemeCubit,
    act: (cubit) => cubit.colorChanged(color),
    expect: () => [IconThemeState(theme: iconTheme)],
    verify: (cubit) => expect(
      themeCubit.state,
      equals(
        AppBarThemeState(theme: AppBarTheme(actionsIconTheme: iconTheme)),
      ),
    ),
  );

  blocTest<AppBarIconThemeCubit, IconThemeState>(
    'emits icon theme color',
    setUp: () => iconTheme = IconThemeData(color: color),
    build: () => iconThemeCubit,
    act: (cubit) => cubit.colorChanged(color),
    expect: () => [IconThemeState(theme: iconTheme)],
    verify: (cubit) => expect(
      themeCubit.state,
      equals(
        AppBarThemeState(theme: AppBarTheme(iconTheme: iconTheme)),
      ),
    ),
  );

  blocTest<AppBarTitleTextStyleCubit, TextStyleState>(
    'emits title text style color',
    setUp: () => textStyle = kAppBarTitleTextStyle.copyWith(color: color),
    build: () => titleTextStyleCubit,
    act: (cubit) => cubit.colorChanged(color),
    expect: () => [TextStyleState(style: textStyle)],
    verify: (cubit) => expect(
      themeCubit.state,
      equals(
        AppBarThemeState(theme: AppBarTheme(titleTextStyle: textStyle)),
      ),
    ),
  );
}
