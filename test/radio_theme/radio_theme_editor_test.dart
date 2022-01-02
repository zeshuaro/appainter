import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Radio');

  late RadioThemeCubit radioThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late Color color;
  late double doubleValue;

  setUp(() {
    radioThemeCubit = MockRadioThemeCubit();
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    when(() => radioThemeCubit.state).thenReturn(const RadioThemeState());
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, RadioThemeState state) async {
    whenListen(
      radioThemeCubit,
      Stream.fromIterable([const RadioThemeState(), state]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: radioThemeCubit),
          BlocProvider.value(value: colorThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(item: const RadioThemeEditor()),
        ),
      ),
    );
  }

  group('test fill colors', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = RadioThemeState(theme: RadioThemeData(fillColor: prop));

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'radioThemeEditor_fillColor_default',
          color,
        );
        verify(() => radioThemeCubit.fillDefaultColorChanged(color)).called(1);
      },
    );

    testWidgets(
      'selected color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.selected: color,
        });
        final state = RadioThemeState(theme: RadioThemeData(fillColor: prop));

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'radioThemeEditor_fillColor_selected',
          color,
        );
        verify(() => radioThemeCubit.fillSelectedColorChanged(color)).called(1);
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.disabled: color,
        });
        final state = RadioThemeState(theme: RadioThemeData(fillColor: prop));

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'radioThemeEditor_fillColor_disabled',
          color,
        );
        verify(() => radioThemeCubit.fillDisabledColorChanged(color)).called(1);
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
        final state =
            RadioThemeState(theme: RadioThemeData(overlayColor: prop));

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'radioThemeEditor_overlayColor_pressed',
          color,
        );
        verify(
          () => radioThemeCubit.overlayPressedColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'hovered color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.hovered: color,
        });
        final state =
            RadioThemeState(theme: RadioThemeData(overlayColor: prop));

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'radioThemeEditor_overlayColor_hovered',
          color,
        );
        verify(
          () => radioThemeCubit.overlayHoveredColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'focused color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.focused: color,
        });
        final state =
            RadioThemeState(theme: RadioThemeData(overlayColor: prop));

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'radioThemeEditor_overlayColor_focused',
          color,
        );
        verify(
          () => radioThemeCubit.overlayFocusedColorChanged(color),
        ).called(1);
      },
    );
  });

  testWidgets(
    'splash radius text field should update with value',
    (tester) async {
      final state = RadioThemeState(
        theme: RadioThemeData(splashRadius: doubleValue),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'radioThemeEditor_splashRadiusTextField',
        doubleValue,
      );
      verify(
        () => radioThemeCubit.splashRadiusChanged(doubleValue.toString()),
      ).called(1);
    },
  );

  group('test material tap target size dropdown', () {
    for (var size in MaterialTapTargetSize.values) {
      final sizeStr = UtilService.enumToString(size);

      testWidgets(
        'should update to $size',
        (tester) async {
          final state = RadioThemeState(
            theme: RadioThemeData(materialTapTargetSize: size),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkDropbox(
            tester,
            'radioThemeEditor_materialTapTargetSizeDropdown',
            sizeStr,
          );
          verify(
            () => radioThemeCubit.materialTapTargetSize(sizeStr),
          ).called(1);
        },
      );
    }
  });
}
