import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_testers.dart';
import '../../../pump_app.dart';
import '../../../utils.dart';

void main() {
  final widget = MyExpansionPanelList(item: const BodyText1Editor());
  final widgetTesters = WidgetTesters(expandText: 'Body Text 1');
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

    await tester.pumpApp(widget, advancedThemeCubit: cubit);
  }

  testWidgets('should display BodyText1Editor', (tester) async {
    await tester.pumpApp(widget, advancedThemeCubit: cubit);
    expect(find.byType(BodyText1Editor), findsOneWidget);
  });

  testWidgets(
    'color picker should be updated with color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: color),
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(tester, 'colorPicker', color);
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'background color picker should be updated with color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(backgroundColor: color),
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'backgroundColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'font size text field should be updated with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: value),
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(tester, 'fontSizeTextField', value);
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'letter spacing text field should be updated with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(letterSpacing: value),
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'letterSpacingTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'word spacing text field should be updated with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(wordSpacing: value),
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(tester, 'wordSpacingTextField', value);
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'height text field should be updated with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(height: value),
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(tester, 'heightTextField', value);
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'decoration color picker should be updated with color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(decorationColor: color),
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'decorationColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'decoration thickness text field should be updated with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(decorationThickness: value),
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'decorationThicknessTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
