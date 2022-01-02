import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/icon_theme/icon_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Icon Theme');

  late IconThemeCubit iconThemeCubit;
  late Color color;
  late double doubleValue;

  setUp(() {
    iconThemeCubit = MockIconThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    when(() => iconThemeCubit.state).thenReturn(const IconThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, IconThemeState state) async {
    whenListen(
      iconThemeCubit,
      Stream.fromIterable([const IconThemeState(), state]),
    );

    await tester.pumpWidget(
      BlocProvider.value(
        value: iconThemeCubit,
        child: MaterialApp(
          home: MyExpansionPanelList(item: const IconThemeEditor()),
        ),
      ),
    );
  }

  testWidgets(
    'color picker should update with selected color',
    (tester) async {
      final state = IconThemeState(theme: IconThemeData(color: color));

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'iconThemeEditor_iconThemeCard',
        color,
      );
      verify(() => iconThemeCubit.colorChanged(color)).called(1);
    },
  );

  testWidgets(
    'size text field should update with value',
    (tester) async {
      final state = IconThemeState(theme: IconThemeData(size: doubleValue));

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'iconThemeCard_sizeTextField',
        doubleValue,
      );
      verify(() {
        iconThemeCubit.sizeChanged(doubleValue.toString());
      }).called(1);
    },
  );

  testWidgets(
    'opacity text field should update with value',
    (tester) async {
      final state = IconThemeState(theme: IconThemeData(opacity: doubleValue));

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'iconThemeCard_opacityTextField',
        doubleValue,
      );
      verify(() {
        iconThemeCubit.opacityChanged(doubleValue.toString());
      }).called(1);
    },
  );
}
