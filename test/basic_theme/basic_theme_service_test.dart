import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import '../utils.dart';

void main() {
  late BasicThemeService service;
  late Color color;

  late int onKeyColorTone;
  late int containerColorTone;
  late int onContainerColorTone;
  late int onNeutralColorTone;
  late int onSurfaceVariantColorTone;

  setUpAll(() {
    onKeyColorTone = 100;
    containerColorTone = 90;
    onContainerColorTone = 10;
    onNeutralColorTone = 10;
    onSurfaceVariantColorTone = 30;
  });

  setUp(() {
    service = BasicThemeService();
    color = getRandomColor();
  });

  TonalPalette getPalette() => CorePalette.of(color.value).primary;

  test('should return on key color', () {
    expect(
      service.getOnKeyColor(color),
      equals(Color(getPalette().get(onKeyColorTone))),
    );
  });

  test('should return container color', () {
    expect(
      service.getContainerColor(color),
      equals(Color(getPalette().get(containerColorTone))),
    );
  });

  test('should return on container color', () {
    expect(
      service.getOnContainerColor(color),
      equals(Color(getPalette().get(onContainerColorTone))),
    );
  });

  test('should return on neutral color', () {
    expect(
      service.getOnNeutralColor(color),
      equals(Color(getPalette().get(onNeutralColorTone))),
    );
  });

  test('should return on surface variant color', () {
    expect(
      service.getOnSurfaceVariantColor(color),
      equals(Color(getPalette().get(onSurfaceVariantColorTone))),
    );
  });
}
