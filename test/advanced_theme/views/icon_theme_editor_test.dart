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
  final widgetTesters = WidgetTesters(expandText: 'Icon Theme');
  late AdvancedThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue<AdvancedThemeState>(FakeAdvancedThemeState());
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

    await tester.pumpApp(const IconThemeEditor(), advancedThemeCubit: cubit);
  }

  testWidgets('displays IconThemeEditor', (tester) async {
    await tester.pumpApp(const IconThemeEditor(), advancedThemeCubit: cubit);
    expect(find.byType(IconThemeEditor), findsOneWidget);
  });

  testWidgets(
    'color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          iconTheme: IconThemeData(color: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'iconThemeEditor_iconThemeCard',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'size text field should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          iconTheme: IconThemeData(size: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'iconThemeCard_sizeTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'opacity text field should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          iconTheme: IconThemeData(opacity: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'iconThemeCard_opacityTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
