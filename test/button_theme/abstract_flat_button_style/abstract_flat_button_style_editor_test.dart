import 'dart:math';

import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../utils.dart';
import '../../utils/widget_tester_utils.dart';
import 'mocks.dart';

Future<void> main() async {
  const expandText = 'Test';
  const buttonStyleState = ButtonStyleState();

  late TestFlatButtonStyleCubit buttonStyleCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    buttonStyleCubit = MockFlatButtonStyleCubit();

    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();
  });

  Future<void> pumpApp(
    WidgetTester tester, [
    ButtonStyleState? state,
  ]) async {
    when(() => buttonStyleCubit.state).thenReturn(state ?? buttonStyleState);

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: buttonStyleCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const TestFlatButtonStyleEditor(),
            ),
          ),
        ),
      ),
    );
    await tester.expandWidget(expandText);
  }

  group('background default color picker', () {
    const key = 'abstractFlatButtonStyleEditor_backgroundColor_default';

    testWidgets('render widget', (tester) async {
      final prop = getMaterialStateProperty({null: color});
      final state = ButtonStyleState.withStyle(backgroundColor: prop);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        buttonStyleCubit.backgroundColorChanged,
      );
    });
  });

  group('elevation default text field', () {
    const key = 'abstractFlatButtonStyleEditor_elevationTextField_default';

    testWidgets('render widget', (tester) async {
      final prop = getMaterialStateProperty({null: doubleNum});
      final state = ButtonStyleState.withStyle(elevation: prop);

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        buttonStyleCubit.elevationChanged,
      );
    });
  });
}
