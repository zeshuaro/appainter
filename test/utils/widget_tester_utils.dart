import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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
    final colorIndicator = find.descendant(
      of: find.byKey(Key(key)),
      matching: find.byType(ColorIndicator),
    );
    await ensureVisible(colorIndicator);
    await tap(colorIndicator);
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
  }

  Future<void> verifyColorPicker(
    String key,
    Color color,
    ValueChanged<Color> mockedMethod,
  ) async {
    await pickColor(key, color);
    verify(() => mockedMethod(color)).called(1);
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

  Future<void> verifyTextField(
    String key,
    String value,
    ValueChanged<String> mockedMethod,
  ) async {
    await enterText(
      find.descendant(
        of: find.byKey(Key(key)),
        matching: find.byType(TextFormField),
      ),
      value,
    );
    await pumpAndSettle();
    verify(() => mockedMethod(value)).called(1);
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

  Future<void> verifyDropdown(
    String key,
    String value,
    ValueChanged<String> mockedMethod,
  ) async {
    final dropdown = find.descendant(
      of: find.byKey(Key(key)),
      matching: find.byKey(const Key('dropdownListTile_dropdownButton')),
    );
    await ensureVisible(dropdown);
    await tap(dropdown);
    await pumpAndSettle();

    final item = find.byKey(ValueKey(value)).last;
    await ensureVisible(item);
    await tap(item);
    await pumpAndSettle();
    verify(() => mockedMethod(value)).called(1);
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

  Future<void> verifySwitch(
    String key,
    bool value,
    ValueChanged<bool> mockedMethod,
  ) async {
    await tap(
      find.descendant(of: find.byKey(Key(key)), matching: find.byType(Switch)),
    );
    await pumpAndSettle();
    verify(() => mockedMethod(value)).called(1);
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
