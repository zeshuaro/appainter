import 'dart:io';
import 'dart:math';

import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/models/models.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils.dart';
import 'mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = null;

  late TestTextStyleCubit cubit;
  late TextStyle style;
  late FontData fontData;
  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    cubit = TestTextStyleCubit();
    style = cubit.blackTextStyle;

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();
  });

  group('test style brightness', () {
    for (var isDark in [true, false]) {
      blocTest<TestTextStyleCubit, TextStyleState>(
        'emit style with isDark=$isDark',
        build: () => cubit,
        act: (cubit) => cubit.styleBrightnessChanged(isDark),
        expect: () => [
          TextStyleState(
            style: isDark ? cubit.whiteTextStyle : cubit.blackTextStyle,
          ),
        ],
      );
    }
  });

  blocTest<TestTextStyleCubit, TextStyleState>(
    'emit style',
    build: () => cubit,
    act: (cubit) => cubit.styleChanged(style),
    expect: () => [TextStyleState(style: style)],
  );

  blocTest<TestTextStyleCubit, TextStyleState>(
    'emit color',
    build: () => cubit,
    act: (cubit) => cubit.colorChanged(color),
    expect: () => [TextStyleState(style: style.copyWith(color: color))],
  );

  blocTest<TestTextStyleCubit, TextStyleState>(
    'emit background color',
    build: () => cubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    expect: () => [
      TextStyleState(style: style.copyWith(backgroundColor: color)),
    ],
  );

  blocTest<TestTextStyleCubit, TextStyleState>(
    'emit font size',
    build: () => cubit,
    act: (cubit) => cubit.fontSizeChanged(doubleStr),
    expect: () => [
      TextStyleState(style: style.copyWith(fontSize: doubleNum)),
    ],
  );

  group('test font weights', () {
    for (var weight in MyFontWeight().values) {
      blocTest<TestTextStyleCubit, TextStyleState>(
        'emit $weight',
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
        'emit $fontStyle',
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
    'emit letter spacing',
    build: () => cubit,
    act: (cubit) => cubit.letterSpacingChanged(doubleStr),
    expect: () => [
      TextStyleState(style: style.copyWith(letterSpacing: doubleNum)),
    ],
  );

  blocTest<TestTextStyleCubit, TextStyleState>(
    'emit word spacing',
    build: () => cubit,
    act: (cubit) => cubit.wordSpacingChanged(doubleStr),
    expect: () => [
      TextStyleState(style: style.copyWith(wordSpacing: doubleNum)),
    ],
  );

  group('test text baselines', () {
    for (var baseline in TextBaseline.values) {
      blocTest<TestTextStyleCubit, TextStyleState>(
        'emit $baseline',
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
    'emit height',
    build: () => cubit,
    act: (cubit) => cubit.heightChanged(doubleStr),
    expect: () => [
      TextStyleState(style: style.copyWith(height: doubleNum)),
    ],
  );

  group('test leading distributions', () {
    for (var dist in TextLeadingDistribution.values) {
      blocTest<TestTextStyleCubit, TextStyleState>(
        'emit $dist',
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
        'emit $decoration',
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
    'emit decoration color',
    build: () => cubit,
    act: (cubit) => cubit.decorationColorChanged(color),
    expect: () => [
      TextStyleState(style: style.copyWith(decorationColor: color)),
    ],
  );

  group('text decoration styles', () {
    blocTest<TestTextStyleCubit, TextStyleState>(
      'emit null',
      build: () => cubit,
      act: (cubit) => cubit.decorationStyleChanged(kNone),
      expect: () => [
        TextStyleState(style: style.copyWithNull(decorationStyle: true)),
      ],
    );

    for (var decorationStyle in TextDecorationStyle.values) {
      blocTest<TestTextStyleCubit, TextStyleState>(
        'emit $decorationStyle',
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
    'emit decoration thickness',
    build: () => cubit,
    act: (cubit) => cubit.decorationThicknessChanged(doubleStr),
    expect: () => [
      TextStyleState(style: style.copyWith(decorationThickness: doubleNum)),
    ],
  );

  blocTest<TestTextStyleCubit, TextStyleState>(
    'emit font family',
    setUp: () => fontData = FontData('ABeeZee', GoogleFonts.getFont('ABeeZee')),
    build: () => cubit,
    act: (cubit) => cubit.fontFamilyChanged(fontData),
    expect: () => [
      TextStyleState(style: style.merge(fontData.style)),
    ],
  );
}
