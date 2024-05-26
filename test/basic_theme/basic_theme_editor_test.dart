import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

void main() {
  final basicThemeState = BasicThemeState();

  late BasicThemeCubit cubit;
  late Color color;

  setUp(() {
    cubit = MockBasicThemeCubit();
    color = getRandomColor();
  });

  Future<void> pumpApp(WidgetTester tester, [BasicThemeState? state]) async {
    when(() => cubit.state).thenReturn(state ?? basicThemeState);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: cubit,
          child: const Scaffold(
            body: SingleChildScrollView(
              child: BasicThemeEditor(),
            ),
          ),
        ),
      ),
    );
  }

  group('seed color picker', () {
    const key = 'basicThemeEditor_seedColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState(seedColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      tester.expectBlocBuilder<BasicThemeCubit, BasicThemeState>(
        key,
        basicThemeState,
        state,
      );
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.seedColorChanged,
      );
    });
  });

  group('primary color picker', () {
    const key = 'basicThemeEditor_primaryColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(primary: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.primaryColorChanged,
      );
    });
  });

  group('on primary color picker', () {
    const key = 'basicThemeEditor_onPrimaryColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(onPrimary: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.onPrimaryColorChanged,
      );
    });
  });

  group('primary container color picker', () {
    const key = 'basicThemeEditor_primaryContainerColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(primaryContainer: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.primaryContainerColorChanged,
      );
    });
  });

  group('on primary container color picker', () {
    const key = 'basicThemeEditor_onPrimaryContainerColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(onPrimaryContainer: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.onPrimaryContainerColorChanged,
      );
    });
  });

  group('secondary color picker', () {
    const key = 'basicThemeEditor_secondaryColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(secondary: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.secondaryColorChanged,
      );
    });
  });

  group('on secondary color picker', () {
    const key = 'basicThemeEditor_onSecondaryColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(onSecondary: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.onSecondaryColorChanged,
      );
    });
  });

  group('secondary container color picker', () {
    const key = 'basicThemeEditor_secondaryContainerColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(secondaryContainer: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.secondaryContainerColorChanged,
      );
    });
  });

  group('on secondary container color picker', () {
    const key = 'basicThemeEditor_onSecondaryContainerColorPicker';

    testWidgets('render widget', (tester) async {
      final state =
          BasicThemeState.withColorScheme(onSecondaryContainer: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.onSecondaryContainerColorChanged,
      );
    });
  });

  group('tertiary color picker', () {
    const key = 'basicThemeEditor_tertiaryColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(tertiary: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.tertiaryColorChanged,
      );
    });
  });

  group('on tertiary color picker', () {
    const key = 'basicThemeEditor_onTertiaryColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(onTertiary: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.onTertiaryColorChanged,
      );
    });
  });

  group('tertiary container color picker', () {
    const key = 'basicThemeEditor_tertiaryContainerColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(tertiaryContainer: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.tertiaryContainerColorChanged,
      );
    });
  });

  group('on tertiary container color picker', () {
    const key = 'basicThemeEditor_onTertiaryContainerColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(onTertiaryContainer: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.onTertiaryContainerColorChanged,
      );
    });
  });

  group('error color picker', () {
    const key = 'basicThemeEditor_errorColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(error: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.errorColorChanged,
      );
    });
  });

  group('on error color picker', () {
    const key = 'basicThemeEditor_onErrorColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(onError: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.onErrorColorChanged,
      );
    });
  });

  group('error container color picker', () {
    const key = 'basicThemeEditor_errorContainerColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(errorContainer: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.errorContainerColorChanged,
      );
    });
  });

  group('on error container color picker', () {
    const key = 'basicThemeEditor_onErrorContainerColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(onErrorContainer: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.onErrorContainerColorChanged,
      );
    });
  });

  group('surface color picker', () {
    const key = 'basicThemeEditor_surfaceColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(surface: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.surfaceColorChanged,
      );
    });
  });

  group('on surface color picker', () {
    const key = 'basicThemeEditor_onSurfaceColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(onSurface: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.onSurfaceColorChanged,
      );
    });
  });

  group('surface container highest color picker', () {
    const key = 'basicThemeEditor_surfaceContainerHighestColorPicker';

    testWidgets('render widget', (tester) async {
      final state =
          BasicThemeState.withColorScheme(surfaceContainerHighest: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.surfaceContainerHighestColorChanged,
      );
    });
  });

  group('on surface variant color picker', () {
    const key = 'basicThemeEditor_onSurfaceVariantColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(onSurfaceVariant: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.onSurfaceVariantColorChanged,
      );
    });
  });

  group('outline color picker', () {
    const key = 'basicThemeEditor_outlineColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(outline: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.outlineColorChanged,
      );
    });
  });

  group('shadow color picker', () {
    const key = 'basicThemeEditor_shadowColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(shadow: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.shadowColorChanged,
      );
    });
  });

  group('inverse surface color picker', () {
    const key = 'basicThemeEditor_inverseSurfaceColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(inverseSurface: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.inverseSurfaceColorChanged,
      );
    });
  });

  group('on inverse surface color picker', () {
    const key = 'basicThemeEditor_onInverseSurfaceColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(onInverseSurface: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.onInverseSurfaceColorChanged,
      );
    });
  });

  group('inverse primary color picker', () {
    const key = 'basicThemeEditor_inversePrimaryColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BasicThemeState.withColorScheme(inversePrimary: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        cubit.inversePrimaryColorChanged,
      );
    });
  });
}
