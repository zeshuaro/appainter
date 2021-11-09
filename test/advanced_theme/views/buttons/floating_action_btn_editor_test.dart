import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../../pump_app.dart';
import '../../../utils.dart';
import '../../../widget_testers.dart';

class MockAdvancedThemeCubit extends MockCubit<AdvancedThemeState>
    implements AdvancedThemeCubit {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

Future<void> main() async {
  final _widgetTesters = WidgetTesters(expandText: 'Floating Action Button');
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

    await tester.pumpApp(
      const FloatingActionBtnEditor(),
      advancedThemeCubit: cubit,
    );
  }

  testWidgets('displays FloatingActionBtnEditor', (tester) async {
    await tester.pumpApp(
      const FloatingActionBtnEditor(),
      advancedThemeCubit: cubit,
    );
    expect(find.byType(FloatingActionBtnEditor), findsOneWidget);
  });

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: color,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionBtnEditor_bgColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'foregound color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: color,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionBtnEditor_fgColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'focus color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            focusColor: color,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionBtnEditor_focusColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'hover color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            hoverColor: color,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionBtnEditor_hoverColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'splash color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            splashColor: color,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionBtnEditor_splashColorPicker',
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
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: value,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(
        tester,
        'floatingActionBtnEditor_elevationTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'disabled elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            disabledElevation: value,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(
        tester,
        'floatingActionBtnEditor_disabledElevationTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'focus elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            focusElevation: value,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(
        tester,
        'floatingActionBtnEditor_focusElevationTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'highlight elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            highlightElevation: value,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(
        tester,
        'floatingActionBtnEditor_highlightElevationTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'hover elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            hoverElevation: value,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(
        tester,
        'floatingActionBtnEditor_hoverElevationTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
