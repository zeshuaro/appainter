import 'dart:math';

import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/models/models.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../utils.dart';
import '../widget_testers.dart';
import 'mocks.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Test');

  late TestTextStyleCubit cubit;
  late TextStyle style;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    cubit = MockTextStyleCubit();
    style = Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .bodyText1!;

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();
  });

  Future<void> pumpApp(WidgetTester tester, TextStyleState state) async {
    whenListen(
      cubit,
      Stream.fromIterable([state]),
      initialState: TextStyleState(style: style),
    );

    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: MaterialApp(
          home: MyExpansionPanelList(
            item: const TestIconThemeEditor(),
          ),
        ),
      ),
    );
  }

  testWidgets('updates color', (tester) async {
    final state = TextStyleState(style: style.copyWith(color: color));

    await pumpApp(tester, state);

    await widgetTesters.checkColorPicker(tester, 'colorPicker', color);
    verify(() => cubit.colorChanged(color)).called(1);
  });

  testWidgets('updates background color', (tester) async {
    final state = TextStyleState(style: style.copyWith(backgroundColor: color));

    await pumpApp(tester, state);

    await widgetTesters.checkColorPicker(
      tester,
      'backgroundColorPicker',
      color,
    );
    verify(() => cubit.backgroundColorChanged(color)).called(1);
  });

  testWidgets('updates font size', (tester) async {
    final state = TextStyleState(style: style.copyWith(fontSize: doubleNum));

    await pumpApp(tester, state);

    await widgetTesters.checkTextField(
      tester,
      'fontSizeTextField',
      doubleNum,
    );
    verify(() => cubit.fontSizeChanged(doubleStr)).called(1);
  });

  group('tests font weight', () {
    for (var weight in MyFontWeight().values) {
      final weightStr = MyFontWeight().convertToString(weight);

      testWidgets('updates to $weight', (tester) async {
        final state = TextStyleState(style: style.copyWith(fontWeight: weight));

        await pumpApp(tester, state);

        await widgetTesters.checkDropbox(
          tester,
          'fontWeightDropdown',
          weightStr!,
        );
        verify(() => cubit.fontWeightChanged(weightStr)).called(1);
      });
    }
  });

  group('tests font style', () {
    for (var fontStyle in FontStyle.values) {
      final fontStyleStr = UtilService.enumToString(fontStyle);

      testWidgets('updates to $fontStyle', (tester) async {
        final state = TextStyleState(
          style: style.copyWith(fontStyle: fontStyle),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkDropbox(
          tester,
          'fontStyleDropdown',
          fontStyleStr,
        );
        verify(() => cubit.fontStyleChanged(fontStyleStr)).called(1);
      });
    }
  });

  group('tests letter spacing', () {
    for (var multiplier in [1, -1]) {
      testWidgets(
        'updates to value with multiplier $multiplier',
        (tester) async {
          final value = doubleNum * multiplier;
          final state = TextStyleState(
            style: style.copyWith(letterSpacing: value),
          );

          await pumpApp(tester, state);

          await widgetTesters.checkTextField(
            tester,
            'letterSpacingTextField',
            value,
          );
          verify(
            () => cubit.letterSpacingChanged(value.toString()),
          ).called(1);
        },
      );
    }
  });

  group('tests word spacing', () {
    for (var multiplier in [1, -1]) {
      testWidgets(
        'updates to value with multiplier $multiplier',
        (tester) async {
          final value = doubleNum * multiplier;
          final state =
              TextStyleState(style: style.copyWith(wordSpacing: value));

          await pumpApp(tester, state);

          await widgetTesters.checkTextField(
            tester,
            'wordSpacingTextField',
            value,
          );
          verify(() => cubit.wordSpacingChanged(value.toString())).called(1);
        },
      );
    }
  });

  group('tests text baseline', () {
    for (var baseline in TextBaseline.values) {
      final baselineStr = UtilService.enumToString(baseline);

      testWidgets('updates to $baseline', (tester) async {
        final state = TextStyleState(
          style: style.copyWith(textBaseline: baseline),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkDropbox(
          tester,
          'textBaselineDropdown',
          baselineStr,
        );
        verify(() => cubit.textBaselineChanged(baselineStr)).called(1);
      });
    }
  });

  testWidgets('updates height', (tester) async {
    final state = TextStyleState(style: style.copyWith(height: doubleNum));

    await pumpApp(tester, state);

    await widgetTesters.checkTextField(
      tester,
      'heightTextField',
      doubleNum,
    );
    verify(() => cubit.heightChanged(doubleStr)).called(1);
  });

  group('tests leading distribution', () {
    for (var dist in TextLeadingDistribution.values) {
      final distStr = UtilService.enumToString(dist);

      testWidgets('updates to $dist', (tester) async {
        final state = TextStyleState(
          style: style.copyWith(leadingDistribution: dist),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkDropbox(
          tester,
          'leadingDistributionDropdown',
          distStr,
        );
        verify(() => cubit.leadingDistributionChanged(distStr)).called(1);
      });
    }
  });

  group('tests decoration', () {
    for (var decoration in MyTextDecoration().values) {
      final decorationStr = MyTextDecoration().convertToString(decoration);

      testWidgets('updates to $decoration', (tester) async {
        final state = TextStyleState(
          style: style.copyWith(decoration: decoration),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkDropbox(
          tester,
          'decorationDropdown',
          decorationStr!,
        );
        verify(() => cubit.decorationChanged(decorationStr)).called(1);
      });
    }
  });

  testWidgets('updates decoration color', (tester) async {
    final state = TextStyleState(style: style.copyWith(decorationColor: color));

    await pumpApp(tester, state);

    await widgetTesters.checkColorPicker(
      tester,
      'decorationColorPicker',
      color,
    );
    verify(() => cubit.decorationColorChanged(color)).called(1);
  });

  group('tests decoration style', () {
    testWidgets('updates to null', (tester) async {
      final state = TextStyleState(
        style: style.copyWithNull(decorationStyle: true),
      );

      await pumpApp(tester, state);

      await widgetTesters.checkDropbox(
        tester,
        'decorationStyleDropdown',
        kNone,
      );
      verify(() => cubit.decorationStyleChanged(kNone)).called(1);
    });

    for (var decorationStyle in TextDecorationStyle.values) {
      final decorationStyleStr = UtilService.enumToString(decorationStyle);

      testWidgets('updates to $decorationStyle', (tester) async {
        final state = TextStyleState(
          style: style.copyWith(decorationStyle: decorationStyle),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkDropbox(
          tester,
          'decorationStyleDropdown',
          decorationStyleStr,
        );
        verify(
          () => cubit.decorationStyleChanged(decorationStyleStr),
        ).called(1);
      });
    }
  });

  testWidgets('updates decoration thickness', (tester) async {
    final state = TextStyleState(
      style: style.copyWith(decorationThickness: doubleNum),
    );

    await pumpApp(tester, state);

    await widgetTesters.checkTextField(
      tester,
      'decorationThicknessTextField',
      doubleNum,
    );
    verify(
      () => cubit.decorationThicknessChanged(doubleStr),
    ).called(1);
  });
}
