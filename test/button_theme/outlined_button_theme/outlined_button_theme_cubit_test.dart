import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../utils.dart';

void main() {
  final colorScheme = ThemeData().colorScheme;

  late ColorThemeCubit colorThemeCubit;
  late OutlinedButtonThemeCubit sut;

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    sut = OutlinedButtonThemeCubit(colorThemeCubit: colorThemeCubit);
  });

  test('get default style', () {
    final actual = sut.getDefaultStyle(colorScheme);
    final expected = OutlinedButton.styleFrom(
      foregroundColor: colorScheme.primary,
      backgroundColor: Colors.transparent,
      disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
      shadowColor: colorScheme.shadow,
      elevation: 0,
      minimumSize: const Size(64, 36),
    );

    verifyMaterialProperty(actual.backgroundColor!, expected.backgroundColor!);
    verifyMaterialProperty(actual.foregroundColor!, expected.foregroundColor!);
    verifyMaterialProperty(actual.overlayColor!, expected.overlayColor!);
    verifyMaterialProperty(actual.shadowColor!, expected.shadowColor!);
    verifyMaterialProperty(actual.elevation!, expected.elevation!);
  });
}
