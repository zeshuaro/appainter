import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

Future<void> main() async {
  final colorScheme = ThemeData().colorScheme;

  late ColorThemeCubit colorThemeCubit;
  late OutlinedButtonThemeEditor sut;

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    sut = const OutlinedButtonThemeEditor();
  });

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

  test('header', () => expect(sut.header, equals('Outlined button')));
}
