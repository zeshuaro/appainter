import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/outlined_button_theme/outlined_button_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

Future<void> main() async {
  final _widgetTesters = WidgetTesters(expandText: 'Outlined Button');

  late OutlinedButtonThemeCubit outlinedButtonThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late Color color;
  late double doubleValue;

  setUp(() {
    outlinedButtonThemeCubit = MockOutlinedButtonThemeCubit();
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    when(() {
      return outlinedButtonThemeCubit.state;
    }).thenReturn(const OutlinedButtonThemeState());
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> _pumpApp(
    WidgetTester tester,
    OutlinedButtonThemeState state,
  ) async {
    whenListen(
      outlinedButtonThemeCubit,
      Stream.fromIterable([const OutlinedButtonThemeState(), state]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: outlinedButtonThemeCubit),
          BlocProvider.value(value: colorThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(item: const OutlinedButtonThemeEditor()),
        ),
      ),
    );
  }

  testWidgets(
    'background default color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final prop = getMaterialStateProperty({null: color});
      final state = OutlinedButtonThemeState(
        theme: OutlinedButtonThemeData(
          style: ButtonStyle(backgroundColor: prop),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'outlinedButtonThemeEditor_backgroundColor_default',
        color,
      );
    },
  );

  group('test foreground color', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = OutlinedButtonThemeState(
          theme: OutlinedButtonThemeData(
            style: ButtonStyle(foregroundColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'outlinedButtonThemeEditor_foregroundColor_default',
          color,
        );
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = OutlinedButtonThemeState(
          theme: OutlinedButtonThemeData(
            style: ButtonStyle(foregroundColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'outlinedButtonThemeEditor_foregroundColor_disabled',
          color,
        );
      },
    );
  });

  group('test overlay color', () {
    testWidgets(
      'hovered color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.hovered: color});
        final state = OutlinedButtonThemeState(
          theme: OutlinedButtonThemeData(
            style: ButtonStyle(overlayColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'outlinedButtonThemeEditor_overlayColor_hovered',
          color,
        );
      },
    );

    testWidgets(
      'focused color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.focused: color});
        final state = OutlinedButtonThemeState(
          theme: OutlinedButtonThemeData(
            style: ButtonStyle(overlayColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'outlinedButtonThemeEditor_overlayColor_focused',
          color,
        );
      },
    );

    testWidgets(
      'pressed color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({MaterialState.pressed: color});
        final state = OutlinedButtonThemeState(
          theme: OutlinedButtonThemeData(
            style: ButtonStyle(overlayColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'outlinedButtonThemeEditor_overlayColor_pressed',
          color,
        );
      },
    );
  });

  testWidgets(
    'shadow default color picker should update with selected color',
    (tester) async {
      final prop = getMaterialStateProperty({null: color});
      final state = OutlinedButtonThemeState(
        theme: OutlinedButtonThemeData(style: ButtonStyle(shadowColor: prop)),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'outlinedButtonThemeEditor_shadowColor_default',
        color,
      );
    },
  );

  testWidgets(
    'elevation default text field should update with value',
    (tester) async {
      final prop = getMaterialStateProperty({null: doubleValue});
      final state = OutlinedButtonThemeState(
        theme: OutlinedButtonThemeData(style: ButtonStyle(elevation: prop)),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(
        tester,
        'outlinedButtonThemeEditor_elevationTextField_default',
        doubleValue,
      );
    },
  );
}
