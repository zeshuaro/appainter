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
  final widgetTesters = WidgetTesters(expandText: 'App Bar');
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

    await tester.pumpApp(const AppBarEditor(), advancedThemeCubit: cubit);
  }

  testWidgets('should display AppBarEditor', (tester) async {
    await tester.pumpApp(const AppBarEditor(), advancedThemeCubit: cubit);
    expect(find.byType(AppBarEditor), findsOneWidget);
  });

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'appbarEditor_backgroundColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'foreground color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          appBarTheme: AppBarTheme(foregroundColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'appbarEditor_foregroundColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          appBarTheme: AppBarTheme(elevation: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'appbarEditor_elevationTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'shadow color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          appBarTheme: AppBarTheme(shadowColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'appbarEditor_shadowColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  group('test center title', () {
    for (var isCenter in [true, false]) {
      testWidgets(
        'center title should be toggled to $isCenter',
        (tester) async {
          final state = AdvancedThemeState(
            themeData: ThemeData(
              appBarTheme: AppBarTheme(centerTitle: isCenter),
            ),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkSwitch(
            tester,
            'appbarEditor_centerTitleSwitch',
            isCenter,
          );

          final expectedState = AdvancedThemeState(
            themeData: ThemeData(
              appBarTheme: AppBarTheme(centerTitle: !isCenter),
            ),
          );
          verify(() => cubit.emit(expectedState)).called(1);
        },
      );
    }
  });

  testWidgets(
    'title spacing should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          appBarTheme: AppBarTheme(titleSpacing: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'appbarEditor_titleSpacingTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'tool bar height should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          appBarTheme: AppBarTheme(toolbarHeight: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'appbarEditor_toolBarHeightTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
