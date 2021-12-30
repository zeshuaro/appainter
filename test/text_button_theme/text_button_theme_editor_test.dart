import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/text_button_theme/text_button_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

Future<void> main() async {
  final _widgetTesters = WidgetTesters(expandText: 'Text Button');

  late TextButtonThemeCubit textButtonThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late Color color;
  late double doubleValue;

  setUp(() {
    textButtonThemeCubit = MockTextButtonThemeCubit();
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    when(() => textButtonThemeCubit.state).thenReturn(
      const TextButtonThemeState(),
    );
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, TextButtonThemeState state) async {
    whenListen(
      textButtonThemeCubit,
      Stream.fromIterable([const TextButtonThemeState(), state]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: textButtonThemeCubit),
          BlocProvider.value(value: colorThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(item: const TextButtonThemeEditor()),
        ),
      ),
    );
  }

  testWidgets(
    'background default color picker should update with selected color',
    (tester) async {
      final prop = getMaterialStateProperty({null: color});
      final state = TextButtonThemeState(
        theme: TextButtonThemeData(style: ButtonStyle(backgroundColor: prop)),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'textButtonThemeEditor_backgroundColor_default',
        color,
      );
    },
  );

  group('test foreground colors', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = TextButtonThemeState(
          theme: TextButtonThemeData(style: ButtonStyle(foregroundColor: prop)),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'textButtonThemeEditor_foregroundColor_default',
          color,
        );
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = TextButtonThemeState(
          theme: TextButtonThemeData(style: ButtonStyle(foregroundColor: prop)),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'textButtonThemeEditor_foregroundColor_disabled',
          color,
        );
      },
    );
  });

  group('test overlay colors', () {
    testWidgets(
      'hovered color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.hovered: color});
        final state = TextButtonThemeState(
          theme: TextButtonThemeData(style: ButtonStyle(overlayColor: prop)),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'textButtonThemeEditor_overlayColor_hovered',
          color,
        );
      },
    );

    testWidgets(
      'focused color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.focused: color});
        final state = TextButtonThemeState(
          theme: TextButtonThemeData(style: ButtonStyle(overlayColor: prop)),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'textButtonThemeEditor_overlayColor_focused',
          color,
        );
      },
    );

    testWidgets(
      'pressed color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.pressed: color});
        final state = TextButtonThemeState(
          theme: TextButtonThemeData(style: ButtonStyle(overlayColor: prop)),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'textButtonThemeEditor_overlayColor_pressed',
          color,
        );
      },
    );
  });

  testWidgets(
    'shadow default color picker should update with selected color',
    (tester) async {
      final prop = getMaterialStateProperty({null: color});
      final state = TextButtonThemeState(
        theme: TextButtonThemeData(style: ButtonStyle(shadowColor: prop)),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'textButtonThemeEditor_shadowColor_default',
        color,
      );
    },
  );

  testWidgets(
    'elevation default text field should update with value',
    (tester) async {
      final prop = getMaterialStateProperty({null: doubleValue});
      final state = TextButtonThemeState(
        theme: TextButtonThemeData(style: ButtonStyle(elevation: prop)),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(
        tester,
        'textButtonThemeEditor_elevationTextField_default',
        doubleValue,
      );
    },
  );
}
