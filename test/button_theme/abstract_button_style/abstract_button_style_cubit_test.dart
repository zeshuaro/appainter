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
  const beveledRectangleBorder = BeveledRectangleBorder();
  const continuousRectangleBorder = ContinuousRectangleBorder();
  const roundedRectangleBorder = RoundedRectangleBorder();
  const stadiumBorder = StadiumBorder();

  const buttonStyle = ButtonStyle();
  final colorScheme = ThemeData().colorScheme;
  final outlinedBorderEnum = OutlinedBorderEnum();

  late Color color;
  late double doubleNum;
  late String doubleStr;
  late ColorThemeCubit colorThemeCubit;
  late TestButtonStyleCubit sut;

  setUp(() {
    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();
    colorThemeCubit = MockColorThemeCubit();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    sut = TestButtonStyleCubit(colorThemeCubit: colorThemeCubit);
  });

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit style',
    build: () => sut,
    act: (cubit) => cubit.styleChanged(buttonStyle),
    expect: () => [const ButtonStyleState(style: buttonStyle)],
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit null style',
    build: () => sut,
    act: (cubit) => cubit.styleChanged(null),
    expect: () => [const ButtonStyleState(style: null)],
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit foreground default color',
    build: () => sut,
    act: (cubit) => cubit.foregroundDefaultColorChanged(color),
    verify: (cubit) {
      final props = {
        null: color,
        WidgetState.disabled: colorScheme.onSurface.withOpacity(0.38),
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.foregroundColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit foreground disabled color',
    build: () => sut,
    act: (cubit) => cubit.foregroundDisabledColorChanged(color),
    verify: (cubit) {
      final props = {
        null: colorScheme.onPrimary,
        WidgetState.disabled: color,
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.foregroundColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit overlay hovered color',
    build: () => sut,
    act: (cubit) => cubit.overlayHoveredColorChanged(color),
    verify: (cubit) {
      final props = {
        WidgetState.hovered: color,
        WidgetState.focused: colorScheme.onPrimary.withOpacity(0.1),
        WidgetState.pressed: colorScheme.onPrimary.withOpacity(0.1),
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.overlayColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit overlay focused color',
    build: () => sut,
    act: (cubit) => cubit.overlayFocusedColorChanged(color),
    verify: (cubit) {
      final props = {
        WidgetState.hovered: colorScheme.onPrimary.withOpacity(0.08),
        WidgetState.focused: color,
        WidgetState.pressed: colorScheme.onPrimary.withOpacity(0.1),
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.overlayColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit elevated button overlay pressed color',
    build: () => sut,
    act: (cubit) => cubit.overlayPressedColorChanged(color),
    verify: (cubit) {
      final props = {
        WidgetState.hovered: colorScheme.onPrimary.withOpacity(0.08),
        WidgetState.focused: colorScheme.onPrimary.withOpacity(0.1),
        WidgetState.pressed: color,
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.overlayColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit elevated button shadow color',
    build: () => sut,
    act: (cubit) => cubit.shadowColorChanged(color),
    verify: (cubit) {
      final props = {null: color};

      verifyMaterialPropertyByMap(
        cubit.state.style!.shadowColor!,
        props,
      );
    },
  );

  for (var shape in outlinedBorderEnum.values) {
    blocTest<TestButtonStyleCubit, ButtonStyleState>(
      'emit shape ${shape.runtimeType}',
      build: () => sut,
      act: (cubit) {
        cubit.shapeChanged(outlinedBorderEnum.convertToString(shape));
      },
      verify: (cubit) {
        final props = {null: shape};
        verifyMaterialPropertyByMap(cubit.state.style!.shape!, props);
      },
    );
  }

  group('shape border radius', () {
    blocTest<TestButtonStyleCubit, ButtonStyleState>(
      'emit for beveled rectangle border',
      setUp: () => sut = TestButtonStyleCubit(
        colorThemeCubit: colorThemeCubit,
        shape: beveledRectangleBorder,
      ),
      build: () => sut,
      act: (cubit) => cubit.shapeBorderRadiusChanged(doubleStr),
      verify: (cubit) {
        final props = {
          null: beveledRectangleBorder.copyWith(
            borderRadius: BorderRadius.circular(doubleNum),
          ),
        };
        verifyMaterialPropertyByMap(cubit.state.style!.shape!, props);
      },
    );

    blocTest<TestButtonStyleCubit, ButtonStyleState>(
      'emit for continuous rectangle border',
      setUp: () => sut = TestButtonStyleCubit(
        colorThemeCubit: colorThemeCubit,
        shape: continuousRectangleBorder,
      ),
      build: () => sut,
      act: (cubit) => cubit.shapeBorderRadiusChanged(doubleStr),
      verify: (cubit) {
        final props = {
          null: continuousRectangleBorder.copyWith(
            borderRadius: BorderRadius.circular(doubleNum),
          ),
        };
        verifyMaterialPropertyByMap(cubit.state.style!.shape!, props);
      },
    );

    blocTest<TestButtonStyleCubit, ButtonStyleState>(
      'emit for rounded rectangle border',
      setUp: () => sut = TestButtonStyleCubit(
        colorThemeCubit: colorThemeCubit,
        shape: roundedRectangleBorder,
      ),
      build: () => sut,
      act: (cubit) => cubit.shapeBorderRadiusChanged(doubleStr),
      verify: (cubit) {
        final props = {
          null: roundedRectangleBorder.copyWith(
            borderRadius: BorderRadius.circular(doubleNum),
          ),
        };
        verifyMaterialPropertyByMap(cubit.state.style!.shape!, props);
      },
    );

    blocTest<TestButtonStyleCubit, ButtonStyleState>(
      'emit for unknown border',
      setUp: () => sut = TestButtonStyleCubit(
        colorThemeCubit: colorThemeCubit,
        shape: stadiumBorder,
      ),
      build: () => sut,
      act: (cubit) => cubit.shapeBorderRadiusChanged(doubleStr),
      verify: (cubit) => expect(cubit.state.style, null),
    );
  });
}
