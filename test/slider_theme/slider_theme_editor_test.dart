import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/slider_theme/slider_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Slider');

  late SliderThemeCubit sliderThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late Color color;
  late double doubleValue;

  setUp(() {
    sliderThemeCubit = MockSliderThemeCubit();
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    when(() => sliderThemeCubit.state).thenReturn(const SliderThemeState());
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, SliderThemeState state) async {
    whenListen(
      sliderThemeCubit,
      Stream.fromIterable([const SliderThemeState(), state]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: sliderThemeCubit),
          BlocProvider.value(value: colorThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(item: const SliderThemeEditor()),
        ),
      ),
    );
  }

  testWidgets(
    'track height text field should update with value',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(trackHeight: doubleValue),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'sliderThemeEditor_trackHeightTextField',
        doubleValue,
      );
      verify(
        () => sliderThemeCubit.trackHeightChanged(doubleValue.toString()),
      ).called(1);
    },
  );

  testWidgets(
    'active track color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(activeTrackColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_activeTrackColorPicker',
        color,
      );
      verify(() => sliderThemeCubit.activeTrackColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'inactive track color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(inactiveTrackColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_inactiveTrackColorPicker',
        color,
      );
      verify(() => sliderThemeCubit.inactiveTrackColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'disabled active track color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(disabledActiveTrackColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_disabledActiveTrackColorPicker',
        color,
      );
      verify(
        () => sliderThemeCubit.disabledActiveTrackColorChanged(color),
      ).called(1);
    },
  );

  testWidgets(
    'disabled inactive track color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(disabledInactiveTrackColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_disabledInactiveTrackColorPicker',
        color,
      );
      verify(
        () => sliderThemeCubit.disabledInactiveTrackColorChanged(color),
      ).called(1);
    },
  );

  testWidgets(
    'active tick mark color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(activeTickMarkColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_activeTickMarkColorPicker',
        color,
      );
      verify(
        () => sliderThemeCubit.activeTickMarkColorChanged(color),
      ).called(1);
    },
  );

  testWidgets(
    'inactive tick mark color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(inactiveTickMarkColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_inactiveTickMarkColorPicker',
        color,
      );
      verify(
        () => sliderThemeCubit.inactiveTickMarkColorChanged(color),
      ).called(1);
    },
  );

  testWidgets(
    'disabled active tick mark color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(disabledActiveTickMarkColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_disabledActiveTickMarkColorPicker',
        color,
      );
      verify(
        () => sliderThemeCubit.disabledActiveTickMarkColorChanged(color),
      ).called(1);
    },
  );

  testWidgets(
    'disabled inactive tick mark color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(disabledInactiveTickMarkColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_disabledInactiveTickMarkColorPicker',
        color,
      );
      verify(
        () => sliderThemeCubit.disabledInactiveTickMarkColorChanged(color),
      ).called(1);
    },
  );

  testWidgets(
    'thumb color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(theme: SliderThemeData(thumbColor: color));

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_thumbColorPicker',
        color,
      );
      verify(() => sliderThemeCubit.thumbColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'disabled thumb color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(disabledThumbColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_disabledThumbColorPicker',
        color,
      );
      verify(() => sliderThemeCubit.disabledThumbColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'overlapping shapes stroke color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(overlappingShapeStrokeColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_overlappingShapeStrokeColorPicker',
        color,
      );
      verify(
        () => sliderThemeCubit.overlappingShapeStrokeColorChanged(color),
      ).called(1);
    },
  );

  testWidgets(
    'overlay color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(overlayColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_overlayColorPicker',
        color,
      );
      verify(() => sliderThemeCubit.overlayColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'valud indicator color picker should update with selected color',
    (tester) async {
      final state = SliderThemeState(
        theme: SliderThemeData(valueIndicatorColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'sliderThemeEditor_valueIndicatorColorPicker',
        color,
      );
      verify(
        () => sliderThemeCubit.valueIndicatorColorChanged(color),
      ).called(1);
    },
  );
}
