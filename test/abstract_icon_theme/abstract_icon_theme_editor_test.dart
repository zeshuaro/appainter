import 'dart:math';

import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../utils.dart';
import '../widget_testers.dart';
import 'mocks.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Test');

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

  Future<void> pumpApp(WidgetTester tester, IconThemeState state) async {
    whenListen(cubit, Stream.fromIterable([state]),
        initialState: const IconThemeState());

    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: MaterialApp(
          home: MyExpansionPanelList(
            item: const TestIconThemeEditor(),
          ),
        ),
      ),
    );
  }

  testWidgets(
    'updates color',
    (tester) async {
      final state = IconThemeState(theme: IconThemeData(color: color));

      await pumpApp(tester, state);

      await widgetTesters.checkColorPicker(tester, 'colorPicker', color);
      verify(() => cubit.colorChanged(color)).called(1);
    },
  );

  testWidgets(
    'updates size',
    (tester) async {
      final state = IconThemeState(theme: IconThemeData(size: doubleNum));

      await pumpApp(tester, state);

      await widgetTesters.checkTextField(tester, 'sizeTextField', doubleNum);
      verify(() => cubit.sizeChanged(doubleStr)).called(1);
    },
  );

  testWidgets(
    'updates opacity',
    (tester) async {
      final state = IconThemeState(theme: IconThemeData(opacity: doubleNum));

      await pumpApp(tester, state);

      await widgetTesters.checkTextField(tester, 'opacityTextField', doubleNum);
      verify(() => cubit.opacityChanged(doubleStr)).called(1);
    },
  );
}
