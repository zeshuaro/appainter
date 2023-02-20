import 'package:appainter/button_theme/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  const elevation = 2.0;
  final colorScheme = ThemeData().colorScheme;

  late ElevatedButtonThemeEditor sut;

  setUp(() {
    sut = const ElevatedButtonThemeEditor();
  });

  test('fallback background default color', () {
    final actual = sut.fallbackBackgroundDefaultColor(colorScheme);
    expect(actual, equals(colorScheme.primary));
  });

  test('fallback background disabled color', () {
    final actual = sut.fallbackBackgroundDisabledColor(colorScheme);
    expect(actual, equals(colorScheme.onSurface.withOpacity(0.12)));
  });

  test('fallback elevation default', () {
    expect(sut.fallbackElevationDefault, equals(elevation));
  });

  test('fallback elevation focused', () {
    expect(sut.fallbackElevationFocused, equals(elevation + 2));
  });

  test('fallback elevation hovered', () {
    expect(sut.fallbackElevationHovered, equals(elevation + 2));
  });

  test('fallback elevation pressed', () {
    expect(sut.fallbackElevationPressed, equals(elevation + 6));
  });

  test('fallback foreground default color', () {
    final actual = sut.fallbackForegroundDefaultColor(colorScheme);
    expect(actual, equals(colorScheme.onPrimary));
  });

  test('fallback foreground disabled color', () {
    final actual = sut.fallbackForegroundDisabledColor(colorScheme);
    expect(actual, equals(colorScheme.onSurface.withOpacity(0.38)));
  });

  test('fallback overlay focused color', () {
    final actual = sut.fallbackOverlayFocusedColor(colorScheme);
    expect(actual, equals(colorScheme.onPrimary.withOpacity(0.24)));
  });

  test('fallback overlay hovered color', () {
    final actual = sut.fallbackOverlayHoveredColor(colorScheme);
    expect(actual, equals(colorScheme.onPrimary.withOpacity(0.08)));
  });

  test('fallback overlay pressed color', () {
    final actual = sut.fallbackOverlayFocusedColor(colorScheme);
    expect(actual, equals(colorScheme.onPrimary.withOpacity(0.24)));
  });

  test('header', () => expect(sut.header, equals('Elevated button')));
}
