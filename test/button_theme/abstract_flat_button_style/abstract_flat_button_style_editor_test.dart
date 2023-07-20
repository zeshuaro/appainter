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
  final colorScheme = ThemeData().colorScheme;

  late TestFlatButtonStyleCubit buttonStyleCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  late TestFlatButtonStyleEditor sut;

  setUp(() {
    buttonStyleCubit = MockFlatButtonStyleCubit();
    when(() => buttonStyleCubit.defaultShape).thenReturn(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );

    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    sut = const TestFlatButtonStyleEditor();
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

  test('fallback foreground default color', () {
    final actual = sut.fallbackForegroundDefaultColor(colorScheme);
    expect(actual, equals(colorScheme.primary));
  });

  test('fallback foreground disabled color', () {
    final actual = sut.fallbackForegroundDisabledColor(colorScheme);
    expect(actual, equals(colorScheme.onSurface.withOpacity(0.38)));
  });

  test('fallback overlay focused color', () {
    final actual = sut.fallbackOverlayFocusedColor(colorScheme);
    expect(actual, equals(colorScheme.primary.withOpacity(0.12)));
  });

  test('fallback overlay hovered color', () {
    final actual = sut.fallbackOverlayHoveredColor(colorScheme);
    expect(actual, equals(colorScheme.primary.withOpacity(0.04)));
  });

  test('fallback overlay pressed color', () {
    final actual = sut.fallbackOverlayPressedColor(colorScheme);
    expect(actual, equals(colorScheme.primary.withOpacity(0.12)));
  });

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
