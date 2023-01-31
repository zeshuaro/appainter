import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterUtils on WidgetTester {
  Future<void> expandWidget(String text) async {
    await tap(find.text(text));
    await pumpAndSettle();
  }

  Future<void> expectColorIndicator(String key, Color color) async {
    final widget = find.descendant(
      of: find.byKey(Key(key)),
      matching: find.byWidgetPredicate(
        (widget) => widget is ColorIndicator && widget.color == color,
      ),
    );
    expect(widget, findsOneWidget);
  }

  Future<void> pickColor(String key, Color color) async {
    await tap(
      find.descendant(
        of: find.byKey(Key(key)),
        matching: find.byType(ColorIndicator),
      ),
    );
    await pumpAndSettle();

    await tap(find.text('Wheel'));
    await pumpAndSettle();

    await enterText(
      find.descendant(
        of: find.byKey(const Key("widgetService_showColorPicker")),
        matching: find.byType(TextField),
      ),
      '#${color.hex}',
    );
    await pumpAndSettle();

    await tap(find.text('OK'));
    await pumpAndSettle();
  }

  Future<void> expectTextField(String key, String value) async {
    final widget = find.descendant(
      of: find.byKey(Key(key)),
      matching: find.byWidgetPredicate(
        (widget) => widget is TextFormField && widget.initialValue == value,
      ),
    );
    expect(widget, findsOneWidget);
  }

  Future<void> enterTextToTextField(String key, num value) async {
    await enterText(
      find.descendant(
        of: find.byKey(Key(key)),
        matching: find.byType(TextFormField),
      ),
      value.toString(),
    );
  }

  Future<void> expectDropdown(String key, String value) async {
    final widget = find.descendant(
      of: find.byKey(Key(key)),
      matching: find.byWidgetPredicate(
        (widget) => widget is DropdownButton && widget.value == value,
      ),
    );
    expect(widget, findsOneWidget);
  }

  Future<void> selectDropdownItem(String key, String value) async {
    await tap(
      find.descendant(
        of: find.byKey(Key(key)),
        matching: find.byKey(const Key('dropdownListTile_dropdownButton')),
      ),
    );
    await pumpAndSettle();

    final item = find.byKey(ValueKey(value)).last;
    await ensureVisible(item);
    await tap(item);
    await pumpAndSettle();
  }

  void expectSwitch(String key, bool value) {
    final widget = find.descendant(
      of: find.byKey(Key(key)),
      matching: find.byWidgetPredicate(
        (widget) => widget is Switch && widget.value == value,
      ),
    );
    expect(widget, findsOneWidget);
  }

  Future<void> toggleSwitch(String key, bool value) async {
    await tap(
      find.descendant(of: find.byKey(Key(key)), matching: find.byType(Switch)),
    );
    await pumpAndSettle();
  }

  void expectBlocBuilder<B extends StateStreamable<S>, S>(
    String key,
    S initState,
    S newState,
  ) {
    final builder = firstWidget<BlocBuilder<B, S>>(
      find.byWidgetPredicate(
        (widget) => widget.key == Key(key) && widget is BlocBuilder<B, S>,
      ),
    );

    expect(builder.buildWhen?.call(initState, newState), true);
    expect(builder.buildWhen?.call(newState, newState), false);
  }
}
