import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

void main() {
  const expandText = 'Colors';
  final colorThemeState = ColorThemeState();

  late ColorThemeCubit colorThemeCubit;
  late AdvancedThemeCubit advancedThemeCubit;
  late Color color;

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    advancedThemeCubit = MockAdvancedThemeCubit();
    color = getRandomColor();
  });

  Future<void> pumpApp(WidgetTester tester, [ColorThemeState? state]) async {
    when(() => colorThemeCubit.state).thenReturn(state ?? colorThemeState);

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: colorThemeCubit),
            BlocProvider.value(value: advancedThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const ColorThemeEditor(),
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
    ColorThemeState state,
  ) {
    tester.expectBlocBuilder<ColorThemeCubit, ColorThemeState>(
      key,
      colorThemeState,
      state,
    );
  }

  group('primary color picker', () {
    const key = 'colorThemeEditor_primaryColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(primaryColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    for (var isDark in [true, false]) {
      testWidgets('change color with isDark=$isDark', (tester) async {
        when(() => advancedThemeCubit.state).thenReturn(
          AdvancedThemeState(isDark: isDark),
        );

        await pumpApp(tester);

        await tester.pickColor(key, color);
        verify(() => colorThemeCubit.primaryColorChanged(color, isDark)).called(
          1,
        );
      });
    }
  });

  group('secondary color picker', () {
    const key = 'colorThemeEditor_secondaryColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(
        colorScheme: const ColorScheme.light().copyWith(secondary: color),
      );

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    for (var isDark in [true, false]) {
      testWidgets('change color with isDark=$isDark', (tester) async {
        when(() => advancedThemeCubit.state).thenReturn(
          AdvancedThemeState(isDark: isDark),
        );

        await pumpApp(tester);

        await tester.pickColor(key, color);
        verify(() {
          colorThemeCubit.secondaryColorChanged(color, isDark);
        }).called(1);
      });
    }
  });

  group('primary color light picker', () {
    const key = 'colorThemeEditor_primaryColorLightPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(primaryColorLight: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        colorThemeCubit.primaryColorLightChanged,
      );
    });
  });

  group('primary color dark picker', () {
    const key = 'colorThemeEditor_primaryColorDarkPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(primaryColorDark: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        colorThemeCubit.primaryColorDarkChanged,
      );
    });
  });

  group('background color picker', () {
    const key = 'colorThemeEditor_surfaceColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(
        colorScheme: const ColorScheme.light().copyWith(surface: color),
      );

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        colorThemeCubit.surfaceColorChanged,
      );
    });
  });

  group('canvas color picker', () {
    const key = 'colorThemeEditor_canvasColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(canvasColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        colorThemeCubit.canvasColorChanged,
      );
    });
  });

  group('card color picker', () {
    const key = 'colorThemeEditor_cardColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(cardColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        colorThemeCubit.cardColorChanged,
      );
    });
  });

  group('dialog background color picker', () {
    const key = 'colorThemeEditor_dialogBackgroundColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(dialogBackgroundColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        colorThemeCubit.dialogBackgroundColorChanged,
      );
    });
  });

  group('disabled color picker', () {
    const key = 'colorThemeEditor_disabledColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(disabledColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.38);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        colorThemeCubit.disabledColorChanged,
      );
    });
  });

  group('divider color picker', () {
    const key = 'colorThemeEditor_dividerColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(dividerColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        colorThemeCubit.dividerColorChanged,
      );
    });
  });

  group('error color picker', () {
    const key = 'colorThemeEditor_errorColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(
        colorScheme: const ColorScheme.light().copyWith(error: color),
      );

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        colorThemeCubit.errorColorChanged,
      );
    });
  });

  group('focus color picker', () {
    const key = 'colorThemeEditor_focusColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(focusColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.12);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        colorThemeCubit.focusColorChanged,
      );
    });
  });

  group('highlight color picker', () {
    const key = 'colorThemeEditor_highlightColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(highlightColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.4);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        colorThemeCubit.highlightColorChanged,
      );
    });
  });

  group('hint color picker', () {
    const key = 'colorThemeEditor_hintColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(hintColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.6);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        colorThemeCubit.hintColorChanged,
      );
    });
  });

  group('hover color picker', () {
    const key = 'colorThemeEditor_hoverColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(hoverColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.04);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        colorThemeCubit.hoverColorChanged,
      );
    });
  });

  group('indicator color picker', () {
    const key = 'colorThemeEditor_indicatorColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(indicatorColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        colorThemeCubit.indicatorColorChanged,
      );
    });
  });

  group('scaffold background color picker', () {
    const key = 'colorThemeEditor_scaffoldBackgroundColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(scaffoldBackgroundColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        colorThemeCubit.scaffoldBackgroundColorChanged,
      );
    });
  });

  group('secondary header background color picker', () {
    const key = 'colorThemeEditor_secondaryHeaderColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(secondaryHeaderColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        colorThemeCubit.secondaryHeaderColorChanged,
      );
    });
  });

  group('shadow color picker', () {
    const key = 'colorThemeEditor_shadowColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(shadowColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        colorThemeCubit.shadowColorChanged,
      );
    });
  });

  group('splash color picker', () {
    const key = 'colorThemeEditor_splashColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(splashColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.4);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        colorThemeCubit.splashColorChanged,
      );
    });
  });

  group('unselected widget color picker', () {
    const key = 'colorThemeEditor_unselectedWidgetColorPicker';

    testWidgets('render widget', (tester) async {
      final state = ColorThemeState(unselectedWidgetColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.54);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        colorThemeCubit.unselectedWidgetColorChanged,
      );
    });
  });
}
