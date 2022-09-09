import 'package:appainter/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late HomeCubit cubit;

  setUp(() {
    cubit = MockHomeCubit();
  });

  Future<void> pumpApp(WidgetTester tester, [Brightness? brightness]) async {
    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: MaterialApp(
          home: Scaffold(
            body: MediaQuery(
              data: MediaQueryData(
                platformBrightness: brightness ?? Brightness.light,
              ),
              child: const AppThemeModeButton(),
            ),
          ),
        ),
      ),
    );
  }

  group('test light and dark theme modes', () {
    for (var mode in [ThemeMode.dark, ThemeMode.light]) {
      testWidgets('should update to $mode', (tester) async {
        final isDark = mode == ThemeMode.dark;
        when(() => cubit.state).thenReturn(HomeState(themeMode: mode));
        when(() => cubit.themeModeChanged(any())).thenAnswer(
          (invocation) => Future.value(),
        );

        await pumpApp(tester);

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        final iconData = _getIconData(isDark);
        final widget = find.byIcon(iconData);
        expect(widget, findsOneWidget);
        verify(() => cubit.themeModeChanged(!isDark)).called(1);
      });
    }
  });

  group('test system theme mode', () {
    for (var brightness in Brightness.values) {
      testWidgets('should build icon button with $brightness', (tester) async {
        final isDark = brightness == Brightness.dark;
        when(() => cubit.state).thenReturn(
          const HomeState(themeMode: ThemeMode.system),
        );

        await pumpApp(tester, brightness);

        final iconData = _getIconData(isDark);
        final widget = find.byIcon(iconData);
        expect(widget, findsOneWidget);
      });
    }
  });
}

IconData _getIconData(bool isDark) {
  return isDark ? MdiIcons.weatherNight : MdiIcons.weatherSunny;
}
