import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../pump_app.dart';
import '../../../utils.dart';
import '../../../widget_testers.dart';

Future<void> main() async {
  final _widgetTesters = WidgetTesters(expandText: 'Elevated Button');
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

    await tester.pumpApp(
      ListView(
        children: const [
          ElevatedButtonEditor(),
        ],
      ),
      advancedThemeCubit: cubit,
    );
  }

  testWidgets('should display ElevatedButtonEditor', (tester) async {
    await tester.pumpApp(
      const ElevatedButtonEditor(),
      advancedThemeCubit: cubit,
    );
    expect(find.byType(ElevatedButtonEditor), findsOneWidget);
  });

  group('background color pickers', () {
    testWidgets(
      'enabled color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({null: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(backgroundColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonEditor_backgroundColor_enabled',
          color,
        );
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(backgroundColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonEditor_backgroundColor_disabled',
          color,
        );
      },
    );
  });

  group('foreground color pickers', () {
    testWidgets(
      'enabled color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({null: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(foregroundColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonEditor_foregroundColor_enabled',
          color,
        );
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(foregroundColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonEditor_foregroundColor_disabled',
          color,
        );
      },
    );
  });

  group('overlay color pickers', () {
    testWidgets(
      'hovered color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({MaterialState.hovered: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(overlayColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonEditor_overlayColor_hovered',
          color,
        );
      },
    );

    testWidgets(
      'focused color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({MaterialState.focused: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(overlayColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonEditor_overlayColor_focused',
          color,
        );
      },
    );

    testWidgets(
      'pressed color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({MaterialState.pressed: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(overlayColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonEditor_overlayColor_pressed',
          color,
        );
      },
    );
  });

  group('shadow color pickers', () {
    testWidgets(
      'all states color picker should update with selected color',
      (tester) async {
        final color = getRandomColor();
        final prop = getMaterialStateProperty({null: color});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(shadowColor: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkColorPicker(
          tester,
          'elevatedButtonEditor_shadowColor_allStates',
          color,
        );
      },
    );
  });

  group('elevation text fields', () {
    testWidgets(
      'enabled text field should update with value',
      (tester) async {
        final value = Random().nextDouble();
        final prop = getMaterialStateProperty({null: value});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(elevation: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkTextField(
          tester,
          'elevatedButtonEditor_elevationTextField_enabled',
          value,
        );
      },
    );

    testWidgets(
      'disabled text field should update with value',
      (tester) async {
        final value = Random().nextDouble();
        final prop = getMaterialStateProperty({MaterialState.disabled: value});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(elevation: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkTextField(
          tester,
          'elevatedButtonEditor_elevationTextField_disabled',
          value,
        );
      },
    );

    testWidgets(
      'hovered text field should update with value',
      (tester) async {
        final value = Random().nextDouble();
        final prop = getMaterialStateProperty({MaterialState.hovered: value});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(elevation: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkTextField(
          tester,
          'elevatedButtonEditor_elevationTextField_hovered',
          value,
        );
      },
    );

    testWidgets(
      'focused text field should update with value',
      (tester) async {
        final value = Random().nextDouble();
        final prop = getMaterialStateProperty({MaterialState.focused: value});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(elevation: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkTextField(
          tester,
          'elevatedButtonEditor_elevationTextField_focused',
          value,
        );
      },
    );

    testWidgets(
      'pressed text field should update with value',
      (tester) async {
        final value = Random().nextDouble();
        final prop = getMaterialStateProperty({MaterialState.pressed: value});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(elevation: prop),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await _widgetTesters.checkTextField(
          tester,
          'elevatedButtonEditor_elevationTextField_pressed',
          value,
        );
      },
    );
  });
}
