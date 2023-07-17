import 'dart:math';

import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/services/util_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late AppBarThemeCubit themeCubit;
  late AppBarActionsIconThemeCubit actionsIconThemeCubit;
  late AppBarIconThemeCubit iconThemeCubit;
  late AppBarTitleTextStyleCubit titleTextStyleCubit;
  late AppBarToolbarTextStyleCubit toolbarTextStyleCubit;

  late AppBarTheme theme;
  late IconThemeData iconTheme;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    actionsIconThemeCubit = AppBarActionsIconThemeCubit();
    iconThemeCubit = AppBarIconThemeCubit();
    titleTextStyleCubit = AppBarTitleTextStyleCubit();
    toolbarTextStyleCubit = AppBarToolbarTextStyleCubit();
    themeCubit = AppBarThemeCubit(
      actionsIconThemeCubit: actionsIconThemeCubit,
      iconThemeCubit: iconThemeCubit,
      titleTextStyleCubit: titleTextStyleCubit,
      toolbarTextStyleCubit: toolbarTextStyleCubit,
    );

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();
  });

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).appBarTheme;
    },
    build: () => themeCubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [
      AppBarThemeState(theme: theme),
      AppBarThemeState(
        theme: theme.copyWith(
          actionsIconTheme: AppBarThemeCubit.defaultIconTheme,
        ),
      ),
      AppBarThemeState(
        theme: theme.copyWith(
          actionsIconTheme: AppBarThemeCubit.defaultIconTheme,
          iconTheme: AppBarThemeCubit.defaultIconTheme,
        ),
      ),
      AppBarThemeState(
        theme: theme.copyWith(
          actionsIconTheme: AppBarThemeCubit.defaultIconTheme,
          iconTheme: AppBarThemeCubit.defaultIconTheme,
          titleTextStyle: AppBarThemeCubit.defaultTitleTextStyle,
        ),
      ),
      AppBarThemeState(
        theme: theme.copyWith(
          actionsIconTheme: AppBarThemeCubit.defaultIconTheme,
          iconTheme: AppBarThemeCubit.defaultIconTheme,
          titleTextStyle: AppBarThemeCubit.defaultTitleTextStyle,
          toolbarTextStyle: AppBarThemeCubit.defaultToolbarTextStyle,
        ),
      ),
    ],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emit background color',
    build: () => themeCubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    expect: () => [AppBarThemeState.withTheme(backgroundColor: color)],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emit foreground color',
    build: () => themeCubit,
    act: (cubit) => cubit.foregroundColorChanged(color),
    expect: () => [AppBarThemeState.withTheme(foregroundColor: color)],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emit elevation',
    build: () => themeCubit,
    act: (cubit) => cubit.elevationChanged(doubleStr),
    expect: () => [AppBarThemeState.withTheme(elevation: doubleNum)],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emit shadow color',
    build: () => themeCubit,
    act: (cubit) => cubit.shadowColorChanged(color),
    expect: () => [AppBarThemeState.withTheme(shadowColor: color)],
  );

  group('test center title', () {
    for (var isCenter in [true, false]) {
      blocTest<AppBarThemeCubit, AppBarThemeState>(
        'emit $isCenter',
        build: () => themeCubit,
        act: (cubit) => cubit.centerTitleChanged(isCenter),
        expect: () => [AppBarThemeState.withTheme(centerTitle: isCenter)],
      );
    }
  });

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emit title spacing',
    build: () => themeCubit,
    act: (cubit) => cubit.titleSpacingChanged(doubleStr),
    expect: () => [AppBarThemeState.withTheme(titleSpacing: doubleNum)],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emit tool bar height',
    build: () => themeCubit,
    act: (cubit) => cubit.toolBarHeightChanged(doubleStr),
    expect: () => [AppBarThemeState.withTheme(toolbarHeight: doubleNum)],
  );

  group('system overlay style', () {
    const systemOverlayStyle = SystemUiOverlayStyle.light;

    blocTest<AppBarThemeCubit, AppBarThemeState>(
      'emit status bar color',
      build: () => themeCubit,
      act: (cubit) => cubit.statusBarColorChanged(color),
      expect: () => [
        AppBarThemeState.withTheme(
          systemUiOverlayStyle: systemOverlayStyle.copyWith(
            statusBarColor: color,
          ),
        ),
      ],
    );

    for (var brightness in Brightness.values) {
      final brightnessStr = UtilService.enumToString(brightness);

      blocTest<AppBarThemeCubit, AppBarThemeState>(
        'emit status bar brightness',
        build: () => themeCubit,
        act: (cubit) => cubit.statusBarBrightnessChanged(brightnessStr),
        expect: () => [
          AppBarThemeState.withTheme(
            systemUiOverlayStyle: systemOverlayStyle.copyWith(
              statusBarBrightness: brightness,
            ),
          ),
        ],
      );

      blocTest<AppBarThemeCubit, AppBarThemeState>(
        'emit status bar icon brightness',
        build: () => themeCubit,
        act: (cubit) => cubit.statusBarIconBrightnessChanged(brightnessStr),
        expect: () => [
          AppBarThemeState.withTheme(
            systemUiOverlayStyle: systemOverlayStyle.copyWith(
              statusBarIconBrightness: brightness,
            ),
          ),
        ],
      );
    }
  });

  blocTest<AppBarActionsIconThemeCubit, IconThemeState>(
    'emit action icon theme color',
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
    'emit icon theme color',
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

  test('initialise title text style cubit', () {
    final cubit = AppBarTitleTextStyleCubit();
    expect(cubit.typeScale, equals(TypeScale.headlineSmall));
    expect(cubit.isBaseStyleBlack, equals(false));
  });

  test('initialise toolbar text style cubit', () {
    final cubit = AppBarToolbarTextStyleCubit();
    expect(cubit.typeScale, equals(TypeScale.labelLarge));
    expect(cubit.isBaseStyleBlack, equals(false));
  });
}
