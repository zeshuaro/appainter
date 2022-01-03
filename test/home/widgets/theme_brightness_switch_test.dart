import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/home/home.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late BasicThemeCubit cubit;

  setUp(() => cubit = MockBasicThemeCubit());

  group('test switch', () {
    for (var isDark in [true, false]) {
      testWidgets('should update to $isDark', (tester) async {
        when(() => cubit.state).thenReturn(BasicThemeState(isDark: isDark));

        await tester.pumpWidget(
          BlocProvider.value(
            value: cubit,
            child: const MaterialApp(
              home: Scaffold(body: ThemeBrightnessSwitch()),
            ),
          ),
        );

        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        final widget = find.byWidgetPredicate(
          (widget) => widget is Switch && widget.value == isDark,
        );
        expect(widget, findsOneWidget);
        verify(() => cubit.themeBrightnessChanged(!isDark)).called(1);
      });
    }
  });
}
