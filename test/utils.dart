import 'dart:math';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Color getRandomColor() => Color(Random().nextInt(0xffffffff));

Future<void> checkColorPicker(
  WidgetTester tester,
  String key,
  Color color, {
  String? expandText,
}) async {
  if (expandText != null) {
    await tester.tap(find.text(expandText));
    await tester.pumpAndSettle();
  }

  final parentWidget = find.byKey(Key(key));
  await tester.ensureVisible(parentWidget);
  await tester.pumpAndSettle();
  await tester.tap(
    find.descendant(
      of: parentWidget,
      matching: find.byType(ColorIndicator),
    ),
  );
  await tester.pumpAndSettle();
  await tester.tap(find.text('Wheel'));
  await tester.enterText(find.byType(TextField), '#${color.hex}');

  final widget = find.descendant(
    of: parentWidget,
    matching: find.byWidgetPredicate((widget) {
      return widget is ColorIndicator && widget.color == color;
    }),
  );
  expect(widget, findsOneWidget);
}

Future<void> checkBrightnessSwitch(
  WidgetTester tester,
  String key,
  bool isActive, {
  String? expandText,
}) async {
  if (expandText != null) {
    await tester.tap(find.text(expandText));
    await tester.pumpAndSettle();
  }

  final parentWidget = find.byKey(Key(key));
  await tester.ensureVisible(parentWidget);
  await tester.pumpAndSettle();
  await tester.tap(
    find.descendant(of: parentWidget, matching: find.byType(Switch)),
  );

  final widget = find.descendant(
    of: parentWidget,
    matching: find.byWidgetPredicate((widget) {
      return widget is Switch && widget.value == isActive;
    }),
  );
  expect(widget, findsOneWidget);
}
