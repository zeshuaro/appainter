import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(
    scrollToParentWidget: true,
    scrollableKey: 'basicThemeEditor_sideBySideList',
  );

  late BasicThemeCubit cubit;
  late ColorScheme colorScheme;
  late Color color;

  setUpAll(() {
    colorScheme = BasicThemeState.getColorScheme(false);
  });

  setUp(() {
    cubit = MockBasicThemeCubit();
    color = getRandomColor();
  });

  Future<void> _pumpApp(
    WidgetTester tester,
    ColorScheme colorScheme, {
    Color? seedColor,
  }) async {
    whenListen(
      cubit,
      Stream.fromIterable(
        [BasicThemeState(seedColor: seedColor, colorScheme: colorScheme)],
      ),
      initialState: BasicThemeState(),
    );

    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: const MaterialApp(
          home: BasicThemeEditor(),
        ),
      ),
    );
  }

  Future<void> _verifyColorPicker(
    WidgetTester tester,
    ColorScheme colorScheme,
    String key,
    void Function(Color) verifyFn,
  ) async {
    await _pumpApp(tester, colorScheme);
    await widgetTesters.checkColorPicker(tester, key, color);
    verify(() => verifyFn(color)).called(1);
  }

  testWidgets(
    'seed color picker should update with selected color',
    (tester) async {
      await _pumpApp(tester, colorScheme, seedColor: color);
      await widgetTesters.checkColorPicker(
        tester,
        'basicThemeEditor_seedColorPicker',
        color,
      );
      verify(() => cubit.seedColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'primary color picker should update with selected color',
    (tester) async {
      color = const Color(0xfff44336);
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(primary: color),
        'basicThemeEditor_primaryColorPicker',
        cubit.primaryColorChanged,
      );
    },
  );

  testWidgets(
    'on primary color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(onPrimary: color),
        'basicThemeEditor_onPrimaryColorPicker',
        cubit.onPrimaryColorChanged,
      );
    },
  );

  testWidgets(
    'primary container color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(primaryContainer: color),
        'basicThemeEditor_primaryContainerColorPicker',
        cubit.primaryContainerColorChanged,
      );
    },
  );

  testWidgets(
    'on primary container color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(onPrimaryContainer: color),
        'basicThemeEditor_onPrimaryContainerColorPicker',
        cubit.onPrimaryContainerColorChanged,
      );
    },
  );

  testWidgets(
    'secondary color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(secondary: color),
        'basicThemeEditor_secondaryColorPicker',
        cubit.secondaryColorChanged,
      );
    },
  );

  testWidgets(
    'on secondary color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(onSecondary: color),
        'basicThemeEditor_onSecondaryColorPicker',
        cubit.onSecondaryColorChanged,
      );
    },
  );

  testWidgets(
    'secondary container color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(secondaryContainer: color),
        'basicThemeEditor_secondaryContainerColorPicker',
        cubit.secondaryContainerColorChanged,
      );
    },
  );

  testWidgets(
    'on secondary container color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(onSecondaryContainer: color),
        'basicThemeEditor_onSecondaryContainerColorPicker',
        cubit.onSecondaryContainerColorChanged,
      );
    },
  );

  testWidgets(
    'tertiary color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(tertiary: color),
        'basicThemeEditor_tertiaryColorPicker',
        cubit.tertiaryColorChanged,
      );
    },
  );

  testWidgets(
    'on tertiary color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(onTertiary: color),
        'basicThemeEditor_onTertiaryColorPicker',
        cubit.onTertiaryColorChanged,
      );
    },
  );

  testWidgets(
    'tertiary container color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(tertiaryContainer: color),
        'basicThemeEditor_tertiaryContainerColorPicker',
        cubit.tertiaryContainerColorChanged,
      );
    },
  );

  testWidgets(
    'on tertiary container color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(onTertiaryContainer: color),
        'basicThemeEditor_onTertiaryContainerColorPicker',
        cubit.onTertiaryContainerColorChanged,
      );
    },
  );

  testWidgets(
    'error color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(error: color),
        'basicThemeEditor_errorColorPicker',
        cubit.errorColorChanged,
      );
    },
  );

  testWidgets(
    'on error color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(onError: color),
        'basicThemeEditor_onErrorColorPicker',
        cubit.onErrorColorChanged,
      );
    },
  );

  testWidgets(
    'error container color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(errorContainer: color),
        'basicThemeEditor_errorContainerColorPicker',
        cubit.errorContainerColorChanged,
      );
    },
  );

  testWidgets(
    'on error container color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(onErrorContainer: color),
        'basicThemeEditor_onErrorContainerColorPicker',
        cubit.onErrorContainerColorChanged,
      );
    },
  );

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(background: color),
        'basicThemeEditor_backgroundColorPicker',
        cubit.backgroundColorChanged,
      );
    },
  );

  testWidgets(
    'on background color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(onBackground: color),
        'basicThemeEditor_onBackgroundColorPicker',
        cubit.onBackgroundColorChanged,
      );
    },
  );

  testWidgets(
    'surface color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(surface: color),
        'basicThemeEditor_surfaceColorPicker',
        cubit.surfaceColorChanged,
      );
    },
  );

  testWidgets(
    'on surface color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(onSurface: color),
        'basicThemeEditor_onSurfaceColorPicker',
        cubit.onSurfaceColorChanged,
      );
    },
  );

  testWidgets(
    'surface variant color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(surfaceVariant: color),
        'basicThemeEditor_surfaceVariantColorPicker',
        cubit.surfaceVariantColorChanged,
      );
    },
  );

  testWidgets(
    'on surface variant color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(onSurfaceVariant: color),
        'basicThemeEditor_onSurfaceVariantColorPicker',
        cubit.onSurfaceVariantColorChanged,
      );
    },
  );

  testWidgets(
    'outline color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(outline: color),
        'basicThemeEditor_outlineColorPicker',
        cubit.outlineColorChanged,
      );
    },
  );

  testWidgets(
    'shadow color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(shadow: color),
        'basicThemeEditor_shadowColorPicker',
        cubit.shadowColorChanged,
      );
    },
  );

  testWidgets(
    'inverse surface color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(inverseSurface: color),
        'basicThemeEditor_inverseSurfaceColorPicker',
        cubit.inverseSurfaceColorChanged,
      );
    },
  );

  testWidgets(
    'on inverse surface color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(onInverseSurface: color),
        'basicThemeEditor_onInverseSurfaceColorPicker',
        cubit.onInverseSurfaceColorChanged,
      );
    },
  );

  testWidgets(
    'inverse primary color picker should update with selected color',
    (tester) async {
      await _verifyColorPicker(
        tester,
        colorScheme.copyWith(inversePrimary: color),
        'basicThemeEditor_inversePrimaryColorPicker',
        cubit.inversePrimaryColorChanged,
      );
    },
  );
}
