import 'dart:math';

import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../utils.dart';
import '../utils/widget_tester_utils.dart';
import 'mocks.dart';

void main() {
  const expandText = 'Test';

  late TestIconThemeCubit cubit;
  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    cubit = MockIconThemeCubit();
    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();
  });

  Future<void> pumpApp(WidgetTester tester, [IconThemeState? state]) async {
    when(() => cubit.state).thenReturn(state ?? const IconThemeState());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: cubit,
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const TestIconThemeEditor(),
            ),
          ),
        ),
      ),
    );
    await tester.expandWidget(expandText);
  }

  group('color picker', () {
    const key = 'colorPicker';

    testWidgets('render color', (tester) async {
      final state = IconThemeState.withThemeData(color: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(key, color, cubit.colorChanged);
    });
  });

  group('size text field', () {
    const key = 'sizeTextField';

    testWidgets('render size', (tester) async {
      final state = IconThemeState.withThemeData(size: doubleNum);
      await pumpApp(tester, state);
      await tester.expectTextField(key, doubleStr);
    });

    testWidgets('change size', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(key, doubleStr, cubit.sizeChanged);
    });
  });

  group('opacity text field', () {
    const key = 'opacityTextField';

    testWidgets('render opacity', (tester) async {
      final state = IconThemeState.withThemeData(opacity: doubleNum);
      await pumpApp(tester, state);
      await tester.expectTextField(key, doubleStr);
    });

    testWidgets('change opacity', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(key, doubleStr, cubit.opacityChanged);
    });
  });
}
