import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

Future<void> main() async {
  final widgetTesters = WidgetTesters(expandText: 'Floating action button');

  late FloatingActionButtonThemeCubit floatingActionButtonThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late Color color;
  late double doubleValue;

  setUp(() {
    floatingActionButtonThemeCubit = MockFloatingActionButtonThemeCubit();
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    when(() {
      return floatingActionButtonThemeCubit.state;
    }).thenReturn(const FloatingActionButtonThemeState());
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(
    WidgetTester tester,
    FloatingActionButtonThemeState state,
  ) async {
    whenListen(
      floatingActionButtonThemeCubit,
      Stream.fromIterable([const FloatingActionButtonThemeState(), state]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: floatingActionButtonThemeCubit),
          BlocProvider.value(value: colorThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(
            item: const FloatingActionButtonThemeEditor(),
          ),
        ),
      ),
    );
  }

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(backgroundColor: color),
      );

      await pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'floatingActionButtonThemeEditor_backgroundColorPicker',
        color,
      );
      verify(() {
        floatingActionButtonThemeCubit.backgroundColorChanged(color);
      }).called(1);
    },
  );

  testWidgets(
    'foregound color picker should update with selected color',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(foregroundColor: color),
      );

      await pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'floatingActionButtonThemeEditor_foregroundColorPicker',
        color,
      );
      verify(() {
        floatingActionButtonThemeCubit.foregroundColorChanged(color);
      }).called(1);
    },
  );

  testWidgets(
    'focus color picker should update with selected color',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(focusColor: color),
      );

      await pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'floatingActionButtonThemeEditor_focusColorPicker',
        color,
      );
      verify(() {
        floatingActionButtonThemeCubit.focusColorChanged(color);
      }).called(1);
    },
  );

  testWidgets(
    'hover color picker should update with selected color',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(hoverColor: color),
      );

      await pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'floatingActionButtonThemeEditor_hoverColorPicker',
        color,
      );
      verify(() {
        floatingActionButtonThemeCubit.hoverColorChanged(color);
      }).called(1);
    },
  );

  testWidgets(
    'splash color picker should update with selected color',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(splashColor: color),
      );

      await pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'floatingActionButtonThemeEditor_splashColorPicker',
        color,
      );
      verify(() {
        floatingActionButtonThemeCubit.splashColorChanged(color);
      }).called(1);
    },
  );

  testWidgets(
    'elevation should update with value',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(elevation: doubleValue),
      );

      await pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'floatingActionButtonThemeEditor_elevationTextField',
        doubleValue,
      );
      verify(() {
        floatingActionButtonThemeCubit.elevationChanged(doubleValue.toString());
      }).called(1);
    },
  );

  testWidgets(
    'disabled elevation should update with value',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(disabledElevation: doubleValue),
      );

      await pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'floatingActionButtonThemeEditor_disabledElevationTextField',
        doubleValue,
      );
      verify(() {
        floatingActionButtonThemeCubit.disabledElevationChanged(
          doubleValue.toString(),
        );
      }).called(1);
    },
  );

  testWidgets(
    'focus elevation should update with value',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(focusElevation: doubleValue),
      );

      await pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'floatingActionButtonThemeEditor_focusElevationTextField',
        doubleValue,
      );
      verify(() {
        floatingActionButtonThemeCubit.focusElevationChanged(
          doubleValue.toString(),
        );
      }).called(1);
    },
  );

  testWidgets(
    'highlight elevation should update with value',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(highlightElevation: doubleValue),
      );

      await pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'floatingActionButtonThemeEditor_highlightElevationTextField',
        doubleValue,
      );
      verify(() {
        floatingActionButtonThemeCubit.highlightElevationChanged(
          doubleValue.toString(),
        );
      }).called(1);
    },
  );

  testWidgets(
    'hover elevation should update with value',
    (tester) async {
      final state = FloatingActionButtonThemeState(
        theme: FloatingActionButtonThemeData(hoverElevation: doubleValue),
      );

      await pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'floatingActionButtonThemeEditor_hoverElevationTextField',
        doubleValue,
      );
      verify(() {
        floatingActionButtonThemeCubit.hoverElevationChanged(
          doubleValue.toString(),
        );
      }).called(1);
    },
  );
}
