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

  testWidgets('displays IconThemeEditor', (tester) async {
    await tester.pumpApp(IconThemeEditor(), advancedThemeCubit: cubit);
    expect(find.byType(IconThemeEditor), findsOneWidget);
  });

  testWidgets(
    'color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final theme = IconThemeData(color: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(iconTheme: theme)),
      );

      await tester.pumpApp(IconThemeEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'iconThemeEditor_iconThemeCard',
        color,
      );
    },
  );

  testWidgets(
    'size text field should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final theme = IconThemeData(size: value);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(iconTheme: theme)),
      );

      await tester.pumpApp(IconThemeEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkTextField(
        tester,
        'iconThemeCard_sizeTextField',
        value,
      );
    },
  );

  testWidgets(
    'opacity text field should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final theme = IconThemeData(opacity: value);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(iconTheme: theme)),
      );

      await tester.pumpApp(IconThemeEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkTextField(
        tester,
        'iconThemeCard_opacityTextField',
        value,
      );
    },
  );
}
