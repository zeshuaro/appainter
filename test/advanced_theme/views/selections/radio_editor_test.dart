import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../pump_app.dart';
import '../../../utils.dart';
import '../../../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Radio');

  late AdvancedThemeCubit cubit;
  late Color testColor;

  setUpAll(() {
    registerFallbackValue(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());

    testColor = getRandomColor();
  });

  Future<void> _pumpApp(WidgetTester tester, AdvancedThemeState state) async {
    whenListen(
      cubit,
      Stream.fromIterable([AdvancedThemeState(), state]),
    );

    await tester.pumpApp(
      const SingleChildScrollView(child: RadioEditor()),
      advancedThemeCubit: cubit,
    );
  }

  testWidgets('shoud display RadioEditor', (tester) async {
    await tester.pumpApp(const RadioEditor(), advancedThemeCubit: cubit);
    expect(find.byType(RadioEditor), findsOneWidget);
  });

  group('fill color pickers', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({null: testColor});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            radioTheme: RadioThemeData(fillColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'radioEditor_fillColor_default',
          testColor,
        );
      },
    );

    testWidgets(
      'selected color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.selected: testColor,
        });
        final state = AdvancedThemeState(
          themeData: ThemeData(
            radioTheme: RadioThemeData(fillColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'radioEditor_fillColor_selected',
          testColor,
        );
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.disabled: testColor,
        });
        final state = AdvancedThemeState(
          themeData: ThemeData(
            radioTheme: RadioThemeData(fillColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'radioEditor_fillColor_disabled',
          testColor,
        );
      },
    );
  });

  group('overlay color pickers', () {
    testWidgets(
      'pressed color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.pressed: testColor,
        });
        final state = AdvancedThemeState(
          themeData: ThemeData(
            radioTheme: RadioThemeData(overlayColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'radioEditor_overlayColor_pressed',
          testColor,
        );
      },
    );

    testWidgets(
      'hovered color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.hovered: testColor,
        });
        final state = AdvancedThemeState(
          themeData: ThemeData(
            radioTheme: RadioThemeData(overlayColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'radioEditor_overlayColor_hovered',
          testColor,
        );
      },
    );

    testWidgets(
      'focused color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.focused: testColor,
        });
        final state = AdvancedThemeState(
          themeData: ThemeData(
            radioTheme: RadioThemeData(overlayColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'radioEditor_overlayColor_focused',
          testColor,
        );
      },
    );
  });

  testWidgets(
    'splash radius text field should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          radioTheme: RadioThemeData(splashRadius: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'radioEditor_splashRadiusTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
