import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../utils.dart';

void main() {
  final colorScheme = ThemeData().colorScheme;
  const shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(4),
    ),
  );

  late ColorThemeCubit colorThemeCubit;
  late TextButtonThemeCubit sut;

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    sut = TextButtonThemeCubit(colorThemeCubit: colorThemeCubit);
  });

  test('default shape', () {
    final actual = sut.defaultShape;
    expect(actual, equals(shape));
  });

  test('get default style', () {
    final actual = sut.getDefaultStyle(colorScheme);
    final expected = TextButton.styleFrom(
      foregroundColor: colorScheme.primary,
      disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
      backgroundColor: Colors.transparent,
      shadowColor: colorScheme.shadow,
      elevation: 0,
      minimumSize: const Size(64, 36),
      shape: shape,
    );

    verifyMaterialProperty(actual.backgroundColor!, expected.backgroundColor!);
    verifyMaterialProperty(actual.foregroundColor!, expected.foregroundColor!);
    verifyMaterialProperty(actual.overlayColor!, expected.overlayColor!);
    verifyMaterialProperty(actual.shadowColor!, expected.shadowColor!);
    verifyMaterialProperty(actual.elevation!, expected.elevation!);
  });
}
