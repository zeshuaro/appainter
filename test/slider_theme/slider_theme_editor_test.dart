import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/slider_theme/slider_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

void main() {
  const expandText = 'Slider';
  const sliderThemeState = SliderThemeState();

  late SliderThemeCubit sliderThemeCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    sliderThemeCubit = MockSliderThemeCubit();
    colorThemeCubit = MockColorThemeCubit();

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(WidgetTester tester, [SliderThemeState? state]) async {
    when(() => sliderThemeCubit.state).thenReturn(state ?? sliderThemeState);

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: sliderThemeCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const SliderThemeEditor(),
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
    SliderThemeState state,
  ) {
    tester.expectBlocBuilder<SliderThemeCubit, SliderThemeState>(
      key,
      sliderThemeState,
      state,
    );
  }

  group('track height text field', () {
    const key = 'sliderThemeEditor_trackHeightTextField';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(trackHeight: doubleNum);

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change value', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        sliderThemeCubit.trackHeightChanged,
      );
    });
  });

  group('active track color picker', () {
    const key = 'sliderThemeEditor_activeTrackColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(activeTrackColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        sliderThemeCubit.activeTrackColorChanged,
      );
    });
  });

  group('inactive track color picker', () {
    const key = 'sliderThemeEditor_inactiveTrackColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(inactiveTrackColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.24);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        sliderThemeCubit.inactiveTrackColorChanged,
      );
    });
  });

  group('disabled active track color picker', () {
    const key = 'sliderThemeEditor_disabledActiveTrackColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(disabledActiveTrackColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.32);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        sliderThemeCubit.disabledActiveTrackColorChanged,
      );
    });
  });

  group('disabled inactive track color picker', () {
    const key = 'sliderThemeEditor_disabledInactiveTrackColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(
        disabledInactiveTrackColor: color,
      );
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.12);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        sliderThemeCubit.disabledInactiveTrackColorChanged,
      );
    });
  });

  group('active tick mark color picker', () {
    const key = 'sliderThemeEditor_activeTickMarkColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(activeTickMarkColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.54);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        sliderThemeCubit.activeTickMarkColorChanged,
      );
    });
  });

  group('inactive tick mark color picker', () {
    const key = 'sliderThemeEditor_inactiveTickMarkColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(inactiveTickMarkColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.54);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        sliderThemeCubit.inactiveTickMarkColorChanged,
      );
    });
  });

  group('disabled active tick mark color picker', () {
    const key = 'sliderThemeEditor_disabledActiveTickMarkColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(
        disabledActiveTickMarkColor: color,
      );
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.12);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        sliderThemeCubit.disabledActiveTickMarkColorChanged,
      );
    });
  });

  group('disabled inactive tick mark color picker', () {
    const key = 'sliderThemeEditor_disabledInactiveTrackColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(
        disabledInactiveTrackColor: color,
      );
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.12);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        sliderThemeCubit.disabledInactiveTrackColorChanged,
      );
    });
  });

  group('thumb color picker', () {
    const key = 'sliderThemeEditor_thumbColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(thumbColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        sliderThemeCubit.thumbColorChanged,
      );
    });
  });

  group('disabled thumb color picker', () {
    const key = 'sliderThemeEditor_disabledThumbColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(disabledThumbColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.32);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        sliderThemeCubit.disabledThumbColorChanged,
      );
    });
  });

  group('overlapping shapes stroke color picker', () {
    const key = 'sliderThemeEditor_overlappingShapeStrokeColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(
        overlappingShapeStrokeColor: color,
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
        sliderThemeCubit.overlappingShapeStrokeColorChanged,
      );
    });
  });

  group('overlay color picker', () {
    const key = 'sliderThemeEditor_overlayColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(overlayColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.12);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        sliderThemeCubit.overlayColorChanged,
      );
    });
  });

  group('value indicator color picker', () {
    const key = 'sliderThemeEditor_valueIndicatorColorPicker';

    testWidgets('render widget', (tester) async {
      final state = SliderThemeState.withTheme(valueIndicatorColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        sliderThemeCubit.valueIndicatorColorChanged,
      );
    });
  });
}
