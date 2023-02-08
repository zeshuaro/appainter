import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../mocks.dart';
import '../utils.dart';

void main() {
  late InputDecorationThemeCubit inputDecorationThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late InputDecorationTheme theme;
  late Color color;
  late int intNum;
  late double doubleNum;

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    inputDecorationThemeCubit = InputDecorationThemeCubit(
      colorThemeCubit: colorThemeCubit,
    );
    color = getRandomColor();
    intNum = Random().nextInt(100);
    doubleNum = Random().nextDouble();
  });

  blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
    'emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).inputDecorationTheme;
    },
    build: () => inputDecorationThemeCubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [InputDecorationThemeState(theme: theme)],
  );

  group('test floating label behavior', () {
    for (var behavior in FloatingLabelBehavior.values) {
      blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
        'emit $behavior',
        build: () => inputDecorationThemeCubit,
        act: (cubit) => cubit.floatingLabelBehaviorChanged(
          UtilService.enumToString(behavior),
        ),
        expect: () => [
          InputDecorationThemeState.withTheme(floatingLabelBehavior: behavior),
        ],
      );
    }
  });

  blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
    'emit fill color',
    build: () => inputDecorationThemeCubit,
    act: (cubit) => cubit.fillColorChanged(color),
    expect: () => [InputDecorationThemeState.withTheme(fillColor: color)],
  );

  blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
    'emit hover color',
    build: () => inputDecorationThemeCubit,
    act: (cubit) => cubit.hoverColorChanged(color),
    expect: () => [InputDecorationThemeState.withTheme(hoverColor: color)],
  );

  group('test align label with hint', () {
    for (var value in [true, false]) {
      blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
        'emit $value',
        build: () => inputDecorationThemeCubit,
        act: (cubit) => cubit.alignLabelWithHintChanged(value),
        expect: () => [
          InputDecorationThemeState.withTheme(alignLabelWithHint: value),
        ],
      );
    }
  });

  group('test filled', () {
    for (var value in [true, false]) {
      blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
        'emit $value',
        build: () => inputDecorationThemeCubit,
        act: (cubit) => cubit.filledChanged(value),
        expect: () => [InputDecorationThemeState.withTheme(filled: value)],
      );
    }
  });

  group('test is collapsed', () {
    for (var value in [true, false]) {
      blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
        'emit $value',
        build: () => inputDecorationThemeCubit,
        act: (cubit) => cubit.isCollapsedChanged(value),
        expect: () => [InputDecorationThemeState.withTheme(isCollapsed: value)],
      );
    }
  });

  group('test is dense', () {
    for (var value in [true, false]) {
      blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
        'emit $value',
        build: () => inputDecorationThemeCubit,
        act: (cubit) => cubit.isDenseChanged(value),
        expect: () => [InputDecorationThemeState.withTheme(isDense: value)],
      );
    }
  });

  blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
    'emit error max lines',
    build: () => inputDecorationThemeCubit,
    act: (cubit) => cubit.errorMaxLinesChanged(intNum.toString()),
    expect: () => [InputDecorationThemeState.withTheme(errorMaxLines: intNum)],
  );

  blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
    'emit helper max lines',
    build: () => inputDecorationThemeCubit,
    act: (cubit) => cubit.helperMaxLinesChanged(intNum.toString()),
    expect: () => [InputDecorationThemeState.withTheme(helperMaxLines: intNum)],
  );

  group('test border', () {
    final inputBorderEnum = InputBorderEnum();
    for (var border in inputBorderEnum.values) {
      blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
        'emit border with isOutline=${border.isOutline}',
        build: () => inputDecorationThemeCubit,
        act: (cubit) => cubit.borderChanged(
          inputBorderEnum.convertToString(border)!,
        ),
        expect: () => [InputDecorationThemeState.withTheme(border: border)],
      );
    }
  });

  group('test border radius', () {
    blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
      'emit border radius for outline input border',
      build: () => inputDecorationThemeCubit,
      seed: () => const InputDecorationThemeState(
        theme: InputDecorationTheme(border: OutlineInputBorder()),
      ),
      act: (cubit) => cubit.borderRadiusChanged(doubleNum.toString()),
      expect: () => [
        InputDecorationThemeState.withTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(doubleNum),
          ),
        ),
      ],
    );

    blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
      'should not emit border radius for underline input border',
      build: () => inputDecorationThemeCubit,
      act: (cubit) => cubit.borderRadiusChanged(doubleNum.toString()),
      expect: () => [],
    );
  });

  group('test enabled border side', () {
    blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
      'emit color',
      build: () => inputDecorationThemeCubit,
      act: (cubit) => cubit.enabledBorderSideColorChanged(color),
      expect: () => [
        InputDecorationThemeState.withTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
        ),
      ],
    );

    blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
      'emit width',
      build: () => inputDecorationThemeCubit,
      act: (cubit) => cubit.enabledBorderSideWidthChanged(doubleNum.toString()),
      expect: () => [
        InputDecorationThemeState.withTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: doubleNum),
          ),
        ),
      ],
    );
  });

  group('test disabled border side', () {
    blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
      'emit color',
      build: () => inputDecorationThemeCubit,
      act: (cubit) => cubit.disabledBorderSideColorChanged(color),
      expect: () => [
        InputDecorationThemeState.withTheme(
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
        ),
      ],
    );

    blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
      'emit width',
      build: () => inputDecorationThemeCubit,
      act: (cubit) => cubit.disabledBorderSideWidthChanged(
        doubleNum.toString(),
      ),
      expect: () => [
        InputDecorationThemeState.withTheme(
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: doubleNum),
          ),
        ),
      ],
    );
  });

  group('test error border side', () {
    blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
      'emit color',
      build: () => inputDecorationThemeCubit,
      act: (cubit) => cubit.errorBorderSideColorChanged(color),
      expect: () => [
        InputDecorationThemeState.withTheme(
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
        ),
      ],
    );

    blocTest<InputDecorationThemeCubit, InputDecorationThemeState>(
      'emit width',
      build: () => inputDecorationThemeCubit,
      act: (cubit) => cubit.errorBorderSideWidthChanged(
        doubleNum.toString(),
      ),
      expect: () => [
        InputDecorationThemeState.withTheme(
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: doubleNum),
          ),
        ),
      ],
    );
  });
}
