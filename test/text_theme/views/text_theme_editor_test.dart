import 'package:appainter/text_theme/text_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late TextThemeCubit cubit;

  setUp(() {
    cubit = MockTextThemeCubit();
  });

  testWidgets('font picker should update font family', (tester) async {
    const fontFamily = 'ABeeZee';

    whenListen(
      cubit,
      Stream.fromIterable([const TextThemeState(fontFamily: fontFamily)]),
      initialState: const TextThemeState(),
    );

    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: const MaterialApp(
          home: FontPicker(),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('textThemeEditor_fontPicker')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('fontPicker_$fontFamily')));
    await tester.pumpAndSettle();

    final parentWidget = find.byKey(
      const Key('textThemeEditor_fontPicker_listTile'),
    );
    final widget = find.descendant(
      of: parentWidget,
      matching: find.text(fontFamily),
    );
    expect(widget, findsOneWidget);
    verify(() => cubit.fontFamilyChanged(fontFamily));
  });
}
