import 'dart:math';

import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/models/models.dart';
import 'package:appainter/services/services.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils.dart';
import 'mocks.dart';

void main() {
  late TestTextStyleCubit cubit;
  late TextStyle style;
  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    cubit = TestTextStyleCubit();
    style = cubit.baseStyle!.merge(cubit.blackStyle);

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();
  });

  group('test style brightness', () {
    for (var isDark in [true, false]) {
      blocTest<TestTextStyleCubit, TextStyleState>(
        'should emit style with isDark=$isDark',
        build: () => cubit,
        act: (cubit) => cubit.styleBrightnessChanged(isDark),
        expect: () => [
          TextStyleState(
            style: isDark
                ? style.merge(cubit.whiteStyle)
                : style.merge(cubit.blackStyle),
          )
        ],
      );
    }
  });

  blocTest<TestTextStyleCubit, TextStyleState>(
    'should emit style',
    build: () => cubit,
    act: (cubit) => cubit.styleChanged(style),
    expect: () => [TextStyleState(style: style)],
  );

  blocTest<TestTextStyleCubit, TextStyleState>(
    'should emit color',
    build: () => cubit,
    act: (cubit) => cubit.colorChanged(color),
    expect: () => [TextStyleState(style: style.copyWith(color: color))],
  );

  blocTest<TestTextStyleCubit, TextStyleState>(
    'should emit background color',
    build: () => cubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    expect: () => [
      TextStyleState(style: style.copyWith(backgroundColor: color)),
    ],
  );

  blocTest<TestTextStyleCubit, TextStyleState>(
    'should emit font size',
    build: () => cubit,
    act: (cubit) => cubit.fontSizeChanged(doubleStr),
    expect: () => [
      TextStyleState(style: style.copyWith(fontSize: doubleNum)),
    ],
  );

  group('test font weights', () {
    for (var weight in MyFontWeight().values) {
      blocTest<TestTextStyleCubit, TextStyleState>(
        'should emit $weight',
        build: () => cubit,
        act: (cubit) {
          cubit.fontWeightChanged(MyFontWeight().convertToString(weight)!);
        },
        expect: () => [
          TextStyleState(style: style.copyWith(fontWeight: weight)),
        ],
      );
    }
  });

  group('test font styles', () {
    for (var fontStyle in FontStyle.values) {
      blocTest<TestTextStyleCubit, TextStyleState>(
        'should emit $fontStyle',
        build: () => cubit,
        act: (cubit) {
          cubit.fontStyleChanged(UtilService.enumToString(fontStyle));
        },
        expect: () => [
          TextStyleState(style: style.copyWith(fontStyle: fontStyle)),
        ],
      );
    }
  });

  blocTest<TestTextStyleCubit, TextStyleState>(
    'should emit letter spacing',
    build: () => cubit,
    act: (cubit) => cubit.letterSpacingChanged(doubleStr),
    expect: () => [
      TextStyleState(style: style.copyWith(letterSpacing: doubleNum)),
    ],
  );

  blocTest<TestTextStyleCubit, TextStyleState>(
    'should emit word spacing',
    build: () => cubit,
    act: (cubit) => cubit.wordSpacingChanged(doubleStr),
    expect: () => [
      TextStyleState(style: style.copyWith(wordSpacing: doubleNum)),
    ],
  );

  group('test text baselines', () {
    for (var baseline in TextBaseline.values) {
      blocTest<TestTextStyleCubit, TextStyleState>(
        'should emit $baseline',
        build: () => cubit,
        act: (cubit) {
          cubit.textBaselineChanged(UtilService.enumToString(baseline));
        },
        expect: () => [
          TextStyleState(style: style.copyWith(textBaseline: baseline)),
        ],
      );
    }
  });

  blocTest<TestTextStyleCubit, TextStyleState>(
    'should emit height',
    build: () => cubit,
    act: (cubit) => cubit.heightChanged(doubleStr),
    expect: () => [
      TextStyleState(style: style.copyWith(height: doubleNum)),
    ],
  );

  group('test leading distributions', () {
    for (var dist in TextLeadingDistribution.values) {
      blocTest<TestTextStyleCubit, TextStyleState>(
        'should emit $dist',
        build: () => cubit,
        act: (cubit) {
          cubit.leadingDistributionChanged(UtilService.enumToString(dist));
        },
        expect: () => [
          TextStyleState(style: style.copyWith(leadingDistribution: dist)),
        ],
      );
    }
  });

  group('test decorations', () {
    for (var decoration in MyTextDecoration().values) {
      blocTest<TestTextStyleCubit, TextStyleState>(
        'should emit $decoration',
        build: () => cubit,
        act: (cubit) {
          cubit.decorationChanged(
            MyTextDecoration().convertToString(decoration)!,
          );
        },
        expect: () => [
          TextStyleState(style: style.copyWith(decoration: decoration)),
        ],
      );
    }
  });

  blocTest<TestTextStyleCubit, TextStyleState>(
    'should emit decoration color',
    build: () => cubit,
    act: (cubit) => cubit.decorationColorChanged(color),
    expect: () => [
      TextStyleState(style: style.copyWith(decorationColor: color)),
    ],
  );

  group('text decoration styles', () {
    blocTest<TestTextStyleCubit, TextStyleState>(
      'should emit null',
      build: () => cubit,
      act: (cubit) => cubit.decorationStyleChanged(kNone),
      expect: () => [
        TextStyleState(style: style.copyWithNull(decorationStyle: true)),
      ],
    );

    for (var decorationStyle in TextDecorationStyle.values) {
      blocTest<TestTextStyleCubit, TextStyleState>(
        'should emit $decorationStyle',
        build: () => cubit,
        act: (cubit) {
          cubit.decorationStyleChanged(
            UtilService.enumToString(decorationStyle),
          );
        },
        expect: () => [
          TextStyleState(
            style: style.copyWith(decorationStyle: decorationStyle),
          ),
        ],
      );
    }
  });

  blocTest<TestTextStyleCubit, TextStyleState>(
    'should emit decoration thickness',
    build: () => cubit,
    act: (cubit) => cubit.decorationThicknessChanged(doubleStr),
    expect: () => [
      TextStyleState(style: style.copyWith(decorationThickness: doubleNum)),
    ],
  );
}
