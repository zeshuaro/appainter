import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/models/models.dart';
import 'package:appainter/services/util_service.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils.dart';
import '../../widget_testers.dart';

typedef CubitInitializer<T> = T Function();

class AbstractTextStyleEditorTest<T extends AbstractTextStyleCubit> {
  final AbstractTextStyleEditor editor;
  final CubitInitializer<T> initializer;
  final TextStyle style;
  final String expandText;

  AbstractTextStyleEditorTest({
    required this.editor,
    required this.initializer,
    required this.style,
    required this.expandText,
  });

  void runAllTests() {
    final widgetTesters = WidgetTesters(expandText: expandText);
    late T cubit;
    late Color color;
    late double doubleValue;

    setUp(() {
      cubit = initializer();
      color = getRandomColor();
      doubleValue = Random().nextDouble();

      when(() => cubit.state).thenReturn(TextStyleState(style: style));
    });

    Future<void> _pumpApp(WidgetTester tester, TextStyleState state) async {
      whenListen(
        cubit,
        Stream.fromIterable([TextStyleState(style: style), state]),
      );

      await tester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: MyExpansionPanelList(item: editor),
          ),
        ),
      );
    }

    testWidgets(
      'color picker should be updated with color',
      (tester) async {
        final state = TextStyleState(style: style.copyWith(color: color));

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(tester, 'colorPicker', color);
        verify(() => cubit.colorChanged(color)).called(1);
      },
    );

    testWidgets(
      'background color picker should be updated with color',
      (tester) async {
        final state = TextStyleState(
          style: style.copyWith(backgroundColor: color),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'backgroundColorPicker',
          color,
        );
        verify(() => cubit.backgroundColorChanged(color)).called(1);
      },
    );

    testWidgets(
      'font size text field should be updated with value',
      (tester) async {
        final state = TextStyleState(
          style: style.copyWith(fontSize: doubleValue),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkTextField(
          tester,
          'fontSizeTextField',
          doubleValue,
        );
        verify(() => cubit.fontSizeChanged(doubleValue.toString())).called(1);
      },
    );

    group('test font weight dropdown', () {
      for (var weight in MyFontWeight().values) {
        final weightStr = MyFontWeight().convertToString(weight);

        testWidgets(
          'should update to $weight',
          (tester) async {
            final state = TextStyleState(
              style: style.copyWith(fontWeight: weight),
            );

            await _pumpApp(tester, state);

            await widgetTesters.checkDropbox(
              tester,
              'fontWeightDropdown',
              weightStr!,
            );
            verify(() => cubit.fontWeightChanged(weightStr)).called(1);
          },
        );
      }
    });

    group('test font style dropdown', () {
      for (var fontStyle in FontStyle.values) {
        final fontStyleStr = UtilService.enumToString(fontStyle);

        testWidgets(
          'should update to $fontStyle',
          (tester) async {
            final state = TextStyleState(
              style: style.copyWith(fontStyle: fontStyle),
            );

            await _pumpApp(tester, state);

            await widgetTesters.checkDropbox(
              tester,
              'fontStyleDropdown',
              fontStyleStr,
            );
            verify(() => cubit.fontStyleChanged(fontStyleStr)).called(1);
          },
        );
      }
    });

    testWidgets(
      'letter spacing text field should be updated with value',
      (tester) async {
        final state = TextStyleState(
          style: style.copyWith(letterSpacing: doubleValue),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkTextField(
          tester,
          'letterSpacingTextField',
          doubleValue,
        );
        verify(
          () => cubit.letterSpacingChanged(doubleValue.toString()),
        ).called(1);
      },
    );

    testWidgets(
      'word spacing text field should be updated with value',
      (tester) async {
        final state = TextStyleState(
          style: style.copyWith(wordSpacing: doubleValue),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkTextField(
          tester,
          'wordSpacingTextField',
          doubleValue,
        );
        verify(
          () => cubit.wordSpacingChanged(doubleValue.toString()),
        ).called(1);
      },
    );

    group('test text baseline dropdown', () {
      for (var baseline in TextBaseline.values) {
        final baselineStr = UtilService.enumToString(baseline);

        testWidgets(
          'should update to $baseline',
          (tester) async {
            final state = TextStyleState(
              style: style.copyWith(textBaseline: baseline),
            );

            await _pumpApp(tester, state);

            await widgetTesters.checkDropbox(
              tester,
              'textBaselineDropdown',
              baselineStr,
            );
            verify(() => cubit.textBaselineChanged(baselineStr)).called(1);
          },
        );
      }
    });

    testWidgets(
      'height text field should be updated with value',
      (tester) async {
        final state = TextStyleState(
          style: style.copyWith(height: doubleValue),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkTextField(
          tester,
          'heightTextField',
          doubleValue,
        );
        verify(() => cubit.heightChanged(doubleValue.toString())).called(1);
      },
    );

    group('test leading distribution dropdown', () {
      for (var dist in TextLeadingDistribution.values) {
        final distStr = UtilService.enumToString(dist);

        testWidgets(
          'should update to $dist',
          (tester) async {
            final state = TextStyleState(
              style: style.copyWith(leadingDistribution: dist),
            );

            await _pumpApp(tester, state);

            await widgetTesters.checkDropbox(
              tester,
              'leadingDistributionDropdown',
              distStr,
            );
            verify(() => cubit.leadingDistributionChanged(distStr)).called(1);
          },
        );
      }
    });

    group('test decoration dropdown', () {
      for (var decoration in MyTextDecoration().values) {
        final decorationStr = MyTextDecoration().convertToString(decoration);

        testWidgets(
          'should update to $decoration',
          (tester) async {
            final state = TextStyleState(
              style: style.copyWith(decoration: decoration),
            );

            await _pumpApp(tester, state);

            await widgetTesters.checkDropbox(
              tester,
              'decorationDropdown',
              decorationStr!,
            );
            verify(() => cubit.decorationChanged(decorationStr)).called(1);
          },
        );
      }
    });

    testWidgets(
      'decoration color picker should be updated with color',
      (tester) async {
        final state = TextStyleState(
          style: style.copyWith(decorationColor: color),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'decorationColorPicker',
          color,
        );
        verify(() => cubit.decorationColorChanged(color)).called(1);
      },
    );

    group('test decoration style dropdown', () {
      testWidgets(
        'should update to null',
        (tester) async {
          final state = TextStyleState(
            style: style.copyWithNull(decorationStyle: true),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkDropbox(
            tester,
            'decorationStyleDropdown',
            kNone,
          );
          verify(() => cubit.decorationStyleChanged(kNone)).called(1);
        },
      );

      for (var decorationStyle in TextDecorationStyle.values) {
        final decorationStyleStr = UtilService.enumToString(decorationStyle);

        testWidgets(
          'should update to $decorationStyle',
          (tester) async {
            final state = TextStyleState(
              style: style.copyWith(decorationStyle: decorationStyle),
            );

            await _pumpApp(tester, state);

            await widgetTesters.checkDropbox(
              tester,
              'decorationStyleDropdown',
              decorationStyleStr,
            );
            verify(
              () => cubit.decorationStyleChanged(decorationStyleStr),
            ).called(1);
          },
        );
      }
    });

    testWidgets(
      'decoration thickness text field should be updated with value',
      (tester) async {
        final state = TextStyleState(
          style: style.copyWith(decorationThickness: doubleValue),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkTextField(
          tester,
          'decorationThicknessTextField',
          doubleValue,
        );
        verify(
          () => cubit.decorationThicknessChanged(doubleValue.toString()),
        ).called(1);
      },
    );
  }
}
