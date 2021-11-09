import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../pump_app.dart';
import '../../utils.dart';
import '../../widget_testers.dart';

class MockAdvancedThemeCubit extends MockCubit<AdvancedThemeState>
    implements AdvancedThemeCubit {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Slider');
  late AdvancedThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, AdvancedThemeState state) async {
    whenListen(
      cubit,
      Stream.fromIterable([AdvancedThemeState(), state]),
    );

    await tester.pumpApp(const SliderEditor(), advancedThemeCubit: cubit);
  }

  testWidgets('shoud display SwitchEditor', (tester) async {
    await tester.pumpApp(const SliderEditor(), advancedThemeCubit: cubit);
    expect(find.byType(SliderEditor), findsOneWidget);
  });

  testWidgets(
    'track height text field should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(trackHeight: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'sliderEditor_trackHeightTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'active track color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(activeTrackColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_activeTrackColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'inactive track color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(inactiveTrackColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_inactiveTrackColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'disabled active track color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(disabledActiveTrackColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_disabledActiveTrackColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'disabled inactive track color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(disabledInactiveTrackColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_disabledInactiveTrackColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'active tick mark color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(activeTickMarkColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_activeTickMarkColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'inactive tick mark color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(inactiveTickMarkColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_inactiveTickMarkColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'disabled active tick mark color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(disabledActiveTickMarkColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_disabledActiveTickMarkColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'disabled inactive tick mark color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(disabledInactiveTickMarkColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_disabledInactiveTickMarkColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'thumb color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(thumbColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_thumbColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'disabled thumb color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(disabledThumbColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_disabledThumbColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'overlapping shapes stroke color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(overlappingShapeStrokeColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_overlappingShapeStrokeColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'overlay color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(overlayColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_overlayColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'overlay color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(overlayColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_overlayColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'valud indicator color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          sliderTheme: SliderThemeData(valueIndicatorColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderEditor_valueIndicatorColorPicker',
        color,
      );
    },
  );
}
