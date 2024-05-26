import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

void main() {
  const expandText = 'Switch';
  const switchThemeState = SwitchThemeState();

  late SwitchThemeCubit switchThemeCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    switchThemeCubit = MockSwitchThemeCubit();
    colorThemeCubit = MockColorThemeCubit();

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(WidgetTester tester, [SwitchThemeState? state]) async {
    when(() => switchThemeCubit.state).thenReturn(state ?? switchThemeState);

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: switchThemeCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const SwitchThemeEditor(),
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
    SwitchThemeState state,
  ) {
    tester.expectBlocBuilder<SwitchThemeCubit, SwitchThemeState>(
      key,
      switchThemeState,
      state,
    );
  }

  group('thumb color pickers', () {
    group('default', () {
      const key = 'switchThemeEditor_thumbColor_default';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = SwitchThemeState.withTheme(thumbColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          switchThemeCubit.thumbDefaultColorChanged,
        );
      });
    });

    group('selected', () {
      const key = 'switchThemeEditor_thumbColor_selected';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.selected: color});
        final state = SwitchThemeState.withTheme(thumbColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          switchThemeCubit.thumbSelectedColorChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'switchThemeEditor_thumbColor_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.disabled: color});
        final state = SwitchThemeState.withTheme(thumbColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          switchThemeCubit.thumbDisabledColorChanged,
        );
      });
    });
  });

  group('track color pickers', () {
    group('default', () {
      const key = 'switchThemeEditor_trackColor_default';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = SwitchThemeState.withTheme(trackColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.32);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          switchThemeCubit.trackDefaultColorChanged,
        );
      });
    });

    group('selected', () {
      const key = 'switchThemeEditor_trackColor_selected';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.selected: color});
        final state = SwitchThemeState.withTheme(trackColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.5);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          switchThemeCubit.trackSelectedColorChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'switchThemeEditor_trackColor_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.disabled: color});
        final state = SwitchThemeState.withTheme(trackColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          switchThemeCubit.trackDisabledColorChanged,
        );
      });
    });
  });

  group('overlay color pickers', () {
    group('pressed', () {
      const key = 'switchThemeEditor_overlayColor_pressed';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.pressed: color});
        final state = SwitchThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          switchThemeCubit.overlayPressedColorChanged,
        );
      });
    });

    group('hovered', () {
      const key = 'switchThemeEditor_overlayColor_hovered';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.hovered: color});
        final state = SwitchThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.04);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          switchThemeCubit.overlayHoveredColorChanged,
        );
      });
    });

    group('focused', () {
      const key = 'switchThemeEditor_overlayColor_focused';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.focused: color});
        final state = SwitchThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          switchThemeCubit.overlayFocusedColorChanged,
        );
      });
    });
  });

  group('splash radius text field', () {
    const key = 'switchThemeEditor_splashRadiusTextField';

    testWidgets('render widget', (tester) async {
      final state = SwitchThemeState.withTheme(splashRadius: doubleNum);

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change text', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        switchThemeCubit.splashRadiusChanged,
      );
    });
  });

  group('material tap target size dropdown', () {
    const key = 'switchThemeEditor_materialTapTargetSizeDropdown';

    for (var size in MaterialTapTargetSize.values) {
      final sizeStr = UtilService.enumToString(size);

      testWidgets('render $size', (tester) async {
        final state = SwitchThemeState.withTheme(materialTapTargetSize: size);

        await pumpApp(tester, state);

        await tester.expectDropdown(key, sizeStr);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change $size', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          sizeStr,
          switchThemeCubit.materialTapTargetSize,
        );
      });
    }
  });
}
