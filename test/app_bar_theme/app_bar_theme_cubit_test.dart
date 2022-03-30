import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/models/models.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late AppBarThemeCubit cubit;
  late AppBarTheme theme;
  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    cubit = AppBarThemeCubit();
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
    build: () => cubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [AppBarThemeState(theme: theme)],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits background color',
    build: () => cubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    expect: () => [
      AppBarThemeState(theme: AppBarTheme(backgroundColor: color)),
    ],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits foreground color',
    build: () => cubit,
    act: (cubit) => cubit.foregroundColorChanged(color),
    expect: () => [
      AppBarThemeState(theme: AppBarTheme(foregroundColor: color)),
    ],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits elevation',
    build: () => cubit,
    act: (cubit) => cubit.elevationChanged(doubleStr),
    expect: () => [AppBarThemeState(theme: AppBarTheme(elevation: doubleNum))],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits shadow color',
    build: () => cubit,
    act: (cubit) => cubit.shadowColorChanged(color),
    expect: () => [AppBarThemeState(theme: AppBarTheme(shadowColor: color))],
  );

  group('test center title', () {
    for (var isCenter in [true, false]) {
      blocTest<AppBarThemeCubit, AppBarThemeState>(
        'emits $isCenter',
        build: () => cubit,
        act: (cubit) => cubit.centerTitleChanged(isCenter),
        expect: () => [
          AppBarThemeState(theme: AppBarTheme(centerTitle: isCenter)),
        ],
      );
    }
  });

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits title spacing',
    build: () => cubit,
    act: (cubit) => cubit.titleSpacingChanged(doubleStr),
    expect: () => [
      AppBarThemeState(theme: AppBarTheme(titleSpacing: doubleNum)),
    ],
  );

  blocTest<AppBarThemeCubit, AppBarThemeState>(
    'emits tool bar height',
    build: () => cubit,
    act: (cubit) => cubit.toolBarHeightChanged(doubleStr),
    expect: () => [
      AppBarThemeState(theme: AppBarTheme(toolbarHeight: doubleNum)),
    ],
  );

  group('test system UI overlay style', () {
    for (var style in MySystemUiOverlayStyle().values) {
      blocTest<AppBarThemeCubit, AppBarThemeState>(
        'emits ${style.statusBarBrightness}',
        build: () => cubit,
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

  group('test actions icon theme', () {
    blocTest<AppBarThemeCubit, AppBarThemeState>(
      'emits color',
      build: () => cubit,
      act: (cubit) => cubit.actionsIconThemeColorChanged(color),
      expect: () => [
        AppBarThemeState(
          theme: AppBarTheme(actionsIconTheme: IconThemeData(color: color)),
        ),
      ],
    );

    blocTest<AppBarThemeCubit, AppBarThemeState>(
      'emits size',
      build: () => cubit,
      act: (cubit) => cubit.actionsIconThemeSizeChanged(doubleStr),
      expect: () => [
        AppBarThemeState(
          theme: AppBarTheme(actionsIconTheme: IconThemeData(size: doubleNum)),
        ),
      ],
    );

    blocTest<AppBarThemeCubit, AppBarThemeState>(
      'emits opacity',
      build: () => cubit,
      act: (cubit) => cubit.actionsIconThemeOpacityChanged(doubleStr),
      expect: () => [
        AppBarThemeState(
          theme: AppBarTheme(
            actionsIconTheme: IconThemeData(opacity: doubleNum),
          ),
        ),
      ],
    );
  });
}
