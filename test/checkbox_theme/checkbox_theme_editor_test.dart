import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/checkbox_theme/checkbox_theme.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Checkbox');

  late CheckboxThemeCubit checkboxThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late Color color;
  late double doubleValue;

  setUp(() {
    checkboxThemeCubit = MockCheckboxThemeCubit();
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    when(() => checkboxThemeCubit.state).thenReturn(const CheckboxThemeState());
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, CheckboxThemeState state) async {
    whenListen(
      checkboxThemeCubit,
      Stream.fromIterable([const CheckboxThemeState(), state]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: checkboxThemeCubit),
          BlocProvider.value(value: colorThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(item: const CheckboxThemeEditor()),
        ),
      ),
    );
  }

  group('test fill colors', () {
    testWidgets(
      'default color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = CheckboxThemeState(
          theme: CheckboxThemeData(fillColor: prop),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'checkboxThemeEditor_fillColor_default',
          color,
        );
        verify(
          () => checkboxThemeCubit.fillDefaultColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'selected color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.selected: color,
        });
        final state = CheckboxThemeState(
          theme: CheckboxThemeData(fillColor: prop),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'checkboxThemeEditor_fillColor_selected',
          color,
        );
        verify(
          () => checkboxThemeCubit.fillSelectedColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'disabled color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.disabled: color,
        });
        final state = CheckboxThemeState(
          theme: CheckboxThemeData(fillColor: prop),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'checkboxThemeEditor_fillColor_disabled',
          color,
        );
        verify(
          () => checkboxThemeCubit.fillDisabledColorChanged(color),
        ).called(1);
      },
    );
  });

  testWidgets(
    'default color picker should update with selected color',
    (tester) async {
      final prop = getMaterialStateProperty({null: color});
      final state = CheckboxThemeState(
        theme: CheckboxThemeData(checkColor: prop),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'checkboxThemeEditor_checkColor_default',
        color,
      );
      verify(() => checkboxThemeCubit.checkColorChanged(color)).called(1);
    },
  );

  group('test overlay colors', () {
    testWidgets(
      'pressed color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.pressed: color,
        });
        final state = CheckboxThemeState(
          theme: CheckboxThemeData(overlayColor: prop),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'checkboxThemeEditor_overlayColor_pressed',
          color,
        );
        verify(
          () => checkboxThemeCubit.overlayPressedColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'hovered color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.hovered: color,
        });
        final state = CheckboxThemeState(
          theme: CheckboxThemeData(overlayColor: prop),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'checkboxThemeEditor_overlayColor_hovered',
          color,
        );
        verify(
          () => checkboxThemeCubit.overlayHoveredColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'focused color picker should update with selected color',
      (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.focused: color,
        });
        final state = CheckboxThemeState(
          theme: CheckboxThemeData(overlayColor: prop),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'checkboxThemeEditor_overlayColor_focused',
          color,
        );
        verify(
          () => checkboxThemeCubit.overlayFocusedColorChanged(color),
        ).called(1);
      },
    );
  });

  testWidgets(
    'splash radius text field should update with value',
    (tester) async {
      final state = CheckboxThemeState(
        theme: CheckboxThemeData(splashRadius: doubleValue),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'checkboxThemeEditor_splashRadiusTextField',
        doubleValue,
      );
      verify(
        () => checkboxThemeCubit.splashRadiusChanged(doubleValue.toString()),
      ).called(1);
    },
  );

  group('test material tap target size dropdown', () {
    for (var size in MaterialTapTargetSize.values) {
      final sizeStr = UtilService.enumToString(size);

      testWidgets(
        'should update to $size',
        (tester) async {
          final state = CheckboxThemeState(
            theme: CheckboxThemeData(materialTapTargetSize: size),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkDropbox(
            tester,
            'checkboxThemeEditor_materialTapTargetSizeDropdown',
            sizeStr,
          );
          verify(
            () => checkboxThemeCubit.materialTapTargetSize(sizeStr),
          ).called(1);
        },
      );
    }
  });
}
