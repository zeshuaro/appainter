import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class WidgetTesters {
  final String? expandText;
  final bool scrollToParentWidget;
  final String? scrollableKey;

  WidgetTesters({
    this.expandText,
    this.scrollToParentWidget = false,
    this.scrollableKey,
  });

  Future<void> checkColorPicker(
    WidgetTester tester,
    String key,
    Color color, {
    Color? expectedColor,
  }) async {
    await _expandWidget(tester, expandText);

    final parentWidget = await _findParentWidget(tester, key);
    await tester.tap(
      find.descendant(
        of: parentWidget,
        matching: find.byType(ColorIndicator),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Wheel'));
    await tester.pumpAndSettle();

    final colorPicker = find.byKey(const Key("widgetService_showColorPicker"));
    await tester.enterText(
      find.descendant(
        of: colorPicker,
        matching: find.byType(TextField),
      ),
      '#${color.hex}',
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    final widget = find.descendant(
      of: parentWidget,
      matching: find.byWidgetPredicate((widget) {
        return widget is ColorIndicator &&
            ((expectedColor == null && widget.color == color) ||
                (expectedColor != null && widget.color == expectedColor));
      }),
    );
    expect(widget, findsOneWidget);
  }

  Future<void> checkSwitch(
    WidgetTester tester,
    String key,
    bool isActive,
  ) async {
    await _expandWidget(tester, expandText);

    final parentWidget = await _findParentWidget(tester, key);
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

  Future<void> checkTextField(
    WidgetTester tester,
    String key,
    num value,
  ) async {
    final valueStr = value.toString();
    await _expandWidget(tester, expandText);

    final parentWidget = await _findParentWidget(tester, key);
    await tester.enterText(
      find.descendant(of: parentWidget, matching: find.byType(TextFormField)),
      valueStr,
    );

    final widget = find.descendant(
      of: parentWidget,
      matching: find.text(valueStr),
    );
    expect(widget, findsOneWidget);
  }

  Future<void> checkDropbox(
    WidgetTester tester,
    String key,
    String value,
  ) async {
    await _expandWidget(tester, expandText);

    final parentWidget = await _findParentWidget(tester, key);
    await tester.tap(
      find.descendant(
        of: parentWidget,
        matching: find.byKey(const Key('dropdownListTile_dropdownButton')),
      ),
    );

    final dropdownItem = find.byKey(ValueKey(value)).last;
    await tester.ensureVisible(dropdownItem);
    await tester.pumpAndSettle();
    await tester.tap(dropdownItem);

    final widget = find.descendant(
      of: parentWidget,
      matching: find.byWidgetPredicate((widget) {
        return widget is DropdownButton && widget.value == value;
      }),
    );
    expect(widget, findsOneWidget);
  }

  Future<void> _expandWidget(WidgetTester tester, String? expandText) async {
    if (expandText != null) {
      await tester.tap(find.text(expandText));
      await tester.pumpAndSettle();
    }
  }

  Future<Finder> _findParentWidget(WidgetTester tester, String key) async {
    final parentWidget = find.byKey(Key(key));
    if (scrollToParentWidget) {
      Finder? scrollableFinder;
      if (scrollableKey != null) {
        final scrollable = find.byWidgetPredicate((w) => w is Scrollable);
        scrollableFinder = find.descendant(
          of: find.byKey(Key(scrollableKey!)),
          matching: scrollable,
        );
      }
      await tester.scrollUntilVisible(
        parentWidget,
        500,
        scrollable: scrollableFinder,
      );
    } else {
      await tester.ensureVisible(parentWidget);
    }
    await tester.pumpAndSettle();

    return parentWidget;
  }
}
