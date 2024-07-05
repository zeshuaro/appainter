import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

Future<void> main() async {
  const expandText = 'Floating action button';
  const floatingActionButtonThemeState = FloatingActionButtonThemeState();

  late FloatingActionButtonThemeCubit floatingActionButtonThemeCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    floatingActionButtonThemeCubit = MockFloatingActionButtonThemeCubit();
    colorThemeCubit = MockColorThemeCubit();

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(
    WidgetTester tester, [
    FloatingActionButtonThemeState? state,
  ]) async {
    when(() => floatingActionButtonThemeCubit.state).thenReturn(
      state ?? floatingActionButtonThemeState,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: floatingActionButtonThemeCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const FloatingActionButtonThemeEditor(),
            ),
          ),
        ),
      ),
    );
    await tester.expandWidget(expandText);
  }

  void expectBlocBuilder(
    WidgetTester tester,
    String key,
    FloatingActionButtonThemeState state,
  ) {
    tester.expectBlocBuilder<FloatingActionButtonThemeCubit,
        FloatingActionButtonThemeState>(
      key,
      floatingActionButtonThemeState,
      state,
    );
  }

  group('background color picker', () {
    const key = 'floatingActionButtonThemeEditor_backgroundColorPicker';

    testWidgets('render widget', (tester) async {
      final state = FloatingActionButtonThemeState.withTheme(
        backgroundColor: color,
      );
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        floatingActionButtonThemeCubit.backgroundColorChanged,
      );
    });
  });

  group('foreground color picker', () {
    const key = 'floatingActionButtonThemeEditor_foregroundColorPicker';

    testWidgets('render widget', (tester) async {
      final state = FloatingActionButtonThemeState.withTheme(
        foregroundColor: color,
      );
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        floatingActionButtonThemeCubit.foregroundColorChanged,
      );
    });
  });

  group('focus color picker', () {
    const key = 'floatingActionButtonThemeEditor_focusColorPicker';

    testWidgets('render widget', (tester) async {
      final state = FloatingActionButtonThemeState.withTheme(focusColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.12);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        floatingActionButtonThemeCubit.focusColorChanged,
      );
    });
  });

  group('hover color picker', () {
    const key = 'floatingActionButtonThemeEditor_hoverColorPicker';

    testWidgets('render widget', (tester) async {
      final state = FloatingActionButtonThemeState.withTheme(hoverColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.04);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        floatingActionButtonThemeCubit.hoverColorChanged,
      );
    });
  });

  group('splash color picker', () {
    const key = 'floatingActionButtonThemeEditor_splashColorPicker';

    testWidgets('render widget', (tester) async {
      final state = FloatingActionButtonThemeState.withTheme(
        splashColor: color,
      );
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.4);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        floatingActionButtonThemeCubit.splashColorChanged,
      );
    });
  });

  group('elevation text field', () {
    const key = 'floatingActionButtonThemeEditor_elevationTextField';

    testWidgets('render widget', (tester) async {
      final state = FloatingActionButtonThemeState.withTheme(
        elevation: doubleNum,
      );

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change value', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        floatingActionButtonThemeCubit.elevationChanged,
      );
    });
  });

  group('disabled elevation text field', () {
    const key = 'floatingActionButtonThemeEditor_disabledElevationTextField';

    testWidgets('render widget', (tester) async {
      final state = FloatingActionButtonThemeState.withTheme(
        disabledElevation: doubleNum,
      );

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change value', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        floatingActionButtonThemeCubit.disabledElevationChanged,
      );
    });
  });

  group('focus elevation text field', () {
    const key = 'floatingActionButtonThemeEditor_focusElevationTextField';

    testWidgets('render widget', (tester) async {
      final state = FloatingActionButtonThemeState.withTheme(
        focusElevation: doubleNum,
      );

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change value', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        floatingActionButtonThemeCubit.focusElevationChanged,
      );
    });
  });

  group('highlight elevation text field', () {
    const key = 'floatingActionButtonThemeEditor_highlightElevationTextField';

    testWidgets('render widget', (tester) async {
      final state = FloatingActionButtonThemeState.withTheme(
        highlightElevation: doubleNum,
      );

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change value', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        floatingActionButtonThemeCubit.highlightElevationChanged,
      );
    });
  });

  group('hover elevation text field', () {
    const key = 'floatingActionButtonThemeEditor_hoverElevationTextField';

    testWidgets('render widget', (tester) async {
      final state = FloatingActionButtonThemeState.withTheme(
        hoverElevation: doubleNum,
      );

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change value', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        floatingActionButtonThemeCubit.hoverElevationChanged,
      );
    });
  });
}
