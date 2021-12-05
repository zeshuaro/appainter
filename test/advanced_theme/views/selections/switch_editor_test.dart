import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../pump_app.dart';
import '../../../utils.dart';
import '../../../widget_testers.dart';

void main() {
  final widget = MyExpansionPanelList(item: const SwitchEditor());
  final widgetTesters = WidgetTesters(expandText: 'Switch');

  late AdvancedThemeCubit cubit;
  late Color testColor;

  setUpAll(() {
    registerFallbackValue(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());

    testColor = getRandomColor();
  });

  Future<void> _pumpApp(WidgetTester tester, AdvancedThemeState state) async {
    whenListen(
      cubit,
      Stream.fromIterable([AdvancedThemeState(), state]),
    );

    await tester.pumpApp(widget, advancedThemeCubit: cubit);
  }

  testWidgets('shoud display SwitchEditor', (tester) async {
    await tester.pumpApp(widget, advancedThemeCubit: cubit);
    expect(find.byType(SwitchEditor), findsOneWidget);
  });

  group('thumb color pickers', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({null: testColor});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            switchTheme: SwitchThemeData(thumbColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchEditor_thumbColor_default',
          testColor,
        );
      },
    );

    testWidgets(
      'selected color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.selected: testColor,
        });
        final state = AdvancedThemeState(
          themeData: ThemeData(
            switchTheme: SwitchThemeData(thumbColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchEditor_thumbColor_selected',
          testColor,
        );
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.disabled: testColor,
        });
        final state = AdvancedThemeState(
          themeData: ThemeData(
            switchTheme: SwitchThemeData(thumbColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchEditor_thumbColor_disabled',
          testColor,
        );
      },
    );
  });

  group('track color pickers', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({null: testColor});
        final state = AdvancedThemeState(
          themeData: ThemeData(
            switchTheme: SwitchThemeData(trackColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchEditor_trackColor_default',
          testColor,
        );
      },
    );

    testWidgets(
      'selected color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.selected: testColor,
        });
        final state = AdvancedThemeState(
          themeData: ThemeData(
            switchTheme: SwitchThemeData(trackColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchEditor_trackColor_selected',
          testColor,
        );
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.disabled: testColor,
        });
        final state = AdvancedThemeState(
          themeData: ThemeData(
            switchTheme: SwitchThemeData(trackColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchEditor_trackColor_disabled',
          testColor,
        );
      },
    );
  });

  group('overlay color pickers', () {
    testWidgets(
      'pressed color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.pressed: testColor,
        });
        final state = AdvancedThemeState(
          themeData: ThemeData(
            switchTheme: SwitchThemeData(overlayColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchEditor_overlayColor_pressed',
          testColor,
        );
      },
    );

    testWidgets(
      'hovered color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.hovered: testColor,
        });
        final state = AdvancedThemeState(
          themeData: ThemeData(
            switchTheme: SwitchThemeData(overlayColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchEditor_overlayColor_hovered',
          testColor,
        );
      },
    );

    testWidgets(
      'focused color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.focused: testColor,
        });
        final state = AdvancedThemeState(
          themeData: ThemeData(
            switchTheme: SwitchThemeData(overlayColor: prop),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchEditor_overlayColor_focused',
          testColor,
        );
      },
    );
  });

  testWidgets(
    'splash radius text field should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          switchTheme: SwitchThemeData(splashRadius: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'switchEditor_splashRadiusTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
