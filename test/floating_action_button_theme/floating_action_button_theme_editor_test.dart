import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../pump_app.dart';
import '../utils.dart';
import '../widget_testers.dart';

Future<void> main() async {
  final widget = MyExpansionPanelList(
    item: const FloatingActionButtonThemeEditor(),
  );
  final _widgetTesters = WidgetTesters(expandText: 'Floating Action Button');

  late FloatingActionButtonThemeCubit cubit;
  late Color color;
  late double doubleValue;

  setUp(() {
    cubit = MockFloatingActionButtonThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    when(() => cubit.state).thenReturn(const FloatingActionButtonThemeState());
  });

  Future<void> _pumpApp(
    WidgetTester tester,
    FloatingActionButtonThemeState state,
  ) async {
    whenListen(
      cubit,
      Stream.fromIterable([const FloatingActionButtonThemeState(), state]),
    );

    await tester.pumpApp(widget, floatingActionButtonThemeCubit: cubit);
  }

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(backgroundColor: color),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionButtonThemeEditor_backgroundColorPicker',
        color,
      );
      verify(() => cubit.backgroundColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'foregound color picker should update with selected color',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(foregroundColor: color),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionButtonThemeEditor_foregroundColorPicker',
        color,
      );
      verify(() => cubit.foregroundColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'focus color picker should update with selected color',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(focusColor: color),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionButtonThemeEditor_focusColorPicker',
        color,
      );
      verify(() => cubit.focusColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'hover color picker should update with selected color',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(hoverColor: color),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionButtonThemeEditor_hoverColorPicker',
        color,
      );
      verify(() => cubit.hoverColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'splash color picker should update with selected color',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(splashColor: color),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionButtonThemeEditor_splashColorPicker',
        color,
      );
      verify(() => cubit.splashColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'elevation should update with value',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(elevation: doubleValue),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(
        tester,
        'floatingActionButtonThemeEditor_elevationTextField',
        doubleValue,
      );
      verify(() => cubit.elevationChanged(doubleValue.toString())).called(1);
    },
  );

  testWidgets(
    'disabled elevation should update with value',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(disabledElevation: doubleValue),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(
        tester,
        'floatingActionButtonThemeEditor_disabledElevationTextField',
        doubleValue,
      );
      verify(() {
        cubit.disabledElevationChanged(doubleValue.toString());
      }).called(1);
    },
  );

  testWidgets(
    'focus elevation should update with value',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(focusElevation: doubleValue),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(
        tester,
        'floatingActionButtonThemeEditor_focusElevationTextField',
        doubleValue,
      );
      verify(() {
        cubit.focusElevationChanged(doubleValue.toString());
      }).called(1);
    },
  );

  testWidgets(
    'highlight elevation should update with value',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(highlightElevation: doubleValue),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(
        tester,
        'floatingActionButtonThemeEditor_highlightElevationTextField',
        doubleValue,
      );
      verify(() {
        cubit.highlightElevationChanged(doubleValue.toString());
      }).called(1);
    },
  );

  testWidgets(
    'hover elevation should update with value',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(hoverElevation: doubleValue),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(
        tester,
        'floatingActionButtonThemeEditor_hoverElevationTextField',
        doubleValue,
      );
      verify(() {
        cubit.hoverElevationChanged(doubleValue.toString());
      }).called(1);
    },
  );
}
