import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Switch');

  late SwitchThemeCubit switchThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late Color color;
  late double doubleValue;

  setUp(() {
    switchThemeCubit = MockSwitchThemeCubit();
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    when(() => switchThemeCubit.state).thenReturn(const SwitchThemeState());
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(WidgetTester tester, SwitchThemeState state) async {
    whenListen(
      switchThemeCubit,
      Stream.fromIterable([const SwitchThemeState(), state]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: switchThemeCubit),
          BlocProvider.value(value: colorThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(item: const SwitchThemeEditor()),
        ),
      ),
    );
  }

  group('test thumb colors', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = SwitchThemeState(
          theme: SwitchThemeData(thumbColor: prop),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchThemeEditor_thumbColor_default',
          color,
        );
        verify(
          () => switchThemeCubit.thumbDefaultColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'selected color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.selected: color,
        });
        final state = SwitchThemeState(
          theme: SwitchThemeData(thumbColor: prop),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchThemeEditor_thumbColor_selected',
          color,
        );
        verify(
          () => switchThemeCubit.thumbSelectedColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.disabled: color,
        });
        final state = SwitchThemeState(
          theme: SwitchThemeData(thumbColor: prop),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchThemeEditor_thumbColor_disabled',
          color,
        );
        verify(
          () => switchThemeCubit.thumbDisabledColorChanged(color),
        ).called(1);
      },
    );
  });

  group('test track colors', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = SwitchThemeState(
          theme: SwitchThemeData(trackColor: prop),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchThemeEditor_trackColor_default',
          color,
        );
        verify(
          () => switchThemeCubit.trackDefaultColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'selected color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.selected: color,
        });
        final state = SwitchThemeState(
          theme: SwitchThemeData(trackColor: prop),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchThemeEditor_trackColor_selected',
          color,
        );
        verify(
          () => switchThemeCubit.trackSelectedColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.disabled: color,
        });
        final state = SwitchThemeState(
          theme: SwitchThemeData(trackColor: prop),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchThemeEditor_trackColor_disabled',
          color,
        );
        verify(
          () => switchThemeCubit.trackDisabledColorChanged(color),
        ).called(1);
      },
    );
  });

  group('test overlay colors', () {
    testWidgets(
      'pressed color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.pressed: color,
        });
        final state = SwitchThemeState(
          theme: SwitchThemeData(overlayColor: prop),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchThemeEditor_overlayColor_pressed',
          color,
        );
        verify(
          () => switchThemeCubit.overlayPressedColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'hovered color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.hovered: color,
        });
        final state = SwitchThemeState(
          theme: SwitchThemeData(overlayColor: prop),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchThemeEditor_overlayColor_hovered',
          color,
        );
        verify(
          () => switchThemeCubit.overlayHoveredColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'focused color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.focused: color,
        });
        final state = SwitchThemeState(
          theme: SwitchThemeData(overlayColor: prop),
        );

        await pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'switchThemeEditor_overlayColor_focused',
          color,
        );
        verify(
          () => switchThemeCubit.overlayFocusedColorChanged(color),
        ).called(1);
      },
    );
  });

  testWidgets(
    'splash radius text field should update with value',
    (tester) async {
      final state = SwitchThemeState(
        theme: SwitchThemeData(splashRadius: doubleValue),
      );

      await pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'switchThemeEditor_splashRadiusTextField',
        doubleValue,
      );
      verify(
        () => switchThemeCubit.splashRadiusChanged(doubleValue.toString()),
      ).called(1);
    },
  );

  group('test material tap target size dropdown', () {
    for (var size in MaterialTapTargetSize.values) {
      final sizeStr = UtilService.enumToString(size);

      testWidgets(
        'should update to $size',
        (tester) async {
          final state = SwitchThemeState(
            theme: SwitchThemeData(materialTapTargetSize: size),
          );

          await pumpApp(tester, state);

          await widgetTesters.checkDropbox(
            tester,
            'switchThemeEditor_materialTapTargetSizeDropdown',
            sizeStr,
          );
          verify(
            () => switchThemeCubit.materialTapTargetSize(sizeStr),
          ).called(1);
        },
      );
    }
  });
}
