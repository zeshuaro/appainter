import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../pump_app.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widget = MyExpansionPanelList(
    item: const BottomNavigationBarThemeEditor(),
  );
  final widgetTesters = WidgetTesters(expandText: 'Bottom Navigation Bar');

  late MockAdvancedThemeCubit advancedThemeCubit;
  late MockBottomNavigationBarThemeCubit bottomNavigationBarThemeCubit;
  late Color color;
  late double doubleValue;

  setUpAll(() {
    registerFallbackValue(FakeAdvancedThemeState());
    registerFallbackValue(FakeBottomNavigationBarThemeState());
  });

  setUp(() {
    advancedThemeCubit = MockAdvancedThemeCubit();
    bottomNavigationBarThemeCubit = MockBottomNavigationBarThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    when(() => advancedThemeCubit.state).thenReturn(AdvancedThemeState());
    when(() {
      return bottomNavigationBarThemeCubit.state;
    }).thenReturn(const BottomNavigationBarThemeState());
  });

  Future<void> _pumpApp(
    WidgetTester tester,
    BottomNavigationBarThemeState state,
  ) async {
    whenListen(
      bottomNavigationBarThemeCubit,
      Stream.fromIterable([const BottomNavigationBarThemeState(), state]),
    );

    await tester.pumpApp(
      widget,
      advancedThemeCubit: advancedThemeCubit,
      bottomNavigationBarThemeCubit: bottomNavigationBarThemeCubit,
    );
  }

  testWidgets(
    'should display BottomNavigationBarThemeEditor',
    (tester) async {
      await tester.pumpApp(
        widget,
        advancedThemeCubit: advancedThemeCubit,
        bottomNavigationBarThemeCubit: bottomNavigationBarThemeCubit,
      );
      expect(find.byType(BottomNavigationBarThemeEditor), findsOneWidget);
    },
  );

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      final state = BottomNavigationBarThemeState(
        theme: BottomNavigationBarThemeData(backgroundColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'bottomNavigationBarThemeEditor_backgroundColorPicker',
        color,
      );
      verify(() {
        bottomNavigationBarThemeCubit.backgroundColorChanged(color);
      }).called(1);
    },
  );

  testWidgets(
    'selected item color picker should update with selected color',
    (tester) async {
      final state = BottomNavigationBarThemeState(
        theme: BottomNavigationBarThemeData(selectedItemColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'bottomNavigationBarThemeEditor_selectedItemColorPicker',
        color,
      );
      verify(() {
        bottomNavigationBarThemeCubit.selectedItemColorChanged(color);
      }).called(1);
    },
  );

  testWidgets(
    'unselected item color picker should update with selected color',
    (tester) async {
      final state = BottomNavigationBarThemeState(
        theme: BottomNavigationBarThemeData(unselectedItemColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'bottomNavigationBarThemeEditor_unselectedItemColorPicker',
        color,
      );
      verify(() {
        bottomNavigationBarThemeCubit.unselectedItemColorChanged(color);
      }).called(1);
    },
  );

  group('test show selected labels switch', () {
    for (var isShow in [true, false]) {
      testWidgets(
        'should be toggled to $isShow',
        (tester) async {
          final state = BottomNavigationBarThemeState(
            theme: BottomNavigationBarThemeData(showSelectedLabels: isShow),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkSwitch(
            tester,
            'bottomNavigationBarThemeEditor_showSelectedLabelsSwitch',
            isShow,
          );
          verify(() {
            bottomNavigationBarThemeCubit.showSelectedLabelsChanged(!isShow);
          }).called(1);
        },
      );
    }
  });

  group('test show unselected labels switch', () {
    for (var isShow in [true, false]) {
      testWidgets(
        'should be toggled to $isShow',
        (tester) async {
          final state = BottomNavigationBarThemeState(
            theme: BottomNavigationBarThemeData(showUnselectedLabels: isShow),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkSwitch(
            tester,
            'bottomNavigationBarThemeEditor_showUnselectedLabelsSwitch',
            isShow,
          );
          verify(() {
            bottomNavigationBarThemeCubit.showUnselectedLabelsChanged(!isShow);
          }).called(1);
        },
      );
    }
  });

  testWidgets(
    'elevation text field should update with value',
    (tester) async {
      final state = BottomNavigationBarThemeState(
        theme: BottomNavigationBarThemeData(elevation: doubleValue),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'bottomNavigationBarThemeEditor_elevationTextField',
        doubleValue,
      );
      verify(() {
        bottomNavigationBarThemeCubit.elevationChanged(doubleValue.toString());
      }).called(1);
    },
  );
}
