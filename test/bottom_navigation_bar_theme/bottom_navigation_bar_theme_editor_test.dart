import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/services/util_service.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Bottom Navigation Bar');

  late AdvancedThemeCubit advancedThemeCubit;
  late BottomNavigationBarThemeCubit bottomNavigationBarThemeCubit;
  late Color color;
  late double doubleValue;

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

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: advancedThemeCubit),
          BlocProvider.value(value: bottomNavigationBarThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(
            item: const BottomNavigationBarThemeEditor(),
          ),
        ),
      ),
    );
  }

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

  group('test type dropdown', () {
    for (var type in BottomNavigationBarType.values) {
      final typeStr = UtilService.enumToString(type);

      testWidgets(
        'should update to $type',
        (tester) async {
          final state = BottomNavigationBarThemeState(
            theme: BottomNavigationBarThemeData(type: type),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkDropbox(
            tester,
            'bottomNavigationBarThemeEditor_typeDropdown',
            typeStr,
          );
          verify(() {
            bottomNavigationBarThemeCubit.typeChanged(typeStr);
          }).called(1);
        },
      );
    }
  });
}
