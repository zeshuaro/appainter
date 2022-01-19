import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late InputDecorationThemeCubit cubit;
  late InputDecorationTheme theme;
  late Color color;
  late int number;

  setUp(() {
    cubit = InputDecorationThemeCubit();
    color = getRandomColor();
    number = Random().nextInt(100);
  });

  blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
    'should emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).inputDecorationTheme;
    },
    build: () => cubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [InputDecorationThemeState(theme: theme)],
  );

  group('test floating label behavior', () {
    for (var behavior in FloatingLabelBehavior.values) {
      blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
        'should emit $behavior',
        build: () => cubit,
        act: (cubit) => cubit.floatingLabelBehaviorChanged(
          UtilService.enumToString(behavior),
        ),
        expect: () => [
          InputDecorationThemeState(
            theme: InputDecorationTheme(floatingLabelBehavior: behavior),
          ),
        ],
      );
    }
  });

  blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
    'should emit fill color',
    build: () => cubit,
    act: (cubit) => cubit.fillColorChanged(color),
    expect: () => [
      InputDecorationThemeState(theme: InputDecorationTheme(fillColor: color)),
    ],
  );

  blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
    'should emit hover color',
    build: () => cubit,
    act: (cubit) => cubit.hoverColorChanged(color),
    expect: () => [
      InputDecorationThemeState(theme: InputDecorationTheme(hoverColor: color)),
    ],
  );

  group('test align label with hint', () {
    for (var value in [true, false]) {
      blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
        'should emit $value',
        build: () => cubit,
        act: (cubit) => cubit.alignLabelWithHintChanged(value),
        expect: () => [
          InputDecorationThemeState(
            theme: InputDecorationTheme(alignLabelWithHint: value),
          ),
        ],
      );
    }
  });

  group('test filled', () {
    for (var value in [true, false]) {
      blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
        'should emit $value',
        build: () => cubit,
        act: (cubit) => cubit.filledChanged(value),
        expect: () => [
          InputDecorationThemeState(theme: InputDecorationTheme(filled: value)),
        ],
      );
    }
  });

  group('test is collapsed', () {
    for (var value in [true, false]) {
      blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
        'should emit $value',
        build: () => cubit,
        act: (cubit) => cubit.isCollapsedChanged(value),
        expect: () => [
          InputDecorationThemeState(
            theme: InputDecorationTheme(isCollapsed: value),
          ),
        ],
      );
    }
  });

  group('test is dense', () {
    for (var value in [true, false]) {
      blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
        'should emit $value',
        build: () => cubit,
        act: (cubit) => cubit.isDenseChanged(value),
        expect: () => [
          InputDecorationThemeState(
            theme: InputDecorationTheme(isDense: value),
          ),
        ],
      );
    }
  });

  blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
    'should emit error max lines',
    build: () => cubit,
    act: (cubit) => cubit.errorMaxLinesChanged(number.toString()),
    expect: () => [
      InputDecorationThemeState(
        theme: InputDecorationTheme(errorMaxLines: number),
      ),
    ],
  );

  blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
    'should emit helper max lines',
    build: () => cubit,
    act: (cubit) => cubit.helperMaxLinesChanged(number.toString()),
    expect: () => [
      InputDecorationThemeState(
        theme: InputDecorationTheme(helperMaxLines: number),
      ),
    ],
  );

  group('test border', () {
    final inputBorderHelper = MyInputBorder();
    for (var border in inputBorderHelper.values) {
      blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
        'should emit border with isOutline=${border.isOutline}',
        build: () => cubit,
        act: (cubit) => cubit.borderChanged(
          inputBorderHelper.stringFromEnum(border)!,
        ),
        expect: () => [
          InputDecorationThemeState(
            theme: InputDecorationTheme(border: border),
          ),
        ],
      );
    }
  });
}
