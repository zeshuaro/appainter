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
  final widgetTesters = WidgetTesters(expandText: 'Bottom Navigation Bar');
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

    await tester.pumpApp(const BottomNavBarEditor(), advancedThemeCubit: cubit);
  }

  testWidgets('displays BottomNavBarEditor', (tester) async {
    await tester.pumpApp(const BottomNavBarEditor(), advancedThemeCubit: cubit);
    expect(find.byType(BottomNavBarEditor), findsOneWidget);
  });

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: color,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'bottomNavBarEditor_bgColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'selected item color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: color,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'bottomNavBarEditor_selectedItemColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'unselected item color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            unselectedItemColor: color,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'bottomNavBarEditor_unselectedItemColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  for (var isShow in [true, false]) {
    testWidgets(
      'show selected labels switch should be toggled with $isShow',
      (tester) async {
        final state = AdvancedThemeState(
          themeData: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              showSelectedLabels: isShow,
            ),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkSwitch(
          tester,
          'bottomNavBarEditor_showSelectedLabelsSwitch',
          isShow,
        );

        final expectedState = AdvancedThemeState(
          themeData: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              showSelectedLabels: !isShow,
            ),
          ),
        );
        verify(() => cubit.emit(expectedState)).called(1);
      },
    );

    testWidgets(
      'show unselected labels switch should be toggled with $isShow',
      (tester) async {
        final state = AdvancedThemeState(
          themeData: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              showUnselectedLabels: isShow,
            ),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkSwitch(
          tester,
          'bottomNavBarEditor_showUnselectedLabelsSwitch',
          isShow,
        );
        final expectedState = AdvancedThemeState(
          themeData: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              showUnselectedLabels: !isShow,
            ),
          ),
        );
        verify(() => cubit.emit(expectedState)).called(1);
      },
    );
  }

  testWidgets(
    'elevation text field should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: value,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'bottomNavBarEditor_elevationTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
