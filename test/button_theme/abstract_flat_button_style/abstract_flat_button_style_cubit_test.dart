import 'dart:math';

import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../utils.dart';
import 'mocks.dart';

void main() {
  late Color color;
  late double doubleNum;
  late String doubleStr;

  late ColorThemeCubit colorThemeCubit;
  late TestFlatButtonStyleCubit sut;

  setUp(() {
    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    sut = TestFlatButtonStyleCubit(colorThemeCubit: colorThemeCubit);
  });

  blocTest<TestFlatButtonStyleCubit, ButtonStyleState>(
    'emit background color',
    build: () => sut,
    act: (cubit) => cubit.backgroundColorChanged(color),
    verify: (cubit) {
      final props = {null: color};
      verifyMaterialPropertyByMap(cubit.state.style!.backgroundColor!, props);
    },
  );

  blocTest<TestFlatButtonStyleCubit, ButtonStyleState>(
    'emit elevation',
    build: () => sut,
    act: (cubit) => cubit.elevationChanged(doubleStr),
    verify: (cubit) {
      final props = {null: doubleNum};
      verifyMaterialPropertyByMap(cubit.state.style!.elevation!, props);
    },
  );
}
